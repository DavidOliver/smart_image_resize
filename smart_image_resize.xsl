<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="smart-resize-image">

	<xsl:param name="xml" /> <!-- incoming XML node -->
	<xsl:param name="max-w" select="300"/> <!-- max width (default = 300) -->
	<xsl:param name="max-h" select="400"/> <!-- max height (default = 400) -->
	<xsl:param name="alt" select="''"/> <!-- alt value (optional, default = '') -->
	<xsl:param name="class" /> <!-- class (optional) -->

	<!-- determining longest edge of image -->
	<xsl:variable name="long-edge">
		<xsl:choose>
			<xsl:when test="$xml/meta/@width &gt;= $xml/meta/@height">w</xsl:when>
			<xsl:otherwise>h</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<!-- image result -->  
	<xsl:element name="img">
	
		<!-- src value depending on biggest size and limits -->
		<xsl:attribute name="src">
			<xsl:choose>
				<xsl:when test="($long-edge = 'w') and ($xml/meta/@width &gt; $max-w)">
					<xsl:value-of select="concat('/image/1/', $max-w,'/0/0', $xml/@path, '/', $xml/filename)"/>
				</xsl:when>
				<xsl:when test="($long-edge = 'h') and ($xml/meta/@height &gt; $max-h)">
					<xsl:value-of select="concat('/image/1/0/', $max-h,'/0', $xml/@path, '/', $xml/filename)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="concat('/workspace', $xml/@path, '/', $xml/filename)"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>

		<xsl:attribute name="alt">
			<xsl:value-of select="$alt"/>
		</xsl:attribute>

		<xsl:if test="$class">
			<xsl:attribute name="class">
				<xsl:value-of select="$class"/>
			</xsl:attribute>  
		</xsl:if>
		
	</xsl:element>

</xsl:template>

</xsl:stylesheet>

