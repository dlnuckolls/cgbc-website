﻿using System;
using System.Web.UI;

namespace Cedar_Grove {
  public class BaseMasterPage: MasterPage {
    internal SessionManager SessionInfo;

    protected override void OnInit(EventArgs e) {
      base.OnInit(e);
      LoadFromSession();
    }

    protected override void OnUnload(EventArgs e) {
      StoreInSession();
      base.OnUnload(e);
    }

    internal void LoadFromSession() {
      if(Session["PortalSession"] == null) SessionInfo = new SessionManager();
      else SessionInfo = (SessionManager)Session["PortalSession"];
    }

    internal void StoreInSession() {
      Session["PortalSession"] = SessionInfo;
    }
  }
}