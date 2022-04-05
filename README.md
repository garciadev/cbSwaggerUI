# cbSwaggerUI Module

Swagger UI Documentation for ColdBox. It will use the Swagger JSON from the /cbswagger location by default if nothing is configured.

This UI is available at **/cbSwaggerUI** - where you will see a visual representation of your Swagger docs.

This module loads a standalone version of Swagger-UI.

<https://swagger.io/tools/swagger-ui/>

The code can be found at:

<https://github.com/swagger-api/swagger-ui>

This code is based on the basic distribution of the files at

<https://github.com/swagger-api/swagger-ui/tree/master/dist>

This module is a packaged version of that distribution with some settings being configured via Module Settings.

## License

Please see the Swagger UI license at

<https://github.com/swagger-api/swagger-ui/blob/master/LICENSE>

## Important links

<https://github.com/garciadev/cbSwaggerUI>
<https://swagger.io/tools/swagger-ui/>
<https://swagger.io/tools/swagger-ui/>

## Install cbSWaggerUI ( via Commandbox )

box install cbSwaggerUI

> Note:  Omit the `box` from your command, if you are already in the Commandbox interactive shell

## Configuration

If you just want to use this with cbSwagger, there is nothing else to configure (assuming you have cbSwagger installed.)

You can configure the following settings:

**swaggerFiles**

An array of Swagger JSON files. You can either specify an array of one or more URLs or an array of structs with a url and name. If you do not set a value

Default: [ "/cbswagger" ]

Examples:

    "swaggerFiles" : [ "/cbswagger" ]

    "swaggerFiles" : [ "/cbswagger", "https://petstore.swagger.io/v2/swagger.json" ]

    "swaggerFiles" : [
        {url: "/cbswagger", name: "cbswagger"},
        {url: "https://petstore.swagger.io/v2/swagger.json", name: "Petstore"}
    ]

**primaryName**

If setting multiple URLs with names, it will load the matched value by default. If not set it will use the first URL in the SwaggerFiles array.

**deepLinking**

If set to true, enables deep linking for tags and operations.

Default: true

**operationsSorter**

Apply a sort to the operation list of each API. It can be 'alpha' (sort by paths alphanumerically), 'method' (sort by HTTP method) or a function (see Array.prototype.sort() to know how sort function works).

Default: method

**tagsSorter**

Apply a sort to the tag list of each API. It can be 'alpha' (sort by paths alphanumerically) or a function.

Default: alpha

**filter**

If set, enables filtering. The top bar will show an edit box that you can use to filter the tagged operations that are shown.

Default: true

**disableFallback**

There is sometimes an issue where there is an error this error displays even if the Swagger is valid.

"Could not render n, see the console."

Setting this to true will turn off that error via CSS.

Default: true

Example ColdBox.cfc configuration:

    moduleSettings = {
        cbswaggerUI : {
                "swaggerFiles" : [
                    {url: "/cbswagger", name: "cbswagger"},
                    {url: "https://petstore.swagger.io/v2/swagger.json", name: "Petstore"}
                ]
            }
    };
