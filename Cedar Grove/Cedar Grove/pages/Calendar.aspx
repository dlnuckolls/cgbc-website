<%@ Page Title="" Language="C#" MasterPageFile="~/pages/PagesMasterPage.Master" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="Cedar_Grove.pages.Calendar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <asp:Literal ID="TitleTag" runat="server"></asp:Literal>
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
            <telerik:RadScheduler RenderMode="Auto" runat="server" ID="ChurchCalendar" DataSourceID="ChurchScheduleSource" Skin="WebBlue" SelectedView="MonthView" EnableExactTimeRendering="True"
              DataKeyField="Id" DataStartField="Start" DataEndField="End" DataSubjectField="Subject" DataDescriptionField="Description" DataReminderField="Reminder" OnAppointmentDataBound="ChurchCalendar_AppointmentDataBound"
              HoursPanelTimeFormat="H:mm" EditFormTimeFormat="H:mm" AdvancedForm-TimeFormat="H:mm" AllowDelete="false" AllowEdit="false" AllowInsert="false"
              ExportSettings-FileName="CedarGroveBaptist_Calendar" Height="800px" Localization-AdvancedDescription="Notes" Localization-AdvancedSubject="Ministry"
              EnableCustomAttributeEditing="True" SelectedDate="2020-01-01" ShowAllDayRow="False" TimeZonesEnabled="False" TimeZoneID="UTC" RowHeight="32px">
              <ResourceTypes>
                <telerik:ResourceType KeyField="Id" Name="ministry" TextField="Title" ForeignKeyField="MinistryId" DataSourceID="MinistryDataSource"></telerik:ResourceType>
              </ResourceTypes>
              <TimelineView UserSelectable="False"></TimelineView>
              <AgendaView UserSelectable="True"></AgendaView>
            </telerik:RadScheduler>
            <asp:SqlDataSource ID="ChurchScheduleSource" runat="server" ConnectionString='<%$ ConnectionStrings:CedarGrove %>'
              SelectCommand="
SELECT [Id], [Subject], [Description], [Start], [End], [MinistryId], [RecurrenceRule], 
       [RecurrenceParentId], [Reminder], [Annotations]
  FROM dbo.[Appointments];" />
            <asp:SqlDataSource ID="MinistryDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:CedarGrove %>'
              SelectCommand="
SELECT [Id], [Title]
  FROM dbo.[Ministry];" />
          </telerik:LayoutColumn>
        </Columns>
      </telerik:LayoutRow>
    </Rows>
  </telerik:RadPageLayout>
</asp:Content>
