FROM alpine:3.19.1

MAINTAINER Lucas Martin-King

RUN apk add --no-cache gcompat

COPY l64.zip /
RUN mkdir q \
    && cd q \
    && unzip /l64.zip \
    && rm /l64.zip \
    && chmod +x /q/l64/q

COPY entrypoint.sh /entrypoint.sh

ENV QHOME=/q
ENV QLIC=/q

EXPOSE 5000

ENTRYPOINT ["/entrypoint.sh"]
CMD ["q", "-p", "0.0.0.0:5000"]
