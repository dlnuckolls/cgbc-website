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
            <telerik:RadScheduler RenderMode="Auto" runat="server" ID="ChurchCalendar" DataSourceID="ChurchScheduleSource" Skin="WebBlue" SelectedView="MonthView" EnableExactTimeRendering="True"
              DataKeyField="Id" DataStartField="Start" DataEndField="End" DataSubjectField="Subject" DataDescriptionField="Description" OnAppointmentDataBound="ChurchCalendar_AppointmentDataBound"
              HoursPanelTimeFormat="H:mm" EditFormTimeFormat="H:mm" AdvancedForm-TimeFormat="H:mm" ExportSettings-FileName="CedarGroveBaptist_Calendar" Height="800px" Localization-AdvancedDescription="Description" Localization-AdvancedSubject="Title"
              EnableCustomAttributeEditing="True" SelectedDate="2020-01-01" ShowAllDayRow="False" TimeZonesEnabled="False" TimeZoneID="UTC" RowHeight="32px" DisplayRecurrenceActionDialogOnMove="True"
              DataRecurrenceField="RecurrenceRule" DataRecurrenceParentKeyField="RecurrenceParentID" StartEditingInAdvancedForm="true" StartInsertingInAdvancedForm="true">
              <ResourceTypes>
                <telerik:ResourceType KeyField="Id" Name="ministry" TextField="Title" ForeignKeyField="MinistryId" DataSourceID="MinistryDataSource"></telerik:ResourceType>
              </ResourceTypes>
              <TimelineView UserSelectable="False"></TimelineView>
              <AgendaView UserSelectable="True"></AgendaView>
              <AppointmentContextMenuSettings EnableDefault="True"></AppointmentContextMenuSettings>
              <TimeSlotContextMenuSettings EnableDefault="True"></TimeSlotContextMenuSettings>
              <AdvancedForm Modal="true"></AdvancedForm>
            </telerik:RadScheduler>
            <asp:SqlDataSource ID="ChurchScheduleSource" runat="server" ConnectionString='<%$ ConnectionStrings:CedarGrove %>'
              SelectCommand="SELECT [Id], [Subject], [Description], [Start], [End], [MinistryId], [RecurrenceRule], [RecurrenceParentId], [Annotations] FROM dbo.[Appointments];"
              UpdateCommand="UPDATE [dbo].[Appointments] SET [Subject] = @Subject, [Start] = @Start, [End] = @End, [MinistryId] = @MinistryId, [RecurrenceRule] = @RecurrenceRule, [RecurrenceParentID] = @RecurrenceParentID, [Annotations] = @Annotations, [Description] = @Description WHERE [Id] = @Id;"
              InsertCommand="INSERT INTO [Appointments] ([Subject], [Start], [End], [MinistryId], [RecurrenceRule], [RecurrenceParentId], [Annotations], [Description]) VALUES (@Subject, @Start, @End, @MinistryId, @RecurrenceRule, @RecurrenceParentID, @Annotations, @Description)"
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
          </telerik:LayoutColumn>
          <telerik:LayoutColumn Span="1" HiddenMd="true" HiddenSm="true" HiddenXs="true" />
        </Columns>
      </telerik:LayoutRow>
    </Rows>
  </telerik:RadPageLayout>
</asp:Content>
