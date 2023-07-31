# GetCVELinks
This script iterates through a specified directory (and its subdirectories) looking for JAR files, outputting a hyperlinked HTML file for quick CVE checks.  
  
## Requirements
  1. PowerShell on the machine you'd like to scan
  2. A Github account (authentication is required for the hyperlinks to function)
  3. A path to some application that has JAR files you'd like to assess
  
## Notes
By default the script only searches for CVEs with "HIGH" or "CRITICAL" keywords which helps to reduce the amount of returned hits.
