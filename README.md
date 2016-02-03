# vbox-img Docker image

A Docker image that allows using
[vbox-img](https://www.virtualbox.org/) to convert virtual disk images.

No VirtualBox, VMWare, `qemu-img`, or `vmdk-tool` required.

With this image you can convert vmdk, vdi, vhd, and raw images from and to.

The goal of making this image was to enable the use case of converting a
`.ova` file containing a _monolithicSparse_ `.vmdk` file into an `.ova` file
containing a _streamOptimized_ `.vmdk` file.


## Build

    $ docker build -t vbox-img .

Or fetch:

    $ docker pull djui/vbox-img


## Usage

### Convert monolithicSparse VMDK into streamOptimized VMDK

    $ docker run --rm -i \
        -v $PWD/coreos_production_vmware_image.vmdk:/tmp/coreos_production_vmware_image.vmdk \
        vbox-img convert \
            --srcfilename /tmp/coreos_production_vmware_image.vmdk \
            --stdout \
            --dstformat VMDK \
            --variant Stream \
        > coreos_production_vmware_image_stream.vmdk
    Converting image "/tmp/coreos_production_vmware_image.vmdk" with size 9116319744 bytes (8694MB)...

### Default Usage

    $ docker run --rm -it -v my_image.vmdk:/tmp/my_image.vmdk vbox-img
    Oracle VM VirtualBox Disk Utility 5.0.10
    (C) 2005-2015 Oracle Corporation
    All rights reserved.

    Usage: vbox-img
       setuuid      --filename <filename>
                    [--format VDI|VMDK|VHD|...]
                    [--uuid <uuid>]
                    [--parentuuid <uuid>]
                    [--zeroparentuuid]

       geometry     --filename <filename>
                    [--format VDI|VMDK|VHD|...]
                    [--clearchs]
                    [--cylinders <number>]
                    [--heads <number>]
                    [--sectors <number>]

       convert      --srcfilename <filename>
                    --dstfilename <filename>
                    [--stdin]|[--stdout]
                    [--srcformat VDI|VMDK|VHD|RAW|..]
                    [--dstformat VDI|VMDK|VHD|RAW|..]
                    [--variant Standard,Fixed,Split2G,Stream,ESX]

       info         --filename <filename>

       compact      --filename <filename>
                    [--filesystemaware]

       createcache  --filename <filename>
                    --size <cache size>

       createbase   --filename <filename>
                    --size <size in bytes>
                    [--format VDI|VMDK|VHD] (default: VDI)
                    [--variant Standard,Fixed,Split2G,Stream,ESX]
                    [--dataalignment <alignment in bytes>]

       repair       --filename <filename>
                    [--dry-run]
                    [--format VDI|VMDK|VHD] (default: autodetect)

       clearcomment --filename <filename>

       resize       --filename <filename>
                    --size <new size>
