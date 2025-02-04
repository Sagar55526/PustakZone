﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="myBooks.aspx.cs" Inherits="FindMyBooks.myBooks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .GridHeader {
            text-align: center !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb mt-3">
                <li class="breadcrumb-item"><a href="homePage.aspx">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">My Books</li>
            </ol>
        </nav>
    </section>

    <section>
        <div class="card mt-3 mb-3">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FindMyBooksConnectionString %>" SelectCommand="SELECT * FROM [tbl_new_book]"></asp:SqlDataSource>
            <asp:GridView class="table table-striped table-bordered gridview2 hover cell-border stripe ui celled table" ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDataBound="GridView1_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="subjectBook" HeaderText="Subject Book" SortExpression="subjectBook" HeaderStyle-CssClass="GridHeader">
                        <HeaderStyle CssClass="GridHeader"></HeaderStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="costBooks" HeaderText="Cost Books" SortExpression="costBooks" HeaderStyle-CssClass="GridHeader">
                        <HeaderStyle CssClass="GridHeader"></HeaderStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" HeaderStyle-CssClass="GridHeader">
                        <HeaderStyle CssClass="GridHeader"></HeaderStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" HeaderStyle-CssClass="GridHeader" />

                    <asp:TemplateField HeaderText="Update/View" HeaderStyle-CssClass="GridHeader">
                        <ItemTemplate>
                            <asp:Button ID="btnUpdate" runat="server" Text="Update/View" CssClass="btn btn-outline-info" PostBackUrl='<%# "~/updateMyBook.aspx?bookID=" + Eval("bookID") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
    </section>

     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
    <script>
        $(document).ready(function () {
            $(".gridview2").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable();
        });
    </script>

</asp:Content>
