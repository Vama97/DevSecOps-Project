### Fibonacci Script
This script will on execution ask for a number to print the fibonacci number at that position and if input is not given, it will keep printing fibonacci series

## The Module file contains functions to build docker image, copy any requirements and run the docker container

### Import the module using the below command in powershell
`Import-Module -Name /home/vama/Projects/JobTasks/KLA/ModuleTask/DockerHelperModule.psm1`

### See the module added 
`Get-Module`

### Using cmdlet build image
`Build-DockerImage -Dockerfile ./Dockerfile  -Tag fibonacci_img`
