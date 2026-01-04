# This is Simple Monochrome

![a waybar setup](../pictures/waybar-SimpleMonochrome.png)

# Installation

for a lot of these config files you simply have to place them in the right spot. for the more complex configurations that include scripts and the like instructions will be provided

## Waybar

Probbaly my most used and most ocmplex custom config is my waybar config, i have serveral themes but currently I will only be sharing one since the others are not perfected yet

### Depencies

- waybar
- hyprland
- cava
- nerd font (JetBrains Mono looks best)
- btop
- mpris
- pulseaudio
- wofi
- curl
- dunst (only if you want tailscale module)
- Note: thanks to [@federicovolponi] for his tailscale script, this config uses it.

### Installation

simply place all the files of the waybar config you choose and move them into

```/home/{User}/.config/waybar```

ensure that your file directory looks like this

```
.../waybar
  | config.jsonc
  | style.css
  | scripts
     | cava.sh
     | color-copy.sh
     | color-picker.sh
     | powermenu.sh
     | weather.sh
     | waybar-tailscale
        | waybar-tailscale.sh
```

this will ensure proper function.

### Usage

#### After installation you may wonder what some of the stuff in the bar does well im going to walk you through it.

#### From right to left

#### Power menu

this button simply brings up a power menu that lets you choose between reboot, shutdown, and logout. simple uses wofi. please see my wofi config if you would like a style for it. 

#### Date

another super simple one, just the day, date, month, hour, and minute. Left clicking the date will change the format to show the full spelling of the day and month as well as add a seconds increment to the clock and a year indicator. Hovering over the date module will show a calender with a current day indicator and a week counter on the right side.

#### Workspaces

just like any other hyprland waybar config there are workspaces in the bar. by default it shows 3 on each monitor, left clicking on a workspace will bring tou there. thats it. 

#### Current Window

Displays what ever the current focused window is.

#### Tray

the tray holds apps that are running in the background but not open in a workspace. things like discord, spotify, copyQ. Also note that the tray is surrouded by two seperator modules. I believe seperator is spelled incorrectly but I dont really care. if you do not want the tray please also remove the seperators.

#### Color Picker

this is a module to pick any color currently on your screen and copy it. working with photoshop (gimp), video editing, and even frontend coding proves this very useful. at least for me. to use it simply left click it, pick your color on the screen, then middle mouse clich the module to open the copy menu. this will display a wofi menu with three options, HEX, RGB, HSL double click or hit enter after selecting one to add it to clipboard. to clear the picked color right click the color module. 

#### Cava

just cava nothing special. displays the sound bar when sound is playing. looks cool. 

#### Music Player

this displays the current song or video thats playing. simple stuff. left click it to play/pause, right click to skip, middle mouse button click to go to previous song. 

#### Volume

displays current system volume. left click to open pavucontrol if installed. use scroll wheel while hovering over it to change the volume, right click to mute.

#### Weather

Displays current weather of a predetermined area. to change to your area please edit ```scripts/weather.hs``` and change the value of ```LOCATION``` at the top of the file. Please also edit ```config.jsonc``` and change the ```onclick``` value to your current location/desired url for me its
```firefox (this says open firefox, change to your browser) theweathernetwork.com/en/city/mycity (change to whatever URL you please)```. hover over the module to display details. left click to open weather website specified in ```config.jsonc```.

#### CPU

displays current CPU load. left click to open BTOP. hover over this module to see the individual core load.

#### RAM

displays current amount of RAM being used as a percentage. left click opens BTOP. hover displays current RAM usage / total RAM, and your swap usage. 

#### Internet Connection

displays the current network you are connected to and strength as a percentage. if disconnected it says ```disconnected``` with a symbol i think lol cant remember. if wired it says ```(tabsymbol (didnt want to find it in conf)) wired``` left clikc opens nm-connection-editor. hovering over the module shows different things depending on if you are wired or on wifi but the main thing is it shows you your network name and your up and down speeds.

#### Tailscale

tailscale module by [@federicovolponi]. TS: on means you are connected to your tailnet, off means you are disconnected. hovering over the module will display the current status of all other devices on your tailnet, green means connected, red disconnected. right clicking opens a wofi menu to select a exit node. left clicking toggles between on and off. 

#### Bluetooth

shows if bluetooth is on or not. left click to open blueman-manager if installed. hover shows hostname, and connection status.

#### The bar also includes 
- a backlight module for brightnesse (latop)
- battery module for battery (laptop)
