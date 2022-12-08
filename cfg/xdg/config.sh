#!/bin/bash

#xdg-user-dirs-update --set DESKTOP $wrk

export     XDG_CONFIG_HOME="$var/xdg/config"
export     XDG_RUNTIME_DIR="$var/xdg/runtime"
export       XDG_DATA_HOME="$var/xdg/data"
export      XDG_CACHE_HOME="$var/xdg/cache"
export     XDG_DESKTOP_DIR="$var/wrk" #/desktop/"
export    XDG_DOWNLOAD_DIR="$wrk" #/desktop/"
export   XDG_DOCUMENTS_DIR="$wrk" #/documents/"
export   XDG_TEMPLATES_DIR="$wrk" #/documents/"
export XDG_PUBLICSHARE_DIR="$wrk" #/documents/"
export    XDG_PICTURES_DIR="$wrk" #/pictures/"
export       XDG_MUSIC_DIR="$wrk" #/music/"
export      XDG_VIDEOS_DIR="$wrk" #/videos/"
export       XDG_DATA_DIRS="$var/xdg/data:/usr/local/share:/usr/share"

mkdir -p "$XDG_CONFIG_HOME"
mkdir -p "$XDG_RUNTIME_DIR"
mkdir -p "$XDG_DATA_HOME"
mkdir -p "$XDG_CACHE_HOME"
#mkdir -p "$XDG_DESKTOP_DIR"
#mkdir -p "$XDG_DOWNLOAD_DIR"
#mkdir -p "$XDG_DOCUMENTS_DIR"
#mkdir -p "$XDG_TEMPLATES_DIR"
#mkdir -p "$XDG_PUBLICSHARE_DIR"
#mkdir -p "$XDG_PICTURES_DIR"
#mkdir -p "$XDG_MUSIC_DIR"
#mkdir -p "$XDG_VIDEOS_DIR"
#mkdir -p $XDG_DATA_DIRS # makes no sense

[ -L "$XDG_CONFIG_HOME/user-dirs.dirs" ] ||
  ln -sf $cfg/xdg/config.sh $XDG_CONFIG_HOME/user-dirs.dirs
