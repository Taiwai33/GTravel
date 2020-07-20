var dataTable;

$(document).ready(function () {
    loadDataTable();


});

function loadDataTable() {

    dataTable = $('#tblData').DataTable({
        "ajax": {
            "url": "/admin/tour/GetAll",
            "type": "GET",
            "datatype": "json"
        },
        "columns": [
            {
                "data": "name",
                "render": function (data) {
                    return`<div><a asp-action="Details" asp-controller="Admin">${data}</a></div>`

                },
                "width": "20%"
            },
            { "data": "Departure Location", "width": "5%" },
            { "data": "Number of stops", "width": "5%" },


            {
                "data": "id",
                "render": function (data) {
                    return `<div class="text-center">  
                            <a href="/Admin/package/Details/${data}" class='btn btn-success text-white' style='cursor:pointer; width:85px;'>
                            Details</a>
                                &nbsp;
                            <a onClick=Publish("/Admin/package/Publish/${data}") class='btn btn-success text-white' style='cursor:pointer; width:85px;'>
                            Publish
                                </a>
                                &nbsp;
                            <a href="/Admin/packageCity/Index/${data}" class='btn btn-success text-white' style='cursor:pointer; width:85px;'>
                            <i class="far fa-plus-square"></i> Cities
                                </a> 
                                &nbsp;
                                <a href="/Admin/package/Update/${data}" class='btn btn-success text-white' style='cursor:pointer; width:50px;'>
                            <i class='far fa-edit'></i>
                                </a>
                                &nbsp;
                                <a onclick=Delete("/Admin/package/Delete/${data}") class='btn btn-danger text-white' style='cursor:pointer; width:50px;'>
                            <i class='far fa-trash-alt'></i>
                                </a>
                            </div>
                     `;
                }, "width": "35%"
            }
        ],
        "language": {
            "emptyTable": "No Records Found"
        },
        "width": "100%"
    });

}

function Delete(url) {
    swal({
        title: "Are you sure you want to delete?",
        text: "You will not be able to restore the content",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Yes, delete it!",
        closeOnconfirm: true
    }, function () {
        $.ajax({
            type: 'DELETE',
            url: url,
            success: function (data) {
                if (data.success) {
                    toastr.success(data.message);
                    dataTable.ajax.reload();
                }
                else {
                    toastr.error(data.message);
                }
            }
        });
    });
}

function Publish(url) {
    swal({
        title: "Ready To Publish?",
        text: "This will be live on the website",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Yes, Publish!",
        closeOnconfirm: true
    }, function () {
        $.ajax({
            type: 'POST',
            url: url,
            success: function (data) {
                if (data.success) {
                    toastr.success(data.message);
                    dataTable.ajax.reload();
                }
                else {
                    toastr.error(data.message);
                }
            }
        });
    });
}
