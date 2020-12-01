$HoloStitcher = {
    $fulltitle = read-host -prompt 'Clip Number'
    write-host "Status: Creating Black Screen..." -NoNewLine
    $clipresolution = .\bin\ffprobe.exe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 ".\output\clip1.mkv"
    .\bin\ffmpeg.exe -hide_banner -loglevel error -f lavfi -i color=black:s="$clipresolution":r=30000/1000 -f lavfi -i anullsrc -ar 48000 -ac 2 -t 3 ".\output\blackscreen.mkv"
    write-host "`rStatus: Black Screen Created..." -NoNewLine
    mkdir ".\output\originals" | Out-Null
    if (test-path ".\output\clip1.mkv" -pathtype leaf) {
        move-item -path ".\output\clip1.mkv" -destination ".\output\originals\clip1.mkv"
    }
    if (test-path ".\output\clip2.mkv" -pathtype leaf) {
        move-item -path ".\output\clip2.mkv" -destination ".\output\originals\clip2.mkv"
    }
    if (test-path ".\output\clip3.mkv" -pathtype leaf) {
        move-item -path ".\output\clip3.mkv" -destination ".\output\originals\clip3.mkv"
    }
    if (test-path ".\output\clip4.mkv" -pathtype leaf) {
        move-item -path ".\output\clip4.mkv" -destination ".\output\originals\clip4.mkv"
    }
    if (test-path ".\output\clip5.mkv" -pathtype leaf) {
        move-item -path ".\output\clip5.mkv" -destination ".\output\originals\clip5.mkv"
    }
    if (test-path ".\output\clip6.mkv" -pathtype leaf) {
        move-item -path ".\output\clip6.mkv" -destination ".\output\originals\clip6.mkv"
    }
    if (test-path ".\output\clip7.mkv" -pathtype leaf) {
        move-item -path ".\output\clip7.mkv" -destination ".\output\originals\clip7.mkv"
    }
    if (test-path ".\output\clip8.mkv" -pathtype leaf) {
        move-item -path ".\output\clip8.mkv" -destination ".\output\originals\clip8.mkv"
    }
    if (test-path ".\output\clip9.mkv" -pathtype leaf) {
        move-item -path ".\output\clip9.mkv" -destination ".\output\originals\clip9.mkv"
    }
    if (test-path ".\output\clip10.mkv" -pathtype leaf) {
        move-item -path ".\output\clip10.mkv" -destination ".\output\originals\clip10.mkv"
    }
    Write-Host "`r                                    " -NoNewLine
    Write-Host "`rStatus: Joining Clips..." -NoNewLine
    if ($miniclipnum -eq 2) {
        .\bin\ffmpeg.exe -hide_banner -loglevel error -i ".\output\originals\clip1.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip2.mkv" -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0][2:v:0][2:a:0]concat=n=3:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" -x264-params keyint=24:min-keyint=1 ".\output\clip$fulltitle.mkv"
    }
    if ($miniclipnum -eq 3) {
        .\bin\ffmpeg.exe -hide_banner -loglevel error -i ".\output\originals\clip1.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip2.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip3.mkv" -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0][2:v:0][2:a:0][3:v:0][3:a:0][4:v:0][4:a:0]concat=n=5:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" -x264-params keyint=24:min-keyint=1 ".\output\clip$fulltitle.mkv"
    }
    if ($miniclipnum -eq 4) {
        .\bin\ffmpeg.exe -hide_banner -loglevel error -i ".\output\originals\clip1.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip2.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip3.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip4.mkv" -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0][2:v:0][2:a:0][3:v:0][3:a:0][4:v:0][4:a:0][5:v:0][5:a:0][6:v:0][6:a:0]concat=n=7:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" -x264-params keyint=24:min-keyint=1 ".\output\clip$fulltitle.mkv"
    }
    if ($miniclipnum -eq 5) {
        .\bin\ffmpeg.exe -hide_banner -loglevel error -i ".\output\originals\clip1.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip2.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip3.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip4.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip5.mkv" -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0][2:v:0][2:a:0][3:v:0][3:a:0][4:v:0][4:a:0][5:v:0][5:a:0][6:v:0][6:a:0][7:v:0][7:a:0][8:v:0][8:a:0]concat=n=9:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" -x264-params keyint=24:min-keyint=1 ".\output\clip$fulltitle.mkv"
    }
    if ($miniclipnum -eq 6) {
        .\bin\ffmpeg.exe -hide_banner -loglevel error -i ".\output\originals\clip1.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip2.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip3.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip4.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip5.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip6.mkv" -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0][2:v:0][2:a:0][3:v:0][3:a:0][4:v:0][4:a:0][5:v:0][5:a:0][6:v:0][6:a:0][7:v:0][7:a:0][8:v:0][8:a:0][9:v:0][9:a:0][10:v:0][10:a:0]concat=n=11:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" -x264-params keyint=24:min-keyint=1 ".\output\clip$fulltitle.mkv"
    }
    if ($miniclipnum -eq 7) {
        .\bin\ffmpeg.exe -hide_banner -loglevel error -i ".\output\originals\clip1.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip2.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip3.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip4.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip5.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip6.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip7.mkv" -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0][2:v:0][2:a:0][3:v:0][3:a:0][4:v:0][4:a:0][5:v:0][5:a:0][6:v:0][6:a:0][7:v:0][7:a:0][8:v:0][8:a:0][9:v:0][9:a:0][10:v:0][10:a:0][11:v:0][11:a:0][12:v:0][12:a:0]concat=n=13:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" -x264-params keyint=24:min-keyint=1 ".\output\clip$fulltitle.mkv"
    }
    if ($miniclipnum -eq 8) {
        .\bin\ffmpeg.exe -hide_banner -loglevel error -i ".\output\originals\clip1.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip2.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip3.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip4.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip5.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip6.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip7.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip8.mkv" -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0][2:v:0][2:a:0][3:v:0][3:a:0][4:v:0][4:a:0][5:v:0][5:a:0][6:v:0][6:a:0][7:v:0][7:a:0][8:v:0][8:a:0][9:v:0][9:a:0][10:v:0][10:a:0][11:v:0][11:a:0][12:v:0][12:a:0][13:v:0][13:a:0][14:v:0][14:a:0]concat=n=15:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" -x264-params keyint=24:min-keyint=1 ".\output\clip$fulltitle.mkv"
    }
    if ($miniclipnum -eq 9) {
        .\bin\ffmpeg.exe -hide_banner -loglevel error -i ".\output\originals\clip1.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip2.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip3.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip4.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip5.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip6.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip7.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip8.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip9.mkv" -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0][2:v:0][2:a:0][3:v:0][3:a:0][4:v:0][4:a:0][5:v:0][5:a:0][6:v:0][6:a:0][7:v:0][7:a:0][8:v:0][8:a:0][9:v:0][9:a:0][10:v:0][10:a:0][11:v:0][11:a:0][12:v:0][12:a:0][13:v:0][13:a:0][14:v:0][14:a:0][15:v:0][15:a:0][16:v:0][16:a:0]concat=n=17:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" -x264-params keyint=24:min-keyint=1 ".\output\clip$fulltitle.mkv"
    }
    if ($miniclipnum -eq 10) {
        .\bin\ffmpeg.exe -hide_banner -loglevel error -i ".\output\originals\clip1.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip2.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip3.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip4.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip5.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip6.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip7.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip8.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip9.mkv" -i ".\output\blackscreen.mkv" -i ".\output\originals\clip10.mkv" -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0][2:v:0][2:a:0][3:v:0][3:a:0][4:v:0][4:a:0][5:v:0][5:a:0][6:v:0][6:a:0][7:v:0][7:a:0][8:v:0][8:a:0][9:v:0][9:a:0][10:v:0][10:a:0][11:v:0][11:a:0][12:v:0][12:a:0][13:v:0][13:a:0][14:v:0][14:a:0][15:v:0][15:a:0][16:v:0][16:a:0][17:v:0][17:a:0][18:v:0][18:a:0]concat=n=19:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" -x264-params keyint=24:min-keyint=1 ".\output\clip$fulltitle.mkv"
    }
    Write-Host "`rStatus: Removing Black Screen..." -NoNewLine
    remove-item ".\output\blackscreen.mkv"
    write-host "`r                                   " -NoNewLine
    write-host "`rClipping Complete!"
    read-host -prompt "Press [ENTER] To Close The Tool"
}

