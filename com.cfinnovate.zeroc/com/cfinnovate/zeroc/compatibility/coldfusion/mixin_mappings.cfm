<cffunction name="getMappings" access="private" >
	<cfreturn appendApplicationMappings(
		createObject("component", "CFIDE.componentutils.cfcexplorer").getComponentRoots()) />
</cffunction>