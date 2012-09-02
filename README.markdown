A utility for Symphony CMS that proportionally resizes an image using JIT only if the image is larger than the given size.

Original by Andrey Lubinov (andrrr).

## Example usage

	<xsl:call-template name="smart-resize-image">
		<xsl:with-param name="xml" select="image"/>
		<xsl:with-param name="max-w" select="640"/>
		<xsl:with-param name="max-h" select="480"/>
		<xsl:with-param name="alt" select="title"/> <!-- (optional) -->
		<xsl:with-param name="class" select="'entry-img'"/> <!-- (optional) -->
	</xsl:call-template>
