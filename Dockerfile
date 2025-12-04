FROM quay.io/keycloak/keycloak:26.0.6

# تعيين اسم المستخدم وكلمة المرور للمدير
ENV KC_ADMIN=admin
ENV KC_ADMIN_PASSWORD=admin@123

# حل مشكلة عدم قراءة Render للمنفذ
ENV PORT=8080

# Build Keycloak server
RUN /opt/keycloak/bin/kc.sh build

# تشغيل Keycloak مباشرة بدون تغيير المنفذ أو الهستون
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev", "--http-host=0.0.0.0", "--http-port=8080", "--hostname-strict=false"]
