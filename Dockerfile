# Use uma imagem base do uv com uma versão específica do Python
FROM ghcr.io/astral-sh/uv:python3.12-alpine

# Defina variáveis de ambiente para instalação não interativa
ENV DEBIAN_FRONTEND=noninteractive

# Instale o OpenJDK (ex: OpenJDK 17)
# O Jenkins requer um JRE; o JDK é frequentemente usado para ferramentas de build
RUN apk update && \
    apk add --no-cache openjdk17-jdk ca-certificates

# Configure JAVA_HOME e adicione ao PATH
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH="${JAVA_HOME}/bin:${PATH}"

# Instale o Git
RUN apk add --no-cache git

# Crie um usuário e grupo para o agente Jenkins
ARG USER_ID=1000
ARG GROUP_ID=1000
ARG USERNAME=jenkins
RUN addgroup -g ${GROUP_ID} ${USERNAME} && \
    adduser -D -u ${USER_ID} -G ${USERNAME} -s /bin/sh ${USERNAME}

# Defina o diretório de trabalho e o usuário
WORKDIR /home/${USERNAME}
USER ${USERNAME}

# Comando padrão (pode ser sobrescrito pelo Jenkins ao iniciar o contêiner)
# Este comando apenas verifica se Java e uv estão instalados e acessíveis
CMD ["sh", "-c", "java -version && uv --version"]