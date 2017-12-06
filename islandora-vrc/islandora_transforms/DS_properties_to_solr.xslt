<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:foxml="info:fedora/fedora-system:def/foxml#" exclude-result-prefixes="foxml">

    <xsl:template match="/foxml:digitalObject" mode="index_object_datastreams">
        <xsl:param name="prefix">ds.</xsl:param>
        <xsl:param name="suffix">_created</xsl:param>
        <xsl:param name="mime">_mime</xsl:param>
        <xsl:param name="label">_label</xsl:param>
        <xsl:param name="dt">.dt</xsl:param>
        <xsl:param name="t">.t</xsl:param>
        <xsl:param name="s">.s</xsl:param>
        <!-- records that there is a datastream -->
        <xsl:for-each select="foxml:datastream">
            <field name="fedora_datastreams_ms">
                <xsl:value-of select="@ID"/>
            </field>

            <xsl:variable name="id" select="@ID"/>

            <field>
                <xsl:attribute name="name">
                    <xsl:value-of select="concat($prefix, $id, $suffix, $dt)"/>
                </xsl:attribute>
                <xsl:value-of select="foxml:datastreamVersion[last()]/@CREATED"/>
            </field>

            <field>
                <xsl:attribute name="name">
                    <xsl:value-of select="concat($prefix, $id, $mime, $s)"/>
                </xsl:attribute>
                <xsl:value-of select="foxml:datastreamVersion[last()]/@MIMETYPE"/>
            </field>

            <field>
                <xsl:attribute name="name">
                    <xsl:value-of select="concat($prefix, $id, $label, $t)"/>
                </xsl:attribute>
                <xsl:value-of select="foxml:datastreamVersion[last()]/@LABEL"/>
            </field>

        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
