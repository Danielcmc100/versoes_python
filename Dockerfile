# Use uma imagem base do uv com uma versão específica do Python
FROM python:3.13-slim-bookworm

# Defina variáveis de ambiente para instalação não interativa
ENV DEBIAN_FRONTEND=noninteractive

# Instale o OpenJDK (ex: OpenJDK 17)
# O Jenkins requer um JRE; o JDK é frequentemente usado para ferramentas de build
RUN apt-get update && \
    apt-get install -y --no-install-recommends openjdk-17-jdk ca-certificates && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Configure JAVA_HOME e adicione ao PATH
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH="${JAVA_HOME}/bin:${PATH}"

# Instale o Git
RUN apt-get update && apt-get install -y --no-install-recommends git && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install --no-install-recommends -y \
        xvfb \
        wine \
        gnome-screenshot \
        xdotool \
        x11-xserver-utils && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Crie um usuário e grupo para o agente Jenkins
ARG USER_ID=1000
ARG GROUP_ID=1000
ARG USERNAME=jenkins
RUN groupadd --gid ${GROUP_ID} ${USERNAME} && \
    useradd --uid ${USER_ID} --gid ${GROUP_ID} --shell /bin/sh --create-home ${USERNAME}

# Defina o diretório de trabalho e o usuário
WORKDIR /home/${USERNAME}
USER ${USERNAME}

# Comando padrão (pode ser sobrescrito pelo Jenkins ao iniciar o contêiner)
# Este comando apenas verifica se Java e uv estão instalados e acessíveis
CMD ["sh", "-c", "java -version && uv --version"]