# use Alpine as base
FROM alpine:3.11

# Maintainer
Maintainer "Marc Kurz"

# Label Alerting
LABEL alert="marc.kurz@fh-hagenberg.at"

# Install python and pip
RUN apk add --update py2-pip

# Upgrade pip
RUN pip install --upgrade pip

# Install Python modules needed by the app
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

# Copy files required for the app to RUN
COPY app.py /usr/src/app/
COPY templates/index.html /usr/src/app/templates/

#Expose the app on Flask default
EXPOSE 5001

# Run the application
CMD ["python", "/usr/src/app/app.py"]

ENTRYPOINT ["python", "/usr/src/app/app.py"]
