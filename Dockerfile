# Základný obraz z Docker Hub
# Fungujúca inštalácia Alpine Linux s nainštalovaným interpreterom Python
# Výhodou je malá veľkosť
FROM python:3.8-alpine

# Nastavenie pracovného adresára kontajnera
WORKDIR /app

# Inštalácia  závislostí aplikácie
RUN pip install flask
RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev
RUN pip install psycopg2


# Kopírovanie aplikácie súborov do obrazu
COPY . /app

# Nastavenie premennej prostredia
ENV FLASK_APP app.py
ENV FLASK_ENV development

# Program na spustenie
ENTRYPOINT [ "flask" ]

# Workdir
WORKDIR /app

# Argumenty 
CMD ["run", "--host", "0.0.0.0"]