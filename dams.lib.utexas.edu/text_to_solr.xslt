<?xml version="1.0" encoding="UTF-8"?>
<!-- Glob text into one field for indexing. -->
<xsl:stylesheet version="1.0" xmlns:foxml="info:fedora/fedora-system:def/foxml#"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exts="xalan://dk.defxws.fedoragsearch.server.GenericOperationsImpl"
  xmlns:islandora-exts="xalan://ca.upei.roblib.DataStreamForXSLT" exclude-result-prefixes="exts">
  <!-- Maintaining DSID mappings for backwards compatibility with wild implementations. -->
  <xsl:template match="foxml:datastream[@ID = 'FULL_TEXT']/foxml:datastreamVersion[last()]" name="index_text">
    
    <xsl:param name="content"/>
    <xsl:param name="prefix">mods_</xsl:param>
    <xsl:param name="suffix">_t</xsl:param>
    <field>
      <xsl:attribute name="name">
        <xsl:value-of select="concat($prefix, @ID , $suffix)"/>
      </xsl:attribute>
      <xsl:variable name="text" select="normalize-space($content)"/>
      <!-- Only output non-empty text nodes (followed by a single space) -->
      <xsl:if test="$text">
        <xsl:value-of select="$text"/>
        <xsl:text> </xsl:text>
      </xsl:if>
    </field>
  </xsl:template>
</xsl:stylesheet>
