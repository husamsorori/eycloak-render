FROM quay.io/keycloak/keycloak:26.0.6

ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# نجعل Keycloak يعمل على 0.0.0.0
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev", "--http-enabled=true", "--hostname-strict=false", "--hostname=0.0.0.0"]
