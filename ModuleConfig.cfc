component {

	// Module Properties
	this.title 				= "cbSwaggerUI";
	this.author 			= "Daniel Garcia";
	this.webURL 			= "https://github.com/garciadev/cbSwaggerUI";
	this.description 		= "Swagger UI Documentation for ColdBox.";
	this.version			= "1.0.0";
	this.entryPoint			= "cbSwaggerUI";
	this.inheritEntryPoint 	= false;
	this.modelNamespace		= "cbSwaggerUI";
	this.cfmapping			= "cbSwaggerUI";
	this.autoMapModels		= true;
	this.dependencies 		= [];

	function configure(){
		settings = {
			"swaggerFiles" : [ "/cbswagger" ],
			"primaryName" : "",
			"deepLinking" : true,
			"operationsSorter" : "method",
			"tagsSorter" : "alpha",
			"filter" : true,
			"disableFallback" : true
		};

		// Layout Settings
		layoutSettings = {
			defaultLayout = "Main.cfm"
		};

		// SES Routes
		router.route( "/" )
			.withHandler( "Main" )
			.toAction( { "GET": "index" } );
	}

	function onLoad(){
	}

	function onUnload(){
	}

}
