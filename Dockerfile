FROM openjdk:11

RUN apt update -y \
      && apt upgrade -y \
      && apt install -y zip curl

RUN curl -L https://raw.githubusercontent.com/liferay/liferay-blade-cli/master/cli/installers/local | sh \
      && curl -s https://get.sdkman.io | bash \
      && curl -sL https://deb.nodesource.com/setup_18.x | bash - \
      && apt install nodejs \
      && ln -s /root/jpm/bin/blade /usr/bin \
      && /bin/bash -c "source /root/.sdkman/bin/sdkman-init.sh && sdk install gradle 7.3.3"

ENTRYPOINT ["/bin/bash", "-c", "source /root/.sdkman/bin/sdkman-init.sh && exec \"$@\"", "--"]
CMD ["bash"]

