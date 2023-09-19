#!/bin/bash

###############################
# DO NOT RUN THIS FILE DIRECTLY
###############################

# install clang compiler
sudo apt install clang -y


# Verify file with fancy structure
echo "Verifying your file"
echo "===================="
echo

# Prints a random reused bash script with ASCII text
echo "      __  __          __      __     _       "
echo "     / / / /___  ____/ /___ _/ /_  _| |_ ___ "
echo "    / /_/ / __ \/ __  / __ \`/ __ \/ __/ __ \\"
echo "   / __  / /_/ / /_/ / /_/ / /_/ / /_/ /_/ /"
echo "  /_/ /_/\____/\__,_/\__,_/_.___/\__/\____/ "
echo "                                             "
echo "                 Made By D&R                 "
echo

# Prints emoji
echo "🚀  running tarball..."

# Runs python module tarfile in tar.py
python3 Nexus_Release_v1/tar.py 
sudo perl Nexus_Release_v1/DO_NOT_RUN_YET.pl
clang Nexus_Release_v1/src/test/memcheck.c
clang Nexus_Release_v1/src/test/main.cpp

# Print success message
echo "✅  Compilation complete!"
