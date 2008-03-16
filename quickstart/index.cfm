<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
  <head><title>My First Stripe</title></head>
  <body>
    <h1>Stripes Calculator</h1>

    Hi, I'm the Stripes Calculator. I can only do addition. Maybe, some day, a nice programmer
    will come along and teach me how to do other things?

    <form action="/examples/quickstart/Calculator.action" focus="">
        <table>
            <tr>
                <td>Number 1:</td>
                <td><input type="text" name="numberOne"/></td>
            </tr>
            <tr>
                <td>Number 2:</td>
                <td><input type="text" name="numberTwo"/></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" name="addition" value="Add"/>                    
                </td>
            </tr>
            <cfoutput >
			<tr>
                <td>Result:</td>
                <td>#Server.ColdFusion.ProductName##viewState.getProperty("result")#</td>
            </tr>
			</cfoutput>
        </table>
    </form>
  </body>
</html>