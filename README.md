# DuplicatedImagesRemover
Script for finding and deleting duplicated images from destination directory

## Preconditions
### Git
Git is installed [Windows Installer](https://gitforwindows.org/)

### Python
Python is installed (The Latest version should be fine) [Windows Installer](https://www.python.org/downloads/)

## Environment setup

### Clone repository
Open repo destination directory in shell([Windows tutorial](https://www.wikihow.com/Open-a-Folder-in-Cmd)) and use command below to clone repo into this directory
```
git clone https://github.com/abdarum/DuplicatedImagesRemover.git
```

### Install needed packages
Open directory in shell([Windows tutorial](https://www.wikihow.com/Open-a-Folder-in-Cmd)) and use command below to install needed packages
```
pip install -r pip_requirements.txt
```

## Script description
### Command line interface - CLI
```
usage: duplicated_photos_remove.py [-h] [-p] [-P PRESET_PATH] [-s SOURCE] [-d DESTINATION] [-a] [-r] [-n] [-e]    
                                   [-v]

options:
  -h, --help            show this help message and exit
  -p, --preset          execute hardcoded preset in code options and exit
  -P PRESET_PATH, --preset_path PRESET_PATH
                        path to config file(json file as settings preset) - execute preset and exit
  -s SOURCE, --source SOURCE
                        path to source directory
  -d DESTINATION, --destination DESTINATION
                        path to destination directory
  -a, --accept_duplicates
                        by default duplicated files are skipped(not deleted). If flag is enabled then duplicates  
                        will be also deleted
  -r, --delete_files    delete files existing in source from destination dir, default: False
  -n, --no_action       explain what would be deleted, but there is no action in file system, default: False      
  -e, --export_sorted_newest
                        export sorted files from source to destination directory. Note: the source and the        
                        destination paths have to be set
  -v, --verbose         explain what is being done
```
### Run script based on JSON preset (Recommended)
To run script with configured settings please use command:
```
python <path_to_dir_with_script>/duplicated_photos_remove.py -P <path_to_settings_json_file>
```

Example JSON configuration file can be found in file `config_file.json`.

#### Variables
* sources:  
  List of paths to source directories. Multiple paths are equivalent to multiple running script with `--source` argument from CLI using each value from list. Path types are described at [Paths](#path-types)
* destinations:  
  List of paths to destination directories. Multiple paths are equivalent to multiple running script with `--destination` argument from CLI using each value from list. Path types are described at [Paths](#path-types)
* delete_files:  
  Boolean equivalent to `--delete_files` parameter from [Command line interface - CLI](#command-line-interface---cli)
* accept_duplicates:  
  Boolean equivalent to `--accept_duplicates` parameter from [Command line interface - CLI](#command-line-interface---cli)
* verbose:  
  Boolean equivalent to `--verbose` parameter from [Command line interface - CLI](#command-line-interface---cli)
* no_action:  
  Boolean equivalent to `--no_action` parameter from [Command line interface - CLI](#command-line-interface---cli)
#### Path types
Windows paths are using `\` as separator(escape character for special characters as `\n`-newline or `\t`-tab). To set up JSON file correctly replace all `\` to `\\`.

* Absolute path to directory:
  * `"C:\\image\\Camera"` - path to: `"C:\image\Camera"`
  * `"D:\\images"` - path to: `"D:\images"`
* Path to network attached storage
  * `"\\\\networkpc\\image\\Camera"` - path to: `"\\networkpc\image\Camera"` - `\\networkpc` as server and `image\Camera` as following path
* FTP server(e.g. it can be setup at Android phone, so duplicated images can be deleted directly from phone or other device):
  * Dictionary in following format:
  * `"type": "ftp_server",`: this line should be unchanged for handling ftp sever
  * `"url": "192.168.xxx.xxx",`: url to ftp server. It could be IP of device in local network e.g. `192.168.1.5` or `ftp_server_in_net.domain.com`
  * `"port": 0,`: port used to communication with FTP server. Dependent on server setup
  * `"username": "xxxx",`: username needed to access files
  * `"password": "xxxx",`: password needed to access files
  * `"cwd": "/Images/path"`: Path to directory where images are stored. Take into consideration it is a relative path of the server setup  
     * Example:  
  Android, files stored at `/storage/emulated/0/DCIM/Camera/landscapes` and server root dir is set to `/storage/emulated/0/DCIM`, then cwd value will be `/Camera/landscapes`
```
{
  "type": "ftp_server",
  "url": "192.168.xxx.xxx",
  "port": 0,
  "username": "xxxx",
  "password": "xxxx",
  "cwd": "/Images/path"
}
```


