#!/bin/sh
# The macruby_deploy command-line tool with the --compile argument will compile every Ruby source file of your .app into machine code. Default options will be used. Pass the -h option to get more information.
PATH="$PATH:/usr/local/bin" macruby_deploy --compile "$TARGET_BUILD_DIR/$PROJECT_NAME.app"
