<cfset caller.this.mappings[attributes.map] = attributes.path>

<cfif server.ColdFusion.ProductName contains "Bluedragon">
	<cfinclude template="../compatibility/bluedragon/cfmap.cfm" />
</cfif>