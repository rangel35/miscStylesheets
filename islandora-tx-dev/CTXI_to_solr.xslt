<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:foxml="info:fedora/fedora-system:def/foxml#"
  xmlns:mods="http://www.loc.gov/mods/v3" exclude-result-prefixes="mods">

  <xsl:template match="foxml:datastream[@ID='MODS']/foxml:datastreamVersion[last()]"
    name="index_CTXI">
    <xsl:param name="content"/>
    <xsl:param name="prefix">mods_</xsl:param>
    <xsl:param name="suffix">_ms</xsl:param>

    <xsl:apply-templates select="$content//mods:mods[1]">
      <xsl:with-param name="prefix" select="$prefix"/>
      <xsl:with-param name="suffix" select="$suffix"/>
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="mods:mods">
    <xsl:param name="prefix">mods_</xsl:param>
    <xsl:param name="suffix">_ms</xsl:param>

    <!-- DOI, ISSN, ISBN, and any other typed IDs -->
    <xsl:for-each select="mods:identifier[@type][normalize-space(text())]">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, local-name(), '_', translate(@type, ' ', '_'), $suffix)"/>
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
    <xsl:for-each select="(mods:titleInfo[@type]/mods:title[normalize-space(text())])[1]">
      <xsl:choose>
        <xsl:when test="@supplied='no'">
          <field>
            <xsl:attribute name="name">
              <xsl:value-of
                select="concat($prefix, 'titleInfo_type_', translate(../@type, ' ', '_'), '_', local-name(), '_supplied_no', $suffix)"
              />
            </xsl:attribute>
            <xsl:value-of select="text()"/>
          </field>
        </xsl:when>
        <xsl:when test="@supplied='yes'">
          <field>
            <xsl:attribute name="name">
              <xsl:value-of
                select="concat($prefix, 'titleInfo_type_', translate(../@type, ' ', '_'), '_', local-name(), '_supplied_yes', $suffix)"
              />
            </xsl:attribute>
            <xsl:value-of select="text()"/>
          </field>

        </xsl:when>
        <xsl:otherwise>
          <field>
            <xsl:attribute name="name">
              <xsl:value-of
                select="concat($prefix, 'titleInfo_type_', translate(../@type, ' ', '_'), '_', local-name(), $suffix)"
              />
            </xsl:attribute>
            <xsl:value-of select="text()"/>
          </field>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>

    <xsl:for-each select="(mods:titleInfo[@type]/mods:subtitle[normalize-space(text())])[1]">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'titleInfo_type_', translate(../@type, ' ', '_'), '_', local-name(), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <xsl:for-each select="(mods:titleInfo[@type]/mods:partNumber[normalize-space(text())])[1]">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'titleInfo_type_', translate(../@type, ' ', '_'), '_', local-name(), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <xsl:for-each select="(mods:titleInfo[@type]/mods:part_name[normalize-space(text())])[1]">
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
    <xsl:for-each select="(mods:titleInfo[not(@type)]/mods:title[normalize-space(text())])[1]">
      <xsl:choose>
        <xsl:when test="@supplied='no'">
          <field>
            <xsl:attribute name="name">
              <xsl:value-of
                select="concat($prefix, 'titleInfo_', local-name(), '_supplied_no', $suffix)"/>
            </xsl:attribute>
            <xsl:value-of select="text()"/>
          </field>
        </xsl:when>
        <xsl:when test="@supplied='yes'">
          <field>
            <xsl:attribute name="name">
              <xsl:value-of
                select="concat($prefix, 'titleInfo_', local-name(), '_supplied_yes', $suffix)"/>
            </xsl:attribute>
            <xsl:value-of select="text()"/>
          </field>

        </xsl:when>
        <xsl:otherwise>
          <field>
            <xsl:attribute name="name">
              <xsl:value-of select="concat($prefix, 'titleInfo_', local-name(), $suffix)"/>
            </xsl:attribute>
            <xsl:value-of select="text()"/>
          </field>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>

    <xsl:for-each select="(mods:titleInfo[not(@type)]/mods:subTitle[normalize-space(text())])[1]">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of select="concat($prefix, 'titleInfo_', local-name(), $suffix)"/>
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <xsl:for-each select="(mods:titleInfo[not(@type)]/mods:partNumber[normalize-space(text())])[1]">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of select="concat($prefix, 'titleInfo_', local-name(), $suffix)"/>
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <xsl:for-each select="(mods:titleInfo[not(@type)]/mods:partName[normalize-space(text())])[1]">
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

    <!--    <!-\- name (namePart)[@type] -\->
    <xsl:for-each select="(mods:name/mods:namePart[@type][normalize-space(text())])">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of select="concat($prefix, local-name(), '_authority_', translate(@authority, ' ', '_'), '_type_', translate(@type, ' ', '_'), local-name(), '_type_', translate(@type, ' ', '_'), $suffix)"/>
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>
    
    <!-\- name (namePart) noType -\->
    <xsl:for-each select="(mods:name/mods:namePart[not(@type)][normalize-space(text())])">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of select="concat($prefix, 'name_displayLabel_', $nameLable, '_authority_', $nameAuth, '_type_', $nameType, local-name(), $suffix)"/>
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>
-->

    <!-- name (namePart)[@type] -->
    <xsl:for-each select="(mods:name/mods:namePart[@type][normalize-space(text())])">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, local-name(), '_displayLabel_', translate(../@displayLabel, ' ', '_'), '_authority_', translate(../@authority, ' ', '_'), local-name(), '_type_', translate(@type, ' ', '_'), $suffix)"
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
            select="concat($prefix, local-name(), '_displayLabel_', translate(../@displayLabel, ' ', '_'), '_authority_', translate(../@authority, ' ', '_'), '_type_', translate(../@type, ' ', '_'), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>


    <!-- name (role) -->
    <xsl:for-each select="(mods:name/mods:role[normalize-space(text())])">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, local-name(), '_authority_', translate(@authority, ' ', '_'), '_type_', translate(@type, ' ', '_'), local-name(), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- name (role/roleTerm) -->
    <xsl:for-each select="(mods:name/mods:role/mods:roleTerm[normalize-space(text())])">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, local-name(), '_authority_', translate(@authority, ' ', '_'), '_type_', translate(@type, ' ', '_'), '_role_', local-name(), '_authority_', translate(@authority, ' ', '_'), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>


    <!-- Abstract -->
    <xsl:for-each select="mods:abstract[normalize-space(text())]">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of select="concat($prefix, local-name(), $suffix)"/>
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- Resource Type (a.k.a. broad doctype) -->
    <xsl:for-each select="mods:typeOfResource[normalize-space(text())]">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of select="concat($prefix, 'resource_type', $suffix)"/>
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- Physical Description -->
    <xsl:for-each select="mods:physicalDescription[normalize-space(text())]">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of select="concat($prefix, local-name(), $suffix)"/>
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- Genre -->
    <xsl:for-each select="mods:genre[normalize-space(text())]">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of select="concat($prefix, local-name(), $suffix)"/>
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>
    
    <!-- Physical Description (form) -->
    <xsl:for-each select="mods:physicalDescription/mods:form[@type][normalize-space(text())]">
      <!--don't bother with empty space-->
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'physical_description_', local-name(), '_', translate(@type, ' ', '_'), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- Physical Description (note) -->
    <xsl:for-each select="mods:physicalDescription/mods:note[@type][normalize-space(text())]">
      <!--don't bother with empty space-->
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'physical_description_', local-name(), '_', translate(@type, ' ', '_'), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- Physical Description (extent) -->
    <xsl:for-each select="mods:physicalDescription/mods:extent[normalize-space(text())]">
      <!--don't bother with empty space-->
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'physical_description_', local-name(), '_', $suffix)"/>
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- Physical Description (digitalOrigin) -->
    <xsl:for-each select="mods:physicalDescription/mods:digitalOrigin[normalize-space(text())]">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of select="concat($prefix, 'physical_description_', local-name(), $suffix)"/>
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- Physical Description (reformattingQuality) -->
    <xsl:for-each
      select="mods:physicalDescription/mods:reformattingQuality[normalize-space(text())]">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of select="concat($prefix, 'physical_description_', local-name(), $suffix)"/>
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- Location -->
    <xsl:for-each select="mods:location[normalize-space(text())]">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of select="concat($prefix, local-name(), $suffix)"/>
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- Location (physicalLocation) -->
    <xsl:for-each select="mods:location/mods:physicalLocation[normalize-space(text())]">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of select="concat($prefix, 'location_', local-name(), $suffix)"/>
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- Location (holdingSimple) -->
    <xsl:for-each select="mods:location/mods:holdingSimple[normalize-space(text())]">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of select="concat($prefix, 'location_', local-name(), $suffix)"/>
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- Location (holdingSimple/copyInformation) -->
    <xsl:for-each
      select="mods:location/mods:holdingSimple/mods:copyInformation[normalize-space(text())]">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of select="concat($prefix, 'location_holdingSimple_', local-name(), $suffix)"/>
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- Location (holdingSimple/copyInformation/subLocation) -->
    <xsl:for-each
      select="mods:location/mods:holdingSimple/mods:copyInformation/mods:subLocation[normalize-space(text())]">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'location_holdingSimple__copyInformation_', local-name(), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>


    <!-- Location (note) -->
    <xsl:for-each select="mods:location/mods:note[@type][normalize-space(text())]">
      <!--don't bother with empty space-->
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'location_', local-name(), '_', translate(@type, ' ', '_'), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- relatedItem -->
    <xsl:for-each select="mods:relatedItem[@type][normalize-space(text())]">
      <!--don't bother with empty space-->
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, local-name(), '_', translate(@type, ' ', '_'), $suffix)"/>
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- Notes -->
    <xsl:for-each select="mods:note[@type][normalize-space(text())]">
      <!--don't bother with empty space-->
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, local-name(), '_', translate(@type, ' ', '_'), $suffix)"/>
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- accessCondition -->
    <xsl:for-each select="mods:accessCondition[@type][normalize-space(text())]">
      <!--don't bother with empty space-->
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, local-name(), '_', translate(@type, ' ', '_'), $suffix)"/>
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- accessCondition name -->
    <xsl:for-each select="(mods:accessCondition/mods:name[normalize-space(text())])">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'accessCondition_', local-name(), '_authority_', translate(@authority, ' ', '_'), '_type_', translate(@type, ' ', '_'), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- accessCondition name (namePart)[@type] -->
    <xsl:for-each
      select="(mods:accessCondition/mods:name/mods:namePart[@type][normalize-space(text())])">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'accessCondition_', local-name(), '_authority_', translate(@authority, ' ', '_'), '_type_', translate(@type, ' ', '_'), local-name(), '_type_', translate(@type, ' ', '_'), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- accessCondition name (namePart) noType -->
    <xsl:for-each
      select="(mods:accessCondition/mods:name/mods:namePart[not(@type)][normalize-space(text())])">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'accessCondition_', local-name(), '_authority_', translate(@authority, ' ', '_'), '_type_', translate(@type, ' ', '_'), local-name(), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- accessCondition name (role) -->
    <xsl:for-each select="(mods:accessCondition/mods:name/mods:role[normalize-space(text())])">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'accessCondition_', local-name(), '_authority_', translate(@authority, ' ', '_'), '_type_', translate(@type, ' ', '_'), local-name(), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- accessCondition name (role/roleTerm) -->
    <xsl:for-each
      select="(mods:accessCondition/mods:name/mods:role/mods:roleTerm[normalize-space(text())])">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'accessCondition_', local-name(), '_authority_', translate(@authority, ' ', '_'), '_type_', translate(@type, ' ', '_'), '_role_', local-name(), '_authority_', translate(@authority, ' ', '_'), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- originInfo -->
    <xsl:for-each select="mods:originInfo[normalize-space(text())]">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of select="concat($prefix, local-name(), $suffix)"/>
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- originInfo (place) -->
    <xsl:for-each select="mods:originInfo/mods:place[normalize-space(text())]">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of select="concat($prefix, 'originInfo_', local-name(), $suffix)"/>
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- originInfo (place/placeTerm) -->
    <xsl:for-each select="mods:originInfo/mods:place/mods:placeTerm[normalize-space(text())]">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of select="concat($prefix, 'originInfo_place_', local-name(), $suffix)"/>
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- originInfo (publisher) -->
    <xsl:for-each select="mods:originInfo/mods:publisher[normalize-space(text())]">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of select="concat($prefix, 'originInfo_', local-name(), $suffix)"/>
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- originInfo (dateIssued) -->
    <xsl:for-each select="mods:originInfo/mods:dateIssued[@qualifier][normalize-space(text())]">
      <!--don't bother with empty space-->
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'originInfo_', local-name(), '_', translate(@qualifier, ' ', '_'), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- originInfo (dateCreated) -->
    <xsl:for-each select="mods:originInfo/mods:dateCreated[@qualifier][normalize-space(text())]">
      <!--don't bother with empty space-->
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'originInfo_', local-name(), '_', translate(@qualifier, ' ', '_'), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- originInfo (note) -->
    <xsl:for-each select="mods:originInfo/mods:note[@type][normalize-space(text())]">
      <!--don't bother with empty space-->
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'originInfo_', local-name(), '_', translate(@type, ' ', '_'), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- language -->
    <xsl:for-each select="mods:language[normalize-space(text())]">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of select="concat($prefix, local-name(), $suffix)"/>
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- language (languageTerm) -->
    <xsl:for-each select="mods:language/mods:languageTerm[@type][normalize-space(text())]">
      <!--don't bother with empty space-->
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'language_', local-name(), '_', translate(@type, ' ', '_'), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- subject  -->
    <xsl:for-each select="(mods:subject[normalize-space(text())])">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, local-name(), '_authority_', translate(@authority, ' ', '_'), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- subject (hierarchicalGeographic) -->
    <xsl:for-each select="(mods:subject/mods:hierarchicalGeographic[normalize-space(text())])">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'subject_authority_', translate(../@authority, ' ', '_'), local-name(), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- subject (hierarchicalGeographic/continent) -->
    <xsl:for-each
      select="(mods:subject/mods:hierarchicalGeographic/mods:continent[normalize-space(text())])">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'subject_authority_', translate(../@authority, ' ', '_'), '_hierarchicalGeographic_', local-name(), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- subject (hierarchicalGeographic/country) -->
    <xsl:for-each
      select="(mods:subject/mods:hierarchicalGeographic/mods:country[normalize-space(text())])">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'subject_authority_', translate(../@authority, ' ', '_'), '_hierarchicalGeographic_', local-name(), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- subject (hierarchicalGeographic/province) -->
    <xsl:for-each
      select="(mods:subject/mods:hierarchicalGeographic/mods:province[normalize-space(text())])">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'subject_authority_', translate(../@authority, ' ', '_'), '_hierarchicalGeographic_', local-name(), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- subject (hierarchicalGeographic/region) -->
    <xsl:for-each
      select="(mods:subject/mods:hierarchicalGeographic/mods:region[normalize-space(text())])">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'subject_authority_', translate(../@authority, ' ', '_'), '_hierarchicalGeographic_', local-name(), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- subject (hierarchicalGeographic/state) -->
    <xsl:for-each
      select="(mods:subject/mods:hierarchicalGeographic/mods:state[normalize-space(text())])">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'subject_authority_', translate(../@authority, ' ', '_'), '_hierarchicalGeographic_', local-name(), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- subject (hierarchicalGeographic/territory) -->
    <xsl:for-each
      select="(mods:subject/mods:hierarchicalGeographic/mods:territory[normalize-space(text())])">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'subject_authority_', translate(../@authority, ' ', '_'), '_hierarchicalGeographic_', local-name(), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- subject (hierarchicalGeographic/county) -->
    <xsl:for-each
      select="(mods:subject/mods:hierarchicalGeographic/mods:county[normalize-space(text())])">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'subject_authority_', translate(../@authority, ' ', '_'), '_hierarchicalGeographic_', local-name(), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- subject (hierarchicalGeographic/city) -->
    <xsl:for-each
      select="(mods:subject/mods:hierarchicalGeographic/mods:city[normalize-space(text())])">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'subject_authority_', translate(../@authority, ' ', '_'), '_hierarchicalGeographic_', local-name(), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- subject (hierarchicalGeographic/citySection) -->
    <xsl:for-each
      select="(mods:subject/mods:hierarchicalGeographic/mods:citySection[normalize-space(text())])">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'subject_authority_', translate(../@authority, ' ', '_'), '_hierarchicalGeographic_', local-name(), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- subject (hierarchicalGeographic/island) -->
    <xsl:for-each
      select="(mods:subject/mods:hierarchicalGeographic/mods:island[normalize-space(text())])">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'subject_authority_', translate(../@authority, ' ', '_'), '_hierarchicalGeographic_', local-name(), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- subject (hierarchicalGeographic/area) -->
    <xsl:for-each
      select="(mods:subject/mods:hierarchicalGeographic/mods:area[normalize-space(text())])">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'subject_authority_', translate(../@authority, ' ', '_'), '_hierarchicalGeographic_', local-name(), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- subject (hierarchicalGeographic/extraterrestrialArea) -->
    <xsl:for-each
      select="(mods:subject/mods:hierarchicalGeographic/mods:extraterrestrialArea[normalize-space(text())])">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'subject_authority_', translate(../@authority, ' ', '_'), '_hierarchicalGeographic_', local-name(), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- subject (name) -->
    <xsl:for-each select="(mods:subject/mods:name[normalize-space(text())])">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'subject_authority_', translate(../@authority, ' ', '_'), local-name(), '_type_', translate(@type, ' ', '_'), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- subject (name/namePart) -->
    <xsl:for-each select="(mods:subject/mods:name/mods:namePart[@type][normalize-space(text())])">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'subject_authority_', translate(../../@authority, ' ', '_'), '_name_', translate(../@type, ' ', '_'), local-name(), '_type_', translate(@type, ' ', '_'), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- subject (name/namePart) -->
    <xsl:for-each
      select="(mods:subject/mods:name/mods:namePart[not(@type)][normalize-space(text())])">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'subject_authority_', translate(../../@authority, ' ', '_'), '_name_', translate(../@type, ' ', '_'), local-name(), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- subject (name/role) -->
    <xsl:for-each select="(mods:subject/mods:name/mods:role[normalize-space(text())])">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'subject_authority_', translate(../../@authority, ' ', '_'), '_name_', translate(../@type, ' ', '_'), local-name(), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- subject (name/role/roleTerm) -->
    <xsl:for-each select="(mods:subject/mods:name/mods:role/mods:roleTerm[normalize-space(text())])">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'subject_authority_', translate(../../@authority, ' ', '_'), '_name_', translate(../@type, ' ', '_'), '_role_', local-name(), '_authority_', translate(@authority, ' ', '_'), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- subject (genre) -->
    <xsl:for-each select="(mods:subject/mods:genre[normalize-space(text())])">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'subject_authority_', translate(../@authority, ' ', '_'), local-name(), '_type_', translate(@type, ' ', '_'), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- subject (topic) -->
    <xsl:for-each select="(mods:subject/mods:topic[normalize-space(text())])">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'subject_authority_', translate(../@authority, ' ', '_'), local-name(), '_type_', translate(@type, ' ', '_'), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- subject Date (temporal) -->
    <xsl:for-each select="(mods:subject/mods:temporal[not(@point)][not(@authority)][normalize-space(text())])">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of select="concat($prefix, 'subject_', local-name(), $suffix)"/>
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>
    
    <!-- subject Time Period (temporal) -->
    <xsl:for-each select="(mods:subject/mods:temporal[@authority][normalize-space(text())])">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of select="concat($prefix, 'subject_authority_', translate(@authority, ' ', '_'), local-name(), $suffix)"/>
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>
    
    <!-- subject Start/End Date (temporal) -->
    <xsl:for-each select="(mods:subject/mods:temporal[@point][normalize-space(text())])">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of select="concat($prefix, 'subject_', local-name(), '_point_', translate(@point, ' ', '_'), $suffix)"/>
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>
    
    
    <!-- 
    
    Advanced Search Facets begin here
    Changes made by Nate
    02-08-2017
    
     --> 
     
    <!-- Title -->
    <xsl:for-each select="mods:titleInfo/mods:title[normalize-space(text())]">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of select="concat($prefix, 'titleInfo_', local-name(), $suffix)"/>
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>
    
    <!-- Creator or Contributor-->
    <xsl:for-each select="(mods:name/mods:namePart[normalize-space(text())])">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, local-name(), '_displayLabel_', translate(../@displayLabel, ' ', '_'), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>
 
    <!-- Subject Name -->
    <xsl:for-each select="(mods:subject/mods:name/mods:namePart[normalize-space(text())])">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'subject_', local-name(), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>
    
    <!-- Subject Topic -->
    <xsl:for-each select="(mods:subject/mods:topic[normalize-space(text())])">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'subject_', local-name(), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>
    
    <!-- Subject Genre -->
    <xsl:for-each select="(mods:subject/mods:genre[normalize-space(text())])">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'subject_', local-name(), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>
    
    <!-- dateIssued and dateCreated -->
    <xsl:for-each select="mods:originInfo/*[self::mods:dateIssued or self::mods:dateCreated][normalize-space(text())]">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'originInfo_', local-name(), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

    <!-- dateIssued -->
    <xsl:for-each select="mods:originInfo/mods:dateIssued[normalize-space(text())]">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'originInfo_', local-name(), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>
    
    <!-- dateCreated -->
    <xsl:for-each select="mods:originInfo/mods:dateCreated[normalize-space(text())]">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of
            select="concat($prefix, 'originInfo_', local-name(), $suffix)"
          />
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>
    </xsl:for-each>

  </xsl:template>
</xsl:stylesheet>
