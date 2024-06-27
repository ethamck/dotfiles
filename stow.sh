#!/bin/sh
cd "$(dirname $0)"
stow -t ~/ --no-folding */
