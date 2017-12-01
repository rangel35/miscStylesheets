<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:foxml="info:fedora/fedora-system:def/foxml#"
    xmlns:mods="http://www.loc.gov/mods/v3" exclude-result-prefixes="mods">

    <xsl:include href="library/xslt-date-template.xslt"/>
    <xsl:include href="manuscript_finding_aid.xslt"/>

    <xsl:template match="foxml:datastream[@ID='MODS']/foxml:datastreamVersion[last()]" name="index_BASIC">
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

        <!-- uri, pid, utldamsPID, fileName, oclcSource, oclcSurrogate, local -->
        <xsl:for-each select="mods:identifier[@type][normalize-space(text())]">
            <field>
                <xsl:attribute name="name">
                    <xsl:value-of select="concat($prefix, local-name(), '_', translate(@type, ' ', '_'), '_mt')"/>
                </xsl:attribute>
                <xsl:value-of select="text()"/>
            </field>
            <field>
                <xsl:attribute name="name">
                    <xsl:value-of select="concat($prefix, local-name(), '_', translate(@type, ' ', '_'), '_ms')"/>
                </xsl:attribute>
                <xsl:value-of select="text()"/>
            </field>
        </xsl:for-each>

        <!-- Title -->
        <xsl:for-each select="(mods:titleInfo[@usage='primary'][1]/mods:title[normalize-space(text())])">
            <field>
                <xsl:attribute name="name">
                    <xsl:value-of select="concat($prefix, local-name(), '_primary_t')"/>
                </xsl:attribute>
                <xsl:value-of select="text()"/>
            </field>
            <field>
                <xsl:attribute name="name">
                    <xsl:value-of select="concat($prefix, local-name(), '_primary_ss')"/>
                </xsl:attribute>
                <xsl:value-of select="text()"/>
            </field>
        </xsl:for-each>

        <!-- name / namePart -->
        <xsl:for-each select="mods:name[@usage='primary'][1]/mods:namePart[normalize-space(text())]">
            <field>
                <xsl:attribute name="name">
                    <xsl:value-of select="concat($prefix, 'name_', local-name(), '_primary_t')"/>
                </xsl:attribute>
                <xsl:value-of select="text()"/>
            </field>
            <field>
                <xsl:attribute name="name">
                    <xsl:value-of select="concat($prefix, 'name_', local-name(), '_primary_ss')"/>
                </xsl:attribute>
                <xsl:value-of select="text()"/>
            </field>
        </xsl:for-each>

        <!-- Date Created -->
        <xsl:for-each select="mods:originInfo/mods:dateCreated[normalize-space(text())]">
            <xsl:choose>
                <xsl:when test="@keyDate='yes'">
                    <field>
                        <xsl:attribute name="name">
                            <xsl:value-of select="concat($prefix, local-name(), '_keyDate_t')"/>
                        </xsl:attribute>
                        <xsl:value-of select="text()"/>
                    </field>
                    <field>
                        <xsl:attribute name="name">
                            <xsl:value-of select="concat($prefix, local-name(), '_keyDate_ss')"/>
                        </xsl:attribute>
                        <xsl:value-of select="text()"/>
                    </field>
                </xsl:when>
                <xsl:otherwise>
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
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>

        <!-- Physical Description / internetMediaType (format) -->
        <xsl:for-each select="mods:physicalDescription/mods:internetMediaType[normalize-space(text())]">
            <field>
                <xsl:attribute name="name">
                    <xsl:value-of select="concat($prefix, 'physicalDescription_', local-name(), '_format_t')"/>
                </xsl:attribute>
                <xsl:value-of select="text()"/>
            </field>
            <field>
                <xsl:attribute name="name">
                    <xsl:value-of select="concat($prefix, 'physicalDescription_', local-name(), '_format_ss')"/>
                </xsl:attribute>
                <xsl:value-of select="text()"/>
            </field>
        </xsl:for-each>

        <!-- relatedItem -->
        <xsl:for-each select="mods:relatedItem[@type]">
            <xsl:variable name="type" select="@type"/>
            <xsl:choose>
                <xsl:when test="@type='source'">
                    <xsl:for-each select="mods:titleInfo/mods:title[normalize-space(text())]">
                        <field>
                            <xsl:attribute name="name">
                                <xsl:value-of
                                    select="concat($prefix, 'relatedItem_titleInfo_', local-name(), '_', $type, '_t')"/>
                            </xsl:attribute>
                            <xsl:value-of select="text()"/>
                        </field>
                        <field>
                            <xsl:attribute name="name">
                                <xsl:value-of
                                    select="concat($prefix, 'relatedItem_titleInfo_', local-name(), '_', $type, '_ss')"
                                />
                            </xsl:attribute>
                            <xsl:value-of select="text()"/>
                        </field>
                    </xsl:for-each>

                    <xsl:for-each select="mods:identifier[@type][normalize-space(text())]">
                        <field>
                            <xsl:attribute name="name">
                                <xsl:value-of
                                    select="concat($prefix, 'relatedItem_', local-name(), '_', translate(@type, ' ', '_'), '_', $type, '_mt')"
                                />
                            </xsl:attribute>
                            <xsl:value-of select="text()"/>
                        </field>
                        <field>
                            <xsl:attribute name="name">
                                <xsl:value-of
                                    select="concat($prefix, 'relatedItem_', local-name(), '_', translate(@type, ' ', '_'), '_', $type, '_ms')"
                                />
                            </xsl:attribute>
                            <xsl:value-of select="text()"/>
                        </field>
                    </xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:for-each select="mods:titleInfo/mods:title[normalize-space(text())]">
                        <field>
                            <xsl:attribute name="name">
                                <xsl:value-of
                                    select="concat($prefix, 'relatedItem_titleInfo_', local-name(), '_', $type, '_mt')"
                                />
                            </xsl:attribute>
                            <xsl:value-of select="text()"/>
                        </field>
                        <field>
                            <xsl:attribute name="name">
                                <xsl:value-of
                                    select="concat($prefix, 'relatedItem_titleInfo_', local-name(), '_', $type, '_ms')"
                                />
                            </xsl:attribute>
                            <xsl:value-of select="text()"/>
                        </field>
                    </xsl:for-each>

                    <xsl:for-each select="mods:identifier[@type][normalize-space(text())]">
                        <field>
                            <xsl:attribute name="name">
                                <xsl:value-of
                                    select="concat($prefix, 'relatedItem_', local-name(), '_', translate(@type, ' ', '_'), '_', $type, '_mt')"
                                />
                            </xsl:attribute>
                            <xsl:value-of select="text()"/>
                        </field>
                        <field>
                            <xsl:attribute name="name">
                                <xsl:value-of
                                    select="concat($prefix, 'relatedItem_', local-name(), '_', translate(@type, ' ', '_'), '_', $type, '_ms')"
                                />
                            </xsl:attribute>
                            <xsl:value-of select="text()"/>
                        </field>
                    </xsl:for-each>

                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>


        <!-- Location (physicalLocation) -->
        <xsl:for-each select="mods:location/mods:physicalLocation[normalize-space(text())]">
            <field>
                <xsl:attribute name="name">
                    <xsl:value-of select="concat($prefix, 'location_', local-name(), '_t')"/>
                </xsl:attribute>
                <xsl:value-of select="text()"/>
            </field>
            <field>
                <xsl:attribute name="name">
                    <xsl:value-of select="concat($prefix, 'location_', local-name(), '_ss')"/>
                </xsl:attribute>
                <xsl:value-of select="text()"/>
            </field>
        </xsl:for-each>

        <!-- generic nesting to capture all fields -->
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
                    <xsl:value-of
                        select="concat($prefix, name(parent::*/parent::*), '_', name(parent::*), '_', local-name(), '_mt')"
                    />
                </xsl:attribute>
                <xsl:value-of select="text()"/>
            </field>
            <field>
                <xsl:attribute name="name">
                    <xsl:value-of
                        select="concat($prefix, name(parent::*/parent::*), '_', name(parent::*), '_', local-name(), '_ms')"
                    />
                </xsl:attribute>
                <xsl:value-of select="text()"/>
            </field>
        </xsl:for-each>

        <xsl:for-each select="mods:*/mods:*/mods:*/mods:*[normalize-space(text())]">
            <field>
                <xsl:attribute name="name">
                    <xsl:value-of
                        select="concat($prefix, name(parent::*/parent::*/parent::*), name(parent::*/parent::*), '_', name(parent::*), '_', local-name(), '_mt')"
                    />
                </xsl:attribute>
                <xsl:value-of select="text()"/>
            </field>
            <field>
                <xsl:attribute name="name">
                    <xsl:value-of
                        select="concat($prefix, name(parent::*/parent::*/parent::*), name(parent::*/parent::*), '_', name(parent::*), '_', local-name(), '_ms')"
                    />
                </xsl:attribute>
                <xsl:value-of select="text()"/>
            </field>
        </xsl:for-each>

    </xsl:template>
</xsl:stylesheet>
