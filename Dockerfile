FROM mcr.microsoft.com/powershell 
WORKDIR /Scripts/
COPY fibonacciScript.ps1 /App/
WORKDIR /App
ENTRYPOINT  pwsh
CMD [./fibonacciSript.ps1] 
