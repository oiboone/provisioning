# Component Selection

* Ensure video card or Integrated Graphics in CPU supports and is supported by the Linux kernel version you're considering and Wayl and X-Org 
* For the motherboard look for the following features:
  * The ability to flash the BIOS without a processor installed (Q-Flash form Gigabyte)
  * The ability to boot a UEFI shell (ASUS)
  * Support for TPM, secure boot, and trusted boot 
  * Support for legacy boot
  * Check for simultaneous support for M.2 and SATA
  * Legacy IO support (PATA, rs-232, parallel, firewire, PS-2 serial etc.)
  * Support for lots of fans, thermometers, etc.
* Check that M.2 devices are compatible wiht motherboard (SATA, PCIe, NVMe)
* Power supply should be hihg efficiency, modular and not too high power since it will always draw current, even when computer is off.
* Check RAM timing numbers but be aware of max speed supported by processor.

# Hardware Build Sequence

1. Open case to examine how all panels attach and what connectors/devices are available. Consider best access for mounting mobo (need vertical access to standoffs)
2. Attach mobo standoffs to case
3. Mount Power supply in case
4. Mount Internal drives (DVD, HDD, SSDs) in bays. Identify best cable routing for drives and if possible without obstructing mobo access, connect power supply to drives.
5. If needed to support new CPU, flash bios.
6. Check if heat sink mounting hardware matches heatsink.
7. Mount M.2 drives (use mobo supplied heat sink if available.)
8. Mount CPU (careful of pins and orientation)
9. Mount DRAM
10. Mount CPU heatsink
11. Mount mobo in case
12. connect cables (Use G-connector if available to group case connectors together so they can be plugged in at once.)
13. 