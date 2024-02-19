

function Build-DockerImage 
{
[CmdletBinding()]
		Param( 
				[Parameter(Position = 0, Mandatory = $true,HelpMessage='Docker file path')][String]$Dockerfile, 
				[Parameter(Position = 1, Mandatory = $true,HelpMessage='Docker Image Tag')][String]$Tag, 
                [String]$ComputerName= "default" )
 
		Process { 
   docker context use $ComputerName;
   docker build -t $Tag -f $Dockerfile .
}
}

#Build-DockerImage  -Dockerfile ~/Projects/JobTasks/KLA/Dockerfile  -Tag fibonacci_i  
#docker build -t fibonacci_image $Path_to_Dockerfile

Export-ModuleMember -Function Build-DockerImage



function Copy-Prerequisites
{
[CmdletBinding()]
		Param( 
				[Parameter(Position = 0, Mandatory = $true,HelpMessage='Docker file path')][String]$ComputerName, 
				[Parameter(Position = 1, Mandatory = $true,HelpMessage='Path of local source')][String]$Path, 
				[Parameter(Position = 2, Mandatory = $true,HelpMessage='Path of remote destination')][String]$Destination )
 
		Process { 
   scp $Path ${ComputerName}:${Destination} 
}
}

#Copy-Prerequisites  -ComputerName   -Path   -Destination
Export-ModuleMember -Function Copy-Prerequisites

function Run-DockerContainer
{
[CmdletBinding()]
		Param( 
				[Parameter(Position = 0, Mandatory = $true,HelpMessage='Docker Image Name')][String]$ImageName, 
				[String]$DockerParams, 
                [String]$DockerContainerName,
                [String]$ComputerName= "default" )
 
		
   #docker context use $ComputerName;
   #docker run --name $DockerContainerName $DockerParams $ImageName  pwsh ./fibonacciScript1.ps1
  # docker exec -it new-container1 pwsh ./fibonacciScript.ps1
  # docker run -it  $ImageName  
   
  
Process { 
    docker context use $ComputerName;
    #docker run --name $DockerContainerName $DockerParams $ImageName  pwsh ./fibonacciScript.ps1
   # docker exec -it new-container1 pwsh ./fibonacciScript.ps1
   # docker run --name $DockerContainerName $DockerParams $ImageName  pwsh ./fibonacciScript.ps1
    docker run  -$DockerParams $ImageName
 
 }
       End {
          $DockerContainerName=$(docker ps  -l --filter ancestor=$ImageName --format "{{.Names}}")
         Write-Host ("Docker container name is : $DockerContainerName" )
       }
 }



   


        #$DockerContainerName=$(docker ps  -l --filter ancestor=$ImageName --format "{{.Names}}")
       # Write-Host ("Docker container name is : $DockerContainerName" )
      


#Run-DockerContainer -ImageName fib_image    -DockerParams "-it" 
#docker build -t fibonacci_image $Path_to_Dockerfile
Export-ModuleMember -Function Run-DockerContainer
