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
                "render": function (data, type,row) {
                    return `<a href="/Admin/tour/Details/${row.id}" >${data}</a>`
                },
                "width": "20%"
            },
            {"data": "maxCapacity","width": "20%"},
            {
                "data": "id",
                "render": function (data) {
                    return `<div class="text-center">                              
                            <a href="/Admin/tourCity/Index/${data}" class='btn btn-success text-white' style='cursor:pointer; width:85px;'>
                            <i class="far fa-plus-square"></i> Cities
                                </a> 
                                &nbsp;
                                <a href="/Admin/tour/Update/${data}" class='btn btn-success text-white' style='cursor:pointer; width:50px;'>
                            <i class='far fa-edit'></i>
                                </a>
                                &nbsp;
                                <a onclick=Delete("/Admin/tour/Delete/${data}") class='btn btn-danger text-white' style='cursor:pointer; width:50px;'>
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
