#!/bin/bash

CWD="${0%/*}"

export DYLD_LIBRARY_PATH="${CWD}/lib:$DYLD_LIBRARY_PATH"
export GTK_DATA_PREFIX="${CWD}"
export GTK_DATA_DIRS="${CWD}"
export GTK_EXE_PREFIX="${CWD}"
export GTK_PATH="${CWD}"

export GTK2_RC_FILES="${CWD}/etc/gtk-2.0/gtkrc"
export GTK_IM_MODULE_FILE="${CWD}/gtk-2.0/gtk.immodules"
export GDK_PIXBUF_MODULE_FILE="${CWD}/etc/gtk-2.0/gdk-pixbuf.loaders"
export PANGO_RC_FILE="${CWD}/etc/pango/pangorc"
export XDG_DATA_DIRS="${CWD}/share:$XDG_DATA_DIRS"

ln -sf "${0%/Contents/*}" /tmp

exec "${CWD}/rawtherapee"