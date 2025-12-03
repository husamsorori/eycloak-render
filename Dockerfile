FROM quay.io/keycloak/keycloak:26.0.6

# تعيين اسم المستخدم وكلمة المرور للمدير
ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin
ENV KC_BOOTSTRAP_ADMIN_PASSWORD=admin

# Build Keycloak server
RUN /opt/keycloak/bin/kc.sh build

# بدء Keycloak مع الالتقاط التلقائي للمنفذ من Render
# Render يحدد المتغير PORT تلقائيًا
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev", "--http-host=0.0.0.0", "--http-port=${PORT}", "--hostname-strict=false"]
