﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Cedar_Grove.helpers {
  public class SystemErrorHandler {
    public static void LogError(string module, Exception error) {
      SqlHelpers.Insert(SqlStatements.SQL_LOG_EXCEPTION.FormatWith(DateTime.Now.ConvertSqlDateTime(), module.FixSqlString(), error.Message.FixSqlString(), error.StackTrace.FixSqlString()));
    }

    public static void LogError(string module, string error) {
      SqlHelpers.Insert(SqlStatements.SQL_LOG_EXCEPTION.FormatWith(DateTime.Now.ConvertSqlDateTime(), module.FixSqlString(), error.FixSqlString(), string.Empty));
    }
  }
}