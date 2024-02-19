# Home lab / home automation

A bunch of scripts for setting up and running my Raspberry PI's

## First time setup

- Run `./setup`

- `docker compose up -d`

It's useful to run `docker compose config` to double check that the config is correct (with env variables)

Some stuff is in its own profile, to start it run ex. `docker compose --profile comic up -d`
