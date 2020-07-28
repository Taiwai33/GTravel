using Microsoft.EntityFrameworkCore.Migrations;

namespace GTravel.Domain.Migrations
{
    public partial class AddedNavigationProperty_TourCity : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_TourCities_Tours_TourId",
                table: "TourCities");

            migrationBuilder.AlterColumn<int>(
                name: "TourId",
                table: "TourCities",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_TourCities_Tours_TourId",
                table: "TourCities",
                column: "TourId",
                principalTable: "Tours",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_TourCities_Tours_TourId",
                table: "TourCities");

            migrationBuilder.AlterColumn<int>(
                name: "TourId",
                table: "TourCities",
                type: "int",
                nullable: true,
                oldClrType: typeof(int));

            migrationBuilder.AddForeignKey(
                name: "FK_TourCities_Tours_TourId",
                table: "TourCities",
                column: "TourId",
                principalTable: "Tours",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
