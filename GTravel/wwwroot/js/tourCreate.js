function ShowHideMeals() {
    var x = document.getElementById("mealData");
    if (x.style.display == "none") {
        x.style.display = "";
        document.getElementById("showMealsButton").style.display = "none";
        document.getElementById("hideMealsButton").style.display = "";

    }
    else {
        document.getElementById("showMealsButton").style.display = "";
        document.getElementById("hideMealsButton").style.display = "none";
        x.style.display = "none";
    }
    return true;

};

function validateInput() {
    if (document.getElementById("uploadBox").value == "") {
        swal("Error", "Please Select an Image", "error")
        return false;
    }
    return true;

};  