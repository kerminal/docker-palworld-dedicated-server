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

### Using the PowerShell Script for Scheduled Tasks

1. Download the `ServerRestart.ps1` script from the repository.
2. Open the script and replace `"webhook_here"` in the `$discordWebhookUrl` variable with your actual Discord webhook URL.
3. Ensure Docker and Docker Compose are installed and configured on your system.
4. Schedule the script to run at your preferred intervals using Windows Task Scheduler for automated server restarts and management.

For more details, refer to the script comments and the documentation in the script file.