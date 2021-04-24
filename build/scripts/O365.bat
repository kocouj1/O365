@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  O365 startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and O365_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto execute

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\O365.jar;%APP_HOME%\lib\microsoft-graph-3.2.0.jar;%APP_HOME%\lib\microsoft-graph-core-2.0.0.jar;%APP_HOME%\lib\azure-identity-1.2.5.jar;%APP_HOME%\lib\azure-core-http-netty-1.9.1.jar;%APP_HOME%\lib\azure-core-1.15.0.jar;%APP_HOME%\lib\msal4j-persistence-extension-1.1.0.jar;%APP_HOME%\lib\msal4j-1.9.1.jar;%APP_HOME%\lib\oauth2-oidc-sdk-8.36.jar;%APP_HOME%\lib\nimbus-jose-jwt-8.20.1.jar;%APP_HOME%\lib\json-smart-2.3.jar;%APP_HOME%\lib\jna-platform-5.6.0.jar;%APP_HOME%\lib\KeePassJava2-2.1.4.jar;%APP_HOME%\lib\KeePassJava2-kdb-2.1.4.jar;%APP_HOME%\lib\KeePassJava2-dom-2.1.4.jar;%APP_HOME%\lib\KeePassJava2-jaxb-2.1.4.jar;%APP_HOME%\lib\KeePassJava2-simple-2.1.4.jar;%APP_HOME%\lib\KeePassJava2-kdbx-2.1.4.jar;%APP_HOME%\lib\database-2.1.4.jar;%APP_HOME%\lib\guava-30.1.1-jre.jar;%APP_HOME%\lib\okhttp-4.9.1.jar;%APP_HOME%\lib\gson-2.8.6.jar;%APP_HOME%\lib\jackson-dataformat-xml-2.12.2.jar;%APP_HOME%\lib\jackson-module-jaxb-annotations-2.12.2.jar;%APP_HOME%\lib\jackson-core-2.12.2.jar;%APP_HOME%\lib\jackson-datatype-jsr310-2.12.2.jar;%APP_HOME%\lib\jackson-databind-2.12.2.jar;%APP_HOME%\lib\jackson-annotations-2.12.2.jar;%APP_HOME%\lib\slf4j-api-1.7.30.jar;%APP_HOME%\lib\reactor-netty-1.0.4.jar;%APP_HOME%\lib\reactor-netty-http-brave-1.0.4.jar;%APP_HOME%\lib\reactor-netty-http-1.0.4.jar;%APP_HOME%\lib\reactor-netty-core-1.0.4.jar;%APP_HOME%\lib\reactor-core-3.4.3.jar;%APP_HOME%\lib\netty-tcnative-boringssl-static-2.0.36.Final.jar;%APP_HOME%\lib\netty-handler-proxy-4.1.60.Final.jar;%APP_HOME%\lib\netty-codec-http2-4.1.60.Final.jar;%APP_HOME%\lib\netty-codec-http-4.1.60.Final.jar;%APP_HOME%\lib\netty-resolver-dns-native-macos-4.1.59.Final-osx-x86_64.jar;%APP_HOME%\lib\netty-resolver-dns-4.1.59.Final.jar;%APP_HOME%\lib\netty-handler-4.1.60.Final.jar;%APP_HOME%\lib\netty-transport-native-epoll-4.1.60.Final-linux-x86_64.jar;%APP_HOME%\lib\netty-transport-native-kqueue-4.1.60.Final-osx-x86_64.jar;%APP_HOME%\lib\netty-transport-native-unix-common-4.1.60.Final.jar;%APP_HOME%\lib\netty-codec-socks-4.1.60.Final.jar;%APP_HOME%\lib\netty-codec-dns-4.1.59.Final.jar;%APP_HOME%\lib\netty-codec-4.1.60.Final.jar;%APP_HOME%\lib\netty-transport-4.1.60.Final.jar;%APP_HOME%\lib\netty-buffer-4.1.60.Final.jar;%APP_HOME%\lib\accessors-smart-1.2.jar;%APP_HOME%\lib\jna-5.6.0.jar;%APP_HOME%\lib\jcip-annotations-1.0-1.jar;%APP_HOME%\lib\content-type-2.1.jar;%APP_HOME%\lib\lang-tag-1.4.4.jar;%APP_HOME%\lib\failureaccess-1.0.1.jar;%APP_HOME%\lib\listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar;%APP_HOME%\lib\jsr305-3.0.2.jar;%APP_HOME%\lib\checker-qual-3.8.0.jar;%APP_HOME%\lib\error_prone_annotations-2.5.1.jar;%APP_HOME%\lib\j2objc-annotations-1.3.jar;%APP_HOME%\lib\okio-jvm-2.8.0.jar;%APP_HOME%\lib\kotlin-stdlib-1.4.10.jar;%APP_HOME%\lib\woodstox-core-6.2.4.jar;%APP_HOME%\lib\aalto-xml-1.0.0.jar;%APP_HOME%\lib\stax2-api-4.2.1.jar;%APP_HOME%\lib\reactive-streams-1.0.3.jar;%APP_HOME%\lib\netty-resolver-4.1.60.Final.jar;%APP_HOME%\lib\netty-common-4.1.60.Final.jar;%APP_HOME%\lib\asm-5.0.4.jar;%APP_HOME%\lib\annotations-15.0.jar;%APP_HOME%\lib\simple-xml-2.7.1.jar;%APP_HOME%\lib\httpcore-4.4.5.jar;%APP_HOME%\lib\kotlin-stdlib-common-1.4.10.jar;%APP_HOME%\lib\jakarta.xml.bind-api-2.3.2.jar;%APP_HOME%\lib\jakarta.activation-api-1.2.1.jar;%APP_HOME%\lib\brave-instrumentation-http-5.13.3.jar;%APP_HOME%\lib\core-1.54.0.0.jar;%APP_HOME%\lib\commons-codec-1.10.jar;%APP_HOME%\lib\stax-1.2.0.jar;%APP_HOME%\lib\stax-api-1.0.1.jar;%APP_HOME%\lib\xpp3-1.1.3.3.jar;%APP_HOME%\lib\brave-5.13.3.jar;%APP_HOME%\lib\zipkin-reporter-brave-2.16.3.jar;%APP_HOME%\lib\zipkin-reporter-2.16.3.jar;%APP_HOME%\lib\zipkin-2.23.2.jar


@rem Execute O365
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %O365_OPTS%  -classpath "%CLASSPATH%" O365.App %*

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable O365_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%O365_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
