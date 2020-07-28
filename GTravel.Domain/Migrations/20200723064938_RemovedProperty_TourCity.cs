using Microsoft.EntityFrameworkCore.Migrations;

namespace GTravel.Domain.Migrations
{
    public partial class RemovedProperty_TourCity : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "PackageId",
                table: "TourCities");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "PackageId",
                table: "TourCities",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }
    }
}
