@echo off
rem docker script

shellwrap docker stop $(docker ps -qa)
shellwrap docker rm $(docker ps -qa)

