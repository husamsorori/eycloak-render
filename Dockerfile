FROM quay.io/keycloak/keycloak:26.0.6

ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin
ENV KC_HOSTNAME_STRICT=false
ENV PORT=8080

# Build Keycloak
RUN /opt/keycloak/bin/kc.sh build

# Expose port 8080
EXPOSE 8080

# Start Keycloak on 0.0.0.0 and dynamic port from Render
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev", "--http-host=0.0.0.0", "--http-port=${PORT}"]
