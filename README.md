### Linux Administration Independent Project
## Student Name: Ricky Kenan Abura
### Project: Linux Administration Project
Operating System: Ubuntu Linux
Project Directory: ~/Desktop/kubeverse/linux-admin-project
Web Server: NGINX
Date: September 2026

### 1. Project Overview
This project demonstrates the practical application of Linux system administration skills through
system setup, user and group management, file permissions, shell scripting, NGINX installation and
configuration, static website deployment, system validation, and troubleshooting.
The project was completed in an Ubuntu Linux environment. The main objective was to prepare a structured Linux environment, implement controlled access using users and groups, automate administrative checks using a shell script, deploy a static website using NGINX, and troubleshoot operational issues.
The project consists of four milestones:
1. Linux System Setup and Administration Basics
2. Shell Scripting and Automation
3. NGINX Static Website Deployment
4. Troubleshooting and Operations Validation
The four milestones account for the complete project assessment.


### 2. Environment Overview

2.1 System Information
The project was performed on an Ubuntu Linux workstation.
System identification Commands used:
whoami
hostname
pwd
lsb_release -a
uname -a

### 3. Project Directory Structure
The project directory was organized into separate directories for scripts, website files,documentation, and logs.
The structure used was:
.
├── docs
│   ├── milestone1
│   ├── milestone2
│   ├── milestone3
│   └── milestone4
├── logs
│   └── report.txt
├── README.md
├── scripts
│   └── syscheck.sh
└── site
    ├── index.html
    └── style.css


### 4. Milestone 1 : Linux System Setup and Administration

# 4.1 Objective
The objective of Milestone 1 was to prepare the Linux environment and demonstrate the use of
users, groups, ownership, permissions, and logical project organization.
The project requirements included creating an additional user, creating and using a group, applying appropriate ownership and permissions, and explaining the reasons for the configuration.

# 4.2 Creating the Project Workspace
The project workspace was created using:
mkdir -p ~/Desktop/kubeverse/linux-admin-project/{scripts,site,docs,logs}
The directory structure was verified using the command:
tree


# 4.3 Creating an Additional User
An additional Linux user named webadmin was created:
sudo adduser webadmin
The user was created to represent an administrative account that could be used for managing the
web-related project resources.
The account was verified using:
id webadmin

# 4.4 Creating the Project Group
A group named webteam was created: sudo groupadd webteam
The webadmin user was added to the group:sudo usermod -aG webteam webadmin
The configuration was verified using:
groups webadmin
# 4.5 Ownership Configuration
The project directory was assigned to the current user and the webteam group:sudo chown -R $USER:webteam .
The ownership was verified using:
ls -la
# 4.6 File and Directory Permissions
Permissions were configured using:
sudo chmod -R 2775 .
The permissions were verified using:
ls -la
The 2775 permission also applies the set-group-ID bit to directories, helping newly created files and
directories inherit the project group.
The project directory was successfully organized, an additional user and group were created, and ownership and permissions were configured.

![alt text](<Screenshot from 2026-09-17 17-06-18.png>)

### 5. Milestone 2 : Shell Scripting and Automation
# 5.1 Objective
The objective of Milestone 2 was to create an original shell script that performs a useful administrative, operational, or validation task.

# 5.2 Script Name
The script created for this project is:
syscheck.sh
The script is designed to perform basic system and NGINX health checks.

# 5.3 Script Functionality
The script checks:1. Project directories
2. Disk usage
3. Memory usage
4. NGINX service status
5. NGINX configuration validity
The script uses variables to define important paths and uses a loop to check multiple project
directories.

# 5.4 Making the Script Executable
The script was made executable using:
chmod +x syscheck.sh
The permission was verified using:
ls -l syscheck.sh

![alt text](<Screenshot from 2026-09-17 20-35-48-1.png>)
![alt text](<Screenshot from 2026-09-17 20-54-49.png>)

# 5.5 Executing the Script
The script was executed using:
./syscheck.sh
The script successfully performed the intended checks and provided useful information about the
Linux environment and NGINX service.
The script demonstrates how repetitive administrative checks can be automated instead of being performed manually every time.
![alt text](<Screenshot from 2026-09-17 21-07-51.png>)

