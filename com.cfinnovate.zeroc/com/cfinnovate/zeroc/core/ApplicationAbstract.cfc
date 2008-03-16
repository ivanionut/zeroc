<cfcomponent> 
	<cfproperty name="name" required="true" />
	<cfset this.mappings = structnew() />
	<cffunction name="onApplicationStart">
		<cfset var classPath = "" />
		<cfset var map = "" />
		<cfset APPLICATION.zeroC.WebRoot = getRoot() />
		<cfset APPLICATION.zeroC.ApplicationRoot = getDirectoryFromPath(getMetaData(this).path) />
		<cfset APPLICATION.zeroC.ClassResolver = CreateObject( "component", "com.cfinnovate.zeroc.core.ClassResolver" ).init(APPLICATION.zeroC.ApplicationRoot, this.mappings) />
	</cffunction>
	<cffunction name="onRequest" output="true">
		<cfset viewState = getViewState() />
		<cfinclude template="#arguments[1]#" />
		<cfdump var="#APPLICATION#">
		<CFDUMP Var="#GETmETAdATA(THIS)#">
	</cffunction>
	<cffunction name="getZerocPath" returntype="string">
		<cfthrow type="zeroc.MethodNotImplemented" extendedinfo="getApplicationPath">
	</cffunction>
	<cffunction name="getViewState">
		<cfreturn createObject("component", "com.cfinnovate.zeroc.view.ViewState").init() />
	</cffunction>
	<cffunction name="getRoot">
		<cfreturn expandPath(RepeatString('../',listLen(getMetaData(this).name,'.')-1))>
	</cffunction>
	<cffunction name="onMissingTemplate">
		<cfoutput>
			Here is the template
		</cfoutput>
	</cffunction>
</cfcomponent>