FROM python:3.11-slim

# Abhängigkeiten installieren
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Archipelago klonen
WORKDIR /app
RUN git clone https://github.com .

# Module installieren
RUN python3 ModuleUpdate.py --yes

# Port für den MultiServer
EXPOSE 38281

# Start-Befehl (die .archipelago Datei muss im Container vorhanden sein)
ENTRYPOINT ["python3", "MultiServer.py"]
