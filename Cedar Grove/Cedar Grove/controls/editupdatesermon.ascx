<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="editupdatesermon.ascx.cs" Inherits="Cedar_Grove.controls.editupdatesermon" %>

<telerik:RadPageLayout runat="server" ID="RadPageLayout2">
  <Rows>
    <telerik:LayoutRow>
      <Columns>
        <telerik:LayoutColumn Span="6" SpanMd="6" SpanSm="12">
          <div style="display: block; width: 150px !important; margin-top: 4px; margin-bottom: 4px; text-align: left; font-weight: bold;">Published</div>
          <telerik:RadDatePicker ID="SermonPublished" runat="server" SelectedDate='<%# 
            (DataBinder.Eval(Container, "DataItem.Published") != DBNull.Value && DataBinder.Eval(Container, "DataItem.Published") != null) ? 
              Convert.ToDateTime(DataBinder.Eval(Container, "DataItem.Published")) : DateTime.Now %>'
            Width="100%" />
          <div style="display: block; width: 150px !important; margin-top: 4px; margin-bottom: 4px; text-align: left; font-weight: bold;">Title</div>
          <telerik:RadTextBox ID="SermonTitle" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Title") %>' Width="100%" />
          <div style="display: block; width: 150px !important; margin-top: 4px; margin-bottom: 4px; text-align: left; font-weight: bold;">Author</div>
          <telerik:RadTextBox ID="SermonAuthor" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Author") %>' Width="100%" />
        </telerik:LayoutColumn>
        <telerik:LayoutColumn Span="6" SpanMd="6" SpanSm="12">
          <div style="display: block; width: 150px !important; margin-top: 4px; margin-bottom: 4px; text-align: left; font-weight: bold;">Description</div>
          <telerik:RadTextBox ID="SermonDescription" runat="server" TextMode="MultiLine" Rows="6" Text='<%# DataBinder.Eval(Container, "DataItem.Description") %>' Width="100%" />
        </telerik:LayoutColumn>
      </Columns>
    </telerik:LayoutRow>
    <telerik:LayoutRow>
      <Columns>
        <telerik:LayoutColumn Span="12" SpanMd="12" SpanSm="12">
          <div style="display: block; width: 150px !important; margin-top: 4px; margin-bottom: 4px; text-align: left; font-weight: bold;">File</div>
          <telerik:RadTextBox ID="SermonSource" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.SourceUrl") %>' Width="100%" />
          <telerik:RadAsyncUpload RenderMode="Lightweight" runat="server" Skin="Silk" ID="SermonFileUpload" HideFileInput="true" MaxFileInputsCount="1" AllowedFileExtensions=".mp3,.wav,.mov" /><br /><br />
        </telerik:LayoutColumn>
      </Columns>
    </telerik:LayoutRow>
    <telerik:LayoutRow>
      <Columns>
        <telerik:LayoutColumn Span="12" SpanMd="12" SpanSm="12">
          <div class="pageCenter">
            <telerik:RadButton ID="btnUpdate" Skin="Silk" Text='<%# (Container is GridEditFormInsertItem) ? "Insert" : "Update" %>' runat="server" CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'></telerik:RadButton>&nbsp;
            <telerik:RadButton ID="btnCancel" Skin="Silk" Text="Cancel" runat="server" CausesValidation="False" CommandName="Cancel"></telerik:RadButton>
          </div>
        </telerik:LayoutColumn>
      </Columns>
    </telerik:LayoutRow>
  </Rows>
</telerik:RadPageLayout>
