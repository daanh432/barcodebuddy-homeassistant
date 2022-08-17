ARG BUILD_FROM
FROM ${BUILD_FROM}

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="Barcode Buddy for Grocy" \
    io.hass.description="Barcode system for Grocy" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} 

RUN apk add --no-cache unison

RUN echo "* * * * * /usr/bin/unison -batch -auto -silent /data/config /config >/dev/null 2>&1" >> /etc/crontabs/root

COPY run.sh /
RUN chmod a+x /run.sh

ENTRYPOINT [ "/run.sh" ]
