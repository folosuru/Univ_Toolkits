
(Get-Content bb.vbs -Encoding oem).
	Replace('TESTCASE_PATH & KADAI_NAME & ".cpp"', 'TESTCASE_PATH & KADAI_NAME & "-tmpSJIS.cpp"').
	Replace('getFileDate(SRC_FILE) > getFileDate(EXE_FILE)', 'getFileDate(TESTCASE_PATH & KADAI_NAME & ".cpp") > getFileDate(EXE_FILE)')| 
 Set-Content utf8-mod-bb.vbs -Encoding oem

Copy-Item -Path "Makefile.in" -Destination "Makefile.in.old"
(Get-Content Makefile.in -Encoding oem).
	Replace('CFLAGS=/EHsc /std:c++17', 'CFLAGS=/EHsc /std:c++17 /source-charset:utf-8 /execution-charset:shift-jis').
	Replace('bb $(TARGET)', "bb `$(TARGET)`n`tpowershell ./utf8-mod-convert.ps1 `$(TARGET)`n`tutf8-mod-bb `$(TARGET)`n")|
 Set-Content Makefile.in -Encoding oem

