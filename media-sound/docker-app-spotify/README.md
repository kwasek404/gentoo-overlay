```bash
xhost local:root
docker run -ti -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:ro -v $XDG_RUNTIME_DIR/pulse:/run/pulse:ro --device /dev/dri --entrypoint /bin/bash docker-app-spotify
```
