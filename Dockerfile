FROM  mcr.microsoft.com/dotnet/sdk:9.0
LABEL Name="nopCommerce"
COPY ~/nopcommerce /nopcommerce 
ENV ASPNETCORE_URLS="http://0.0.0.0:5000"
EXPOSE 5000
WORKDIR /nopcommerce
CMD [ "dotnet" "Nop.Web.dll" ]



