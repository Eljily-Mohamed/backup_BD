# Oracle Database Backup Script

This Bash script is designed to automate the backup process for Oracle databases, including both full databases and pluggable databases. It offers options to create backups of entire databases or specific file types, such as data files, control files, and logs.

## Features

- **Full Database Backup**: Backup an entire Oracle database.
- **Pluggable Database Backup**: Backup specific pluggable databases within a container database.
- **Selective File Backup**: Option to backup specific file types, such as `.dbf`, `.ctl`, and `.log`.
- **Custom Backup Destination**: Users can specify a custom directory where the backup will be stored.
- **Automated Archive Creation**: The backup files are archived using `tar` with timestamps to easily manage and identify backups.

## Prerequisites

- **Oracle Database**: Ensure that your Oracle database is installed and properly configured.
- **Permissions**: Ensure the script has execution permissions. You can set this with:

  ```bash
  chmod +x backup_script.sh

## Usage

Here’s an example of how the script might be used:

```bash
$ ./backup_script.sh

vous voulez faire Backup de database ou Pluggable : b/p : b

Donner le nom de la base de donne : orcl.

fichier precis or Database complexe ? [y/N] y.

fichier Datafiles .dbf? [y/N] y.

fichier controles .ctl? [y/N] n.

fichier journal .log? [y/N] n.

Destination de votre backup /home/USERNAME/ : backups.
