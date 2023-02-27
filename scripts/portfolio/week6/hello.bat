:: ###################################################################

:: Author: Christopher Turner
:: Creation Date: 01/2023
::Last Modified Data: 02/23
:: Script Description: Windows PS script that asks for name and greets you. 

:: ###################################################################

@echo off
set /p name="What is your name? "
echo Hello %name%

:: Below is a working script that achieves the same objective.
$Name = Read-Host "What is your name?"
Write-Host "Hello $Name!"