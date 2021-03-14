# Use the jrottenberg/ffmpeg:3.2-alpine
FROM alpine:latest
RUN apk update
RUN apk add --no-cache ffmpeg
RUN apk add --no-cache bash
RUN apk add --no-cache tzdata
VOLUME [/timelapse]
WORKDIR /timelapse
VOLUME [/timelapse/movies]
VOLUME [/timelapse/snapshots]
COPY create_movie.sh /timelapse/
COPY grab_frames.sh /timelapse/
COPY entry.sh /timelapse/
ENTRYPOINT ["/bin/bash","/timelapse/entry.sh"]
