# Multimedia

Jellyfin media server with additional support services.
Edit the `.env` file before use.

Once you've run `docker-compose up -d` you can visit `dashboard.localhost/`

## TODO

- Add bazarr for automatic subtitle downloads (https://github.com/linuxserver/docker-bazarr)

- Investigate Radarr (https://radarr.video/)

- Find some kind of solution for downloading youtube videoes into Jellyfin, aka some kind of web-gui for youtube-dl

  - https://github.com/d0u9/youtube-dl-webui

  - https://github.com/Rudloff/alltube

- Fix the docker setup so that sonarr automatically gets configured to use transmission instead of having to do it manually

- Create a script that listens to Jackett's api and updates Sonarr when I add new sources in Jackett

- Some solution for manga / comics and ebooks?

  - https://github.com/mylar3/mylar3

	- https://github.com/tingtom/Readarr

	- https://hub.docker.com/r/linuxserver/calibre-web
