<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:foxml="info:fedora/fedora-system:def/foxml#">

  <xsl:template match="foxml:datastream[@ID='VRC']/foxml:datastreamVersion[last()]">
    <xsl:param name="content"/>
    <xsl:param name="prefix">vrc.</xsl:param>
    <xsl:param name="suffix"/>

    <xsl:apply-templates select="$content/document">
      <xsl:with-param name="prefix" select="$prefix"/>
      <xsl:with-param name="suffix" select="$suffix"/>
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="document">
    <xsl:param name="prefix">vrc.</xsl:param>
    <xsl:param name="suffix"/>

    <!-- <xsl:value-of select="general" /> -->
    <xsl:apply-templates select="general"/>
    <xsl:apply-templates select="image | work"/>
  </xsl:template>

  <xsl:template match="general">
    <xsl:param name="prefix">vrc.</xsl:param>
    <xsl:param name="suffix"/>
    <xsl:param name="idsuffix">.id</xsl:param>

    <xsl:for-each select="./*">

      <xsl:if test="local-name() = 'cat1'">
        <field>
          <xsl:attribute name="name">
            <xsl:value-of select="concat($prefix, local-name(), $suffix)"/>
          </xsl:attribute>
          <xsl:value-of select="text()"/>
        </field>
      </xsl:if>

      <xsl:if test="local-name() = 'cat2'">
        <field>
          <xsl:attribute name="name">
            <xsl:value-of select="concat($prefix, local-name(), $suffix)"/>
          </xsl:attribute>
          <xsl:value-of select="text()"/>
        </field>
      </xsl:if>

      <xsl:if test="local-name() = 'cat3'">
        <field>
          <xsl:attribute name="name">
            <xsl:value-of select="concat($prefix, local-name(), $suffix)"/>
          </xsl:attribute>
          <xsl:value-of select="text()"/>
        </field>
      </xsl:if>

      <xsl:if test="local-name() = 'boxName'">
        <field>
          <xsl:attribute name="name">
            <xsl:value-of select="concat($prefix, local-name(), $suffix)"/>
          </xsl:attribute>
          <xsl:value-of select="text()"/>
        </field>
      </xsl:if>

      <xsl:if test="local-name() = 'migrateID'">
        <field>
          <xsl:attribute name="name">
            <xsl:value-of select="concat($prefix, local-name(), $suffix)"/>
          </xsl:attribute>
          <xsl:value-of select="text()"/>
        </field>
      </xsl:if>

      <xsl:if test="local-name() = 'itemNum'">
        <field>
          <xsl:attribute name="name">
            <xsl:value-of select="concat($prefix, local-name(), $suffix)"/>
          </xsl:attribute>
          <xsl:value-of select="text()"/>
        </field>
      </xsl:if>

      <xsl:if test="local-name() = 'itemNumber'">
        <field>
          <xsl:attribute name="name">
            <xsl:value-of select="concat($prefix, local-name(), $suffix)"/>
          </xsl:attribute>
          <xsl:value-of select="text()"/>
        </field>
      </xsl:if>

      <xsl:if test="local-name() = 'mainEntry'">
        <field>
          <xsl:attribute name="name">
            <xsl:value-of select="concat($prefix, local-name(), $suffix)"/>
          </xsl:attribute>
          <xsl:value-of select="text()"/>
        </field>
      </xsl:if>

      <xsl:if test="local-name() = 'adminNotes'">
        <field>
          <xsl:attribute name="name">
            <xsl:value-of select="concat($prefix, local-name(), $suffix)"/>
          </xsl:attribute>
          <xsl:value-of select="text()"/>
        </field>
      </xsl:if>

      <xsl:if test="local-name() = 'serialNumber'">
        <field>
          <xsl:attribute name="name">
            <xsl:value-of select="concat($prefix, local-name(), $suffix)"/>
          </xsl:attribute>
          <xsl:value-of select="text()"/>
        </field>
      </xsl:if>

      <xsl:if test="local-name() = 'orderRecord'">
        <field>
          <xsl:attribute name="name">
            <xsl:value-of select="concat($prefix, 'order_record', $suffix)"/>
          </xsl:attribute>
          <xsl:value-of select="text()"/>
        </field>
        <xsl:if test="string-length(@refid) > 0">
          <field>
            <xsl:attribute name="name">
              <xsl:value-of select="concat($prefix, 'order_record', $idsuffix)"/>
            </xsl:attribute>
            <xsl:value-of select="@refid"/>
          </field>
        </xsl:if>
      </xsl:if>

      <!-- VRC users -->
      <xsl:if
        test="contains(local-name(), 'vrcstaff') or contains(local-name(), 'reviewer') or contains(local-name(), 'modifiedby')">
        <field>
          <xsl:attribute name="name">
            <xsl:value-of select="concat($prefix, local-name(), $suffix)"/>
          </xsl:attribute>
          <xsl:value-of select="text()"/>
        </field>

        <xsl:if test="string-length(@refid) > 0">
          <field>
            <xsl:attribute name="name">
              <xsl:value-of select="concat($prefix, local-name(), $idsuffix)"/>
            </xsl:attribute>
            <xsl:value-of select="@refid"/>
          </field>
        </xsl:if>

      </xsl:if>

      <!-- VRC dates -->
      <xsl:if test="contains(local-name(), 'date')">
        <!-- one date type is creation-->
        <xsl:if test="@type = 'creation'">
          <field>
            <xsl:attribute name="name">
              <xsl:value-of select="concat($prefix, 'date.creation', $suffix)"/>
            </xsl:attribute>
            <xsl:value-of select="text()"/>
          </field>
        </xsl:if>

        <!-- one date type is modified-->
        <xsl:if test="@type = 'modified'">
          <field>
            <xsl:attribute name="name">
              <xsl:value-of select="concat($prefix, 'date.modified', $suffix)"/>
            </xsl:attribute>
            <xsl:value-of select="text()"/>
          </field>
        </xsl:if>

        <!-- one date type is reviewed-->
        <xsl:if test="@type = 'reviewed'">
          <field>
            <xsl:attribute name="name">
              <xsl:value-of select="concat($prefix, 'date.reviewed', $suffix)"/>
            </xsl:attribute>
            <xsl:value-of select="text()"/>
          </field>
        </xsl:if>

      </xsl:if>

      <!-- VRC Identifiers -->
      <xsl:if test="contains(local-name(), 'identifier')">

        <!-- one identifier is the work record id -->
        <xsl:if test="@type = 'work record id'">
          <xsl:variable name="type" select="translate( @type, ' ', '_')"/>
          <field>
            <xsl:attribute name="name">
              <xsl:value-of select="concat($prefix, $type, $suffix)"/>
            </xsl:attribute>
            <xsl:value-of select="text()"/>
          </field>
        </xsl:if>

        <!-- one identifier is the accession number -->
        <xsl:if test="@type = 'analog accession number'">
          <xsl:variable name="type" select="translate( @type, ' ', '_')"/>
          <field>
            <xsl:attribute name="name">
              <xsl:value-of select="concat($prefix,$type, $suffix)"/>
            </xsl:attribute>
            <xsl:value-of select="text()"/>
          </field>
        </xsl:if>

        <!-- one identifier is the accession number -->
        <xsl:if test="@type = 'accession number'">
          <xsl:variable name="type" select="translate( @type, ' ', '_')"/>

          <field>
            <xsl:attribute name="name">
              <xsl:value-of select="concat($prefix, $type, $suffix)"/>
            </xsl:attribute>
            <xsl:value-of select="text()"/>
          </field>
        </xsl:if>

      </xsl:if>

    </xsl:for-each>

    <xsl:apply-templates select="scanInfo"/>
  </xsl:template>


  <!-- scanInfo section -->
  <xsl:template match="scanInfo">
    <xsl:param name="prefix">vrc.</xsl:param>
    <xsl:param name="suffix"/>
    <xsl:param name="idsuffix">.id</xsl:param>

    <xsl:for-each select="./*">

      <xsl:if test="contains(local-name(), 'date')">
        <!-- one date is scan -->
        <xsl:if test="@type = 'scan'">
          <field>
            <xsl:attribute name="name">
              <xsl:value-of select="concat($prefix, 'date.scan', $suffix)"/>
            </xsl:attribute>
            <xsl:value-of select="text()"/>
          </field>
        </xsl:if>

        <!-- one date is scan reviewed -->
        <xsl:if test="@type = 'scan reviewed'">
          <field>
            <xsl:attribute name="name">
              <xsl:value-of select="concat($prefix, 'date.scan_reviewed', $suffix)"/>
            </xsl:attribute>
            <xsl:value-of select="text()"/>
          </field>
        </xsl:if>
      </xsl:if>

      <xsl:if test="local-name() = 'scanRequest'">
        <field>
          <xsl:attribute name="name">
            <xsl:value-of select="concat($prefix, local-name(), $suffix)"/>
          </xsl:attribute>
          <xsl:value-of select="text()"/>
        </field>
        <xsl:if test="string-length(@refid) > 0">
          <field>
            <xsl:attribute name="name">
              <xsl:value-of select="concat($prefix, local-name(), $idsuffix)"/>
            </xsl:attribute>
            <xsl:value-of select="@refid"/>
          </field>
        </xsl:if>
      </xsl:if>

      <xsl:if test="local-name() = 'fileName'">
        <field>
          <xsl:attribute name="name">
            <xsl:value-of select="concat($prefix, local-name(), $suffix)"/>
          </xsl:attribute>
          <xsl:value-of select="text()"/>
        </field>
      </xsl:if>

      <xsl:if test="local-name() = 'format'">
        <field>
          <xsl:attribute name="name">
            <xsl:value-of select="concat($prefix, local-name(), $suffix)"/>
          </xsl:attribute>
          <xsl:value-of select="text()"/>
        </field>
      </xsl:if>

      <xsl:if test="contains(local-name(), 'scanner') or contains(local-name(), 'scanReviewer')">
        <field>
          <xsl:attribute name="name">
            <xsl:value-of select="concat($prefix, local-name(), $suffix)"/>
          </xsl:attribute>
          <xsl:value-of select="text()"/>
        </field>

        <xsl:if test="string-length(@refid) > 0">
          <field>
            <xsl:attribute name="name">
              <xsl:value-of select="concat($prefix, local-name(), $idsuffix)"/>
            </xsl:attribute>
            <xsl:value-of select="@refid"/>
          </field>
        </xsl:if>
      </xsl:if>

    </xsl:for-each>
  </xsl:template>


  <xsl:template match="image | work">
    <xsl:param name="prefix">vrc.</xsl:param>
    <xsl:param name="suffix"/>
    <xsl:param name="idsuffix">.id</xsl:param>
    <xsl:param name="sourcesuffix">.collection</xsl:param>

    <xsl:if test="string-length(@source) > 0">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of select="concat($prefix, local-name(), $sourcesuffix)"/>
        </xsl:attribute>
        <xsl:value-of select="@source"/>
      </field>
    </xsl:if>

    <xsl:for-each select="./*">

      <xsl:if test="local-name() = 'description'">
        <field>
          <xsl:attribute name="name">
            <xsl:value-of select="concat($prefix, local-name(), $suffix)"/>
          </xsl:attribute>
          <xsl:value-of select="text()"/>
        </field>

        <xsl:if test="string-length(@refid) > 0">
          <field>
            <xsl:attribute name="name">
              <xsl:value-of select="concat($prefix, 'description.source', $idsuffix)"/>
            </xsl:attribute>
            <xsl:value-of select="@refid"/>
          </field>
        </xsl:if>

        <xsl:if test="string-length(@source) > 0">
          <field>
            <xsl:attribute name="name">
              <xsl:value-of select="concat($prefix, 'description.source', $suffix)"/>
            </xsl:attribute>
            <xsl:value-of select="@source"/>
          </field>
        </xsl:if>

      </xsl:if>

      <xsl:if test="local-name() = 'source'">
        <field>
          <xsl:attribute name="name">
            <xsl:value-of select="concat($prefix, local-name(), $suffix)"/>
          </xsl:attribute>
          <xsl:value-of select="text()"/>
        </field>

        <xsl:if test="string-length(@refid) > 0">
          <field>
            <xsl:attribute name="name">
              <xsl:value-of select="concat($prefix, local-name(), $idsuffix)"/>
            </xsl:attribute>
            <xsl:value-of select="@refid"/>
          </field>
        </xsl:if>

      </xsl:if>

      <xsl:if test="local-name() = 'measurements'">
        <field>
          <xsl:attribute name="name">
            <xsl:value-of select="concat($prefix, local-name(), $suffix)"/>
          </xsl:attribute>
          <xsl:value-of select="text()"/>
        </field>
      </xsl:if>

      <xsl:if test="local-name() = 'inscription'">
        <field>
          <xsl:attribute name="name">
            <xsl:value-of select="concat($prefix, local-name(), $suffix)"/>
          </xsl:attribute>
          <xsl:value-of select="text()"/>
        </field>
      </xsl:if>

    </xsl:for-each>

    <xsl:apply-templates select="titleSet"/>
    <xsl:apply-templates select="dateSet"/>
    <xsl:apply-templates select="locationSet"/>
    <xsl:apply-templates select="stylePeriodSet"/>
    <xsl:apply-templates select="culturalContextSet"/>
    <xsl:apply-templates select="agentSet"/>
    <xsl:apply-templates select="worktypeSet"/>
    <xsl:apply-templates select="materialSet"/>
    <xsl:apply-templates select="subjectSet"/>
    <xsl:apply-templates select="textrefSet"/>
    <xsl:apply-templates select="rightsSet"/>

  </xsl:template>


  <!-- Title section -->
  <xsl:template match="titleSet">
    <xsl:param name="prefix">vrc.</xsl:param>
    <xsl:param name="suffix"/>
    <xsl:param name="idsuffix">.id</xsl:param>

    <xsl:for-each select="./*">
      <xsl:if test="contains(local-name(), 'title')">
        <field>
          <xsl:attribute name="name">
            <xsl:value-of select="concat($prefix, local-name(), $suffix)"/>
          </xsl:attribute>
          <xsl:value-of select="text()"/>
        </field>

        <xsl:if test="string-length(@type) > 0">
          <field>
            <xsl:attribute name="name">
              <xsl:value-of select="concat($prefix, 'title.type', $suffix)"/>
            </xsl:attribute>
            <xsl:value-of select="@type"/>
          </field>
        </xsl:if>

        <xsl:if test="string-length(@refid) > 0">
          <field>
            <xsl:attribute name="name">
              <xsl:value-of select="concat($prefix, 'title.type', $idsuffix)"/>
            </xsl:attribute>
            <xsl:value-of select="@refid"/>
          </field>
        </xsl:if>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <!-- Date section -->
  <xsl:template match="dateSet">
    <xsl:param name="prefix">vrc.</xsl:param>
    <xsl:param name="suffix"/>
    <xsl:param name="idsuffix">.id</xsl:param>

    <xsl:for-each select="./*">

      <xsl:if test="contains(local-name(), 'date')">

        <xsl:if test="string-length(@type) > 0">
          <field>
            <xsl:attribute name="name">
              <xsl:value-of select="concat($prefix, 'date.type', $suffix)"/>
            </xsl:attribute>
            <xsl:value-of select="@type"/>
          </field>
        </xsl:if>

        <xsl:if test="string-length(@refid) > 0">
          <field>
            <xsl:attribute name="name">
              <xsl:value-of select="concat($prefix, 'date.type', $idsuffix)"/>
            </xsl:attribute>
            <xsl:value-of select="@refid"/>
          </field>
        </xsl:if>

        <xsl:choose>
          <xsl:when test="string-length(./display) > 0">
            <field>
              <xsl:attribute name="name">
                <xsl:value-of select="concat($prefix,'date', $suffix)"/>
              </xsl:attribute>
              <xsl:value-of select="./display"/>
            </field>
          </xsl:when>
          <xsl:otherwise>
            <field>
              <xsl:attribute name="name">
                <xsl:value-of select="concat($prefix,'date', $suffix)"/>
              </xsl:attribute>
              <xsl:value-of select="."/>
            </field>
          </xsl:otherwise>
        </xsl:choose>

        <xsl:if test="string-length(./earliestDate) > 0">
          <field>
            <xsl:attribute name="name">
              <xsl:value-of select="concat($prefix,'date.earliestDate', $suffix)"/>
            </xsl:attribute>
            <xsl:value-of select="./earliestDate"/>
          </field>
        </xsl:if>

        <xsl:if test="string-length(./latestDate) > 0">
          <field>
            <xsl:attribute name="name">
              <xsl:value-of select="concat($prefix,'date.latestDate', $suffix)"/>
            </xsl:attribute>
            <xsl:value-of select="./latestDate"/>
          </field>
        </xsl:if>

      </xsl:if>

    </xsl:for-each>
  </xsl:template>


  <!-- Location section -->
  <xsl:template match="locationSet">
    <xsl:param name="prefix">vrc.</xsl:param>
    <xsl:param name="suffix"/>
    <xsl:param name="idsuffix">.id</xsl:param>

    <xsl:for-each select="./*">

      <xsl:if test="string-length(@type) > 0">
        <field>
          <xsl:attribute name="name">
            <xsl:value-of select="concat($prefix, 'location.type', $suffix)"/>
          </xsl:attribute>
          <xsl:value-of select="@type"/>
        </field>
      </xsl:if>

      <xsl:if test="string-length(@refid) > 0">
        <field>
          <xsl:attribute name="name">
            <xsl:value-of select="concat($prefix, 'location.type', $idsuffix)"/>
          </xsl:attribute>
          <xsl:value-of select="@refid"/>
        </field>
      </xsl:if>

      <xsl:for-each select="./*">         

        <xsl:if test="contains(local-name(), 'name')">
          <field>
            <xsl:attribute name="name">
             <xsl:value-of select="concat($prefix,'location', $suffix)"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
          </field>

          <xsl:if test="string-length(@refid) > 0">
            <field>
              <xsl:attribute name="name">
                <xsl:value-of select="concat($prefix, 'location', $idsuffix)"/>
              </xsl:attribute>
              <xsl:value-of select="@refid"/>
            </field>
          </xsl:if>

        </xsl:if>
      </xsl:for-each>
    </xsl:for-each>
  </xsl:template>


  <!-- StylePeriod section -->
  <xsl:template match="stylePeriodSet">
    <xsl:param name="prefix">vrc.</xsl:param>
    <xsl:param name="suffix"/>
    <xsl:param name="idsuffix">.id</xsl:param>

    <xsl:for-each select="./*">

      <xsl:if test="contains(local-name(), 'stylePeriod')">
        <field>
          <xsl:attribute name="name">
            <xsl:value-of select="concat($prefix, local-name(), $suffix)"/>
          </xsl:attribute>
          <xsl:value-of select="text()"/>
        </field>

        <xsl:if test="string-length(@refid) > 0">
          <field>
            <xsl:attribute name="name">
              <xsl:value-of select="concat($prefix, local-name(), $idsuffix)"/>
            </xsl:attribute>
            <xsl:value-of select="@refid"/>
          </field>
        </xsl:if>

      </xsl:if>

    </xsl:for-each>
  </xsl:template>


  <!-- CulturalContext section -->
  <xsl:template match="culturalContextSet">
    <xsl:param name="prefix">vrc.</xsl:param>
    <xsl:param name="suffix"/>
    <xsl:param name="idsuffix">.id</xsl:param>

    <xsl:for-each select="./*">

      <xsl:if test="contains(local-name(), 'culturalContext')">
        <field>
          <xsl:attribute name="name">
            <xsl:value-of select="concat($prefix, local-name(), $suffix)"/>
          </xsl:attribute>
          <xsl:value-of select="text()"/>
        </field>

        <xsl:if test="string-length(@refid) > 0">
          <field>
            <xsl:attribute name="name">
              <xsl:value-of select="concat($prefix, local-name(), $idsuffix)"/>
            </xsl:attribute>
            <xsl:value-of select="@refid"/>
          </field>
        </xsl:if>

      </xsl:if>

    </xsl:for-each>
  </xsl:template>


  <!-- WorkType section -->
  <xsl:template match="worktypeSet">
    <xsl:param name="prefix">vrc.</xsl:param>
    <xsl:param name="suffix"/>
    <xsl:param name="idsuffix">.id</xsl:param>

    <xsl:for-each select="./*">

      <!-- <xsl:if test="contains(local-name(), 'worktype')"> -->
      <field>
        <xsl:attribute name="name">
          <xsl:value-of select="concat($prefix, local-name(), $suffix)"/>
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>

      <xsl:if test="string-length(@refid) > 0">
        <field>
          <xsl:attribute name="name">
            <xsl:value-of select="concat($prefix, local-name(), $idsuffix)"/>
          </xsl:attribute>
          <xsl:value-of select="@refid"/>
        </field>
      </xsl:if>
      <!-- </xsl:if> -->

    </xsl:for-each>
  </xsl:template>

  <!-- Agent section -->
  <xsl:template match="agentSet">
    <xsl:param name="prefix">vrc.</xsl:param>
    <xsl:param name="suffix"/>
    <xsl:param name="idsuffix">.id</xsl:param>

    <xsl:for-each select="./*">

      <xsl:if test="contains(local-name(), 'agent')">
        <field>
          <xsl:attribute name="name">
            <xsl:value-of select="concat($prefix,'agent', $suffix)"/>
          </xsl:attribute>
          <xsl:value-of select="./name"/>
        </field>
        <xsl:if test="string-length(./name/@type) > 0">
          <field>
            <xsl:attribute name="name">
              <xsl:value-of select="concat($prefix,'agent.type', $suffix)"/>
            </xsl:attribute>
            <xsl:value-of select="./name/@type"/>
          </field>
        </xsl:if>
        <xsl:if test="string-length(./name/@refid) > 0">
          <field>
            <xsl:attribute name="name">
              <xsl:value-of select="concat($prefix,'agent.type', $idsuffix)"/>
            </xsl:attribute>
            <xsl:value-of select="./name/@refid"/>
          </field>
        </xsl:if>
        <xsl:if test="string-length(./date) > 0">
          <field>
            <xsl:attribute name="name">
              <xsl:value-of select="concat($prefix,'agent.date', $suffix)"/>
            </xsl:attribute>
            <xsl:value-of select="./date"/>
          </field>
        </xsl:if>

        <xsl:if test="string-length(./culture) > 0">
          <field>
            <xsl:attribute name="name">
              <xsl:value-of select="concat($prefix,'agent.culture', $suffix)"/>
            </xsl:attribute>
            <xsl:value-of select="./culture"/>
          </field>
        </xsl:if>
        <xsl:if test="string-length(./culture/@refid) > 0">
          <field>
            <xsl:attribute name="name">
              <xsl:value-of select="concat($prefix,'agent.culture', $idsuffix)"/>
            </xsl:attribute>
            <xsl:value-of select="./culture/@refid"/>
          </field>
        </xsl:if>

        <xsl:if test="string-length(./role) > 0">
          <field>
            <xsl:attribute name="name">
              <xsl:value-of select="concat($prefix,'agent.role', $suffix)"/>
            </xsl:attribute>
            <xsl:value-of select="./role"/>
          </field>
        </xsl:if>
        <xsl:if test="string-length(./role/@refid) > 0">
          <field>
            <xsl:attribute name="name">
              <xsl:value-of select="concat($prefix,'agent.role', $idsuffix)"/>
            </xsl:attribute>
            <xsl:value-of select="./role/@refid"/>
          </field>
        </xsl:if>

        <xsl:if test="string-length(@refid) > 0">
          <field>
            <xsl:attribute name="name">
              <xsl:value-of select="concat($prefix, 'agent', $idsuffix)"/>
            </xsl:attribute>
            <xsl:value-of select="@refid"/>
          </field>
        </xsl:if>

      </xsl:if>

    </xsl:for-each>
  </xsl:template>

  <!-- Material section -->
  <xsl:template match="materialSet">
    <xsl:param name="prefix">vrc.</xsl:param>
    <xsl:param name="suffix"/>
    <xsl:param name="idsuffix">.id</xsl:param>

    <xsl:for-each select="./*">

      <!-- <xsl:if test="contains(local-name(), 'worktype')"> -->
      <field>
        <xsl:attribute name="name">
          <xsl:value-of select="concat($prefix, local-name(), $suffix)"/>
        </xsl:attribute>
        <xsl:value-of select="text()"/>
      </field>

      <xsl:if test="string-length(@refid) > 0">
        <field>
          <xsl:attribute name="name">
            <xsl:value-of select="concat($prefix, local-name(), $idsuffix)"/>
          </xsl:attribute>
          <xsl:value-of select="@refid"/>
        </field>
      </xsl:if>
      <!-- </xsl:if> -->

    </xsl:for-each>
  </xsl:template>

  <!-- Subject section -->
  <xsl:template match="subjectSet">
    <xsl:param name="prefix">vrc.</xsl:param>
    <xsl:param name="suffix"/>
    <xsl:param name="idsuffix">.id</xsl:param>

    <xsl:param name="objectType">
      <xsl:value-of select="name(..)"/>
    </xsl:param>

    <xsl:for-each select="./subject/*">

      <xsl:if test="contains(local-name(), 'term')">
        <field>
          <xsl:attribute name="name">
            <xsl:if test="$objectType = 'work'">
              <xsl:value-of select="concat($prefix,'related_subject', $suffix)"/>
            </xsl:if>
            <xsl:if test="$objectType = 'image'">
              <xsl:value-of select="concat($prefix,'depicted_subject', $suffix)"/>
            </xsl:if>
          </xsl:attribute>
          <xsl:value-of select="text()"/>
        </field>

        <xsl:if test="string-length(@refid) > 0">
          <field>
            <xsl:attribute name="name">
              <xsl:if test="$objectType = 'work'">
                <xsl:value-of select="concat($prefix,'related_subject', $idsuffix)"/>
              </xsl:if>
              <xsl:if test="$objectType = 'image'">
                <xsl:value-of select="concat($prefix,'depicted_subject', $idsuffix)"/>
              </xsl:if>
            </xsl:attribute>
            <xsl:value-of select="@refid"/>
          </field>
        </xsl:if>

      </xsl:if>

    </xsl:for-each>
  </xsl:template>

  <!-- textref section -->
  <xsl:template match="textrefSet">
    <xsl:param name="prefix">vrc.</xsl:param>
    <xsl:param name="suffix"/>
    <xsl:param name="idsuffix">.id</xsl:param>

    <xsl:for-each select="./*">

      <xsl:if test="contains(local-name(), 'textref')">
        <field>
          <xsl:attribute name="name">
            <xsl:value-of select="concat($prefix,local-name(), $suffix)"/>
          </xsl:attribute>
          <xsl:value-of select="text()"/>
        </field>
      </xsl:if>

    </xsl:for-each>
  </xsl:template>

  <!-- Rights section -->
  <xsl:template match="rightsSet">
    <xsl:param name="prefix">vrc.</xsl:param>
    <xsl:param name="suffix"/>
    <xsl:param name="idsuffix">.id</xsl:param>

    <xsl:for-each select="./*">

      <xsl:if test="contains(local-name(), 'rights')">
        <field>
          <xsl:attribute name="name">
            <xsl:value-of select="concat($prefix,'rights', $suffix)"/>
          </xsl:attribute>
          <xsl:value-of select="./text"/>
        </field>
      </xsl:if>

    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>
