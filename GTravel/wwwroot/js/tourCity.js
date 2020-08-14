var dataTable;
var url;
$(document).ready(function () {
    url = "/admin/tourCity/GetAll/" + tourId;
    loadDataTable();
});



function loadDataTable() {

    dataTable = $('#tblData').DataTable({
        "ajax": {
            "url": url,
            "type": "GET",
            "datatype": "json"
        },
        "columns": [
            { "data": "city", "width": "20%" },
            { "data": "state", "width": "10%" },
            
            {
                "data": "tourCityId",
                "render": function (data) {
                    return `<div class="text-center btn-group">
                                <a href="/Admin/tourAttraction/index/${data}" class='btn btn-success text-white mr-2' style='cursor:pointer; width:120px;'>
                                <i class="far fa-plus-square"></i>
                                  Attractions</a>
                                <a href="/Admin/tourCity/Update/${data}" class='btn btn-success text-white mr-2' style='cursor:pointer; width:50px;'>
                                    <i class='far fa-edit'></i>
                                </a>
                                &nbsp;
                                <a onclick=Delete("/Admin/tourCity/Delete/${data}") class='btn btn-danger text-white mr-2' style='cursor:pointer; width:50px;'>
                            <i class='far fa-trash-alt'></i>
                                </a>
                            </div>
                     `;
                }, "width": "20%"
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
