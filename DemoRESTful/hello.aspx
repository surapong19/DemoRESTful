<%@ Page Language="C#" AutoEventWireup="true" CodeFile="hello.aspx.cs" Inherits="DemoRESTful.hello" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>

        <script>
            $(document).ready(function () {
              

                console.log("js ready");



                $.ajax({

                    type: "GET",

                    url: "http://localhost:50005/Service1.svc/GetCustomers",

                    contentType: "application/json; charset=utf-8",

                    dataType: "json",

                    success: function (response) {
                        //console.log(response.d);

                        var names = response.GetCustomerListResult;
                        console.log(names);

                        $('#table_id').DataTable({
                            data: names,
                            columns: [
                                { data: 'Address' },
                                { data: 'CustomerID' },
                                { data: 'FirstName' },
                                { data: 'LastName' }
                            ]
                        });
                    },

                    failure: function (response) {

                        alert(response.d);

                    }

                });

            });

        </script>

        <div>
            <p>hello</p>

            <table id="table_id" class="display">
                <thead>
                    <tr>
                        <th>Address</th>
                        <th>CustomerID</th>
                        <th>FirstName</th>
                        <th>LastName</th>

                    </tr>
                </thead>
                <tbody>
                    <%--<tr>
                        <td>Row 1 Data 1</td>
                        <td>Row 1 Data 2</td>
                    </tr>
                    <tr>
                        <td>Row 2 Data 1</td>
                        <td>Row 2 Data 2</td>
                    </tr>--%>
                </tbody>
            </table>
        </div>


    </form>


</body>
</html>
