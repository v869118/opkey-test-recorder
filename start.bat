@echo off
if exist %OPKEY_HOME% goto checkuserdata
set OPKEY_HOME=..

:checkuserdata
if exist %OPKEY_USERDATA_DIR% goto setuserdatadir 
set OPKEY_USERDATA_DIR_TMP=%OPKEY_HOME%\userdata
goto startopkey

:setuserdatadir
set OPKEY_USERDATA_DIR_TMP=%OPKEY_USERDATA_DIR%

:startopkey
set OPKEY_CLASS_PATH=%OPKEY_HOME%\extlib\nativerecorder\JavaRecorder\agent_lib\tools.jar;%OPKEY_HOME%\lib\opkey.jar;%OPKEY_HOME%\extlib\rhino\js.jar;%OPKEY_HOME%\extlib\apc\commons-codec-1.3.jar;%OPKEY_HOME%\extlib\jetty\9.2.16\jetty-server-9.2.16.v20160414.jar;%OPKEY_HOME%\extlib\jetty\9.2.16\jetty-util-9.2.16.v20160414.jar;%OPKEY_HOME%\extlib\jetty\9.2.16\servlet-api-3.1.jar;%OPKEY_HOME%\extlib\jetty\9.2.16\jetty-http-9.2.16.v20160414.jar;%OPKEY_HOME%\extlib\oracle\javassist.jar;%OPKEY_HOME%\extlib\oracle\org.json-0.jar;%OPKEY_HOME%\extlib\jetty\9.2.16\jetty-io-9.2.16.v20160414.jar

echo --------
echo OPKEY_HOME: %OPKEY_HOME%
echo OPKEY_USERDATA_DIR: %OPKEY_USERDATA_DIR_TMP%
echo OPKEY_EXT_CLASS_PATH: %OPKEY_EXT_CLASS_PATH%
echo --------
start %OPKEY_HOME%\bin\installcert.exe
java -classpath %OPKEY_EXT_CLASS_PATH%;%OPKEY_CLASS_PATH% net.sf.opkey.PacDownloader "%OPKEY_HOME%"
java -classpath %OPKEY_EXT_CLASS_PATH%;%OPKEY_CLASS_PATH% net.sf.opkey.ProxyFinder "%OPKEY_HOME%"
java -classpath %OPKEY_EXT_CLASS_PATH%;%OPKEY_CLASS_PATH% net.sf.opkey.ui.Dashboard "%OPKEY_HOME%" "%OPKEY_USERDATA_DIR_TMP%" %1
