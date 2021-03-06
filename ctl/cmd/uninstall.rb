def cmd_uninstall(options)
    ctl = "\"#{ASEPSISCTL_SYMLINK_SOURCE_PATH}\""
    sys!("#{ctl} uninstall_wrapper")
    sys!("#{ctl} kill_daemon")
    sys!("#{ctl} uninstall_daemon")
    sys!("#{ctl} remove_symlink")
    sys!("#{ctl} enable_warnings")
    sys!("#{ctl} uninstall_updater")

    # install launchd "runonce" task to finish the uninstallation after reboot
    sys("sudo cp \"#{RESOURCES_PATH}/com.binaryage.asepsis.uninstall.plist\" \"/Library/LaunchDaemons\"")
    
    say "Asepsis uninstallation done, reboot your computer"
end