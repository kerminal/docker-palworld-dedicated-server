# Navigate to the specified directory
Write-Host "Navigating to C:\PalScape"
cd 'C:\PalScape'

$discordWebhookUrl = "webhook_here"

# Function to send RCON broadcast messages
function Send-RconBroadcast {
    param (
        [string]$Message
    )
    docker exec palscape rconcli "broadcast $Message"
    Write-Host "Broadcasted: $Message"
}

function Send-DiscordWebhook {
    param (
        [string]$WebhookUrl,
        [string]$Message
    )
    $body = @{
        content = $Message
    }
    Invoke-RestMethod -Uri $WebhookUrl -Method Post -Body ($body | ConvertTo-Json) -ContentType 'application/json'
    Write-Host "Sent to Discord: $Message"
}

# Send a broadcast message for server restart in 10 minutes
Send-RconBroadcast "Server_restart_in_10_minutes!"
Start-Sleep -Seconds 300 # Wait for 5 minutes

# Send a broadcast message for server restart in 5 minutes
Send-RconBroadcast "Server_restart_in_5_minutes!"
Send-DiscordWebhook -WebhookUrl $discordWebhookUrl -Message "Server restart in 5 minutes!"
Start-Sleep -Seconds 180 # Wait for 3 minutes

# Send a broadcast message for server restart in 2 minutes
Send-RconBroadcast "Server_restart_in_2_minutes!"
Send-DiscordWebhook -WebhookUrl $discordWebhookUrl -Message "Server restart is very soon, please wait to connect until after the restart!"
Start-Sleep -Seconds 60 # Wait for 1 minute

# Send a final broadcast message
Send-RconBroadcast "Server_is_restarting_now!"

# Ensure the commands have time to be processed by the server
Start-Sleep -Seconds 10

# Stop and remove containers, networks, and images created by `up`
Write-Host "Running docker-compose down --rmi all"
docker-compose down --rmi all | Out-Host

# Start up the containers in detached mode
Write-Host "Running docker-compose up -d"
docker-compose up -d | Out-Host

# Wait for the container to start
Write-Host "Waiting for the container to start..."
Start-Sleep -Seconds 45

# Check if the container is running
$containerStatus = docker ps -f "name=palscape" --format "{{.Status}}"
if ($containerStatus -like "*Up*") {
    Write-Host "Container is running."
    Send-DiscordWebhook -WebhookUrl $discordWebhookUrl -Message "Server restart completed successfully."
} else {
    Write-Host "Container failed to start."
    Send-DiscordWebhook -WebhookUrl $discordWebhookUrl -Message "Server restart failed. Critial error, Palscape failed to start. Alerting <@92032671500230656> immediately."
}