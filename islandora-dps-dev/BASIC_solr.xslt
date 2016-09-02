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
        <xsl:param name="suffix">_mt</xsl:param>

        <!-- DOI, ISSN, ISBN, and any other typed IDs -->
        <xsl:for-each select="mods:identifier[@type][normalize-space(text())]">
            <field>
                <xsl:attribute name="name">
                    <xsl:value-of
                        select="concat($prefix, local-name(), '_', translate(@type, ' ', '_'), $suffix)"
                    />
                </xsl:attribute>
                <xsl:value-of select="text()"/>
            </field>
        </xsl:for-each>

        <!-- Identifier with no type -->
        <xsl:for-each select="mods:identifier[not(@type)][normalize-space(text())]">
            <!--don't bother with empty space-->
            <field>
                <xsl:attribute name="name">
                    <xsl:value-of select="concat($prefix, local-name(), $suffix)"/>
                </xsl:attribute>
                <xsl:value-of select="text()"/>
            </field>
        </xsl:for-each>

        <!-- titleInfo with [@type] -->
        <xsl:for-each select="(mods:titleInfo[@type]/mods:title[normalize-space(text())])">
                    <field>
                        <xsl:attribute name="name">
                            <xsl:value-of
                                select="concat($prefix, 'titleInfo_type_', translate(../@type, ' ', '_'), '_', local-name(), $suffix)"
                            />
                        </xsl:attribute>
                        <xsl:value-of select="text()"/>
                    </field>
        </xsl:for-each>

        <xsl:for-each select="(mods:titleInfo[@type]/mods:subtitle[normalize-space(text())])">
            <field>
                <xsl:attribute name="name">
                    <xsl:value-of
                        select="concat($prefix, 'titleInfo_type_', translate(../@type, ' ', '_'), '_', local-name(), $suffix)"
                    />
                </xsl:attribute>
                <xsl:value-of select="text()"/>
            </field>
        </xsl:for-each>

        <!-- titleInfo [not(@type)] -->
        <xsl:for-each select="(mods:titleInfo[not(@type)]/mods:title[normalize-space(text())])">
                    <field>
                        <xsl:attribute name="name">
                            <xsl:value-of
                                select="concat($prefix, 'titleInfo_', local-name(), $suffix)"/>
                        </xsl:attribute>
                        <xsl:value-of select="text()"/>
                    </field>
        </xsl:for-each>

        <xsl:for-each select="(mods:titleInfo[not(@type)]/mods:subTitle[normalize-space(text())])">
            <field>
                <xsl:attribute name="name">
                    <xsl:value-of select="concat($prefix, 'titleInfo_', local-name(), $suffix)"/>
                </xsl:attribute>
                <xsl:value-of select="text()"/>
            </field>
        </xsl:for-each>

        <!-- MR edits (Creator/Contributor) -->
        <xsl:for-each select="(mods:name[normalize-space(text())])">
            <xsl:variable name="nameLabel" select="@displayLabel"/>
            <xsl:variable name="nameType" select="@type"/>
            <xsl:variable name="nameAuth" select="@authority"/>
        </xsl:for-each>

        <!-- name (namePart)[@type] -->
        <xsl:for-each select="(mods:name/mods:namePart[@type][normalize-space(text())])">
            <field>
                <xsl:attribute name="name">
                    <xsl:value-of
                        select="concat($prefix, local-name(), '_type_', translate(@type, ' ', '_'), $suffix)"
                    />
                </xsl:attribute>
                <xsl:value-of select="text()"/>
            </field>
        </xsl:for-each>

        <!-- name (namePart) noType -->
        <xsl:for-each select="(mods:name/mods:namePart[not(@type)][normalize-space(text())])">
            <field>
                <xsl:attribute name="name">
                    <xsl:value-of
                        select="concat($prefix, local-name(), $suffix)"
                    />
                </xsl:attribute>
                <xsl:value-of select="text()"/>
            </field>
        </xsl:for-each>


        <!-- name (role) -->
        <xsl:for-each select="(mods:name/mods:role[normalize-space(text())])">
            <field>
                <xsl:attribute name="name">
                    <xsl:value-of select="concat($prefix, local-name(), $suffix)"/>
                </xsl:attribute>
                <xsl:value-of select="text()"/>
            </field>
        </xsl:for-each>

        <!-- name (role/roleTerm) -->
        <xsl:for-each select="(mods:name/mods:role/mods:roleTerm[normalize-space(text())])">
            <field>
                <xsl:attribute name="name">
                    <xsl:value-of select="concat($prefix, local-name(), $suffix)"/>
                </xsl:attribute>
                <xsl:value-of select="text()"/>
            </field>
        </xsl:for-each>

        <!-- Genre (a.k.a. specific doctype) -->
        <xsl:for-each select="mods:genre[normalize-space(text())]">
            <xsl:variable name="authority">
                <xsl:choose>
                    <xsl:when test="@authority">
                        <xsl:value-of select="concat('_', @authority)"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>_local_authority</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <field>
                <xsl:attribute name="name">
                    <xsl:value-of select="concat($prefix, local-name(), $authority, $suffix)"/>
                </xsl:attribute>
                <xsl:value-of select="text()"/>
            </field>
        </xsl:for-each>
                     
        <xsl:for-each select="mods:*[normalize-space(text())]">
            <field>
                <xsl:attribute name="name">
                    <xsl:value-of select="concat($prefix, local-name(), $suffix)"/>
                </xsl:attribute>
                <xsl:value-of select="text()"/>
            </field>
        </xsl:for-each>

        <xsl:for-each select="mods:*/mods:*[normalize-space(text())]">
             <field>
                <xsl:attribute name="name">
                    <xsl:value-of select="concat($prefix, name(parent::*), '_', local-name(), $suffix)"/>
                </xsl:attribute>
                <xsl:value-of select="text()"/>
            </field>
        </xsl:for-each>
        
        <xsl:for-each select="mods:*/mods:*/mods:*[normalize-space(text())]">
            <field>
                <xsl:attribute name="name">
                    <xsl:value-of select="concat($prefix, name(parent::*/parent::*), '_', name(parent::*), '_', local-name(), $suffix)"/>
                </xsl:attribute> 
                <xsl:value-of select="text()"/>
            </field>
        </xsl:for-each>

    </xsl:template>
</xsl:stylesheet>
