using System;
using System.Web.Routing;

namespace Cedar_Grove {
  public class Global : System.Web.HttpApplication {

    protected void Application_Start(object sender, EventArgs e) { RegisterRoutes(RouteTable.Routes); }

    static void RegisterRoutes(RouteCollection routes) {
      routes.MapPageRoute("Login", "login", "~/admin/Login.aspx");

      // Admin Pages
      routes.MapPageRoute("AdminDashboard", "admin/dashboard", "~/admin/default.aspx");
      //routes.MapPageRoute("AdminLogin", "login", "~/admin/Login.aspx");
      routes.MapPageRoute("AdminForgot", "forgot", "~/admin/ForgotPassword.aspx");
      routes.MapPageRoute("AdminReset", "reset", "~/admin/ResetPassword.aspx");
      routes.MapPageRoute("AdminPages", "admin/pages", "~/admin/AdminPages.aspx");
      routes.MapPageRoute("AdminCalendar", "admin/calendar", "~/admin/AdminCalendar.aspx");
      routes.MapPageRoute("AdminEvents", "admin/events", "~/admin/AdminEvents.aspx");
      routes.MapPageRoute("AdminGallery", "admin/photos", "~/admin/AdminGallery.aspx");
      routes.MapPageRoute("AdminSermons", "admin/sermons", "~/admin/AdminSermons.aspx");
      routes.MapPageRoute("AdminStaff", "admin/staff", "~/admin/AdminStaff.aspx");
      routes.MapPageRoute("AdminUsers", "admin/users", "~/admin/AdminUsers.aspx");
      routes.MapPageRoute("AdminTraining", "training", "~/admin/Classroom.aspx");
    }

    protected void Session_Start(object sender, EventArgs e) { }

    protected void Application_BeginRequest(object sender, EventArgs e) { }

    protected void Application_AuthenticateRequest(object sender, EventArgs e) { }

    protected void Application_Error(object sender, EventArgs e) { }

    protected void Session_End(object sender, EventArgs e) { }

    protected void Application_End(object sender, EventArgs e) { }
  }
}