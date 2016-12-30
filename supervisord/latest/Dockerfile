FROM python:2.7.13

COPY supervisord.conf /
COPY program_0.sh /
COPY program_1.sh /
COPY program_2.sh /

RUN pip install supervisor &&chmod a+x /program_*.sh && mkdir supervisor

ENTRYPOINT ["supervisord"]
CMD ["-c", "/supervisord.conf"]
