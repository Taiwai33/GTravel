﻿var dataTable;

$(document).ready(function () {
    loadDataTable();

});

function loadDataTable() {

    dataTable = $('#tblData').DataTable({
        "ajax": {
            "url": "/admin/city/GetAll",
            "type": "GET",
            "datatype": "json"
        },
        "columns": [
            { "data": "name", "width": "40%" },
            {"data": "state","width": "10%"},
            { "data": "postCode", "width": "10%" },
            {
                "data": "id",
                "render": function (data) {
                    return `<div class="text-center">
                                <a href="/Admin/city/Upsert/${data}" class='btn btn-success text-white' style='cursor:pointer; width:100px;'>
                            <i class='far fa-edit'></i>Edit
                                </a>
                                &nbsp;
                                <a onclick=Delete("/Admin/city/Delete/${data}") class='btn btn-danger text-white' style='cursor:pointer; width:100px;'>
                            <i class='far fa-trash-alt'></i>Delete
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