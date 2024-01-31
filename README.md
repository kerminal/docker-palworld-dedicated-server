# Docker - Palscape Dedicated Server

This repository hosts the Docker configuration for the Palscape Dedicated Server, a fork and continuation of the Palworld dedicated server project, curated for Palscape.net by Kerminal.net. This setup is tailored to provide a robust and automated environment for running a Palworld server using Docker.

## Original Project

This project is based on the original Palworld dedicated server Docker implementation by Jammsen. For more information and the base configuration, visit the [original repository](https://github.com/jammsen/docker-palworld-dedicated-server).

## Software Stack

The Docker setup utilizes the following software components:

- **CM2Network SteamCMD**: Debian-based Docker image, officially recommended by Valve. [SteamCMD Info](https://developer.valvesoftware.com/wiki/SteamCMD#Docker)
- **Supercronic**: A cron job scheduler. [Supercronic GitHub](https://github.com/aptible/supercronic)
- **rcon-cli**: A command-line interface to manage game servers via RCON. [rcon-cli GitHub](https://github.com/gorcon/rcon-cli)
- **Palworld Dedicated Server**: Steam Application ID 2394010. [SteamDB Info](https://steamdb.info/app/2394010/config/)

## Automated Server Management with PowerShell

To automate server management tasks, such as scheduled restarts and maintenance, a PowerShell script is utilized. This script interfaces with the Docker environment to control the game server and communicates updates via Discord webhooks.

## Automated Server Management with PowerShell

To automate server management tasks, I use a PowerShell script (`ServerRestart.ps1`) in the repository. This script interfaces with the Docker environment to control the game server and communicates updates via Discord webhooks & rconcli.

### Im seeing S_API errors in my logs when I start the container?
Errors like `[S_API FAIL] Tried to access Steam interface SteamUser021 before SteamAPI_Init succeeded.` are safe to ignore.

### Im using Apple silicon type of hardware, can I run this?
You can try to insert in your docker-compose file this parameter `platform: linux/amd64` at the palworld service. This isnt a special fix for Apple silicon, but to run on other than x86 hosts. The support for arm exists only by enforcing x86 emulation, if that isnt to host already. Rosetta is doing the translation/emulation.

### I have changed the `BaseCampWorkerMaxNum` settings, why are changes un-affected on the server?

It is a confirm bug, that changing `BaseCampWorkerMaxNum` in the `PalWorldSettings.ini` has no affect on the server. There are tools out there to help with this, like this one: <https://github.com/legoduded/palworld-worldoption>

**PLEASE NOTE** that adding `WorldOption.sav` will breaking `PalWorldSetting.ini` and if that happens all the other settings won't be changeable anymore unless that specific tool is used everytime.

## Planned features in the future

- Feel free to suggest something

## Software used

- CM2Network SteamCMD - Debian-based (Officially recommended by Valve - https://developer.valvesoftware.com/wiki/SteamCMD#Docker)
- Supercronic - https://github.com/aptible/supercronic
- rcon-cli - https://github.com/gorcon/rcon-cli
- Palworld Dedicated Server (APP-ID: 2394010 - https://steamdb.info/app/2394010/config/)
