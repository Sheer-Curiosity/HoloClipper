# Thought I'd add some comments to this, since I'll be sharing the source code. All of this is original code written by Sheer Curiosity,
# with the notable exception of youtube-dl and ffmpeg. 

# I will go ahead and say it now, this code is awful. It's an affront to humanity.
# Over 7000 lines of textual garbage. Because I had to write this in 5 days, I didn't have time to properly teach myself PowerShell
# scripting, and thus we see the atrocities exhibited in this script. Just taking a cursory glance through it would give any self-respecting
# programmer a fucking aneurysm.


#This script both creates the 3 second black screen and stitches it between each mini-clip.
#It also places all the original mini-clips in a new folder titled "originals" in the working directory
$HoloStitcher = {
    $vidcount = read-host -prompt 'Number Of Videos (2-10)'
    $resolution = read-host -prompt 'Video Resolution (1080, 720, 480, 360)'
    $fulltitle = read-host -prompt 'Clip Number'
    $vidcount = [int]$vidcount
    $resolution = [int]$resolution
    if ($resolution -eq 1080) {
        ffmpeg -hide_banner -loglevel error -f lavfi -i color=black:s=1920x1080:r=30000/1000 -f lavfi -i anullsrc -ar 48000 -ac 2 -t 3 blackscreen.mkv
    }
    if ($resolution -eq 720) {
        ffmpeg -hide_banner -loglevel error -f lavfi -i color=black:s=1280x720:r=30000/1000 -f lavfi -i anullsrc -ar 48000 -ac 2 -t 3 blackscreen.mkv
    }
    if ($resolution -eq 480) {
        ffmpeg -hide_banner -loglevel error -f lavfi -i color=black:s=854x480:r=30000/1000 -f lavfi -i anullsrc -ar 48000 -ac 2 -t 3 blackscreen.mkv
    }
    if ($resolution -eq 360) {
        ffmpeg -hide_banner -loglevel error -f lavfi -i color=black:s=640x360:r=30000/1000 -f lavfi -i anullsrc -ar 48000 -ac 2 -t 3 blackscreen.mkv
    }
    write-host "Black Screen created"
    $makeOriginal = new-item -itemtype directory -path ".\originals"
    $makeOriginal
    #These check if each clip file exists, and if so, moves them to the ./originals folder
    if (test-path ".\clip1.mkv" -pathtype leaf) {
        move-item -path ".\clip1.mkv" -destination ".\originals\clip1.mkv"
    }
    if (test-path ".\clip2.mkv" -pathtype leaf) {
        move-item -path ".\clip2.mkv" -destination ".\originals\clip2.mkv"
    }
    if (test-path ".\clip3.mkv" -pathtype leaf) {
        move-item -path ".\clip3.mkv" -destination ".\originals\clip3.mkv"
    }
    if (test-path ".\clip4.mkv" -pathtype leaf) {
        move-item -path ".\clip4.mkv" -destination ".\originals\clip4.mkv"
    }
    if (test-path ".\clip5.mkv" -pathtype leaf) {
        move-item -path ".\clip5.mkv" -destination ".\originals\clip5.mkv"
    }
    if (test-path ".\clip6.mkv" -pathtype leaf) {
        move-item -path ".\clip6.mkv" -destination ".\originals\clip6.mkv"
    }
    if (test-path ".\clip7.mkv" -pathtype leaf) {
        move-item -path ".\clip7.mkv" -destination ".\originals\clip7.mkv"
    }
    if (test-path ".\clip8.mkv" -pathtype leaf) {
        move-item -path ".\clip8.mkv" -destination ".\originals\clip8.mkv"
    }
    if (test-path ".\clip9.mkv" -pathtype leaf) {
        move-item -path ".\clip9.mkv" -destination ".\originals\clip9.mkv"
    }
    if (test-path ".\clip10.mkv" -pathtype leaf) {
        move-item -path ".\clip10.mkv" -destination ".\originals\clip10.mkv"
    }
    #There was definitely a better way to stitch clips than this, but I was strapped for time.
    if ($vidcount -eq 2) {
        ffmpeg -hide_banner -loglevel error -i ".\originals\clip1.mkv" -i blackscreen.mkv -i ".\originals\clip2.mkv" -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0][2:v:0][2:a:0]concat=n=3:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" -x264-params keyint=24:min-keyint=1 "clip$fulltitle.mkv"
    }
    if ($vidcount -eq 3) {
        ffmpeg -hide_banner -loglevel error -i ".\originals\clip1.mkv" -i blackscreen.mkv -i ".\originals\clip2.mkv" -i blackscreen.mkv -i ".\originals\clip3.mkv" -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0][2:v:0][2:a:0][3:v:0][3:a:0][4:v:0][4:a:0]concat=n=5:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" -x264-params keyint=24:min-keyint=1 "clip$fulltitle.mkv"
    }
    if ($vidcount -eq 4) {
        ffmpeg -hide_banner -loglevel error -i ".\originals\clip1.mkv" -i blackscreen.mkv -i ".\originals\clip2.mkv" -i blackscreen.mkv -i ".\originals\clip3.mkv" -i blackscreen.mkv -i ".\originals\clip4.mkv" -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0][2:v:0][2:a:0][3:v:0][3:a:0][4:v:0][4:a:0][5:v:0][5:a:0][6:v:0][6:a:0]concat=n=7:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" -x264-params keyint=24:min-keyint=1 "clip$fulltitle.mkv"
    }
    if ($vidcount -eq 5) {
        ffmpeg -hide_banner -loglevel error -i ".\originals\clip1.mkv" -i blackscreen.mkv -i ".\originals\clip2.mkv" -i blackscreen.mkv -i ".\originals\clip3.mkv" -i blackscreen.mkv -i ".\originals\clip4.mkv" -i blackscreen.mkv -i ".\originals\clip5.mkv" -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0][2:v:0][2:a:0][3:v:0][3:a:0][4:v:0][4:a:0][5:v:0][5:a:0][6:v:0][6:a:0][7:v:0][7:a:0][8:v:0][8:a:0]concat=n=9:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" -x264-params keyint=24:min-keyint=1 "clip$fulltitle.mkv"
    }
    if ($vidcount -eq 6) {
        ffmpeg -hide_banner -loglevel error -i ".\originals\clip1.mkv" -i blackscreen.mkv -i ".\originals\clip2.mkv" -i blackscreen.mkv -i ".\originals\clip3.mkv" -i blackscreen.mkv -i ".\originals\clip4.mkv" -i blackscreen.mkv -i ".\originals\clip5.mkv" -i blackscreen.mkv -i ".\originals\clip6.mkv" -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0][2:v:0][2:a:0][3:v:0][3:a:0][4:v:0][4:a:0][5:v:0][5:a:0][6:v:0][6:a:0][7:v:0][7:a:0][8:v:0][8:a:0][9:v:0][9:a:0][10:v:0][10:a:0]concat=n=11:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" -x264-params keyint=24:min-keyint=1 "clip$fulltitle.mkv"
    }
    if ($vidcount -eq 7) {
        ffmpeg -hide_banner -loglevel error -i ".\originals\clip1.mkv" -i blackscreen.mkv -i ".\originals\clip2.mkv" -i blackscreen.mkv -i ".\originals\clip3.mkv" -i blackscreen.mkv -i ".\originals\clip4.mkv" -i blackscreen.mkv -i ".\originals\clip5.mkv" -i blackscreen.mkv -i ".\originals\clip6.mkv" -i blackscreen.mkv -i ".\originals\clip7.mkv" -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0][2:v:0][2:a:0][3:v:0][3:a:0][4:v:0][4:a:0][5:v:0][5:a:0][6:v:0][6:a:0][7:v:0][7:a:0][8:v:0][8:a:0][9:v:0][9:a:0][10:v:0][10:a:0][11:v:0][11:a:0][12:v:0][12:a:0]concat=n=13:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" -x264-params keyint=24:min-keyint=1 "clip$fulltitle.mkv"
    }
    if ($vidcount -eq 8) {
        ffmpeg -hide_banner -loglevel error -i ".\originals\clip1.mkv" -i blackscreen.mkv -i ".\originals\clip2.mkv" -i blackscreen.mkv -i ".\originals\clip3.mkv" -i blackscreen.mkv -i ".\originals\clip4.mkv" -i blackscreen.mkv -i ".\originals\clip5.mkv" -i blackscreen.mkv -i ".\originals\clip6.mkv" -i blackscreen.mkv -i ".\originals\clip7.mkv" -i blackscreen.mkv -i ".\originals\clip8.mkv" -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0][2:v:0][2:a:0][3:v:0][3:a:0][4:v:0][4:a:0][5:v:0][5:a:0][6:v:0][6:a:0][7:v:0][7:a:0][8:v:0][8:a:0][9:v:0][9:a:0][10:v:0][10:a:0][11:v:0][11:a:0][12:v:0][12:a:0][13:v:0][13:a:0][14:v:0][14:a:0]concat=n=15:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" -x264-params keyint=24:min-keyint=1 "clip$fulltitle.mkv"
    }
    if ($vidcount -eq 9) {
        ffmpeg -hide_banner -loglevel error -i ".\originals\clip1.mkv" -i blackscreen.mkv -i ".\originals\clip2.mkv" -i blackscreen.mkv -i ".\originals\clip3.mkv" -i blackscreen.mkv -i ".\originals\clip4.mkv" -i blackscreen.mkv -i ".\originals\clip5.mkv" -i blackscreen.mkv -i ".\originals\clip6.mkv" -i blackscreen.mkv -i ".\originals\clip7.mkv" -i blackscreen.mkv -i ".\originals\clip8.mkv" -i blackscreen.mkv -i ".\originals\clip9.mkv" -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0][2:v:0][2:a:0][3:v:0][3:a:0][4:v:0][4:a:0][5:v:0][5:a:0][6:v:0][6:a:0][7:v:0][7:a:0][8:v:0][8:a:0][9:v:0][9:a:0][10:v:0][10:a:0][11:v:0][11:a:0][12:v:0][12:a:0][13:v:0][13:a:0][14:v:0][14:a:0][15:v:0][15:a:0][16:v:0][16:a:0]concat=n=17:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" -x264-params keyint=24:min-keyint=1 "clip$fulltitle.mkv"
    }
    if ($vidcount -eq 10) {
        ffmpeg -hide_banner -loglevel error -i ".\originals\clip1.mkv" -i blackscreen.mkv -i ".\originals\clip2.mkv" -i blackscreen.mkv -i ".\originals\clip3.mkv" -i blackscreen.mkv -i ".\originals\clip4.mkv" -i blackscreen.mkv -i ".\originals\clip5.mkv" -i blackscreen.mkv -i ".\originals\clip6.mkv" -i blackscreen.mkv -i ".\originals\clip7.mkv" -i blackscreen.mkv -i ".\originals\clip8.mkv" -i blackscreen.mkv -i ".\originals\clip9.mkv" -i blackscreen.mkv -i ".\originals\clip10.mkv" -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0][2:v:0][2:a:0][3:v:0][3:a:0][4:v:0][4:a:0][5:v:0][5:a:0][6:v:0][6:a:0][7:v:0][7:a:0][8:v:0][8:a:0][9:v:0][9:a:0][10:v:0][10:a:0][11:v:0][11:a:0][12:v:0][12:a:0][13:v:0][13:a:0][14:v:0][14:a:0][15:v:0][15:a:0][16:v:0][16:a:0][17:v:0][17:a:0][18:v:0][18:a:0]concat=n=19:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" -x264-params keyint=24:min-keyint=1 "clip$fulltitle.mkv"
    }
    if ($vidcount -gt 10) {
        write-host "Too many clips!"
        remove-item ".\blackscreen.mkv"
        return
    }
    remove-item ".\blackscreen.mkv"
}

