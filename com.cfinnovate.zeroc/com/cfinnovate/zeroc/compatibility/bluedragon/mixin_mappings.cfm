<cffunction name="getMappings" access="private" >
	<cfset var config_info = xmlParse("#server.ColdFusion.RootDir#WEB-INF\bluedragon\bluedragon.xml")>
	<cfset var roots = arraynew(1) />
	<cfset var mappingIndex = "0" />
	<cfset var tempMapping = structNew() />
	<cfset config_info = config_info.server.cfmappings.mapping />
	<cfloop from="1" to="#arrayLen(config_info)#" index="mappingIndex">
		<cfset tempMapping = StructNew() />
		<cfset tempMapping.prefix = normalizePackage(config_info[mappingIndex].name.xmlText)/>
		<cfset tempMapping.physicalpath = config_info[mappingIndex].directory.xmlText />
		<cfset arrayAppend(roots, tempMapping)>
	</cfloop>
	<cfreturn appendApplicationMappings(roots) />
</cffunction>