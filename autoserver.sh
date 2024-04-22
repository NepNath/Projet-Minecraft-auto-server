#!/bin/bash

function read_version() {
    local valid_url=0
    while [[ $valid_url -eq 0 ]]; do
        printf "Quelle version de Minecraft voulez-vous télécharger ? (ex : 1.8.9): "
        read -r version
        url="https://download.getbukkit.org/spigot/spigot-${version}.jar"

        if ! status=$(curl -o /dev/null --silent --head --write-out '%{http_code}\n' "$url"); then
            printf "Erreur lors de la vérification de l'URL.\n" >&2
            continue
        fi

        if [[ $status -ne 200 ]]; then
            printf "Version non trouvée. Essayez une autre version.\n" >&2
        else
            valid_url=1
        fi
    done
}

function read_ram() {
    local valid_ram=0
    while [[ $valid_ram -eq 0 ]]; do
        printf "Quelle quantité de RAM souhaitez-vous allouer au serveur (en Go, maximum 6 Go) ? "
        read -r ram

        if [[ "$ram" -lt 1 || "$ram" -gt 6 ]]; then
            printf "La quantité de RAM doit être comprise entre 1 et 6 Go.\n" >&2
        else
            valid_ram=1
        fi
    done
}

function create_server_directory() {
    printf "Quel est le nom de votre serveur ? "
    read -r server_name

    mkdir -p "$server_name" && cd "$server_name" || return 1
}

function download_minecraft_server() {
    printf "Téléchargement de Minecraft Server version %s...\n" "$version"
    curl -o server.jar "$url" || return 1
    create_start_script
    agree_to_eula
}

function create_start_script() {
    cat > start_server.sh <<EOF
#!/bin/bash
java -Xmx${ram}G -Xms${ram}G -jar server.jar nogui
EOF
    chmod +x start_server.sh
}

function agree_to_eula() {
    echo "eula=true" > eula.txt
}

function launch_server() {
    printf "Démarrage du serveur...\n"
    ./start_server.sh
}

function get_public_ip() {
    curl -s http://ipecho.net/plain
}

function display_server_info() {
    local ip_private ip_public port
    ip_private=$(hostname -I | awk '{print $1}')
    ip_public=$(get_public_ip)
    port=25565  # Port par défaut pour Minecraft

    printf "Configuration du serveur Minecraft réussie et démarrée.\n"
    printf "IP privée du serveur: %s\n" "$ip_private"
    printf "IP publique du serveur: %s\n" "$ip_public"
    printf "Port du serveur: %s\n" "$port"
    printf "Nom du serveur: %s\n" "$server_name"
    printf "Version du jeu: %s\n" "$version"
}

function main() {
    read_version
    read_ram
    create_server_directory
    download_minecraft_server
    launch_server
    display_server_info
}

main