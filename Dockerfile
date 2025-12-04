FROM quay.io/keycloak/keycloak:25.0.6

ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin@123

RUN /opt/keycloak/bin/kc.sh build

ENTRYPOINT ["/bin/sh", "-c", "/opt/keycloak/bin/kc.sh start-dev --http-host=0.0.0.0 --http-port=${PORT} --hostname-strict=false"]
