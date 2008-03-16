<!--- 
	Takes care of compatibility between BlueDragon and ColdFusion
--->
<cfparam name="attributes.threads" />
<cfif server.ColdFusion.ProductName contains "ColdFusion">
	<cfthread action="join" name="#attributes.threads#" /> 
<cfelse>
	<cfinclude template="../compatibility/bluedragon/cfjoin.cfm" />
</cfif>
