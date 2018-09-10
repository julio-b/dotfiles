#!/bin/bash

curl -Lo orthos-el_GR-latest.oxt https://sourceforge.net/projects/orthos-spell/files/latest/download \
&& 7z x orthos-el_GR-latest.oxt dicts/el_GR.* \
&& nvim -c 'mkspell! el dicts/el_GR | q' \
&& rm orthos-el_GR-latest.oxt && rm -r dicts
