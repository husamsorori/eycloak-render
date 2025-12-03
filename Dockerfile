FROM quay.io/keycloak/keycloak:26.0.6

ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin
ENV KC_HOSTNAME_STRICT=false

RUN /opt/keycloak/bin/kc.sh build

EXPOSE 8080

CMD ["sh", "-c", "/opt/keycloak/bin/kc.sh start-dev --http-host=0.0.0.0 --http-port=${PORT:-8080}"]