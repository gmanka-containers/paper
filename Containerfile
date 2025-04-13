ARG TARGETARCH
FROM quay.io/fedora/fedora-minimal AS base-amd64
FROM quay.io/fedora/fedora-minimal AS base-arm64
FROM docker.io/fedorariscv/base AS base-riscv64
FROM base-${TARGETARCH}
EXPOSE 25565/tcp 25565/udp
ENV JDK_JAVA_OPTIONS="-Xmx8g"
RUN dnf install -y java-latest-openjdk-headless jq
RUN dnf clean all
RUN mkdir -p /app/data
RUN export url=$(curl -s https://qing762.is-a.dev/api/papermc/latest | jq -r '.url') && curl $url -Lo /app/paper.jar
RUN useradd -m user
RUN chown -hR user /app/data
USER user
VOLUME /app/data
WORKDIR /app/data
RUN echo eula=true > eula.txt
CMD ["java", "-jar", "/app/paper.jar"]

