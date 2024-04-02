{ config, lib, pkgs, modulesPath, ...}:

{
    imports = [];

    boot.initrd.availableKernelModules = ["ata_piix" "uhci_hcd" "ehci_pci" "ahci" "vmw_pvscsi" "sd_mod" "sr_mod"];
    boot.initrd.kernelModules = [];
    boot.kernelModules = [];
    boot.extraModulePackages = [];

    fileSystems."/" = {
        device = "/dev/disk/by-uuid/05a8d4a4-f199-4791-dd65d2b70d0c";
        fsType = "ext4";
    };

    fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/56A5-73CF";
        fsType = "vfat";
    };

    swapDevices = [];

    networking.useDHCP = lib.mkDefault true;

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}