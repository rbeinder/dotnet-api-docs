
<%@ Page language="VB" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">

    Sub CustomerDetailView_ItemDeleting(ByVal sender As Object, ByVal e As DetailsViewDeleteEventArgs)
        ' Cancel the delete operation if the user attempts to delete the last
        ' record from the data source.
        If (CustomerDetailView.DataItemCount <= 1) Then
            e.Cancel = True
            MessageLabel.Text = "You must keep at least one store."
        Else
            MessageLabel.Text = ""
        End If
    End Sub

</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
  <head runat="server">
    <title>DetailsView ItemDeleting Example</title>
</head>
<body>
    <form id="Form1" runat="server">
        
      <h3>DetailsView ItemDeleting Example</h3>
                
        <asp:detailsview id="CustomerDetailView"
          datasourceid="DetailsViewSource"
          datakeynames="CustomerID"
          autogeneratedeletebutton="true"  
          autogeneraterows="true"
          allowpaging="true"
          onitemdeleting="CustomerDetailView_ItemDeleting" 
          runat="server">
               
          <fieldheaderstyle backcolor="Navy"
            forecolor="White"/>
                    
        </asp:detailsview>
        
        <asp:Label id="MessageLabel"
          forecolor="Red"
          runat="server"/>
          
        <!-- This example uses Microsoft SQL Server and connects  -->
        <!-- to the Northwind sample database. Use an ASP.NET     -->
        <!-- expression to retrieve the connection string value   -->
        <!-- from the web.config file.                            -->
        <asp:SqlDataSource ID="DetailsViewSource" runat="server" 
          ConnectionString=
            "<%$ ConnectionStrings:NorthWindConnectionString%>"
            InsertCommand="INSERT INTO [Customers]([CustomerID], [CompanyName], [Address], [City], [PostalCode], [Country]) VALUES (@CustomerID, @CompanyName, @Address, @City, @PostalCode, @Country)"
            SelectCommand="Select [CustomerID], [CompanyName], 
              [Address], [City], [PostalCode], [Country] 
              From [Customers]"
            DeleteCommand="DELETE FROM [Customers] WHERE [CustomerID] = @CustomerID" >
        </asp:SqlDataSource>
    </form>
  </body>
</html>