#!/bin/sh
# Copyright (C) 2017 LEDE project

do_bmips() {
	. /lib/bmips.sh

	bmips_detect
}

boot_hook_add preinit_main do_bmips
