
Param($Arg1)

Write-Host "convert: ./${Arg1}/${Arg1}.cpp ->  ./${Arg1}/${Arg1}-tmpSJIS.cpp " 
Write-Host ""
Get-Content -Encoding UTF8 "./${Arg1}/${Arg1}.cpp" | Out-File -Encoding oem "./${Arg1}/${Arg1}-tmpSJIS.cpp"
