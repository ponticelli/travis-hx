#!/bin/bash
source $(dirname $0)/defaults.sh

for i in "${!TARGET[@]}"; do
	CURTARGET=${TARGET[i]}
	for j in "${!TOOLCHAIN[@]}"; do
		CURTOOL=${TOOLCHAIN[j]}
		case ${TARGET[i]} in
			js )
				[[ $HXFLAGS_EXTRA && ${HXFLAGS_EXTRA-x} ]] || HXFLAGS_EXTRA="-js \"$TARGET_DIR/js.js\""
				HX=$HXFLAGS $HXFLAGS_EXTRA
				haxe $HX || exit 1
				;;
			swf | flash | swf9 | flash9 )
				[[ $HXFLAGS_EXTRA && ${HXFLAGS_EXTRA-x} ]] || HXFLAGS_EXTRA="-swf \"$TARGET_DIR/$CURTARGET.swf\" -D fdb"
				HX=$HXFLAGS $HXFLAGS_EXTRA
				haxe $HX || exit 1
			swf8 | flash8 )
				[[ $HXFLAGS_EXTRA && ${HXFLAGS_EXTRA-x} ]] || HXFLAGS_EXTRA="-swf -swf-version 8 \"$TARGET_DIR/$CURTARGET.swf\" -D fdb"
				HX=$HXFLAGS $HXFLAGS_EXTRA
				haxe $HX || exit 1
				;;
			as3 )
				[[ $HXFLAGS_EXTRA && ${HXFLAGS_EXTRA-x} ]] || HXFLAGS_EXTRA="-as3 \"TARGET_DIR/as3\" -D fdb"
				HX=$HXFLAGS $HXFLAGS_EXTRA
				haxe $HX || exit 1
				;;
			neko )
				[[ $HXFLAGS_EXTRA && ${HXFLAGS_EXTRA-x} ]] || HXFLAGS_EXTRA="-neko \"$TARGET_DIR/neko.n\""
				HX=$HXFLAGS $HXFLAGS_EXTRA
				haxe $HX || exit 1
				;;
			php )
				[[ $HXFLAGS_EXTRA && ${HXFLAGS_EXTRA-x} ]] || HXFLAGS_EXTRA="-php \"$TARGET_DIR/php\""
				HX=$HXFLAGS $HXFLAGS_EXTRA
				haxe $HX || exit 1
				;;
			cpp )
				[[ $HXFLAGS_EXTRA && ${HXFLAGS_EXTRA-x} ]] || HXFLAGS_EXTRA="-cpp \"$TARGET_DIR/cpp\""
				HX=$HXFLAGS $HXFLAGS_EXTRA
				haxe $HX || exit 1
				;;
			cs )
				[[ $HXFLAGS_EXTRA && ${HXFLAGS_EXTRA-x} ]] || HXFLAGS_EXTRA="-cs \"$TARGET_DIR/cs\""
				HX=$HXFLAGS $HXFLAGS_EXTRA
				haxe $HX || exit 1
				;;
			java )
				[[ $HXFLAGS_EXTRA && ${HXFLAGS_EXTRA-x} ]] || HXFLAGS_EXTRA="-java \"$TARGET_DIR/java\""
				HX=$HXFLAGS $HXFLAGS_EXTRA
				haxe $HX || exit 1
				;;
			python )
				[[ $HXFLAGS_EXTRA && ${HXFLAGS_EXTRA-x} ]] || HXFLAGS_EXTRA="-python \"$TARGET_DIR/python.py\""
				HX=$HXFLAGS $HXFLAGS_EXTRA
				haxe $HX || exit 1
				;;
			interp )
				[[ $HXFLAGS_EXTRA && ${HXFLAGS_EXTRA-x} ]] || HXFLAGS_EXTRA="--interp"
				HX=$HXFLAGS $HXFLAGS_EXTRA
				haxe $HX || exit 1
				;;
			macro )
				[[ $HXFLAGS_EXTRA && ${HXFLAGS_EXTRA-x} ]] || HXFLAGS_EXTRA="$MACROFLAGS"
				HX=$HXFLAGS $HXFLAGS_EXTRA
				haxe $HX || exit 1
				;;
			* )
				echo "unrecognized target ${TARGET[i]}"
				;;
		esac
	done
done
