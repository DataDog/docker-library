FROM python:2.7.14-alpine3.6

COPY supervisord.conf /
COPY program_0.sh /
COPY program_1.sh /
COPY program_2.sh /

RUN pip install --no-cache-dir supervisor==3.3.3 &&chmod a+x /program_*.sh && mkdir supervisor

EXPOSE 19001

ENTRYPOINT ["supervisord"]
CMD ["-c", "/supervisord.conf"]
