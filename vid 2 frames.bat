@echo off
setlocal enabledelayedexpansion

:: Created by Andro.Meta mostly just to have something that works that I can go to from anywhere. 
:: This is a very simple .bat file and free for anyone to use and to incorporate into their work. 
:: Must have ffmpeg installed to PATH


:: Path to FFmpeg executable. Adjust if necessary.
set FFMPEG_PATH=ffmpeg

:: Get the video file path from the user
echo Please drag and drop the video file onto this window and press Enter:
set /p VIDEO_PATH=

:: Remove quotes from the video path
set VIDEO_PATH=!VIDEO_PATH:"=!

:: Extract the directory and filename from the video path
for %%i in ("!VIDEO_PATH!") do (
    set VIDEO_DIR=%%~dpi
    set VIDEO_NAME=%%~ni
)

:: Ask user for desired FPS
echo Please enter the desired FPS for the extracted frames:
set /p NEW_FPS=

:: Create a new folder for the extracted frames with the FPS in the name
set OUTPUT_DIR=!VIDEO_DIR!!VIDEO_NAME!_!NEW_FPS!FPS_Extracted_Frames
mkdir "!OUTPUT_DIR!"

:: Extract frames from the video
%FFMPEG_PATH% -i "!VIDEO_PATH!" -vf "fps=!NEW_FPS!" "!OUTPUT_DIR!\frame_%%04d.png"

echo Frames have been extracted to PNG images at !NEW_FPS! FPS in the folder: !OUTPUT_DIR!
pause
