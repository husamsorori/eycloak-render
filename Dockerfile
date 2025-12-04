FROM quay.io/keycloak/keycloak:25.0.6

# تعيين اسم المستخدم وكلمة المرور للمدير
ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin
ENV KC_BOOTSTRAP_ADMIN_PASSWORD=admin@123

# حل مشكلة عدم قراءة Render للمنفذ
ENV PORT=8080

# Build Keycloak server
RUN /opt/keycloak/bin/kc.sh build

# تشغيل Keycloak باستخدام المنفذ الصحيح
ENTRYPOINT ["/bin/sh", "-c", "/opt/keycloak/bin/kc.sh start-dev --http-host=0.0.0.0 --http-port=${PORT} --hostname-strict=false"]
