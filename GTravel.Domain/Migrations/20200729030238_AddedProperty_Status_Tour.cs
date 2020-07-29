using Microsoft.EntityFrameworkCore.Migrations;

namespace GTravel.Domain.Migrations
{
    public partial class AddedProperty_Status_Tour : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "StatusId",
                table: "Tours",
                nullable: false,
                defaultValue: 0);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "StatusId",
                table: "Tours");
        }
    }
}
