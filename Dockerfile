FROM quay.io/keycloak/keycloak:26.0.6

# تعيين بيانات المدير
ENV KC_ADMIN=admin
ENV KC_ADMIN_PASSWORD=admin123

# بناء Keycloak
RUN /opt/keycloak/bin/kc.sh build --db=dev-file

# المنفذ
EXPOSE 8080

# أمر التشغيل
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev", "--http-port=8080", "--hostname-strict=false"]