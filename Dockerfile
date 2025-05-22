FROM openjdk:17-slim

RUN apt update -y \
    && apt upgrade -y \
    && apt install -y zip curl unzip gnupg2 ca-certificates

RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - \
    && apt install -y nodejs

RUN curl -L https://github.com/liferay/liferay-blade-cli/archive/refs/tags/5.0.0.zip -o blade.zip \
    && unzip blade.zip -d /opt/blade \
    && ln -s /opt/blade/blade /usr/local/bin/blade \
    && rm blade.zip

RUN curl -s "https://get.sdkman.io" | bash \
    && bash -c "source /root/.sdkman/bin/sdkman-init.sh && sdk install gradle 8.8"

ENV PATH="/root/.sdkman/candidates/gradle/8.8/bin:${PATH}"

CMD ["bash"]

