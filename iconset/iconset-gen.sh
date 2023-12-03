#!/bin/bash

echo "Please run this script as the Root user" 
echo "If you don't it will not work properly" 
echo "Waiting for 10 seconds" 
sleep 10
clear

while true; do
    # Ask the user for the folder path
    read -p "Enter the path to the folder (or 'exit' to quit): " folder_path

    # Check if the user wants to exit
    if [ "$folder_path" == "exit" ]; then
        echo "Script terminated by user."
        exit 0
    fi

    # Verify that the folder exists
    if [ ! -d "$folder_path" ]; then
        echo "Error: The specified folder does not exist. Please try again."
    else
        break  # Exit the loop if the folder is valid
    fi
done

clear

#Show the user their folder path
echo "The Folder you input is $folder_path"


# List the contents of the folder
folder_contents=$(ls "$folder_path")

#Make Iconset Directory
echo "Making Iconset Directory" 
mkdir /opt/iconsets/

#Prompt User to Input their Group Name
#THIS DOES NOT ALLOW FOR MORE THAN ONE GROUP
read -p "What do you want the name of your IconSet to be?" $group_name

#Create a directory that will be zipped 
mkdir /opt/iconsets/$group_name/

# Create Iconset directory for the icon files to go into 
mkdir /opt/iconsets/$group_name/$group_name

# Create the destination folder for the iconset
destination_folder="/opt/iconsets/$group_name/$group_name"
mkdir -p "$destination_folder"

# List the files in the folder
files=("$folder_path"/*)

# Create a Unique UID for the Iconnset 

# Generate a UUID
full_uuid=$(uuidgen)

# Extract the first 8 characters
uid=${full_uuid:0:8}

# Convert half of the characters to uppercase
uid_uppercase=$(echo "$uid" | awk '{print toupper(substr($0, 1, length($0)/2))}' )

# Add two random numbers (between 0 and 9)
random_number1=$((RANDOM % 10))
random_number2=$((RANDOM % 10))

# Combine uppercase, lowercase, and numbers
uid_mixed=$(echo "${uid_uppercase:0:3}${random_number1}${uid_uppercase:3:3}${random_number2}${uid:6}")



cat <<EOF > /opt/iconsets/$group_name/iconset.xml
<?xml version="1.0"?><iconset version="11" name="$group_name" defaultGroup="$group_name" uid="$uid_mixed" skipResize="false"> \n
EOF

# Loop through each file in the variable user input path 
for file in "${files[@]}"; do
    # Display the current file and ask the user if they want to include it in the iconset
    read -p "Do you want to include the file '$file' in the iconset? (y/n): " include_file

    if [ "$include_file" == "y" ]; then
        # Copy the file to the iconset destination folder
        cp "$file" "$destination_folder/"
        echo "File copied: $file"
        printf "\n  <icon name="$file_name" groupName="group_name"  type2525b="a-u-G"" >> /opt/iconsets/$group_name/iconset.xml
        echo "$file line added to inconset.xml"
    else
        echo "Skipped file: $file"
    fi
done


# Adding the last line of /opt/iconset/
cat <<EOF > /opt/iconsets/$group_name/iconset.xml
</iconset>
EOF
