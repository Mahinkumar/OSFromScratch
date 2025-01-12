echo "OS from scratch initialization script"


echo -e "\nWhich architecture would you like to install?"
    echo "1) 64-bit"
    echo "2) 32-bit"
    read -p "Please enter your choice (1 or 2): " choice
    case $choice in
        1)
            curl -LO https://github.com/qemu/qemu/raw/v8.0.4/pc-bios/opensbi-riscv64-generic-fw_dynamic.bin
            ;;
        2)
            curl -LO https://github.com/qemu/qemu/raw/v8.0.4/pc-bios/opensbi-riscv32-generic-fw_dynamic.bin
            ;;
        *)
            echo "Invalid choice. Please enter 1 for 64-bit or 2 for 32-bit."
            continue
            ;;
    esac
