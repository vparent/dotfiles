umask 0022
export QT_QPA_PLATFORMTHEME="qt5ct"
export PYTHONDONTWRITEBYTECODE=1

export DISTCC_HOSTS="localhost/9 192.168.1.37/5"
export PATH="/usr/lib/distcc/bin:$PATH"

# if Dotnet.Core is installed (in /opt), set up some environment variables
if [ -d /opt/dotnet ];
then
    export DOTNET_ROOT=/opt/dotnet;
    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export MSBuildSDKsPath="/opt/dotnet/sdk/3.0.100-rc1-014190/Sdks/";
fi
