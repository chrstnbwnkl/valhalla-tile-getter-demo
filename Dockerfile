FROM ghcr.io/valhalla/valhalla:latest 

COPY ./scripts/run.sh /valhalla/scripts/run.sh
WORKDIR /data
EXPOSE 8002
ENTRYPOINT ["/valhalla/scripts/run.sh"]
CMD ["service"]