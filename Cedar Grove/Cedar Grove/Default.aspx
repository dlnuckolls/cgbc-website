﻿<%@ Page Title="" Language="C#" MasterPageFile="~/DefaultMasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Cedar_Grove.Default" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content0" ContentPlaceHolderID="head" runat="Server">
  <link href="styles/default.css" rel="stylesheet" />
  <asp:Literal ID="TitleTag" runat="server"></asp:Literal>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <telerik:RadPageLayout runat="server" ID="RadPageLayout1">
    <Rows>
      <telerik:LayoutRow>
        <Columns>
          <telerik:LayoutColumn CssClass="jumbotron">
            <h3>Welcome to Cedar Grove Baptist Church, join us for Sunday School and Worship starting at 9:30 AM</h3>
            <h1>Every Sunday</h1>
            <h3>We would love to see you there!</h3>
          </telerik:LayoutColumn>
        </Columns>
      </telerik:LayoutRow>
      <telerik:LayoutRow>
        <Columns>
          <telerik:LayoutColumn HiddenMd="true" HiddenSm="true" HiddenXs="true">
            <h3>Upcoming events you don't want to miss!</h3>
          </telerik:LayoutColumn>
        </Columns>
      </telerik:LayoutRow>
    </Rows>
  </telerik:RadPageLayout>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
  <telerik:RadPageLayout runat="server" ID="Content1">
    <Rows>
      <telerik:LayoutRow>
        <Columns>
          <telerik:LayoutColumn Span="4" SpanMd="12" SpanSm="12" HiddenXs="true">
            <h4>H4 text font size 18 px.</h4>
            <p><strong>Main content text font size 16px</strong>, aliquam turpis sed nisl mattis sagittis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Ut vitae sapien metus. In hac habitasse platea dictumst. Aenean velit mauris, lobortis eu lacinia sed</p>
            <p>Nullam facilisis neque ut aliquet imperdiet. Mauris ut odio augue. Curabitur in mi ac odio vestibulum lobortis. </p>
            <telerik:RadButton runat="server" ID="RadButton1" Text="Button" ButtonType="SkinnedButton"></telerik:RadButton>
          </telerik:LayoutColumn>

          <telerik:LayoutColumn Span="4" SpanMd="12" SpanSm="12" HiddenXs="true">
            <h4>H4 text font size 18 px.</h4>
            <p><strong>Main content text font size 16px</strong>, aliquam turpis sed nisl mattis sagittis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Ut vitae sapien metus. In hac habitasse platea dictumst. Aenean velit mauris, lobortis eu lacinia sed</p>

            <p>Nullam facilisis neque ut aliquet imperdiet. Mauris ut odio augue. Curabitur in mi ac odio vestibulum lobortis. </p>
            <telerik:RadButton runat="server" ID="RadButton2" Text="Button" ButtonType="SkinnedButton"></telerik:RadButton>
          </telerik:LayoutColumn>

          <telerik:LayoutColumn Span="4" SpanMd="12" SpanSm="12" HiddenXs="true">
            <h4>H4 text font size 18 px.</h4>
            <p><strong>Main content text font size 16px</strong>, aliquam turpis sed nisl mattis sagittis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Ut vitae sapien metus. In hac habitasse platea dictumst. Aenean velit mauris, lobortis eu lacinia sed</p>

            <p>Nullam facilisis neque ut aliquet imperdiet. Mauris ut odio augue. Curabitur in mi ac odio vestibulum lobortis. </p>
            <telerik:RadButton runat="server" ID="RadButton3" Text="Button" ButtonType="SkinnedButton"></telerik:RadButton>
          </telerik:LayoutColumn>
        </Columns>
      </telerik:LayoutRow>
    </Rows>
  </telerik:RadPageLayout>
</asp:Content>
