Meteor._def_template("configureLoginServiceDialogForGoogle",Handlebars.json_ast_to_func(["<p>\n    First, you'll need to get a Google Client ID. Follow these steps:\n  </p>\n  <ol>\n    <li>\n      Visit <a href=\"https://code.google.com/apis/console/\" target=\"blank\">https://code.google.com/apis/console/</a>\n    </li>\n    <li>\n      If necessary, \"Create Project\"\n    <li>\n      Open the \"API Access\" tab on the left\n    </li>\n    <li>\n      Create another Client ID\n    </li>\n    <li>\n      Enter the branding information and click Next (for Google Apps accounts)\n    <li>\n      Choose \"Web application\" as the type\n    </li>\n    <li>\n      Click \"More options&hellip;\" after \"Your site or hostname\"\n    </li>\n    <li>\n      Set Authorized Redirect URIs to: <span class=\"url\">",["{",[[0,"siteUrl"]]],"_oauth/google?close</span>\n    </li>\n    <li>\n      Set Authorized JavaScript Origins to: <span class=\"url\">",["{",[[0,"siteUrl"]]],"</span>\n    </li>\n    <li>\n      Create client ID\n    </li>\n  </ol>"]));
