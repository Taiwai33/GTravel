using Microsoft.EntityFrameworkCore.Migrations;

namespace GTravel.Domain.Migrations
{
    public partial class AddMealsTable : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Meal_Tours_TourId",
                table: "Meal");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Meal",
                table: "Meal");

            migrationBuilder.RenameTable(
                name: "Meal",
                newName: "Meals");

            migrationBuilder.RenameIndex(
                name: "IX_Meal_TourId",
                table: "Meals",
                newName: "IX_Meals_TourId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Meals",
                table: "Meals",
                column: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Meals_Tours_TourId",
                table: "Meals",
                column: "TourId",
                principalTable: "Tours",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Meals_Tours_TourId",
                table: "Meals");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Meals",
                table: "Meals");

            migrationBuilder.RenameTable(
                name: "Meals",
                newName: "Meal");

            migrationBuilder.RenameIndex(
                name: "IX_Meals_TourId",
                table: "Meal",
                newName: "IX_Meal_TourId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Meal",
                table: "Meal",
                column: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Meal_Tours_TourId",
                table: "Meal",
                column: "TourId",
                principalTable: "Tours",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
