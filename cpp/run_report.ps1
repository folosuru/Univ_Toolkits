Get-ChildItem -Path ./* -Attributes Directory | where Name -Match "$args\-" | foreach {
	$file = $_.Name
	cd $file
	echo $file
	nmake report
	cd ../
}