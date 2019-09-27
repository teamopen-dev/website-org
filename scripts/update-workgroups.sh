#!/bin/bash

# (source, target, name)
function pageString() {
	echo "
---
# GENERATED FILE, DON'T EDIT
title: Workgroups
featured_image: images/home-bg.svg
type: mddoc
layout: single
aliases:
  - $2/$3
---

{{< readfile file=\"$1/$3\" markdown=\"true\" >}}
"
}

s=${SOURCE_PATH:-"/sources/workgroups"}
t=${TARGET_PATH:-"/workgroups"}

toplevel="$(git -C "$(dirname "$0")" rev-parse --show-toplevel)"
out="${toplevel}/content/en${t}"

rm -rf ${out}/*
pageString $s $t "README.md" > "${out}/_index.md"
pageString $s $t "ABOUT.md" > "${out}/about.md"

for name in ${toplevel}${s}/workgroups/*.md; do
	wg=$(basename $name)
	pageString "${s}/workgroups" $t $wg > "${out}/${wg}"
done
