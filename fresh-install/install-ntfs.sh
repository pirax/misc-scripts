#!/bin/bash

# this for fresh install only - without previous version of fuse4x or ntfs-3g

echo "Starting..."

echo "Installing fuse4x..."
brew install fuse4x
echo "Done."

echo "Installing ntfs-3g..."
brew install ntfs-3g
echo "Done."

# backup original file
echo "Backing up mount_ntfs..."
sudo mv /sbin/mount_ntfs /sbin/mount_ntfs.orig
echo "Done."

# copy newly installed in its place
echo "Overwrite mount_ntfs..."
sudo ln -s /usr/local/Cellar/ntfs-3g/2013.1.13/sbin/mount_ntfs /sbin/mount_ntfs
echo "Done."

# install fixe4x kernel instructions
echo "Installing fuse4x-kext..."
brew info fuse4x-kext
sudo cp -rfX /usr/local/Cellar/fuse4x-kext/0.9.2/Library/Extensions/fuse4x.kext /Library/Extensions
sudo chmod +s /Library/Extensions/fuse4x.kext/Support/load_fuse4x
echo "Done."

echo "All done. Re-atach ntfs drives."
