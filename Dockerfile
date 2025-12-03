FROM quay.io/keycloak/keycloak:26.0.6
RUN /opt/keycloak/bin/kc.sh build
CMD ["/opt/keycloak/bin/kc.sh", "start-dev", "--http-port=8080"]