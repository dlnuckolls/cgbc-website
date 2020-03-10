<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AdminPages.aspx.cs" Inherits="Cedar_Grove.admin.AdminPages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <asp:Literal ID="TitleTag" runat="server"></asp:Literal>
  <style>
    .RadGrid {
      border-radius: 10px;
      overflow: hidden;
    }

    .RadGrid_Silk .rgFilterRow > td > [type="text"] {
      width: 90% !important;
    }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <telerik:RadAjaxPanel runat="server">
    <div style="min-height: 800px;">
      <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetAllPageLocations" TypeName="Cedar_Grove.SqlDatasets" />
      <asp:Literal ID="PageAdminHeader" runat="server" />
      <div id="messageDisplayArea">
        <telerik:RadLabel runat="server" ID="MessageDisplay"></telerik:RadLabel>
      </div>
      <div style="height: 40px; width: 95%; clear: both; margin: auto;">
        <div style="float: left; width: 60%;">
          <telerik:RadAutoCompleteBox runat="server" ID="PageLocations" RenderMode="Auto" Width="100%" EmptyMessage="Select a Location" AllowCustomEntry="false"
            DataTextField="Description" DataValueField="Id" Skin="Silk" ZIndex="10000" IsCaseSensitive="False" HighlightFirstMatch="True" MinFilterLength="1"
            OnTextChanged="PageLocations_TextChanged" Label="Select Page Block to Edit" TextSettings-SelectionMode="Single" InputType="Text" AutoPostBack="true" TabIndex="0" />
        </div>
        <div style="float: right; text-align: right;">
          <telerik:RadButton ID="SavePage" runat="server" Skin="Silk" RenderMode="Auto" Text="Save Changes" OnClick="SavePage_Click" CssClass="css3Simple" TabIndex="2" />
        </div>
      </div>
      <div class="adminTiles">
        <telerik:RadEditor RenderMode="Lightweight" runat="server" ID="PageDescription" SkinID="DefaultSetOfTools"
          Height="675px" Skin="Silk" Width="100%" EditModes="Design,Html" TabIndex="1">
          <Tools>
            <telerik:EditorToolGroup Tag="MainToolbar">
              <telerik:EditorTool Name="FindAndReplace"></telerik:EditorTool>
              <telerik:EditorSeparator></telerik:EditorSeparator>
              <telerik:EditorSplitButton Name="Undo"></telerik:EditorSplitButton>
              <telerik:EditorSplitButton Name="Redo"></telerik:EditorSplitButton>
              <telerik:EditorSeparator></telerik:EditorSeparator>
              <telerik:EditorTool Name="Cut"></telerik:EditorTool>
              <telerik:EditorTool Name="Copy"></telerik:EditorTool>
              <telerik:EditorTool Name="Paste" ShortCut="CTRL+V / CMD+V"></telerik:EditorTool>
              <telerik:EditorTool Name="AjaxSpellCheck" Text="Spell Check"></telerik:EditorTool>
            </telerik:EditorToolGroup>
            <telerik:EditorToolGroup Tag="Formatting">
              <telerik:EditorTool Name="Bold"></telerik:EditorTool>
              <telerik:EditorTool Name="Italic"></telerik:EditorTool>
              <telerik:EditorTool Name="Underline"></telerik:EditorTool>
              <telerik:EditorSeparator></telerik:EditorSeparator>
              <telerik:EditorSplitButton Name="ForeColor"></telerik:EditorSplitButton>
              <telerik:EditorSplitButton Name="BackColor"></telerik:EditorSplitButton>
              <telerik:EditorSeparator></telerik:EditorSeparator>
              <telerik:EditorDropDown Name="FontName"></telerik:EditorDropDown>
              <telerik:EditorDropDown Name="RealFontSize"></telerik:EditorDropDown>
              <telerik:EditorSeparator></telerik:EditorSeparator>
              <telerik:EditorTool Name="ImageManager" Text="Image Manager"></telerik:EditorTool>
              <telerik:EditorTool Name="StripAll" />
              <telerik:EditorTool Name="StripSpan" />
              <telerik:EditorTool Name="StripWord" />
            </telerik:EditorToolGroup>
            <telerik:EditorToolGroup>
              <telerik:EditorTool Name="InsertLink" Text="Links"></telerik:EditorTool>
              <telerik:EditorTool Name="Unlink" Text="Unlink"></telerik:EditorTool>
            </telerik:EditorToolGroup>
          </Tools>
          <ImageManager ViewPaths="~/images/useruploads/pages"
            UploadPaths="~/images/useruploads/pages"
            DeletePaths="~/images/useruploads/pages"
            EnableAsyncUpload="true" MaxUploadFileSize="2000" />
          <Modules>
            <telerik:EditorModule Name="RadEditorStatistics" Visible="true" Enabled="true" />
            <telerik:EditorModule Name="RadEditorDomInspector" Visible="false" Enabled="true" />
            <telerik:EditorModule Name="RadEditorNodeInspector" Visible="false" Enabled="true" />
            <telerik:EditorModule Name="RadEditorHtmlInspector" Visible="false" Enabled="true" />
          </Modules>
        </telerik:RadEditor>
      </div>
    </div>
  </telerik:RadAjaxPanel>
</asp:Content>
