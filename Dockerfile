FROM quay.io/keycloak/keycloak:26.0.6

# متغيرات إلزامية
ENV KC_ADMIN=admin
ENV KC_ADMIN_PASSWORD=Admin@Secure123
ENV KC_HOSTNAME=eycloak-render.onrender.com
ENV KC_PROXY=edge

# إعدادات اختيارية لكن مهمة
ENV KC_HOSTNAME_STRICT=false
ENV KC_HOSTNAME_STRICT_HTTPS=false
ENV KC_HTTP_ENABLED=true

# Build مع تكوين مثالي
RUN /opt/keycloak/bin/kc.sh build --db=h2-file

EXPOSE 8080

# تشغيل في وضع الإنتاج
CMD ["/bin/sh", "-c", "/opt/keycloak/bin/kc.sh start --optimized --http-port=${PORT:-8080}"]