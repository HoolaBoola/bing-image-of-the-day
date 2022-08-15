Save the Bing image of the day to your device, from the commandline!

### Pre-requisites

Ensure you have `jq` installed. 

### Usage

Use the script simply by calling it.

`./bing-image.sh` or `bash bing-image.sh`

### Other software for this purpose exist already. Why create this?

For a desktop environment, such as Gnome, and some window managers, there are other tools to set the bing image as the wallpaper, for example [this](https://github.com/marguerite/linux-bing-wallpaper) and [this](https://github.com/markasoftware/bing-wallpaper-linux). 

The difference between those and this project is that this one doesn't set the wallpaper, it only installs the image and allows you to choose what to do with it. I use it with Sway, since those I mentioned do not seem to support Wayland window managers.

For example with Sway, adding this to the end of the file causes the background image to be changed:

`swaybg -i $file -m fill`

### License

This program is distributed under the terms of the MIT license, see [LICENSE.txt](LICENSE.txt) for details.