$HololiveClipper = {
#This dictates which part of the script to run, since each of these sources require a different set of commands to be properly clipped.
#The "Local File" condition is actually code from the very 1st version of this script, so it's a bit different from the YT and Archive code
    $videotype = read-host -prompt "Video Type: `n
A) YouTube Video 
B) Archive 
C) Local File (MUST be titled `"clipDL`" with extension MKV, MP4, or WEBM) 

[A/B/C]"
    #This controls whether or not 5 seconds will be added to the start and end of the timestamps entered later in the script.
    #I actually wanted to implement input checking like this for every user input, but again, not enough time.
    do {
        $cliptype = read-host -prompt "Clip According To HoloRewind Standards? [Y/N]"
    }
    until ($cliptype -eq "y" -or $cliptype -eq "Y" -or $cliptype -eq "N" -or $cliptype -eq "n")
    if ($videotype -eq "A" -or $videotype -eq "a") {
        $inlink = read-host -prompt 'Input YouTube Link'
        #if the clip has miniclips, run the spaghetti below
        $miniclip = read-host -prompt 'Clip Has Miniclips? [Y/N]'
        if ($miniclip -eq "Y" -or $miniclip -eq "y") {
            $clipnum = 1
            $miniclipnum = read-host -prompt 'Number Of Miniclips [2-10]'
            #Lines 105-3530 are basically just Yandev-style scripting, but on crack.
            #My original plan was to have all these variables create themselves based on
            #the number of clips, but like I said, I was pressed for time, and couldn't 
            #figure out how to do that.
            if ($miniclipnum -eq 2) {
                #For each miniclip case, the code is basically the exact same.
                #Ask for user input on clip start timestamp
                $clip1ts = read-host -prompt "Input Start Time For Clip 1 (Format: XX:XX:XX:XX)"
                $1ts1,$1ts2,$1ts3,$1ts4 = $clip1ts.split(":")
                $1ts1 = [int]$1ts1
                $1ts2 = [int]$1ts2
                $1ts3 = [int]$1ts3
                $1ts4 = [int]$1ts4
                #if clipping to HoloRewind standards, do a bit of math on the timestamp to subtract 5 seconds from the start time.
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $1ts3 = $1ts3 - 5
                    if ($1ts3 -lt 0) {
                        $1ts3 = $1ts3 + 60
                        $1ts2 = $1ts2 - 1
                    }
                }
                #Ask for user input on clip end timestamp
                $clip1te = read-host -prompt "Input End Time For Clip 1 (Format: XX:XX:XX:XX)"
                $1te1,$1te2,$1te3,$1te4 = $clip1te.split(":")
                $1te1 = [int]$1te1
                $1te2 = [int]$1te2
                $1te3 = [int]$1te3
                $1te4 = [int]$1te4
                #if clipping to HoloRewind standards, do a bit of math on the timestamp to add 5 seconds to the end time.
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $1te3 = $1te3 + 5
                    if ($1te3 -ge 60) {
                    $1te3 = $1te3 - 60
                    $1te2 = $1te2 + 1
                    }
                }
                #More math to calculate the runtime of the clip
                $1tc1 = $1te1 - $1ts1
                $1tc2 = $1te2 - $1ts2
                $1tc3 = $1te3 - $1ts3
                $1tc4 = $1te4 - $1ts4
                if ($1tc3 -lt 0) {
                $1tc3 = $1tc3 + 60
                $1tc2 = $1tc2 - 1
                }
                #These make sure the timestamp is in the correct format for being used in the ffmpeg commmand
                if (($1tc1.tostring().length) -eq 1) {
                $1tc1 = "0$1tc1"
                }
                if (($1tc2.tostring().length) -eq 1) {
                $1tc2 = "0$1tc2"
                }
                if (($1tc3.tostring().length) -eq 1) {
                $1tc3 = "0$1tc3"
                }
                if (($1tc4.tostring().length) -eq 1) {
                $1tc4 = "0$1tc4"
                }
                if (($1ts1.tostring().length) -eq 1) {
                $1ts1 = "0$1ts1"
                }
                if (($1ts2.tostring().length) -eq 1) {
                $1ts2 = "0$1ts2"
                }
                if (($1ts3.tostring().length) -eq 1) {
                $1ts3 = "0$1ts3"
                }
                if (($1ts4.tostring().length) -eq 1) {
                $1ts4 = "0$1ts4"
                }
                #this constructs the two timestamps used in the ffmpeg error command
                $clip1Sps = "$1ts1`:$1ts2`:$1ts3.$1ts4"
                $clip1Rt = "$1tc1`:$1tc2`:$1tc3.$1tc4"
                #Rinse and repeat for each clip.
                $clip2ts = read-host -prompt "Input Start Time For Clip 2 (Format: XX:XX:XX:XX)"
                $2ts1,$2ts2,$2ts3,$2ts4 = $clip2ts.split(":")
                $2ts1 = [int]$2ts1
                $2ts2 = [int]$2ts2
                $2ts3 = [int]$2ts3
                $2ts4 = [int]$2ts4
                $2ts3 = $2ts3 - 5
                if ($2ts3 -lt 0) {
                    $2ts3 = $2ts3 + 60
                    $2ts2 = $2ts2 - 1
                }
                $clip2te = read-host -prompt "Input End Time For Clip 2 (Format: XX:XX:XX:XX)"
                $2te1,$2te2,$2te3,$2te4 = $clip2te.split(":")
                $2te1 = [int]$2te1
                $2te2 = [int]$2te2
                $2te3 = [int]$2te3
                $2te4 = [int]$2te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $2te3 = $2te3 + 5
                    if ($2te3 -ge 60) {
                    $2te3 = $2te3 - 60
                    $2te2 = $2te2 + 1
                    }
                }
                $2tc1 = $2te1 - $2ts1
                $2tc2 = $2te2 - $2ts2
                $2tc3 = $2te3 - $2ts3
                $2tc4 = $2te4 - $2ts4
                if ($2tc3 -lt 0) {
                $2tc3 = $2tc3 + 60
                $2tc2 = $2tc2 - 1
                }
                if (($2tc1.tostring().length) -eq 1) {
                $2tc1 = "0$2tc1"
                }
                if (($2tc2.tostring().length) -eq 1) {
                $2tc2 = "0$2tc2"
                }
                if (($2tc3.tostring().length) -eq 1) {
                $2tc3 = "0$2tc3"
                }
                if (($2tc4.tostring().length) -eq 1) {
                $2tc4 = "0$2tc4"
                }
                if (($2ts1.tostring().length) -eq 1) {
                $2ts1 = "0$2ts1"
                }
                if (($2ts2.tostring().length) -eq 1) {
                $2ts2 = "0$2ts2"
                }
                if (($2ts3.tostring().length) -eq 1) {
                $2ts3 = "0$2ts3"
                }
                if (($2ts4.tostring().length) -eq 1) {
                $2ts4 = "0$2ts4"
                }
                $clip2Sps = "$2ts1`:$2ts2`:$2ts3.$2ts4"
                $clip2Rt = "$2tc1`:$2tc2`:$2tc3.$2tc4"
                #youtube-dl command grabs the file links for video and audio
                $glinks = youtube-dl -g --youtube-skip-dash-manifest "$inlink"
                #this makes sure youtube-dl actually gets the links, and doesn't fail.
                while (!$glinks) {$glinks = youtube-dl -g --youtube-skip-dash-manifest "$inlink"}
                #splits the one large link string given by youtube-dl into two sperate string variables for use in the ffmpeg commands
                $glink1,$glink2 = $glinks.split(" ")
                if (!$glink2) {$glink2 = $glink1}
                ffmpeg -hide_banner -loglevel error -ss $clip1Sps -i ($glink1) -t $clip1Rt -ss $clip1Sps -i ($glink2) -t $clip1Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip2Sps -i ($glink1) -t $clip2Rt -ss $clip2Sps -i ($glink2) -t $clip2Rt "clip$clipnum.mkv"
                $needsstitching = read-host -prompt 'Do you want to stitch clips? [Y/N]'
                if ($needsstitching -eq "Y" -or $needsstitching -eq "y") {
                   &$HoloStitcher
                }
                else {
                    write-host "Clipping Complete!"    
                    return
                }
            }
            if ($miniclipnum -eq 3) {
                $clip1ts = read-host -prompt "Input Start Time For Clip 1 (Format: XX:XX:XX:XX)"
                $1ts1,$1ts2,$1ts3,$1ts4 = $clip1ts.split(":")
                $1ts1 = [int]$1ts1
                $1ts2 = [int]$1ts2
                $1ts3 = [int]$1ts3
                $1ts4 = [int]$1ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $1ts3 = $1ts3 - 5
                    if ($1ts3 -lt 0) {
                        $1ts3 = $1ts3 + 60
                        $1ts2 = $1ts2 - 1
                    }
                }
                $clip1te = read-host -prompt "Input End Time For Clip 1 (Format: XX:XX:XX:XX)"
                $1te1,$1te2,$1te3,$1te4 = $clip1te.split(":")
                $1te1 = [int]$1te1
                $1te2 = [int]$1te2
                $1te3 = [int]$1te3
                $1te4 = [int]$1te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $1te3 = $1te3 + 5
                    if ($1te3 -ge 60) {
                    $1te3 = $1te3 - 60
                    $1te2 = $1te2 + 1
                    }
                }
                $1tc1 = $1te1 - $1ts1
                $1tc2 = $1te2 - $1ts2
                $1tc3 = $1te3 - $1ts3
                $1tc4 = $1te4 - $1ts4
                if ($1tc3 -lt 0) {
                $1tc3 = $1tc3 + 60
                $1tc2 = $1tc2 - 1
                }
                if (($1tc1.tostring().length) -eq 1) {
                $1tc1 = "0$1tc1"
                }
                if (($1tc2.tostring().length) -eq 1) {
                $1tc2 = "0$1tc2"
                }
                if (($1tc3.tostring().length) -eq 1) {
                $1tc3 = "0$1tc3"
                }
                if (($1tc4.tostring().length) -eq 1) {
                $1tc4 = "0$1tc4"
                }
                if (($1ts1.tostring().length) -eq 1) {
                $1ts1 = "0$1ts1"
                }
                if (($1ts2.tostring().length) -eq 1) {
                $1ts2 = "0$1ts2"
                }
                if (($1ts3.tostring().length) -eq 1) {
                $1ts3 = "0$1ts3"
                }
                if (($1ts4.tostring().length) -eq 1) {
                $1ts4 = "0$1ts4"
                }
                $clip1Sps = "$1ts1`:$1ts2`:$1ts3.$1ts4"
                $clip1Rt = "$1tc1`:$1tc2`:$1tc3.$1tc4"
                $clip2ts = read-host -prompt "Input Start Time For Clip 2 (Format: XX:XX:XX:XX)"
                $2ts1,$2ts2,$2ts3,$2ts4 = $clip2ts.split(":")
                $2ts1 = [int]$2ts1
                $2ts2 = [int]$2ts2
                $2ts3 = [int]$2ts3
                $2ts4 = [int]$2ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $2ts3 = $2ts3 - 5
                    if ($2ts3 -lt 0) {
                        $2ts3 = $2ts3 + 60
                        $2ts2 = $2ts2 - 1
                    }
                }
                $clip2te = read-host -prompt "Input End Time For Clip 2 (Format: XX:XX:XX:XX)"
                $2te1,$2te2,$2te3,$2te4 = $clip2te.split(":")
                $2te1 = [int]$2te1
                $2te2 = [int]$2te2
                $2te3 = [int]$2te3
                $2te4 = [int]$2te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $2te3 = $2te3 + 5
                    if ($2te3 -ge 60) {
                    $2te3 = $2te3 - 60
                    $2te2 = $2te2 + 1
                    }
                }
                $2tc1 = $2te1 - $2ts1
                $2tc2 = $2te2 - $2ts2
                $2tc3 = $2te3 - $2ts3
                $2tc4 = $2te4 - $2ts4
                if ($2tc3 -lt 0) {
                $2tc3 = $2tc3 + 60
                $2tc2 = $2tc2 - 1
                }
                if (($2tc1.tostring().length) -eq 1) {
                $2tc1 = "0$2tc1"
                }
                if (($2tc2.tostring().length) -eq 1) {
                $2tc2 = "0$2tc2"
                }
                if (($2tc3.tostring().length) -eq 1) {
                $2tc3 = "0$2tc3"
                }
                if (($2tc4.tostring().length) -eq 1) {
                $2tc4 = "0$2tc4"
                }
                if (($2ts1.tostring().length) -eq 1) {
                $2ts1 = "0$2ts1"
                }
                if (($2ts2.tostring().length) -eq 1) {
                $2ts2 = "0$2ts2"
                }
                if (($2ts3.tostring().length) -eq 1) {
                $2ts3 = "0$2ts3"
                }
                if (($2ts4.tostring().length) -eq 1) {
                $2ts4 = "0$2ts4"
                }
                $clip2Sps = "$2ts1`:$2ts2`:$2ts3.$2ts4"
                $clip2Rt = "$2tc1`:$2tc2`:$2tc3.$2tc4"
                $clip3ts = read-host -prompt "Input Start Time For Clip 3 (Format: XX:XX:XX:XX)"
                $3ts1,$3ts2,$3ts3,$3ts4 = $clip3ts.split(":")
                $3ts1 = [int]$3ts1
                $3ts2 = [int]$3ts2
                $3ts3 = [int]$3ts3
                $3ts4 = [int]$3ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $3ts3 = $3ts3 - 5
                    if ($3ts3 -lt 0) {
                        $3ts3 = $3ts3 + 60
                        $3ts2 = $3ts2 - 1
                    }
                }
                $clip3te = read-host -prompt "Input End Time For Clip 3 (Format: XX:XX:XX:XX)"
                $3te1,$3te2,$3te3,$3te4 = $clip3te.split(":")
                $3te1 = [int]$3te1
                $3te2 = [int]$3te2
                $3te3 = [int]$3te3
                $3te4 = [int]$3te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $3te3 = $3te3 + 5
                    if ($3te3 -ge 60) {
                    $3te3 = $3te3 - 60
                    $3te2 = $3te2 + 1
                    }
                }
                $3tc1 = $3te1 - $3ts1
                $3tc2 = $3te2 - $3ts2
                $3tc3 = $3te3 - $3ts3
                $3tc4 = $3te4 - $3ts4
                if ($3tc3 -lt 0) {
                $3tc3 = $3tc3 + 60
                $3tc2 = $3tc2 - 1
                }
                if (($3tc1.tostring().length) -eq 1) {
                $3tc1 = "0$3tc1"
                }
                if (($3tc2.tostring().length) -eq 1) {
                $3tc2 = "0$3tc2"
                }
                if (($3tc3.tostring().length) -eq 1) {
                $3tc3 = "0$3tc3"
                }
                if (($3tc4.tostring().length) -eq 1) {
                $3tc4 = "0$3tc4"
                }
                if (($3ts1.tostring().length) -eq 1) {
                $3ts1 = "0$3ts1"
                }
                if (($3ts2.tostring().length) -eq 1) {
                $3ts2 = "0$3ts2"
                }
                if (($3ts3.tostring().length) -eq 1) {
                $3ts3 = "0$3ts3"
                }
                if (($3ts4.tostring().length) -eq 1) {
                $3ts4 = "0$3ts4"
                }
                $clip3Sps = "$3ts1`:$3ts2`:$3ts3.$3ts4"
                $clip3Rt = "$3tc1`:$3tc2`:$3tc3.$3tc4"
                $glinks = youtube-dl -g --youtube-skip-dash-manifest "$inlink"
                while (!$glinks) {$glinks = youtube-dl -g --youtube-skip-dash-manifest "$inlink"}
                $glink1,$glink2 = $glinks.split(" ")
                if (!$glink2) {$glink2 = $glink1}
                ffmpeg -hide_banner -loglevel error -ss $clip1Sps -i ($glink1) -t $clip1Rt -ss $clip1Sps -i ($glink2) -t $clip1Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip2Sps -i ($glink1) -t $clip2Rt -ss $clip2Sps -i ($glink2) -t $clip2Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip3Sps -i ($glink1) -t $clip3Rt -ss $clip3Sps -i ($glink2) -t $clip3Rt "clip$clipnum.mkv"
                $needsstitching = read-host -prompt 'Do you want to stitch clips? [Y/N]'
                if ($needsstitching -eq "Y" -or $needsstitching -eq "y") {
                   &$HoloStitcher
                }
                else {
                    write-host "Clipping Complete!"    
                    return
                }
            }
            if ($miniclipnum -eq 4) {
                $clip1ts = read-host -prompt "Input Start Time For Clip 1 (Format: XX:XX:XX:XX)"
                $1ts1,$1ts2,$1ts3,$1ts4 = $clip1ts.split(":")
                $1ts1 = [int]$1ts1
                $1ts2 = [int]$1ts2
                $1ts3 = [int]$1ts3
                $1ts4 = [int]$1ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $1ts3 = $1ts3 - 5
                    if ($1ts3 -lt 0) {
                        $1ts3 = $1ts3 + 60
                        $1ts2 = $1ts2 - 1
                    }
                }
                $clip1te = read-host -prompt "Input End Time For Clip 1 (Format: XX:XX:XX:XX)"
                $1te1,$1te2,$1te3,$1te4 = $clip1te.split(":")
                $1te1 = [int]$1te1
                $1te2 = [int]$1te2
                $1te3 = [int]$1te3
                $1te4 = [int]$1te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $1te3 = $1te3 + 5
                    if ($1te3 -ge 60) {
                    $1te3 = $1te3 - 60
                    $1te2 = $1te2 + 1
                    }
                }
                $1tc1 = $1te1 - $1ts1
                $1tc2 = $1te2 - $1ts2
                $1tc3 = $1te3 - $1ts3
                $1tc4 = $1te4 - $1ts4
                if ($1tc3 -lt 0) {
                $1tc3 = $1tc3 + 60
                $1tc2 = $1tc2 - 1
                }
                if (($1tc1.tostring().length) -eq 1) {
                $1tc1 = "0$1tc1"
                }
                if (($1tc2.tostring().length) -eq 1) {
                $1tc2 = "0$1tc2"
                }
                if (($1tc3.tostring().length) -eq 1) {
                $1tc3 = "0$1tc3"
                }
                if (($1tc4.tostring().length) -eq 1) {
                $1tc4 = "0$1tc4"
                }
                if (($1ts1.tostring().length) -eq 1) {
                $1ts1 = "0$1ts1"
                }
                if (($1ts2.tostring().length) -eq 1) {
                $1ts2 = "0$1ts2"
                }
                if (($1ts3.tostring().length) -eq 1) {
                $1ts3 = "0$1ts3"
                }
                if (($1ts4.tostring().length) -eq 1) {
                $1ts4 = "0$1ts4"
                }
                $clip1Sps = "$1ts1`:$1ts2`:$1ts3.$1ts4"
                $clip1Rt = "$1tc1`:$1tc2`:$1tc3.$1tc4"
                $clip2ts = read-host -prompt "Input Start Time For Clip 2 (Format: XX:XX:XX:XX)"
                $2ts1,$2ts2,$2ts3,$2ts4 = $clip2ts.split(":")
                $2ts1 = [int]$2ts1
                $2ts2 = [int]$2ts2
                $2ts3 = [int]$2ts3
                $2ts4 = [int]$2ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $2ts3 = $2ts3 - 5
                    if ($2ts3 -lt 0) {
                        $2ts3 = $2ts3 + 60
                        $2ts2 = $2ts2 - 1
                    }
                }
                $clip2te = read-host -prompt "Input End Time For Clip 2 (Format: XX:XX:XX:XX)"
                $2te1,$2te2,$2te3,$2te4 = $clip2te.split(":")
                $2te1 = [int]$2te1
                $2te2 = [int]$2te2
                $2te3 = [int]$2te3
                $2te4 = [int]$2te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $2te3 = $2te3 + 5
                    if ($2te3 -ge 60) {
                    $2te3 = $2te3 - 60
                    $2te2 = $2te2 + 1
                    }
                }
                $2tc1 = $2te1 - $2ts1
                $2tc2 = $2te2 - $2ts2
                $2tc3 = $2te3 - $2ts3
                $2tc4 = $2te4 - $2ts4
                if ($2tc3 -lt 0) {
                $2tc3 = $2tc3 + 60
                $2tc2 = $2tc2 - 1
                }
                if (($2tc1.tostring().length) -eq 1) {
                $2tc1 = "0$2tc1"
                }
                if (($2tc2.tostring().length) -eq 1) {
                $2tc2 = "0$2tc2"
                }
                if (($2tc3.tostring().length) -eq 1) {
                $2tc3 = "0$2tc3"
                }
                if (($2tc4.tostring().length) -eq 1) {
                $2tc4 = "0$2tc4"
                }
                if (($2ts1.tostring().length) -eq 1) {
                $2ts1 = "0$2ts1"
                }
                if (($2ts2.tostring().length) -eq 1) {
                $2ts2 = "0$2ts2"
                }
                if (($2ts3.tostring().length) -eq 1) {
                $2ts3 = "0$2ts3"
                }
                if (($2ts4.tostring().length) -eq 1) {
                $2ts4 = "0$2ts4"
                }
                $clip2Sps = "$2ts1`:$2ts2`:$2ts3.$2ts4"
                $clip2Rt = "$2tc1`:$2tc2`:$2tc3.$2tc4"
                $clip3ts = read-host -prompt "Input Start Time For Clip 3 (Format: XX:XX:XX:XX)"
                $3ts1,$3ts2,$3ts3,$3ts4 = $clip3ts.split(":")
                $3ts1 = [int]$3ts1
                $3ts2 = [int]$3ts2
                $3ts3 = [int]$3ts3
                $3ts4 = [int]$3ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $3ts3 = $3ts3 - 5
                    if ($3ts3 -lt 0) {
                        $3ts3 = $3ts3 + 60
                        $3ts2 = $3ts2 - 1
                    }
                }
                $clip3te = read-host -prompt "Input End Time For Clip 3 (Format: XX:XX:XX:XX)"
                $3te1,$3te2,$3te3,$3te4 = $clip3te.split(":")
                $3te1 = [int]$3te1
                $3te2 = [int]$3te2
                $3te3 = [int]$3te3
                $3te4 = [int]$3te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $3te3 = $3te3 + 5
                    if ($3te3 -ge 60) {
                        $3te3 = $3te3 - 60
                        $3te2 = $3te2 + 1
                    }
                }
                $3tc1 = $3te1 - $3ts1
                $3tc2 = $3te2 - $3ts2
                $3tc3 = $3te3 - $3ts3
                $3tc4 = $3te4 - $3ts4
                if ($3tc3 -lt 0) {
                $3tc3 = $3tc3 + 60
                $3tc2 = $3tc2 - 1
                }
                if (($3tc1.tostring().length) -eq 1) {
                $3tc1 = "0$3tc1"
                }
                if (($3tc2.tostring().length) -eq 1) {
                $3tc2 = "0$3tc2"
                }
                if (($3tc3.tostring().length) -eq 1) {
                $3tc3 = "0$3tc3"
                }
                if (($3tc4.tostring().length) -eq 1) {
                $3tc4 = "0$3tc4"
                }
                if (($3ts1.tostring().length) -eq 1) {
                $3ts1 = "0$3ts1"
                }
                if (($3ts2.tostring().length) -eq 1) {
                $3ts2 = "0$3ts2"
                }
                if (($3ts3.tostring().length) -eq 1) {
                $3ts3 = "0$3ts3"
                }
                if (($3ts4.tostring().length) -eq 1) {
                $3ts4 = "0$3ts4"
                }
                $clip3Sps = "$3ts1`:$3ts2`:$3ts3.$3ts4"
                $clip3Rt = "$3tc1`:$3tc2`:$3tc3.$3tc4"
                $clip4ts = read-host -prompt "Input Start Time For Clip 4 (Format: XX:XX:XX:XX)"
                $4ts1,$4ts2,$4ts3,$4ts4 = $clip4ts.split(":")
                $4ts1 = [int]$4ts1
                $4ts2 = [int]$4ts2
                $4ts3 = [int]$4ts3
                $4ts4 = [int]$4ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $4ts3 = $4ts3 - 5
                    if ($4ts3 -lt 0) {
                        $4ts3 = $4ts3 + 60
                        $4ts2 = $4ts2 - 1
                    }
                }
                $clip4te = read-host -prompt "Input End Time For Clip 4 (Format: XX:XX:XX:XX)"
                $4te1,$4te2,$4te3,$4te4 = $clip4te.split(":")
                $4te1 = [int]$4te1
                $4te2 = [int]$4te2
                $4te3 = [int]$4te3
                $4te4 = [int]$4te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $4te3 = $4te3 + 5
                    if ($4te3 -ge 60) {
                        $4te3 = $4te3 - 60
                        $4te2 = $4te2 + 1
                    }
                }
                $4tc1 = $4te1 - $4ts1
                $4tc2 = $4te2 - $4ts2
                $4tc3 = $4te3 - $4ts3
                $4tc4 = $4te4 - $4ts4
                if ($4tc3 -lt 0) {
                $4tc3 = $4tc3 + 60
                $4tc2 = $4tc2 - 1
                }
                if (($4tc1.tostring().length) -eq 1) {
                $4tc1 = "0$4tc1"
                }
                if (($4tc2.tostring().length) -eq 1) {
                $4tc2 = "0$4tc2"
                }
                if (($4tc3.tostring().length) -eq 1) {
                $4tc3 = "0$4tc3"
                }
                if (($4tc4.tostring().length) -eq 1) {
                $4tc4 = "0$4tc4"
                }
                if (($4ts1.tostring().length) -eq 1) {
                $4ts1 = "0$4ts1"
                }
                if (($4ts2.tostring().length) -eq 1) {
                $4ts2 = "0$4ts2"
                }
                if (($4ts3.tostring().length) -eq 1) {
                $4ts3 = "0$4ts3"
                }
                if (($4ts4.tostring().length) -eq 1) {
                $4ts4 = "0$4ts4"
                }
                $clip4Sps = "$4ts1`:$4ts2`:$4ts3.$4ts4"
                $clip4Rt = "$4tc1`:$4tc2`:$4tc3.$4tc4"
                $glinks = youtube-dl -g --youtube-skip-dash-manifest "$inlink"
                while (!$glinks) {$glinks = youtube-dl -g --youtube-skip-dash-manifest "$inlink"}
                $glink1,$glink2 = $glinks.split(" ")
                if (!$glink2) {$glink2 = $glink1}
                ffmpeg -hide_banner -loglevel error -ss $clip1Sps -i ($glink1) -t $clip1Rt -ss $clip1Sps -i ($glink2) -t $clip1Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip2Sps -i ($glink1) -t $clip2Rt -ss $clip2Sps -i ($glink2) -t $clip2Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip3Sps -i ($glink1) -t $clip3Rt -ss $clip3Sps -i ($glink2) -t $clip3Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip4Sps -i ($glink1) -t $clip4Rt -ss $clip4Sps -i ($glink2) -t $clip4Rt "clip$clipnum.mkv"
                $needsstitching = read-host -prompt 'Do you want to stitch clips? [Y/N]'
                if ($needsstitching -eq "Y" -or $needsstitching -eq "y") {
                   &$HoloStitcher
                }
                else {
                    write-host "Clipping Complete!"    
                    return
                }
            }
            if ($miniclipnum -eq 5) {
                $clip1ts = read-host -prompt "Input Start Time For Clip 1 (Format: XX:XX:XX:XX)"
                $1ts1,$1ts2,$1ts3,$1ts4 = $clip1ts.split(":")
                $1ts1 = [int]$1ts1
                $1ts2 = [int]$1ts2
                $1ts3 = [int]$1ts3
                $1ts4 = [int]$1ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $1ts3 = $1ts3 - 5
                    if ($1ts3 -lt 0) {
                        $1ts3 = $1ts3 + 60
                        $1ts2 = $1ts2 - 1
                    }
                }
                $clip1te = read-host -prompt "Input End Time For Clip 1 (Format: XX:XX:XX:XX)"
                $1te1,$1te2,$1te3,$1te4 = $clip1te.split(":")
                $1te1 = [int]$1te1
                $1te2 = [int]$1te2
                $1te3 = [int]$1te3
                $1te4 = [int]$1te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $1te3 = $1te3 + 5
                    if ($1te3 -ge 60) {
                        $1te3 = $1te3 - 60
                        $1te2 = $1te2 + 1
                    }
                }
                $1tc1 = $1te1 - $1ts1
                $1tc2 = $1te2 - $1ts2
                $1tc3 = $1te3 - $1ts3
                $1tc4 = $1te4 - $1ts4
                if ($1tc3 -lt 0) {
                $1tc3 = $1tc3 + 60
                $1tc2 = $1tc2 - 1
                }
                if (($1tc1.tostring().length) -eq 1) {
                $1tc1 = "0$1tc1"
                }
                if (($1tc2.tostring().length) -eq 1) {
                $1tc2 = "0$1tc2"
                }
                if (($1tc3.tostring().length) -eq 1) {
                $1tc3 = "0$1tc3"
                }
                if (($1tc4.tostring().length) -eq 1) {
                $1tc4 = "0$1tc4"
                }
                if (($1ts1.tostring().length) -eq 1) {
                $1ts1 = "0$1ts1"
                }
                if (($1ts2.tostring().length) -eq 1) {
                $1ts2 = "0$1ts2"
                }
                if (($1ts3.tostring().length) -eq 1) {
                $1ts3 = "0$1ts3"
                }
                if (($1ts4.tostring().length) -eq 1) {
                $1ts4 = "0$1ts4"
                }
                $clip1Sps = "$1ts1`:$1ts2`:$1ts3.$1ts4"
                $clip1Rt = "$1tc1`:$1tc2`:$1tc3.$1tc4"
                $clip2ts = read-host -prompt "Input Start Time For Clip 2 (Format: XX:XX:XX:XX)"
                $2ts1,$2ts2,$2ts3,$2ts4 = $clip2ts.split(":")
                $2ts1 = [int]$2ts1
                $2ts2 = [int]$2ts2
                $2ts3 = [int]$2ts3
                $2ts4 = [int]$2ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $2ts3 = $2ts3 - 5
                    if ($2ts3 -lt 0) {
                        $2ts3 = $2ts3 + 60
                        $2ts2 = $2ts2 - 1
                    }
                }
                $clip2te = read-host -prompt "Input End Time For Clip 2 (Format: XX:XX:XX:XX)"
                $2te1,$2te2,$2te3,$2te4 = $clip2te.split(":")
                $2te1 = [int]$2te1
                $2te2 = [int]$2te2
                $2te3 = [int]$2te3
                $2te4 = [int]$2te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $2te3 = $2te3 + 5
                    if ($2te3 -ge 60) {
                        $2te3 = $2te3 - 60
                        $2te2 = $2te2 + 1
                    }
                }
                $2tc1 = $2te1 - $2ts1
                $2tc2 = $2te2 - $2ts2
                $2tc3 = $2te3 - $2ts3
                $2tc4 = $2te4 - $2ts4
                if ($2tc3 -lt 0) {
                $2tc3 = $2tc3 + 60
                $2tc2 = $2tc2 - 1
                }
                if (($2tc1.tostring().length) -eq 1) {
                $2tc1 = "0$2tc1"
                }
                if (($2tc2.tostring().length) -eq 1) {
                $2tc2 = "0$2tc2"
                }
                if (($2tc3.tostring().length) -eq 1) {
                $2tc3 = "0$2tc3"
                }
                if (($2tc4.tostring().length) -eq 1) {
                $2tc4 = "0$2tc4"
                }
                if (($2ts1.tostring().length) -eq 1) {
                $2ts1 = "0$2ts1"
                }
                if (($2ts2.tostring().length) -eq 1) {
                $2ts2 = "0$2ts2"
                }
                if (($2ts3.tostring().length) -eq 1) {
                $2ts3 = "0$2ts3"
                }
                if (($2ts4.tostring().length) -eq 1) {
                $2ts4 = "0$2ts4"
                }
                $clip2Sps = "$2ts1`:$2ts2`:$2ts3.$2ts4"
                $clip2Rt = "$2tc1`:$2tc2`:$2tc3.$2tc4"
                $clip3ts = read-host -prompt "Input Start Time For Clip 3 (Format: XX:XX:XX:XX)"
                $3ts1,$3ts2,$3ts3,$3ts4 = $clip3ts.split(":")
                $3ts1 = [int]$3ts1
                $3ts2 = [int]$3ts2
                $3ts3 = [int]$3ts3
                $3ts4 = [int]$3ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $3ts3 = $3ts3 - 5
                    if ($3ts3 -lt 0) {
                        $3ts3 = $3ts3 + 60
                        $3ts2 = $3ts2 - 1
                    }
                }
                $clip3te = read-host -prompt "Input End Time For Clip 3 (Format: XX:XX:XX:XX)"
                $3te1,$3te2,$3te3,$3te4 = $clip3te.split(":")
                $3te1 = [int]$3te1
                $3te2 = [int]$3te2
                $3te3 = [int]$3te3
                $3te4 = [int]$3te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $3te3 = $3te3 + 5
                    if ($3te3 -ge 60) {
                        $3te3 = $3te3 - 60
                        $3te2 = $3te2 + 1
                    }
                }
                $3tc1 = $3te1 - $3ts1
                $3tc2 = $3te2 - $3ts2
                $3tc3 = $3te3 - $3ts3
                $3tc4 = $3te4 - $3ts4
                if ($3tc3 -lt 0) {
                $3tc3 = $3tc3 + 60
                $3tc2 = $3tc2 - 1
                }
                if (($3tc1.tostring().length) -eq 1) {
                $3tc1 = "0$3tc1"
                }
                if (($3tc2.tostring().length) -eq 1) {
                $3tc2 = "0$3tc2"
                }
                if (($3tc3.tostring().length) -eq 1) {
                $3tc3 = "0$3tc3"
                }
                if (($3tc4.tostring().length) -eq 1) {
                $3tc4 = "0$3tc4"
                }
                if (($3ts1.tostring().length) -eq 1) {
                $3ts1 = "0$3ts1"
                }
                if (($3ts2.tostring().length) -eq 1) {
                $3ts2 = "0$3ts2"
                }
                if (($3ts3.tostring().length) -eq 1) {
                $3ts3 = "0$3ts3"
                }
                if (($3ts4.tostring().length) -eq 1) {
                $3ts4 = "0$3ts4"
                }
                $clip3Sps = "$3ts1`:$3ts2`:$3ts3.$3ts4"
                $clip3Rt = "$3tc1`:$3tc2`:$3tc3.$3tc4"
                $clip4ts = read-host -prompt "Input Start Time For Clip 4 (Format: XX:XX:XX:XX)"
                $4ts1,$4ts2,$4ts3,$4ts4 = $clip4ts.split(":")
                $4ts1 = [int]$4ts1
                $4ts2 = [int]$4ts2
                $4ts3 = [int]$4ts3
                $4ts4 = [int]$4ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $4ts3 = $4ts3 - 5
                    if ($4ts3 -lt 0) {
                        $4ts3 = $4ts3 + 60
                        $4ts2 = $4ts2 - 1
                    }
                }
                $clip4te = read-host -prompt "Input End Time For Clip 4 (Format: XX:XX:XX:XX)"
                $4te1,$4te2,$4te3,$4te4 = $clip4te.split(":")
                $4te1 = [int]$4te1
                $4te2 = [int]$4te2
                $4te3 = [int]$4te3
                $4te4 = [int]$4te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $4te3 = $4te3 + 5
                    if ($4te3 -ge 60) {
                        $4te3 = $4te3 - 60
                        $4te2 = $4te2 + 1
                    }
                }
                $4tc1 = $4te1 - $4ts1
                $4tc2 = $4te2 - $4ts2
                $4tc3 = $4te3 - $4ts3
                $4tc4 = $4te4 - $4ts4
                if ($4tc3 -lt 0) {
                $4tc3 = $4tc3 + 60
                $4tc2 = $4tc2 - 1
                }
                if (($4tc1.tostring().length) -eq 1) {
                $4tc1 = "0$4tc1"
                }
                if (($4tc2.tostring().length) -eq 1) {
                $4tc2 = "0$4tc2"
                }
                if (($4tc3.tostring().length) -eq 1) {
                $4tc3 = "0$4tc3"
                }
                if (($4tc4.tostring().length) -eq 1) {
                $4tc4 = "0$4tc4"
                }
                if (($4ts1.tostring().length) -eq 1) {
                $4ts1 = "0$4ts1"
                }
                if (($4ts2.tostring().length) -eq 1) {
                $4ts2 = "0$4ts2"
                }
                if (($4ts3.tostring().length) -eq 1) {
                $4ts3 = "0$4ts3"
                }
                if (($4ts4.tostring().length) -eq 1) {
                $4ts4 = "0$4ts4"
                }
                $clip4Sps = "$4ts1`:$4ts2`:$4ts3.$4ts4"
                $clip4Rt = "$4tc1`:$4tc2`:$4tc3.$4tc4"
                $clip5ts = read-host -prompt "Input Start Time For Clip 5 (Format: XX:XX:XX:XX)"
                $5ts1,$5ts2,$5ts3,$5ts4 = $clip5ts.split(":")
                $5ts1 = [int]$5ts1
                $5ts2 = [int]$5ts2
                $5ts3 = [int]$5ts3
                $5ts4 = [int]$5ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $5ts3 = $5ts3 - 5
                    if ($5ts3 -lt 0) {
                        $5ts3 = $5ts3 + 60
                        $5ts2 = $5ts2 - 1
                    }
                }
                $clip5te = read-host -prompt "Input End Time For Clip 5 (Format: XX:XX:XX:XX)"
                $5te1,$5te2,$5te3,$5te4 = $clip5te.split(":")
                $5te1 = [int]$5te1
                $5te2 = [int]$5te2
                $5te3 = [int]$5te3
                $5te4 = [int]$5te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $5te3 = $5te3 + 5
                    if ($5te3 -ge 60) {
                        $5te3 = $5te3 - 60
                        $5te2 = $5te2 + 1
                    }
                }
                $5tc1 = $5te1 - $5ts1
                $5tc2 = $5te2 - $5ts2
                $5tc3 = $5te3 - $5ts3
                $5tc4 = $5te4 - $5ts4
                if ($5tc3 -lt 0) {
                $5tc3 = $5tc3 + 60
                $5tc2 = $5tc2 - 1
                }
                if (($5tc1.tostring().length) -eq 1) {
                $5tc1 = "0$5tc1"
                }
                if (($5tc2.tostring().length) -eq 1) {
                $5tc2 = "0$5tc2"
                }
                if (($5tc3.tostring().length) -eq 1) {
                $5tc3 = "0$5tc3"
                }
                if (($5tc4.tostring().length) -eq 1) {
                $5tc4 = "0$5tc4"
                }
                if (($5ts1.tostring().length) -eq 1) {
                $5ts1 = "0$5ts1"
                }
                if (($5ts2.tostring().length) -eq 1) {
                $5ts2 = "0$5ts2"
                }
                if (($5ts3.tostring().length) -eq 1) {
                $5ts3 = "0$5ts3"
                }
                if (($5ts4.tostring().length) -eq 1) {
                $5ts4 = "0$5ts4"
                }
                $clip5Sps = "$5ts1`:$5ts2`:$5ts3.$5ts4"
                $clip5Rt = "$5tc1`:$5tc2`:$5tc3.$5tc4"
                $glinks = youtube-dl -g --youtube-skip-dash-manifest "$inlink"
                while (!$glinks) {$glinks = youtube-dl -g --youtube-skip-dash-manifest "$inlink"}
                $glink1,$glink2 = $glinks.split(" ")
                if (!$glink2) {$glink2 = $glink1}
                ffmpeg -hide_banner -loglevel error -ss $clip1Sps -i ($glink1) -t $clip1Rt -ss $clip1Sps -i ($glink2) -t $clip1Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip2Sps -i ($glink1) -t $clip2Rt -ss $clip2Sps -i ($glink2) -t $clip2Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip3Sps -i ($glink1) -t $clip3Rt -ss $clip3Sps -i ($glink2) -t $clip3Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip4Sps -i ($glink1) -t $clip4Rt -ss $clip4Sps -i ($glink2) -t $clip4Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip5Sps -i ($glink1) -t $clip5Rt -ss $clip5Sps -i ($glink2) -t $clip5Rt "clip$clipnum.mkv"
                $needsstitching = read-host -prompt 'Do you want to stitch clips? [Y/N]'
                if ($needsstitching -eq "Y" -or $needsstitching -eq "y") {
                   &$HoloStitcher
                }
                else {
                    write-host "Clipping Complete!"    
                    return
                }
            }
            if ($miniclipnum -eq 6) {
                $clip1ts = read-host -prompt "Input Start Time For Clip 1 (Format: XX:XX:XX:XX)"
                $1ts1,$1ts2,$1ts3,$1ts4 = $clip1ts.split(":")
                $1ts1 = [int]$1ts1
                $1ts2 = [int]$1ts2
                $1ts3 = [int]$1ts3
                $1ts4 = [int]$1ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $1ts3 = $1ts3 - 5
                    if ($1ts3 -lt 0) {
                        $1ts3 = $1ts3 + 60
                        $1ts2 = $1ts2 - 1
                    }
                }
                $clip1te = read-host -prompt "Input End Time For Clip 1 (Format: XX:XX:XX:XX)"
                $1te1,$1te2,$1te3,$1te4 = $clip1te.split(":")
                $1te1 = [int]$1te1
                $1te2 = [int]$1te2
                $1te3 = [int]$1te3
                $1te4 = [int]$1te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $1te3 = $1te3 + 5
                    if ($1te3 -ge 60) {
                        $1te3 = $1te3 - 60
                        $1te2 = $1te2 + 1
                    }
                }
                $1tc1 = $1te1 - $1ts1
                $1tc2 = $1te2 - $1ts2
                $1tc3 = $1te3 - $1ts3
                $1tc4 = $1te4 - $1ts4
                if ($1tc3 -lt 0) {
                $1tc3 = $1tc3 + 60
                $1tc2 = $1tc2 - 1
                }
                if (($1tc1.tostring().length) -eq 1) {
                $1tc1 = "0$1tc1"
                }
                if (($1tc2.tostring().length) -eq 1) {
                $1tc2 = "0$1tc2"
                }
                if (($1tc3.tostring().length) -eq 1) {
                $1tc3 = "0$1tc3"
                }
                if (($1tc4.tostring().length) -eq 1) {
                $1tc4 = "0$1tc4"
                }
                if (($1ts1.tostring().length) -eq 1) {
                $1ts1 = "0$1ts1"
                }
                if (($1ts2.tostring().length) -eq 1) {
                $1ts2 = "0$1ts2"
                }
                if (($1ts3.tostring().length) -eq 1) {
                $1ts3 = "0$1ts3"
                }
                if (($1ts4.tostring().length) -eq 1) {
                $1ts4 = "0$1ts4"
                }
                $clip1Sps = "$1ts1`:$1ts2`:$1ts3.$1ts4"
                $clip1Rt = "$1tc1`:$1tc2`:$1tc3.$1tc4"
                $clip2ts = read-host -prompt "Input Start Time For Clip 2 (Format: XX:XX:XX:XX)"
                $2ts1,$2ts2,$2ts3,$2ts4 = $clip2ts.split(":")
                $2ts1 = [int]$2ts1
                $2ts2 = [int]$2ts2
                $2ts3 = [int]$2ts3
                $2ts4 = [int]$2ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $2ts3 = $2ts3 - 5
                    if ($2ts3 -lt 0) {
                        $2ts3 = $2ts3 + 60
                        $2ts2 = $2ts2 - 1
                    }
                }
                $clip2te = read-host -prompt "Input End Time For Clip 2 (Format: XX:XX:XX:XX)"
                $2te1,$2te2,$2te3,$2te4 = $clip2te.split(":")
                $2te1 = [int]$2te1
                $2te2 = [int]$2te2
                $2te3 = [int]$2te3
                $2te4 = [int]$2te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $2te3 = $2te3 + 5
                    if ($2te3 -ge 60) {
                        $2te3 = $2te3 - 60
                        $2te2 = $2te2 + 1
                    }
                }
                $2tc1 = $2te1 - $2ts1
                $2tc2 = $2te2 - $2ts2
                $2tc3 = $2te3 - $2ts3
                $2tc4 = $2te4 - $2ts4
                if ($2tc3 -lt 0) {
                $2tc3 = $2tc3 + 60
                $2tc2 = $2tc2 - 1
                }
                if (($2tc1.tostring().length) -eq 1) {
                $2tc1 = "0$2tc1"
                }
                if (($2tc2.tostring().length) -eq 1) {
                $2tc2 = "0$2tc2"
                }
                if (($2tc3.tostring().length) -eq 1) {
                $2tc3 = "0$2tc3"
                }
                if (($2tc4.tostring().length) -eq 1) {
                $2tc4 = "0$2tc4"
                }
                if (($2ts1.tostring().length) -eq 1) {
                $2ts1 = "0$2ts1"
                }
                if (($2ts2.tostring().length) -eq 1) {
                $2ts2 = "0$2ts2"
                }
                if (($2ts3.tostring().length) -eq 1) {
                $2ts3 = "0$2ts3"
                }
                if (($2ts4.tostring().length) -eq 1) {
                $2ts4 = "0$2ts4"
                }
                $clip2Sps = "$2ts1`:$2ts2`:$2ts3.$2ts4"
                $clip2Rt = "$2tc1`:$2tc2`:$2tc3.$2tc4"
                $clip3ts = read-host -prompt "Input Start Time For Clip 3 (Format: XX:XX:XX:XX)"
                $3ts1,$3ts2,$3ts3,$3ts4 = $clip3ts.split(":")
                $3ts1 = [int]$3ts1
                $3ts2 = [int]$3ts2
                $3ts3 = [int]$3ts3
                $3ts4 = [int]$3ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $3ts3 = $3ts3 - 5
                    if ($3ts3 -lt 0) {
                        $3ts3 = $3ts3 + 60
                        $3ts2 = $3ts2 - 1
                    }
                }
                $clip3te = read-host -prompt "Input End Time For Clip 3 (Format: XX:XX:XX:XX)"
                $3te1,$3te2,$3te3,$3te4 = $clip3te.split(":")
                $3te1 = [int]$3te1
                $3te2 = [int]$3te2
                $3te3 = [int]$3te3
                $3te4 = [int]$3te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $3te3 = $3te3 + 5
                    if ($3te3 -ge 60) {
                    $3te3 = $3te3 - 60
                    $3te2 = $3te2 + 1
                    }
                }
                $3tc1 = $3te1 - $3ts1
                $3tc2 = $3te2 - $3ts2
                $3tc3 = $3te3 - $3ts3
                $3tc4 = $3te4 - $3ts4
                if ($3tc3 -lt 0) {
                $3tc3 = $3tc3 + 60
                $3tc2 = $3tc2 - 1
                }
                if (($3tc1.tostring().length) -eq 1) {
                $3tc1 = "0$3tc1"
                }
                if (($3tc2.tostring().length) -eq 1) {
                $3tc2 = "0$3tc2"
                }
                if (($3tc3.tostring().length) -eq 1) {
                $3tc3 = "0$3tc3"
                }
                if (($3tc4.tostring().length) -eq 1) {
                $3tc4 = "0$3tc4"
                }
                if (($3ts1.tostring().length) -eq 1) {
                $3ts1 = "0$3ts1"
                }
                if (($3ts2.tostring().length) -eq 1) {
                $3ts2 = "0$3ts2"
                }
                if (($3ts3.tostring().length) -eq 1) {
                $3ts3 = "0$3ts3"
                }
                if (($3ts4.tostring().length) -eq 1) {
                $3ts4 = "0$3ts4"
                }
                $clip3Sps = "$3ts1`:$3ts2`:$3ts3.$3ts4"
                $clip3Rt = "$3tc1`:$3tc2`:$3tc3.$3tc4"
                $clip4ts = read-host -prompt "Input Start Time For Clip 4 (Format: XX:XX:XX:XX)"
                $4ts1,$4ts2,$4ts3,$4ts4 = $clip4ts.split(":")
                $4ts1 = [int]$4ts1
                $4ts2 = [int]$4ts2
                $4ts3 = [int]$4ts3
                $4ts4 = [int]$4ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $4ts3 = $4ts3 - 5
                    if ($4ts3 -lt 0) {
                        $4ts3 = $4ts3 + 60
                        $4ts2 = $4ts2 - 1
                    }
                }
                $clip4te = read-host -prompt "Input End Time For Clip 4 (Format: XX:XX:XX:XX)"
                $4te1,$4te2,$4te3,$4te4 = $clip4te.split(":")
                $4te1 = [int]$4te1
                $4te2 = [int]$4te2
                $4te3 = [int]$4te3
                $4te4 = [int]$4te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $4te3 = $4te3 + 5
                    if ($4te3 -ge 60) {
                    $4te3 = $4te3 - 60
                    $4te2 = $4te2 + 1
                    }
                }
                $4tc1 = $4te1 - $4ts1
                $4tc2 = $4te2 - $4ts2
                $4tc3 = $4te3 - $4ts3
                $4tc4 = $4te4 - $4ts4
                if ($4tc3 -lt 0) {
                $4tc3 = $4tc3 + 60
                $4tc2 = $4tc2 - 1
                }
                if (($4tc1.tostring().length) -eq 1) {
                $4tc1 = "0$4tc1"
                }
                if (($4tc2.tostring().length) -eq 1) {
                $4tc2 = "0$4tc2"
                }
                if (($4tc3.tostring().length) -eq 1) {
                $4tc3 = "0$4tc3"
                }
                if (($4tc4.tostring().length) -eq 1) {
                $4tc4 = "0$4tc4"
                }
                if (($4ts1.tostring().length) -eq 1) {
                $4ts1 = "0$4ts1"
                }
                if (($4ts2.tostring().length) -eq 1) {
                $4ts2 = "0$4ts2"
                }
                if (($4ts3.tostring().length) -eq 1) {
                $4ts3 = "0$4ts3"
                }
                if (($4ts4.tostring().length) -eq 1) {
                $4ts4 = "0$4ts4"
                }
                $clip4Sps = "$4ts1`:$4ts2`:$4ts3.$4ts4"
                $clip4Rt = "$4tc1`:$4tc2`:$4tc3.$4tc4"
                $clip5ts = read-host -prompt "Input Start Time For Clip 5 (Format: XX:XX:XX:XX)"
                $5ts1,$5ts2,$5ts3,$5ts4 = $clip5ts.split(":")
                $5ts1 = [int]$5ts1
                $5ts2 = [int]$5ts2
                $5ts3 = [int]$5ts3
                $5ts4 = [int]$5ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $5ts3 = $5ts3 - 5
                    if ($5ts3 -lt 0) {
                        $5ts3 = $5ts3 + 60
                        $5ts2 = $5ts2 - 1
                    }
                }
                $clip5te = read-host -prompt "Input End Time For Clip 5 (Format: XX:XX:XX:XX)"
                $5te1,$5te2,$5te3,$5te4 = $clip5te.split(":")
                $5te1 = [int]$5te1
                $5te2 = [int]$5te2
                $5te3 = [int]$5te3
                $5te4 = [int]$5te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $5te3 = $5te3 + 5
                    if ($5te3 -ge 60) {
                    $5te3 = $5te3 - 60
                    $5te2 = $5te2 + 1
                    }
                }
                $5tc1 = $5te1 - $5ts1
                $5tc2 = $5te2 - $5ts2
                $5tc3 = $5te3 - $5ts3
                $5tc4 = $5te4 - $5ts4
                if ($5tc3 -lt 0) {
                $5tc3 = $5tc3 + 60
                $5tc2 = $5tc2 - 1
                }
                if (($5tc1.tostring().length) -eq 1) {
                $5tc1 = "0$5tc1"
                }
                if (($5tc2.tostring().length) -eq 1) {
                $5tc2 = "0$5tc2"
                }
                if (($5tc3.tostring().length) -eq 1) {
                $5tc3 = "0$5tc3"
                }
                if (($5tc4.tostring().length) -eq 1) {
                $5tc4 = "0$5tc4"
                }
                if (($5ts1.tostring().length) -eq 1) {
                $5ts1 = "0$5ts1"
                }
                if (($5ts2.tostring().length) -eq 1) {
                $5ts2 = "0$5ts2"
                }
                if (($5ts3.tostring().length) -eq 1) {
                $5ts3 = "0$5ts3"
                }
                if (($5ts4.tostring().length) -eq 1) {
                $5ts4 = "0$5ts4"
                }
                $clip5Sps = "$5ts1`:$5ts2`:$5ts3.$5ts4"
                $clip5Rt = "$5tc1`:$5tc2`:$5tc3.$5tc4"
                $clip6ts = read-host -prompt "Input Start Time For Clip 6 (Format: XX:XX:XX:XX)"
                $6ts1,$6ts2,$6ts3,$6ts4 = $clip6ts.split(":")
                $6ts1 = [int]$6ts1
                $6ts2 = [int]$6ts2
                $6ts3 = [int]$6ts3
                $6ts4 = [int]$6ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $6ts3 = $6ts3 - 5
                    if ($6ts3 -lt 0) {
                        $6ts3 = $6ts3 + 60
                        $6ts2 = $6ts2 - 1
                    }
                }
                $clip6te = read-host -prompt "Input End Time For Clip 6 (Format: XX:XX:XX:XX)"
                $6te1,$6te2,$6te3,$6te4 = $clip6te.split(":")
                $6te1 = [int]$6te1
                $6te2 = [int]$6te2
                $6te3 = [int]$6te3
                $6te4 = [int]$6te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $6te3 = $6te3 + 5
                    if ($6te3 -ge 60) {
                    $6te3 = $6te3 - 60
                    $6te2 = $6te2 + 1
                    }
                }
                $6tc1 = $6te1 - $6ts1
                $6tc2 = $6te2 - $6ts2
                $6tc3 = $6te3 - $6ts3
                $6tc4 = $6te4 - $6ts4
                if ($6tc3 -lt 0) {
                $6tc3 = $6tc3 + 60
                $6tc2 = $6tc2 - 1
                }
                if (($6tc1.tostring().length) -eq 1) {
                $6tc1 = "0$6tc1"
                }
                if (($6tc2.tostring().length) -eq 1) {
                $6tc2 = "0$6tc2"
                }
                if (($6tc3.tostring().length) -eq 1) {
                $6tc3 = "0$6tc3"
                }
                if (($6tc4.tostring().length) -eq 1) {
                $6tc4 = "0$6tc4"
                }
                if (($6ts1.tostring().length) -eq 1) {
                $6ts1 = "0$6ts1"
                }
                if (($6ts2.tostring().length) -eq 1) {
                $6ts2 = "0$6ts2"
                }
                if (($6ts3.tostring().length) -eq 1) {
                $6ts3 = "0$6ts3"
                }
                if (($6ts4.tostring().length) -eq 1) {
                $6ts4 = "0$6ts4"
                }
                $clip6Sps = "$6ts1`:$6ts2`:$6ts3.$6ts4"
                $clip6Rt = "$6tc1`:$6tc2`:$6tc3.$6tc4"
                $glinks = youtube-dl -g --youtube-skip-dash-manifest "$inlink"
                while (!$glinks) {$glinks = youtube-dl -g --youtube-skip-dash-manifest "$inlink"}
                $glink1,$glink2 = $glinks.split(" ")
                if (!$glink2) {$glink2 = $glink1}
                ffmpeg -hide_banner -loglevel error -ss $clip1Sps -i ($glink1) -t $clip1Rt -ss $clip1Sps -i ($glink2) -t $clip1Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip2Sps -i ($glink1) -t $clip2Rt -ss $clip2Sps -i ($glink2) -t $clip2Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip3Sps -i ($glink1) -t $clip3Rt -ss $clip3Sps -i ($glink2) -t $clip3Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip4Sps -i ($glink1) -t $clip4Rt -ss $clip4Sps -i ($glink2) -t $clip4Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip5Sps -i ($glink1) -t $clip5Rt -ss $clip5Sps -i ($glink2) -t $clip5Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip6Sps -i ($glink1) -t $clip6Rt -ss $clip6Sps -i ($glink2) -t $clip6Rt "clip$clipnum.mkv"
                $needsstitching = read-host -prompt 'Do you want to stitch clips? [Y/N]'
                if ($needsstitching -eq "Y" -or $needsstitching -eq "y") {
                   &$HoloStitcher
                }
                else {
                    write-host "Clipping Complete!"    
                    return
                }
            }
            if ($miniclipnum -eq 7) {
                $clip1ts = read-host -prompt "Input Start Time For Clip 1 (Format: XX:XX:XX:XX)"
                $1ts1,$1ts2,$1ts3,$1ts4 = $clip1ts.split(":")
                $1ts1 = [int]$1ts1
                $1ts2 = [int]$1ts2
                $1ts3 = [int]$1ts3
                $1ts4 = [int]$1ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $1ts3 = $1ts3 - 5
                    if ($1ts3 -lt 0) {
                        $1ts3 = $1ts3 + 60
                        $1ts2 = $1ts2 - 1
                    }
                }
                $clip1te = read-host -prompt "Input End Time For Clip 1 (Format: XX:XX:XX:XX)"
                $1te1,$1te2,$1te3,$1te4 = $clip1te.split(":")
                $1te1 = [int]$1te1
                $1te2 = [int]$1te2
                $1te3 = [int]$1te3
                $1te4 = [int]$1te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $1te3 = $1te3 + 5
                    if ($1te3 -ge 60) {
                        $1te3 = $1te3 - 60
                        $1te2 = $1te2 + 1
                    }
                }
                $1tc1 = $1te1 - $1ts1
                $1tc2 = $1te2 - $1ts2
                $1tc3 = $1te3 - $1ts3
                $1tc4 = $1te4 - $1ts4
                if ($1tc3 -lt 0) {
                $1tc3 = $1tc3 + 60
                $1tc2 = $1tc2 - 1
                }
                if (($1tc1.tostring().length) -eq 1) {
                $1tc1 = "0$1tc1"
                }
                if (($1tc2.tostring().length) -eq 1) {
                $1tc2 = "0$1tc2"
                }
                if (($1tc3.tostring().length) -eq 1) {
                $1tc3 = "0$1tc3"
                }
                if (($1tc4.tostring().length) -eq 1) {
                $1tc4 = "0$1tc4"
                }
                if (($1ts1.tostring().length) -eq 1) {
                $1ts1 = "0$1ts1"
                }
                if (($1ts2.tostring().length) -eq 1) {
                $1ts2 = "0$1ts2"
                }
                if (($1ts3.tostring().length) -eq 1) {
                $1ts3 = "0$1ts3"
                }
                if (($1ts4.tostring().length) -eq 1) {
                $1ts4 = "0$1ts4"
                }
                $clip1Sps = "$1ts1`:$1ts2`:$1ts3.$1ts4"
                $clip1Rt = "$1tc1`:$1tc2`:$1tc3.$1tc4"
                $clip2ts = read-host -prompt "Input Start Time For Clip 2 (Format: XX:XX:XX:XX)"
                $2ts1,$2ts2,$2ts3,$2ts4 = $clip2ts.split(":")
                $2ts1 = [int]$2ts1
                $2ts2 = [int]$2ts2
                $2ts3 = [int]$2ts3
                $2ts4 = [int]$2ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $2ts3 = $2ts3 - 5
                    if ($2ts3 -lt 0) {
                        $2ts3 = $2ts3 + 60
                        $2ts2 = $2ts2 - 1
                    }
                }
                $clip2te = read-host -prompt "Input End Time For Clip 2 (Format: XX:XX:XX:XX)"
                $2te1,$2te2,$2te3,$2te4 = $clip2te.split(":")
                $2te1 = [int]$2te1
                $2te2 = [int]$2te2
                $2te3 = [int]$2te3
                $2te4 = [int]$2te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $2te3 = $2te3 + 5
                    if ($2te3 -ge 60) {
                        $2te3 = $2te3 - 60
                        $2te2 = $2te2 + 1
                    }
                }
                $2tc1 = $2te1 - $2ts1
                $2tc2 = $2te2 - $2ts2
                $2tc3 = $2te3 - $2ts3
                $2tc4 = $2te4 - $2ts4
                if ($2tc3 -lt 0) {
                $2tc3 = $2tc3 + 60
                $2tc2 = $2tc2 - 1
                }
                if (($2tc1.tostring().length) -eq 1) {
                $2tc1 = "0$2tc1"
                }
                if (($2tc2.tostring().length) -eq 1) {
                $2tc2 = "0$2tc2"
                }
                if (($2tc3.tostring().length) -eq 1) {
                $2tc3 = "0$2tc3"
                }
                if (($2tc4.tostring().length) -eq 1) {
                $2tc4 = "0$2tc4"
                }
                if (($2ts1.tostring().length) -eq 1) {
                $2ts1 = "0$2ts1"
                }
                if (($2ts2.tostring().length) -eq 1) {
                $2ts2 = "0$2ts2"
                }
                if (($2ts3.tostring().length) -eq 1) {
                $2ts3 = "0$2ts3"
                }
                if (($2ts4.tostring().length) -eq 1) {
                $2ts4 = "0$2ts4"
                }
                $clip2Sps = "$2ts1`:$2ts2`:$2ts3.$2ts4"
                $clip2Rt = "$2tc1`:$2tc2`:$2tc3.$2tc4"
                $clip3ts = read-host -prompt "Input Start Time For Clip 3 (Format: XX:XX:XX:XX)"
                $3ts1,$3ts2,$3ts3,$3ts4 = $clip3ts.split(":")
                $3ts1 = [int]$3ts1
                $3ts2 = [int]$3ts2
                $3ts3 = [int]$3ts3
                $3ts4 = [int]$3ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $3ts3 = $3ts3 - 5
                    if ($3ts3 -lt 0) {
                        $3ts3 = $3ts3 + 60
                        $3ts2 = $3ts2 - 1
                    }
                }
                $clip3te = read-host -prompt "Input End Time For Clip 3 (Format: XX:XX:XX:XX)"
                $3te1,$3te2,$3te3,$3te4 = $clip3te.split(":")
                $3te1 = [int]$3te1
                $3te2 = [int]$3te2
                $3te3 = [int]$3te3
                $3te4 = [int]$3te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $3te3 = $3te3 + 5
                    if ($3te3 -ge 60) {
                    $3te3 = $3te3 - 60
                    $3te2 = $3te2 + 1
                    }
                }
                $3tc1 = $3te1 - $3ts1
                $3tc2 = $3te2 - $3ts2
                $3tc3 = $3te3 - $3ts3
                $3tc4 = $3te4 - $3ts4
                if ($3tc3 -lt 0) {
                $3tc3 = $3tc3 + 60
                $3tc2 = $3tc2 - 1
                }
                if (($3tc1.tostring().length) -eq 1) {
                $3tc1 = "0$3tc1"
                }
                if (($3tc2.tostring().length) -eq 1) {
                $3tc2 = "0$3tc2"
                }
                if (($3tc3.tostring().length) -eq 1) {
                $3tc3 = "0$3tc3"
                }
                if (($3tc4.tostring().length) -eq 1) {
                $3tc4 = "0$3tc4"
                }
                if (($3ts1.tostring().length) -eq 1) {
                $3ts1 = "0$3ts1"
                }
                if (($3ts2.tostring().length) -eq 1) {
                $3ts2 = "0$3ts2"
                }
                if (($3ts3.tostring().length) -eq 1) {
                $3ts3 = "0$3ts3"
                }
                if (($3ts4.tostring().length) -eq 1) {
                $3ts4 = "0$3ts4"
                }
                $clip3Sps = "$3ts1`:$3ts2`:$3ts3.$3ts4"
                $clip3Rt = "$3tc1`:$3tc2`:$3tc3.$3tc4"
                $clip4ts = read-host -prompt "Input Start Time For Clip 4 (Format: XX:XX:XX:XX)"
                $4ts1,$4ts2,$4ts3,$4ts4 = $clip4ts.split(":")
                $4ts1 = [int]$4ts1
                $4ts2 = [int]$4ts2
                $4ts3 = [int]$4ts3
                $4ts4 = [int]$4ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $4ts3 = $4ts3 - 5
                    if ($4ts3 -lt 0) {
                        $4ts3 = $4ts3 + 60
                        $4ts2 = $4ts2 - 1
                    }
                }
                $clip4te = read-host -prompt "Input End Time For Clip 4 (Format: XX:XX:XX:XX)"
                $4te1,$4te2,$4te3,$4te4 = $clip4te.split(":")
                $4te1 = [int]$4te1
                $4te2 = [int]$4te2
                $4te3 = [int]$4te3
                $4te4 = [int]$4te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $4te3 = $4te3 + 5
                    if ($4te3 -ge 60) {
                    $4te3 = $4te3 - 60
                    $4te2 = $4te2 + 1
                    }
                }
                $4tc1 = $4te1 - $4ts1
                $4tc2 = $4te2 - $4ts2
                $4tc3 = $4te3 - $4ts3
                $4tc4 = $4te4 - $4ts4
                if ($4tc3 -lt 0) {
                $4tc3 = $4tc3 + 60
                $4tc2 = $4tc2 - 1
                }
                if (($4tc1.tostring().length) -eq 1) {
                $4tc1 = "0$4tc1"
                }
                if (($4tc2.tostring().length) -eq 1) {
                $4tc2 = "0$4tc2"
                }
                if (($4tc3.tostring().length) -eq 1) {
                $4tc3 = "0$4tc3"
                }
                if (($4tc4.tostring().length) -eq 1) {
                $4tc4 = "0$4tc4"
                }
                if (($4ts1.tostring().length) -eq 1) {
                $4ts1 = "0$4ts1"
                }
                if (($4ts2.tostring().length) -eq 1) {
                $4ts2 = "0$4ts2"
                }
                if (($4ts3.tostring().length) -eq 1) {
                $4ts3 = "0$4ts3"
                }
                if (($4ts4.tostring().length) -eq 1) {
                $4ts4 = "0$4ts4"
                }
                $clip4Sps = "$4ts1`:$4ts2`:$4ts3.$4ts4"
                $clip4Rt = "$4tc1`:$4tc2`:$4tc3.$4tc4"
                $clip5ts = read-host -prompt "Input Start Time For Clip 5 (Format: XX:XX:XX:XX)"
                $5ts1,$5ts2,$5ts3,$5ts4 = $clip5ts.split(":")
                $5ts1 = [int]$5ts1
                $5ts2 = [int]$5ts2
                $5ts3 = [int]$5ts3
                $5ts4 = [int]$5ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $5ts3 = $5ts3 - 5
                    if ($5ts3 -lt 0) {
                        $5ts3 = $5ts3 + 60
                        $5ts2 = $5ts2 - 1
                    }
                }
                $clip5te = read-host -prompt "Input End Time For Clip 5 (Format: XX:XX:XX:XX)"
                $5te1,$5te2,$5te3,$5te4 = $clip5te.split(":")
                $5te1 = [int]$5te1
                $5te2 = [int]$5te2
                $5te3 = [int]$5te3
                $5te4 = [int]$5te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $5te3 = $5te3 + 5
                    if ($5te3 -ge 60) {
                    $5te3 = $5te3 - 60
                    $5te2 = $5te2 + 1
                    }
                }
                $5tc1 = $5te1 - $5ts1
                $5tc2 = $5te2 - $5ts2
                $5tc3 = $5te3 - $5ts3
                $5tc4 = $5te4 - $5ts4
                if ($5tc3 -lt 0) {
                $5tc3 = $5tc3 + 60
                $5tc2 = $5tc2 - 1
                }
                if (($5tc1.tostring().length) -eq 1) {
                $5tc1 = "0$5tc1"
                }
                if (($5tc2.tostring().length) -eq 1) {
                $5tc2 = "0$5tc2"
                }
                if (($5tc3.tostring().length) -eq 1) {
                $5tc3 = "0$5tc3"
                }
                if (($5tc4.tostring().length) -eq 1) {
                $5tc4 = "0$5tc4"
                }
                if (($5ts1.tostring().length) -eq 1) {
                $5ts1 = "0$5ts1"
                }
                if (($5ts2.tostring().length) -eq 1) {
                $5ts2 = "0$5ts2"
                }
                if (($5ts3.tostring().length) -eq 1) {
                $5ts3 = "0$5ts3"
                }
                if (($5ts4.tostring().length) -eq 1) {
                $5ts4 = "0$5ts4"
                }
                $clip5Sps = "$5ts1`:$5ts2`:$5ts3.$5ts4"
                $clip5Rt = "$5tc1`:$5tc2`:$5tc3.$5tc4"
                $clip6ts = read-host -prompt "Input Start Time For Clip 6 (Format: XX:XX:XX:XX)"
                $6ts1,$6ts2,$6ts3,$6ts4 = $clip6ts.split(":")
                $6ts1 = [int]$6ts1
                $6ts2 = [int]$6ts2
                $6ts3 = [int]$6ts3
                $6ts4 = [int]$6ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $6ts3 = $6ts3 - 5
                    if ($6ts3 -lt 0) {
                        $6ts3 = $6ts3 + 60
                        $6ts2 = $6ts2 - 1
                    }
                }
                $clip6te = read-host -prompt "Input End Time For Clip 6 (Format: XX:XX:XX:XX)"
                $6te1,$6te2,$6te3,$6te4 = $clip6te.split(":")
                $6te1 = [int]$6te1
                $6te2 = [int]$6te2
                $6te3 = [int]$6te3
                $6te4 = [int]$6te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $6te3 = $6te3 + 5
                    if ($6te3 -ge 60) {
                    $6te3 = $6te3 - 60
                    $6te2 = $6te2 + 1
                    }
                }
                $6tc1 = $6te1 - $6ts1
                $6tc2 = $6te2 - $6ts2
                $6tc3 = $6te3 - $6ts3
                $6tc4 = $6te4 - $6ts4
                if ($6tc3 -lt 0) {
                $6tc3 = $6tc3 + 60
                $6tc2 = $6tc2 - 1
                }
                if (($6tc1.tostring().length) -eq 1) {
                $6tc1 = "0$6tc1"
                }
                if (($6tc2.tostring().length) -eq 1) {
                $6tc2 = "0$6tc2"
                }
                if (($6tc3.tostring().length) -eq 1) {
                $6tc3 = "0$6tc3"
                }
                if (($6tc4.tostring().length) -eq 1) {
                $6tc4 = "0$6tc4"
                }
                if (($6ts1.tostring().length) -eq 1) {
                $6ts1 = "0$6ts1"
                }
                if (($6ts2.tostring().length) -eq 1) {
                $6ts2 = "0$6ts2"
                }
                if (($6ts3.tostring().length) -eq 1) {
                $6ts3 = "0$6ts3"
                }
                if (($6ts4.tostring().length) -eq 1) {
                $6ts4 = "0$6ts4"
                }
                $clip6Sps = "$6ts1`:$6ts2`:$6ts3.$6ts4"
                $clip6Rt = "$6tc1`:$6tc2`:$6tc3.$6tc4"
                $clip7ts = read-host -prompt "Input Start Time For Clip 7 (Format: XX:XX:XX:XX)"
                $7ts1,$7ts2,$7ts3,$7ts4 = $clip7ts.split(":")
                $7ts1 = [int]$7ts1
                $7ts2 = [int]$7ts2
                $7ts3 = [int]$7ts3
                $7ts4 = [int]$7ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $7ts3 = $7ts3 - 5
                    if ($7ts3 -lt 0) {
                        $7ts3 = $7ts3 + 60
                        $7ts2 = $7ts2 - 1
                    }
                }
                $clip7te = read-host -prompt "Input End Time For Clip 7 (Format: XX:XX:XX:XX)"
                $7te1,$7te2,$7te3,$7te4 = $clip7te.split(":")
                $7te1 = [int]$7te1
                $7te2 = [int]$7te2
                $7te3 = [int]$7te3
                $7te4 = [int]$7te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $7te3 = $7te3 + 5
                    if ($7te3 -ge 60) {
                    $7te3 = $7te3 - 60
                    $7te2 = $7te2 + 1
                    }
                }
                $7tc1 = $7te1 - $7ts1
                $7tc2 = $7te2 - $7ts2
                $7tc3 = $7te3 - $7ts3
                $7tc4 = $7te4 - $7ts4
                if ($7tc3 -lt 0) {
                $7tc3 = $7tc3 + 60
                $7tc2 = $7tc2 - 1
                }
                if (($7tc1.tostring().length) -eq 1) {
                $7tc1 = "0$7tc1"
                }
                if (($7tc2.tostring().length) -eq 1) {
                $7tc2 = "0$7tc2"
                }
                if (($7tc3.tostring().length) -eq 1) {
                $7tc3 = "0$7tc3"
                }
                if (($7tc4.tostring().length) -eq 1) {
                $7tc4 = "0$7tc4"
                }
                if (($7ts1.tostring().length) -eq 1) {
                $7ts1 = "0$7ts1"
                }
                if (($7ts2.tostring().length) -eq 1) {
                $7ts2 = "0$7ts2"
                }
                if (($7ts3.tostring().length) -eq 1) {
                $7ts3 = "0$7ts3"
                }
                if (($7ts4.tostring().length) -eq 1) {
                $7ts4 = "0$7ts4"
                }
                $clip7Sps = "$7ts1`:$7ts2`:$7ts3.$7ts4"
                $clip7Rt = "$7tc1`:$7tc2`:$7tc3.$7tc4"
                $glinks = youtube-dl -g --youtube-skip-dash-manifest "$inlink"
                while (!$glinks) {$glinks = youtube-dl -g --youtube-skip-dash-manifest "$inlink"}
                $glink1,$glink2 = $glinks.split(" ")
                if (!$glink2) {$glink2 = $glink1}
                ffmpeg -hide_banner -loglevel error -ss $clip1Sps -i ($glink1) -t $clip1Rt -ss $clip1Sps -i ($glink2) -t $clip1Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip2Sps -i ($glink1) -t $clip2Rt -ss $clip2Sps -i ($glink2) -t $clip2Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip3Sps -i ($glink1) -t $clip3Rt -ss $clip3Sps -i ($glink2) -t $clip3Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip4Sps -i ($glink1) -t $clip4Rt -ss $clip4Sps -i ($glink2) -t $clip4Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip5Sps -i ($glink1) -t $clip5Rt -ss $clip5Sps -i ($glink2) -t $clip5Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip6Sps -i ($glink1) -t $clip6Rt -ss $clip6Sps -i ($glink2) -t $clip6Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip7Sps -i ($glink1) -t $clip7Rt -ss $clip7Sps -i ($glink2) -t $clip7Rt "clip$clipnum.mkv"
                $needsstitching = read-host -prompt 'Do you want to stitch clips? [Y/N]'
                if ($needsstitching -eq "Y" -or $needsstitching -eq "y") {
                   &$HoloStitcher
                }
                else {
                    write-host "Clipping Complete!"
                    return
                }
            }
            if ($miniclipnum -eq 8) {
                $clip1ts = read-host -prompt "Input Start Time For Clip 1 (Format: XX:XX:XX:XX)"
                $1ts1,$1ts2,$1ts3,$1ts4 = $clip1ts.split(":")
                $1ts1 = [int]$1ts1
                $1ts2 = [int]$1ts2
                $1ts3 = [int]$1ts3
                $1ts4 = [int]$1ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $1ts3 = $1ts3 - 5
                    if ($1ts3 -lt 0) {
                        $1ts3 = $1ts3 + 60
                        $1ts2 = $1ts2 - 1
                    }
                }
                $clip1te = read-host -prompt "Input End Time For Clip 1 (Format: XX:XX:XX:XX)"
                $1te1,$1te2,$1te3,$1te4 = $clip1te.split(":")
                $1te1 = [int]$1te1
                $1te2 = [int]$1te2
                $1te3 = [int]$1te3
                $1te4 = [int]$1te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $1te3 = $1te3 + 5
                    if ($1te3 -ge 60) {
                        $1te3 = $1te3 - 60
                        $1te2 = $1te2 + 1
                    }
                }
                $1tc1 = $1te1 - $1ts1
                $1tc2 = $1te2 - $1ts2
                $1tc3 = $1te3 - $1ts3
                $1tc4 = $1te4 - $1ts4
                if ($1tc3 -lt 0) {
                $1tc3 = $1tc3 + 60
                $1tc2 = $1tc2 - 1
                }
                if (($1tc1.tostring().length) -eq 1) {
                $1tc1 = "0$1tc1"
                }
                if (($1tc2.tostring().length) -eq 1) {
                $1tc2 = "0$1tc2"
                }
                if (($1tc3.tostring().length) -eq 1) {
                $1tc3 = "0$1tc3"
                }
                if (($1tc4.tostring().length) -eq 1) {
                $1tc4 = "0$1tc4"
                }
                if (($1ts1.tostring().length) -eq 1) {
                $1ts1 = "0$1ts1"
                }
                if (($1ts2.tostring().length) -eq 1) {
                $1ts2 = "0$1ts2"
                }
                if (($1ts3.tostring().length) -eq 1) {
                $1ts3 = "0$1ts3"
                }
                if (($1ts4.tostring().length) -eq 1) {
                $1ts4 = "0$1ts4"
                }
                $clip1Sps = "$1ts1`:$1ts2`:$1ts3.$1ts4"
                $clip1Rt = "$1tc1`:$1tc2`:$1tc3.$1tc4"
                $clip2ts = read-host -prompt "Input Start Time For Clip 2 (Format: XX:XX:XX:XX)"
                $2ts1,$2ts2,$2ts3,$2ts4 = $clip2ts.split(":")
                $2ts1 = [int]$2ts1
                $2ts2 = [int]$2ts2
                $2ts3 = [int]$2ts3
                $2ts4 = [int]$2ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $2ts3 = $2ts3 - 5
                    if ($2ts3 -lt 0) {
                        $2ts3 = $2ts3 + 60
                        $2ts2 = $2ts2 - 1
                    }
                }
                $clip2te = read-host -prompt "Input End Time For Clip 2 (Format: XX:XX:XX:XX)"
                $2te1,$2te2,$2te3,$2te4 = $clip2te.split(":")
                $2te1 = [int]$2te1
                $2te2 = [int]$2te2
                $2te3 = [int]$2te3
                $2te4 = [int]$2te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $2te3 = $2te3 + 5
                    if ($2te3 -ge 60) {
                        $2te3 = $2te3 - 60
                        $2te2 = $2te2 + 1
                    }
                }
                $2tc1 = $2te1 - $2ts1
                $2tc2 = $2te2 - $2ts2
                $2tc3 = $2te3 - $2ts3
                $2tc4 = $2te4 - $2ts4
                if ($2tc3 -lt 0) {
                $2tc3 = $2tc3 + 60
                $2tc2 = $2tc2 - 1
                }
                if (($2tc1.tostring().length) -eq 1) {
                $2tc1 = "0$2tc1"
                }
                if (($2tc2.tostring().length) -eq 1) {
                $2tc2 = "0$2tc2"
                }
                if (($2tc3.tostring().length) -eq 1) {
                $2tc3 = "0$2tc3"
                }
                if (($2tc4.tostring().length) -eq 1) {
                $2tc4 = "0$2tc4"
                }
                if (($2ts1.tostring().length) -eq 1) {
                $2ts1 = "0$2ts1"
                }
                if (($2ts2.tostring().length) -eq 1) {
                $2ts2 = "0$2ts2"
                }
                if (($2ts3.tostring().length) -eq 1) {
                $2ts3 = "0$2ts3"
                }
                if (($2ts4.tostring().length) -eq 1) {
                $2ts4 = "0$2ts4"
                }
                $clip2Sps = "$2ts1`:$2ts2`:$2ts3.$2ts4"
                $clip2Rt = "$2tc1`:$2tc2`:$2tc3.$2tc4"
                $clip3ts = read-host -prompt "Input Start Time For Clip 3 (Format: XX:XX:XX:XX)"
                $3ts1,$3ts2,$3ts3,$3ts4 = $clip3ts.split(":")
                $3ts1 = [int]$3ts1
                $3ts2 = [int]$3ts2
                $3ts3 = [int]$3ts3
                $3ts4 = [int]$3ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $3ts3 = $3ts3 - 5
                    if ($3ts3 -lt 0) {
                        $3ts3 = $3ts3 + 60
                        $3ts2 = $3ts2 - 1
                    }
                }
                $clip3te = read-host -prompt "Input End Time For Clip 3 (Format: XX:XX:XX:XX)"
                $3te1,$3te2,$3te3,$3te4 = $clip3te.split(":")
                $3te1 = [int]$3te1
                $3te2 = [int]$3te2
                $3te3 = [int]$3te3
                $3te4 = [int]$3te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $3te3 = $3te3 + 5
                    if ($3te3 -ge 60) {
                    $3te3 = $3te3 - 60
                    $3te2 = $3te2 + 1
                    }
                }
                $3tc1 = $3te1 - $3ts1
                $3tc2 = $3te2 - $3ts2
                $3tc3 = $3te3 - $3ts3
                $3tc4 = $3te4 - $3ts4
                if ($3tc3 -lt 0) {
                $3tc3 = $3tc3 + 60
                $3tc2 = $3tc2 - 1
                }
                if (($3tc1.tostring().length) -eq 1) {
                $3tc1 = "0$3tc1"
                }
                if (($3tc2.tostring().length) -eq 1) {
                $3tc2 = "0$3tc2"
                }
                if (($3tc3.tostring().length) -eq 1) {
                $3tc3 = "0$3tc3"
                }
                if (($3tc4.tostring().length) -eq 1) {
                $3tc4 = "0$3tc4"
                }
                if (($3ts1.tostring().length) -eq 1) {
                $3ts1 = "0$3ts1"
                }
                if (($3ts2.tostring().length) -eq 1) {
                $3ts2 = "0$3ts2"
                }
                if (($3ts3.tostring().length) -eq 1) {
                $3ts3 = "0$3ts3"
                }
                if (($3ts4.tostring().length) -eq 1) {
                $3ts4 = "0$3ts4"
                }
                $clip3Sps = "$3ts1`:$3ts2`:$3ts3.$3ts4"
                $clip3Rt = "$3tc1`:$3tc2`:$3tc3.$3tc4"
                $clip4ts = read-host -prompt "Input Start Time For Clip 4 (Format: XX:XX:XX:XX)"
                $4ts1,$4ts2,$4ts3,$4ts4 = $clip4ts.split(":")
                $4ts1 = [int]$4ts1
                $4ts2 = [int]$4ts2
                $4ts3 = [int]$4ts3
                $4ts4 = [int]$4ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $4ts3 = $4ts3 - 5
                    if ($4ts3 -lt 0) {
                        $4ts3 = $4ts3 + 60
                        $4ts2 = $4ts2 - 1
                    }
                }
                $clip4te = read-host -prompt "Input End Time For Clip 4 (Format: XX:XX:XX:XX)"
                $4te1,$4te2,$4te3,$4te4 = $clip4te.split(":")
                $4te1 = [int]$4te1
                $4te2 = [int]$4te2
                $4te3 = [int]$4te3
                $4te4 = [int]$4te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $4te3 = $4te3 + 5
                    if ($4te3 -ge 60) {
                    $4te3 = $4te3 - 60
                    $4te2 = $4te2 + 1
                    }
                }
                $4tc1 = $4te1 - $4ts1
                $4tc2 = $4te2 - $4ts2
                $4tc3 = $4te3 - $4ts3
                $4tc4 = $4te4 - $4ts4
                if ($4tc3 -lt 0) {
                $4tc3 = $4tc3 + 60
                $4tc2 = $4tc2 - 1
                }
                if (($4tc1.tostring().length) -eq 1) {
                $4tc1 = "0$4tc1"
                }
                if (($4tc2.tostring().length) -eq 1) {
                $4tc2 = "0$4tc2"
                }
                if (($4tc3.tostring().length) -eq 1) {
                $4tc3 = "0$4tc3"
                }
                if (($4tc4.tostring().length) -eq 1) {
                $4tc4 = "0$4tc4"
                }
                if (($4ts1.tostring().length) -eq 1) {
                $4ts1 = "0$4ts1"
                }
                if (($4ts2.tostring().length) -eq 1) {
                $4ts2 = "0$4ts2"
                }
                if (($4ts3.tostring().length) -eq 1) {
                $4ts3 = "0$4ts3"
                }
                if (($4ts4.tostring().length) -eq 1) {
                $4ts4 = "0$4ts4"
                }
                $clip4Sps = "$4ts1`:$4ts2`:$4ts3.$4ts4"
                $clip4Rt = "$4tc1`:$4tc2`:$4tc3.$4tc4"
                $clip5ts = read-host -prompt "Input Start Time For Clip 5 (Format: XX:XX:XX:XX)"
                $5ts1,$5ts2,$5ts3,$5ts4 = $clip5ts.split(":")
                $5ts1 = [int]$5ts1
                $5ts2 = [int]$5ts2
                $5ts3 = [int]$5ts3
                $5ts4 = [int]$5ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $5ts3 = $5ts3 - 5
                    if ($5ts3 -lt 0) {
                        $5ts3 = $5ts3 + 60
                        $5ts2 = $5ts2 - 1
                    }
                }
                $clip5te = read-host -prompt "Input End Time For Clip 5 (Format: XX:XX:XX:XX)"
                $5te1,$5te2,$5te3,$5te4 = $clip5te.split(":")
                $5te1 = [int]$5te1
                $5te2 = [int]$5te2
                $5te3 = [int]$5te3
                $5te4 = [int]$5te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $5te3 = $5te3 + 5
                    if ($5te3 -ge 60) {
                    $5te3 = $5te3 - 60
                    $5te2 = $5te2 + 1
                    }
                }
                $5tc1 = $5te1 - $5ts1
                $5tc2 = $5te2 - $5ts2
                $5tc3 = $5te3 - $5ts3
                $5tc4 = $5te4 - $5ts4
                if ($5tc3 -lt 0) {
                $5tc3 = $5tc3 + 60
                $5tc2 = $5tc2 - 1
                }
                if (($5tc1.tostring().length) -eq 1) {
                $5tc1 = "0$5tc1"
                }
                if (($5tc2.tostring().length) -eq 1) {
                $5tc2 = "0$5tc2"
                }
                if (($5tc3.tostring().length) -eq 1) {
                $5tc3 = "0$5tc3"
                }
                if (($5tc4.tostring().length) -eq 1) {
                $5tc4 = "0$5tc4"
                }
                if (($5ts1.tostring().length) -eq 1) {
                $5ts1 = "0$5ts1"
                }
                if (($5ts2.tostring().length) -eq 1) {
                $5ts2 = "0$5ts2"
                }
                if (($5ts3.tostring().length) -eq 1) {
                $5ts3 = "0$5ts3"
                }
                if (($5ts4.tostring().length) -eq 1) {
                $5ts4 = "0$5ts4"
                }
                $clip5Sps = "$5ts1`:$5ts2`:$5ts3.$5ts4"
                $clip5Rt = "$5tc1`:$5tc2`:$5tc3.$5tc4"
                $clip6ts = read-host -prompt "Input Start Time For Clip 6 (Format: XX:XX:XX:XX)"
                $6ts1,$6ts2,$6ts3,$6ts4 = $clip6ts.split(":")
                $6ts1 = [int]$6ts1
                $6ts2 = [int]$6ts2
                $6ts3 = [int]$6ts3
                $6ts4 = [int]$6ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $6ts3 = $6ts3 - 5
                    if ($6ts3 -lt 0) {
                        $6ts3 = $6ts3 + 60
                        $6ts2 = $6ts2 - 1
                    }
                }
                $clip6te = read-host -prompt "Input End Time For Clip 6 (Format: XX:XX:XX:XX)"
                $6te1,$6te2,$6te3,$6te4 = $clip6te.split(":")
                $6te1 = [int]$6te1
                $6te2 = [int]$6te2
                $6te3 = [int]$6te3
                $6te4 = [int]$6te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $6te3 = $6te3 + 5
                    if ($6te3 -ge 60) {
                    $6te3 = $6te3 - 60
                    $6te2 = $6te2 + 1
                    }
                }
                $6tc1 = $6te1 - $6ts1
                $6tc2 = $6te2 - $6ts2
                $6tc3 = $6te3 - $6ts3
                $6tc4 = $6te4 - $6ts4
                if ($6tc3 -lt 0) {
                $6tc3 = $6tc3 + 60
                $6tc2 = $6tc2 - 1
                }
                if (($6tc1.tostring().length) -eq 1) {
                $6tc1 = "0$6tc1"
                }
                if (($6tc2.tostring().length) -eq 1) {
                $6tc2 = "0$6tc2"
                }
                if (($6tc3.tostring().length) -eq 1) {
                $6tc3 = "0$6tc3"
                }
                if (($6tc4.tostring().length) -eq 1) {
                $6tc4 = "0$6tc4"
                }
                if (($6ts1.tostring().length) -eq 1) {
                $6ts1 = "0$6ts1"
                }
                if (($6ts2.tostring().length) -eq 1) {
                $6ts2 = "0$6ts2"
                }
                if (($6ts3.tostring().length) -eq 1) {
                $6ts3 = "0$6ts3"
                }
                if (($6ts4.tostring().length) -eq 1) {
                $6ts4 = "0$6ts4"
                }
                $clip6Sps = "$6ts1`:$6ts2`:$6ts3.$6ts4"
                $clip6Rt = "$6tc1`:$6tc2`:$6tc3.$6tc4"
                $clip7ts = read-host -prompt "Input Start Time For Clip 7 (Format: XX:XX:XX:XX)"
                $7ts1,$7ts2,$7ts3,$7ts4 = $clip7ts.split(":")
                $7ts1 = [int]$7ts1
                $7ts2 = [int]$7ts2
                $7ts3 = [int]$7ts3
                $7ts4 = [int]$7ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $7ts3 = $7ts3 - 5
                    if ($7ts3 -lt 0) {
                        $7ts3 = $7ts3 + 60
                        $7ts2 = $7ts2 - 1
                    }
                }
                $clip7te = read-host -prompt "Input End Time For Clip 7 (Format: XX:XX:XX:XX)"
                $7te1,$7te2,$7te3,$7te4 = $clip7te.split(":")
                $7te1 = [int]$7te1
                $7te2 = [int]$7te2
                $7te3 = [int]$7te3
                $7te4 = [int]$7te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $7te3 = $7te3 + 5
                    if ($7te3 -ge 60) {
                    $7te3 = $7te3 - 60
                    $7te2 = $7te2 + 1
                    }
                }
                $7tc1 = $7te1 - $7ts1
                $7tc2 = $7te2 - $7ts2
                $7tc3 = $7te3 - $7ts3
                $7tc4 = $7te4 - $7ts4
                if ($7tc3 -lt 0) {
                $7tc3 = $7tc3 + 60
                $7tc2 = $7tc2 - 1
                }
                if (($7tc1.tostring().length) -eq 1) {
                $7tc1 = "0$7tc1"
                }
                if (($7tc2.tostring().length) -eq 1) {
                $7tc2 = "0$7tc2"
                }
                if (($7tc3.tostring().length) -eq 1) {
                $7tc3 = "0$7tc3"
                }
                if (($7tc4.tostring().length) -eq 1) {
                $7tc4 = "0$7tc4"
                }
                if (($7ts1.tostring().length) -eq 1) {
                $7ts1 = "0$7ts1"
                }
                if (($7ts2.tostring().length) -eq 1) {
                $7ts2 = "0$7ts2"
                }
                if (($7ts3.tostring().length) -eq 1) {
                $7ts3 = "0$7ts3"
                }
                if (($7ts4.tostring().length) -eq 1) {
                $7ts4 = "0$7ts4"
                }
                $clip7Sps = "$7ts1`:$7ts2`:$7ts3.$7ts4"
                $clip7Rt = "$7tc1`:$7tc2`:$7tc3.$7tc4"
                $clip8ts = read-host -prompt "Input Start Time For Clip 8 (Format: XX:XX:XX:XX)"
                $8ts1,$8ts2,$8ts3,$8ts4 = $clip8ts.split(":")
                $8ts1 = [int]$8ts1
                $8ts2 = [int]$8ts2
                $8ts3 = [int]$8ts3
                $8ts4 = [int]$8ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $8ts3 = $8ts3 - 5
                    if ($8ts3 -lt 0) {
                        $8ts3 = $8ts3 + 60
                        $8ts2 = $8ts2 - 1
                    }
                }
                $clip8te = read-host -prompt "Input End Time For Clip 8 (Format: XX:XX:XX:XX)"
                $8te1,$8te2,$8te3,$8te4 = $clip8te.split(":")
                $8te1 = [int]$8te1
                $8te2 = [int]$8te2
                $8te3 = [int]$8te3
                $8te4 = [int]$8te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $8te3 = $8te3 + 5
                    if ($8te3 -ge 60) {
                    $8te3 = $8te3 - 60
                    $8te2 = $8te2 + 1
                    }
                }
                $8tc1 = $8te1 - $8ts1
                $8tc2 = $8te2 - $8ts2
                $8tc3 = $8te3 - $8ts3
                $8tc4 = $8te4 - $8ts4
                if ($8tc3 -lt 0) {
                $8tc3 = $8tc3 + 60
                $8tc2 = $8tc2 - 1
                }
                if (($8tc1.tostring().length) -eq 1) {
                $8tc1 = "0$8tc1"
                }
                if (($8tc2.tostring().length) -eq 1) {
                $8tc2 = "0$8tc2"
                }
                if (($8tc3.tostring().length) -eq 1) {
                $8tc3 = "0$8tc3"
                }
                if (($8tc4.tostring().length) -eq 1) {
                $8tc4 = "0$8tc4"
                }
                if (($8ts1.tostring().length) -eq 1) {
                $8ts1 = "0$8ts1"
                }
                if (($8ts2.tostring().length) -eq 1) {
                $8ts2 = "0$8ts2"
                }
                if (($8ts3.tostring().length) -eq 1) {
                $8ts3 = "0$8ts3"
                }
                if (($8ts4.tostring().length) -eq 1) {
                $8ts4 = "0$8ts4"
                }
                $clip8Sps = "$8ts1`:$8ts2`:$8ts3.$8ts4"
                $clip8Rt = "$8tc1`:$8tc2`:$8tc3.$8tc4"
                $glinks = youtube-dl -g --youtube-skip-dash-manifest "$inlink"
                while (!$glinks) {$glinks = youtube-dl -g --youtube-skip-dash-manifest "$inlink"}
                $glink1,$glink2 = $glinks.split(" ")
                if (!$glink2) {$glink2 = $glink1}
                ffmpeg -hide_banner -loglevel error -ss $clip1Sps -i ($glink1) -t $clip1Rt -ss $clip1Sps -i ($glink2) -t $clip1Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip2Sps -i ($glink1) -t $clip2Rt -ss $clip2Sps -i ($glink2) -t $clip2Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip3Sps -i ($glink1) -t $clip3Rt -ss $clip3Sps -i ($glink2) -t $clip3Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip4Sps -i ($glink1) -t $clip4Rt -ss $clip4Sps -i ($glink2) -t $clip4Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip5Sps -i ($glink1) -t $clip5Rt -ss $clip5Sps -i ($glink2) -t $clip5Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip6Sps -i ($glink1) -t $clip6Rt -ss $clip6Sps -i ($glink2) -t $clip6Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip7Sps -i ($glink1) -t $clip7Rt -ss $clip7Sps -i ($glink2) -t $clip7Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip8Sps -i ($glink1) -t $clip8Rt -ss $clip8Sps -i ($glink2) -t $clip8Rt "clip$clipnum.mkv"
                $needsstitching = read-host -prompt 'Do you want to stitch clips? [Y/N]'
                if ($needsstitching -eq "Y" -or $needsstitching -eq "y") {
                   &$HoloStitcher
                }
                else {
                    write-host "Clipping Complete!"    
                    return
                }
            }
            if ($miniclipnum -eq 9) {
                $clip1ts = read-host -prompt "Input Start Time For Clip 1 (Format: XX:XX:XX:XX)"
                $1ts1,$1ts2,$1ts3,$1ts4 = $clip1ts.split(":")
                $1ts1 = [int]$1ts1
                $1ts2 = [int]$1ts2
                $1ts3 = [int]$1ts3
                $1ts4 = [int]$1ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $1ts3 = $1ts3 - 5
                    if ($1ts3 -lt 0) {
                        $1ts3 = $1ts3 + 60
                        $1ts2 = $1ts2 - 1
                    }
                }
                $clip1te = read-host -prompt "Input End Time For Clip 1 (Format: XX:XX:XX:XX)"
                $1te1,$1te2,$1te3,$1te4 = $clip1te.split(":")
                $1te1 = [int]$1te1
                $1te2 = [int]$1te2
                $1te3 = [int]$1te3
                $1te4 = [int]$1te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $1te3 = $1te3 + 5
                    if ($1te3 -ge 60) {
                        $1te3 = $1te3 - 60
                        $1te2 = $1te2 + 1
                    }
                }
                $1tc1 = $1te1 - $1ts1
                $1tc2 = $1te2 - $1ts2
                $1tc3 = $1te3 - $1ts3
                $1tc4 = $1te4 - $1ts4
                if ($1tc3 -lt 0) {
                $1tc3 = $1tc3 + 60
                $1tc2 = $1tc2 - 1
                }
                if (($1tc1.tostring().length) -eq 1) {
                $1tc1 = "0$1tc1"
                }
                if (($1tc2.tostring().length) -eq 1) {
                $1tc2 = "0$1tc2"
                }
                if (($1tc3.tostring().length) -eq 1) {
                $1tc3 = "0$1tc3"
                }
                if (($1tc4.tostring().length) -eq 1) {
                $1tc4 = "0$1tc4"
                }
                if (($1ts1.tostring().length) -eq 1) {
                $1ts1 = "0$1ts1"
                }
                if (($1ts2.tostring().length) -eq 1) {
                $1ts2 = "0$1ts2"
                }
                if (($1ts3.tostring().length) -eq 1) {
                $1ts3 = "0$1ts3"
                }
                if (($1ts4.tostring().length) -eq 1) {
                $1ts4 = "0$1ts4"
                }
                $clip1Sps = "$1ts1`:$1ts2`:$1ts3.$1ts4"
                $clip1Rt = "$1tc1`:$1tc2`:$1tc3.$1tc4"
                $clip2ts = read-host -prompt "Input Start Time For Clip 2 (Format: XX:XX:XX:XX)"
                $2ts1,$2ts2,$2ts3,$2ts4 = $clip2ts.split(":")
                $2ts1 = [int]$2ts1
                $2ts2 = [int]$2ts2
                $2ts3 = [int]$2ts3
                $2ts4 = [int]$2ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $2ts3 = $2ts3 - 5
                    if ($2ts3 -lt 0) {
                        $2ts3 = $2ts3 + 60
                        $2ts2 = $2ts2 - 1
                    }
                }
                $clip2te = read-host -prompt "Input End Time For Clip 2 (Format: XX:XX:XX:XX)"
                $2te1,$2te2,$2te3,$2te4 = $clip2te.split(":")
                $2te1 = [int]$2te1
                $2te2 = [int]$2te2
                $2te3 = [int]$2te3
                $2te4 = [int]$2te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $2te3 = $2te3 + 5
                    if ($2te3 -ge 60) {
                        $2te3 = $2te3 - 60
                        $2te2 = $2te2 + 1
                    }
                }
                $2tc1 = $2te1 - $2ts1
                $2tc2 = $2te2 - $2ts2
                $2tc3 = $2te3 - $2ts3
                $2tc4 = $2te4 - $2ts4
                if ($2tc3 -lt 0) {
                $2tc3 = $2tc3 + 60
                $2tc2 = $2tc2 - 1
                }
                if (($2tc1.tostring().length) -eq 1) {
                $2tc1 = "0$2tc1"
                }
                if (($2tc2.tostring().length) -eq 1) {
                $2tc2 = "0$2tc2"
                }
                if (($2tc3.tostring().length) -eq 1) {
                $2tc3 = "0$2tc3"
                }
                if (($2tc4.tostring().length) -eq 1) {
                $2tc4 = "0$2tc4"
                }
                if (($2ts1.tostring().length) -eq 1) {
                $2ts1 = "0$2ts1"
                }
                if (($2ts2.tostring().length) -eq 1) {
                $2ts2 = "0$2ts2"
                }
                if (($2ts3.tostring().length) -eq 1) {
                $2ts3 = "0$2ts3"
                }
                if (($2ts4.tostring().length) -eq 1) {
                $2ts4 = "0$2ts4"
                }
                $clip2Sps = "$2ts1`:$2ts2`:$2ts3.$2ts4"
                $clip2Rt = "$2tc1`:$2tc2`:$2tc3.$2tc4"
                $clip3ts = read-host -prompt "Input Start Time For Clip 3 (Format: XX:XX:XX:XX)"
                $3ts1,$3ts2,$3ts3,$3ts4 = $clip3ts.split(":")
                $3ts1 = [int]$3ts1
                $3ts2 = [int]$3ts2
                $3ts3 = [int]$3ts3
                $3ts4 = [int]$3ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $3ts3 = $3ts3 - 5
                    if ($3ts3 -lt 0) {
                        $3ts3 = $3ts3 + 60
                        $3ts2 = $3ts2 - 1
                    }
                }
                $clip3te = read-host -prompt "Input End Time For Clip 3 (Format: XX:XX:XX:XX)"
                $3te1,$3te2,$3te3,$3te4 = $clip3te.split(":")
                $3te1 = [int]$3te1
                $3te2 = [int]$3te2
                $3te3 = [int]$3te3
                $3te4 = [int]$3te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $3te3 = $3te3 + 5
                    if ($3te3 -ge 60) {
                    $3te3 = $3te3 - 60
                    $3te2 = $3te2 + 1
                    }
                }
                $3tc1 = $3te1 - $3ts1
                $3tc2 = $3te2 - $3ts2
                $3tc3 = $3te3 - $3ts3
                $3tc4 = $3te4 - $3ts4
                if ($3tc3 -lt 0) {
                $3tc3 = $3tc3 + 60
                $3tc2 = $3tc2 - 1
                }
                if (($3tc1.tostring().length) -eq 1) {
                $3tc1 = "0$3tc1"
                }
                if (($3tc2.tostring().length) -eq 1) {
                $3tc2 = "0$3tc2"
                }
                if (($3tc3.tostring().length) -eq 1) {
                $3tc3 = "0$3tc3"
                }
                if (($3tc4.tostring().length) -eq 1) {
                $3tc4 = "0$3tc4"
                }
                if (($3ts1.tostring().length) -eq 1) {
                $3ts1 = "0$3ts1"
                }
                if (($3ts2.tostring().length) -eq 1) {
                $3ts2 = "0$3ts2"
                }
                if (($3ts3.tostring().length) -eq 1) {
                $3ts3 = "0$3ts3"
                }
                if (($3ts4.tostring().length) -eq 1) {
                $3ts4 = "0$3ts4"
                }
                $clip3Sps = "$3ts1`:$3ts2`:$3ts3.$3ts4"
                $clip3Rt = "$3tc1`:$3tc2`:$3tc3.$3tc4"
                $clip4ts = read-host -prompt "Input Start Time For Clip 4 (Format: XX:XX:XX:XX)"
                $4ts1,$4ts2,$4ts3,$4ts4 = $clip4ts.split(":")
                $4ts1 = [int]$4ts1
                $4ts2 = [int]$4ts2
                $4ts3 = [int]$4ts3
                $4ts4 = [int]$4ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $4ts3 = $4ts3 - 5
                    if ($4ts3 -lt 0) {
                        $4ts3 = $4ts3 + 60
                        $4ts2 = $4ts2 - 1
                    }
                }
                $clip4te = read-host -prompt "Input End Time For Clip 4 (Format: XX:XX:XX:XX)"
                $4te1,$4te2,$4te3,$4te4 = $clip4te.split(":")
                $4te1 = [int]$4te1
                $4te2 = [int]$4te2
                $4te3 = [int]$4te3
                $4te4 = [int]$4te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $4te3 = $4te3 + 5
                    if ($4te3 -ge 60) {
                    $4te3 = $4te3 - 60
                    $4te2 = $4te2 + 1
                    }
                }
                $4tc1 = $4te1 - $4ts1
                $4tc2 = $4te2 - $4ts2
                $4tc3 = $4te3 - $4ts3
                $4tc4 = $4te4 - $4ts4
                if ($4tc3 -lt 0) {
                $4tc3 = $4tc3 + 60
                $4tc2 = $4tc2 - 1
                }
                if (($4tc1.tostring().length) -eq 1) {
                $4tc1 = "0$4tc1"
                }
                if (($4tc2.tostring().length) -eq 1) {
                $4tc2 = "0$4tc2"
                }
                if (($4tc3.tostring().length) -eq 1) {
                $4tc3 = "0$4tc3"
                }
                if (($4tc4.tostring().length) -eq 1) {
                $4tc4 = "0$4tc4"
                }
                if (($4ts1.tostring().length) -eq 1) {
                $4ts1 = "0$4ts1"
                }
                if (($4ts2.tostring().length) -eq 1) {
                $4ts2 = "0$4ts2"
                }
                if (($4ts3.tostring().length) -eq 1) {
                $4ts3 = "0$4ts3"
                }
                if (($4ts4.tostring().length) -eq 1) {
                $4ts4 = "0$4ts4"
                }
                $clip4Sps = "$4ts1`:$4ts2`:$4ts3.$4ts4"
                $clip4Rt = "$4tc1`:$4tc2`:$4tc3.$4tc4"
                $clip5ts = read-host -prompt "Input Start Time For Clip 5 (Format: XX:XX:XX:XX)"
                $5ts1,$5ts2,$5ts3,$5ts4 = $clip5ts.split(":")
                $5ts1 = [int]$5ts1
                $5ts2 = [int]$5ts2
                $5ts3 = [int]$5ts3
                $5ts4 = [int]$5ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $5ts3 = $5ts3 - 5
                    if ($5ts3 -lt 0) {
                        $5ts3 = $5ts3 + 60
                        $5ts2 = $5ts2 - 1
                    }
                }
                $clip5te = read-host -prompt "Input End Time For Clip 5 (Format: XX:XX:XX:XX)"
                $5te1,$5te2,$5te3,$5te4 = $clip5te.split(":")
                $5te1 = [int]$5te1
                $5te2 = [int]$5te2
                $5te3 = [int]$5te3
                $5te4 = [int]$5te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $5te3 = $5te3 + 5
                    if ($5te3 -ge 60) {
                    $5te3 = $5te3 - 60
                    $5te2 = $5te2 + 1
                    }
                }
                $5tc1 = $5te1 - $5ts1
                $5tc2 = $5te2 - $5ts2
                $5tc3 = $5te3 - $5ts3
                $5tc4 = $5te4 - $5ts4
                if ($5tc3 -lt 0) {
                $5tc3 = $5tc3 + 60
                $5tc2 = $5tc2 - 1
                }
                if (($5tc1.tostring().length) -eq 1) {
                $5tc1 = "0$5tc1"
                }
                if (($5tc2.tostring().length) -eq 1) {
                $5tc2 = "0$5tc2"
                }
                if (($5tc3.tostring().length) -eq 1) {
                $5tc3 = "0$5tc3"
                }
                if (($5tc4.tostring().length) -eq 1) {
                $5tc4 = "0$5tc4"
                }
                if (($5ts1.tostring().length) -eq 1) {
                $5ts1 = "0$5ts1"
                }
                if (($5ts2.tostring().length) -eq 1) {
                $5ts2 = "0$5ts2"
                }
                if (($5ts3.tostring().length) -eq 1) {
                $5ts3 = "0$5ts3"
                }
                if (($5ts4.tostring().length) -eq 1) {
                $5ts4 = "0$5ts4"
                }
                $clip5Sps = "$5ts1`:$5ts2`:$5ts3.$5ts4"
                $clip5Rt = "$5tc1`:$5tc2`:$5tc3.$5tc4"
                $clip6ts = read-host -prompt "Input Start Time For Clip 6 (Format: XX:XX:XX:XX)"
                $6ts1,$6ts2,$6ts3,$6ts4 = $clip6ts.split(":")
                $6ts1 = [int]$6ts1
                $6ts2 = [int]$6ts2
                $6ts3 = [int]$6ts3
                $6ts4 = [int]$6ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $6ts3 = $6ts3 - 5
                    if ($6ts3 -lt 0) {
                        $6ts3 = $6ts3 + 60
                        $6ts2 = $6ts2 - 1
                    }
                }
                $clip6te = read-host -prompt "Input End Time For Clip 6 (Format: XX:XX:XX:XX)"
                $6te1,$6te2,$6te3,$6te4 = $clip6te.split(":")
                $6te1 = [int]$6te1
                $6te2 = [int]$6te2
                $6te3 = [int]$6te3
                $6te4 = [int]$6te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $6te3 = $6te3 + 5
                    if ($6te3 -ge 60) {
                    $6te3 = $6te3 - 60
                    $6te2 = $6te2 + 1
                    }
                }
                $6tc1 = $6te1 - $6ts1
                $6tc2 = $6te2 - $6ts2
                $6tc3 = $6te3 - $6ts3
                $6tc4 = $6te4 - $6ts4
                if ($6tc3 -lt 0) {
                $6tc3 = $6tc3 + 60
                $6tc2 = $6tc2 - 1
                }
                if (($6tc1.tostring().length) -eq 1) {
                $6tc1 = "0$6tc1"
                }
                if (($6tc2.tostring().length) -eq 1) {
                $6tc2 = "0$6tc2"
                }
                if (($6tc3.tostring().length) -eq 1) {
                $6tc3 = "0$6tc3"
                }
                if (($6tc4.tostring().length) -eq 1) {
                $6tc4 = "0$6tc4"
                }
                if (($6ts1.tostring().length) -eq 1) {
                $6ts1 = "0$6ts1"
                }
                if (($6ts2.tostring().length) -eq 1) {
                $6ts2 = "0$6ts2"
                }
                if (($6ts3.tostring().length) -eq 1) {
                $6ts3 = "0$6ts3"
                }
                if (($6ts4.tostring().length) -eq 1) {
                $6ts4 = "0$6ts4"
                }
                $clip6Sps = "$6ts1`:$6ts2`:$6ts3.$6ts4"
                $clip6Rt = "$6tc1`:$6tc2`:$6tc3.$6tc4"
                $clip7ts = read-host -prompt "Input Start Time For Clip 7 (Format: XX:XX:XX:XX)"
                $7ts1,$7ts2,$7ts3,$7ts4 = $clip7ts.split(":")
                $7ts1 = [int]$7ts1
                $7ts2 = [int]$7ts2
                $7ts3 = [int]$7ts3
                $7ts4 = [int]$7ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $7ts3 = $7ts3 - 5
                    if ($7ts3 -lt 0) {
                        $7ts3 = $7ts3 + 60
                        $7ts2 = $7ts2 - 1
                    }
                }
                $clip7te = read-host -prompt "Input End Time For Clip 7 (Format: XX:XX:XX:XX)"
                $7te1,$7te2,$7te3,$7te4 = $clip7te.split(":")
                $7te1 = [int]$7te1
                $7te2 = [int]$7te2
                $7te3 = [int]$7te3
                $7te4 = [int]$7te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $7te3 = $7te3 + 5
                    if ($7te3 -ge 60) {
                    $7te3 = $7te3 - 60
                    $7te2 = $7te2 + 1
                    }
                }
                $7tc1 = $7te1 - $7ts1
                $7tc2 = $7te2 - $7ts2
                $7tc3 = $7te3 - $7ts3
                $7tc4 = $7te4 - $7ts4
                if ($7tc3 -lt 0) {
                $7tc3 = $7tc3 + 60
                $7tc2 = $7tc2 - 1
                }
                if (($7tc1.tostring().length) -eq 1) {
                $7tc1 = "0$7tc1"
                }
                if (($7tc2.tostring().length) -eq 1) {
                $7tc2 = "0$7tc2"
                }
                if (($7tc3.tostring().length) -eq 1) {
                $7tc3 = "0$7tc3"
                }
                if (($7tc4.tostring().length) -eq 1) {
                $7tc4 = "0$7tc4"
                }
                if (($7ts1.tostring().length) -eq 1) {
                $7ts1 = "0$7ts1"
                }
                if (($7ts2.tostring().length) -eq 1) {
                $7ts2 = "0$7ts2"
                }
                if (($7ts3.tostring().length) -eq 1) {
                $7ts3 = "0$7ts3"
                }
                if (($7ts4.tostring().length) -eq 1) {
                $7ts4 = "0$7ts4"
                }
                $clip7Sps = "$7ts1`:$7ts2`:$7ts3.$7ts4"
                $clip7Rt = "$7tc1`:$7tc2`:$7tc3.$7tc4"
                $clip8ts = read-host -prompt "Input Start Time For Clip 8 (Format: XX:XX:XX:XX)"
                $8ts1,$8ts2,$8ts3,$8ts4 = $clip8ts.split(":")
                $8ts1 = [int]$8ts1
                $8ts2 = [int]$8ts2
                $8ts3 = [int]$8ts3
                $8ts4 = [int]$8ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $8ts3 = $8ts3 - 5
                    if ($8ts3 -lt 0) {
                        $8ts3 = $8ts3 + 60
                        $8ts2 = $8ts2 - 1
                    }
                }
                $clip8te = read-host -prompt "Input End Time For Clip 8 (Format: XX:XX:XX:XX)"
                $8te1,$8te2,$8te3,$8te4 = $clip8te.split(":")
                $8te1 = [int]$8te1
                $8te2 = [int]$8te2
                $8te3 = [int]$8te3
                $8te4 = [int]$8te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $8te3 = $8te3 + 5
                    if ($8te3 -ge 60) {
                    $8te3 = $8te3 - 60
                    $8te2 = $8te2 + 1
                    }
                }
                $8tc1 = $8te1 - $8ts1
                $8tc2 = $8te2 - $8ts2
                $8tc3 = $8te3 - $8ts3
                $8tc4 = $8te4 - $8ts4
                if ($8tc3 -lt 0) {
                $8tc3 = $8tc3 + 60
                $8tc2 = $8tc2 - 1
                }
                if (($8tc1.tostring().length) -eq 1) {
                $8tc1 = "0$8tc1"
                }
                if (($8tc2.tostring().length) -eq 1) {
                $8tc2 = "0$8tc2"
                }
                if (($8tc3.tostring().length) -eq 1) {
                $8tc3 = "0$8tc3"
                }
                if (($8tc4.tostring().length) -eq 1) {
                $8tc4 = "0$8tc4"
                }
                if (($8ts1.tostring().length) -eq 1) {
                $8ts1 = "0$8ts1"
                }
                if (($8ts2.tostring().length) -eq 1) {
                $8ts2 = "0$8ts2"
                }
                if (($8ts3.tostring().length) -eq 1) {
                $8ts3 = "0$8ts3"
                }
                if (($8ts4.tostring().length) -eq 1) {
                $8ts4 = "0$8ts4"
                }
                $clip8Sps = "$8ts1`:$8ts2`:$8ts3.$8ts4"
                $clip8Rt = "$8tc1`:$8tc2`:$8tc3.$8tc4"
                $clip9ts = read-host -prompt "Input Start Time For Clip 9 (Format: XX:XX:XX:XX)"
                $9ts1,$9ts2,$9ts3,$9ts4 = $clip9ts.split(":")
                $9ts1 = [int]$9ts1
                $9ts2 = [int]$9ts2
                $9ts3 = [int]$9ts3
                $9ts4 = [int]$9ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $9ts3 = $9ts3 - 5
                    if ($9ts3 -lt 0) {
                        $9ts3 = $9ts3 + 60
                        $9ts2 = $9ts2 - 1
                    }
                }
                $clip9te = read-host -prompt "Input End Time For Clip 9 (Format: XX:XX:XX:XX)"
                $9te1,$9te2,$9te3,$9te4 = $clip9te.split(":")
                $9te1 = [int]$9te1
                $9te2 = [int]$9te2
                $9te3 = [int]$9te3
                $9te4 = [int]$9te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $9te3 = $9te3 + 5
                    if ($9te3 -ge 60) {
                    $9te3 = $9te3 - 60
                    $9te2 = $9te2 + 1
                    }
                }
                $9tc1 = $9te1 - $9ts1
                $9tc2 = $9te2 - $9ts2
                $9tc3 = $9te3 - $9ts3
                $9tc4 = $9te4 - $9ts4
                if ($9tc3 -lt 0) {
                $9tc3 = $9tc3 + 60
                $9tc2 = $9tc2 - 1
                }
                if (($9tc1.tostring().length) -eq 1) {
                $9tc1 = "0$9tc1"
                }
                if (($9tc2.tostring().length) -eq 1) {
                $9tc2 = "0$9tc2"
                }
                if (($9tc3.tostring().length) -eq 1) {
                $9tc3 = "0$9tc3"
                }
                if (($9tc4.tostring().length) -eq 1) {
                $9tc4 = "0$9tc4"
                }
                if (($9ts1.tostring().length) -eq 1) {
                $9ts1 = "0$9ts1"
                }
                if (($9ts2.tostring().length) -eq 1) {
                $9ts2 = "0$9ts2"
                }
                if (($9ts3.tostring().length) -eq 1) {
                $9ts3 = "0$9ts3"
                }
                if (($9ts4.tostring().length) -eq 1) {
                $9ts4 = "0$9ts4"
                }
                $clip9Sps = "$9ts1`:$9ts2`:$9ts3.$9ts4"
                $clip9Rt = "$9tc1`:$9tc2`:$9tc3.$9tc4"
                $glinks = youtube-dl -g --youtube-skip-dash-manifest "$inlink"
                while (!$glinks) {$glinks = youtube-dl -g --youtube-skip-dash-manifest "$inlink"}
                $glink1,$glink2 = $glinks.split(" ")
                if (!$glink2) {$glink2 = $glink1}
                ffmpeg -hide_banner -loglevel error -ss $clip1Sps -i ($glink1) -t $clip1Rt -ss $clip1Sps -i ($glink2) -t $clip1Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip2Sps -i ($glink1) -t $clip2Rt -ss $clip2Sps -i ($glink2) -t $clip2Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip3Sps -i ($glink1) -t $clip3Rt -ss $clip3Sps -i ($glink2) -t $clip3Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip4Sps -i ($glink1) -t $clip4Rt -ss $clip4Sps -i ($glink2) -t $clip4Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip5Sps -i ($glink1) -t $clip5Rt -ss $clip5Sps -i ($glink2) -t $clip5Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip6Sps -i ($glink1) -t $clip6Rt -ss $clip6Sps -i ($glink2) -t $clip6Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip7Sps -i ($glink1) -t $clip7Rt -ss $clip7Sps -i ($glink2) -t $clip7Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip8Sps -i ($glink1) -t $clip8Rt -ss $clip8Sps -i ($glink2) -t $clip8Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip9Sps -i ($glink1) -t $clip9Rt -ss $clip9Sps -i ($glink2) -t $clip9Rt "clip$clipnum.mkv"
                $needsstitching = read-host -prompt 'Do you want to stitch clips? [Y/N]'
                if ($needsstitching -eq "Y" -or $needsstitching -eq "y") {
                   &$HoloStitcher
                }
                else {
                    write-host "Clipping Complete!"    
                    return
                }
            }
            if ($miniclipnum -eq 10) {
                $clip1ts = read-host -prompt "Input Start Time For Clip 1 (Format: XX:XX:XX:XX)"
                $1ts1,$1ts2,$1ts3,$1ts4 = $clip1ts.split(":")
                $1ts1 = [int]$1ts1
                $1ts2 = [int]$1ts2
                $1ts3 = [int]$1ts3
                $1ts4 = [int]$1ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $1ts3 = $1ts3 - 5
                    if ($1ts3 -lt 0) {
                        $1ts3 = $1ts3 + 60
                        $1ts2 = $1ts2 - 1
                    }
                }
                $clip1te = read-host -prompt "Input End Time For Clip 1 (Format: XX:XX:XX:XX)"
                $1te1,$1te2,$1te3,$1te4 = $clip1te.split(":")
                $1te1 = [int]$1te1
                $1te2 = [int]$1te2
                $1te3 = [int]$1te3
                $1te4 = [int]$1te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $1te3 = $1te3 + 5
                    if ($1te3 -ge 60) {
                        $1te3 = $1te3 - 60
                        $1te2 = $1te2 + 1
                    }
                }
                $1tc1 = $1te1 - $1ts1
                $1tc2 = $1te2 - $1ts2
                $1tc3 = $1te3 - $1ts3
                $1tc4 = $1te4 - $1ts4
                if ($1tc3 -lt 0) {
                $1tc3 = $1tc3 + 60
                $1tc2 = $1tc2 - 1
                }
                if (($1tc1.tostring().length) -eq 1) {
                $1tc1 = "0$1tc1"
                }
                if (($1tc2.tostring().length) -eq 1) {
                $1tc2 = "0$1tc2"
                }
                if (($1tc3.tostring().length) -eq 1) {
                $1tc3 = "0$1tc3"
                }
                if (($1tc4.tostring().length) -eq 1) {
                $1tc4 = "0$1tc4"
                }
                if (($1ts1.tostring().length) -eq 1) {
                $1ts1 = "0$1ts1"
                }
                if (($1ts2.tostring().length) -eq 1) {
                $1ts2 = "0$1ts2"
                }
                if (($1ts3.tostring().length) -eq 1) {
                $1ts3 = "0$1ts3"
                }
                if (($1ts4.tostring().length) -eq 1) {
                $1ts4 = "0$1ts4"
                }
                $clip1Sps = "$1ts1`:$1ts2`:$1ts3.$1ts4"
                $clip1Rt = "$1tc1`:$1tc2`:$1tc3.$1tc4"
                $clip2ts = read-host -prompt "Input Start Time For Clip 2 (Format: XX:XX:XX:XX)"
                $2ts1,$2ts2,$2ts3,$2ts4 = $clip2ts.split(":")
                $2ts1 = [int]$2ts1
                $2ts2 = [int]$2ts2
                $2ts3 = [int]$2ts3
                $2ts4 = [int]$2ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $2ts3 = $2ts3 - 5
                    if ($2ts3 -lt 0) {
                        $2ts3 = $2ts3 + 60
                        $2ts2 = $2ts2 - 1
                    }
                }
                $clip2te = read-host -prompt "Input End Time For Clip 2 (Format: XX:XX:XX:XX)"
                $2te1,$2te2,$2te3,$2te4 = $clip2te.split(":")
                $2te1 = [int]$2te1
                $2te2 = [int]$2te2
                $2te3 = [int]$2te3
                $2te4 = [int]$2te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $2te3 = $2te3 + 5
                    if ($2te3 -ge 60) {
                        $2te3 = $2te3 - 60
                        $2te2 = $2te2 + 1
                    }
                }
                $2tc1 = $2te1 - $2ts1
                $2tc2 = $2te2 - $2ts2
                $2tc3 = $2te3 - $2ts3
                $2tc4 = $2te4 - $2ts4
                if ($2tc3 -lt 0) {
                $2tc3 = $2tc3 + 60
                $2tc2 = $2tc2 - 1
                }
                if (($2tc1.tostring().length) -eq 1) {
                $2tc1 = "0$2tc1"
                }
                if (($2tc2.tostring().length) -eq 1) {
                $2tc2 = "0$2tc2"
                }
                if (($2tc3.tostring().length) -eq 1) {
                $2tc3 = "0$2tc3"
                }
                if (($2tc4.tostring().length) -eq 1) {
                $2tc4 = "0$2tc4"
                }
                if (($2ts1.tostring().length) -eq 1) {
                $2ts1 = "0$2ts1"
                }
                if (($2ts2.tostring().length) -eq 1) {
                $2ts2 = "0$2ts2"
                }
                if (($2ts3.tostring().length) -eq 1) {
                $2ts3 = "0$2ts3"
                }
                if (($2ts4.tostring().length) -eq 1) {
                $2ts4 = "0$2ts4"
                }
                $clip2Sps = "$2ts1`:$2ts2`:$2ts3.$2ts4"
                $clip2Rt = "$2tc1`:$2tc2`:$2tc3.$2tc4"
                $clip3ts = read-host -prompt "Input Start Time For Clip 3 (Format: XX:XX:XX:XX)"
                $3ts1,$3ts2,$3ts3,$3ts4 = $clip3ts.split(":")
                $3ts1 = [int]$3ts1
                $3ts2 = [int]$3ts2
                $3ts3 = [int]$3ts3
                $3ts4 = [int]$3ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $3ts3 = $3ts3 - 5
                    if ($3ts3 -lt 0) {
                        $3ts3 = $3ts3 + 60
                        $3ts2 = $3ts2 - 1
                    }
                }
                $clip3te = read-host -prompt "Input End Time For Clip 3 (Format: XX:XX:XX:XX)"
                $3te1,$3te2,$3te3,$3te4 = $clip3te.split(":")
                $3te1 = [int]$3te1
                $3te2 = [int]$3te2
                $3te3 = [int]$3te3
                $3te4 = [int]$3te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $3te3 = $3te3 + 5
                    if ($3te3 -ge 60) {
                    $3te3 = $3te3 - 60
                    $3te2 = $3te2 + 1
                    }
                }
                $3tc1 = $3te1 - $3ts1
                $3tc2 = $3te2 - $3ts2
                $3tc3 = $3te3 - $3ts3
                $3tc4 = $3te4 - $3ts4
                if ($3tc3 -lt 0) {
                $3tc3 = $3tc3 + 60
                $3tc2 = $3tc2 - 1
                }
                if (($3tc1.tostring().length) -eq 1) {
                $3tc1 = "0$3tc1"
                }
                if (($3tc2.tostring().length) -eq 1) {
                $3tc2 = "0$3tc2"
                }
                if (($3tc3.tostring().length) -eq 1) {
                $3tc3 = "0$3tc3"
                }
                if (($3tc4.tostring().length) -eq 1) {
                $3tc4 = "0$3tc4"
                }
                if (($3ts1.tostring().length) -eq 1) {
                $3ts1 = "0$3ts1"
                }
                if (($3ts2.tostring().length) -eq 1) {
                $3ts2 = "0$3ts2"
                }
                if (($3ts3.tostring().length) -eq 1) {
                $3ts3 = "0$3ts3"
                }
                if (($3ts4.tostring().length) -eq 1) {
                $3ts4 = "0$3ts4"
                }
                $clip3Sps = "$3ts1`:$3ts2`:$3ts3.$3ts4"
                $clip3Rt = "$3tc1`:$3tc2`:$3tc3.$3tc4"
                $clip4ts = read-host -prompt "Input Start Time For Clip 4 (Format: XX:XX:XX:XX)"
                $4ts1,$4ts2,$4ts3,$4ts4 = $clip4ts.split(":")
                $4ts1 = [int]$4ts1
                $4ts2 = [int]$4ts2
                $4ts3 = [int]$4ts3
                $4ts4 = [int]$4ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $4ts3 = $4ts3 - 5
                    if ($4ts3 -lt 0) {
                        $4ts3 = $4ts3 + 60
                        $4ts2 = $4ts2 - 1
                    }
                }
                $clip4te = read-host -prompt "Input End Time For Clip 4 (Format: XX:XX:XX:XX)"
                $4te1,$4te2,$4te3,$4te4 = $clip4te.split(":")
                $4te1 = [int]$4te1
                $4te2 = [int]$4te2
                $4te3 = [int]$4te3
                $4te4 = [int]$4te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $4te3 = $4te3 + 5
                    if ($4te3 -ge 60) {
                    $4te3 = $4te3 - 60
                    $4te2 = $4te2 + 1
                    }
                }
                $4tc1 = $4te1 - $4ts1
                $4tc2 = $4te2 - $4ts2
                $4tc3 = $4te3 - $4ts3
                $4tc4 = $4te4 - $4ts4
                if ($4tc3 -lt 0) {
                $4tc3 = $4tc3 + 60
                $4tc2 = $4tc2 - 1
                }
                if (($4tc1.tostring().length) -eq 1) {
                $4tc1 = "0$4tc1"
                }
                if (($4tc2.tostring().length) -eq 1) {
                $4tc2 = "0$4tc2"
                }
                if (($4tc3.tostring().length) -eq 1) {
                $4tc3 = "0$4tc3"
                }
                if (($4tc4.tostring().length) -eq 1) {
                $4tc4 = "0$4tc4"
                }
                if (($4ts1.tostring().length) -eq 1) {
                $4ts1 = "0$4ts1"
                }
                if (($4ts2.tostring().length) -eq 1) {
                $4ts2 = "0$4ts2"
                }
                if (($4ts3.tostring().length) -eq 1) {
                $4ts3 = "0$4ts3"
                }
                if (($4ts4.tostring().length) -eq 1) {
                $4ts4 = "0$4ts4"
                }
                $clip4Sps = "$4ts1`:$4ts2`:$4ts3.$4ts4"
                $clip4Rt = "$4tc1`:$4tc2`:$4tc3.$4tc4"
                $clip5ts = read-host -prompt "Input Start Time For Clip 5 (Format: XX:XX:XX:XX)"
                $5ts1,$5ts2,$5ts3,$5ts4 = $clip5ts.split(":")
                $5ts1 = [int]$5ts1
                $5ts2 = [int]$5ts2
                $5ts3 = [int]$5ts3
                $5ts4 = [int]$5ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $5ts3 = $5ts3 - 5
                    if ($5ts3 -lt 0) {
                        $5ts3 = $5ts3 + 60
                        $5ts2 = $5ts2 - 1
                    }
                }
                $clip5te = read-host -prompt "Input End Time For Clip 5 (Format: XX:XX:XX:XX)"
                $5te1,$5te2,$5te3,$5te4 = $clip5te.split(":")
                $5te1 = [int]$5te1
                $5te2 = [int]$5te2
                $5te3 = [int]$5te3
                $5te4 = [int]$5te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $5te3 = $5te3 + 5
                    if ($5te3 -ge 60) {
                    $5te3 = $5te3 - 60
                    $5te2 = $5te2 + 1
                    }
                }
                $5tc1 = $5te1 - $5ts1
                $5tc2 = $5te2 - $5ts2
                $5tc3 = $5te3 - $5ts3
                $5tc4 = $5te4 - $5ts4
                if ($5tc3 -lt 0) {
                $5tc3 = $5tc3 + 60
                $5tc2 = $5tc2 - 1
                }
                if (($5tc1.tostring().length) -eq 1) {
                $5tc1 = "0$5tc1"
                }
                if (($5tc2.tostring().length) -eq 1) {
                $5tc2 = "0$5tc2"
                }
                if (($5tc3.tostring().length) -eq 1) {
                $5tc3 = "0$5tc3"
                }
                if (($5tc4.tostring().length) -eq 1) {
                $5tc4 = "0$5tc4"
                }
                if (($5ts1.tostring().length) -eq 1) {
                $5ts1 = "0$5ts1"
                }
                if (($5ts2.tostring().length) -eq 1) {
                $5ts2 = "0$5ts2"
                }
                if (($5ts3.tostring().length) -eq 1) {
                $5ts3 = "0$5ts3"
                }
                if (($5ts4.tostring().length) -eq 1) {
                $5ts4 = "0$5ts4"
                }
                $clip5Sps = "$5ts1`:$5ts2`:$5ts3.$5ts4"
                $clip5Rt = "$5tc1`:$5tc2`:$5tc3.$5tc4"
                $clip6ts = read-host -prompt "Input Start Time For Clip 6 (Format: XX:XX:XX:XX)"
                $6ts1,$6ts2,$6ts3,$6ts4 = $clip6ts.split(":")
                $6ts1 = [int]$6ts1
                $6ts2 = [int]$6ts2
                $6ts3 = [int]$6ts3
                $6ts4 = [int]$6ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $6ts3 = $6ts3 - 5
                    if ($6ts3 -lt 0) {
                        $6ts3 = $6ts3 + 60
                        $6ts2 = $6ts2 - 1
                    }
                }
                $clip6te = read-host -prompt "Input End Time For Clip 6 (Format: XX:XX:XX:XX)"
                $6te1,$6te2,$6te3,$6te4 = $clip6te.split(":")
                $6te1 = [int]$6te1
                $6te2 = [int]$6te2
                $6te3 = [int]$6te3
                $6te4 = [int]$6te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $6te3 = $6te3 + 5
                    if ($6te3 -ge 60) {
                    $6te3 = $6te3 - 60
                    $6te2 = $6te2 + 1
                    }
                }
                $6tc1 = $6te1 - $6ts1
                $6tc2 = $6te2 - $6ts2
                $6tc3 = $6te3 - $6ts3
                $6tc4 = $6te4 - $6ts4
                if ($6tc3 -lt 0) {
                $6tc3 = $6tc3 + 60
                $6tc2 = $6tc2 - 1
                }
                if (($6tc1.tostring().length) -eq 1) {
                $6tc1 = "0$6tc1"
                }
                if (($6tc2.tostring().length) -eq 1) {
                $6tc2 = "0$6tc2"
                }
                if (($6tc3.tostring().length) -eq 1) {
                $6tc3 = "0$6tc3"
                }
                if (($6tc4.tostring().length) -eq 1) {
                $6tc4 = "0$6tc4"
                }
                if (($6ts1.tostring().length) -eq 1) {
                $6ts1 = "0$6ts1"
                }
                if (($6ts2.tostring().length) -eq 1) {
                $6ts2 = "0$6ts2"
                }
                if (($6ts3.tostring().length) -eq 1) {
                $6ts3 = "0$6ts3"
                }
                if (($6ts4.tostring().length) -eq 1) {
                $6ts4 = "0$6ts4"
                }
                $clip6Sps = "$6ts1`:$6ts2`:$6ts3.$6ts4"
                $clip6Rt = "$6tc1`:$6tc2`:$6tc3.$6tc4"
                $clip7ts = read-host -prompt "Input Start Time For Clip 7 (Format: XX:XX:XX:XX)"
                $7ts1,$7ts2,$7ts3,$7ts4 = $clip7ts.split(":")
                $7ts1 = [int]$7ts1
                $7ts2 = [int]$7ts2
                $7ts3 = [int]$7ts3
                $7ts4 = [int]$7ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $7ts3 = $7ts3 - 5
                    if ($7ts3 -lt 0) {
                        $7ts3 = $7ts3 + 60
                        $7ts2 = $7ts2 - 1
                    }
                }
                $clip7te = read-host -prompt "Input End Time For Clip 7 (Format: XX:XX:XX:XX)"
                $7te1,$7te2,$7te3,$7te4 = $clip7te.split(":")
                $7te1 = [int]$7te1
                $7te2 = [int]$7te2
                $7te3 = [int]$7te3
                $7te4 = [int]$7te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $7te3 = $7te3 + 5
                    if ($7te3 -ge 60) {
                    $7te3 = $7te3 - 60
                    $7te2 = $7te2 + 1
                    }
                }
                $7tc1 = $7te1 - $7ts1
                $7tc2 = $7te2 - $7ts2
                $7tc3 = $7te3 - $7ts3
                $7tc4 = $7te4 - $7ts4
                if ($7tc3 -lt 0) {
                $7tc3 = $7tc3 + 60
                $7tc2 = $7tc2 - 1
                }
                if (($7tc1.tostring().length) -eq 1) {
                $7tc1 = "0$7tc1"
                }
                if (($7tc2.tostring().length) -eq 1) {
                $7tc2 = "0$7tc2"
                }
                if (($7tc3.tostring().length) -eq 1) {
                $7tc3 = "0$7tc3"
                }
                if (($7tc4.tostring().length) -eq 1) {
                $7tc4 = "0$7tc4"
                }
                if (($7ts1.tostring().length) -eq 1) {
                $7ts1 = "0$7ts1"
                }
                if (($7ts2.tostring().length) -eq 1) {
                $7ts2 = "0$7ts2"
                }
                if (($7ts3.tostring().length) -eq 1) {
                $7ts3 = "0$7ts3"
                }
                if (($7ts4.tostring().length) -eq 1) {
                $7ts4 = "0$7ts4"
                }
                $clip7Sps = "$7ts1`:$7ts2`:$7ts3.$7ts4"
                $clip7Rt = "$7tc1`:$7tc2`:$7tc3.$7tc4"
                $clip8ts = read-host -prompt "Input Start Time For Clip 8 (Format: XX:XX:XX:XX)"
                $8ts1,$8ts2,$8ts3,$8ts4 = $clip8ts.split(":")
                $8ts1 = [int]$8ts1
                $8ts2 = [int]$8ts2
                $8ts3 = [int]$8ts3
                $8ts4 = [int]$8ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $8ts3 = $8ts3 - 5
                    if ($8ts3 -lt 0) {
                        $8ts3 = $8ts3 + 60
                        $8ts2 = $8ts2 - 1
                    }
                }
                $clip8te = read-host -prompt "Input End Time For Clip 8 (Format: XX:XX:XX:XX)"
                $8te1,$8te2,$8te3,$8te4 = $clip8te.split(":")
                $8te1 = [int]$8te1
                $8te2 = [int]$8te2
                $8te3 = [int]$8te3
                $8te4 = [int]$8te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $8te3 = $8te3 + 5
                    if ($8te3 -ge 60) {
                    $8te3 = $8te3 - 60
                    $8te2 = $8te2 + 1
                    }
                }
                $8tc1 = $8te1 - $8ts1
                $8tc2 = $8te2 - $8ts2
                $8tc3 = $8te3 - $8ts3
                $8tc4 = $8te4 - $8ts4
                if ($8tc3 -lt 0) {
                $8tc3 = $8tc3 + 60
                $8tc2 = $8tc2 - 1
                }
                if (($8tc1.tostring().length) -eq 1) {
                $8tc1 = "0$8tc1"
                }
                if (($8tc2.tostring().length) -eq 1) {
                $8tc2 = "0$8tc2"
                }
                if (($8tc3.tostring().length) -eq 1) {
                $8tc3 = "0$8tc3"
                }
                if (($8tc4.tostring().length) -eq 1) {
                $8tc4 = "0$8tc4"
                }
                if (($8ts1.tostring().length) -eq 1) {
                $8ts1 = "0$8ts1"
                }
                if (($8ts2.tostring().length) -eq 1) {
                $8ts2 = "0$8ts2"
                }
                if (($8ts3.tostring().length) -eq 1) {
                $8ts3 = "0$8ts3"
                }
                if (($8ts4.tostring().length) -eq 1) {
                $8ts4 = "0$8ts4"
                }
                $clip8Sps = "$8ts1`:$8ts2`:$8ts3.$8ts4"
                $clip8Rt = "$8tc1`:$8tc2`:$8tc3.$8tc4"
                $clip9ts = read-host -prompt "Input Start Time For Clip 9 (Format: XX:XX:XX:XX)"
                $9ts1,$9ts2,$9ts3,$9ts4 = $clip9ts.split(":")
                $9ts1 = [int]$9ts1
                $9ts2 = [int]$9ts2
                $9ts3 = [int]$9ts3
                $9ts4 = [int]$9ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $9ts3 = $9ts3 - 5
                    if ($9ts3 -lt 0) {
                        $9ts3 = $9ts3 + 60
                        $9ts2 = $9ts2 - 1
                    }
                }
                $clip9te = read-host -prompt "Input End Time For Clip 9 (Format: XX:XX:XX:XX)"
                $9te1,$9te2,$9te3,$9te4 = $clip9te.split(":")
                $9te1 = [int]$9te1
                $9te2 = [int]$9te2
                $9te3 = [int]$9te3
                $9te4 = [int]$9te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $9te3 = $9te3 + 5
                    if ($9te3 -ge 60) {
                    $9te3 = $9te3 - 60
                    $9te2 = $9te2 + 1
                    }
                }
                $9tc1 = $9te1 - $9ts1
                $9tc2 = $9te2 - $9ts2
                $9tc3 = $9te3 - $9ts3
                $9tc4 = $9te4 - $9ts4
                if ($9tc3 -lt 0) {
                $9tc3 = $9tc3 + 60
                $9tc2 = $9tc2 - 1
                }
                if (($9tc1.tostring().length) -eq 1) {
                $9tc1 = "0$9tc1"
                }
                if (($9tc2.tostring().length) -eq 1) {
                $9tc2 = "0$9tc2"
                }
                if (($9tc3.tostring().length) -eq 1) {
                $9tc3 = "0$9tc3"
                }
                if (($9tc4.tostring().length) -eq 1) {
                $9tc4 = "0$9tc4"
                }
                if (($9ts1.tostring().length) -eq 1) {
                $9ts1 = "0$9ts1"
                }
                if (($9ts2.tostring().length) -eq 1) {
                $9ts2 = "0$9ts2"
                }
                if (($9ts3.tostring().length) -eq 1) {
                $9ts3 = "0$9ts3"
                }
                if (($9ts4.tostring().length) -eq 1) {
                $9ts4 = "0$9ts4"
                }
                $clip9Sps = "$9ts1`:$9ts2`:$9ts3.$9ts4"
                $clip9Rt = "$9tc1`:$9tc2`:$9tc3.$9tc4"
                $clip10ts = read-host -prompt "Input Start Time For Clip 10 (Format: XX:XX:XX:XX)"
                $10ts1,$10ts2,$10ts3,$10ts4 = $clip10ts.split(":")
                $10ts1 = [int]$10ts1
                $10ts2 = [int]$10ts2
                $10ts3 = [int]$10ts3
                $10ts4 = [int]$10ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $10ts3 = $10ts3 - 5
                    if ($10ts3 -lt 0) {
                        $10ts3 = $10ts3 + 60
                        $10ts2 = $10ts2 - 1
                    }
                }
                $clip10te = read-host -prompt "Input End Time For Clip 10 (Format: XX:XX:XX:XX)"
                $10te1,$10te2,$10te3,$10te4 = $clip10te.split(":")
                $10te1 = [int]$10te1
                $10te2 = [int]$10te2
                $10te3 = [int]$10te3
                $10te4 = [int]$10te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $10te3 = $10te3 + 5
                    if ($10te3 -ge 60) {
                    $10te3 = $10te3 - 60
                    $10te2 = $10te2 + 1
                    }
                }
                $10tc1 = $10te1 - $10ts1
                $10tc2 = $10te2 - $10ts2
                $10tc3 = $10te3 - $10ts3
                $10tc4 = $10te4 - $10ts4
                if ($10tc3 -lt 0) {
                $10tc3 = $10tc3 + 60
                $10tc2 = $10tc2 - 1
                }
                if (($10tc1.tostring().length) -eq 1) {
                $10tc1 = "0$10tc1"
                }
                if (($10tc2.tostring().length) -eq 1) {
                $10tc2 = "0$10tc2"
                }
                if (($10tc3.tostring().length) -eq 1) {
                $10tc3 = "0$10tc3"
                }
                if (($10tc4.tostring().length) -eq 1) {
                $10tc4 = "0$10tc4"
                }
                if (($10ts1.tostring().length) -eq 1) {
                $10ts1 = "0$10ts1"
                }
                if (($10ts2.tostring().length) -eq 1) {
                $10ts2 = "0$10ts2"
                }
                if (($10ts3.tostring().length) -eq 1) {
                $10ts3 = "0$10ts3"
                }
                if (($10ts4.tostring().length) -eq 1) {
                $10ts4 = "0$10ts4"
                }
                $clip10Sps = "$10ts1`:$10ts2`:$10ts3.$10ts4"
                $clip10Rt = "$10tc1`:$10tc2`:$10tc3.$10tc4"
                $glinks = youtube-dl -g --youtube-skip-dash-manifest "$inlink"
                while (!$glinks) {$glinks = youtube-dl -g --youtube-skip-dash-manifest "$inlink"}
                $glink1,$glink2 = $glinks.split(" ")
                if (!$glink2) {$glink2 = $glink1}
                ffmpeg -hide_banner -loglevel error -ss $clip1Sps -i ($glink1) -t $clip1Rt -ss $clip1Sps -i ($glink2) -t $clip1Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip2Sps -i ($glink1) -t $clip2Rt -ss $clip2Sps -i ($glink2) -t $clip2Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip3Sps -i ($glink1) -t $clip3Rt -ss $clip3Sps -i ($glink2) -t $clip3Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip4Sps -i ($glink1) -t $clip4Rt -ss $clip4Sps -i ($glink2) -t $clip4Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip5Sps -i ($glink1) -t $clip5Rt -ss $clip5Sps -i ($glink2) -t $clip5Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip6Sps -i ($glink1) -t $clip6Rt -ss $clip6Sps -i ($glink2) -t $clip6Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip7Sps -i ($glink1) -t $clip7Rt -ss $clip7Sps -i ($glink2) -t $clip7Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip8Sps -i ($glink1) -t $clip8Rt -ss $clip8Sps -i ($glink2) -t $clip8Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip9Sps -i ($glink1) -t $clip9Rt -ss $clip9Sps -i ($glink2) -t $clip9Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip10Sps -i ($glink1) -t $clip10Rt -ss $clip10Sps -i ($glink2) -t $clip10Rt "clip$clipnum.mkv"
                $needsstitching = read-host -prompt 'Do you want to stitch clips? [Y/N]'
                if ($needsstitching -eq "Y" -or $needsstitching -eq "y") {
                   &$HoloStitcher
                }
                else {
                    write-host "Clipping Complete!"
                    return
                }
            }
            else {return}
        }
        else {
        #If the clip doesn't have miniclips, it will only ask for a start and end time.
        $timestampSin = read-host -prompt "Input Start Time (Format: XX:XX:XX:XX)"
        $ts1,$ts2,$ts3,$ts4 = $timestampSin.split(":")
        $ts1 = [int]$ts1
        $ts2 = [int]$ts2
        $ts3 = [int]$ts3
        $ts4 = [int]$ts4
        if ($cliptype -eq "Y" -or $cliptype -eq "y") {
            $ts3 = $ts3 - 5
            if ($ts3 -lt 0) {
                $ts3 = $ts3 + 60
                $ts2 = $ts2 - 1
            }
        }
        $timestampEin = read-host -prompt "Input End Time (Format: XX:XX:XX:XX)"
        $te1,$te2,$te3,$te4 = $timestampEin.split(":")
        $te1 = [int]$te1
        $te2 = [int]$te2
        $te3 = [int]$te3
        $te4 = [int]$te4
        if ($cliptype -eq "Y" -or $cliptype -eq "y") {
            $te3 = $te3 + 5
            if ($te3 -ge 60) {
            $te3 = $te3 - 60
            $te2 = $te2 + 1
            }
        }
        $tc1 = $te1 - $ts1
        $tc2 = $te2 - $ts2
        $tc3 = $te3 - $ts3
        $tc4 = $te4 - $ts4
        if ($tc3 -lt 0) {
        $tc3 = $tc3 + 60
        $tc2 = $tc2 - 1
        }
        if (($tc1.tostring().length) -eq 1) {
        $tc1 = "0$tc1"
        }
        if (($tc2.tostring().length) -eq 1) {
        $tc2 = "0$tc2"
        }
        if (($tc3.tostring().length) -eq 1) {
        $tc3 = "0$tc3"
        }
        if (($tc4.tostring().length) -eq 1) {
        $tc4 = "0$tc4"
        }
        if (($ts1.tostring().length) -eq 1) {
        $ts1 = "0$ts1"
        }
        if (($ts2.tostring().length) -eq 1) {
        $ts2 = "0$ts2"
        }
        if (($ts3.tostring().length) -eq 1) {
        $ts3 = "0$ts3"
        }
        if (($ts4.tostring().length) -eq 1) {
        $ts4 = "0$ts4"
        }
        $timestampSps = "$ts1`:$ts2`:$ts3.$ts4"
        $timestampEps = "$tc1`:$tc2`:$tc3.$tc4"
        write-host "Clipping Start: $timestampSps"
        write-host "Runtime: $timestampEps"
        $clipnum = read-host -prompt 'Clip Number'
        $glinks = youtube-dl -g --youtube-skip-dash-manifest "$inlink"
        while (!$glinks) {$glinks = youtube-dl -g --youtube-skip-dash-manifest "$inlink"}
        $glink1,$glink2 = $glinks.split(" ")
        if (!$glink2) {$glink2 = $glink1}
        ffmpeg -hide_banner -loglevel error -ss $timestampSps -i ($glink1) -t $timestampEps -ss $timestampSps -i ($glink2) -t $timestampEps "clip$clipnum.mkv"
        }
    }
    #the "archive" case is nearly a carbon copy of the "youtube" case, except with the ffmpeg
    #commands and youtube-dl download commands tweaked a bit to use archive file links.
    if ($videotype -eq "B" -or $videotype -eq "b") {
        $inlink = read-host -prompt 'Input Archive Download Link'
        $miniclip = read-host -prompt 'Clip Has Miniclips? [Y/N]'
        if ($miniclip -eq "Y" -or $miniclip -eq "y") {
            $clipnum = 1
            $miniclipnum = read-host -prompt 'Number Of Miniclips [2-10]'
            if ($miniclipnum -eq 2) {
                $clip1ts = read-host -prompt "Input Start Time For Clip 1 (Format: XX:XX:XX:XX)"
                $1ts1,$1ts2,$1ts3,$1ts4 = $clip1ts.split(":")
                $1ts1 = [int]$1ts1
                $1ts2 = [int]$1ts2
                $1ts3 = [int]$1ts3
                $1ts4 = [int]$1ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $1ts3 = $1ts3 - 5
                    if ($1ts3 -lt 0) {
                        $1ts3 = $1ts3 + 60
                        $1ts2 = $1ts2 - 1
                    }
                }
                $clip1te = read-host -prompt "Input End Time For Clip 1 (Format: XX:XX:XX:XX)"
                $1te1,$1te2,$1te3,$1te4 = $clip1te.split(":")
                $1te1 = [int]$1te1
                $1te2 = [int]$1te2
                $1te3 = [int]$1te3
                $1te4 = [int]$1te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $1te3 = $1te3 + 5
                    if ($1te3 -ge 60) {
                    $1te3 = $1te3 - 60
                    $1te2 = $1te2 + 1
                    }
                }
                $1tc1 = $1te1 - $1ts1
                $1tc2 = $1te2 - $1ts2
                $1tc3 = $1te3 - $1ts3
                $1tc4 = $1te4 - $1ts4
                if ($1tc3 -lt 0) {
                $1tc3 = $1tc3 + 60
                $1tc2 = $1tc2 - 1
                }
                if (($1tc1.tostring().length) -eq 1) {
                $1tc1 = "0$1tc1"
                }
                if (($1tc2.tostring().length) -eq 1) {
                $1tc2 = "0$1tc2"
                }
                if (($1tc3.tostring().length) -eq 1) {
                $1tc3 = "0$1tc3"
                }
                if (($1tc4.tostring().length) -eq 1) {
                $1tc4 = "0$1tc4"
                }
                if (($1ts1.tostring().length) -eq 1) {
                $1ts1 = "0$1ts1"
                }
                if (($1ts2.tostring().length) -eq 1) {
                $1ts2 = "0$1ts2"
                }
                if (($1ts3.tostring().length) -eq 1) {
                $1ts3 = "0$1ts3"
                }
                if (($1ts4.tostring().length) -eq 1) {
                $1ts4 = "0$1ts4"
                }
                $clip1Sps = "$1ts1`:$1ts2`:$1ts3.$1ts4"
                $clip1Rt = "$1tc1`:$1tc2`:$1tc3.$1tc4"
                $clip2ts = read-host -prompt "Input Start Time For Clip 2 (Format: XX:XX:XX:XX)"
                $2ts1,$2ts2,$2ts3,$2ts4 = $clip2ts.split(":")
                $2ts1 = [int]$2ts1
                $2ts2 = [int]$2ts2
                $2ts3 = [int]$2ts3
                $2ts4 = [int]$2ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $2ts3 = $2ts3 - 5
                    if ($2ts3 -lt 0) {
                        $2ts3 = $2ts3 + 60
                        $2ts2 = $2ts2 - 1
                    }
                }
                $clip2te = read-host -prompt "Input End Time For Clip 2 (Format: XX:XX:XX:XX)"
                $2te1,$2te2,$2te3,$2te4 = $clip2te.split(":")
                $2te1 = [int]$2te1
                $2te2 = [int]$2te2
                $2te3 = [int]$2te3
                $2te4 = [int]$2te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $2te3 = $2te3 + 5
                    if ($2te3 -ge 60) {
                    $2te3 = $2te3 - 60
                    $2te2 = $2te2 + 1
                    }
                }
                $2tc1 = $2te1 - $2ts1
                $2tc2 = $2te2 - $2ts2
                $2tc3 = $2te3 - $2ts3
                $2tc4 = $2te4 - $2ts4
                if ($2tc3 -lt 0) {
                $2tc3 = $2tc3 + 60
                $2tc2 = $2tc2 - 1
                }
                if (($2tc1.tostring().length) -eq 1) {
                $2tc1 = "0$2tc1"
                }
                if (($2tc2.tostring().length) -eq 1) {
                $2tc2 = "0$2tc2"
                }
                if (($2tc3.tostring().length) -eq 1) {
                $2tc3 = "0$2tc3"
                }
                if (($2tc4.tostring().length) -eq 1) {
                $2tc4 = "0$2tc4"
                }
                if (($2ts1.tostring().length) -eq 1) {
                $2ts1 = "0$2ts1"
                }
                if (($2ts2.tostring().length) -eq 1) {
                $2ts2 = "0$2ts2"
                }
                if (($2ts3.tostring().length) -eq 1) {
                $2ts3 = "0$2ts3"
                }
                if (($2ts4.tostring().length) -eq 1) {
                $2ts4 = "0$2ts4"
                }
                $clip2Sps = "$2ts1`:$2ts2`:$2ts3.$2ts4"
                $clip2Rt = "$2tc1`:$2tc2`:$2tc3.$2tc4"
                $glink = youtube-dl -g "$inlink"
                while (!$glink) {$glink = youtube-dl -g "$inlink"}
                ffmpeg -hide_banner -loglevel error -ss $clip1Sps -i ($glink) -t $clip1Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip2Sps -i ($glink) -t $clip2Rt "clip$clipnum.mkv"
                $needsstitching = read-host -prompt 'Do you want to stitch clips? [Y/N]'
                if ($needsstitching -eq "Y" -or $needsstitching -eq "y") {
                   &$HoloStitcher
                }
                else {
                    write-host "Clipping Complete!"    
                    return
                }
            }
            if ($miniclipnum -eq 3) {
                $clip1ts = read-host -prompt "Input Start Time For Clip 1 (Format: XX:XX:XX:XX)"
                $1ts1,$1ts2,$1ts3,$1ts4 = $clip1ts.split(":")
                $1ts1 = [int]$1ts1
                $1ts2 = [int]$1ts2
                $1ts3 = [int]$1ts3
                $1ts4 = [int]$1ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $1ts3 = $1ts3 - 5
                    if ($1ts3 -lt 0) {
                        $1ts3 = $1ts3 + 60
                        $1ts2 = $1ts2 - 1
                    }
                }
                $clip1te = read-host -prompt "Input End Time For Clip 1 (Format: XX:XX:XX:XX)"
                $1te1,$1te2,$1te3,$1te4 = $clip1te.split(":")
                $1te1 = [int]$1te1
                $1te2 = [int]$1te2
                $1te3 = [int]$1te3
                $1te4 = [int]$1te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $1te3 = $1te3 + 5
                    if ($1te3 -ge 60) {
                    $1te3 = $1te3 - 60
                    $1te2 = $1te2 + 1
                    }
                }
                $1tc1 = $1te1 - $1ts1
                $1tc2 = $1te2 - $1ts2
                $1tc3 = $1te3 - $1ts3
                $1tc4 = $1te4 - $1ts4
                if ($1tc3 -lt 0) {
                $1tc3 = $1tc3 + 60
                $1tc2 = $1tc2 - 1
                }
                if (($1tc1.tostring().length) -eq 1) {
                $1tc1 = "0$1tc1"
                }
                if (($1tc2.tostring().length) -eq 1) {
                $1tc2 = "0$1tc2"
                }
                if (($1tc3.tostring().length) -eq 1) {
                $1tc3 = "0$1tc3"
                }
                if (($1tc4.tostring().length) -eq 1) {
                $1tc4 = "0$1tc4"
                }
                if (($1ts1.tostring().length) -eq 1) {
                $1ts1 = "0$1ts1"
                }
                if (($1ts2.tostring().length) -eq 1) {
                $1ts2 = "0$1ts2"
                }
                if (($1ts3.tostring().length) -eq 1) {
                $1ts3 = "0$1ts3"
                }
                if (($1ts4.tostring().length) -eq 1) {
                $1ts4 = "0$1ts4"
                }
                $clip1Sps = "$1ts1`:$1ts2`:$1ts3.$1ts4"
                $clip1Rt = "$1tc1`:$1tc2`:$1tc3.$1tc4"
                $clip2ts = read-host -prompt "Input Start Time For Clip 2 (Format: XX:XX:XX:XX)"
                $2ts1,$2ts2,$2ts3,$2ts4 = $clip2ts.split(":")
                $2ts1 = [int]$2ts1
                $2ts2 = [int]$2ts2
                $2ts3 = [int]$2ts3
                $2ts4 = [int]$2ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $2ts3 = $2ts3 - 5
                    if ($2ts3 -lt 0) {
                        $2ts3 = $2ts3 + 60
                        $2ts2 = $2ts2 - 1
                    }
                }
                $clip2te = read-host -prompt "Input End Time For Clip 2 (Format: XX:XX:XX:XX)"
                $2te1,$2te2,$2te3,$2te4 = $clip2te.split(":")
                $2te1 = [int]$2te1
                $2te2 = [int]$2te2
                $2te3 = [int]$2te3
                $2te4 = [int]$2te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $2te3 = $2te3 + 5
                    if ($2te3 -ge 60) {
                    $2te3 = $2te3 - 60
                    $2te2 = $2te2 + 1
                    }
                }
                $2tc1 = $2te1 - $2ts1
                $2tc2 = $2te2 - $2ts2
                $2tc3 = $2te3 - $2ts3
                $2tc4 = $2te4 - $2ts4
                if ($2tc3 -lt 0) {
                $2tc3 = $2tc3 + 60
                $2tc2 = $2tc2 - 1
                }
                if (($2tc1.tostring().length) -eq 1) {
                $2tc1 = "0$2tc1"
                }
                if (($2tc2.tostring().length) -eq 1) {
                $2tc2 = "0$2tc2"
                }
                if (($2tc3.tostring().length) -eq 1) {
                $2tc3 = "0$2tc3"
                }
                if (($2tc4.tostring().length) -eq 1) {
                $2tc4 = "0$2tc4"
                }
                if (($2ts1.tostring().length) -eq 1) {
                $2ts1 = "0$2ts1"
                }
                if (($2ts2.tostring().length) -eq 1) {
                $2ts2 = "0$2ts2"
                }
                if (($2ts3.tostring().length) -eq 1) {
                $2ts3 = "0$2ts3"
                }
                if (($2ts4.tostring().length) -eq 1) {
                $2ts4 = "0$2ts4"
                }
                $clip2Sps = "$2ts1`:$2ts2`:$2ts3.$2ts4"
                $clip2Rt = "$2tc1`:$2tc2`:$2tc3.$2tc4"
                $clip3ts = read-host -prompt "Input Start Time For Clip 3 (Format: XX:XX:XX:XX)"
                $3ts1,$3ts2,$3ts3,$3ts4 = $clip3ts.split(":")
                $3ts1 = [int]$3ts1
                $3ts2 = [int]$3ts2
                $3ts3 = [int]$3ts3
                $3ts4 = [int]$3ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $3ts3 = $3ts3 - 5
                    if ($3ts3 -lt 0) {
                        $3ts3 = $3ts3 + 60
                        $3ts2 = $3ts2 - 1
                    }
                }
                $clip3te = read-host -prompt "Input End Time For Clip 3 (Format: XX:XX:XX:XX)"
                $3te1,$3te2,$3te3,$3te4 = $clip3te.split(":")
                $3te1 = [int]$3te1
                $3te2 = [int]$3te2
                $3te3 = [int]$3te3
                $3te4 = [int]$3te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $3te3 = $3te3 + 5
                    if ($3te3 -ge 60) {
                    $3te3 = $3te3 - 60
                    $3te2 = $3te2 + 1
                    }
                }
                $3tc1 = $3te1 - $3ts1
                $3tc2 = $3te2 - $3ts2
                $3tc3 = $3te3 - $3ts3
                $3tc4 = $3te4 - $3ts4
                if ($3tc3 -lt 0) {
                $3tc3 = $3tc3 + 60
                $3tc2 = $3tc2 - 1
                }
                if (($3tc1.tostring().length) -eq 1) {
                $3tc1 = "0$3tc1"
                }
                if (($3tc2.tostring().length) -eq 1) {
                $3tc2 = "0$3tc2"
                }
                if (($3tc3.tostring().length) -eq 1) {
                $3tc3 = "0$3tc3"
                }
                if (($3tc4.tostring().length) -eq 1) {
                $3tc4 = "0$3tc4"
                }
                if (($3ts1.tostring().length) -eq 1) {
                $3ts1 = "0$3ts1"
                }
                if (($3ts2.tostring().length) -eq 1) {
                $3ts2 = "0$3ts2"
                }
                if (($3ts3.tostring().length) -eq 1) {
                $3ts3 = "0$3ts3"
                }
                if (($3ts4.tostring().length) -eq 1) {
                $3ts4 = "0$3ts4"
                }
                $clip3Sps = "$3ts1`:$3ts2`:$3ts3.$3ts4"
                $clip3Rt = "$3tc1`:$3tc2`:$3tc3.$3tc4"
                $glink = youtube-dl -g "$inlink"
                while (!$glink) {$glink = youtube-dl -g "$inlink"}
                ffmpeg -hide_banner -loglevel error -ss $clip1Sps -i ($glink) -t $clip1Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip2Sps -i ($glink) -t $clip2Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip3Sps -i ($glink) -t $clip3Rt "clip$clipnum.mkv"
                $needsstitching = read-host -prompt 'Do you want to stitch clips? [Y/N]'
                if ($needsstitching -eq "Y" -or $needsstitching -eq "y") {
                   &$HoloStitcher
                }
                else {
                    write-host "Clipping Complete!"
                    return
                }
            }
            if ($miniclipnum -eq 4) {
                $clip1ts = read-host -prompt "Input Start Time For Clip 1 (Format: XX:XX:XX:XX)"
                $1ts1,$1ts2,$1ts3,$1ts4 = $clip1ts.split(":")
                $1ts1 = [int]$1ts1
                $1ts2 = [int]$1ts2
                $1ts3 = [int]$1ts3
                $1ts4 = [int]$1ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $1ts3 = $1ts3 - 5
                    if ($1ts3 -lt 0) {
                        $1ts3 = $1ts3 + 60
                        $1ts2 = $1ts2 - 1
                    }
                }
                $clip1te = read-host -prompt "Input End Time For Clip 1 (Format: XX:XX:XX:XX)"
                $1te1,$1te2,$1te3,$1te4 = $clip1te.split(":")
                $1te1 = [int]$1te1
                $1te2 = [int]$1te2
                $1te3 = [int]$1te3
                $1te4 = [int]$1te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $1te3 = $1te3 + 5
                    if ($1te3 -ge 60) {
                    $1te3 = $1te3 - 60
                    $1te2 = $1te2 + 1
                    }
                }
                $1tc1 = $1te1 - $1ts1
                $1tc2 = $1te2 - $1ts2
                $1tc3 = $1te3 - $1ts3
                $1tc4 = $1te4 - $1ts4
                if ($1tc3 -lt 0) {
                $1tc3 = $1tc3 + 60
                $1tc2 = $1tc2 - 1
                }
                if (($1tc1.tostring().length) -eq 1) {
                $1tc1 = "0$1tc1"
                }
                if (($1tc2.tostring().length) -eq 1) {
                $1tc2 = "0$1tc2"
                }
                if (($1tc3.tostring().length) -eq 1) {
                $1tc3 = "0$1tc3"
                }
                if (($1tc4.tostring().length) -eq 1) {
                $1tc4 = "0$1tc4"
                }
                if (($1ts1.tostring().length) -eq 1) {
                $1ts1 = "0$1ts1"
                }
                if (($1ts2.tostring().length) -eq 1) {
                $1ts2 = "0$1ts2"
                }
                if (($1ts3.tostring().length) -eq 1) {
                $1ts3 = "0$1ts3"
                }
                if (($1ts4.tostring().length) -eq 1) {
                $1ts4 = "0$1ts4"
                }
                $clip1Sps = "$1ts1`:$1ts2`:$1ts3.$1ts4"
                $clip1Rt = "$1tc1`:$1tc2`:$1tc3.$1tc4"
                $clip2ts = read-host -prompt "Input Start Time For Clip 2 (Format: XX:XX:XX:XX)"
                $2ts1,$2ts2,$2ts3,$2ts4 = $clip2ts.split(":")
                $2ts1 = [int]$2ts1
                $2ts2 = [int]$2ts2
                $2ts3 = [int]$2ts3
                $2ts4 = [int]$2ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $2ts3 = $2ts3 - 5
                    if ($2ts3 -lt 0) {
                        $2ts3 = $2ts3 + 60
                        $2ts2 = $2ts2 - 1
                    }
                }
                $clip2te = read-host -prompt "Input End Time For Clip 2 (Format: XX:XX:XX:XX)"
                $2te1,$2te2,$2te3,$2te4 = $clip2te.split(":")
                $2te1 = [int]$2te1
                $2te2 = [int]$2te2
                $2te3 = [int]$2te3
                $2te4 = [int]$2te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $2te3 = $2te3 + 5
                    if ($2te3 -ge 60) {
                    $2te3 = $2te3 - 60
                    $2te2 = $2te2 + 1
                    }
                }
                $2tc1 = $2te1 - $2ts1
                $2tc2 = $2te2 - $2ts2
                $2tc3 = $2te3 - $2ts3
                $2tc4 = $2te4 - $2ts4
                if ($2tc3 -lt 0) {
                $2tc3 = $2tc3 + 60
                $2tc2 = $2tc2 - 1
                }
                if (($2tc1.tostring().length) -eq 1) {
                $2tc1 = "0$2tc1"
                }
                if (($2tc2.tostring().length) -eq 1) {
                $2tc2 = "0$2tc2"
                }
                if (($2tc3.tostring().length) -eq 1) {
                $2tc3 = "0$2tc3"
                }
                if (($2tc4.tostring().length) -eq 1) {
                $2tc4 = "0$2tc4"
                }
                if (($2ts1.tostring().length) -eq 1) {
                $2ts1 = "0$2ts1"
                }
                if (($2ts2.tostring().length) -eq 1) {
                $2ts2 = "0$2ts2"
                }
                if (($2ts3.tostring().length) -eq 1) {
                $2ts3 = "0$2ts3"
                }
                if (($2ts4.tostring().length) -eq 1) {
                $2ts4 = "0$2ts4"
                }
                $clip2Sps = "$2ts1`:$2ts2`:$2ts3.$2ts4"
                $clip2Rt = "$2tc1`:$2tc2`:$2tc3.$2tc4"
                $clip3ts = read-host -prompt "Input Start Time For Clip 3 (Format: XX:XX:XX:XX)"
                $3ts1,$3ts2,$3ts3,$3ts4 = $clip3ts.split(":")
                $3ts1 = [int]$3ts1
                $3ts2 = [int]$3ts2
                $3ts3 = [int]$3ts3
                $3ts4 = [int]$3ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $3ts3 = $3ts3 - 5
                    if ($3ts3 -lt 0) {
                        $3ts3 = $3ts3 + 60
                        $3ts2 = $3ts2 - 1
                    }
                }
                $clip3te = read-host -prompt "Input End Time For Clip 3 (Format: XX:XX:XX:XX)"
                $3te1,$3te2,$3te3,$3te4 = $clip3te.split(":")
                $3te1 = [int]$3te1
                $3te2 = [int]$3te2
                $3te3 = [int]$3te3
                $3te4 = [int]$3te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $3te3 = $3te3 + 5
                    if ($3te3 -ge 60) {
                    $3te3 = $3te3 - 60
                    $3te2 = $3te2 + 1
                    }
                }
                $3tc1 = $3te1 - $3ts1
                $3tc2 = $3te2 - $3ts2
                $3tc3 = $3te3 - $3ts3
                $3tc4 = $3te4 - $3ts4
                if ($3tc3 -lt 0) {
                $3tc3 = $3tc3 + 60
                $3tc2 = $3tc2 - 1
                }
                if (($3tc1.tostring().length) -eq 1) {
                $3tc1 = "0$3tc1"
                }
                if (($3tc2.tostring().length) -eq 1) {
                $3tc2 = "0$3tc2"
                }
                if (($3tc3.tostring().length) -eq 1) {
                $3tc3 = "0$3tc3"
                }
                if (($3tc4.tostring().length) -eq 1) {
                $3tc4 = "0$3tc4"
                }
                if (($3ts1.tostring().length) -eq 1) {
                $3ts1 = "0$3ts1"
                }
                if (($3ts2.tostring().length) -eq 1) {
                $3ts2 = "0$3ts2"
                }
                if (($3ts3.tostring().length) -eq 1) {
                $3ts3 = "0$3ts3"
                }
                if (($3ts4.tostring().length) -eq 1) {
                $3ts4 = "0$3ts4"
                }
                $clip3Sps = "$3ts1`:$3ts2`:$3ts3.$3ts4"
                $clip3Rt = "$3tc1`:$3tc2`:$3tc3.$3tc4"
                $clip4ts = read-host -prompt "Input Start Time For Clip 4 (Format: XX:XX:XX:XX)"
                $4ts1,$4ts2,$4ts3,$4ts4 = $clip4ts.split(":")
                $4ts1 = [int]$4ts1
                $4ts2 = [int]$4ts2
                $4ts3 = [int]$4ts3
                $4ts4 = [int]$4ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $4ts3 = $4ts3 - 5
                    if ($4ts3 -lt 0) {
                        $4ts3 = $4ts3 + 60
                        $4ts2 = $4ts2 - 1
                    }
                }
                $clip4te = read-host -prompt "Input End Time For Clip 4 (Format: XX:XX:XX:XX)"
                $4te1,$4te2,$4te3,$4te4 = $clip4te.split(":")
                $4te1 = [int]$4te1
                $4te2 = [int]$4te2
                $4te3 = [int]$4te3
                $4te4 = [int]$4te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $4te3 = $4te3 + 5
                    if ($4te3 -ge 60) {
                    $4te3 = $4te3 - 60
                    $4te2 = $4te2 + 1
                    }
                }
                $4tc1 = $4te1 - $4ts1
                $4tc2 = $4te2 - $4ts2
                $4tc3 = $4te3 - $4ts3
                $4tc4 = $4te4 - $4ts4
                if ($4tc3 -lt 0) {
                $4tc3 = $4tc3 + 60
                $4tc2 = $4tc2 - 1
                }
                if (($4tc1.tostring().length) -eq 1) {
                $4tc1 = "0$4tc1"
                }
                if (($4tc2.tostring().length) -eq 1) {
                $4tc2 = "0$4tc2"
                }
                if (($4tc3.tostring().length) -eq 1) {
                $4tc3 = "0$4tc3"
                }
                if (($4tc4.tostring().length) -eq 1) {
                $4tc4 = "0$4tc4"
                }
                if (($4ts1.tostring().length) -eq 1) {
                $4ts1 = "0$4ts1"
                }
                if (($4ts2.tostring().length) -eq 1) {
                $4ts2 = "0$4ts2"
                }
                if (($4ts3.tostring().length) -eq 1) {
                $4ts3 = "0$4ts3"
                }
                if (($4ts4.tostring().length) -eq 1) {
                $4ts4 = "0$4ts4"
                }
                $clip4Sps = "$4ts1`:$4ts2`:$4ts3.$4ts4"
                $clip4Rt = "$4tc1`:$4tc2`:$4tc3.$4tc4"
                $glink = youtube-dl -g "$inlink"
                while (!$glink) {$glink = youtube-dl -g "$inlink"}
                ffmpeg -hide_banner -loglevel error -ss $clip1Sps -i ($glink) -t $clip1Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip2Sps -i ($glink) -t $clip2Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip3Sps -i ($glink) -t $clip3Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip4Sps -i ($glink) -t $clip4Rt "clip$clipnum.mkv"
                $needsstitching = read-host -prompt 'Do you want to stitch clips? [Y/N]'
                if ($needsstitching -eq "Y" -or $needsstitching -eq "y") {
                   &$HoloStitcher
                }
                else {
                    write-host "Clipping Complete!"    
                    return
                }
            }
            if ($miniclipnum -eq 5) {
                $clip1ts = read-host -prompt "Input Start Time For Clip 1 (Format: XX:XX:XX:XX)"
                $1ts1,$1ts2,$1ts3,$1ts4 = $clip1ts.split(":")
                $1ts1 = [int]$1ts1
                $1ts2 = [int]$1ts2
                $1ts3 = [int]$1ts3
                $1ts4 = [int]$1ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $1ts3 = $1ts3 - 5
                    if ($1ts3 -lt 0) {
                        $1ts3 = $1ts3 + 60
                        $1ts2 = $1ts2 - 1
                    }
                }
                $clip1te = read-host -prompt "Input End Time For Clip 1 (Format: XX:XX:XX:XX)"
                $1te1,$1te2,$1te3,$1te4 = $clip1te.split(":")
                $1te1 = [int]$1te1
                $1te2 = [int]$1te2
                $1te3 = [int]$1te3
                $1te4 = [int]$1te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $1te3 = $1te3 + 5
                    if ($1te3 -ge 60) {
                    $1te3 = $1te3 - 60
                    $1te2 = $1te2 + 1
                    }
                }
                $1tc1 = $1te1 - $1ts1
                $1tc2 = $1te2 - $1ts2
                $1tc3 = $1te3 - $1ts3
                $1tc4 = $1te4 - $1ts4
                if ($1tc3 -lt 0) {
                $1tc3 = $1tc3 + 60
                $1tc2 = $1tc2 - 1
                }
                if (($1tc1.tostring().length) -eq 1) {
                $1tc1 = "0$1tc1"
                }
                if (($1tc2.tostring().length) -eq 1) {
                $1tc2 = "0$1tc2"
                }
                if (($1tc3.tostring().length) -eq 1) {
                $1tc3 = "0$1tc3"
                }
                if (($1tc4.tostring().length) -eq 1) {
                $1tc4 = "0$1tc4"
                }
                if (($1ts1.tostring().length) -eq 1) {
                $1ts1 = "0$1ts1"
                }
                if (($1ts2.tostring().length) -eq 1) {
                $1ts2 = "0$1ts2"
                }
                if (($1ts3.tostring().length) -eq 1) {
                $1ts3 = "0$1ts3"
                }
                if (($1ts4.tostring().length) -eq 1) {
                $1ts4 = "0$1ts4"
                }
                $clip1Sps = "$1ts1`:$1ts2`:$1ts3.$1ts4"
                $clip1Rt = "$1tc1`:$1tc2`:$1tc3.$1tc4"
                $clip2ts = read-host -prompt "Input Start Time For Clip 2 (Format: XX:XX:XX:XX)"
                $2ts1,$2ts2,$2ts3,$2ts4 = $clip2ts.split(":")
                $2ts1 = [int]$2ts1
                $2ts2 = [int]$2ts2
                $2ts3 = [int]$2ts3
                $2ts4 = [int]$2ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $2ts3 = $2ts3 - 5
                    if ($2ts3 -lt 0) {
                        $2ts3 = $2ts3 + 60
                        $2ts2 = $2ts2 - 1
                    }
                }
                $clip2te = read-host -prompt "Input End Time For Clip 2 (Format: XX:XX:XX:XX)"
                $2te1,$2te2,$2te3,$2te4 = $clip2te.split(":")
                $2te1 = [int]$2te1
                $2te2 = [int]$2te2
                $2te3 = [int]$2te3
                $2te4 = [int]$2te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $2te3 = $2te3 + 5
                    if ($2te3 -ge 60) {
                    $2te3 = $2te3 - 60
                    $2te2 = $2te2 + 1
                    }
                }
                $2tc1 = $2te1 - $2ts1
                $2tc2 = $2te2 - $2ts2
                $2tc3 = $2te3 - $2ts3
                $2tc4 = $2te4 - $2ts4
                if ($2tc3 -lt 0) {
                $2tc3 = $2tc3 + 60
                $2tc2 = $2tc2 - 1
                }
                if (($2tc1.tostring().length) -eq 1) {
                $2tc1 = "0$2tc1"
                }
                if (($2tc2.tostring().length) -eq 1) {
                $2tc2 = "0$2tc2"
                }
                if (($2tc3.tostring().length) -eq 1) {
                $2tc3 = "0$2tc3"
                }
                if (($2tc4.tostring().length) -eq 1) {
                $2tc4 = "0$2tc4"
                }
                if (($2ts1.tostring().length) -eq 1) {
                $2ts1 = "0$2ts1"
                }
                if (($2ts2.tostring().length) -eq 1) {
                $2ts2 = "0$2ts2"
                }
                if (($2ts3.tostring().length) -eq 1) {
                $2ts3 = "0$2ts3"
                }
                if (($2ts4.tostring().length) -eq 1) {
                $2ts4 = "0$2ts4"
                }
                $clip3ts = read-host -prompt "Input Start Time For Clip 3 (Format: XX:XX:XX:XX)"
                $3ts1,$3ts2,$3ts3,$3ts4 = $clip3ts.split(":")
                $3ts1 = [int]$3ts1
                $3ts2 = [int]$3ts2
                $3ts3 = [int]$3ts3
                $3ts4 = [int]$3ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $3ts3 = $3ts3 - 5
                    if ($3ts3 -lt 0) {
                        $3ts3 = $3ts3 + 60
                        $3ts2 = $3ts2 - 1
                    }
                }
                $clip3te = read-host -prompt "Input End Time For Clip 3 (Format: XX:XX:XX:XX)"
                $3te1,$3te2,$3te3,$3te4 = $clip3te.split(":")
                $3te1 = [int]$3te1
                $3te2 = [int]$3te2
                $3te3 = [int]$3te3
                $3te4 = [int]$3te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $3te3 = $3te3 + 5
                    if ($3te3 -ge 60) {
                    $3te3 = $3te3 - 60
                    $3te2 = $3te2 + 1
                    }
                }
                $3tc1 = $3te1 - $3ts1
                $3tc2 = $3te2 - $3ts2
                $3tc3 = $3te3 - $3ts3
                $3tc4 = $3te4 - $3ts4
                if ($3tc3 -lt 0) {
                $3tc3 = $3tc3 + 60
                $3tc2 = $3tc2 - 1
                }
                if (($3tc1.tostring().length) -eq 1) {
                $3tc1 = "0$3tc1"
                }
                if (($3tc2.tostring().length) -eq 1) {
                $3tc2 = "0$3tc2"
                }
                if (($3tc3.tostring().length) -eq 1) {
                $3tc3 = "0$3tc3"
                }
                if (($3tc4.tostring().length) -eq 1) {
                $3tc4 = "0$3tc4"
                }
                if (($3ts1.tostring().length) -eq 1) {
                $3ts1 = "0$3ts1"
                }
                if (($3ts2.tostring().length) -eq 1) {
                $3ts2 = "0$3ts2"
                }
                if (($3ts3.tostring().length) -eq 1) {
                $3ts3 = "0$3ts3"
                }
                if (($3ts4.tostring().length) -eq 1) {
                $3ts4 = "0$3ts4"
                }
                $clip3Sps = "$3ts1`:$3ts2`:$3ts3.$3ts4"
                $clip3Rt = "$3tc1`:$3tc2`:$3tc3.$3tc4"
                $clip4ts = read-host -prompt "Input Start Time For Clip 4 (Format: XX:XX:XX:XX)"
                $4ts1,$4ts2,$4ts3,$4ts4 = $clip4ts.split(":")
                $4ts1 = [int]$4ts1
                $4ts2 = [int]$4ts2
                $4ts3 = [int]$4ts3
                $4ts4 = [int]$4ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $4ts3 = $4ts3 - 5
                    if ($4ts3 -lt 0) {
                        $4ts3 = $4ts3 + 60
                        $4ts2 = $4ts2 - 1
                    }
                }
                $clip4te = read-host -prompt "Input End Time For Clip 4 (Format: XX:XX:XX:XX)"
                $4te1,$4te2,$4te3,$4te4 = $clip4te.split(":")
                $4te1 = [int]$4te1
                $4te2 = [int]$4te2
                $4te3 = [int]$4te3
                $4te4 = [int]$4te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $4te3 = $4te3 + 5
                    if ($4te3 -ge 60) {
                    $4te3 = $4te3 - 60
                    $4te2 = $4te2 + 1
                    }
                }
                $4tc1 = $4te1 - $4ts1
                $4tc2 = $4te2 - $4ts2
                $4tc3 = $4te3 - $4ts3
                $4tc4 = $4te4 - $4ts4
                if ($4tc3 -lt 0) {
                $4tc3 = $4tc3 + 60
                $4tc2 = $4tc2 - 1
                }
                if (($4tc1.tostring().length) -eq 1) {
                $4tc1 = "0$4tc1"
                }
                if (($4tc2.tostring().length) -eq 1) {
                $4tc2 = "0$4tc2"
                }
                if (($4tc3.tostring().length) -eq 1) {
                $4tc3 = "0$4tc3"
                }
                if (($4tc4.tostring().length) -eq 1) {
                $4tc4 = "0$4tc4"
                }
                if (($4ts1.tostring().length) -eq 1) {
                $4ts1 = "0$4ts1"
                }
                if (($4ts2.tostring().length) -eq 1) {
                $4ts2 = "0$4ts2"
                }
                if (($4ts3.tostring().length) -eq 1) {
                $4ts3 = "0$4ts3"
                }
                if (($4ts4.tostring().length) -eq 1) {
                $4ts4 = "0$4ts4"
                }
                $clip4Sps = "$4ts1`:$4ts2`:$4ts3.$4ts4"
                $clip4Rt = "$4tc1`:$4tc2`:$4tc3.$4tc4"
                $clip5ts = read-host -prompt "Input Start Time For Clip 5 (Format: XX:XX:XX:XX)"
                $5ts1,$5ts2,$5ts3,$5ts4 = $clip5ts.split(":")
                $5ts1 = [int]$5ts1
                $5ts2 = [int]$5ts2
                $5ts3 = [int]$5ts3
                $5ts4 = [int]$5ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $5ts3 = $5ts3 - 5
                    if ($5ts3 -lt 0) {
                        $5ts3 = $5ts3 + 60
                        $5ts2 = $5ts2 - 1
                    }
                }
                $clip5te = read-host -prompt "Input End Time For Clip 5 (Format: XX:XX:XX:XX)"
                $5te1,$5te2,$5te3,$5te4 = $clip5te.split(":")
                $5te1 = [int]$5te1
                $5te2 = [int]$5te2
                $5te3 = [int]$5te3
                $5te4 = [int]$5te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $5te3 = $5te3 + 5
                    if ($5te3 -ge 60) {
                    $5te3 = $5te3 - 60
                    $5te2 = $5te2 + 1
                    }
                }
                $5tc1 = $5te1 - $5ts1
                $5tc2 = $5te2 - $5ts2
                $5tc3 = $5te3 - $5ts3
                $5tc4 = $5te4 - $5ts4
                if ($5tc3 -lt 0) {
                $5tc3 = $5tc3 + 60
                $5tc2 = $5tc2 - 1
                }
                if (($5tc1.tostring().length) -eq 1) {
                $5tc1 = "0$5tc1"
                }
                if (($5tc2.tostring().length) -eq 1) {
                $5tc2 = "0$5tc2"
                }
                if (($5tc3.tostring().length) -eq 1) {
                $5tc3 = "0$5tc3"
                }
                if (($5tc4.tostring().length) -eq 1) {
                $5tc4 = "0$5tc4"
                }
                if (($5ts1.tostring().length) -eq 1) {
                $5ts1 = "0$5ts1"
                }
                if (($5ts2.tostring().length) -eq 1) {
                $5ts2 = "0$5ts2"
                }
                if (($5ts3.tostring().length) -eq 1) {
                $5ts3 = "0$5ts3"
                }
                if (($5ts4.tostring().length) -eq 1) {
                $5ts4 = "0$5ts4"
                }
                $clip5Sps = "$5ts1`:$5ts2`:$5ts3.$5ts4"
                $clip5Rt = "$5tc1`:$5tc2`:$5tc3.$5tc4"
                $glink = youtube-dl -g "$inlink"
                while (!$glink) {$glink = youtube-dl -g "$inlink"}
                ffmpeg -hide_banner -loglevel error -ss $clip1Sps -i ($glink) -t $clip1Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip2Sps -i ($glink) -t $clip2Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip3Sps -i ($glink) -t $clip3Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip4Sps -i ($glink) -t $clip4Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip5Sps -i ($glink) -t $clip5Rt "clip$clipnum.mkv"
                $needsstitching = read-host -prompt 'Do you want to stitch clips? [Y/N]'
                if ($needsstitching -eq "Y" -or $needsstitching -eq "y") {
                   &$HoloStitcher
                }
                else {
                    write-host "Clipping Complete!"
                    return
                }
            }
            if ($miniclipnum -eq 6) {
                $clip1ts = read-host -prompt "Input Start Time For Clip 1 (Format: XX:XX:XX:XX)"
                $1ts1,$1ts2,$1ts3,$1ts4 = $clip1ts.split(":")
                $1ts1 = [int]$1ts1
                $1ts2 = [int]$1ts2
                $1ts3 = [int]$1ts3
                $1ts4 = [int]$1ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $1ts3 = $1ts3 - 5
                    if ($1ts3 -lt 0) {
                        $1ts3 = $1ts3 + 60
                        $1ts2 = $1ts2 - 1
                    }
                }
                $clip1te = read-host -prompt "Input End Time For Clip 1 (Format: XX:XX:XX:XX)"
                $1te1,$1te2,$1te3,$1te4 = $clip1te.split(":")
                $1te1 = [int]$1te1
                $1te2 = [int]$1te2
                $1te3 = [int]$1te3
                $1te4 = [int]$1te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $1te3 = $1te3 + 5
                    if ($1te3 -ge 60) {
                    $1te3 = $1te3 - 60
                    $1te2 = $1te2 + 1
                    }
                }
                $1tc1 = $1te1 - $1ts1
                $1tc2 = $1te2 - $1ts2
                $1tc3 = $1te3 - $1ts3
                $1tc4 = $1te4 - $1ts4
                if ($1tc3 -lt 0) {
                $1tc3 = $1tc3 + 60
                $1tc2 = $1tc2 - 1
                }
                if (($1tc1.tostring().length) -eq 1) {
                $1tc1 = "0$1tc1"
                }
                if (($1tc2.tostring().length) -eq 1) {
                $1tc2 = "0$1tc2"
                }
                if (($1tc3.tostring().length) -eq 1) {
                $1tc3 = "0$1tc3"
                }
                if (($1tc4.tostring().length) -eq 1) {
                $1tc4 = "0$1tc4"
                }
                if (($1ts1.tostring().length) -eq 1) {
                $1ts1 = "0$1ts1"
                }
                if (($1ts2.tostring().length) -eq 1) {
                $1ts2 = "0$1ts2"
                }
                if (($1ts3.tostring().length) -eq 1) {
                $1ts3 = "0$1ts3"
                }
                if (($1ts4.tostring().length) -eq 1) {
                $1ts4 = "0$1ts4"
                }
                $clip1Sps = "$1ts1`:$1ts2`:$1ts3.$1ts4"
                $clip1Rt = "$1tc1`:$1tc2`:$1tc3.$1tc4"
                $clip2ts = read-host -prompt "Input Start Time For Clip 2 (Format: XX:XX:XX:XX)"
                $2ts1,$2ts2,$2ts3,$2ts4 = $clip2ts.split(":")
                $2ts1 = [int]$2ts1
                $2ts2 = [int]$2ts2
                $2ts3 = [int]$2ts3
                $2ts4 = [int]$2ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $2ts3 = $2ts3 - 5
                    if ($2ts3 -lt 0) {
                        $2ts3 = $2ts3 + 60
                        $2ts2 = $2ts2 - 1
                    }
                }
                $clip2te = read-host -prompt "Input End Time For Clip 2 (Format: XX:XX:XX:XX)"
                $2te1,$2te2,$2te3,$2te4 = $clip2te.split(":")
                $2te1 = [int]$2te1
                $2te2 = [int]$2te2
                $2te3 = [int]$2te3
                $2te4 = [int]$2te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $2te3 = $2te3 + 5
                    if ($2te3 -ge 60) {
                    $2te3 = $2te3 - 60
                    $2te2 = $2te2 + 1
                    }
                }
                $2tc1 = $2te1 - $2ts1
                $2tc2 = $2te2 - $2ts2
                $2tc3 = $2te3 - $2ts3
                $2tc4 = $2te4 - $2ts4
                if ($2tc3 -lt 0) {
                $2tc3 = $2tc3 + 60
                $2tc2 = $2tc2 - 1
                }
                if (($2tc1.tostring().length) -eq 1) {
                $2tc1 = "0$2tc1"
                }
                if (($2tc2.tostring().length) -eq 1) {
                $2tc2 = "0$2tc2"
                }
                if (($2tc3.tostring().length) -eq 1) {
                $2tc3 = "0$2tc3"
                }
                if (($2tc4.tostring().length) -eq 1) {
                $2tc4 = "0$2tc4"
                }
                if (($2ts1.tostring().length) -eq 1) {
                $2ts1 = "0$2ts1"
                }
                if (($2ts2.tostring().length) -eq 1) {
                $2ts2 = "0$2ts2"
                }
                if (($2ts3.tostring().length) -eq 1) {
                $2ts3 = "0$2ts3"
                }
                if (($2ts4.tostring().length) -eq 1) {
                $2ts4 = "0$2ts4"
                }
                $clip3ts = read-host -prompt "Input Start Time For Clip 3 (Format: XX:XX:XX:XX)"
                $3ts1,$3ts2,$3ts3,$3ts4 = $clip3ts.split(":")
                $3ts1 = [int]$3ts1
                $3ts2 = [int]$3ts2
                $3ts3 = [int]$3ts3
                $3ts4 = [int]$3ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $3ts3 = $3ts3 - 5
                    if ($3ts3 -lt 0) {
                        $3ts3 = $3ts3 + 60
                        $3ts2 = $3ts2 - 1
                    }
                }
                $clip3te = read-host -prompt "Input End Time For Clip 3 (Format: XX:XX:XX:XX)"
                $3te1,$3te2,$3te3,$3te4 = $clip3te.split(":")
                $3te1 = [int]$3te1
                $3te2 = [int]$3te2
                $3te3 = [int]$3te3
                $3te4 = [int]$3te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $3te3 = $3te3 + 5
                    if ($3te3 -ge 60) {
                    $3te3 = $3te3 - 60
                    $3te2 = $3te2 + 1
                    }
                }
                $3tc1 = $3te1 - $3ts1
                $3tc2 = $3te2 - $3ts2
                $3tc3 = $3te3 - $3ts3
                $3tc4 = $3te4 - $3ts4
                if ($3tc3 -lt 0) {
                $3tc3 = $3tc3 + 60
                $3tc2 = $3tc2 - 1
                }
                if (($3tc1.tostring().length) -eq 1) {
                $3tc1 = "0$3tc1"
                }
                if (($3tc2.tostring().length) -eq 1) {
                $3tc2 = "0$3tc2"
                }
                if (($3tc3.tostring().length) -eq 1) {
                $3tc3 = "0$3tc3"
                }
                if (($3tc4.tostring().length) -eq 1) {
                $3tc4 = "0$3tc4"
                }
                if (($3ts1.tostring().length) -eq 1) {
                $3ts1 = "0$3ts1"
                }
                if (($3ts2.tostring().length) -eq 1) {
                $3ts2 = "0$3ts2"
                }
                if (($3ts3.tostring().length) -eq 1) {
                $3ts3 = "0$3ts3"
                }
                if (($3ts4.tostring().length) -eq 1) {
                $3ts4 = "0$3ts4"
                }
                $clip3Sps = "$3ts1`:$3ts2`:$3ts3.$3ts4"
                $clip3Rt = "$3tc1`:$3tc2`:$3tc3.$3tc4"
                $clip4ts = read-host -prompt "Input Start Time For Clip 4 (Format: XX:XX:XX:XX)"
                $4ts1,$4ts2,$4ts3,$4ts4 = $clip4ts.split(":")
                $4ts1 = [int]$4ts1
                $4ts2 = [int]$4ts2
                $4ts3 = [int]$4ts3
                $4ts4 = [int]$4ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $4ts3 = $4ts3 - 5
                    if ($4ts3 -lt 0) {
                        $4ts3 = $4ts3 + 60
                        $4ts2 = $4ts2 - 1
                    }
                }
                $clip4te = read-host -prompt "Input End Time For Clip 4 (Format: XX:XX:XX:XX)"
                $4te1,$4te2,$4te3,$4te4 = $clip4te.split(":")
                $4te1 = [int]$4te1
                $4te2 = [int]$4te2
                $4te3 = [int]$4te3
                $4te4 = [int]$4te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $4te3 = $4te3 + 5
                    if ($4te3 -ge 60) {
                    $4te3 = $4te3 - 60
                    $4te2 = $4te2 + 1
                    }
                }
                $4tc1 = $4te1 - $4ts1
                $4tc2 = $4te2 - $4ts2
                $4tc3 = $4te3 - $4ts3
                $4tc4 = $4te4 - $4ts4
                if ($4tc3 -lt 0) {
                $4tc3 = $4tc3 + 60
                $4tc2 = $4tc2 - 1
                }
                if (($4tc1.tostring().length) -eq 1) {
                $4tc1 = "0$4tc1"
                }
                if (($4tc2.tostring().length) -eq 1) {
                $4tc2 = "0$4tc2"
                }
                if (($4tc3.tostring().length) -eq 1) {
                $4tc3 = "0$4tc3"
                }
                if (($4tc4.tostring().length) -eq 1) {
                $4tc4 = "0$4tc4"
                }
                if (($4ts1.tostring().length) -eq 1) {
                $4ts1 = "0$4ts1"
                }
                if (($4ts2.tostring().length) -eq 1) {
                $4ts2 = "0$4ts2"
                }
                if (($4ts3.tostring().length) -eq 1) {
                $4ts3 = "0$4ts3"
                }
                if (($4ts4.tostring().length) -eq 1) {
                $4ts4 = "0$4ts4"
                }
                $clip4Sps = "$4ts1`:$4ts2`:$4ts3.$4ts4"
                $clip4Rt = "$4tc1`:$4tc2`:$4tc3.$4tc4"
                $clip5ts = read-host -prompt "Input Start Time For Clip 5 (Format: XX:XX:XX:XX)"
                $5ts1,$5ts2,$5ts3,$5ts4 = $clip5ts.split(":")
                $5ts1 = [int]$5ts1
                $5ts2 = [int]$5ts2
                $5ts3 = [int]$5ts3
                $5ts4 = [int]$5ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $5ts3 = $5ts3 - 5
                    if ($5ts3 -lt 0) {
                        $5ts3 = $5ts3 + 60
                        $5ts2 = $5ts2 - 1
                    }
                }
                $clip5te = read-host -prompt "Input End Time For Clip 5 (Format: XX:XX:XX:XX)"
                $5te1,$5te2,$5te3,$5te4 = $clip5te.split(":")
                $5te1 = [int]$5te1
                $5te2 = [int]$5te2
                $5te3 = [int]$5te3
                $5te4 = [int]$5te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $5te3 = $5te3 + 5
                    if ($5te3 -ge 60) {
                    $5te3 = $5te3 - 60
                    $5te2 = $5te2 + 1
                    }
                }
                $5tc1 = $5te1 - $5ts1
                $5tc2 = $5te2 - $5ts2
                $5tc3 = $5te3 - $5ts3
                $5tc4 = $5te4 - $5ts4
                if ($5tc3 -lt 0) {
                $5tc3 = $5tc3 + 60
                $5tc2 = $5tc2 - 1
                }
                if (($5tc1.tostring().length) -eq 1) {
                $5tc1 = "0$5tc1"
                }
                if (($5tc2.tostring().length) -eq 1) {
                $5tc2 = "0$5tc2"
                }
                if (($5tc3.tostring().length) -eq 1) {
                $5tc3 = "0$5tc3"
                }
                if (($5tc4.tostring().length) -eq 1) {
                $5tc4 = "0$5tc4"
                }
                if (($5ts1.tostring().length) -eq 1) {
                $5ts1 = "0$5ts1"
                }
                if (($5ts2.tostring().length) -eq 1) {
                $5ts2 = "0$5ts2"
                }
                if (($5ts3.tostring().length) -eq 1) {
                $5ts3 = "0$5ts3"
                }
                if (($5ts4.tostring().length) -eq 1) {
                $5ts4 = "0$5ts4"
                }
                $clip5Sps = "$5ts1`:$5ts2`:$5ts3.$5ts4"
                $clip5Rt = "$5tc1`:$5tc2`:$5tc3.$5tc4"
                $clip6ts = read-host -prompt "Input Start Time For Clip 6 (Format: XX:XX:XX:XX)"
                $6ts1,$6ts2,$6ts3,$6ts4 = $clip6ts.split(":")
                $6ts1 = [int]$6ts1
                $6ts2 = [int]$6ts2
                $6ts3 = [int]$6ts3
                $6ts4 = [int]$6ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                $6ts3 = $6ts3 - 5
                    if ($6ts3 -lt 0) {
                        $6ts3 = $6ts3 + 60
                        $6ts2 = $6ts2 - 1
                    }
                }
                $clip6te = read-host -prompt "Input End Time For Clip 6 (Format: XX:XX:XX:XX)"
                $6te1,$6te2,$6te3,$6te4 = $clip6te.split(":")
                $6te1 = [int]$6te1
                $6te2 = [int]$6te2
                $6te3 = [int]$6te3
                $6te4 = [int]$6te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $6te3 = $6te3 + 5
                    if ($6te3 -ge 60) {
                    $6te3 = $6te3 - 60
                    $6te2 = $6te2 + 1
                    }
                }
                $6tc1 = $6te1 - $6ts1
                $6tc2 = $6te2 - $6ts2
                $6tc3 = $6te3 - $6ts3
                $6tc4 = $6te4 - $6ts4
                if ($6tc3 -lt 0) {
                $6tc3 = $6tc3 + 60
                $6tc2 = $6tc2 - 1
                }
                if (($6tc1.tostring().length) -eq 1) {
                $6tc1 = "0$6tc1"
                }
                if (($6tc2.tostring().length) -eq 1) {
                $6tc2 = "0$6tc2"
                }
                if (($6tc3.tostring().length) -eq 1) {
                $6tc3 = "0$6tc3"
                }
                if (($6tc4.tostring().length) -eq 1) {
                $6tc4 = "0$6tc4"
                }
                if (($6ts1.tostring().length) -eq 1) {
                $6ts1 = "0$6ts1"
                }
                if (($6ts2.tostring().length) -eq 1) {
                $6ts2 = "0$6ts2"
                }
                if (($6ts3.tostring().length) -eq 1) {
                $6ts3 = "0$6ts3"
                }
                if (($6ts4.tostring().length) -eq 1) {
                $6ts4 = "0$6ts4"
                }
                $clip6Sps = "$6ts1`:$6ts2`:$6ts3.$6ts4"
                $clip6Rt = "$6tc1`:$6tc2`:$6tc3.$6tc4"
                $glink = youtube-dl -g "$inlink"
                while (!$glink) {$glink = youtube-dl -g "$inlink"}
                ffmpeg -hide_banner -loglevel error -ss $clip1Sps -i ($glink) -t $clip1Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip2Sps -i ($glink) -t $clip2Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip3Sps -i ($glink) -t $clip3Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip4Sps -i ($glink) -t $clip4Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip5Sps -i ($glink) -t $clip5Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip6Sps -i ($glink) -t $clip6Rt "clip$clipnum.mkv"
                $needsstitching = read-host -prompt 'Do you want to stitch clips? [Y/N]'
                if ($needsstitching -eq "Y" -or $needsstitching -eq "y") {
                   &$HoloStitcher
                }
                else {
                    write-host "Clipping Complete!"    
                    return
                }
            }
            if ($miniclipnum -eq 7) {
                $clip1ts = read-host -prompt "Input Start Time For Clip 1 (Format: XX:XX:XX:XX)"
                $1ts1,$1ts2,$1ts3,$1ts4 = $clip1ts.split(":")
                $1ts1 = [int]$1ts1
                $1ts2 = [int]$1ts2
                $1ts3 = [int]$1ts3
                $1ts4 = [int]$1ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $1ts3 = $1ts3 - 5
                    if ($1ts3 -lt 0) {
                        $1ts3 = $1ts3 + 60
                        $1ts2 = $1ts2 - 1
                    }
                }
                $clip1te = read-host -prompt "Input End Time For Clip 1 (Format: XX:XX:XX:XX)"
                $1te1,$1te2,$1te3,$1te4 = $clip1te.split(":")
                $1te1 = [int]$1te1
                $1te2 = [int]$1te2
                $1te3 = [int]$1te3
                $1te4 = [int]$1te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $1te3 = $1te3 + 5
                    if ($1te3 -ge 60) {
                    $1te3 = $1te3 - 60
                    $1te2 = $1te2 + 1
                    }
                }
                $1tc1 = $1te1 - $1ts1
                $1tc2 = $1te2 - $1ts2
                $1tc3 = $1te3 - $1ts3
                $1tc4 = $1te4 - $1ts4
                if ($1tc3 -lt 0) {
                $1tc3 = $1tc3 + 60
                $1tc2 = $1tc2 - 1
                }
                if (($1tc1.tostring().length) -eq 1) {
                $1tc1 = "0$1tc1"
                }
                if (($1tc2.tostring().length) -eq 1) {
                $1tc2 = "0$1tc2"
                }
                if (($1tc3.tostring().length) -eq 1) {
                $1tc3 = "0$1tc3"
                }
                if (($1tc4.tostring().length) -eq 1) {
                $1tc4 = "0$1tc4"
                }
                if (($1ts1.tostring().length) -eq 1) {
                $1ts1 = "0$1ts1"
                }
                if (($1ts2.tostring().length) -eq 1) {
                $1ts2 = "0$1ts2"
                }
                if (($1ts3.tostring().length) -eq 1) {
                $1ts3 = "0$1ts3"
                }
                if (($1ts4.tostring().length) -eq 1) {
                $1ts4 = "0$1ts4"
                }
                $clip1Sps = "$1ts1`:$1ts2`:$1ts3.$1ts4"
                $clip1Rt = "$1tc1`:$1tc2`:$1tc3.$1tc4"
                $clip2ts = read-host -prompt "Input Start Time For Clip 2 (Format: XX:XX:XX:XX)"
                $2ts1,$2ts2,$2ts3,$2ts4 = $clip2ts.split(":")
                $2ts1 = [int]$2ts1
                $2ts2 = [int]$2ts2
                $2ts3 = [int]$2ts3
                $2ts4 = [int]$2ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $2ts3 = $2ts3 - 5
                    if ($2ts3 -lt 0) {
                        $2ts3 = $2ts3 + 60
                        $2ts2 = $2ts2 - 1
                    }
                }
                $clip2te = read-host -prompt "Input End Time For Clip 2 (Format: XX:XX:XX:XX)"
                $2te1,$2te2,$2te3,$2te4 = $clip2te.split(":")
                $2te1 = [int]$2te1
                $2te2 = [int]$2te2
                $2te3 = [int]$2te3
                $2te4 = [int]$2te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $2te3 = $2te3 + 5
                    if ($2te3 -ge 60) {
                    $2te3 = $2te3 - 60
                    $2te2 = $2te2 + 1
                    }
                }
                $2tc1 = $2te1 - $2ts1
                $2tc2 = $2te2 - $2ts2
                $2tc3 = $2te3 - $2ts3
                $2tc4 = $2te4 - $2ts4
                if ($2tc3 -lt 0) {
                $2tc3 = $2tc3 + 60
                $2tc2 = $2tc2 - 1
                }
                if (($2tc1.tostring().length) -eq 1) {
                $2tc1 = "0$2tc1"
                }
                if (($2tc2.tostring().length) -eq 1) {
                $2tc2 = "0$2tc2"
                }
                if (($2tc3.tostring().length) -eq 1) {
                $2tc3 = "0$2tc3"
                }
                if (($2tc4.tostring().length) -eq 1) {
                $2tc4 = "0$2tc4"
                }
                if (($2ts1.tostring().length) -eq 1) {
                $2ts1 = "0$2ts1"
                }
                if (($2ts2.tostring().length) -eq 1) {
                $2ts2 = "0$2ts2"
                }
                if (($2ts3.tostring().length) -eq 1) {
                $2ts3 = "0$2ts3"
                }
                if (($2ts4.tostring().length) -eq 1) {
                $2ts4 = "0$2ts4"
                }
                $clip3ts = read-host -prompt "Input Start Time For Clip 3 (Format: XX:XX:XX:XX)"
                $3ts1,$3ts2,$3ts3,$3ts4 = $clip3ts.split(":")
                $3ts1 = [int]$3ts1
                $3ts2 = [int]$3ts2
                $3ts3 = [int]$3ts3
                $3ts4 = [int]$3ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $3ts3 = $3ts3 - 5
                    if ($3ts3 -lt 0) {
                        $3ts3 = $3ts3 + 60
                        $3ts2 = $3ts2 - 1
                    }
                }
                $clip3te = read-host -prompt "Input End Time For Clip 3 (Format: XX:XX:XX:XX)"
                $3te1,$3te2,$3te3,$3te4 = $clip3te.split(":")
                $3te1 = [int]$3te1
                $3te2 = [int]$3te2
                $3te3 = [int]$3te3
                $3te4 = [int]$3te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $3te3 = $3te3 + 5
                    if ($3te3 -ge 60) {
                    $3te3 = $3te3 - 60
                    $3te2 = $3te2 + 1
                    }
                }
                $3tc1 = $3te1 - $3ts1
                $3tc2 = $3te2 - $3ts2
                $3tc3 = $3te3 - $3ts3
                $3tc4 = $3te4 - $3ts4
                if ($3tc3 -lt 0) {
                $3tc3 = $3tc3 + 60
                $3tc2 = $3tc2 - 1
                }
                if (($3tc1.tostring().length) -eq 1) {
                $3tc1 = "0$3tc1"
                }
                if (($3tc2.tostring().length) -eq 1) {
                $3tc2 = "0$3tc2"
                }
                if (($3tc3.tostring().length) -eq 1) {
                $3tc3 = "0$3tc3"
                }
                if (($3tc4.tostring().length) -eq 1) {
                $3tc4 = "0$3tc4"
                }
                if (($3ts1.tostring().length) -eq 1) {
                $3ts1 = "0$3ts1"
                }
                if (($3ts2.tostring().length) -eq 1) {
                $3ts2 = "0$3ts2"
                }
                if (($3ts3.tostring().length) -eq 1) {
                $3ts3 = "0$3ts3"
                }
                if (($3ts4.tostring().length) -eq 1) {
                $3ts4 = "0$3ts4"
                }
                $clip3Sps = "$3ts1`:$3ts2`:$3ts3.$3ts4"
                $clip3Rt = "$3tc1`:$3tc2`:$3tc3.$3tc4"
                $clip4ts = read-host -prompt "Input Start Time For Clip 4 (Format: XX:XX:XX:XX)"
                $4ts1,$4ts2,$4ts3,$4ts4 = $clip4ts.split(":")
                $4ts1 = [int]$4ts1
                $4ts2 = [int]$4ts2
                $4ts3 = [int]$4ts3
                $4ts4 = [int]$4ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $4ts3 = $4ts3 - 5
                    if ($4ts3 -lt 0) {
                        $4ts3 = $4ts3 + 60
                        $4ts2 = $4ts2 - 1
                    }
                }
                $clip4te = read-host -prompt "Input End Time For Clip 4 (Format: XX:XX:XX:XX)"
                $4te1,$4te2,$4te3,$4te4 = $clip4te.split(":")
                $4te1 = [int]$4te1
                $4te2 = [int]$4te2
                $4te3 = [int]$4te3
                $4te4 = [int]$4te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $4te3 = $4te3 + 5
                    if ($4te3 -ge 60) {
                    $4te3 = $4te3 - 60
                    $4te2 = $4te2 + 1
                    }
                }
                $4tc1 = $4te1 - $4ts1
                $4tc2 = $4te2 - $4ts2
                $4tc3 = $4te3 - $4ts3
                $4tc4 = $4te4 - $4ts4
                if ($4tc3 -lt 0) {
                $4tc3 = $4tc3 + 60
                $4tc2 = $4tc2 - 1
                }
                if (($4tc1.tostring().length) -eq 1) {
                $4tc1 = "0$4tc1"
                }
                if (($4tc2.tostring().length) -eq 1) {
                $4tc2 = "0$4tc2"
                }
                if (($4tc3.tostring().length) -eq 1) {
                $4tc3 = "0$4tc3"
                }
                if (($4tc4.tostring().length) -eq 1) {
                $4tc4 = "0$4tc4"
                }
                if (($4ts1.tostring().length) -eq 1) {
                $4ts1 = "0$4ts1"
                }
                if (($4ts2.tostring().length) -eq 1) {
                $4ts2 = "0$4ts2"
                }
                if (($4ts3.tostring().length) -eq 1) {
                $4ts3 = "0$4ts3"
                }
                if (($4ts4.tostring().length) -eq 1) {
                $4ts4 = "0$4ts4"
                }
                $clip4Sps = "$4ts1`:$4ts2`:$4ts3.$4ts4"
                $clip4Rt = "$4tc1`:$4tc2`:$4tc3.$4tc4"
                $clip5ts = read-host -prompt "Input Start Time For Clip 5 (Format: XX:XX:XX:XX)"
                $5ts1,$5ts2,$5ts3,$5ts4 = $clip5ts.split(":")
                $5ts1 = [int]$5ts1
                $5ts2 = [int]$5ts2
                $5ts3 = [int]$5ts3
                $5ts4 = [int]$5ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $5ts3 = $5ts3 - 5
                    if ($5ts3 -lt 0) {
                        $5ts3 = $5ts3 + 60
                        $5ts2 = $5ts2 - 1
                    }
                }
                $clip5te = read-host -prompt "Input End Time For Clip 5 (Format: XX:XX:XX:XX)"
                $5te1,$5te2,$5te3,$5te4 = $clip5te.split(":")
                $5te1 = [int]$5te1
                $5te2 = [int]$5te2
                $5te3 = [int]$5te3
                $5te4 = [int]$5te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $5te3 = $5te3 + 5
                    if ($5te3 -ge 60) {
                    $5te3 = $5te3 - 60
                    $5te2 = $5te2 + 1
                    }
                }
                $5tc1 = $5te1 - $5ts1
                $5tc2 = $5te2 - $5ts2
                $5tc3 = $5te3 - $5ts3
                $5tc4 = $5te4 - $5ts4
                if ($5tc3 -lt 0) {
                $5tc3 = $5tc3 + 60
                $5tc2 = $5tc2 - 1
                }
                if (($5tc1.tostring().length) -eq 1) {
                $5tc1 = "0$5tc1"
                }
                if (($5tc2.tostring().length) -eq 1) {
                $5tc2 = "0$5tc2"
                }
                if (($5tc3.tostring().length) -eq 1) {
                $5tc3 = "0$5tc3"
                }
                if (($5tc4.tostring().length) -eq 1) {
                $5tc4 = "0$5tc4"
                }
                if (($5ts1.tostring().length) -eq 1) {
                $5ts1 = "0$5ts1"
                }
                if (($5ts2.tostring().length) -eq 1) {
                $5ts2 = "0$5ts2"
                }
                if (($5ts3.tostring().length) -eq 1) {
                $5ts3 = "0$5ts3"
                }
                if (($5ts4.tostring().length) -eq 1) {
                $5ts4 = "0$5ts4"
                }
                $clip5Sps = "$5ts1`:$5ts2`:$5ts3.$5ts4"
                $clip5Rt = "$5tc1`:$5tc2`:$5tc3.$5tc4"
                $clip6ts = read-host -prompt "Input Start Time For Clip 6 (Format: XX:XX:XX:XX)"
                $6ts1,$6ts2,$6ts3,$6ts4 = $clip6ts.split(":")
                $6ts1 = [int]$6ts1
                $6ts2 = [int]$6ts2
                $6ts3 = [int]$6ts3
                $6ts4 = [int]$6ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                $6ts3 = $6ts3 - 5
                    if ($6ts3 -lt 0) {
                        $6ts3 = $6ts3 + 60
                        $6ts2 = $6ts2 - 1
                    }
                }
                $clip6te = read-host -prompt "Input End Time For Clip 6 (Format: XX:XX:XX:XX)"
                $6te1,$6te2,$6te3,$6te4 = $clip6te.split(":")
                $6te1 = [int]$6te1
                $6te2 = [int]$6te2
                $6te3 = [int]$6te3
                $6te4 = [int]$6te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $6te3 = $6te3 + 5
                    if ($6te3 -ge 60) {
                    $6te3 = $6te3 - 60
                    $6te2 = $6te2 + 1
                    }
                }
                $6tc1 = $6te1 - $6ts1
                $6tc2 = $6te2 - $6ts2
                $6tc3 = $6te3 - $6ts3
                $6tc4 = $6te4 - $6ts4
                if ($6tc3 -lt 0) {
                $6tc3 = $6tc3 + 60
                $6tc2 = $6tc2 - 1
                }
                if (($6tc1.tostring().length) -eq 1) {
                $6tc1 = "0$6tc1"
                }
                if (($6tc2.tostring().length) -eq 1) {
                $6tc2 = "0$6tc2"
                }
                if (($6tc3.tostring().length) -eq 1) {
                $6tc3 = "0$6tc3"
                }
                if (($6tc4.tostring().length) -eq 1) {
                $6tc4 = "0$6tc4"
                }
                if (($6ts1.tostring().length) -eq 1) {
                $6ts1 = "0$6ts1"
                }
                if (($6ts2.tostring().length) -eq 1) {
                $6ts2 = "0$6ts2"
                }
                if (($6ts3.tostring().length) -eq 1) {
                $6ts3 = "0$6ts3"
                }
                if (($6ts4.tostring().length) -eq 1) {
                $6ts4 = "0$6ts4"
                }
                $clip6Sps = "$6ts1`:$6ts2`:$6ts3.$6ts4"
                $clip6Rt = "$6tc1`:$6tc2`:$6tc3.$6tc4"
                $clip7ts = read-host -prompt "Input Start Time For Clip 7 (Format: XX:XX:XX:XX)"
                $7ts1,$7ts2,$7ts3,$7ts4 = $clip7ts.split(":")
                $7ts1 = [int]$7ts1
                $7ts2 = [int]$7ts2
                $7ts3 = [int]$7ts3
                $7ts4 = [int]$7ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $7ts3 = $7ts3 - 5
                    if ($7ts3 -lt 0) {
                        $7ts3 = $7ts3 + 60
                        $7ts2 = $7ts2 - 1
                    }
                }
                $clip7te = read-host -prompt "Input End Time For Clip 7 (Format: XX:XX:XX:XX)"
                $7te1,$7te2,$7te3,$7te4 = $clip7te.split(":")
                $7te1 = [int]$7te1
                $7te2 = [int]$7te2
                $7te3 = [int]$7te3
                $7te4 = [int]$7te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $7te3 = $7te3 + 5
                    if ($7te3 -ge 60) {
                    $7te3 = $7te3 - 60
                    $7te2 = $7te2 + 1
                    }
                }
                $7tc1 = $7te1 - $7ts1
                $7tc2 = $7te2 - $7ts2
                $7tc3 = $7te3 - $7ts3
                $7tc4 = $7te4 - $7ts4
                if ($7tc3 -lt 0) {
                $7tc3 = $7tc3 + 60
                $7tc2 = $7tc2 - 1
                }
                if (($7tc1.tostring().length) -eq 1) {
                $7tc1 = "0$7tc1"
                }
                if (($7tc2.tostring().length) -eq 1) {
                $7tc2 = "0$7tc2"
                }
                if (($7tc3.tostring().length) -eq 1) {
                $7tc3 = "0$7tc3"
                }
                if (($7tc4.tostring().length) -eq 1) {
                $7tc4 = "0$7tc4"
                }
                if (($7ts1.tostring().length) -eq 1) {
                $7ts1 = "0$7ts1"
                }
                if (($7ts2.tostring().length) -eq 1) {
                $7ts2 = "0$7ts2"
                }
                if (($7ts3.tostring().length) -eq 1) {
                $7ts3 = "0$7ts3"
                }
                if (($7ts4.tostring().length) -eq 1) {
                $7ts4 = "0$7ts4"
                }
                $clip7Sps = "$7ts1`:$7ts2`:$7ts3.$7ts4"
                $clip7Rt = "$7tc1`:$7tc2`:$7tc3.$7tc4"
                $glink = youtube-dl -g "$inlink"
                while (!$glink) {$glink = youtube-dl -g "$inlink"}
                ffmpeg -hide_banner -loglevel error -ss $clip1Sps -i ($glink) -t $clip1Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip2Sps -i ($glink) -t $clip2Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip3Sps -i ($glink) -t $clip3Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip4Sps -i ($glink) -t $clip4Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip5Sps -i ($glink) -t $clip5Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip6Sps -i ($glink) -t $clip6Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip7Sps -i ($glink) -t $clip7Rt "clip$clipnum.mkv"
                $needsstitching = read-host -prompt 'Do you want to stitch clips? [Y/N]'
                if ($needsstitching -eq "Y" -or $needsstitching -eq "y") {
                   &$HoloStitcher
                }
                else {
                    write-host "Clipping Complete!"    
                    return
                }
            }
            if ($miniclipnum -eq 8) {
                $clip1ts = read-host -prompt "Input Start Time For Clip 1 (Format: XX:XX:XX:XX)"
                $1ts1,$1ts2,$1ts3,$1ts4 = $clip1ts.split(":")
                $1ts1 = [int]$1ts1
                $1ts2 = [int]$1ts2
                $1ts3 = [int]$1ts3
                $1ts4 = [int]$1ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $1ts3 = $1ts3 - 5
                    if ($1ts3 -lt 0) {
                        $1ts3 = $1ts3 + 60
                        $1ts2 = $1ts2 - 1
                    }
                }
                $clip1te = read-host -prompt "Input End Time For Clip 1 (Format: XX:XX:XX:XX)"
                $1te1,$1te2,$1te3,$1te4 = $clip1te.split(":")
                $1te1 = [int]$1te1
                $1te2 = [int]$1te2
                $1te3 = [int]$1te3
                $1te4 = [int]$1te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $1te3 = $1te3 + 5
                    if ($1te3 -ge 60) {
                    $1te3 = $1te3 - 60
                    $1te2 = $1te2 + 1
                    }
                }
                $1tc1 = $1te1 - $1ts1
                $1tc2 = $1te2 - $1ts2
                $1tc3 = $1te3 - $1ts3
                $1tc4 = $1te4 - $1ts4
                if ($1tc3 -lt 0) {
                $1tc3 = $1tc3 + 60
                $1tc2 = $1tc2 - 1
                }
                if (($1tc1.tostring().length) -eq 1) {
                $1tc1 = "0$1tc1"
                }
                if (($1tc2.tostring().length) -eq 1) {
                $1tc2 = "0$1tc2"
                }
                if (($1tc3.tostring().length) -eq 1) {
                $1tc3 = "0$1tc3"
                }
                if (($1tc4.tostring().length) -eq 1) {
                $1tc4 = "0$1tc4"
                }
                if (($1ts1.tostring().length) -eq 1) {
                $1ts1 = "0$1ts1"
                }
                if (($1ts2.tostring().length) -eq 1) {
                $1ts2 = "0$1ts2"
                }
                if (($1ts3.tostring().length) -eq 1) {
                $1ts3 = "0$1ts3"
                }
                if (($1ts4.tostring().length) -eq 1) {
                $1ts4 = "0$1ts4"
                }
                $clip1Sps = "$1ts1`:$1ts2`:$1ts3.$1ts4"
                $clip1Rt = "$1tc1`:$1tc2`:$1tc3.$1tc4"
                $clip2ts = read-host -prompt "Input Start Time For Clip 2 (Format: XX:XX:XX:XX)"
                $2ts1,$2ts2,$2ts3,$2ts4 = $clip2ts.split(":")
                $2ts1 = [int]$2ts1
                $2ts2 = [int]$2ts2
                $2ts3 = [int]$2ts3
                $2ts4 = [int]$2ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $2ts3 = $2ts3 - 5
                    if ($2ts3 -lt 0) {
                        $2ts3 = $2ts3 + 60
                        $2ts2 = $2ts2 - 1
                    }
                }
                $clip2te = read-host -prompt "Input End Time For Clip 2 (Format: XX:XX:XX:XX)"
                $2te1,$2te2,$2te3,$2te4 = $clip2te.split(":")
                $2te1 = [int]$2te1
                $2te2 = [int]$2te2
                $2te3 = [int]$2te3
                $2te4 = [int]$2te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $2te3 = $2te3 + 5
                    if ($2te3 -ge 60) {
                    $2te3 = $2te3 - 60
                    $2te2 = $2te2 + 1
                    }
                }
                $2tc1 = $2te1 - $2ts1
                $2tc2 = $2te2 - $2ts2
                $2tc3 = $2te3 - $2ts3
                $2tc4 = $2te4 - $2ts4
                if ($2tc3 -lt 0) {
                $2tc3 = $2tc3 + 60
                $2tc2 = $2tc2 - 1
                }
                if (($2tc1.tostring().length) -eq 1) {
                $2tc1 = "0$2tc1"
                }
                if (($2tc2.tostring().length) -eq 1) {
                $2tc2 = "0$2tc2"
                }
                if (($2tc3.tostring().length) -eq 1) {
                $2tc3 = "0$2tc3"
                }
                if (($2tc4.tostring().length) -eq 1) {
                $2tc4 = "0$2tc4"
                }
                if (($2ts1.tostring().length) -eq 1) {
                $2ts1 = "0$2ts1"
                }
                if (($2ts2.tostring().length) -eq 1) {
                $2ts2 = "0$2ts2"
                }
                if (($2ts3.tostring().length) -eq 1) {
                $2ts3 = "0$2ts3"
                }
                if (($2ts4.tostring().length) -eq 1) {
                $2ts4 = "0$2ts4"
                }
                $clip3ts = read-host -prompt "Input Start Time For Clip 3 (Format: XX:XX:XX:XX)"
                $3ts1,$3ts2,$3ts3,$3ts4 = $clip3ts.split(":")
                $3ts1 = [int]$3ts1
                $3ts2 = [int]$3ts2
                $3ts3 = [int]$3ts3
                $3ts4 = [int]$3ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $3ts3 = $3ts3 - 5
                    if ($3ts3 -lt 0) {
                        $3ts3 = $3ts3 + 60
                        $3ts2 = $3ts2 - 1
                    }
                }
                $clip3te = read-host -prompt "Input End Time For Clip 3 (Format: XX:XX:XX:XX)"
                $3te1,$3te2,$3te3,$3te4 = $clip3te.split(":")
                $3te1 = [int]$3te1
                $3te2 = [int]$3te2
                $3te3 = [int]$3te3
                $3te4 = [int]$3te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $3te3 = $3te3 + 5
                    if ($3te3 -ge 60) {
                    $3te3 = $3te3 - 60
                    $3te2 = $3te2 + 1
                    }
                }
                $3tc1 = $3te1 - $3ts1
                $3tc2 = $3te2 - $3ts2
                $3tc3 = $3te3 - $3ts3
                $3tc4 = $3te4 - $3ts4
                if ($3tc3 -lt 0) {
                $3tc3 = $3tc3 + 60
                $3tc2 = $3tc2 - 1
                }
                if (($3tc1.tostring().length) -eq 1) {
                $3tc1 = "0$3tc1"
                }
                if (($3tc2.tostring().length) -eq 1) {
                $3tc2 = "0$3tc2"
                }
                if (($3tc3.tostring().length) -eq 1) {
                $3tc3 = "0$3tc3"
                }
                if (($3tc4.tostring().length) -eq 1) {
                $3tc4 = "0$3tc4"
                }
                if (($3ts1.tostring().length) -eq 1) {
                $3ts1 = "0$3ts1"
                }
                if (($3ts2.tostring().length) -eq 1) {
                $3ts2 = "0$3ts2"
                }
                if (($3ts3.tostring().length) -eq 1) {
                $3ts3 = "0$3ts3"
                }
                if (($3ts4.tostring().length) -eq 1) {
                $3ts4 = "0$3ts4"
                }
                $clip3Sps = "$3ts1`:$3ts2`:$3ts3.$3ts4"
                $clip3Rt = "$3tc1`:$3tc2`:$3tc3.$3tc4"
                $clip4ts = read-host -prompt "Input Start Time For Clip 4 (Format: XX:XX:XX:XX)"
                $4ts1,$4ts2,$4ts3,$4ts4 = $clip4ts.split(":")
                $4ts1 = [int]$4ts1
                $4ts2 = [int]$4ts2
                $4ts3 = [int]$4ts3
                $4ts4 = [int]$4ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $4ts3 = $4ts3 - 5
                    if ($4ts3 -lt 0) {
                        $4ts3 = $4ts3 + 60
                        $4ts2 = $4ts2 - 1
                    }
                }
                $clip4te = read-host -prompt "Input End Time For Clip 4 (Format: XX:XX:XX:XX)"
                $4te1,$4te2,$4te3,$4te4 = $clip4te.split(":")
                $4te1 = [int]$4te1
                $4te2 = [int]$4te2
                $4te3 = [int]$4te3
                $4te4 = [int]$4te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $4te3 = $4te3 + 5
                    if ($4te3 -ge 60) {
                    $4te3 = $4te3 - 60
                    $4te2 = $4te2 + 1
                    }
                }
                $4tc1 = $4te1 - $4ts1
                $4tc2 = $4te2 - $4ts2
                $4tc3 = $4te3 - $4ts3
                $4tc4 = $4te4 - $4ts4
                if ($4tc3 -lt 0) {
                $4tc3 = $4tc3 + 60
                $4tc2 = $4tc2 - 1
                }
                if (($4tc1.tostring().length) -eq 1) {
                $4tc1 = "0$4tc1"
                }
                if (($4tc2.tostring().length) -eq 1) {
                $4tc2 = "0$4tc2"
                }
                if (($4tc3.tostring().length) -eq 1) {
                $4tc3 = "0$4tc3"
                }
                if (($4tc4.tostring().length) -eq 1) {
                $4tc4 = "0$4tc4"
                }
                if (($4ts1.tostring().length) -eq 1) {
                $4ts1 = "0$4ts1"
                }
                if (($4ts2.tostring().length) -eq 1) {
                $4ts2 = "0$4ts2"
                }
                if (($4ts3.tostring().length) -eq 1) {
                $4ts3 = "0$4ts3"
                }
                if (($4ts4.tostring().length) -eq 1) {
                $4ts4 = "0$4ts4"
                }
                $clip4Sps = "$4ts1`:$4ts2`:$4ts3.$4ts4"
                $clip4Rt = "$4tc1`:$4tc2`:$4tc3.$4tc4"
                $clip5ts = read-host -prompt "Input Start Time For Clip 5 (Format: XX:XX:XX:XX)"
                $5ts1,$5ts2,$5ts3,$5ts4 = $clip5ts.split(":")
                $5ts1 = [int]$5ts1
                $5ts2 = [int]$5ts2
                $5ts3 = [int]$5ts3
                $5ts4 = [int]$5ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $5ts3 = $5ts3 - 5
                    if ($5ts3 -lt 0) {
                        $5ts3 = $5ts3 + 60
                        $5ts2 = $5ts2 - 1
                    }
                }
                $clip5te = read-host -prompt "Input End Time For Clip 5 (Format: XX:XX:XX:XX)"
                $5te1,$5te2,$5te3,$5te4 = $clip5te.split(":")
                $5te1 = [int]$5te1
                $5te2 = [int]$5te2
                $5te3 = [int]$5te3
                $5te4 = [int]$5te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $5te3 = $5te3 + 5
                    if ($5te3 -ge 60) {
                    $5te3 = $5te3 - 60
                    $5te2 = $5te2 + 1
                    }
                }
                $5tc1 = $5te1 - $5ts1
                $5tc2 = $5te2 - $5ts2
                $5tc3 = $5te3 - $5ts3
                $5tc4 = $5te4 - $5ts4
                if ($5tc3 -lt 0) {
                $5tc3 = $5tc3 + 60
                $5tc2 = $5tc2 - 1
                }
                if (($5tc1.tostring().length) -eq 1) {
                $5tc1 = "0$5tc1"
                }
                if (($5tc2.tostring().length) -eq 1) {
                $5tc2 = "0$5tc2"
                }
                if (($5tc3.tostring().length) -eq 1) {
                $5tc3 = "0$5tc3"
                }
                if (($5tc4.tostring().length) -eq 1) {
                $5tc4 = "0$5tc4"
                }
                if (($5ts1.tostring().length) -eq 1) {
                $5ts1 = "0$5ts1"
                }
                if (($5ts2.tostring().length) -eq 1) {
                $5ts2 = "0$5ts2"
                }
                if (($5ts3.tostring().length) -eq 1) {
                $5ts3 = "0$5ts3"
                }
                if (($5ts4.tostring().length) -eq 1) {
                $5ts4 = "0$5ts4"
                }
                $clip5Sps = "$5ts1`:$5ts2`:$5ts3.$5ts4"
                $clip5Rt = "$5tc1`:$5tc2`:$5tc3.$5tc4"
                $clip6ts = read-host -prompt "Input Start Time For Clip 6 (Format: XX:XX:XX:XX)"
                $6ts1,$6ts2,$6ts3,$6ts4 = $clip6ts.split(":")
                $6ts1 = [int]$6ts1
                $6ts2 = [int]$6ts2
                $6ts3 = [int]$6ts3
                $6ts4 = [int]$6ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                $6ts3 = $6ts3 - 5
                    if ($6ts3 -lt 0) {
                        $6ts3 = $6ts3 + 60
                        $6ts2 = $6ts2 - 1
                    }
                }
                $clip6te = read-host -prompt "Input End Time For Clip 6 (Format: XX:XX:XX:XX)"
                $6te1,$6te2,$6te3,$6te4 = $clip6te.split(":")
                $6te1 = [int]$6te1
                $6te2 = [int]$6te2
                $6te3 = [int]$6te3
                $6te4 = [int]$6te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $6te3 = $6te3 + 5
                    if ($6te3 -ge 60) {
                    $6te3 = $6te3 - 60
                    $6te2 = $6te2 + 1
                    }
                }
                $6tc1 = $6te1 - $6ts1
                $6tc2 = $6te2 - $6ts2
                $6tc3 = $6te3 - $6ts3
                $6tc4 = $6te4 - $6ts4
                if ($6tc3 -lt 0) {
                $6tc3 = $6tc3 + 60
                $6tc2 = $6tc2 - 1
                }
                if (($6tc1.tostring().length) -eq 1) {
                $6tc1 = "0$6tc1"
                }
                if (($6tc2.tostring().length) -eq 1) {
                $6tc2 = "0$6tc2"
                }
                if (($6tc3.tostring().length) -eq 1) {
                $6tc3 = "0$6tc3"
                }
                if (($6tc4.tostring().length) -eq 1) {
                $6tc4 = "0$6tc4"
                }
                if (($6ts1.tostring().length) -eq 1) {
                $6ts1 = "0$6ts1"
                }
                if (($6ts2.tostring().length) -eq 1) {
                $6ts2 = "0$6ts2"
                }
                if (($6ts3.tostring().length) -eq 1) {
                $6ts3 = "0$6ts3"
                }
                if (($6ts4.tostring().length) -eq 1) {
                $6ts4 = "0$6ts4"
                }
                $clip6Sps = "$6ts1`:$6ts2`:$6ts3.$6ts4"
                $clip6Rt = "$6tc1`:$6tc2`:$6tc3.$6tc4"
                $clip7ts = read-host -prompt "Input Start Time For Clip 7 (Format: XX:XX:XX:XX)"
                $7ts1,$7ts2,$7ts3,$7ts4 = $clip7ts.split(":")
                $7ts1 = [int]$7ts1
                $7ts2 = [int]$7ts2
                $7ts3 = [int]$7ts3
                $7ts4 = [int]$7ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $7ts3 = $7ts3 - 5
                    if ($7ts3 -lt 0) {
                        $7ts3 = $7ts3 + 60
                        $7ts2 = $7ts2 - 1
                    }
                }
                $clip7te = read-host -prompt "Input End Time For Clip 7 (Format: XX:XX:XX:XX)"
                $7te1,$7te2,$7te3,$7te4 = $clip7te.split(":")
                $7te1 = [int]$7te1
                $7te2 = [int]$7te2
                $7te3 = [int]$7te3
                $7te4 = [int]$7te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $7te3 = $7te3 + 5
                    if ($7te3 -ge 60) {
                    $7te3 = $7te3 - 60
                    $7te2 = $7te2 + 1
                    }
                }
                $7tc1 = $7te1 - $7ts1
                $7tc2 = $7te2 - $7ts2
                $7tc3 = $7te3 - $7ts3
                $7tc4 = $7te4 - $7ts4
                if ($7tc3 -lt 0) {
                $7tc3 = $7tc3 + 60
                $7tc2 = $7tc2 - 1
                }
                if (($7tc1.tostring().length) -eq 1) {
                $7tc1 = "0$7tc1"
                }
                if (($7tc2.tostring().length) -eq 1) {
                $7tc2 = "0$7tc2"
                }
                if (($7tc3.tostring().length) -eq 1) {
                $7tc3 = "0$7tc3"
                }
                if (($7tc4.tostring().length) -eq 1) {
                $7tc4 = "0$7tc4"
                }
                if (($7ts1.tostring().length) -eq 1) {
                $7ts1 = "0$7ts1"
                }
                if (($7ts2.tostring().length) -eq 1) {
                $7ts2 = "0$7ts2"
                }
                if (($7ts3.tostring().length) -eq 1) {
                $7ts3 = "0$7ts3"
                }
                if (($7ts4.tostring().length) -eq 1) {
                $7ts4 = "0$7ts4"
                }
                $clip7Sps = "$7ts1`:$7ts2`:$7ts3.$7ts4"
                $clip7Rt = "$7tc1`:$7tc2`:$7tc3.$7tc4"
                $clip8ts = read-host -prompt "Input Start Time For Clip 8 (Format: XX:XX:XX:XX)"
                $8ts1,$8ts2,$8ts3,$8ts4 = $clip8ts.split(":")
                $8ts1 = [int]$8ts1
                $8ts2 = [int]$8ts2
                $8ts3 = [int]$8ts3
                $8ts4 = [int]$8ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $8ts3 = $8ts3 - 5
                    if ($8ts3 -lt 0) {
                        $8ts3 = $8ts3 + 60
                        $8ts2 = $8ts2 - 1
                    }
                }
                $clip8te = read-host -prompt "Input End Time For Clip 8 (Format: XX:XX:XX:XX)"
                $8te1,$8te2,$8te3,$8te4 = $clip8te.split(":")
                $8te1 = [int]$8te1
                $8te2 = [int]$8te2
                $8te3 = [int]$8te3
                $8te4 = [int]$8te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $8te3 = $8te3 + 5
                    if ($8te3 -ge 60) {
                    $8te3 = $8te3 - 60
                    $8te2 = $8te2 + 1
                    }
                }
                $8tc1 = $8te1 - $8ts1
                $8tc2 = $8te2 - $8ts2
                $8tc3 = $8te3 - $8ts3
                $8tc4 = $8te4 - $8ts4
                if ($8tc3 -lt 0) {
                $8tc3 = $8tc3 + 60
                $8tc2 = $8tc2 - 1
                }
                if (($8tc1.tostring().length) -eq 1) {
                $8tc1 = "0$8tc1"
                }
                if (($8tc2.tostring().length) -eq 1) {
                $8tc2 = "0$8tc2"
                }
                if (($8tc3.tostring().length) -eq 1) {
                $8tc3 = "0$8tc3"
                }
                if (($8tc4.tostring().length) -eq 1) {
                $8tc4 = "0$8tc4"
                }
                if (($8ts1.tostring().length) -eq 1) {
                $8ts1 = "0$8ts1"
                }
                if (($8ts2.tostring().length) -eq 1) {
                $8ts2 = "0$8ts2"
                }
                if (($8ts3.tostring().length) -eq 1) {
                $8ts3 = "0$8ts3"
                }
                if (($8ts4.tostring().length) -eq 1) {
                $8ts4 = "0$8ts4"
                }
                $clip8Sps = "$8ts1`:$8ts2`:$8ts3.$8ts4"
                $clip8Rt = "$8tc1`:$8tc2`:$8tc3.$8tc4"
                $glink = youtube-dl -g "$inlink"
                while (!$glink) {$glink = youtube-dl -g "$inlink"}
                ffmpeg -hide_banner -loglevel error -ss $clip1Sps -i ($glink) -t $clip1Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip2Sps -i ($glink) -t $clip2Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip3Sps -i ($glink) -t $clip3Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip4Sps -i ($glink) -t $clip4Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip5Sps -i ($glink) -t $clip5Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip6Sps -i ($glink) -t $clip6Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip7Sps -i ($glink) -t $clip7Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip8Sps -i ($glink) -t $clip8Rt "clip$clipnum.mkv"
                $needsstitching = read-host -prompt 'Do you want to stitch clips? [Y/N]'
                if ($needsstitching -eq "Y" -or $needsstitching -eq "y") {
                   &$HoloStitcher
                }
                else {
                    write-host "Clipping Complete!"    
                    return
                }
            }
            if ($miniclipnum -eq 9) {
                $clip1ts = read-host -prompt "Input Start Time For Clip 1 (Format: XX:XX:XX:XX)"
                $1ts1,$1ts2,$1ts3,$1ts4 = $clip1ts.split(":")
                $1ts1 = [int]$1ts1
                $1ts2 = [int]$1ts2
                $1ts3 = [int]$1ts3
                $1ts4 = [int]$1ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $1ts3 = $1ts3 - 5
                    if ($1ts3 -lt 0) {
                        $1ts3 = $1ts3 + 60
                        $1ts2 = $1ts2 - 1
                    }
                }
                $clip1te = read-host -prompt "Input End Time For Clip 1 (Format: XX:XX:XX:XX)"
                $1te1,$1te2,$1te3,$1te4 = $clip1te.split(":")
                $1te1 = [int]$1te1
                $1te2 = [int]$1te2
                $1te3 = [int]$1te3
                $1te4 = [int]$1te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $1te3 = $1te3 + 5
                    if ($1te3 -ge 60) {
                    $1te3 = $1te3 - 60
                    $1te2 = $1te2 + 1
                    }
                }
                $1tc1 = $1te1 - $1ts1
                $1tc2 = $1te2 - $1ts2
                $1tc3 = $1te3 - $1ts3
                $1tc4 = $1te4 - $1ts4
                if ($1tc3 -lt 0) {
                $1tc3 = $1tc3 + 60
                $1tc2 = $1tc2 - 1
                }
                if (($1tc1.tostring().length) -eq 1) {
                $1tc1 = "0$1tc1"
                }
                if (($1tc2.tostring().length) -eq 1) {
                $1tc2 = "0$1tc2"
                }
                if (($1tc3.tostring().length) -eq 1) {
                $1tc3 = "0$1tc3"
                }
                if (($1tc4.tostring().length) -eq 1) {
                $1tc4 = "0$1tc4"
                }
                if (($1ts1.tostring().length) -eq 1) {
                $1ts1 = "0$1ts1"
                }
                if (($1ts2.tostring().length) -eq 1) {
                $1ts2 = "0$1ts2"
                }
                if (($1ts3.tostring().length) -eq 1) {
                $1ts3 = "0$1ts3"
                }
                if (($1ts4.tostring().length) -eq 1) {
                $1ts4 = "0$1ts4"
                }
                $clip1Sps = "$1ts1`:$1ts2`:$1ts3.$1ts4"
                $clip1Rt = "$1tc1`:$1tc2`:$1tc3.$1tc4"
                $clip2ts = read-host -prompt "Input Start Time For Clip 2 (Format: XX:XX:XX:XX)"
                $2ts1,$2ts2,$2ts3,$2ts4 = $clip2ts.split(":")
                $2ts1 = [int]$2ts1
                $2ts2 = [int]$2ts2
                $2ts3 = [int]$2ts3
                $2ts4 = [int]$2ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $2ts3 = $2ts3 - 5
                    if ($2ts3 -lt 0) {
                        $2ts3 = $2ts3 + 60
                        $2ts2 = $2ts2 - 1
                    }
                }
                $clip2te = read-host -prompt "Input End Time For Clip 2 (Format: XX:XX:XX:XX)"
                $2te1,$2te2,$2te3,$2te4 = $clip2te.split(":")
                $2te1 = [int]$2te1
                $2te2 = [int]$2te2
                $2te3 = [int]$2te3
                $2te4 = [int]$2te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $2te3 = $2te3 + 5
                    if ($2te3 -ge 60) {
                    $2te3 = $2te3 - 60
                    $2te2 = $2te2 + 1
                    }
                }
                $2tc1 = $2te1 - $2ts1
                $2tc2 = $2te2 - $2ts2
                $2tc3 = $2te3 - $2ts3
                $2tc4 = $2te4 - $2ts4
                if ($2tc3 -lt 0) {
                $2tc3 = $2tc3 + 60
                $2tc2 = $2tc2 - 1
                }
                if (($2tc1.tostring().length) -eq 1) {
                $2tc1 = "0$2tc1"
                }
                if (($2tc2.tostring().length) -eq 1) {
                $2tc2 = "0$2tc2"
                }
                if (($2tc3.tostring().length) -eq 1) {
                $2tc3 = "0$2tc3"
                }
                if (($2tc4.tostring().length) -eq 1) {
                $2tc4 = "0$2tc4"
                }
                if (($2ts1.tostring().length) -eq 1) {
                $2ts1 = "0$2ts1"
                }
                if (($2ts2.tostring().length) -eq 1) {
                $2ts2 = "0$2ts2"
                }
                if (($2ts3.tostring().length) -eq 1) {
                $2ts3 = "0$2ts3"
                }
                if (($2ts4.tostring().length) -eq 1) {
                $2ts4 = "0$2ts4"
                }
                $clip3ts = read-host -prompt "Input Start Time For Clip 3 (Format: XX:XX:XX:XX)"
                $3ts1,$3ts2,$3ts3,$3ts4 = $clip3ts.split(":")
                $3ts1 = [int]$3ts1
                $3ts2 = [int]$3ts2
                $3ts3 = [int]$3ts3
                $3ts4 = [int]$3ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $3ts3 = $3ts3 - 5
                    if ($3ts3 -lt 0) {
                        $3ts3 = $3ts3 + 60
                        $3ts2 = $3ts2 - 1
                    }
                }
                $clip3te = read-host -prompt "Input End Time For Clip 3 (Format: XX:XX:XX:XX)"
                $3te1,$3te2,$3te3,$3te4 = $clip3te.split(":")
                $3te1 = [int]$3te1
                $3te2 = [int]$3te2
                $3te3 = [int]$3te3
                $3te4 = [int]$3te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $3te3 = $3te3 + 5
                    if ($3te3 -ge 60) {
                    $3te3 = $3te3 - 60
                    $3te2 = $3te2 + 1
                    }
                }
                $3tc1 = $3te1 - $3ts1
                $3tc2 = $3te2 - $3ts2
                $3tc3 = $3te3 - $3ts3
                $3tc4 = $3te4 - $3ts4
                if ($3tc3 -lt 0) {
                $3tc3 = $3tc3 + 60
                $3tc2 = $3tc2 - 1
                }
                if (($3tc1.tostring().length) -eq 1) {
                $3tc1 = "0$3tc1"
                }
                if (($3tc2.tostring().length) -eq 1) {
                $3tc2 = "0$3tc2"
                }
                if (($3tc3.tostring().length) -eq 1) {
                $3tc3 = "0$3tc3"
                }
                if (($3tc4.tostring().length) -eq 1) {
                $3tc4 = "0$3tc4"
                }
                if (($3ts1.tostring().length) -eq 1) {
                $3ts1 = "0$3ts1"
                }
                if (($3ts2.tostring().length) -eq 1) {
                $3ts2 = "0$3ts2"
                }
                if (($3ts3.tostring().length) -eq 1) {
                $3ts3 = "0$3ts3"
                }
                if (($3ts4.tostring().length) -eq 1) {
                $3ts4 = "0$3ts4"
                }
                $clip3Sps = "$3ts1`:$3ts2`:$3ts3.$3ts4"
                $clip3Rt = "$3tc1`:$3tc2`:$3tc3.$3tc4"
                $clip4ts = read-host -prompt "Input Start Time For Clip 4 (Format: XX:XX:XX:XX)"
                $4ts1,$4ts2,$4ts3,$4ts4 = $clip4ts.split(":")
                $4ts1 = [int]$4ts1
                $4ts2 = [int]$4ts2
                $4ts3 = [int]$4ts3
                $4ts4 = [int]$4ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $4ts3 = $4ts3 - 5
                    if ($4ts3 -lt 0) {
                        $4ts3 = $4ts3 + 60
                        $4ts2 = $4ts2 - 1
                    }
                }
                $clip4te = read-host -prompt "Input End Time For Clip 4 (Format: XX:XX:XX:XX)"
                $4te1,$4te2,$4te3,$4te4 = $clip4te.split(":")
                $4te1 = [int]$4te1
                $4te2 = [int]$4te2
                $4te3 = [int]$4te3
                $4te4 = [int]$4te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $4te3 = $4te3 + 5
                    if ($4te3 -ge 60) {
                    $4te3 = $4te3 - 60
                    $4te2 = $4te2 + 1
                    }
                }
                $4tc1 = $4te1 - $4ts1
                $4tc2 = $4te2 - $4ts2
                $4tc3 = $4te3 - $4ts3
                $4tc4 = $4te4 - $4ts4
                if ($4tc3 -lt 0) {
                $4tc3 = $4tc3 + 60
                $4tc2 = $4tc2 - 1
                }
                if (($4tc1.tostring().length) -eq 1) {
                $4tc1 = "0$4tc1"
                }
                if (($4tc2.tostring().length) -eq 1) {
                $4tc2 = "0$4tc2"
                }
                if (($4tc3.tostring().length) -eq 1) {
                $4tc3 = "0$4tc3"
                }
                if (($4tc4.tostring().length) -eq 1) {
                $4tc4 = "0$4tc4"
                }
                if (($4ts1.tostring().length) -eq 1) {
                $4ts1 = "0$4ts1"
                }
                if (($4ts2.tostring().length) -eq 1) {
                $4ts2 = "0$4ts2"
                }
                if (($4ts3.tostring().length) -eq 1) {
                $4ts3 = "0$4ts3"
                }
                if (($4ts4.tostring().length) -eq 1) {
                $4ts4 = "0$4ts4"
                }
                $clip4Sps = "$4ts1`:$4ts2`:$4ts3.$4ts4"
                $clip4Rt = "$4tc1`:$4tc2`:$4tc3.$4tc4"
                $clip5ts = read-host -prompt "Input Start Time For Clip 5 (Format: XX:XX:XX:XX)"
                $5ts1,$5ts2,$5ts3,$5ts4 = $clip5ts.split(":")
                $5ts1 = [int]$5ts1
                $5ts2 = [int]$5ts2
                $5ts3 = [int]$5ts3
                $5ts4 = [int]$5ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $5ts3 = $5ts3 - 5
                    if ($5ts3 -lt 0) {
                        $5ts3 = $5ts3 + 60
                        $5ts2 = $5ts2 - 1
                    }
                }
                $clip5te = read-host -prompt "Input End Time For Clip 5 (Format: XX:XX:XX:XX)"
                $5te1,$5te2,$5te3,$5te4 = $clip5te.split(":")
                $5te1 = [int]$5te1
                $5te2 = [int]$5te2
                $5te3 = [int]$5te3
                $5te4 = [int]$5te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $5te3 = $5te3 + 5
                    if ($5te3 -ge 60) {
                    $5te3 = $5te3 - 60
                    $5te2 = $5te2 + 1
                    }
                }
                $5tc1 = $5te1 - $5ts1
                $5tc2 = $5te2 - $5ts2
                $5tc3 = $5te3 - $5ts3
                $5tc4 = $5te4 - $5ts4
                if ($5tc3 -lt 0) {
                $5tc3 = $5tc3 + 60
                $5tc2 = $5tc2 - 1
                }
                if (($5tc1.tostring().length) -eq 1) {
                $5tc1 = "0$5tc1"
                }
                if (($5tc2.tostring().length) -eq 1) {
                $5tc2 = "0$5tc2"
                }
                if (($5tc3.tostring().length) -eq 1) {
                $5tc3 = "0$5tc3"
                }
                if (($5tc4.tostring().length) -eq 1) {
                $5tc4 = "0$5tc4"
                }
                if (($5ts1.tostring().length) -eq 1) {
                $5ts1 = "0$5ts1"
                }
                if (($5ts2.tostring().length) -eq 1) {
                $5ts2 = "0$5ts2"
                }
                if (($5ts3.tostring().length) -eq 1) {
                $5ts3 = "0$5ts3"
                }
                if (($5ts4.tostring().length) -eq 1) {
                $5ts4 = "0$5ts4"
                }
                $clip5Sps = "$5ts1`:$5ts2`:$5ts3.$5ts4"
                $clip5Rt = "$5tc1`:$5tc2`:$5tc3.$5tc4"
                $clip6ts = read-host -prompt "Input Start Time For Clip 6 (Format: XX:XX:XX:XX)"
                $6ts1,$6ts2,$6ts3,$6ts4 = $clip6ts.split(":")
                $6ts1 = [int]$6ts1
                $6ts2 = [int]$6ts2
                $6ts3 = [int]$6ts3
                $6ts4 = [int]$6ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                $6ts3 = $6ts3 - 5
                    if ($6ts3 -lt 0) {
                        $6ts3 = $6ts3 + 60
                        $6ts2 = $6ts2 - 1
                    }
                }
                $clip6te = read-host -prompt "Input End Time For Clip 6 (Format: XX:XX:XX:XX)"
                $6te1,$6te2,$6te3,$6te4 = $clip6te.split(":")
                $6te1 = [int]$6te1
                $6te2 = [int]$6te2
                $6te3 = [int]$6te3
                $6te4 = [int]$6te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $6te3 = $6te3 + 5
                    if ($6te3 -ge 60) {
                    $6te3 = $6te3 - 60
                    $6te2 = $6te2 + 1
                    }
                }
                $6tc1 = $6te1 - $6ts1
                $6tc2 = $6te2 - $6ts2
                $6tc3 = $6te3 - $6ts3
                $6tc4 = $6te4 - $6ts4
                if ($6tc3 -lt 0) {
                $6tc3 = $6tc3 + 60
                $6tc2 = $6tc2 - 1
                }
                if (($6tc1.tostring().length) -eq 1) {
                $6tc1 = "0$6tc1"
                }
                if (($6tc2.tostring().length) -eq 1) {
                $6tc2 = "0$6tc2"
                }
                if (($6tc3.tostring().length) -eq 1) {
                $6tc3 = "0$6tc3"
                }
                if (($6tc4.tostring().length) -eq 1) {
                $6tc4 = "0$6tc4"
                }
                if (($6ts1.tostring().length) -eq 1) {
                $6ts1 = "0$6ts1"
                }
                if (($6ts2.tostring().length) -eq 1) {
                $6ts2 = "0$6ts2"
                }
                if (($6ts3.tostring().length) -eq 1) {
                $6ts3 = "0$6ts3"
                }
                if (($6ts4.tostring().length) -eq 1) {
                $6ts4 = "0$6ts4"
                }
                $clip6Sps = "$6ts1`:$6ts2`:$6ts3.$6ts4"
                $clip6Rt = "$6tc1`:$6tc2`:$6tc3.$6tc4"
                $clip7ts = read-host -prompt "Input Start Time For Clip 7 (Format: XX:XX:XX:XX)"
                $7ts1,$7ts2,$7ts3,$7ts4 = $clip7ts.split(":")
                $7ts1 = [int]$7ts1
                $7ts2 = [int]$7ts2
                $7ts3 = [int]$7ts3
                $7ts4 = [int]$7ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $7ts3 = $7ts3 - 5
                    if ($7ts3 -lt 0) {
                        $7ts3 = $7ts3 + 60
                        $7ts2 = $7ts2 - 1
                    }
                }
                $clip7te = read-host -prompt "Input End Time For Clip 7 (Format: XX:XX:XX:XX)"
                $7te1,$7te2,$7te3,$7te4 = $clip7te.split(":")
                $7te1 = [int]$7te1
                $7te2 = [int]$7te2
                $7te3 = [int]$7te3
                $7te4 = [int]$7te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $7te3 = $7te3 + 5
                    if ($7te3 -ge 60) {
                    $7te3 = $7te3 - 60
                    $7te2 = $7te2 + 1
                    }
                }
                $7tc1 = $7te1 - $7ts1
                $7tc2 = $7te2 - $7ts2
                $7tc3 = $7te3 - $7ts3
                $7tc4 = $7te4 - $7ts4
                if ($7tc3 -lt 0) {
                $7tc3 = $7tc3 + 60
                $7tc2 = $7tc2 - 1
                }
                if (($7tc1.tostring().length) -eq 1) {
                $7tc1 = "0$7tc1"
                }
                if (($7tc2.tostring().length) -eq 1) {
                $7tc2 = "0$7tc2"
                }
                if (($7tc3.tostring().length) -eq 1) {
                $7tc3 = "0$7tc3"
                }
                if (($7tc4.tostring().length) -eq 1) {
                $7tc4 = "0$7tc4"
                }
                if (($7ts1.tostring().length) -eq 1) {
                $7ts1 = "0$7ts1"
                }
                if (($7ts2.tostring().length) -eq 1) {
                $7ts2 = "0$7ts2"
                }
                if (($7ts3.tostring().length) -eq 1) {
                $7ts3 = "0$7ts3"
                }
                if (($7ts4.tostring().length) -eq 1) {
                $7ts4 = "0$7ts4"
                }
                $clip7Sps = "$7ts1`:$7ts2`:$7ts3.$7ts4"
                $clip7Rt = "$7tc1`:$7tc2`:$7tc3.$7tc4"
                $clip8ts = read-host -prompt "Input Start Time For Clip 8 (Format: XX:XX:XX:XX)"
                $8ts1,$8ts2,$8ts3,$8ts4 = $clip8ts.split(":")
                $8ts1 = [int]$8ts1
                $8ts2 = [int]$8ts2
                $8ts3 = [int]$8ts3
                $8ts4 = [int]$8ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $8ts3 = $8ts3 - 5
                    if ($8ts3 -lt 0) {
                        $8ts3 = $8ts3 + 60
                        $8ts2 = $8ts2 - 1
                    }
                }
                $clip8te = read-host -prompt "Input End Time For Clip 8 (Format: XX:XX:XX:XX)"
                $8te1,$8te2,$8te3,$8te4 = $clip8te.split(":")
                $8te1 = [int]$8te1
                $8te2 = [int]$8te2
                $8te3 = [int]$8te3
                $8te4 = [int]$8te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $8te3 = $8te3 + 5
                    if ($8te3 -ge 60) {
                    $8te3 = $8te3 - 60
                    $8te2 = $8te2 + 1
                    }
                }
                $8tc1 = $8te1 - $8ts1
                $8tc2 = $8te2 - $8ts2
                $8tc3 = $8te3 - $8ts3
                $8tc4 = $8te4 - $8ts4
                if ($8tc3 -lt 0) {
                $8tc3 = $8tc3 + 60
                $8tc2 = $8tc2 - 1
                }
                if (($8tc1.tostring().length) -eq 1) {
                $8tc1 = "0$8tc1"
                }
                if (($8tc2.tostring().length) -eq 1) {
                $8tc2 = "0$8tc2"
                }
                if (($8tc3.tostring().length) -eq 1) {
                $8tc3 = "0$8tc3"
                }
                if (($8tc4.tostring().length) -eq 1) {
                $8tc4 = "0$8tc4"
                }
                if (($8ts1.tostring().length) -eq 1) {
                $8ts1 = "0$8ts1"
                }
                if (($8ts2.tostring().length) -eq 1) {
                $8ts2 = "0$8ts2"
                }
                if (($8ts3.tostring().length) -eq 1) {
                $8ts3 = "0$8ts3"
                }
                if (($8ts4.tostring().length) -eq 1) {
                $8ts4 = "0$8ts4"
                }
                $clip8Sps = "$8ts1`:$8ts2`:$8ts3.$8ts4"
                $clip8Rt = "$8tc1`:$8tc2`:$8tc3.$8tc4"
                $clip9ts = read-host -prompt "Input Start Time For Clip 9 (Format: XX:XX:XX:XX)"
                $9ts1,$9ts2,$9ts3,$9ts4 = $clip9ts.split(":")
                $9ts1 = [int]$9ts1
                $9ts2 = [int]$9ts2
                $9ts3 = [int]$9ts3
                $9ts4 = [int]$9ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $9ts3 = $9ts3 - 5
                    if ($9ts3 -lt 0) {
                        $9ts3 = $9ts3 + 60
                        $9ts2 = $9ts2 - 1
                    }
                }
                $clip9te = read-host -prompt "Input End Time For Clip 9 (Format: XX:XX:XX:XX)"
                $9te1,$9te2,$9te3,$9te4 = $clip9te.split(":")
                $9te1 = [int]$9te1
                $9te2 = [int]$9te2
                $9te3 = [int]$9te3
                $9te4 = [int]$9te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $9te3 = $9te3 + 5
                    if ($9te3 -ge 60) {
                    $9te3 = $9te3 - 60
                    $9te2 = $9te2 + 1
                    }
                }
                $9tc1 = $9te1 - $9ts1
                $9tc2 = $9te2 - $9ts2
                $9tc3 = $9te3 - $9ts3
                $9tc4 = $9te4 - $9ts4
                if ($9tc3 -lt 0) {
                $9tc3 = $9tc3 + 60
                $9tc2 = $9tc2 - 1
                }
                if (($9tc1.tostring().length) -eq 1) {
                $9tc1 = "0$9tc1"
                }
                if (($9tc2.tostring().length) -eq 1) {
                $9tc2 = "0$9tc2"
                }
                if (($9tc3.tostring().length) -eq 1) {
                $9tc3 = "0$9tc3"
                }
                if (($9tc4.tostring().length) -eq 1) {
                $9tc4 = "0$9tc4"
                }
                if (($9ts1.tostring().length) -eq 1) {
                $9ts1 = "0$9ts1"
                }
                if (($9ts2.tostring().length) -eq 1) {
                $9ts2 = "0$9ts2"
                }
                if (($9ts3.tostring().length) -eq 1) {
                $9ts3 = "0$9ts3"
                }
                if (($9ts4.tostring().length) -eq 1) {
                $9ts4 = "0$9ts4"
                }
                $clip9Sps = "$9ts1`:$9ts2`:$9ts3.$9ts4"
                $clip9Rt = "$9tc1`:$9tc2`:$9tc3.$9tc4"
                $glink = youtube-dl -g "$inlink"
                while (!$glink) {$glink = youtube-dl -g "$inlink"}
                ffmpeg -hide_banner -loglevel error -ss $clip1Sps -i ($glink) -t $clip1Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip2Sps -i ($glink) -t $clip2Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip3Sps -i ($glink) -t $clip3Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip4Sps -i ($glink) -t $clip4Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip5Sps -i ($glink) -t $clip5Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip6Sps -i ($glink) -t $clip6Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip7Sps -i ($glink) -t $clip7Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip8Sps -i ($glink) -t $clip8Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip9Sps -i ($glink) -t $clip9Rt "clip$clipnum.mkv"
                $needsstitching = read-host -prompt 'Do you want to stitch clips? [Y/N]'
                if ($needsstitching -eq "Y" -or $needsstitching -eq "y") {
                   &$HoloStitcher
                }
                else {
                    write-host "Clipping Complete!"    
                    return
                }
            }
            if ($miniclipnum -eq 10) {
                $clip1ts = read-host -prompt "Input Start Time For Clip 1 (Format: XX:XX:XX:XX)"
                $1ts1,$1ts2,$1ts3,$1ts4 = $clip1ts.split(":")
                $1ts1 = [int]$1ts1
                $1ts2 = [int]$1ts2
                $1ts3 = [int]$1ts3
                $1ts4 = [int]$1ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $1ts3 = $1ts3 - 5
                    if ($1ts3 -lt 0) {
                        $1ts3 = $1ts3 + 60
                        $1ts2 = $1ts2 - 1
                    }
                }
                $clip1te = read-host -prompt "Input End Time For Clip 1 (Format: XX:XX:XX:XX)"
                $1te1,$1te2,$1te3,$1te4 = $clip1te.split(":")
                $1te1 = [int]$1te1
                $1te2 = [int]$1te2
                $1te3 = [int]$1te3
                $1te4 = [int]$1te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $1te3 = $1te3 + 5
                    if ($1te3 -ge 60) {
                    $1te3 = $1te3 - 60
                    $1te2 = $1te2 + 1
                    }
                }
                $1tc1 = $1te1 - $1ts1
                $1tc2 = $1te2 - $1ts2
                $1tc3 = $1te3 - $1ts3
                $1tc4 = $1te4 - $1ts4
                if ($1tc3 -lt 0) {
                $1tc3 = $1tc3 + 60
                $1tc2 = $1tc2 - 1
                }
                if (($1tc1.tostring().length) -eq 1) {
                $1tc1 = "0$1tc1"
                }
                if (($1tc2.tostring().length) -eq 1) {
                $1tc2 = "0$1tc2"
                }
                if (($1tc3.tostring().length) -eq 1) {
                $1tc3 = "0$1tc3"
                }
                if (($1tc4.tostring().length) -eq 1) {
                $1tc4 = "0$1tc4"
                }
                if (($1ts1.tostring().length) -eq 1) {
                $1ts1 = "0$1ts1"
                }
                if (($1ts2.tostring().length) -eq 1) {
                $1ts2 = "0$1ts2"
                }
                if (($1ts3.tostring().length) -eq 1) {
                $1ts3 = "0$1ts3"
                }
                if (($1ts4.tostring().length) -eq 1) {
                $1ts4 = "0$1ts4"
                }
                $clip1Sps = "$1ts1`:$1ts2`:$1ts3.$1ts4"
                $clip1Rt = "$1tc1`:$1tc2`:$1tc3.$1tc4"
                $clip2ts = read-host -prompt "Input Start Time For Clip 2 (Format: XX:XX:XX:XX)"
                $2ts1,$2ts2,$2ts3,$2ts4 = $clip2ts.split(":")
                $2ts1 = [int]$2ts1
                $2ts2 = [int]$2ts2
                $2ts3 = [int]$2ts3
                $2ts4 = [int]$2ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $2ts3 = $2ts3 - 5
                    if ($2ts3 -lt 0) {
                        $2ts3 = $2ts3 + 60
                        $2ts2 = $2ts2 - 1
                    }
                }
                $clip2te = read-host -prompt "Input End Time For Clip 2 (Format: XX:XX:XX:XX)"
                $2te1,$2te2,$2te3,$2te4 = $clip2te.split(":")
                $2te1 = [int]$2te1
                $2te2 = [int]$2te2
                $2te3 = [int]$2te3
                $2te4 = [int]$2te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $2te3 = $2te3 + 5
                    if ($2te3 -ge 60) {
                    $2te3 = $2te3 - 60
                    $2te2 = $2te2 + 1
                    }
                }
                $2tc1 = $2te1 - $2ts1
                $2tc2 = $2te2 - $2ts2
                $2tc3 = $2te3 - $2ts3
                $2tc4 = $2te4 - $2ts4
                if ($2tc3 -lt 0) {
                $2tc3 = $2tc3 + 60
                $2tc2 = $2tc2 - 1
                }
                if (($2tc1.tostring().length) -eq 1) {
                $2tc1 = "0$2tc1"
                }
                if (($2tc2.tostring().length) -eq 1) {
                $2tc2 = "0$2tc2"
                }
                if (($2tc3.tostring().length) -eq 1) {
                $2tc3 = "0$2tc3"
                }
                if (($2tc4.tostring().length) -eq 1) {
                $2tc4 = "0$2tc4"
                }
                if (($2ts1.tostring().length) -eq 1) {
                $2ts1 = "0$2ts1"
                }
                if (($2ts2.tostring().length) -eq 1) {
                $2ts2 = "0$2ts2"
                }
                if (($2ts3.tostring().length) -eq 1) {
                $2ts3 = "0$2ts3"
                }
                if (($2ts4.tostring().length) -eq 1) {
                $2ts4 = "0$2ts4"
                }
                $clip3ts = read-host -prompt "Input Start Time For Clip 3 (Format: XX:XX:XX:XX)"
                $3ts1,$3ts2,$3ts3,$3ts4 = $clip3ts.split(":")
                $3ts1 = [int]$3ts1
                $3ts2 = [int]$3ts2
                $3ts3 = [int]$3ts3
                $3ts4 = [int]$3ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $3ts3 = $3ts3 - 5
                    if ($3ts3 -lt 0) {
                        $3ts3 = $3ts3 + 60
                        $3ts2 = $3ts2 - 1
                    }
                }
                $clip3te = read-host -prompt "Input End Time For Clip 3 (Format: XX:XX:XX:XX)"
                $3te1,$3te2,$3te3,$3te4 = $clip3te.split(":")
                $3te1 = [int]$3te1
                $3te2 = [int]$3te2
                $3te3 = [int]$3te3
                $3te4 = [int]$3te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $3te3 = $3te3 + 5
                    if ($3te3 -ge 60) {
                    $3te3 = $3te3 - 60
                    $3te2 = $3te2 + 1
                    }
                }
                $3tc1 = $3te1 - $3ts1
                $3tc2 = $3te2 - $3ts2
                $3tc3 = $3te3 - $3ts3
                $3tc4 = $3te4 - $3ts4
                if ($3tc3 -lt 0) {
                $3tc3 = $3tc3 + 60
                $3tc2 = $3tc2 - 1
                }
                if (($3tc1.tostring().length) -eq 1) {
                $3tc1 = "0$3tc1"
                }
                if (($3tc2.tostring().length) -eq 1) {
                $3tc2 = "0$3tc2"
                }
                if (($3tc3.tostring().length) -eq 1) {
                $3tc3 = "0$3tc3"
                }
                if (($3tc4.tostring().length) -eq 1) {
                $3tc4 = "0$3tc4"
                }
                if (($3ts1.tostring().length) -eq 1) {
                $3ts1 = "0$3ts1"
                }
                if (($3ts2.tostring().length) -eq 1) {
                $3ts2 = "0$3ts2"
                }
                if (($3ts3.tostring().length) -eq 1) {
                $3ts3 = "0$3ts3"
                }
                if (($3ts4.tostring().length) -eq 1) {
                $3ts4 = "0$3ts4"
                }
                $clip3Sps = "$3ts1`:$3ts2`:$3ts3.$3ts4"
                $clip3Rt = "$3tc1`:$3tc2`:$3tc3.$3tc4"
                $clip4ts = read-host -prompt "Input Start Time For Clip 4 (Format: XX:XX:XX:XX)"
                $4ts1,$4ts2,$4ts3,$4ts4 = $clip4ts.split(":")
                $4ts1 = [int]$4ts1
                $4ts2 = [int]$4ts2
                $4ts3 = [int]$4ts3
                $4ts4 = [int]$4ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $4ts3 = $4ts3 - 5
                    if ($4ts3 -lt 0) {
                        $4ts3 = $4ts3 + 60
                        $4ts2 = $4ts2 - 1
                    }
                }
                $clip4te = read-host -prompt "Input End Time For Clip 4 (Format: XX:XX:XX:XX)"
                $4te1,$4te2,$4te3,$4te4 = $clip4te.split(":")
                $4te1 = [int]$4te1
                $4te2 = [int]$4te2
                $4te3 = [int]$4te3
                $4te4 = [int]$4te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $4te3 = $4te3 + 5
                    if ($4te3 -ge 60) {
                    $4te3 = $4te3 - 60
                    $4te2 = $4te2 + 1
                    }
                }
                $4tc1 = $4te1 - $4ts1
                $4tc2 = $4te2 - $4ts2
                $4tc3 = $4te3 - $4ts3
                $4tc4 = $4te4 - $4ts4
                if ($4tc3 -lt 0) {
                $4tc3 = $4tc3 + 60
                $4tc2 = $4tc2 - 1
                }
                if (($4tc1.tostring().length) -eq 1) {
                $4tc1 = "0$4tc1"
                }
                if (($4tc2.tostring().length) -eq 1) {
                $4tc2 = "0$4tc2"
                }
                if (($4tc3.tostring().length) -eq 1) {
                $4tc3 = "0$4tc3"
                }
                if (($4tc4.tostring().length) -eq 1) {
                $4tc4 = "0$4tc4"
                }
                if (($4ts1.tostring().length) -eq 1) {
                $4ts1 = "0$4ts1"
                }
                if (($4ts2.tostring().length) -eq 1) {
                $4ts2 = "0$4ts2"
                }
                if (($4ts3.tostring().length) -eq 1) {
                $4ts3 = "0$4ts3"
                }
                if (($4ts4.tostring().length) -eq 1) {
                $4ts4 = "0$4ts4"
                }
                $clip4Sps = "$4ts1`:$4ts2`:$4ts3.$4ts4"
                $clip4Rt = "$4tc1`:$4tc2`:$4tc3.$4tc4"
                $clip5ts = read-host -prompt "Input Start Time For Clip 5 (Format: XX:XX:XX:XX)"
                $5ts1,$5ts2,$5ts3,$5ts4 = $clip5ts.split(":")
                $5ts1 = [int]$5ts1
                $5ts2 = [int]$5ts2
                $5ts3 = [int]$5ts3
                $5ts4 = [int]$5ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $5ts3 = $5ts3 - 5
                    if ($5ts3 -lt 0) {
                        $5ts3 = $5ts3 + 60
                        $5ts2 = $5ts2 - 1
                    }
                }
                $clip5te = read-host -prompt "Input End Time For Clip 5 (Format: XX:XX:XX:XX)"
                $5te1,$5te2,$5te3,$5te4 = $clip5te.split(":")
                $5te1 = [int]$5te1
                $5te2 = [int]$5te2
                $5te3 = [int]$5te3
                $5te4 = [int]$5te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $5te3 = $5te3 + 5
                    if ($5te3 -ge 60) {
                    $5te3 = $5te3 - 60
                    $5te2 = $5te2 + 1
                    }
                }
                $5tc1 = $5te1 - $5ts1
                $5tc2 = $5te2 - $5ts2
                $5tc3 = $5te3 - $5ts3
                $5tc4 = $5te4 - $5ts4
                if ($5tc3 -lt 0) {
                $5tc3 = $5tc3 + 60
                $5tc2 = $5tc2 - 1
                }
                if (($5tc1.tostring().length) -eq 1) {
                $5tc1 = "0$5tc1"
                }
                if (($5tc2.tostring().length) -eq 1) {
                $5tc2 = "0$5tc2"
                }
                if (($5tc3.tostring().length) -eq 1) {
                $5tc3 = "0$5tc3"
                }
                if (($5tc4.tostring().length) -eq 1) {
                $5tc4 = "0$5tc4"
                }
                if (($5ts1.tostring().length) -eq 1) {
                $5ts1 = "0$5ts1"
                }
                if (($5ts2.tostring().length) -eq 1) {
                $5ts2 = "0$5ts2"
                }
                if (($5ts3.tostring().length) -eq 1) {
                $5ts3 = "0$5ts3"
                }
                if (($5ts4.tostring().length) -eq 1) {
                $5ts4 = "0$5ts4"
                }
                $clip5Sps = "$5ts1`:$5ts2`:$5ts3.$5ts4"
                $clip5Rt = "$5tc1`:$5tc2`:$5tc3.$5tc4"
                $clip6ts = read-host -prompt "Input Start Time For Clip 6 (Format: XX:XX:XX:XX)"
                $6ts1,$6ts2,$6ts3,$6ts4 = $clip6ts.split(":")
                $6ts1 = [int]$6ts1
                $6ts2 = [int]$6ts2
                $6ts3 = [int]$6ts3
                $6ts4 = [int]$6ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                $6ts3 = $6ts3 - 5
                    if ($6ts3 -lt 0) {
                        $6ts3 = $6ts3 + 60
                        $6ts2 = $6ts2 - 1
                    }
                }
                $clip6te = read-host -prompt "Input End Time For Clip 6 (Format: XX:XX:XX:XX)"
                $6te1,$6te2,$6te3,$6te4 = $clip6te.split(":")
                $6te1 = [int]$6te1
                $6te2 = [int]$6te2
                $6te3 = [int]$6te3
                $6te4 = [int]$6te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $6te3 = $6te3 + 5
                    if ($6te3 -ge 60) {
                    $6te3 = $6te3 - 60
                    $6te2 = $6te2 + 1
                    }
                }
                $6tc1 = $6te1 - $6ts1
                $6tc2 = $6te2 - $6ts2
                $6tc3 = $6te3 - $6ts3
                $6tc4 = $6te4 - $6ts4
                if ($6tc3 -lt 0) {
                $6tc3 = $6tc3 + 60
                $6tc2 = $6tc2 - 1
                }
                if (($6tc1.tostring().length) -eq 1) {
                $6tc1 = "0$6tc1"
                }
                if (($6tc2.tostring().length) -eq 1) {
                $6tc2 = "0$6tc2"
                }
                if (($6tc3.tostring().length) -eq 1) {
                $6tc3 = "0$6tc3"
                }
                if (($6tc4.tostring().length) -eq 1) {
                $6tc4 = "0$6tc4"
                }
                if (($6ts1.tostring().length) -eq 1) {
                $6ts1 = "0$6ts1"
                }
                if (($6ts2.tostring().length) -eq 1) {
                $6ts2 = "0$6ts2"
                }
                if (($6ts3.tostring().length) -eq 1) {
                $6ts3 = "0$6ts3"
                }
                if (($6ts4.tostring().length) -eq 1) {
                $6ts4 = "0$6ts4"
                }
                $clip6Sps = "$6ts1`:$6ts2`:$6ts3.$6ts4"
                $clip6Rt = "$6tc1`:$6tc2`:$6tc3.$6tc4"
                $clip7ts = read-host -prompt "Input Start Time For Clip 7 (Format: XX:XX:XX:XX)"
                $7ts1,$7ts2,$7ts3,$7ts4 = $clip7ts.split(":")
                $7ts1 = [int]$7ts1
                $7ts2 = [int]$7ts2
                $7ts3 = [int]$7ts3
                $7ts4 = [int]$7ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $7ts3 = $7ts3 - 5
                    if ($7ts3 -lt 0) {
                        $7ts3 = $7ts3 + 60
                        $7ts2 = $7ts2 - 1
                    }
                }
                $clip7te = read-host -prompt "Input End Time For Clip 7 (Format: XX:XX:XX:XX)"
                $7te1,$7te2,$7te3,$7te4 = $clip7te.split(":")
                $7te1 = [int]$7te1
                $7te2 = [int]$7te2
                $7te3 = [int]$7te3
                $7te4 = [int]$7te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $7te3 = $7te3 + 5
                    if ($7te3 -ge 60) {
                    $7te3 = $7te3 - 60
                    $7te2 = $7te2 + 1
                    }
                }
                $7tc1 = $7te1 - $7ts1
                $7tc2 = $7te2 - $7ts2
                $7tc3 = $7te3 - $7ts3
                $7tc4 = $7te4 - $7ts4
                if ($7tc3 -lt 0) {
                $7tc3 = $7tc3 + 60
                $7tc2 = $7tc2 - 1
                }
                if (($7tc1.tostring().length) -eq 1) {
                $7tc1 = "0$7tc1"
                }
                if (($7tc2.tostring().length) -eq 1) {
                $7tc2 = "0$7tc2"
                }
                if (($7tc3.tostring().length) -eq 1) {
                $7tc3 = "0$7tc3"
                }
                if (($7tc4.tostring().length) -eq 1) {
                $7tc4 = "0$7tc4"
                }
                if (($7ts1.tostring().length) -eq 1) {
                $7ts1 = "0$7ts1"
                }
                if (($7ts2.tostring().length) -eq 1) {
                $7ts2 = "0$7ts2"
                }
                if (($7ts3.tostring().length) -eq 1) {
                $7ts3 = "0$7ts3"
                }
                if (($7ts4.tostring().length) -eq 1) {
                $7ts4 = "0$7ts4"
                }
                $clip7Sps = "$7ts1`:$7ts2`:$7ts3.$7ts4"
                $clip7Rt = "$7tc1`:$7tc2`:$7tc3.$7tc4"
                $clip8ts = read-host -prompt "Input Start Time For Clip 8 (Format: XX:XX:XX:XX)"
                $8ts1,$8ts2,$8ts3,$8ts4 = $clip8ts.split(":")
                $8ts1 = [int]$8ts1
                $8ts2 = [int]$8ts2
                $8ts3 = [int]$8ts3
                $8ts4 = [int]$8ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $8ts3 = $8ts3 - 5
                    if ($8ts3 -lt 0) {
                        $8ts3 = $8ts3 + 60
                        $8ts2 = $8ts2 - 1
                    }
                }
                $clip8te = read-host -prompt "Input End Time For Clip 8 (Format: XX:XX:XX:XX)"
                $8te1,$8te2,$8te3,$8te4 = $clip8te.split(":")
                $8te1 = [int]$8te1
                $8te2 = [int]$8te2
                $8te3 = [int]$8te3
                $8te4 = [int]$8te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $8te3 = $8te3 + 5
                    if ($8te3 -ge 60) {
                    $8te3 = $8te3 - 60
                    $8te2 = $8te2 + 1
                    }
                }
                $8tc1 = $8te1 - $8ts1
                $8tc2 = $8te2 - $8ts2
                $8tc3 = $8te3 - $8ts3
                $8tc4 = $8te4 - $8ts4
                if ($8tc3 -lt 0) {
                $8tc3 = $8tc3 + 60
                $8tc2 = $8tc2 - 1
                }
                if (($8tc1.tostring().length) -eq 1) {
                $8tc1 = "0$8tc1"
                }
                if (($8tc2.tostring().length) -eq 1) {
                $8tc2 = "0$8tc2"
                }
                if (($8tc3.tostring().length) -eq 1) {
                $8tc3 = "0$8tc3"
                }
                if (($8tc4.tostring().length) -eq 1) {
                $8tc4 = "0$8tc4"
                }
                if (($8ts1.tostring().length) -eq 1) {
                $8ts1 = "0$8ts1"
                }
                if (($8ts2.tostring().length) -eq 1) {
                $8ts2 = "0$8ts2"
                }
                if (($8ts3.tostring().length) -eq 1) {
                $8ts3 = "0$8ts3"
                }
                if (($8ts4.tostring().length) -eq 1) {
                $8ts4 = "0$8ts4"
                }
                $clip8Sps = "$8ts1`:$8ts2`:$8ts3.$8ts4"
                $clip8Rt = "$8tc1`:$8tc2`:$8tc3.$8tc4"
                $clip9ts = read-host -prompt "Input Start Time For Clip 9 (Format: XX:XX:XX:XX)"
                $9ts1,$9ts2,$9ts3,$9ts4 = $clip9ts.split(":")
                $9ts1 = [int]$9ts1
                $9ts2 = [int]$9ts2
                $9ts3 = [int]$9ts3
                $9ts4 = [int]$9ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $9ts3 = $9ts3 - 5
                    if ($9ts3 -lt 0) {
                        $9ts3 = $9ts3 + 60
                        $9ts2 = $9ts2 - 1
                    }
                }
                $clip9te = read-host -prompt "Input End Time For Clip 9 (Format: XX:XX:XX:XX)"
                $9te1,$9te2,$9te3,$9te4 = $clip9te.split(":")
                $9te1 = [int]$9te1
                $9te2 = [int]$9te2
                $9te3 = [int]$9te3
                $9te4 = [int]$9te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $9te3 = $9te3 + 5
                    if ($9te3 -ge 60) {
                    $9te3 = $9te3 - 60
                    $9te2 = $9te2 + 1
                    }
                }
                $9tc1 = $9te1 - $9ts1
                $9tc2 = $9te2 - $9ts2
                $9tc3 = $9te3 - $9ts3
                $9tc4 = $9te4 - $9ts4
                if ($9tc3 -lt 0) {
                $9tc3 = $9tc3 + 60
                $9tc2 = $9tc2 - 1
                }
                if (($9tc1.tostring().length) -eq 1) {
                $9tc1 = "0$9tc1"
                }
                if (($9tc2.tostring().length) -eq 1) {
                $9tc2 = "0$9tc2"
                }
                if (($9tc3.tostring().length) -eq 1) {
                $9tc3 = "0$9tc3"
                }
                if (($9tc4.tostring().length) -eq 1) {
                $9tc4 = "0$9tc4"
                }
                if (($9ts1.tostring().length) -eq 1) {
                $9ts1 = "0$9ts1"
                }
                if (($9ts2.tostring().length) -eq 1) {
                $9ts2 = "0$9ts2"
                }
                if (($9ts3.tostring().length) -eq 1) {
                $9ts3 = "0$9ts3"
                }
                if (($9ts4.tostring().length) -eq 1) {
                $9ts4 = "0$9ts4"
                }
                $clip9Sps = "$9ts1`:$9ts2`:$9ts3.$9ts4"
                $clip9Rt = "$9tc1`:$9tc2`:$9tc3.$9tc4"
                $clip10ts = read-host -prompt "Input Start Time For Clip 10 (Format: XX:XX:XX:XX)"
                $10ts1,$10ts2,$10ts3,$10ts4 = $clip10ts.split(":")
                $10ts1 = [int]$10ts1
                $10ts2 = [int]$10ts2
                $10ts3 = [int]$10ts3
                $10ts4 = [int]$10ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $10ts3 = $10ts3 - 5
                    if ($10ts3 -lt 0) {
                        $10ts3 = $10ts3 + 60
                        $10ts2 = $10ts2 - 1
                    }
                }
                $clip10te = read-host -prompt "Input End Time For Clip 10 (Format: XX:XX:XX:XX)"
                $10te1,$10te2,$10te3,$10te4 = $clip10te.split(":")
                $10te1 = [int]$10te1
                $10te2 = [int]$10te2
                $10te3 = [int]$10te3
                $10te4 = [int]$10te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $10te3 = $10te3 + 5
                    if ($10te3 -ge 60) {
                    $10te3 = $10te3 - 60
                    $10te2 = $10te2 + 1
                    }
                }
                $10tc1 = $10te1 - $10ts1
                $10tc2 = $10te2 - $10ts2
                $10tc3 = $10te3 - $10ts3
                $10tc4 = $10te4 - $10ts4
                if ($10tc3 -lt 0) {
                $10tc3 = $10tc3 + 60
                $10tc2 = $10tc2 - 1
                }
                if (($10tc1.tostring().length) -eq 1) {
                $10tc1 = "0$10tc1"
                }
                if (($10tc2.tostring().length) -eq 1) {
                $10tc2 = "0$10tc2"
                }
                if (($10tc3.tostring().length) -eq 1) {
                $10tc3 = "0$10tc3"
                }
                if (($10tc4.tostring().length) -eq 1) {
                $10tc4 = "0$10tc4"
                }
                if (($10ts1.tostring().length) -eq 1) {
                $10ts1 = "0$10ts1"
                }
                if (($10ts2.tostring().length) -eq 1) {
                $10ts2 = "0$10ts2"
                }
                if (($10ts3.tostring().length) -eq 1) {
                $10ts3 = "0$10ts3"
                }
                if (($10ts4.tostring().length) -eq 1) {
                $10ts4 = "0$10ts4"
                }
                $clip10Sps = "$10ts1`:$10ts2`:$10ts3.$10ts4"
                $clip10Rt = "$10tc1`:$10tc2`:$10tc3.$10tc4"
                $glink = youtube-dl -g "$inlink"
                while (!$glink) {$glink = youtube-dl -g "$inlink"}
                ffmpeg -hide_banner -loglevel error -ss $clip1Sps -i ($glink) -t $clip1Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip2Sps -i ($glink) -t $clip2Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip3Sps -i ($glink) -t $clip3Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip4Sps -i ($glink) -t $clip4Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip5Sps -i ($glink) -t $clip5Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip6Sps -i ($glink) -t $clip6Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip7Sps -i ($glink) -t $clip7Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip8Sps -i ($glink) -t $clip8Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip9Sps -i ($glink) -t $clip9Rt "clip$clipnum.mkv"
                $clipnum = $clipnum + 1
                ffmpeg -hide_banner -loglevel error -ss $clip10Sps -i ($glink) -t $clip10Rt "clip$clipnum.mkv"
                $needsstitching = read-host -prompt 'Do you want to stitch clips? [Y/N]'
                if ($needsstitching -eq "Y" -or $needsstitching -eq "y") {
                   &$HoloStitcher
                }
                else {
                    write-host "Clipping Complete!"    
                    return
                }
            }
            else {return}
        }
        else {
        $timestampSin = read-host -prompt "Input Start Time (Format: XX:XX:XX:XX)"
        $ts1,$ts2,$ts3,$ts4 = $timestampSin.split(":")
        $ts1 = [int]$ts1
        $ts2 = [int]$ts2
        $ts3 = [int]$ts3
        $ts4 = [int]$ts4
        if ($cliptype -eq "Y" -or $cliptype -eq "y") {
            $ts3 = $ts3 - 5
            if ($ts3 -lt 0) {
                $ts3 = $ts3 + 60
                $ts2 = $ts2 - 1
            }
        }
        $timestampEin = read-host -prompt "Input End Time (Format: XX:XX:XX:XX)"
        $te1,$te2,$te3,$te4 = $timestampEin.split(":")
        $te1 = [int]$te1
        $te2 = [int]$te2
        $te3 = [int]$te3
        $te4 = [int]$te4
        if ($cliptype -eq "Y" -or $cliptype -eq "y") {
            $te3 = $te3 + 5
            if ($te3 -ge 60) {
            $te3 = $te3 - 60
            $te2 = $te2 + 1
            }
        }
        $tc1 = $te1 - $ts1
        $tc2 = $te2 - $ts2
        $tc3 = $te3 - $ts3
        $tc4 = $te4 - $ts4
        if ($tc3 -lt 0) {
        $tc3 = $tc3 + 60
        $tc2 = $tc2 - 1
        }
        if (($tc1.tostring().length) -eq 1) {
        $tc1 = "0$tc1"
        }
        if (($tc2.tostring().length) -eq 1) {
        $tc2 = "0$tc2"
        }
        if (($tc3.tostring().length) -eq 1) {
        $tc3 = "0$tc3"
        }
        if (($tc4.tostring().length) -eq 1) {
        $tc4 = "0$tc4"
        }
        if (($ts1.tostring().length) -eq 1) {
        $ts1 = "0$ts1"
        }
        if (($ts2.tostring().length) -eq 1) {
        $ts2 = "0$ts2"
        }
        if (($ts3.tostring().length) -eq 1) {
        $ts3 = "0$ts3"
        }
        if (($ts4.tostring().length) -eq 1) {
        $ts4 = "0$ts4"
        }
        $timestampSps = "$ts1`:$ts2`:$ts3.$ts4"
        $timestampEps = "$tc1`:$tc2`:$tc3.$tc4"
        write-host "Clipping Start: $timestampSps"
        write-host "Runtime: $timestampEps"
        $clipnum = read-host -prompt 'Clip Number'
        $glink = youtube-dl -g "$inlink"
        while (!$glink) {$glink = youtube-dl -g "$inlink"}
        ffmpeg -hide_banner -loglevel error -ss $timestampSps -i ($glink) -t $timestampEps "clip$clipnum.mkv"
        }
    }
    #the "local file" case is the antiquated code for clipping from a local file titled "clipDL.(mkv, mp4, webm)"
    #It still works just fine, it's just structured differently than the two other cases.
    if ($videotype -eq "C" -or $videotype -eq "c") {
        $timestampSin = read-host -prompt "Input Start Time (Format: XX:XX:XX:XX)"
        $ts1,$ts2,$ts3,$ts4 = $timestampSin.split(":")
        $ts1 = [int]$ts1
        $ts2 = [int]$ts2
        $ts3 = [int]$ts3
        $ts4 = [int]$ts4
        if ($cliptype -eq "Y" -or $cliptype -eq "y") {
            $ts3 = $ts3 - 5
            if ($ts3 -lt 0) {
                $ts3 = $ts3 + 60
                $ts2 = $ts2 - 1
            }
        }
        $timestampSps = "$ts1`:$ts2`:$ts3.$ts4"
        $timestampEin = read-host -prompt "Input End Time (Format: XX:XX:XX:XX)"
        $te1,$te2,$te3,$te4 = $timestampEin.split(":")
        $te1 = [int]$te1
        $te2 = [int]$te2
        $te3 = [int]$te3
        $te4 = [int]$te4
        if ($cliptype -eq "Y" -or $cliptype -eq "y") {
            $te3 = $te3 + 5
            if ($te3 -ge 60) {
            $te3 = $te3 - 60
            $te2 = $te2 + 1
            }
        }
        $tc1 = $te1 - $ts1
        $tc2 = $te2 - $ts2
        $tc3 = $te3 - $ts3
        $tc4 = $te4 - $ts4
        if ($tc3 -lt 0) {
        $tc3 = $tc3 + 60
        $tc2 = $tc2 - 1
        }
        if (($tc1.tostring().length) -eq 1) {
        $tc1 = "0$tc1"
        }
        if (($tc2.tostring().length) -eq 1) {
        $tc2 = "0$tc2"
        }
        if (($tc3.tostring().length) -eq 1) {
        $tc3 = "0$tc3"
        }
        if (($tc4.tostring().length) -eq 1) {
        $tc4 = "0$tc4"
        }
        if (($ts1.tostring().length) -eq 1) {
        $ts1 = "0$ts1"
        }
        if (($ts2.tostring().length) -eq 1) {
        $ts2 = "0$ts2"
        }
        if (($ts3.tostring().length) -eq 1) {
        $ts3 = "0$ts3"
        }
        if (($ts4.tostring().length) -eq 1) {
        $ts4 = "0$ts4"
        }
        $timestampSps = "$ts1`:$ts2`:$ts3.$ts4"
        $timestampEps = "$tc1`:$tc2`:$tc3.$tc4"
        write-host "Clipping Start: $timestampSps"
        write-host "Runtime: $timestampEps"
        $miniclip = read-host -prompt 'Clip Has Miniclips? [Y/N]'
        if ($miniclip -eq "Y" -or $miniclip -eq "y") {
            $clipnum = 1
            $miniclipnum = read-host -prompt 'Number Of Miniclips (1-10)'
            $miniclipnum = [int]$miniclipnum
            #this is residual code from the old script. It basically checks for an extensionless "clipDL" file and gives it an extension.
            if (test-path ".\clipDL" -pathtype leaf) {rename-item -path ".\clipDL" -newname ".\clipDL.mkv"}
            $tempfile = ".\clipDL.mkv"
            #redefine the tempfile based off of which one exists in the working directory.
            if (test-path ".\clipDL.mkv" -pathtype leaf) {$tempFile = ".\clipDL.mkv"}
            if (test-path ".\clipDL.webm" -pathtype leaf) {$tempFile = ".\clipDL.webm"}
            if (test-path ".\clipDL.mp4" -pathtype leaf) {$tempFile = ".\clipDL.mp4"}
            #here's the old code for taking miniclips. It's more efficient than the spaghetti above, but less user-friendly imo.
            for ($miniclipnum -gt 0; $miniclipnum--) {
                ffmpeg -hide_banner -loglevel error -ss $timestampSps -i $tempFile -t $timestampEps -c copy "clip$clipnum.mkv"
                $timestampSin = read-host -prompt "Input Start Time (Format: XX:XX:XX:XX)"
                $ts1,$ts2,$ts3,$ts4 = $timestampSin.split(":")
                $ts1 = [int]$ts1
                $ts2 = [int]$ts2
                $ts3 = [int]$ts3
                $ts4 = [int]$ts4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $ts3 = $ts3 - 5
                    if ($ts3 -lt 0) {
                        $ts3 = $ts3 + 60
                        $ts2 = $ts2 - 1
                    }
                }
                $timestampSps = "$ts1`:$ts2`:$ts3.$ts4"
                $timestampEin = read-host -prompt "Input End Time (Format: XX:XX:XX:XX)"
                $te1,$te2,$te3,$te4 = $timestampEin.split(":")
                $te1 = [int]$te1
                $te2 = [int]$te2
                $te3 = [int]$te3
                $te4 = [int]$te4
                if ($cliptype -eq "Y" -or $cliptype -eq "y") {
                    $te3 = $te3 + 5
                    if ($te3 -ge 60) {
                    $te3 = $te3 - 60
                    $te2 = $te2 + 1
                    }
                }
                $tc1 = $te1 - $ts1
                $tc2 = $te2 - $ts2
                $tc3 = $te3 - $ts3
                $tc4 = $te4 - $ts4
                if ($tc3 -lt 0) {
                $tc3 = $tc3 + 60
                $tc2 = $tc2 - 1
                }
                if (($tc1.tostring().length) -eq 1) {
                $tc1 = "0$tc1"
                }
                if (($tc2.tostring().length) -eq 1) {
                $tc2 = "0$tc2"
                }
                if (($tc3.tostring().length) -eq 1) {
                $tc3 = "0$tc3"
                }
                if (($tc4.tostring().length) -eq 1) {
                $tc4 = "0$tc4"
                }
                if (($ts1.tostring().length) -eq 1) {
                $ts1 = "0$ts1"
                }
                if (($ts2.tostring().length) -eq 1) {
                $ts2 = "0$ts2"
                }
                if (($ts3.tostring().length) -eq 1) {
                $ts3 = "0$ts3"
                }
                if (($ts4.tostring().length) -eq 1) {
                $ts4 = "0$ts4"
                }
                $timestampSps = "$ts1`:$ts2`:$ts3.$ts4"
                $timestampEps = "$tc1`:$tc2`:$tc3.$tc4"
                $clipnum = $clipnum + 1
                } 
                remove-item $tempFile
            $needsstitching = read-host -prompt 'Do you want to stitch clips? [Y/N]'
            if ($needsstitching -eq "Y" -or $needsstitching -eq "y") {
                &$HoloStitcher
            }
            else {
                return
                write-host "Clipping Complete!"
            }
        }
        else {
            $fullclipnum = read-host -prompt 'Clip Number'
            $clipnum = $fullclipnum
            $tempfile = ".\clipDL.mkv"
            if (test-path ".\clipDL.mkv" -pathtype leaf) {$tempFile = ".\clipDL.mkv"}
            if (test-path ".\clipDL.webm" -pathtype leaf) {$tempFile = ".\clipDL.webm"}
            if (test-path ".\clipDL.mp4" -pathtype leaf) {$tempFile = ".\clipDL.mp4"}
            ffmpeg -hide_banner -loglevel error -ss $timestampSps -i $tempFile -t $timestampEps -c copy "clip$clipnum.mkv"
            $delete = read-host -prompt 'Do you want to remove the original file?'
            if ($delete -eq 'Y' -or $delete -eq 'y') {remove-item $tempFile }
            else {
                write-host "Clipping Complete!"
                return
            }
        }
    }
    else {return}
}
write-host "
|    Sheer Curiosity's Hololive Clipping Script    |
|                                                  |
|      Made With Copious Amounts Of Self-Hate      |
|                                                  |
|  Feel Free To Share This, The Code Is Bad Enough |
|    I'm Not Too Worried About People Copying It   |
"
&$HololiveClipper