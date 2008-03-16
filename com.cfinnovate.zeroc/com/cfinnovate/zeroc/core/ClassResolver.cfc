<!--- TODO: there is no way this will work in BD but the chances of it changing before release are high so
I am going to keep it as this and working and refactor later to release.  --->
<cfcomponent>
	<cfimport prefix="zeroC" taglib="../tags/" />
	<cfset variables.supportedIdentifiers = 'web,zeroc,action,controller' />
	<cfset variables.applicationPath = "" />
	<cffunction name="init" returntype="any" access="public">
		<cfargument name="appPath" type="string" required="true" />
		<cfargument name="mappings" type="struct" required="false" />
		<cfthread action="run" name="load_classes">
			<cfdirectory action="list" directory="#server.ColdFusion.RootDir#" filter="*.cfc"
				recurse="true" name="APPLICATION.zeroC.classes" />
		</cfthread>
		<cfset variables.applicationPath = arguments.appPath />
		<cfset variables.app_mappings = arguments.mappings />
		<cfset loadClasses() />
		<zeroC:join threads="load_classes" />
		<cfreturn this />
	</cffunction>

	<cfif Server.ColdFusion.ProductName contains "ColdFusion">
		<cfinclude template="../compatibility/coldfusion/mixin_mappings.cfm">
	<cfelse>
		<cfinclude template="../compatibility/bluedragon/mixin_mappings.cfm">
	</cfif>
	
	<cffunction name="loadClasses" returntype="void" access="public" output="true">
		<cfdump var="#getMappings()#" >
	</cffunction>
	









	
	<cffunction name="getSupportedIdentifiers" access="private" output="false">
		<cfreturn variables.supportedIdentifiers />
	</cffunction>
	<cffunction name="normalizePath" access="private" returntype="string" output="false">
		<cfargument name="path" type="string" required="true" />
		<cfscript>
			path = Replace( path, '\', '/', 'ALL' ) ;
			if ( Right(path,1) eq '/' )
				return RemoveChars( path, Len(path), 1 ) ;
			else
				return path ; 
		</cfscript>
	</cffunction>
	<cffunction name="normalizePackage" access="private" returntype="string" output="false">
		<cfargument name="path" type="string" required="true" />
		<cfscript>
			path = replace(replace(path,'/','.','all'),'\','.','all');
			if ( left(path,1) eq '.' )
				return replace(path,'.','') ;
			else
				return path ; 
		</cfscript>
	</cffunction>
	<cffunction name="appendApplicationMappings" access="package" output="false" returntype="array">
		<cfargument name="roots" required="true" type="array" />
		<cfset var map = "" />
		<cfset var tempMapping = "" />
		<cfloop collection="#variables.app_mappings#" item="map">
			<cfset tempMapping = StructNew() />
			<cfset tempMapping.prefix = normalizePackage(map) />
			<cfset tempMapping.physicalPath = normalizePath(Replace(variables.app_mappings[map]
											, "##server.coldfusion.rootdir##"
											, Replace( server.coldfusion.rootdir, '\', '/', 'ALL' )))/>
			<cfset ArrayPrepend( roots, tempMapping ) />
		</cfloop>
		<cfreturn roots />
	</cffunction>
</cfcomponent>