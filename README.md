# DuplicatedImagesRemover
Script for finding and deleting duplicated images from destination directory

## Preconditions
### Git
Git is installed [Windows Installer](https://gitforwindows.org/)

### Python
Python is installed (The Latest version should be fine) [Windows Installer](https://www.python.org/downloads/)

## Environment setup
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
### Run script based on JSON preset
To run script with configured settings please use command:
```
python <path_to_dir_with_script>/duplicated_photos_remove.py -P <path_to_settings_json_file>
```

Example JSON configuration file can be found in file `config_file.json`.

#### Variables
* 
