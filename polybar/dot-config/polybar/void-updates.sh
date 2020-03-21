#!/bin/sh

num=$(xbps-install --sync --update --dry-run | wc -l)
[ -n "$num" ] && [ "$num" -gt 0 ] && echo " $num"
