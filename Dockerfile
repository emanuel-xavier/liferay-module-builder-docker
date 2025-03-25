FROM openjdk:22

RUN microdnf update -y \
    && microdnf install -y zip curl nodejs findutils \
    && microdnf clean all \
    && curl -s https://get.sdkman.io | bash \
    && echo "source /root/.sdkman/bin/sdkman-init.sh" >> /root/.bashrc \
    && /bin/bash -c "source /root/.sdkman/bin/sdkman-init.sh && sdk install gradle 8.8"

CMD ["bash"]
