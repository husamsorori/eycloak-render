FROM quay.io/keycloak/keycloak:26.0.6

# تعيين اسم المستخدم وكلمة المرور للمدير
ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin
ENV KC_BOOTSTRAP_ADMIN_PASSWORD=admin@123

# Build Keycloak server
RUN /opt/keycloak/bin/kc.sh build

# بدء Keycloak مع الالتقاط التلقائي للمنفذ من Render
# Render يحدد المتغير PORT تلقائيًا
ENTRYPOINT ["/bin/sh", "-c", "/opt/keycloak/bin/kc.sh start-dev --http-host=0.0.0.0 --http-port=${PORT} --hostname-strict=false"]
