#!/bin/bash
# Apple Music Aliases- @humbertowoody
# Creates aliases for Apple Music commands.

# Function for playing music
function music-play() 
{
    osascript -e 'tell application "Music" to play';
}

# Function for pausing music
function music-pause() 
{
    osascript -e 'tell application "Music" to pause';
}

# Function for skipping to the next track
function music-next() 
{
    osascript -e 'tell application "Music" to next track';
}

# Function for skipping to the previous track 
function music-prev() 
{
    osascript -e 'tell application "Music" to previous track';
}

# Function for setting the volume 
function music-volume() 
{
    osascript -e 'tell application "Music" to set volume output volume $1';
}


# Function for searching and playing a music-play-track
function music-play-track() 
{
    osascript -e 'tell application "Music" to play (every track of (search library playlist 1 for "$1") whose index is 1)';
}

# Function for searching and playing an music-play-album
function music-play-album() 
{
    osascript -e 'tell application "Music" to play (every track of (get album "$1" of library playlists) whose index is 1)';
}

# Function for searching and playing a music-play-playlist
function music-play-playlist() 
{
    osascript -e 'tell application "Music" to play playlist "$1"';
}

# Function for getting information about the currently playing track
function music-now-playing() {
    # Get the current track properties
    track_name=$(osascript -e 'tell application "Music" to get name of current track as string' 2>/dev/null || echo "(not present)");
    artist_name=$(osascript -e 'tell application "Music" to get artist of current track as string' 2>/dev/null || echo "(not present)");
    album_name=$(osascript -e 'tell application "Music" to get album of current track as string' 2>/dev/null || echo "(not present)");
    track_number=$(osascript -e 'tell application "Music" to get track number of current track as integer' 2>/dev/null || echo "(not present)");
    disc_number=$(osascript -e 'tell application "Music" to get disc number of current track as integer' 2>/dev/null || echo "(not present)");
    duration_seconds=$(osascript -e 'tell application "Music" to get duration of current track as integer' 2>/dev/null || echo "(not present)");
    play_count=$(osascript -e 'tell application "Music" to get played count of current track as integer' 2>/dev/null || echo "(not present)");
    rating=$(osascript -e 'tell application "Music" to get rating of current track as integer' 2>/dev/null || echo "(not present)");
    loved=$(osascript -e 'tell application "Music" to get loved of current track as boolean' 2>/dev/null || echo "(not present)");
    genre=$(osascript -e 'tell application "Music" to get genre of current track as string' 2>/dev/null || echo "(not present)");
    year=$(osascript -e 'tell application "Music" to get year of current track as integer' 2>/dev/null || echo "(not present)");
    art_file=$(osascript -e 'tell application "Music" to get location of artwork 1 of current track as string' 2>/dev/null || echo "(not present)")

    # Format the duration as minutes:seconds
    if [[ -n "$duration_seconds" ]]; then
        duration_min=$(( duration_seconds / 60 ))
        duration_sec=$(( duration_seconds % 60 ))
        duration=$(printf "%d:%02d" $duration_min $duration_sec)
    else
        duration="(not present)"
    fi

    # Print the current track information
    printf "Now playing:\n"
    printf "  %-15s %s\n" "Name:" "$track_name"
    printf "  %-15s %s\n" "Artist:" "$artist_name"
    printf "  %-15s %s\n" "Album:" "$album_name"
    printf "  %-15s %s\n" "Track number:" "$track_number"
    printf "  %-15s %s\n" "Disc number:" "$disc_number"
    printf "  %-15s %s\n" "Duration:" "$duration"
    printf "  %-15s %s\n" "Play count:" "$play_count"
    printf "  %-15s %s\n" "Rating:" "$rating"
    printf "  %-15s %s\n" "Loved:" "$( [[ $loved == true ]] && echo "yes" || echo "no" )"
    printf "  %-15s %s\n" "Genre:" "$genre"
    printf "  %-15s %s\n" "Year:" "$year"
    printf "  %-15s %s\n" "Artwork file:" "$art_file"
}

# Helper function to test which track properties are available
# This is useful for debugging
function music-now-playing-test() {
    # Define the track properties to test
    properties=(
        "name"
        "artist"
        "album"
        "track number"
        "disc number"
        "duration"
        "play count"
        "rating"
        "loved"
        "genre"
        "year"
        "artwork location"
    )

    # Test each track property and output the results
    printf "Music track properties:\n\n"
    for prop in "${properties[@]}"; do
        # Get the value of the property
        prop_value=$(osascript -e "tell application \"Music\" to get ${prop} of current track" 2>/dev/null)

        # Print the property name and whether it was available
        if [[ -n "$prop_value" ]]; then
            printf "%-16s%s\n" "${prop}:" "available"
        else
            printf "%-16s%s\n" "${prop}:" "not available"
        fi
    done

    printf "\n"
}

# Function that prints all aliases with examples
function music-help() 
{
    echo "music-play: Play music"
    echo "music-pause: Pause music"
    echo "music-next: Skip to the next track"
    echo "music-prev: Skip to the previous track"
    echo "music-volume: Set the volume"
    echo "music-play-track: Search and play a track"
    echo "music-play-album: Search and play an album"
    echo "music-play-playlist: Search and play a playlist"
    echo "music-now-playing: Get information about the currently playing track"
}

