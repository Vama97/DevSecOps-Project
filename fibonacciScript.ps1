
function Get-Fibonacci ($n) {
    $current =1 ; 
    $previous = 0; 
    for ($i=0; $i -lt $n; $i++) {
        Start-Sleep -Seconds 0.5
        $current; 
        $current,$previous = ($current+$previous),$current
       # echo "$current"
    }
}
#$fib = Read-Host -Prompt ‘Give me a value in integer’

if ([string]::IsNullOrWhiteSpace($fib))

{

	$fibValue = 15

}
else{
	$fibValue= [int]$fib 
}
Get-Fibonacci($fibValue)
