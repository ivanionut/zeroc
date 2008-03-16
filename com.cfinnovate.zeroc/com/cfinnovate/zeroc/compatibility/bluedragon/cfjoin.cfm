<cfloop list="#attributes.threads#" index="thread">
	<cfjoin thread="caller.#thread#" />	
</cfloop>