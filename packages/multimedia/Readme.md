# Multimedia

Jellyfin media server with additional support services.
Edit the `.env` file before use.

Once you've run `docker-compose up -d` you can visit `dashboard.localhost/`

## Manual configuration
After starting the services there's a bit of manual configuration needed. I hope to automate this in the future.

1. Go to `dashboard.localhost` and click on `sonarr`.

2. Go to `Settings` -> `Download Client` and click the `+` button under `Download Clients`.

3. Select Transmission, give it a name and set the host to `transmission.multimedia_default`, also set the correct username and password.

4. Hit the `test`-button to see that everything worked and then save

5. Now go to `System` and hit the `Restart`-button (the button is an icon up in the right corner). After restarting the error about no download client should go away.

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