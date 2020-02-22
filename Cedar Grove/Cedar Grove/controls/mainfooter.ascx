<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="mainfooter.ascx.cs" Inherits="Cedar_Grove.controls.mainfooter" %>

<telerik:RadPageLayout runat="server" ID="RadPageLayout1" GridType="Fluid">
  <Rows>
    <%--Footer--%>
    <telerik:LayoutRow>
      <Columns>
        <telerik:LayoutColumn Span="12" SpanMd="12" SpanSm="12" SpanXs="12" CssClass="footer">
          Cedar Grove Baptist Church © 2020<br />
          4900 CEDAR GROVE ROAD, SHEPHERDSVILLE, KY. 40165<br />
          <a href="https://www.facebook.com/cedargrove4900/" target="_blank"><img src="/images/facebook.png" /></a>
        </telerik:LayoutColumn>
      </Columns>
    </telerik:LayoutRow>
  </Rows>
</telerik:RadPageLayout>
