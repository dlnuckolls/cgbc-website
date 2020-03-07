using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace Cedar_Grove {
  public class Global : System.Web.HttpApplication {

    protected void Application_Start(object sender, EventArgs e) { RegisterRoutes(RouteTable.Routes); }

    static void RegisterRoutes(RouteCollection routes) {
      // Normal Pages
      routes.MapPageRoute("AboutUsPage", "aboutus", "~/pages/AboutUs.aspx");
      routes.MapPageRoute("ByLawsPage", "bylaws", "~/pages/ByLaws.aspx");
      routes.MapPageRoute("CalendarPage", "calendar", "~/pages/Calendar.aspx");
      routes.MapPageRoute("ChildProtectionPage", "childprotection", "~/pages/ChildProtection.aspx");
      routes.MapPageRoute("ChildrensMinistryPage", "childrens", "~/pages/ChildrensMinistry.aspx");
      routes.MapPageRoute("ContactUsPage", "contactus", "~/pages/ContactUs.aspx");
      routes.MapPageRoute("MensMinistryPage", "mens", "~/pages/MensMinistry.aspx");
      routes.MapPageRoute("MissionsPage", "missions", "~/pages/Missions.aspx");
      routes.MapPageRoute("OutreachMinistryPage", "outreach", "~/pages/OutreachMinistry.aspx");
      routes.MapPageRoute("SermonsPage", "sermons", "~/pages/Sermons.aspx");
      routes.MapPageRoute("WhatWeBelievePage", "whatwebelieve", "~/pages/WhatWeBelieve.aspx");
      routes.MapPageRoute("WomensMinistryPage", "womens", "~/pages/WomensMinistry.aspx");
      routes.MapPageRoute("YouthMinistryPage", "youth", "~/pages/YouthMinistry.aspx");
      // Feeds
      routes.MapPageRoute("SermonRssFeed", "rssfeed", "~/feeds/Rss.aspx");
      // Admin Pages
      routes.MapPageRoute("AdminDashboard", "admin/dashboard", "~/admin/default.aspx");
      routes.MapPageRoute("AdminLogin", "login", "~/admin/Login.aspx");
      routes.MapPageRoute("AdminForgot", "forgot", "~/admin/ForgotPassword.aspx");
      routes.MapPageRoute("AdminReset", "reset", "~/admin/ResetPassword.aspx");
      routes.MapPageRoute("AdminPages", "admin/pages", "~/admin/AdminPages.aspx");
      routes.MapPageRoute("AdminCalendar", "admin/calendar", "~/admin/AdminCalendar.aspx");
      routes.MapPageRoute("AdminEvents", "admin/events", "~/admin/AdminEvents.aspx");
      routes.MapPageRoute("AdminGallery", "admin/photos", "~/admin/AdminGallery.aspx");
      routes.MapPageRoute("AdminSermons", "admin/sermons", "~/admin/AdminSermons.aspx");
      routes.MapPageRoute("AdminStaff", "admin/staff", "~/admin/AdminStaff.aspx");
      routes.MapPageRoute("AdminUsers", "admin/users", "~/admin/AdminUsers.aspx");

    }

    protected void Session_Start(object sender, EventArgs e) { }

    protected void Application_BeginRequest(object sender, EventArgs e) { }

    protected void Application_AuthenticateRequest(object sender, EventArgs e) { }

    protected void Application_Error(object sender, EventArgs e) { }

    protected void Session_End(object sender, EventArgs e) { }

    protected void Application_End(object sender, EventArgs e) { }
  }
}