$HololiveClipper = {
    do {
        $videotype = read-host -prompt "Video Type: `n
A) YouTube Video 
B) Archive 
C) Local File

[A/B/C]"
    }
    until ($videotype -eq "A" -or $videotype -eq "a" -or $videotype -eq "B" -or $videotype -eq "b" -or $videotype -eq "C" -or $videotype -eq "c")
    do {
        $cliptype = read-host -prompt "Clip According To HoloRewind Standards? [Y/N]"
    }
    until ($cliptype -eq "y" -or $cliptype -eq "Y" -or $cliptype -eq "N" -or $cliptype -eq "n")
    if ($videotype -eq "A" -or $videotype -eq "a" -or $videotype -eq "B" -or $videotype -eq "b" -or $videotype -eq "C" -or $videotype -eq "c") {
            if ($videotype -eq "A" -or $videotype -eq "a"){$inlink = read-host -prompt 'Input YouTube Link'}
            if ($videotype -eq "B" -or $videotype -eq "b"){$inlink = read-host -prompt 'Input Archive Download Link'}
            if ($videotype -eq "C" -or $videotype -eq "c") {
                $tempfile = ".\clipDL.mkv"
                if (test-path ".\clipDL.mkv" -pathtype leaf) {$tempFile = ".\clipDL.mkv"}
                if (test-path ".\clipDL.webm" -pathtype leaf) {$tempFile = ".\clipDL.webm"}
                if (test-path ".\clipDL.mp4" -pathtype leaf) {$tempFile = ".\clipDL.mp4"}
                if (test-path ".\clipDL.mov" -pathtype leaf) {$tempFile = ".\clipDL.mov"}
                if (test-path ".\clipDL.wmv" -pathtype leaf) {$tempFile = ".\clipDL.wmv"}
                if (test-path ".\clipDL.avi" -pathtype leaf) {$tempFile = ".\clipDL.avi"}
                if (test-path ".\clipDL.flv" -pathtype leaf) {$tempFile = ".\clipDL.flv"}
            }
            $miniclip = read-host -prompt 'Clip Has Miniclips? [Y/N]'
            if ($miniclip -eq "Y" -or $miniclip -eq "y") {
                $clipnum = 1
                do {
                    $miniclipnum = read-host -prompt 'Number Of Miniclips [2-10]'
                }
                until ($miniclipnum -eq 2 -or $miniclipnum -eq 3 -or $miniclipnum -eq 4 -or $miniclipnum -eq 5 -or $miniclipnum -eq 6 -or $miniclipnum -eq 7 -or $miniclipnum -eq 8 -or $miniclipnum -eq 9 -or $miniclipnum -eq 10)
                if ($miniclipnum -ge 2) {
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
                            if ($1ts2 -lt 0) {
                                $1ts2 = $1ts2 + 60
                                $1ts1 = $1ts1 - 1
                            }
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
                            if ($1te2 -ge 60) {
                                $1te2 = $1te2 - 60
                                $1te1 = $1te1 + 1
                            }
                        }
                    }
                    $1tc1 = $1te1 - $1ts1
                    $1tc2 = $1te2 - $1ts2
                    $1tc3 = $1te3 - $1ts3
                    $1tc4 = $1te4 - $1ts4
                    if ($1tc3 -lt 0) {
                        $1tc3 = $1tc3 + 60
                        $1tc2 = $1tc2 - 1
                        if ($1tc2 -lt 0) {
                            $1tc1 = $1tc1 + 60
                            $1tc1 = $1tc1 - 1
                        }
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
                            if ($2ts2 -lt 0) {
                                $2ts2 = $2ts2 + 60
                                    $2ts1 = $2ts1 - 1
                            }
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
                            if ($2te2 -ge 60) {
                                $2te2 = $2te2 - 60
                                $2te1 = $2te1 + 1
                            }
                        }
                    }
                    $2tc1 = $2te1 - $2ts1
                    $2tc2 = $2te2 - $2ts2
                    $2tc3 = $2te3 - $2ts3
                    $2tc4 = $2te4 - $2ts4
                    if ($2tc3 -lt 0) {
                        $2tc3 = $2tc3 + 60
                        $2tc2 = $2tc2 - 1
                        if ($2tc2 -lt 0) {
                            $2tc2 = $2tc2 + 60
                            $2tc1 = $2tc1 - 1
                        }
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
                }
                if ($miniclipnum -ge 3) {
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
                            if ($3ts2 -lt 0) {
                                $3ts2 = $3ts2 + 60
                                $3ts1 = $3ts1 - 1
                            }
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
                            if ($3te2 -ge 60) {
                                $3te2 = $3te2 - 60
                                $3te1 = $3te1 + 1
                            }
                        }
                    }
                    $3tc1 = $3te1 - $3ts1
                    $3tc2 = $3te2 - $3ts2
                    $3tc3 = $3te3 - $3ts3
                    $3tc4 = $3te4 - $3ts4
                    if ($3tc3 -lt 0) {
                        $3tc3 = $3tc3 + 60
                        $3tc2 = $3tc2 - 1
                        if ($3tc2 -lt 0) {
                            $3tc2 = $3tc2 + 60
                            $3tc1 = $3tc1 - 1
                        }
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
                }
                if ($miniclipnum -ge 4) {
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
                            if ($4ts2 -lt 0) {
                                $4ts2 = $4ts2 + 60
                                $4ts1 = $4ts1 - 1
                            }
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
                            if ($4te2 -ge 60) {
                                $4te2 = $4te2 - 60
                                $4te1 = $4te1 + 1
                            }
                        }
                    }
                    $4tc1 = $4te1 - $4ts1
                    $4tc2 = $4te2 - $4ts2
                    $4tc3 = $4te3 - $4ts3
                    $4tc4 = $4te4 - $4ts4
                    if ($4tc3 -lt 0) {
                        $4tc3 = $4tc3 + 60
                        $4tc2 = $4tc2 - 1
                        if ($4tc2 -lt 0) {
                            $4tc2 = $4tc2 + 60
                            $4tc1 = $4tc1 - 1
                        }
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
                }
                if ($miniclipnum -ge 5) {
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
                            if ($5ts2 -lt 0) {
                                $5ts2 = $5ts2 + 60
                                $5ts1 = $5ts1 - 1
                            }
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
                            if ($5te2 -ge 60) {
                                $5te2 = $5te2 - 60
                                $5te1 = $5te1 + 1
                            }
                        }
                    }
                    $5tc1 = $5te1 - $5ts1
                    $5tc2 = $5te2 - $5ts2
                    $5tc3 = $5te3 - $5ts3
                    $5tc4 = $5te4 - $5ts4
                    if ($5tc3 -lt 0) {
                        $5tc3 = $5tc3 + 60
                        $5tc2 = $5tc2 - 1
                        if ($5tc2 -lt 0) {
                            $5tc2 = $5tc2 + 60
                            $5tc1 = $5tc1 - 1
                        }
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
                }
                if ($miniclipnum -ge 6) {
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
                            if ($6ts2 -lt 0) {
                                $6ts2 = $6ts2 + 60
                                $6ts1 = $6ts1 - 1
                            }
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
                            if ($6te2 -ge 60) {
                                $6te2 = $6te2 - 60
                                $6te1 = $6te1 + 1
                            }
                        }
                    }
                    $6tc1 = $6te1 - $6ts1
                    $6tc2 = $6te2 - $6ts2
                    $6tc3 = $6te3 - $6ts3
                    $6tc4 = $6te4 - $6ts4
                    if ($6tc3 -lt 0) {
                        $6tc3 = $6tc3 + 60
                        $6tc2 = $6tc2 - 1
                        if ($6tc2 -lt 0) {
                            $6tc2 = $6tc2 + 60
                            $6tc1 = $6tc1 - 1
                        }
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
                }
                if ($miniclipnum -ge 7) {
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
                            if ($7ts2 -lt 0) {
                                $7ts2 = $7ts2 + 60
                                $7ts1 = $7ts1 - 1
                            }
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
                            if ($7te2 -ge 60) {
                                $7te2 = $7te2 - 60
                                $7te1 = $7te1 + 1
                            }
                        }
                    }
                    $7tc1 = $7te1 - $7ts1
                    $7tc2 = $7te2 - $7ts2
                    $7tc3 = $7te3 - $7ts3
                    $7tc4 = $7te4 - $7ts4
                    if ($7tc3 -lt 0) {
                        $7tc3 = $7tc3 + 60
                        $7tc2 = $7tc2 - 1
                        if ($7tc2 -lt 0) {
                            $7tc2 = $7tc2 + 60
                            $7tc1 = $7tc1 - 1
                        }
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
                }
                if ($miniclipnum -ge 8) {
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
                            if ($8ts2 -lt 0) {
                                $8ts2 = $8ts2 + 60
                                $8ts1 = $8ts1 - 1
                            }
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
                            if ($8te2 -ge 60) {
                                $8te2 = $8te2 - 60
                                $8te1 = $8te1 + 1
                            }
                        }
                    }
                    $8tc1 = $8te1 - $8ts1
                    $8tc2 = $8te2 - $8ts2
                    $8tc3 = $8te3 - $8ts3
                    $8tc4 = $8te4 - $8ts4
                    if ($8tc3 -lt 0) {
                        $8tc3 = $8tc3 + 60
                        $8tc2 = $8tc2 - 1
                        if ($8tc2 -lt 0) {
                            $8tc2 = $8tc2 + 60
                            $8tc1 = $8tc1 - 1
                        }
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
                }
                if ($miniclipnum -ge 9) {
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
                            if ($9ts2 -lt 0) {
                                $9ts2 = $9ts2 + 60
                                $9ts1 = $9ts1 - 1
                            }
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
                            if ($9te2 -ge 60) {
                                $9te2 = $9te2 - 60
                                $9te1 = $9te1 + 1
                            }
                        }
                    }
                    $9tc1 = $9te1 - $9ts1
                    $9tc2 = $9te2 - $9ts2
                    $9tc3 = $9te3 - $9ts3
                    $9tc4 = $9te4 - $9ts4
                    if ($9tc3 -lt 0) {
                        $9tc3 = $9tc3 + 60
                        $9tc2 = $9tc2 - 1
                        if ($9tc2 -lt 0) {
                            $9tc2 = $9tc2 + 60
                            $9tc1 = $9tc1 - 1
                        }
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
                }
                if ($miniclipnum -eq 10) {
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
                            if ($10ts2 -lt 0) {
                                $10ts2 = $10ts2 + 60
                                $10ts1 = $10ts1 - 1
                            }
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
                            if ($10te2 -ge 60) {
                                $10te2 = $10te2 - 60
                                $10te1 = $10te1 + 1
                            }
                        }
                    }
                    $10tc1 = $10te1 - $10ts1
                    $10tc2 = $10te2 - $10ts2
                    $10tc3 = $10te3 - $10ts3
                    $10tc4 = $10te4 - $10ts4
                    if ($10tc3 -lt 0) {
                        $10tc3 = $10tc3 + 60
                        $10tc2 = $10tc2 - 1
                        if ($10tc2 -lt 0) {
                            $10tc2 = $10tc2 + 60
                            $10tc1 = $10tc1 - 1
                        }
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
                }
                    if ($videotype -eq "A" -or $videotype -eq "a") {
                        write-host "Status: Fetching YouTube Media Links..." -NoNewLine
                        $glinks = .\bin\youtube-dl.exe -g --youtube-skip-dash-manifest "$inlink"
                        while (!$glinks) {$glinks = .\bin\youtube-dl.exe -g --youtube-skip-dash-manifest "$inlink"}
                        $glink1,$glink2 = $glinks.split(" ")
                        if (!$glink2) {$glink2 = $glink1}
                        write-host "`r                                                      " -NoNewLine
                        if ($miniclipnum -ge 2) {
                            write-host "`rStatus: Writing Clip 1..." -NoNewLine
                            .\bin\ffmpeg.exe -hide_banner -loglevel error -ss $clip1Sps -i ($glink1) -t $clip1Rt -ss $clip1Sps -i ($glink2) -t $clip1Rt ".\output\clip$clipnum.mkv"
                            $clipnum = $clipnum + 1
                            write-host "`rStatus: Writing Clip 2..." -NoNewLine
                            .\bin\ffmpeg.exe -hide_banner -loglevel error -ss $clip2Sps -i ($glink1) -t $clip2Rt -ss $clip2Sps -i ($glink2) -t $clip2Rt ".\output\clip$clipnum.mkv"
                        }
                        if ($miniclipnum -ge 3) {
                            $clipnum = $clipnum + 1
                            write-host "`rStatus: Writing Clip 3..." -NoNewLine
                            .\bin\ffmpeg.exe -hide_banner -loglevel error -ss $clip3Sps -i ($glink1) -t $clip3Rt -ss $clip3Sps -i ($glink2) -t $clip3Rt ".\output\clip$clipnum.mkv"
                        }
                        if ($miniclipnum -ge 4) {
                            $clipnum = $clipnum + 1
                            write-host "`rStatus: Writing Clip 4..." -NoNewLine
                            .\bin\ffmpeg.exe -hide_banner -loglevel error -ss $clip4Sps -i ($glink1) -t $clip4Rt -ss $clip4Sps -i ($glink2) -t $clip4Rt ".\output\clip$clipnum.mkv"
                        }
                        if ($miniclipnum -ge 5) {
                            $clipnum = $clipnum + 1
                            write-host "`rStatus: Writing Clip 5..." -NoNewLine
                            .\bin\ffmpeg.exe -hide_banner -loglevel error -ss $clip5Sps -i ($glink1) -t $clip5Rt -ss $clip5Sps -i ($glink2) -t $clip5Rt ".\output\clip$clipnum.mkv"
                        }
                        if ($miniclipnum -ge 6) {
                            $clipnum = $clipnum + 1
                            write-host "`rStatus: Writing Clip 6..." -NoNewLine
                            .\bin\ffmpeg.exe -hide_banner -loglevel error -ss $clip6Sps -i ($glink1) -t $clip6Rt -ss $clip6Sps -i ($glink2) -t $clip6Rt ".\output\clip$clipnum.mkv"
                        }
                        if ($miniclipnum -ge 7) {
                            $clipnum = $clipnum + 1
                            write-host "`rStatus: Writing Clip 7..." -NoNewLine
                            .\bin\ffmpeg.exe -hide_banner -loglevel error -ss $clip7Sps -i ($glink1) -t $clip7Rt -ss $clip7Sps -i ($glink2) -t $clip7Rt ".\output\clip$clipnum.mkv"
                        }
                        if ($miniclipnum -ge 8) {
                            $clipnum = $clipnum + 1
                            write-host "`rStatus: Writing Clip 8..." -NoNewLine
                            .\bin\ffmpeg.exe -hide_banner -loglevel error -ss $clip8Sps -i ($glink1) -t $clip8Rt -ss $clip8Sps -i ($glink2) -t $clip8Rt ".\output\clip$clipnum.mkv"
                        }
                        if ($miniclipnum -ge 9) {
                            $clipnum = $clipnum + 1
                            write-host "`rStatus: Writing Clip 9..." -NoNewLine
                            .\bin\ffmpeg.exe -hide_banner -loglevel error -ss $clip9Sps -i ($glink1) -t $clip9Rt -ss $clip9Sps -i ($glink2) -t $clip9Rt ".\output\clip$clipnum.mkv"
                        }
                        if ($miniclipnum -eq 10) {
                            $clipnum = $clipnum + 1
                            write-host "`rStatus: Writing Clip 10..." -NoNewLine
                            .\bin\ffmpeg.exe -hide_banner -loglevel error -ss $clip10Sps -i ($glink1) -t $clip10Rt -ss $clip10Sps -i ($glink2) -t $clip10Rt ".\output\clip$clipnum.mkv"
                        }
                        write-host "`r                                   " -NoNewLine
                        write-host "`rStatus: Finished Writing Clips"
                    }
                    if ($videotype -eq "B" -or $videotype -eq "b") {
                        write-host "Status: Fetching Archive Media..." -NoNewLine
                        $glink = .\bin\youtube-dl.exe -g "$inlink"
                        while (!$glink) {$glink = .\bin\youtube-dl.exe -g "$inlink"}
                        write-host "`r                                   " -NoNewLine
                        if ($miniclipnum -ge 2) {
                            write-host "`rStatus: Writing Clip 1..." -NoNewLine
                            .\bin\ffmpeg.exe -hide_banner -loglevel error -ss $clip1Sps -i ($glink) -t $clip1Rt ".\output\clip$clipnum.mkv"
                            $clipnum = $clipnum + 1
                            write-host "`rStatus: Writing Clip 2..." -NoNewLine
                            .\bin\ffmpeg.exe -hide_banner -loglevel error -ss $clip2Sps -i ($glink) -t $clip2Rt ".\output\clip$clipnum.mkv"
                        }
                        if ($miniclipnum -ge 3) {
                            $clipnum = $clipnum + 1
                            write-host "`rStatus: Writing Clip 3..." -NoNewLine
                            .\bin\ffmpeg.exe -hide_banner -loglevel error -ss $clip3Sps -i ($glink) -t $clip3Rt ".\output\clip$clipnum.mkv"
                        }
                        if ($miniclipnum -ge 4) {
                            $clipnum = $clipnum + 1
                            write-host "`rStatus: Writing Clip 4..." -NoNewLine
                            .\bin\ffmpeg.exe -hide_banner -loglevel error -ss $clip4Sps -i ($glink) -t $clip4Rt ".\output\clip$clipnum.mkv"
                        }
                        if ($miniclipnum -ge 5) {
                            $clipnum = $clipnum + 1
                            write-host "`rStatus: Writing Clip 5..." -NoNewLine
                            .\bin\ffmpeg.exe -hide_banner -loglevel error -ss $clip5Sps -i ($glink) -t $clip5Rt ".\output\clip$clipnum.mkv"
                        }
                        if ($miniclipnum -ge 6) {
                            $clipnum = $clipnum + 1
                            write-host "`rStatus: Writing Clip 6..." -NoNewLine
                            .\bin\ffmpeg.exe -hide_banner -loglevel error -ss $clip6Sps -i ($glink) -t $clip6Rt ".\output\clip$clipnum.mkv"
                        }
                        if ($miniclipnum -ge 7) {
                            $clipnum = $clipnum + 1
                            write-host "`rStatus: Writing Clip 7..." -NoNewLine
                            .\bin\ffmpeg.exe -hide_banner -loglevel error -ss $clip7Sps -i ($glink) -t $clip7Rt ".\output\clip$clipnum.mkv"
                        }
                        if ($miniclipnum -ge 8) {
                            $clipnum = $clipnum + 1
                            write-host "`rStatus: Writing Clip 8..." -NoNewLine
                            .\bin\ffmpeg.exe -hide_banner -loglevel error -ss $clip8Sps -i ($glink) -t $clip8Rt ".\output\clip$clipnum.mkv"
                        }
                        if ($miniclipnum -ge 9) {
                            $clipnum = $clipnum + 1
                            write-host "`rStatus: Writing Clip 9..." -NoNewLine
                            .\bin\ffmpeg.exe -hide_banner -loglevel error -ss $clip9Sps -i ($glink) -t $clip9Rt ".\output\clip$clipnum.mkv"
                        }
                        if ($miniclipnum -eq 10) {
                            $clipnum = $clipnum + 1
                            write-host "`rStatus: Writing Clip 10..."
                            .\bin\ffmpeg.exe -hide_banner -loglevel error -ss $clip10Sps -i ($glink) -t $clip10Rt ".\output\clip$clipnum.mkv"
                        }
                        write-host "`r                                   " -NoNewLine
                        write-host "`rStatus: Finished Writing Clips"
                    }
                    if ($videotype -eq "C" -or $videotype -eq "c") {
                        if ($miniclipnum -ge 2) {
                            write-host "Status: Writing Clip 1..." -NoNewLine
                            .\bin\ffmpeg.exe -hide_banner -loglevel error -ss $clip1Sps -i ($tempfile) -t $clip1Rt ".\output\clip$clipnum.mkv"
                            $clipnum = $clipnum + 1
                            write-host "`rStatus: Writing Clip 2..." -NoNewLine
                            .\bin\ffmpeg.exe -hide_banner -loglevel error -ss $clip2Sps -i ($tempfile) -t $clip2Rt ".\output\clip$clipnum.mkv"
                        }
                        if ($miniclipnum -ge 3) {
                            $clipnum = $clipnum + 1
                            write-host "`rStatus: Writing Clip 3..." -NoNewLine
                            .\bin\ffmpeg.exe -hide_banner -loglevel error -ss $clip3Sps -i ($tempfile) -t $clip3Rt ".\output\clip$clipnum.mkv"
                        }
                        if ($miniclipnum -ge 4) {
                            $clipnum = $clipnum + 1
                            write-host "`rStatus: Writing Clip 4..." -NoNewLine
                            .\bin\ffmpeg.exe -hide_banner -loglevel error -ss $clip4Sps -i ($tempfile) -t $clip4Rt ".\output\clip$clipnum.mkv"
                        }
                        if ($miniclipnum -ge 5) {
                            $clipnum = $clipnum + 1
                            write-host "`rStatus: Writing Clip 5..." -NoNewLine
                            .\bin\ffmpeg.exe -hide_banner -loglevel error -ss $clip5Sps -i ($tempfile) -t $clip5Rt ".\output\clip$clipnum.mkv"
                        }
                        if ($miniclipnum -ge 6) {
                            $clipnum = $clipnum + 1
                            write-host "`rStatus: Writing Clip 6..." -NoNewLine
                            .\bin\ffmpeg.exe -hide_banner -loglevel error -ss $clip6Sps -i ($tempfile) -t $clip6Rt ".\output\clip$clipnum.mkv"
                        }
                        if ($miniclipnum -ge 7) {
                            $clipnum = $clipnum + 1
                            write-host "`rStatus: Writing Clip 7..." -NoNewLine
                            .\bin\ffmpeg.exe -hide_banner -loglevel error -ss $clip7Sps -i ($tempfile) -t $clip7Rt ".\output\clip$clipnum.mkv"
                        }
                        if ($miniclipnum -ge 8) {
                            $clipnum = $clipnum + 1
                            write-host "`rStatus: Writing Clip 8..." -NoNewLine
                            .\bin\ffmpeg.exe -hide_banner -loglevel error -ss $clip8Sps -i ($tempfile) -t $clip8Rt ".\output\clip$clipnum.mkv"
                        }
                        if ($miniclipnum -ge 9) {
                            $clipnum = $clipnum + 1
                            write-host "`rStatus: Writing Clip 9..." -NoNewLine
                            .\bin\ffmpeg.exe -hide_banner -loglevel error -ss $clip9Sps -i ($tempfile) -t $clip9Rt ".\output\clip$clipnum.mkv"
                        }
                        if ($miniclipnum -eq 10) {
                            $clipnum = $clipnum + 1
                            write-host "`rStatus: Writing Clip 10..."
                            .\bin\ffmpeg.exe -hide_banner -loglevel error -ss $clip10Sps -i ($tempfile) -t $clip10Rt ".\output\clip$clipnum.mkv"
                        }
                        write-host "`r                                   " -NoNewLine
                        write-host "`rStatus: Finished Writing Clips"
                    }
                    do {$needsstitching = read-host -prompt 'Do you want to stitch clips? [Y/N]'}
                    until ($needsstitching -eq "Y" -or $needsstitching -eq "y" -or $needsstitching -eq "N" -or $needsstitching -eq "n")
                    if ($needsstitching -eq "Y" -or $needsstitching -eq "y") {
                    &$HoloStitcher
                    }
                    else {
                        write-host "Clipping Complete!"
                        read-host -prompt "Press [ENTER] To Close The Tool"
                        return
                    }
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
                    if ($ts2 -lt 0) {
                        $ts2 = $ts2 + 60
                        $ts1 = $ts1 - 1
                    }
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
                    if ($te2 -ge 60) {
                        $te2 = $te2 - 60
                        $te1 = $te1 + 1
                    }
                }
            }
            $tc1 = $te1 - $ts1
            $tc2 = $te2 - $ts2
            $tc3 = $te3 - $ts3
            $tc4 = $te4 - $ts4
            if ($tc3 -lt 0) {
                $tc3 = $tc3 + 60
                $tc2 = $tc2 - 1
                if ($tc2 -lt 0) {
                    $tc2 = $tc2 + 60
                    $tc1 = $tc1 - 1
                }
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
            $timestampRt = "$tc1`:$tc2`:$tc3.$tc4"
            $clipnum = read-host -prompt 'Clip Number'
            if ($videotype -eq "A" -or $videotype -eq "a") {
                write-host "Status: Fetching YouTube Media Links..." -NoNewLine
                $glinks = .\bin\youtube-dl.exe -g --youtube-skip-dash-manifest "$inlink"
                while (!$glinks) {$glinks = .\bin\youtube-dl.exe -g --youtube-skip-dash-manifest "$inlink"}
                $glink1,$glink2 = $glinks.split(" ")
                if (!$glink2) {$glink2 = $glink1}
                write-host "`r                                          " -NoNewLine
                write-host "`rStatus: Writing Clip..."
                .\bin\ffmpeg.exe -hide_banner -loglevel error -ss $timestampSps -i ($glink1) -t $timestampRt -ss $timestampSps -i ($glink2) -t $timestampRt ".\output\clip$clipnum.mkv"
                write-host "Clipping Complete!"
                read-host -prompt "Press [ENTER] To Close The Tool"
                return
            }
            if ($videotype -eq "B" -or $videotype -eq "b") {
                write-host "Status: Fetching Archive Media Links..." -NoNewLine
                $glink = .\bin\youtube-dl.exe -g "$inlink"
                while (!$glink) {$glink = .\bin\youtube-dl.exe -g --youtube-skip-dash-manifest "$inlink"}
                write-host "`r                                        " -NoNewLine
                write-host "`rStatus: Writing Clip..."
                .\bin\ffmpeg.exe -hide_banner -loglevel error -ss $timestampSps -i ($glink) -t $timestampRt ".\output\clip$clipnum.mkv"
                write-host "Clipping Complete!"
                read-host -prompt "Press [ENTER] To Close The Tool"
                return
            }
            if ($videotype -eq "C" -or $videotype -eq "c") {
                $fullclipnum = read-host -prompt 'Clip Number'
                $clipnum = $fullclipnum
                $tempfile = ".\clipDL.mkv"
                if (test-path ".\clipDL.mkv" -pathtype leaf) {$tempFile = ".\clipDL.mkv"}
                if (test-path ".\clipDL.webm" -pathtype leaf) {$tempFile = ".\clipDL.webm"}
                if (test-path ".\clipDL.mp4" -pathtype leaf) {$tempFile = ".\clipDL.mp4"}
                write-host "Status: Writing Clip..."
                .\bin\ffmpeg.exe -hide_banner -loglevel error -ss $timestampSps -i $tempFile -t $timestampRt -c copy ".\output\clip$clipnum.mkv"
                else {
                    write-host "Clipping Complete!"
                    read-host -prompt "Press [ENTER] To Close The Tool"
                    return
                }
            }
        }
    }
}
remove-item -path ".\output" -recurse
mkdir ".\output" | Out-Null
write-host "
|     Sheer Curiosity's Hololive Clipping Tool     |
|                                                  |
|      Made With Copious Amounts Of Self-Hate      |
|                                                  |
|              Version 1.0 Alpha 3                 |
|                                                  |
|   Please Review The README Before Attempting To  | 
|                 Use This Tool.                   |
"
&$HololiveClipper