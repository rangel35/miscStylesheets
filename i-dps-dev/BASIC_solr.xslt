<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:foxml="info:fedora/fedora-system:def/foxml#"
    xmlns:mods="http://www.loc.gov/mods/v3" exclude-result-prefixes="mods">

    <xsl:include href="library/xslt-date-template.xslt"/>
    <xsl:include href="manuscript_finding_aid.xslt"/>
    
    <xsl:template match="foxml:datastream[@ID='MODS']/foxml:datastreamVersion[last()]"
        name="index_BASIC">
        <xsl:param name="content"/>
        <xsl:param name="prefix">mods_</xsl:param>
        <xsl:param name="suffix">_mt</xsl:param>

        <xsl:apply-templates select="$content//mods:mods">
            <xsl:with-param name="prefix" select="$prefix"/>
            <xsl:with-param name="suffix" select="$suffix"/>
        </xsl:apply-templates>
    </xsl:template>

    <xsl:template match="mods:mods">

        <xsl:param name="prefix">mods_</xsl:param>
        
        <xsl:for-each select="mods:*[normalize-space(text())]">
            <field>
                <xsl:attribute name="name">
                    <xsl:value-of select="concat($prefix, local-name(), '_mt')"/>
                </xsl:attribute>
                <xsl:value-of select="text()"/>
            </field>
            <field>
                <xsl:attribute name="name">
                    <xsl:value-of select="concat($prefix, local-name(), '_ms')"/>
                </xsl:attribute>
                <xsl:value-of select="text()"/>
            </field>
        </xsl:for-each>

        <xsl:for-each select="mods:*/mods:*[normalize-space(text())]">
            <field>
                <xsl:attribute name="name">
                    <xsl:value-of select="concat($prefix, name(parent::*), '_', local-name(), '_mt')"/>
                </xsl:attribute>
                <xsl:value-of select="text()"/>
            </field>
            <field>
                <xsl:attribute name="name">
                    <xsl:value-of select="concat($prefix, name(parent::*), '_', local-name(), '_ms')"/>
                </xsl:attribute>
                <xsl:value-of select="text()"/>
            </field>
        </xsl:for-each>
        
        <xsl:for-each select="mods:*/mods:*/mods:*[normalize-space(text())]">
            <field>
                <xsl:attribute name="name">
                    <xsl:value-of select="concat($prefix, name(parent::*/parent::*), '_', name(parent::*), '_', local-name(), '_mt')"/>
                </xsl:attribute>
                <xsl:value-of select="text()"/>
            </field>
            <field>
                <xsl:attribute name="name">
                    <xsl:value-of select="concat($prefix, name(parent::*/parent::*), '_', name(parent::*), '_', local-name(), '_ms')"/>
                </xsl:attribute>
                <xsl:value-of select="text()"/>
            </field>
        </xsl:for-each>
        
        <xsl:for-each select="mods:*/mods:*/mods:*/mods:*[normalize-space(text())]">
            <field>
                <xsl:attribute name="name">
                    <xsl:value-of select="concat($prefix, name(parent::*/parent::*/parent::*), name(parent::*/parent::*), '_', name(parent::*), '_', local-name(), '_mt')"/>
                </xsl:attribute>
                <xsl:value-of select="text()"/>
            </field>
            <field>
                <xsl:attribute name="name">
                    <xsl:value-of select="concat($prefix, name(parent::*/parent::*/parent::*), name(parent::*/parent::*), '_', name(parent::*), '_', local-name(), '_ms')"/>
                </xsl:attribute>
                <xsl:value-of select="text()"/>
            </field>
        </xsl:for-each>
        
    </xsl:template>
</xsl:stylesheet>
