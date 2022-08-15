#!/usr/bin/sh

for cmd in curl jq mktemp
do
    if [ -x "$(command -v "$cmd")" ]; then
        continue
    fi

    echo "$cmd not found, exiting..."
    exit
done

format="&format=js"
days_ago="&idx=0"
image_count="&n=1"
base_url="https://bing.com/HPImageArchive.aspx?"

# Query the bing website for an image
bing_url="$base_url$format$days_ago$image_count"

# Use jq to parse the json and fetch the url of the first image (-r to remove quotes)
img_url=$(curl -s $bing_url | jq -r ".images | .[0] | .url") || { echo "Failed retrieving image URL."; return; }

# Create the file where the image will be stored. 
# Replace mktemp with something else if you want, I like it being a tmp file.
file=$(mktemp) || { echo "Failed creating a file for the image."; return; }
curl -s "https://bing.com$img_url" > $file || { echo "Failed installing the image to $file"; return; }

# wait until curl finishes.
wait

# Print the file location to stdout. You can use this with some other program
# e.g. `imv $(bing-image.sh)`
echo "$file"

# Now do whatever you want with the image. For example on Sway,
# swaybg -i $file -m fill
