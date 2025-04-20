FROM ubuntu:22.04

# To Add .NET repsoitary
RUN add-apt-repository ppa:dotnet/backports

# To Update and download .NETcore runtime
RUN apt-get update && apt-get install -y aspnetcore-runtime-9.0 nginx



