#!/usr/bin/env python

import os
import subprocess

home_dir = os.environ['HOME']
mount_dir_path_1 = os.path.join(home_dir, "NAS", "Multimedia")
mount_dir_path_2 = os.path.join(home_dir, "NAS", "Backups")
mount_dir_path_3 = os.path.join(home_dir, "NAS", "Documents")
creds_file = os.path.join(home_dir, ".credentials")

def mount_multimedia_nas():
    if os.path.exists(mount_dir_path_1):
        subprocess.run(["sudo", "mount", "-t", "cifs", "-o",
                        f"credentials={creds_file},uid=1000,gid=1000",
                        "//192.168.0.125/multimedia", mount_dir_path_1],
                        capture_output=True, text=True)
    else:
        print("Mount directory does not exist!")

def mount_backups_nas():
    if os.path.exists(mount_dir_path_2):
        subprocess.run(["sudo", "mount", "-t", "cifs", "-o",
                        f"credentials={creds_file},uid=1000,gid=1000",
                        "//192.168.0.125/Backups", mount_dir_path_2],
                        capture_output=True, text=True)
    else:
        print("Mount directory does not exist!")

def mount_documents_nas():
    if os.path.exists(mount_dir_path_3):
        subprocess.run(["sudo", "mount", "-t", "cifs", "-o",
                        f"credentials={creds_file},uid=1000,gid=1000",
                        "//192.168.0.125/documents", mount_dir_path_3],
                        capture_output=True, text=True)


subprocess.run(["tput", "setaf", "2"])
print()
print("1)", "QNAP NAS Backups")
print("2)", "QNAP NAS Multimedia")
print("3)", "QNAP Documents")
print()
subprocess.run(["tput", "sgr0"])

CHOICE = input("Choose which device you want to mount.... ")

match CHOICE:
    case '1':
        mount_backups_nas()
    case '2':
        mount_multimedia_nas()
    case '3':
        mount_documents_nas()
    case other:
        print("No such device!")
