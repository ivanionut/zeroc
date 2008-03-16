<cfcomponent extends="projects.zeroC.com.cfinnovate.zeroc.core.ApplicationAbstract"
			zeroC:error="hello">
<cfimport prefix="zeroc" taglib="com/cfinnovate/zeroc/tags">
  	<cfset this.name = createUUID() />
	<zeroc:mapping map="/com/cfinnovate/zeroc" path="#expandPath('com/cfinnovate/zeroc')#">
	<cfset this.applicationtimeout = createTimeSpan(0,0,0,2) />


</cfcomponent> 