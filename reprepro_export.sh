#!/usr/bin/expect -f
set passphrase $env(pass)

# Call reprepro with variable length arguments, so that this script
# takes the same arguments as the original program
spawn reprepro export
expect {
    "Passphrase: *"  { send -- "$passphrase\r";
                                 send_user " *** entering passphrase ***";
                                 exp_continue}
}

# Get the pid, spawnid, oserr and exitcode from the spawned reprepro command
set returnvalues [wait]

# Extract the reprepro exit code
set exitcode [lindex $returnvalues 3]

# Exit with the exitcode from reprepro (0 on success)
exit $exitcode