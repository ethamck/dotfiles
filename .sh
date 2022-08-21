#!/bin/sh
cd "$(dirname $0)"


# Shallow symlinks
for package in .; do
	for folder in $package; do
		mkdir -p "~/$folder"
	done
done

## Partial symlinks
for package in {minecraft}; do
	for folder in $package; do
		for subfolder in $folder; do
			mkdir -p "~/$folder"
		done
	done
done

## Specifics
mkdir -p "~/.local/share/backgrounds"


# Stow
stow */
