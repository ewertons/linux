#!/bin/bash

set -e

function convert-flac-to-mp3
{
	flac_file="$1"
	mp3_file="${flac_file%.*}.mp3"
	
	ffmpeg -i "$flac_file" -ab 320k -map_metadata 0 -id3v2_version 3 "$mp3_file"
}

function convert-m4a-to-mp3
{
	m4a_file="$1"
	mp3_file="${m4a_file%.*}.mp3"
	
	ffmpeg -i "$m4a_file" -c:a libmp3lame -q:a 2 "$mp3_file"
}

function convert-webm-to-mp3
{
    input_file="$1"
    output_file="${input_file%.*}.mp3"

    ffmpeg -i "$input_file" -vn -ab 128k -ar 44100 -y "$output_file"
}

function convert-mkv-to-mp4
{
    input_file="$1"
    output_file="${input_file%.*}.mp4"

    ffmpeg -i "$input_file" -acodec copy -vcodec copy "$output_file"
}

function convert-mp4-to-mov
{
    input_file="$1"
    output_file="${input_file%.*}.mov"

    ffmpeg -i "$input_file" -f mov "$output_file"
}

declare -F | awk '{print $3}'

