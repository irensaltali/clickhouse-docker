 FROM ubuntu:bionic-20220315
LABEL maintainer="İren SALTALI <iren@saltali.com>"

ENV WIREMOCK_VERSION 2.27.2

WORKDIR /
RUN apt-get update && apt-get install wget curl -y
# # RUN wget -q -O - https://repo.yandex.ru/clickhouse/CLICKHOUSE-KEY.GPG | apt-key add -
# RUN grep -q sse4_2 /proc/cpuinfo && echo "SSE 4.2 supported" || echo "SSE 4.2 not supported"
# RUN apt-get install -y apt-transport-https ca-certificates dirmngr
# RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 8919F6BD2B48D754
# RUN echo "deb https://packages.clickhouse.com/deb stable main" | tee \
#     /etc/apt/sources.list.d/clickhouse.list
# RUN apt-get update && apt-get install -y clickhouse-server
RUN curl -O 'https://builds.clickhouse.com/master/aarch64/clickhouse' && chmod a+x clickhouse
RUN ./clickhouse install

    
CMD service clickhouse-server start