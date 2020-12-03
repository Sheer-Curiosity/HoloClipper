param (
    [string]$fulltitle = "output",
    [string]$videotype = $null,
    [string]$hlrwStandards = "n",
    [string]$inlink = $null,
    [string]$miniclip = "y",
    [string]$tempfile = $null,
    [string]$dlDir = ".",
    [string]$timestampsIn = $null,
    [string]$needsstitching = "y"
)

$tempdir = [System.IO.Path]::GetTempPath()
$tempdir = $tempdir.trim("\")

$HoloStitcher = {
    if ($hlrwStandards -eq "Y" -or $hlrwStandards -eq "y") {
        $clipresolution = ffprobe.exe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 "$tempdir\clip1.mkv"
        .\bin\ffmpeg.exe -y -hide_banner  -f lavfi -i color=black:s="$clipresolution":r=30000/1000 -f lavfi -i anullsrc -ar 48000 -ac 2 -t 3 "$tempdir\blackscreen.mkv"
        if ($miniclipnum -eq 2) {
            .\bin\ffmpeg.exe -y -hide_banner  -i "$tempdir\clip1.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip2.mkv" -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0][2:v:0][2:a:0]concat=n=3:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" -x264-params keyint=24:min-keyint=1 "$dlDir\$fulltitle.mkv"
            remove-item ".\blackscreen.mkv"
            Remove-Item -path "$tempdir\clip1.mkv"
            Remove-Item -path "$tempdir\clip2.mkv"
        }
        if ($miniclipnum -eq 3) {
            .\bin\ffmpeg.exe -y -hide_banner  -i "$tempdir\clip1.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip2.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip3.mkv" -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0][2:v:0][2:a:0][3:v:0][3:a:0][4:v:0][4:a:0]concat=n=5:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" -x264-params keyint=24:min-keyint=1 "$dlDir\$fulltitle.mkv"
            remove-item ".\blackscreen.mkv"
            Remove-Item -path "$tempdir\clip1.mkv"
            Remove-Item -path "$tempdir\clip2.mkv"
            Remove-Item -path "$tempdir\clip3.mkv"
        }
        if ($miniclipnum -eq 4) {
            .\bin\ffmpeg.exe -y -hide_banner  -i "$tempdir\clip1.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip2.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip3.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip4.mkv" -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0][2:v:0][2:a:0][3:v:0][3:a:0][4:v:0][4:a:0][5:v:0][5:a:0][6:v:0][6:a:0]concat=n=7:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" -x264-params keyint=24:min-keyint=1 "$dlDir\$fulltitle.mkv"
            remove-item ".\blackscreen.mkv"
            Remove-Item -path "$tempdir\clip1.mkv"
            Remove-Item -path "$tempdir\clip2.mkv"
            Remove-Item -path "$tempdir\clip3.mkv"
            Remove-Item -path "$tempdir\clip4.mkv"
        }
        if ($miniclipnum -eq 5) {
            .\bin\ffmpeg.exe -y -hide_banner  -i "$tempdir\clip1.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip2.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip3.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip4.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip5.mkv" -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0][2:v:0][2:a:0][3:v:0][3:a:0][4:v:0][4:a:0][5:v:0][5:a:0][6:v:0][6:a:0][7:v:0][7:a:0][8:v:0][8:a:0]concat=n=9:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" -x264-params keyint=24:min-keyint=1 "$dlDir\$fulltitle.mkv"
            remove-item ".\blackscreen.mkv"
            Remove-Item -path "$tempdir\clip1.mkv"
            Remove-Item -path "$tempdir\clip2.mkv"
            Remove-Item -path "$tempdir\clip3.mkv"
            Remove-Item -path "$tempdir\clip4.mkv"
            Remove-Item -path "$tempdir\clip5.mkv"
        }
        if ($miniclipnum -eq 6) {
            .\bin\ffmpeg.exe -y -hide_banner  -i "$tempdir\clip1.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip2.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip3.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip4.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip5.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip6.mkv" -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0][2:v:0][2:a:0][3:v:0][3:a:0][4:v:0][4:a:0][5:v:0][5:a:0][6:v:0][6:a:0][7:v:0][7:a:0][8:v:0][8:a:0][9:v:0][9:a:0][10:v:0][10:a:0]concat=n=11:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" -x264-params keyint=24:min-keyint=1 "$dlDir\$fulltitle.mkv"
            remove-item ".\blackscreen.mkv"
            Remove-Item -path "$tempdir\clip1.mkv"
            Remove-Item -path "$tempdir\clip2.mkv"
            Remove-Item -path "$tempdir\clip3.mkv"
            Remove-Item -path "$tempdir\clip4.mkv"
            Remove-Item -path "$tempdir\clip5.mkv"
            Remove-Item -path "$tempdir\clip6.mkv"
        }
        if ($miniclipnum -eq 7) {
            .\bin\ffmpeg.exe -y -hide_banner  -i "$tempdir\clip1.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip2.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip3.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip4.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip5.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip6.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip7.mkv" -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0][2:v:0][2:a:0][3:v:0][3:a:0][4:v:0][4:a:0][5:v:0][5:a:0][6:v:0][6:a:0][7:v:0][7:a:0][8:v:0][8:a:0][9:v:0][9:a:0][10:v:0][10:a:0][11:v:0][11:a:0][12:v:0][12:a:0]concat=n=13:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" -x264-params keyint=24:min-keyint=1 "$dlDir\$fulltitle.mkv"
            remove-item ".\blackscreen.mkv"
            Remove-Item -path "$tempdir\clip1.mkv"
            Remove-Item -path "$tempdir\clip2.mkv"
            Remove-Item -path "$tempdir\clip3.mkv"
            Remove-Item -path "$tempdir\clip4.mkv"
            Remove-Item -path "$tempdir\clip5.mkv"
            Remove-Item -path "$tempdir\clip6.mkv"
            Remove-Item -path "$tempdir\clip7.mkv"
        }
        if ($miniclipnum -eq 8) {
            .\bin\ffmpeg.exe -y -hide_banner  -i "$tempdir\clip1.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip2.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip3.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip4.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip5.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip6.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip7.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip8.mkv" -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0][2:v:0][2:a:0][3:v:0][3:a:0][4:v:0][4:a:0][5:v:0][5:a:0][6:v:0][6:a:0][7:v:0][7:a:0][8:v:0][8:a:0][9:v:0][9:a:0][10:v:0][10:a:0][11:v:0][11:a:0][12:v:0][12:a:0][13:v:0][13:a:0][14:v:0][14:a:0]concat=n=15:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" -x264-params keyint=24:min-keyint=1 "$dlDir\$fulltitle.mkv"
            remove-item ".\blackscreen.mkv"
            Remove-Item -path "$tempdir\clip1.mkv"
            Remove-Item -path "$tempdir\clip2.mkv"
            Remove-Item -path "$tempdir\clip3.mkv"
            Remove-Item -path "$tempdir\clip4.mkv"
            Remove-Item -path "$tempdir\clip5.mkv"
            Remove-Item -path "$tempdir\clip6.mkv"
            Remove-Item -path "$tempdir\clip7.mkv"
            Remove-Item -path "$tempdir\clip8.mkv"
        }
        if ($miniclipnum -eq 9) {
            .\bin\ffmpeg.exe -y -hide_banner  -i "$tempdir\clip1.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip2.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip3.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip4.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip5.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip6.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip7.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip8.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip9.mkv" -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0][2:v:0][2:a:0][3:v:0][3:a:0][4:v:0][4:a:0][5:v:0][5:a:0][6:v:0][6:a:0][7:v:0][7:a:0][8:v:0][8:a:0][9:v:0][9:a:0][10:v:0][10:a:0][11:v:0][11:a:0][12:v:0][12:a:0][13:v:0][13:a:0][14:v:0][14:a:0][15:v:0][15:a:0][16:v:0][16:a:0]concat=n=17:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" -x264-params keyint=24:min-keyint=1 "$dlDir\$fulltitle.mkv"
            remove-item ".\blackscreen.mkv"
            Remove-Item -path "$tempdir\clip1.mkv"
            Remove-Item -path "$tempdir\clip2.mkv"
            Remove-Item -path "$tempdir\clip3.mkv"
            Remove-Item -path "$tempdir\clip4.mkv"
            Remove-Item -path "$tempdir\clip5.mkv"
            Remove-Item -path "$tempdir\clip6.mkv"
            Remove-Item -path "$tempdir\clip7.mkv"
            Remove-Item -path "$tempdir\clip8.mkv"
            Remove-Item -path "$tempdir\clip9.mkv"
        }
        if ($miniclipnum -eq 10) {
            .\bin\ffmpeg.exe -y -hide_banner  -i "$tempdir\clip1.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip2.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip3.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip4.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip5.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip6.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip7.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip8.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip9.mkv" -i "$tempdir\blackscreen.mkv" -i "$tempdir\clip10.mkv" -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0][2:v:0][2:a:0][3:v:0][3:a:0][4:v:0][4:a:0][5:v:0][5:a:0][6:v:0][6:a:0][7:v:0][7:a:0][8:v:0][8:a:0][9:v:0][9:a:0][10:v:0][10:a:0][11:v:0][11:a:0][12:v:0][12:a:0][13:v:0][13:a:0][14:v:0][14:a:0][15:v:0][15:a:0][16:v:0][16:a:0][17:v:0][17:a:0][18:v:0][18:a:0]concat=n=19:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" -x264-params keyint=24:min-keyint=1 "$dlDir\$fulltitle.mkv"
            remove-item ".\blackscreen.mkv"
            Remove-Item -path "$tempdir\clip1.mkv"
            Remove-Item -path "$tempdir\clip2.mkv"
            Remove-Item -path "$tempdir\clip3.mkv"
            Remove-Item -path "$tempdir\clip4.mkv"
            Remove-Item -path "$tempdir\clip5.mkv"
            Remove-Item -path "$tempdir\clip6.mkv"
            Remove-Item -path "$tempdir\clip7.mkv"
            Remove-Item -path "$tempdir\clip8.mkv"
            Remove-Item -path "$tempdir\clip9.mkv"
            Remove-Item -path "$tempdir\clip10.mkv"
        }
    }
    else {
        if ($miniclipnum -eq 2) {
            .\bin\ffmpeg.exe -y -hide_banner  -i "$tempdir\clip1.mkv" -i "$tempdir\clip2.mkv" -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0]concat=n=2:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" -x264-params keyint=24:min-keyint=1 "$dlDir\$fulltitle.mkv"
            Remove-Item -path "$tempdir\clip1.mkv"
            Remove-Item -path "$tempdir\clip2.mkv"
        }
        if ($miniclipnum -eq 3) {
            .\bin\ffmpeg.exe -y -hide_banner  -i "$tempdir\clip1.mkv" -i "$tempdir\clip2.mkv" -i "$tempdir\clip3.mkv" -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0][2:v:0][2:a:0]concat=n=3:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" -x264-params keyint=24:min-keyint=1 "$dlDir\$fulltitle.mkv"
            Remove-Item -path "$tempdir\clip1.mkv"
            Remove-Item -path "$tempdir\clip2.mkv"
            Remove-Item -path "$tempdir\clip3.mkv"
        }
        if ($miniclipnum -eq 4) {
            .\bin\ffmpeg.exe -y -hide_banner  -i "$tempdir\clip1.mkv" -i "$tempdir\clip2.mkv" -i "$tempdir\clip3.mkv" -i "$tempdir\clip4.mkv" -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0][2:v:0][2:a:0][3:v:0][3:a:0]concat=n=4:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" -x264-params keyint=24:min-keyint=1 "$dlDir\$fulltitle.mkv"
            Remove-Item -path "$tempdir\clip1.mkv"
            Remove-Item -path "$tempdir\clip2.mkv"
            Remove-Item -path "$tempdir\clip3.mkv"
            Remove-Item -path "$tempdir\clip4.mkv"
        }
        if ($miniclipnum -eq 5) {
            .\bin\ffmpeg.exe -y -hide_banner  -i "$tempdir\clip1.mkv" -i "$tempdir\clip2.mkv" -i "$tempdir\clip3.mkv" -i "$tempdir\clip4.mkv" -i "$tempdir\clip5.mkv" -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0][2:v:0][2:a:0][3:v:0][3:a:0][4:v:0][4:a:0]concat=n=5:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" -x264-params keyint=24:min-keyint=1 "$dlDir\$fulltitle.mkv"
            Remove-Item -path "$tempdir\clip1.mkv"
            Remove-Item -path "$tempdir\clip2.mkv"
            Remove-Item -path "$tempdir\clip3.mkv"
            Remove-Item -path "$tempdir\clip4.mkv"
            Remove-Item -path "$tempdir\clip5.mkv"
        }
        if ($miniclipnum -eq 6) {
            .\bin\ffmpeg.exe -y -hide_banner  -i "$tempdir\clip1.mkv" -i "$tempdir\clip2.mkv" -i "$tempdir\clip3.mkv" -i "$tempdir\clip4.mkv" -i "$tempdir\clip5.mkv" -i "$tempdir\clip6.mkv" -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0][2:v:0][2:a:0][3:v:0][3:a:0][4:v:0][4:a:0][5:v:0][5:a:0]concat=n=6:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" -x264-params keyint=24:min-keyint=1 "$dlDir\$fulltitle.mkv"
            Remove-Item -path "$tempdir\clip1.mkv"
            Remove-Item -path "$tempdir\clip2.mkv"
            Remove-Item -path "$tempdir\clip3.mkv"
            Remove-Item -path "$tempdir\clip4.mkv"
            Remove-Item -path "$tempdir\clip5.mkv"
            Remove-Item -path "$tempdir\clip6.mkv"
        }
        if ($miniclipnum -eq 7) {
            .\bin\ffmpeg.exe -y -hide_banner  -i "$tempdir\clip1.mkv" -i "$tempdir\clip2.mkv" -i "$tempdir\clip3.mkv" -i "$tempdir\clip4.mkv" -i "$tempdir\clip5.mkv" -i "$tempdir\clip6.mkv" -i "$tempdir\clip7.mkv" -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0][2:v:0][2:a:0][3:v:0][3:a:0][4:v:0][4:a:0][5:v:0][5:a:0][6:v:0][6:a:0]concat=n=7:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" -x264-params keyint=24:min-keyint=1 "$dlDir\$fulltitle.mkv"
            Remove-Item -path "$tempdir\clip1.mkv"
            Remove-Item -path "$tempdir\clip2.mkv"
            Remove-Item -path "$tempdir\clip3.mkv"
            Remove-Item -path "$tempdir\clip4.mkv"
            Remove-Item -path "$tempdir\clip5.mkv"
            Remove-Item -path "$tempdir\clip6.mkv"
            Remove-Item -path "$tempdir\clip7.mkv"
        }
        if ($miniclipnum -eq 8) {
            .\bin\ffmpeg.exe -y -hide_banner  -i "$tempdir\clip1.mkv" -i "$tempdir\clip2.mkv" -i "$tempdir\clip3.mkv" -i "$tempdir\clip4.mkv" -i "$tempdir\clip5.mkv" -i "$tempdir\clip6.mkv" -i "$tempdir\clip7.mkv" -i "$tempdir\clip8.mkv" -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0][2:v:0][2:a:0][3:v:0][3:a:0][4:v:0][4:a:0][5:v:0][5:a:0][6:v:0][6:a:0][7:v:0][7:a:0]concat=n=8:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" -x264-params keyint=24:min-keyint=1 "$dlDir\$fulltitle.mkv"
            Remove-Item -path "$tempdir\clip1.mkv"
            Remove-Item -path "$tempdir\clip2.mkv"
            Remove-Item -path "$tempdir\clip3.mkv"
            Remove-Item -path "$tempdir\clip4.mkv"
            Remove-Item -path "$tempdir\clip5.mkv"
            Remove-Item -path "$tempdir\clip6.mkv"
            Remove-Item -path "$tempdir\clip7.mkv"
            Remove-Item -path "$tempdir\clip8.mkv"
        }
        if ($miniclipnum -eq 9) {
            .\bin\ffmpeg.exe -y -hide_banner  -i "$tempdir\clip1.mkv" -i "$tempdir\clip2.mkv" -i "$tempdir\clip3.mkv" -i "$tempdir\clip4.mkv" -i "$tempdir\clip5.mkv" -i "$tempdir\clip6.mkv" -i "$tempdir\clip7.mkv" -i "$tempdir\clip8.mkv" -i "$tempdir\clip9.mkv" -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0][2:v:0][2:a:0][3:v:0][3:a:0][4:v:0][4:a:0][5:v:0][5:a:0][6:v:0][6:a:0][7:v:0][7:a:0][8:v:0][8:a:0]concat=n=9:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" -x264-params keyint=24:min-keyint=1 "$dlDir\$fulltitle.mkv"
            Remove-Item -path "$tempdir\clip1.mkv"
            Remove-Item -path "$tempdir\clip2.mkv"
            Remove-Item -path "$tempdir\clip3.mkv"
            Remove-Item -path "$tempdir\clip4.mkv"
            Remove-Item -path "$tempdir\clip5.mkv"
            Remove-Item -path "$tempdir\clip6.mkv"
            Remove-Item -path "$tempdir\clip7.mkv"
            Remove-Item -path "$tempdir\clip8.mkv"
            Remove-Item -path "$tempdir\clip9.mkv"
        }
        if ($miniclipnum -eq 10) {
            .\bin\ffmpeg.exe -y -hide_banner  -i "$tempdir\clip1.mkv" -i "$tempdir\clip2.mkv" -i "$tempdir\clip3.mkv" -i "$tempdir\clip4.mkv" -i "$tempdir\clip5.mkv" -i "$tempdir\clip6.mkv" -i "$tempdir\clip7.mkv" -i "$tempdir\clip8.mkv" -i "$tempdir\clip9.mkv" -i "$tempdir\clip10.mkv" -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0][2:v:0][2:a:0][3:v:0][3:a:0][4:v:0][4:a:0][5:v:0][5:a:0][6:v:0][6:a:0][7:v:0][7:a:0][8:v:0][8:a:0][9:v:0][9:a:0]concat=n=10:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" -x264-params keyint=24:min-keyint=1 "$dlDir\$fulltitle.mkv"
            Remove-Item -path "$tempdir\clip1.mkv"
            Remove-Item -path "$tempdir\clip2.mkv"
            Remove-Item -path "$tempdir\clip3.mkv"
            Remove-Item -path "$tempdir\clip4.mkv"
            Remove-Item -path "$tempdir\clip5.mkv"
            Remove-Item -path "$tempdir\clip6.mkv"
            Remove-Item -path "$tempdir\clip7.mkv"
            Remove-Item -path "$tempdir\clip8.mkv"
            Remove-Item -path "$tempdir\clip9.mkv"
            Remove-Item -path "$tempdir\clip10.mkv"
        }
    }
}
$HololiveClipper = {
    #Timestamp Parser (More spaghetti WOOOOOOOOOOOOO)
    $timestampsArray = $timestampsIn.split(",")
    $miniclipnum = $timestampsArray.length
    $clip1stamps,$clip2stamps,$clip3stamps,$clip4stamps,$clip5stamps,$clip6stamps,$clip7stamps,$clip8stamps,$clip9stamps,$clip10stamps=$timestampsIn.split(",")
    if ($clip1stamps) {
        $clip1stamps=$clip1stamps.trim("[]")
        $clip1st1,$clip1st2=$clip1stamps.split("-")
        $c1st1array=$clip1st1.split(":")
        $c1st2array=$clip1st2.split(":")
        $c1a1,$c1a2,$c1a3=$clip1st1.split(":")
        $c1b1,$c1b2,$c1b3=$clip1st2.split(":")
        $c1a1 = [int]$c1a1
        $c1a2 = [int]$c1a2
        $c1a3 = [int]$c1a3
        $c1b1 = [int]$c1b1
        $c1b2 = [int]$c1b2
        $c1b3 = [int]$c1b3
        if ($c1st1array.length -eq 2) {
            if (($c1a1.tostring().length) -eq 1) {
                $c1a1 = "0$c1a1"
            }
            if (($c1a2.tostring().length) -eq 1) {
                $c1a2 = "0$c1a2"
            }
            $clip1ts = "00`:$c1a1`:$c1a2`:00"
        }
        if ($c1st1array.length -eq 3) {
            if (($c1a1.tostring().length) -eq 1) {
                $c1a1 = "0$c1a1"
            }
            if (($c1a2.tostring().length) -eq 1) {
                $c1a2 = "0$c1a2"
            }
            if (($c1a3.tostring().length) -eq 1) {
                $c1a3 = "0$c1a3"
            }
            $clip1ts = "$c1a1`:$c1a2`:$c1a3`:00"
        }
        if ($c1st2array.length -eq 2) {
            if (($c1b1.tostring().length) -eq 1) {
                $c1b1 = "0$c1b1"
            }
            if (($c1b2.tostring().length) -eq 1) {
                $c1b2 = "0$c1b2"
            }
            $clip1te = "00`:$c1b1`:$c1b2`:00"
        }
        if ($c1st2array.length -eq 3) {
            if (($c1b1.tostring().length) -eq 1) {
                $c1b1 = "0$c1b1"
            }
            if (($c1b2.tostring().length) -eq 1) {
                $c1b2 = "0$c1b2"
            }
            if (($c1b3.tostring().length) -eq 1) {
                $c1b3 = "0$c1b3"
            }
            $clip1te = "$c1b1`:$c1b2`:$c1b3`:00"
        }
    }
    if ($clip2stamps) {
        $clip2stamps=$clip2stamps.trim("[]")
        $clip2st1,$clip2st2=$clip2stamps.split("-")
        $c2st1array=$clip2st1.split(":")
        $c2st2array=$clip2st2.split(":")
        $c2a1,$c2a2,$c2a3=$clip2st1.split(":")
        $c2b1,$c2b2,$c2b3=$clip2st2.split(":")
        $c2a1 = [int]$c2a1
        $c2a2 = [int]$c2a2
        $c2a3 = [int]$c2a3
        $c2b1 = [int]$c2b1
        $c2b2 = [int]$c2b2
        $c2b3 = [int]$c2b3
        if ($c2st1array.length -eq 2) {
            if (($c2a1.tostring().length) -eq 1) {
                $c2a1 = "0$c2a1"
            }
            if (($c2a2.tostring().length) -eq 1) {
                $c2a2 = "0$c2a2"
            }
            $clip2ts = "00`:$c2a1`:$c2a2`:00"
        }
        if ($c2st1array.length -eq 3) {
            if (($c2a1.tostring().length) -eq 1) {
                $c2a1 = "0$c2a1"
            }
            if (($c2a2.tostring().length) -eq 1) {
                $c2a2 = "0$c2a2"
            }
            if (($c2a3.tostring().length) -eq 1) {
                $c2a3 = "0$c2a3"
            }
            $clip2ts = "$c2a1`:$c2a2`:$c2a3`:00"
        }
        if ($c2st2array.length -eq 2) {
            if (($c2b1.tostring().length) -eq 1) {
                $c2b1 = "0$c2b1"
            }
            if (($c2b2.tostring().length) -eq 1) {
                $c2b2 = "0$c2b2"
            }
            $clip2te = "00`:$c2b1`:$c2b2`:00"
        }
        if ($c2st2array.length -eq 3) {
            if (($c2b1.tostring().length) -eq 1) {
                $c2b1 = "0$c2b1"
            }
            if (($c2b2.tostring().length) -eq 1) {
                $c2b2 = "0$c2b2"
            }
            if (($c2b3.tostring().length) -eq 1) {
                $c2b3 = "0$c2b3"
            }
            $clip2te = "$c2b1`:$c2b2`:$c2b3`:00"
        }
    }
    if ($clip3stamps) {
        $clip3stamps=$clip3stamps.trim("[]")
        $clip3st1,$clip3st2=$clip3stamps.split("-")
        $c3st1array=$clip3st1.split(":")
        $c3st2array=$clip3st2.split(":")
        $c3a1,$c3a2,$c3a3=$clip3st1.split(":")
        $c3b1,$c3b2,$c3b3=$clip3st2.split(":")
        $c3a1 = [int]$c3a1
        $c3a2 = [int]$c3a2
        $c3a3 = [int]$c3a3
        $c3b1 = [int]$c3b1
        $c3b2 = [int]$c3b2
        $c3b3 = [int]$c3b3
        if ($c3st1array.length -eq 2) {
            if (($c3a1.tostring().length) -eq 1) {
                $c3a1 = "0$c3a1"
            }
            if (($c3a2.tostring().length) -eq 1) {
                $c3a2 = "0$c3a2"
            }
            $clip3ts = "00`:$c3a1`:$c3a2`:00"
        }
        if ($c3st1array.length -eq 3) {
            if (($c3a1.tostring().length) -eq 1) {
                $c3a1 = "0$c3a1"
            }
            if (($c3a2.tostring().length) -eq 1) {
                $c3a2 = "0$c3a2"
            }
            if (($c3a3.tostring().length) -eq 1) {
                $c3a3 = "0$c3a3"
            }
            $clip3ts = "$c3a1`:$c3a2`:$c3a3`:00"
        }
        if ($c3st2array.length -eq 2) {
            if (($c3b1.tostring().length) -eq 1) {
                $c3b1 = "0$c3b1"
            }
            if (($c3b2.tostring().length) -eq 1) {
                $c3b2 = "0$c3b2"
            }
            $clip3te = "00`:$c3b1`:$c3b2`:00"
        }
        if ($c3st2array.length -eq 3) {
            if (($c3b1.tostring().length) -eq 1) {
                $c3b1 = "0$c3b1"
            }
            if (($c3b2.tostring().length) -eq 1) {
                $c3b2 = "0$c3b2"
            }
            if (($c3b3.tostring().length) -eq 1) {
                $c3b3 = "0$c3b3"
            }
            $clip3te = "$c3b1`:$c3b2`:$c3b3`:00"
        }
    }
    if ($clip4stamps) {
        $clip4stamps=$clip4stamps.trim("[]")
        $clip4st1,$clip4st2=$clip4stamps.split("-")
        $c4st1array=$clip4st1.split(":")
        $c4st2array=$clip4st2.split(":")
        $c4a1,$c4a2,$c4a3=$clip4st1.split(":")
        $c4b1,$c4b2,$c4b3=$clip4st2.split(":")
        $c4a1 = [int]$c4a1
        $c4a2 = [int]$c4a2
        $c4a3 = [int]$c4a3
        $c4b1 = [int]$c4b1
        $c4b2 = [int]$c4b2
        $c4b3 = [int]$c4b3
        if ($c4st1array.length -eq 2) {
            if (($c4a1.tostring().length) -eq 1) {
                $c4a1 = "0$c4a1"
            }
            if (($c4a2.tostring().length) -eq 1) {
                $c4a2 = "0$c4a2"
            }
            $clip4ts = "00`:$c4a1`:$c4a2`:00"
        }
        if ($c4st1array.length -eq 3) {
            if (($c4a1.tostring().length) -eq 1) {
                $c4a1 = "0$c4a1"
            }
            if (($c4a2.tostring().length) -eq 1) {
                $c4a2 = "0$c4a2"
            }
            if (($c4a3.tostring().length) -eq 1) {
                $c4a3 = "0$c4a3"
            }
            $clip4ts = "$c4a1`:$c4a2`:$c4a3`:00"
        }
        if ($c4st2array.length -eq 2) {
            if (($c4b1.tostring().length) -eq 1) {
                $c4b1 = "0$c4b1"
            }
            if (($c4b2.tostring().length) -eq 1) {
                $c4b2 = "0$c4b2"
            }
            $clip4te = "00`:$c4b1`:$c4b2`:00"
        }
        if ($c4st2array.length -eq 3) {
            if (($c4b1.tostring().length) -eq 1) {
                $c4b1 = "0$c4b1"
            }
            if (($c4b2.tostring().length) -eq 1) {
                $c4b2 = "0$c4b2"
            }
            if (($c4b3.tostring().length) -eq 1) {
                $c4b3 = "0$c4b3"
            }
            $clip4te = "$c4b1`:$c4b2`:$c4b3`:00"
        }
    }
    if ($clip5stamps) {
        $clip5stamps=$clip5stamps.trim("[]")
        $clip5st1,$clip5st2=$clip5stamps.split("-")
        $c5st1array=$clip5st1.split(":")
        $c5st2array=$clip5st2.split(":")
        $c5a1,$c5a2,$c5a3=$clip5st1.split(":")
        $c5b1,$c5b2,$c5b3=$clip5st2.split(":")
        $c5a1 = [int]$c5a1
        $c5a2 = [int]$c5a2
        $c5a3 = [int]$c5a3
        $c5b1 = [int]$c5b1
        $c5b2 = [int]$c5b2
        $c5b3 = [int]$c5b3
        if ($c5st1array.length -eq 2) {
            if (($c5a1.tostring().length) -eq 1) {
                $c5a1 = "0$c5a1"
            }
            if (($c5a2.tostring().length) -eq 1) {
                $c5a2 = "0$c5a2"
            }
            $clip5ts = "00`:$c5a1`:$c5a2`:00"
        }
        if ($c5st1array.length -eq 3) {
            if (($c5a1.tostring().length) -eq 1) {
                $c5a1 = "0$c5a1"
            }
            if (($c5a2.tostring().length) -eq 1) {
                $c5a2 = "0$c5a2"
            }
            if (($c5a3.tostring().length) -eq 1) {
                $c5a3 = "0$c5a3"
            }
            $clip5ts = "$c5a1`:$c5a2`:$c5a3`:00"
        }
        if ($c5st2array.length -eq 2) {
            if (($c5b1.tostring().length) -eq 1) {
                $c5b1 = "0$c5b1"
            }
            if (($c5b2.tostring().length) -eq 1) {
                $c5b2 = "0$c5b2"
            }
            $clip5te = "00`:$c5b1`:$c5b2`:00"
        }
        if ($c5st2array.length -eq 3) {
            if (($c5b1.tostring().length) -eq 1) {
                $c5b1 = "0$c5b1"
            }
            if (($c5b2.tostring().length) -eq 1) {
                $c5b2 = "0$c5b2"
            }
            if (($c5b3.tostring().length) -eq 1) {
                $c5b3 = "0$c5b3"
            }
            $clip5te = "$c5b1`:$c5b2`:$c5b3`:00"
        }
    }
    if ($clip6stamps) {
        $clip6stamps=$clip6stamps.trim("[]")
        $clip6st1,$clip6st2=$clip6stamps.split("-")
        $c6st1array=$clip6st1.split(":")
        $c6st2array=$clip6st2.split(":")
        $c6a1,$c6a2,$c6a3=$clip6st1.split(":")
        $c6b1,$c6b2,$c6b3=$clip6st2.split(":")
        $c6a1 = [int]$c6a1
        $c6a2 = [int]$c6a2
        $c6a3 = [int]$c6a3
        $c6b1 = [int]$c6b1
        $c6b2 = [int]$c6b2
        $c6b3 = [int]$c6b3
        if ($c6st1array.length -eq 2) {
            if (($c6a1.tostring().length) -eq 1) {
                $c6a1 = "0$c6a1"
            }
            if (($c6a2.tostring().length) -eq 1) {
                $c6a2 = "0$c6a2"
            }
            $clip6ts = "00`:$c6a1`:$c6a2`:00"
        }
        if ($c6st1array.length -eq 3) {
            if (($c6a1.tostring().length) -eq 1) {
                $c6a1 = "0$c6a1"
            }
            if (($c6a2.tostring().length) -eq 1) {
                $c6a2 = "0$c6a2"
            }
            if (($c6a3.tostring().length) -eq 1) {
                $c6a3 = "0$c6a3"
            }
            $clip6ts = "$c6a1`:$c6a2`:$c6a3`:00"
        }
        if ($c6st2array.length -eq 2) {
            if (($c6b1.tostring().length) -eq 1) {
                $c6b1 = "0$c6b1"
            }
            if (($c6b2.tostring().length) -eq 1) {
                $c6b2 = "0$c6b2"
            }
            $clip6te = "00`:$c6b1`:$c6b2`:00"
        }
        if ($c6st2array.length -eq 3) {
            if (($c6b1.tostring().length) -eq 1) {
                $c6b1 = "0$c6b1"
            }
            if (($c6b2.tostring().length) -eq 1) {
                $c6b2 = "0$c6b2"
            }
            if (($c6b3.tostring().length) -eq 1) {
                $c6b3 = "0$c6b3"
            }
            $clip6te = "$c6b1`:$c6b2`:$c6b3`:00"
        }
    }
    if ($clip7stamps) {
        $clip7stamps=$clip7stamps.trim("[]")
        $clip7st1,$clip7st2=$clip7stamps.split("-")
        $c7st1array=$clip7st1.split(":")
        $c7st2array=$clip7st2.split(":")
        $c7a1,$c7a2,$c7a3=$clip7st1.split(":")
        $c7b1,$c7b2,$c7b3=$clip7st2.split(":")
        $c7a1 = [int]$c7a1
        $c7a2 = [int]$c7a2
        $c7a3 = [int]$c7a3
        $c7b1 = [int]$c7b1
        $c7b2 = [int]$c7b2
        $c7b3 = [int]$c7b3
        if ($c7st1array.length -eq 2) {
            if (($c7a1.tostring().length) -eq 1) {
                $c7a1 = "0$c7a1"
            }
            if (($c7a2.tostring().length) -eq 1) {
                $c7a2 = "0$c7a2"
            }
            $clip7ts = "00`:$c7a1`:$c7a2`:00"
        }
        if ($c7st1array.length -eq 3) {
            if (($c7a1.tostring().length) -eq 1) {
                $c7a1 = "0$c7a1"
            }
            if (($c7a2.tostring().length) -eq 1) {
                $c7a2 = "0$c7a2"
            }
            if (($c7a3.tostring().length) -eq 1) {
                $c7a3 = "0$c7a3"
            }
            $clip7ts = "$c7a1`:$c7a2`:$c7a3`:00"
        }
        if ($c7st2array.length -eq 2) {
            if (($c7b1.tostring().length) -eq 1) {
                $c7b1 = "0$c7b1"
            }
            if (($c7b2.tostring().length) -eq 1) {
                $c7b2 = "0$c7b2"
            }
            $clip7te = "00`:$c7b1`:$c7b2`:00"
        }
        if ($c7st2array.length -eq 3) {
            if (($c7b1.tostring().length) -eq 1) {
                $c7b1 = "0$c7b1"
            }
            if (($c7b2.tostring().length) -eq 1) {
                $c7b2 = "0$c7b2"
            }
            if (($c7b3.tostring().length) -eq 1) {
                $c7b3 = "0$c7b3"
            }
            $clip7te = "$c7b1`:$c7b2`:$c7b3`:00"
        }
    }
    if ($clip8stamps) {
        $clip8stamps=$clip8stamps.trim("[]")
        $clip8st1,$clip8st2=$clip8stamps.split("-")
        $c8st1array=$clip8st1.split(":")
        $c8st2array=$clip8st2.split(":")
        $c8a1,$c8a2,$c8a3=$clip8st1.split(":")
        $c8b1,$c8b2,$c8b3=$clip8st2.split(":")
        $c8a1 = [int]$c8a1
        $c8a2 = [int]$c8a2
        $c8a3 = [int]$c8a3
        $c8b1 = [int]$c8b1
        $c8b2 = [int]$c8b2
        $c8b3 = [int]$c8b3
        if ($c8st1array.length -eq 2) {
            if (($c8a1.tostring().length) -eq 1) {
                $c8a1 = "0$c8a1"
            }
            if (($c8a2.tostring().length) -eq 1) {
                $c8a2 = "0$c8a2"
            }
            $clip8ts = "00`:$c8a1`:$c8a2`:00"
        }
        if ($c8st1array.length -eq 3) {
            if (($c8a1.tostring().length) -eq 1) {
                $c8a1 = "0$c8a1"
            }
            if (($c8a2.tostring().length) -eq 1) {
                $c8a2 = "0$c8a2"
            }
            if (($c8a3.tostring().length) -eq 1) {
                $c8a3 = "0$c8a3"
            }
            $clip8ts = "$c8a1`:$c8a2`:$c8a3`:00"
        }
        if ($c8st2array.length -eq 2) {
            if (($c8b1.tostring().length) -eq 1) {
                $c8b1 = "0$c8b1"
            }
            if (($c8b2.tostring().length) -eq 1) {
                $c8b2 = "0$c8b2"
            }
            $clip8te = "00`:$c8b1`:$c8b2`:00"
        }
        if ($c8st2array.length -eq 3) {
            if (($c8b1.tostring().length) -eq 1) {
                $c8b1 = "0$c8b1"
            }
            if (($c8b2.tostring().length) -eq 1) {
                $c8b2 = "0$c8b2"
            }
            if (($c8b3.tostring().length) -eq 1) {
                $c8b3 = "0$c8b3"
            }
            $clip8te = "$c8b1`:$c8b2`:$c8b3`:00"
        }
    }
    if ($clip9stamps) {
        $clip9stamps=$clip9stamps.trim("[]")
        $clip9st1,$clip9st2=$clip9stamps.split("-")
        $c9st1array=$clip9st1.split(":")
        $c9st2array=$clip9st2.split(":")
        $c9a1,$c9a2,$c9a3=$clip9st1.split(":")
        $c9b1,$c9b2,$c9b3=$clip9st2.split(":")
        $c9a1 = [int]$c9a1
        $c9a2 = [int]$c9a2
        $c9a3 = [int]$c9a3
        $c9b1 = [int]$c9b1
        $c9b2 = [int]$c9b2
        $c9b3 = [int]$c9b3
        if ($c9st1array.length -eq 2) {
            if (($c9a1.tostring().length) -eq 1) {
                $c9a1 = "0$c9a1"
            }
            if (($c9a2.tostring().length) -eq 1) {
                $c9a2 = "0$c9a2"
            }
            $clip9ts = "00`:$c9a1`:$c9a2`:00"
        }
        if ($c9st1array.length -eq 3) {
            if (($c9a1.tostring().length) -eq 1) {
                $c9a1 = "0$c9a1"
            }
            if (($c9a2.tostring().length) -eq 1) {
                $c9a2 = "0$c9a2"
            }
            if (($c9a3.tostring().length) -eq 1) {
                $c9a3 = "0$c9a3"
            }
            $clip9ts = "$c9a1`:$c9a2`:$c9a3`:00"
        }
        if ($c9st2array.length -eq 2) {
            if (($c9b1.tostring().length) -eq 1) {
                $c9b1 = "0$c9b1"
            }
            if (($c9b2.tostring().length) -eq 1) {
                $c9b2 = "0$c9b2"
            }
            $clip9te = "00`:$c9b1`:$c9b2`:00"
        }
        if ($c9st2array.length -eq 3) {
            if (($c9b1.tostring().length) -eq 1) {
                $c9b1 = "0$c9b1"
            }
            if (($c9b2.tostring().length) -eq 1) {
                $c9b2 = "0$c9b2"
            }
            if (($c9b3.tostring().length) -eq 1) {
                $c9b3 = "0$c9b3"
            }
            $clip9te = "$c9b1`:$c9b2`:$c9b3`:00"
        }
    }
    if ($clip10stamps) {
        $clip10stamps=$clip10stamps.trim("[]")
        $clip10st1,$clip10st2=$clip10stamps.split("-")
        $c10st1array=$clip10st1.split(":")
        $c10st2array=$clip10st2.split(":")
        $c10a1,$c10a2,$c10a3=$clip10st1.split(":")
        $c10b1,$c10b2,$c10b3=$clip10st2.split(":")
        $c10a1 = [int]$c10a1
        $c10a2 = [int]$c10a2
        $c10a3 = [int]$c10a3
        $c10b1 = [int]$c10b1
        $c10b2 = [int]$c10b2
        $c10b3 = [int]$c10b3
        if ($c10st1array.length -eq 2) {
            if (($c10a1.tostring().length) -eq 1) {
                $c10a1 = "0$c10a1"
            }
            if (($c10a2.tostring().length) -eq 1) {
                $c10a2 = "0$c10a2"
            }
            $clip10ts = "00`:$c10a1`:$c10a2`:00"
        }
        if ($c10st1array.length -eq 3) {
            if (($c10a1.tostring().length) -eq 1) {
                $c10a1 = "0$c10a1"
            }
            if (($c10a2.tostring().length) -eq 1) {
                $c10a2 = "0$c10a2"
            }
            if (($c10a3.tostring().length) -eq 1) {
                $c10a3 = "0$c10a3"
            }
            $clip10ts = "$c10a1`:$c10a2`:$c10a3`:00"
        }
        if ($c10st2array.length -eq 2) {
            if (($c10b1.tostring().length) -eq 1) {
                $c10b1 = "0$c10b1"
            }
            if (($c10b2.tostring().length) -eq 1) {
                $c10b2 = "0$c10b2"
            }
            $clip10te = "00`:$c10b1`:$c10b2`:00"
        }
        if ($c10st2array.length -eq 3) {
            if (($c10b1.tostring().length) -eq 1) {
                $c10b1 = "0$c10b1"
            }
            if (($c10b2.tostring().length) -eq 1) {
                $c10b2 = "0$c10b2"
            }
            if (($c10b3.tostring().length) -eq 1) {
                $c10b3 = "0$c10b3"
            }
            $clip10te = "$c10b1`:$c10b2`:$c10b3`:00"
        }
    }

                if ($miniclipnum -ge 1) {
                    $1ts1,$1ts2,$1ts3,$1ts4 = $clip1ts.split(":")
                    $1ts1 = [int]$1ts1
                    $1ts2 = [int]$1ts2
                    $1ts3 = [int]$1ts3
                    $1ts4 = [int]$1ts4
                    if ($hlrwStandards -eq "Y" -or $hlrwStandards -eq "y") {
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
                    $1te1,$1te2,$1te3,$1te4 = $clip1te.split(":")
                    $1te1 = [int]$1te1
                    $1te2 = [int]$1te2
                    $1te3 = [int]$1te3
                    $1te4 = [int]$1te4
                    if ($hlrwStandards -eq "Y" -or $hlrwStandards -eq "y") {
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
                }
                if ($miniclipnum -ge 2) {
                    $2ts1,$2ts2,$2ts3,$2ts4 = $clip2ts.split(":")
                    $2ts1 = [int]$2ts1
                    $2ts2 = [int]$2ts2
                    $2ts3 = [int]$2ts3
                    $2ts4 = [int]$2ts4
                    if ($hlrwStandards -eq "Y" -or $hlrwStandards -eq "y") {
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
                    $2te1,$2te2,$2te3,$2te4 = $clip2te.split(":")
                    $2te1 = [int]$2te1
                    $2te2 = [int]$2te2
                    $2te3 = [int]$2te3
                    $2te4 = [int]$2te4
                    if ($hlrwStandards -eq "Y" -or $hlrwStandards -eq "y") {
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
                    $3ts1,$3ts2,$3ts3,$3ts4 = $clip3ts.split(":")
                    $3ts1 = [int]$3ts1
                    $3ts2 = [int]$3ts2
                    $3ts3 = [int]$3ts3
                    $3ts4 = [int]$3ts4
                    if ($hlrwStandards -eq "Y" -or $hlrwStandards -eq "y") {
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
                    $3te1,$3te2,$3te3,$3te4 = $clip3te.split(":")
                    $3te1 = [int]$3te1
                    $3te2 = [int]$3te2
                    $3te3 = [int]$3te3
                    $3te4 = [int]$3te4
                    if ($hlrwStandards -eq "Y" -or $hlrwStandards -eq "y") {
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
                    $4ts1,$4ts2,$4ts3,$4ts4 = $clip4ts.split(":")
                    $4ts1 = [int]$4ts1
                    $4ts2 = [int]$4ts2
                    $4ts3 = [int]$4ts3
                    $4ts4 = [int]$4ts4
                    if ($hlrwStandards -eq "Y" -or $hlrwStandards -eq "y") {
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
                    $4te1,$4te2,$4te3,$4te4 = $clip4te.split(":")
                    $4te1 = [int]$4te1
                    $4te2 = [int]$4te2
                    $4te3 = [int]$4te3
                    $4te4 = [int]$4te4
                    if ($hlrwStandards -eq "Y" -or $hlrwStandards -eq "y") {
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
                    $5ts1,$5ts2,$5ts3,$5ts4 = $clip5ts.split(":")
                    $5ts1 = [int]$5ts1
                    $5ts2 = [int]$5ts2
                    $5ts3 = [int]$5ts3
                    $5ts4 = [int]$5ts4
                    if ($hlrwStandards -eq "Y" -or $hlrwStandards -eq "y") {
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
                    $5te1,$5te2,$5te3,$5te4 = $clip5te.split(":")
                    $5te1 = [int]$5te1
                    $5te2 = [int]$5te2
                    $5te3 = [int]$5te3
                    $5te4 = [int]$5te4
                    if ($hlrwStandards -eq "Y" -or $hlrwStandards -eq "y") {
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
                    $6ts1,$6ts2,$6ts3,$6ts4 = $clip6ts.split(":")
                    $6ts1 = [int]$6ts1
                    $6ts2 = [int]$6ts2
                    $6ts3 = [int]$6ts3
                    $6ts4 = [int]$6ts4
                    if ($hlrwStandards -eq "Y" -or $hlrwStandards -eq "y") {
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
                    $6te1,$6te2,$6te3,$6te4 = $clip6te.split(":")
                    $6te1 = [int]$6te1
                    $6te2 = [int]$6te2
                    $6te3 = [int]$6te3
                    $6te4 = [int]$6te4
                    if ($hlrwStandards -eq "Y" -or $hlrwStandards -eq "y") {
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
                    $7ts1,$7ts2,$7ts3,$7ts4 = $clip7ts.split(":")
                    $7ts1 = [int]$7ts1
                    $7ts2 = [int]$7ts2
                    $7ts3 = [int]$7ts3
                    $7ts4 = [int]$7ts4
                    if ($hlrwStandards -eq "Y" -or $hlrwStandards -eq "y") {
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
                    $7te1,$7te2,$7te3,$7te4 = $clip7te.split(":")
                    $7te1 = [int]$7te1
                    $7te2 = [int]$7te2
                    $7te3 = [int]$7te3
                    $7te4 = [int]$7te4
                    if ($hlrwStandards -eq "Y" -or $hlrwStandards -eq "y") {
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
                    $8ts1,$8ts2,$8ts3,$8ts4 = $clip8ts.split(":")
                    $8ts1 = [int]$8ts1
                    $8ts2 = [int]$8ts2
                    $8ts3 = [int]$8ts3
                    $8ts4 = [int]$8ts4
                    if ($hlrwStandards -eq "Y" -or $hlrwStandards -eq "y") {
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
                    $8te1,$8te2,$8te3,$8te4 = $clip8te.split(":")
                    $8te1 = [int]$8te1
                    $8te2 = [int]$8te2
                    $8te3 = [int]$8te3
                    $8te4 = [int]$8te4
                    if ($hlrwStandards -eq "Y" -or $hlrwStandards -eq "y") {
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
                    $9ts1,$9ts2,$9ts3,$9ts4 = $clip9ts.split(":")
                    $9ts1 = [int]$9ts1
                    $9ts2 = [int]$9ts2
                    $9ts3 = [int]$9ts3
                    $9ts4 = [int]$9ts4
                    if ($hlrwStandards -eq "Y" -or $hlrwStandards -eq "y") {
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
                    $9te1,$9te2,$9te3,$9te4 = $clip9te.split(":")
                    $9te1 = [int]$9te1
                    $9te2 = [int]$9te2
                    $9te3 = [int]$9te3
                    $9te4 = [int]$9te4
                    if ($hlrwStandards -eq "Y" -or $hlrwStandards -eq "y") {
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
                    $10ts1,$10ts2,$10ts3,$10ts4 = $clip10ts.split(":")
                    $10ts1 = [int]$10ts1
                    $10ts2 = [int]$10ts2
                    $10ts3 = [int]$10ts3
                    $10ts4 = [int]$10ts4
                    if ($hlrwStandards -eq "Y" -or $hlrwStandards -eq "y") {
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
                    $10te1,$10te2,$10te3,$10te4 = $clip10te.split(":")
                    $10te1 = [int]$10te1
                    $10te2 = [int]$10te2
                    $10te3 = [int]$10te3
                    $10te4 = [int]$10te4
                    if ($hlrwStandards -eq "Y" -or $hlrwStandards -eq "y") {
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
                        $glinks = .\bin\youtube-dl.exe -g --youtube-skip-dash-manifest "$inlink"
                        while (!$glinks) {$glinks = .\bin\youtube-dl.exe -g --youtube-skip-dash-manifest "$inlink"}
                        $glink1,$glink2 = $glinks.split(" ")
                        if (!$glink2) {$glink2 = $glink1}
                        if ($miniclipnum -eq 1) {
                            .\bin\ffmpeg.exe -y -hide_banner  -ss $clip1Sps -i ($glink1) -t $clip1Rt -ss $clip1Sps -i ($glink2) -t $clip1Rt "$dlDir\$fulltitle.mkv"
                        }
                        if ($miniclipnum -ge 2) {
                            .\bin\ffmpeg.exe -y -hide_banner -ss $clip1Sps -i ($glink1) -t $clip1Rt -ss $clip1Sps -i ($glink2) -t $clip1Rt "$tempdir\clip1.mkv"
                            .\bin\ffmpeg.exe -y -hide_banner -ss $clip2Sps -i ($glink1) -t $clip2Rt -ss $clip2Sps -i ($glink2) -t $clip2Rt "$tempdir\clip2.mkv"
                        }
                        if ($miniclipnum -ge 3) {
                            .\bin\ffmpeg.exe -y -hide_banner  -ss $clip3Sps -i ($glink1) -t $clip3Rt -ss $clip3Sps -i ($glink2) -t $clip3Rt "$tempdir\clip3.mkv"
                        }
                        if ($miniclipnum -ge 4) {
                            .\bin\ffmpeg.exe -y -hide_banner  -ss $clip4Sps -i ($glink1) -t $clip4Rt -ss $clip4Sps -i ($glink2) -t $clip4Rt "$tempdir\clip4.mkv"
                        }
                        if ($miniclipnum -ge 5) {
                            .\bin\ffmpeg.exe -y -hide_banner  -ss $clip5Sps -i ($glink1) -t $clip5Rt -ss $clip5Sps -i ($glink2) -t $clip5Rt "$tempdir\clip5.mkv"
                        }
                        if ($miniclipnum -ge 6) {
                            .\bin\ffmpeg.exe -y -hide_banner  -ss $clip6Sps -i ($glink1) -t $clip6Rt -ss $clip6Sps -i ($glink2) -t $clip6Rt "$tempdir\clip6.mkv"
                        }
                        if ($miniclipnum -ge 7) {
                            .\bin\ffmpeg.exe -y -hide_banner  -ss $clip7Sps -i ($glink1) -t $clip7Rt -ss $clip7Sps -i ($glink2) -t $clip7Rt "$tempdir\clip7.mkv"
                        }
                        if ($miniclipnum -ge 8) {
                            .\bin\ffmpeg.exe -y -hide_banner  -ss $clip8Sps -i ($glink1) -t $clip8Rt -ss $clip8Sps -i ($glink2) -t $clip8Rt "$tempdir\clip8.mkv"
                        }
                        if ($miniclipnum -ge 9) {
                            .\bin\ffmpeg.exe -y -hide_banner  -ss $clip9Sps -i ($glink1) -t $clip9Rt -ss $clip9Sps -i ($glink2) -t $clip9Rt "$tempdir\clip9.mkv"
                        }
                        if ($miniclipnum -eq 10) {
                            .\bin\ffmpeg.exe -y -hide_banner  -ss $clip10Sps -i ($glink1) -t $clip10Rt -ss $clip10Sps -i ($glink2) -t $clip10Rt "$tempdir\clip10.mkv"
                        }
                    }
                    if ($videotype -eq "B" -or $videotype -eq "b") {
                        $glink = .\bin\youtube-dl.exe -g "$inlink"
                        while (!$glink) {$glink = .\bin\youtube-dl.exe -g "$inlink"}
                        if ($miniclipnum -eq 1) {
                            .\bin\ffmpeg.exe -y -hide_banner  -ss $clip1Sps -i ($glink) -t $clip1Rt "$dlDir\$fulltitle.mkv"
                        }
                        if ($miniclipnum -ge 2) {
                            .\bin\ffmpeg.exe -y -hide_banner  -ss $clip1Sps -i ($glink) -t $clip1Rt "$tempdir\clip1.mkv"
                            .\bin\ffmpeg.exe -y -hide_banner  -ss $clip2Sps -i ($glink) -t $clip2Rt "$tempdir\clip2.mkv"
                        }
                        if ($miniclipnum -ge 3) {
                            .\bin\ffmpeg.exe -y -hide_banner  -ss $clip3Sps -i ($glink) -t $clip3Rt "$tempdir\clip3.mkv"
                        }
                        if ($miniclipnum -ge 4) {
                            .\bin\ffmpeg.exe -y -hide_banner  -ss $clip4Sps -i ($glink) -t $clip4Rt "$tempdir\clip4.mkv"
                        }
                        if ($miniclipnum -ge 5) {
                            .\bin\ffmpeg.exe -y -hide_banner  -ss $clip5Sps -i ($glink) -t $clip5Rt "$tempdir\clip5.mkv"
                        }
                        if ($miniclipnum -ge 6) {
                            .\bin\ffmpeg.exe -y -hide_banner  -ss $clip6Sps -i ($glink) -t $clip6Rt "$tempdir\clip6.mkv"
                        }
                        if ($miniclipnum -ge 7) {
                            .\bin\ffmpeg.exe -y -hide_banner  -ss $clip7Sps -i ($glink) -t $clip7Rt "$tempdir\clip7.mkv"
                        }
                        if ($miniclipnum -ge 8) {
                            .\bin\ffmpeg.exe -y -hide_banner  -ss $clip8Sps -i ($glink) -t $clip8Rt "$tempdir\clip8.mkv"
                        }
                        if ($miniclipnum -ge 9) {
                            .\bin\ffmpeg.exe -y -hide_banner  -ss $clip9Sps -i ($glink) -t $clip9Rt "$tempdir\clip9.mkv"
                        }
                        if ($miniclipnum -eq 10) {
                            .\bin\ffmpeg.exe -y -hide_banner  -ss $clip10Sps -i ($glink) -t $clip10Rt "$tempdir\clip10.mkv"
                        }
                    }
                    if ($videotype -eq "C" -or $videotype -eq "c") {
                        if ($miniclipnum -eq 1) {
                            .\bin\ffmpeg.exe -y -hide_banner  -ss $clip1Sps -i ($tempfile) -t $clip1Rt "$dlDir\$fulltitle.mkv"
                        }
                        if ($miniclipnum -ge 2) {
                            .\bin\ffmpeg.exe -y -hide_banner  -ss $clip1Sps -i ($tempfile) -t $clip1Rt "$tempdir\clip1.mkv"
                            .\bin\ffmpeg.exe -y -hide_banner  -ss $clip2Sps -i ($tempfile) -t $clip2Rt "$tempdir\clip2.mkv"
                        }
                        if ($miniclipnum -ge 3) {
                            .\bin\ffmpeg.exe -y -hide_banner  -ss $clip3Sps -i ($tempfile) -t $clip3Rt "$tempdir\clip3.mkv"
                        }
                        if ($miniclipnum -ge 4) {
                            .\bin\ffmpeg.exe -y -hide_banner  -ss $clip4Sps -i ($tempfile) -t $clip4Rt "$tempdir\clip4.mkv"
                        }
                        if ($miniclipnum -ge 5) {
                            .\bin\ffmpeg.exe -y -hide_banner  -ss $clip5Sps -i ($tempfile) -t $clip5Rt "$tempdir\clip5.mkv"
                        }
                        if ($miniclipnum -ge 6) {
                            .\bin\ffmpeg.exe -y -hide_banner  -ss $clip6Sps -i ($tempfile) -t $clip6Rt "$tempdir\clip6.mkv"
                        }
                        if ($miniclipnum -ge 7) {
                            .\bin\ffmpeg.exe -y -hide_banner  -ss $clip7Sps -i ($tempfile) -t $clip7Rt "$tempdir\clip7.mkv"
                        }
                        if ($miniclipnum -ge 8) {
                            .\bin\ffmpeg.exe -y -hide_banner  -ss $clip8Sps -i ($tempfile) -t $clip8Rt "$tempdir\clip8.mkv"
                        }
                        if ($miniclipnum -ge 9) {
                            .\bin\ffmpeg.exe -y -hide_banner  -ss $clip9Sps -i ($tempfile) -t $clip9Rt "$tempdir\clip9.mkv"
                        }
                        if ($miniclipnum -eq 10) {
                            .\bin\ffmpeg.exe -y -hide_banner  -ss $clip10Sps -i ($tempfile) -t $clip10Rt "$tempdir\clip10.mkv"
                        }
                    }
                    
                    if ($needsstitching -eq "Y" -or $needsstitching -eq "y") {
                        if ($miniclipnum -ge 2) {
                            &$HoloStitcher
                        }
                        else {return}
                    }
                    else {return}
            
    
}
write-host $fulltitle
write-host $videotype
write-host $hlrwStandards
write-host $inlink
write-host $miniclip
write-host $tempfile
write-host $dlDir
write-host $timestampsIn
write-host $needsstitching
write-host $tempdir
&$HololiveClipper