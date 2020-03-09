<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AdminCalendar.aspx.cs" Inherits="Cedar_Grove.admin.AdminCalendar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <asp:Literal ID="TitleTag" runat="server"></asp:Literal>
  <link href="/styles/calendar.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <telerik:RadPageLayout runat="server" ID="JumbotronLayout" GridType="Fluid">
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
          <telerik:LayoutColumn Span="1" HiddenMd="true" HiddenSm="true" HiddenXs="true" />
          <telerik:LayoutColumn Span="10" SpanMd="12" SpanSm="12" SpanXs="12">
            <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
              <script type="text/javascript">
                function OnClientAppointmentClick(sender, args) {
                  var apt = args.get_appointment();
                  showTooltip(apt);
                }

                function showTooltip(apt) {
                  var tooltip = $find('<%=RadToolTip1.ClientID %>');
                  tooltip.set_targetControl(apt.get_element());
                  $get("startTime").innerHTML = apt.get_start().format("MM/dd/yyyy HH:mm");
                  $get("endTime").innerHTML = apt.get_end().format("MM/dd/yyyy HH:mm");
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
            <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server">
              <telerik:RadScheduler RenderMode="Auto" runat="server" ID="ChurchCalendar" DataSourceID="ChurchScheduleSource" Skin="WebBlue" SelectedView="MonthView" EnableExactTimeRendering="True"
                DataKeyField="Id" DataStartField="Start" DataEndField="End" DataSubjectField="Subject" DataDescriptionField="Description" OnAppointmentDataBound="ChurchCalendar_AppointmentDataBound"
                HoursPanelTimeFormat="H:mm" EditFormTimeFormat="H:mm" AdvancedForm-TimeFormat="H:mm" ExportSettings-FileName="CedarGroveBaptist_Calendar" Height="800px"
                Localization-AdvancedDescription="Description" Localization-AdvancedSubject="Title" OnClientAppointmentDoubleClick="hideTooltip" OnClientAppointmentContextMenu="hideTooltip"
                OnClientAppointmentClick="OnClientAppointmentClick" EnableCustomAttributeEditing="True" SelectedDate="2020-01-01" TimeZonesEnabled="False" TimeZoneID="UTC" RowHeight="32px"
                DisplayRecurrenceActionDialogOnMove="True" DataRecurrenceField="RecurrenceRule" DataRecurrenceParentKeyField="RecurrenceParentID" StartInsertingInAdvancedForm="true"
                DayStartTime="07:00:00" ShowFooter="False" >
                <ResourceTypes>
                  <telerik:ResourceType KeyField="Id" Name="Ministry" TextField="Title" ForeignKeyField="MinistryId" DataSourceID="MinistryDataSource"></telerik:ResourceType>
                </ResourceTypes>
                <ResourceStyles>
                  <telerik:ResourceStyleMapping Type="Ministry" Key="1" ApplyCssClass="mensMinistry" />
                  <telerik:ResourceStyleMapping Type="Ministry" Key="2" ApplyCssClass="womensMinistry" />
                  <telerik:ResourceStyleMapping Type="Ministry" Key="8" ApplyCssClass="womensMinistry" />
                  <telerik:ResourceStyleMapping Type="Ministry" Key="9" ApplyCssClass="womensMinistry" />
                  <telerik:ResourceStyleMapping Type="Ministry" Key="3" ApplyCssClass="youthMinistry" />
                  <telerik:ResourceStyleMapping Type="Ministry" Key="4" ApplyCssClass="childrensMinistry" />
                  <telerik:ResourceStyleMapping Type="Ministry" Key="5" ApplyCssClass="outreachMinistry" />
                  <telerik:ResourceStyleMapping Type="Ministry" Key="6" ApplyCssClass="generalMinistry" />
                  <telerik:ResourceStyleMapping Type="Ministry" Key="7" ApplyCssClass="missionsMinistry" />
                </ResourceStyles>
                <TimelineView UserSelectable="False"></TimelineView>
                <AgendaView UserSelectable="True"></AgendaView>
                <AppointmentContextMenuSettings EnableDefault="True"></AppointmentContextMenuSettings>
                <TimeSlotContextMenuSettings EnableDefault="True"></TimeSlotContextMenuSettings>
                <AdvancedForm Modal="true"></AdvancedForm>
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
                  Starts on: <span id="startTime"></span>
                  <br />
                  Ends on: <span id="endTime"></span>
                  <hr />
                  Description:
                <div id="descriptionDiv">
                </div>
                </div>
              </telerik:RadToolTip>
              <asp:SqlDataSource ID="ChurchScheduleSource" runat="server" ConnectionString='<%$ ConnectionStrings:CedarGrove %>'
                SelectCommand="SELECT [Id], [Subject], [Description], [Start], [End], [MinistryId], [RecurrenceRule], [RecurrenceParentId], [Annotations] FROM dbo.[Appointments];"
                UpdateCommand="UPDATE [dbo].[Appointments] SET [Subject] = @Subject, [Start] = @Start, [End] = @End, [MinistryId] = @MinistryId, [RecurrenceRule] = @RecurrenceRule, [RecurrenceParentID] = @RecurrenceParentID, [Annotations] = @Annotations, [Description] = @Description WHERE [Id] = @Id;"
                InsertCommand="INSERT INTO [Appointments] ([Subject], [Start], [End], [MinistryId], [RecurrenceRule], [RecurrenceParentId], [Annotations], [Description]) VALUES (@Subject, @Start, @End, ISNULL(@MinistryId,6), @RecurrenceRule, @RecurrenceParentID, @Annotations, @Description)"
                DeleteCommand="DELETE FROM [Appointments] WHERE [Id] = @Id">
                <DeleteParameters>
                  <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
                </DeleteParameters>
                <UpdateParameters>
                  <asp:Parameter Name="Subject" Type="String"></asp:Parameter>
                  <asp:Parameter Name="Start" Type="DateTime"></asp:Parameter>
                  <asp:Parameter Name="End" Type="DateTime"></asp:Parameter>
                  <asp:Parameter Name="MinistryId" Type="Int32"></asp:Parameter>
                  <asp:Parameter Name="RecurrenceRule" Type="String"></asp:Parameter>
                  <asp:Parameter Name="RecurrenceParentID" Type="Int32"></asp:Parameter>
                  <asp:Parameter Name="Annotations" Type="String"></asp:Parameter>
                  <asp:Parameter Name="Description" Type="String"></asp:Parameter>
                  <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
                </UpdateParameters>
                <InsertParameters>
                  <asp:Parameter Name="Subject" Type="String"></asp:Parameter>
                  <asp:Parameter Name="Start" Type="DateTime"></asp:Parameter>
                  <asp:Parameter Name="End" Type="DateTime"></asp:Parameter>
                  <asp:Parameter Name="MinistryId" Type="Int32"></asp:Parameter>
                  <asp:Parameter Name="RecurrenceRule" Type="String"></asp:Parameter>
                  <asp:Parameter Name="RecurrenceParentID" Type="Int32"></asp:Parameter>
                  <asp:Parameter Name="Annotations" Type="String"></asp:Parameter>
                  <asp:Parameter Name="Description" Type="String"></asp:Parameter>
                </InsertParameters>
              </asp:SqlDataSource>
              <asp:SqlDataSource ID="MinistryDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:CedarGrove %>'
                SelectCommand="SELECT [Id], [Title] FROM dbo.[Ministry];" />
            </telerik:RadAjaxPanel>
          </telerik:LayoutColumn>
          <telerik:LayoutColumn Span="1" HiddenMd="true" HiddenSm="true" HiddenXs="true" />
        </Columns>
      </telerik:LayoutRow>
    </Rows>
  </telerik:RadPageLayout>
</asp:Content>
