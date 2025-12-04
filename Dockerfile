FROM quay.io/keycloak/keycloak:26.0.6

# المتغيرات الصحيحة لإنشاء الـ admin من خارج localhost
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin@123

# المنفذ الذي سيقرأه Render
ENV PORT=8080

# بناء Keycloak
RUN /opt/keycloak/bin/kc.sh build

# تشغيل Keycloak على المنفذ الذي يطلبه Render
ENTRYPOINT ["/bin/sh", "-c", "/opt/keycloak/bin/kc.sh start-dev --http-host=0.0.0.0 --http-port=$PORT --hostname-strict=false --hostname-strict-https=false"]