### 6. Milestone 3 : NGINX Static Website Deployment

# 6.1 Objective
The objective of Milestone 3 was to install and configure NGINX and deploy a static website successfully.
The milestone requires NGINX installation, correct website file management, configuration
validation, successful website accessibility, and visible customization.

# 6.2 Installing NGINX
The package list was updated:
sudo apt update
NGINX was installed using:
sudo apt install nginx -y

# 6.3 Checking the NGINX Service
The service status was checked using:
sudo systemctl status nginx
The expected result was:
Active: active (running)
![alt text](<Screenshot from 2026-09-17 21-16-11.png>)

# 6.4 NGINX Configuration Validation
Before reloading or restarting NGINX, the configuration was tested using:
sudo nginx -t
![alt text](<Screenshot from 2026-09-17 21-20-19.png>)

# 6.5 Website File Deployment
The static website files were placed in the project website directory:site/index.html, style.css
The website files were then deployed to the NGINX web root

sudo cp /index.html /var/www/html/
sudo cp /style.css /var/www/html/

# 6.6 Website Permissions
The NGINX web files were assigned appropriate ownership and permissions:
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html
The configuration was verified using:
ls -la /var/www/html
After validating the configuration:
sudo nginx -t
NGINX was reloaded:
sudo systemctl reload nginx
The service status was checked again:
sudo systemctl status nginx
![alt text](<Screenshot from 2026-09-17 21-37-46.png>)

# 6.7 Website Accessibility Test
The website was tested locally using:
http://localhost on the browser
![alt text](<Screenshot from 2026-09-17 21-44-19.png>)

### 7. Milestone 4 — Troubleshooting and Operations Validation
7.1 Objective
The objective of Milestone 4 was to demonstrate structured troubleshooting by investigating and
resolving at least three separate issues.

# Issue 1: NGINX was not installed
• Problem: When checking the system, NGINX was not available on the Ubuntu environment.
• Investigation: Checked whether NGINX was installed and whether the NGINX service
existed/running.
• Finding: The NGINX package was absent from the system.
![alt text](<Screenshot from 2026-09-17 21-52-00.png>)

• Fix: Installed NGINX using:
sudo systemctl status nginx
The NGINX service was then available and the default NGINX page could be accessed locally.
![alt text](<Screenshot from 2026-09-24 13-31-44.png>)

# Issue 2: Project directories reported as missing by syscheck.sh
• Problem: When ./syscheck.sh was executed, the script reported:
Fix: Changed the project path in syscheck.sh to determine the project root from the script's location:PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
![alt text](<Screenshot from 2026-09-16 20-54-02.png>)
![alt text](<Screenshot from 2026-09-17 22-10-30.png>)

# Issue 3: Website files were not yet deployed
• Problem: After installing NGINX, there was no project website displayed. Only the default NGINX page was available.
• Investigation: Checked the contents of /var/www/html and compared them with the website
files in the project's site directory.
• Finding: The project's index.html and styles.css files had not yet been copied into the NGINX web root. Therefore, NGINX was working, but it was serving its default website instead of the project's website.
• Fix: Copied the project website files to the NGINX web root:
sudo cp /index.html /var/www/html/
sudo cp /styles.css /var/www/html/

Then permissions were configured:
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html
NGINX was validated and reloaded:
sudo nginx -t
sudo systemctl reload nginx
Verification: Opened http://localhost in the browser and confirmed that the project's customized
static website was being served instead of the default NGINX page.
![alt text](<Screenshot from 2026-09-17 12-15-07.png>)

### 8. Project Conclusion
The Linux Administration Independent Project brought together several Linux administration skills into one practical environment.
The project covered Linux system organization, users and groups, ownership and permissions, shell scripting, NGINX installation and configuration, static website deployment, validation, and structured troubleshooting.The completed environment demonstrates the ability to not only deploy a working service but also manage, validate, troubleshoot, and document that service.
The project reinforced the importance of systematic administration, automation, testing, and documentation when managing Linux-based services.
