umask 0022
export QT_QPA_PLATFORMTHEME="qt5ct"
export PYTHONDONTWRITEBYTECODE=1

# if Dotnet.Core is installed (in /opt), set up some environment variables
if [ -d /opt/dotnet ];
then
    export DOTNET_ROOT=/opt/dotnet;
    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export MSBuildSDKsPath="/opt/dotnet/sdk/3.1.100-preview3-014645/";
fi
