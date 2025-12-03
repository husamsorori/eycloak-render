FROM quay.io/keycloak/keycloak:26.0.6

ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Build the server
RUN /opt/keycloak/bin/kc.sh build

# Expose port 8080
EXPOSE 8080

# Start Keycloak on 0.0.0.0
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev", "--http-host=0.0.0.0", "--http-port=8080"]
