<%@ Page Title="" Language="C#" MasterPageFile="~/pages/PagesMasterPage.Master" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="Cedar_Grove.pages.Calendar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <asp:Literal ID="TitleTag" runat="server"></asp:Literal>
  <link href="/styles/calendar.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <telerik:RadPageLayout runat="server" ID="JumbotronLayout" CssClass="jumbotron" GridType="Fluid">
    <Rows>
      <telerik:LayoutRow>
        <Columns>
          <telerik:LayoutColumn Span="6" SpanMd="7" SpanSm="12" SpanXs="12">
            <asp:Literal ID="PageContentBlock" runat="server" />
          </telerik:LayoutColumn>
          <telerik:LayoutColumn Span="6" SpanMd="5" SpanSm="12" SpanXs="12">
          </telerik:LayoutColumn>
        </Columns>
      </telerik:LayoutRow>
      <telerik:LayoutRow>
        <Columns>
          <telerik:LayoutColumn Span="12" SpanMd="12" SpanSm="12" SpanXs="12">
            <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
              <script type="text/javascript">
                function OnClientAppointmentClick(sender, args) {
                  var apt = args.get_appointment();
                  showTooltip(apt);
                }

                function showTooltip(apt) {
                  var tooltip = $find('<%=RadToolTip1.ClientID %>');
                  tooltip.set_targetControl(apt.get_element());
                  $get("startTime").innerHTML = apt.get_start().format("MM/dd/yyyy h:mm tt");
                  $get("endTime").innerHTML = apt.get_end().format("h:mm tt");
                  $get("descriptionDiv").innerHTML = apt.get_description();
                  $get("subject").innerHTML = apt.get_subject();
                  tooltip.set_text($get("contentContainer").innerHTML);
                  setTimeout(function () {
                    tooltip.show();
                  }, 20);
                }

                function hideTooltip() {
                  setTimeout(function () {
                    var activeTooltip = Telerik.Web.UI.RadToolTip.getCurrent();
                    if (activeTooltip) { activeTooltip.hide(); }
                  }, 50);
                }
              </script>
            </telerik:RadCodeBlock>
            <div id="ToggleButtons" runat="server" style="width:100%; text-align:right;"></div>
            <telerik:RadScheduler RenderMode="Auto" runat="server" ID="ChurchCalendar" DataSourceID="ChurchScheduleSource" Skin="WebBlue" SelectedView="MonthView" EnableExactTimeRendering="True"
              DataKeyField="Id" DataStartField="Start" DataEndField="End" DataSubjectField="Subject" DataDescriptionField="Description" DataReminderField="Reminder" 
              OnAppointmentDataBound="ChurchCalendar_AppointmentDataBound" OnClientAppointmentDoubleClick="hideTooltip" OnClientAppointmentContextMenu="hideTooltip"
              OnClientAppointmentClick="OnClientAppointmentClick" HoursPanelTimeFormat="hh:mm" EditFormTimeFormat="hh:mm" AdvancedForm-TimeFormat="hh:mm" AllowDelete="false" AllowEdit="false" AllowInsert="false"
              ExportSettings-FileName="CedarGroveBaptist_Calendar" Height="800px" Localization-AdvancedDescription="Notes" Localization-AdvancedSubject="Ministry" MonthView-VisibleAppointmentsPerDay="4"
              EnableCustomAttributeEditing="True" SelectedDate="2020-01-01" TimeZonesEnabled="False" TimeZoneID="UTC" RowHeight="28px" ShowFooter="False" OverflowBehavior="Expand">
              <ResourceTypes>
                <telerik:ResourceType KeyField="Id" Name="Ministry" TextField="Title" ForeignKeyField="MinistryId" DataSourceID="MinistryDataSource"></telerik:ResourceType>
              </ResourceTypes>
              <ResourceStyles>
                <telerik:ResourceStyleMapping Type="Ministry" Key="1" ApplyCssClass="mensMinistry" />
                <telerik:ResourceStyleMapping Type="Ministry" Key="2" ApplyCssClass="womensMinistry" />
                <telerik:ResourceStyleMapping Type="Ministry" Key="3" ApplyCssClass="youthMinistry" />
                <telerik:ResourceStyleMapping Type="Ministry" Key="4" ApplyCssClass="childrensMinistry" />
                <telerik:ResourceStyleMapping Type="Ministry" Key="5" ApplyCssClass="outreachMinistry" />
                <telerik:ResourceStyleMapping Type="Ministry" Key="6" ApplyCssClass="generalMinistry" />
              </ResourceStyles>
              <TimelineView UserSelectable="False"></TimelineView>
              <AgendaView UserSelectable="True"></AgendaView>
              <AppointmentTemplate>
                <div>
                  <%# Eval("Subject") %>
                </div>
              </AppointmentTemplate>
            </telerik:RadScheduler>
            <telerik:RadToolTip ID="RadToolTip1" runat="server" RelativeTo="Element" Position="BottomCenter"
              AutoCloseDelay="0" ShowEvent="FromCode" Width="350px">
              <div id="contentContainer">
                <span id="subject"></span>
                <hr />
                <span id="startTime"></span> - <span id="endTime"></span>
                <hr />
                Description:
                <div id="descriptionDiv">
                </div>
              </div>
            </telerik:RadToolTip>
            <asp:SqlDataSource ID="ChurchScheduleSource" runat="server" ConnectionString='<%$ ConnectionStrings:CedarGrove %>'
              SelectCommand="
                SELECT a.[Id],a.[Subject],a.[Description],ISNULL(o.[StartDate],a.[Start]) [Start],ISNULL(o.[EndDate],a.[End]) [End],
                       a.[MinistryId],a.[RecurrenceRule],a.[RecurrenceParentId],a.[Reminder],a.[Annotations]
                  FROM Appointments a 
                 OUTER APPLY dbo.ExpandRecurrence(a.RecurrenceRule, CAST(GETDATE() - 30 AS DATETIME), CAST(GETDATE() + 90 AS DATETIME)) o;" />
            <asp:SqlDataSource ID="MinistryDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:CedarGrove %>'
              SelectCommand="SELECT [Id], [Title] FROM dbo.[Ministry];" />
          </telerik:LayoutColumn>
        </Columns>
      </telerik:LayoutRow>
    </Rows>
  </telerik:RadPageLayout>
</asp:Content>
