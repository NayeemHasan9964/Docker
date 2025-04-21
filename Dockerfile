FROM mcr.microsoft.com/dotnet/sdk:9.0
LABEL Name="nopCommerce"

# Arguments for user and group
ARG User=nop
ARG Group=nop
ARG homeDir=/nopcommerce

# Set the working directory
WORKDIR ${homeDir}

# Copy files and assign ownership
COPY --chown=${User}:${Group} . ${homeDir}

# Cpy the Nop.Web project files
COPY . /nopcommerce 
# Set environment variable for Kestrel server binding
ENV ASPNETCORE_URLS="http://0.0.0.0:5000"

# Expose port
EXPOSE 5000

# Start the nopCommerce application
CMD [ "dotnet", "Nop.Web.dll" ]





