FROM mcr.microsoft.com/dotnet/sdk:9.0
LABEL Name="nopCommerce"

# Arguments for user and group
ARG User=nop
ARG Group=nop
ARG homeDir=/nopcommerce

# Set the working directory
WORKDIR ${homeDir}

RUN groupadd -r ${Group} && useradd -r -g ${Group} ${User}

# Copy files and assign ownership
COPY --chown=${User}:${Group} . ${homeDir}

# Cpy the Nop.Web project files
COPY /SampleWebPage/Docker/nopcommerce /nopcommerce 

# Set environment variable for Kestrel server binding
ENV ASPNETCORE_URLS="http://0.0.0.0:5000"

USER ${User}

# Expose port
EXPOSE 5000

# Start the nopCommerce application
CMD [ "dotnet", "Nop.Web.dll" ]





