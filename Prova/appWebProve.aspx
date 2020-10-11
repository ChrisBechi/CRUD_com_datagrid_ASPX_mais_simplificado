<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="appWebProve.aspx.cs" Inherits="Prova.appWebProve" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        body{
            background-image: url('https://cutewallpaper.org/21/ultra-instinct-goku-hd/Wallpaper-Ultra-Instinct-Goku,-Migatte-No-Gokui-Dominado-.jpg');
            background-size:cover;
            background-repeat:no-repeat;
        }
        .content{
            background-color:#808080;
            width:310px;
            margin:auto;
            height:500px;
            border:1px solid black;
        }
        .auto-style1 {
            background: #ffffff;
            width: 298px;
            margin-left:70px;
            height: 320px;
            border-radius:5px 5px 5px 5px;
        }

        .btn {
            width:80px;
            height:35px;
        }

        .inputs{
            border:none;
            border-bottom:2px solid #4A3C8C;
        }

        .gv{
            width:570px;
            margin-left:60px;
            margin-top:30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="auto-style1">
                <table>
                    <tr>
                        <td colspan="3" style="text-align:center;background-color:#ccc; padding-top:10px">
                            <h2>CADASTRO <br>FORNECEDOR</h2>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-top:10px">
                            <asp:Label ID="Label1" runat="server" Text="CNPJ:"></asp:Label>
                        </td>
                        <td style="padding-top:10px">
                            <asp:TextBox ID="TextBox1" CssClass="inputs" runat="server" Width="109px"></asp:TextBox>
                            <asp:Button ID="Button1" runat="server" style="margin-left:10px; height:30px;" Text="Limpar" Width="83px" OnClick="Button1_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-top:10px">
                            <asp:Label ID="Label2" runat="server" Text="Fornecedor:"></asp:Label>
                        </td>
                        <td colspan="2" style="padding-top:10px">
                            <asp:TextBox ID="TextBox2" CssClass="inputs" runat="server" Width="210px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-top:10px">
                            <asp:Label ID="Label3" runat="server" Text="Segmento::"></asp:Label>
                        </td>
                        <td style="padding-top:10px" colspan="2">
                            <asp:TextBox ID="TextBox3" CssClass="inputs" runat="server" Width="211px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-top:10px">
                            <asp:Label ID="Label4" runat="server" Text="Endereco:"></asp:Label>
                        </td>
                        <td style="padding-top:10px" colspan="2">
                            <asp:TextBox ID="TextBox4" CssClass="inputs" runat="server" Width="211px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="text-align:right;padding-top:20px">
                            <asp:Button ID="Button2" runat="server" CssClass="btn" Text="Incluir" Width="84px" OnClick="Button2_Click" />
                            <asp:Button ID="Button3" runat="server" CssClass="btn" Text="Alterar" Width="84px" OnClick="Button3_Click" />
                            <asp:Button ID="Button4" runat="server" CssClass="btn" Text="Excluir" Width="84px" OnClick="Button4_Click" />
                        </td>
                    </tr>
                </table>
            </div>
            <div class="gv">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="597px" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" OnRowCommand="GridView1_RowCommand">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:BoundField DataField="cnpj_fornecedor" HeaderText="CNPJ">
                        <HeaderStyle Width="80px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="nome_fornecedor" HeaderText="Fornecedor">
                        <HeaderStyle Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="nome_segmento" HeaderText="Segmento">
                        <HeaderStyle Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="endereco_fornecedor" HeaderText="Endereco">
                        <HeaderStyle Width="100px" />
                        </asp:BoundField>
                        <asp:ButtonField ButtonType="Button" CommandName="carregar" HeaderText="Ação" Text="Carregar">
                        <HeaderStyle Width="70px" />
                        </asp:ButtonField>
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
