<cfset prc.root = event.getModuleRoot()>
<cfset prc.settings = getModuleSettings( "cbSwaggerUI" )>
<cfset prc.cbox_debugger_show = false>

<cfoutput>
<!-- HTML for static distribution bundle build -->
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>Swagger UI</title>
    <link rel="stylesheet" type="text/css" href="#prc.root#/includes/swagger-ui.css" />
    <link rel="icon" type="image/png" href="#prc.root#/includes/favicon-32x32.png" sizes="32x32" />
    <link rel="icon" type="image/png" href="#prc.root#/includes/favicon-16x16.png" sizes="16x16" />
    <style>
      html
      {
        box-sizing: border-box;
        overflow: -moz-scrollbars-vertical;
        overflow-y: scroll;
      }

      *,
      *:before,
      *:after
      {
        box-sizing: inherit;
      }

      body
      {
        margin:0;
        background: ##fafafa;
      }

      /* TODO: Remove hiding the fallback class once the "Could not render n, see the console." issue is figured out */
      <cfif prc.settings.disableFallback>
        .fallback {
          display: none;
        }
      </cfif>
    </style>
  </head>

  <body>
    <div id="swagger-ui"></div>

    <script src="#prc.root#/includes/swagger-ui-bundle.js" charset="UTF-8"> </script>
    <script src="#prc.root#/includes/swagger-ui-standalone-preset.js" charset="UTF-8"> </script>
    <script>
    window.onload = function() {
      // Begin Swagger UI call region
      const ui = SwaggerUIBundle({

          <cfif prc.settings.swaggerFiles.len() GT 1>
            <cfif isStruct( prc.settings.swaggerFiles[ 1 ] )>
              <cfset swaggerArray = prc.settings.swaggerFiles.map( function( item ){
                  return { "url" : item.url, "name" : item.name };
              })>
            <cfelse>
              <cfset swaggerArray = prc.settings.swaggerFiles.map( function( item ){
                  return { "url" : item, "name" : item };
              })>
            </cfif>
            urls: #serializeJSON( swaggerArray )#,
            "urls.primaryName": "#prc.settings.primaryName#",
          <cfelse>
            url: "#prc.settings.swaggerFiles[ 1 ]#",
          </cfif>

					dom_id: "##swagger-ui",
					deepLinking: #prc.settings.deepLinking#,
					presets: [
						SwaggerUIBundle.presets.apis,
						SwaggerUIStandalonePreset,
					],
					plugins: [SwaggerUIBundle.plugins.DownloadUrl],
					layout: "StandaloneLayout",
					operationsSorter: "#prc.settings.operationsSorter#",
					tagsSorter: "#prc.settings.tagsSorter#",
					filter: #prc.settings.filter#
				});

      // End Swagger UI call region

      window.ui = ui;
    };
  </script>
  </body>
</html>
</cfoutput>