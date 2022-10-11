import os, tarfile, shutil
from rich import print as pprint

BTD6_DIR = "D:/Games/SteamLibrary/steamapps/common/BloonsTD6"
MOD_FILES = ("version.dll", "mods", "Melonloader")

if __name__ == "__main__":
    if (not os.path.isfile(f"{BTD6_DIR}/mods.tar.gz") or False):
        os.chdir(BTD6_DIR)
        with tarfile.open(f"{BTD6_DIR}/mods.tar.gz", mode="w:gz") as modsTarfile:
            pprint(f"Created '{BTD6_DIR}/mods.tar.gz'")
            for file in MOD_FILES:
                modsTarfile.add(file)
                pprint(f"Added '{BTD6_DIR}/{file}' to tarball")
        exit()

    if os.path.isfile(f"{BTD6_DIR}/version.dll"):
        for file in MOD_FILES:
            if os.path.isfile(f"{BTD6_DIR}/{file}") or os.path.islink(f"{BTD6_DIR}/{file}"):
                os.remove(f"{BTD6_DIR}/{file}")
            elif os.path.isdir(f"{BTD6_DIR}/{file}"):
                shutil.rmtree(f"{BTD6_DIR}/{file}")
            else:
                raise ValueError(f"file '{BTD6_DIR}/{file}' is not a file or dir.")
            pprint(f"Deleted '{BTD6_DIR}/{file}'")
    else:
        with tarfile.open(f"{BTD6_DIR}/mods.tar.gz", mode="r:gz") as modsTarfile:
            modsTarfile.extractall(path=BTD6_DIR)
            pprint(f"Extrated tarball to '{BTD6_DIR}'")
