
#!/bin/bash
parentFolderName=$(basename "$PWD")
mkdir $parentFolderName
dotnet new sln -n $parentFolderName
dotnet new mvc -n $parentFolderName
dotnet sln add $parentFolderName/$parentFolderName.csproj
dotnet add $parentFolderName/$parentFolderName.csproj package Microsoft.EntityFrameworkCore.Tools
dotnet add $parentFolderName/$parentFolderName.csproj package Microsoft.EntityFrameworkCore.SqlServer
cd $parentFolderName/Models

echo "namespace $parentFolderName.Models
{
    public class Product
    {
        public int ProductId { get; set; }
    }
}" > Product.cs

echo "namespace $parentFolderName.Models
{
    public class Category
    {
        public int CategoryId { get; set; }
        public string CategoryName { get; set; }
        public string Description { get; set; }
    }
} " > Category.cs
cd ../..
dotnet run --project $parentFolderName/$parentFolderName.csproj





























