#!/bin/sh

set -e

backup_github() {
    fetch_repositories() {
        local username="$1"
        local repositories=$(gh repo list $username --json name --limit 100)
        echo "$repositories"
    }

    clone_repository() {
        local username="$1"
        local repo="$2"
        echo "Cloning $username/$repo..."
        if ! gh repo clone "$username/$repo"; then
            echo "Error: Failed to clone $username/$repo"
            exit 1
        fi
    }

    local username="$1"
    local repositories=$(fetch_repositories "$username")

    mkdir -pv ./$username
    cd ./$username

    if [ -n "$repositories" ]; then
        for repo in $(echo "$repositories" | jq -r '.[] | .name'); do
            clone_repository "$username" "$repo" &
        done
        wait
    else
        echo "Failed to fetch repositories for user $username"
    fi

    cd ..
}

repo_folder=repositories
mkdir -pv $repo_folder
cd $repo_folder

backup_github Til7701
backup_github schlunzis

cd ..

archive_filename="git_backup_$(date +'%Y%m%d').tar.gz"
echo "Archiving cloned repositories to $archive_filename..."
tar -czvf "$archive_filename" $repo_folder
echo "Cloned repositories archived successfully as $archive_filename"

echo "Cleaning up cloned repositories..."
rm -rf $repo_folder
echo "Cloned repositories cleaned up"
