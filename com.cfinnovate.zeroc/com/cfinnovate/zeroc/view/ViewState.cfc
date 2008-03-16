<cfcomponent name="ViewState" output="false" >
	
	<cffunction name="init" returntype="any" output="false">
		<cfreturn this />
	</cffunction>
	<cffunction name="getProperty" access="public" output="false" returntype="any"
				hint="default property return">
		<cfargument name="property" required="true" type="string" />
		<cftry>
			<cfreturn variables[arguments.property] />
			<cfcatch type="any">
				<cftry>
					<cfreturn this[arguments.property] />
					<cfcatch type="any">
						<cfreturn "" />
					</cfcatch>
				</cftry>
			</cfcatch>
		</cftry>
	</cffunction>
	
	<cffunction name="setProperty" access="public" output="false" returntype="any"
				hint="default property return">
		<cfargument name="property" required="true" type="true" />
		<cfargument name="value" required="true" type="true" />
		<cfargument name="copy" required="false" default="false" />
		<cfif NOT arguments.copy>
			<cfset variables[arguments.property] =  arguments.value />
		<cfelse>
			<cfset variables[arguments.property] = duplicate(arguments.value) />
		</cfif>
		<cfreturn this />
	</cffunction>
</cfcomponent>