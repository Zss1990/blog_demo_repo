#!/bin/sh
# PlistBuddy 教程--一种对plist文件操作的工具

# 常量

PLISTBUDDY_PATH='/usr/libexec/PlistBuddy'
PLIST_FILE='t1.plist'

PB_HELP=true
PB_PRINT=true
PB_ADD=true
PB_DEL=true
PB_SET=true


function pb_syntax_foo {
	$PLISTBUDDY_PATH -c "$1" $PLIST_FILE
}

function pb_syntax_foo_add {
	pb_syntax_foo "Add :$1"
}

function pb_syntax_foo_del {
	pb_syntax_foo "Delete :$1"
}

function pb_syntax_foo_set {
	pb_syntax_foo "Set :$1"
}

function pb_syntax_foo_print {
	pb_syntax_foo "Print"
}

# function pb_syntax_add_array {
# 	pb_syntax_foo_add "$1 array"
# }

# help
if [[ $PB_HELP = false ]]; then
	#statements
	$PLISTBUDDY_PATH --help
fi

# Add
if [[ $PB_ADD = true ]]; then

	# 添加一个key: Version value: 1.0
	pb_syntax_foo_add "code integer 404"
	# array
	pb_syntax_foo_add "list Array"
	pb_syntax_foo_add "list: string a1"
	# insert
	pb_syntax_foo_add "list:0 string a2"
	# dict
	pb_syntax_foo_add "result Dict"
	pb_syntax_foo_add "result:name string Tom"
	pb_syntax_foo_add "result:age integer 18"
	pb_syntax_foo_add "result:list Array"
	pb_syntax_foo_add "result:list: string aa"
fi

# Delete
if [[ $PB_DEL = false ]]; then
	pb_syntax_foo_del "result"
	pb_syntax_foo_del "code"
	pb_syntax_foo_del "code"

fi

# Set
if [[ $PB_SET = true ]]; then
	#更新code字段404->200
	pb_syntax_foo_set "code 200"
fi

# Print
if [[ $PB_PRINT = true ]]; then
	pb_syntax_foo_print
	pb_syntax_foo "Print :code"
fi


# pb_syntax_foo "Save"
# pb_syntax_foo "Exit"