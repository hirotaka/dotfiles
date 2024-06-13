#!/bin/bash

# Customize the following:
# - escaped_path: absolute local path to your project
# - container: name of your docker container
escaped_path="\/Users\/hirotaka\/Workspaces\/github.com\/GuildWorks\/eyan\/" # Be careful to properly escape this
container="web"

# WARN: This will break if flags other than -o and -f are added in neotest-rspec
while getopts o:f: flag; do
	# This deliberately does not handle all arguments
	# shellcheck disable=SC2220
	# shellcheck disable=SC2213
	case "${flag}" in
	o) output_path=${OPTARG} ;;
	esac
done

# Strip local path from test paths sent to container
args=("${@/$escaped_path/}")

# Run the tests
docker compose exec "$container" bundle exec rspec "${args[@]}"

# Copy the test output from the container to the host
docker compose cp "$container:$output_path" "$output_path"
