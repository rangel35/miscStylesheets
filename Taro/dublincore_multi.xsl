<!-- TARO BAR XML record translation 2004 November 9 -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:redirect="http://xml.apache.org/xalan/redirect" extension-element-prefixes="redirect">

    <xsl:strip-space elements="*" />

    <xsl:template match="/">

        <xsl:variable name="repo">
            <xsl:value-of select="ead/eadheader/eadid" />
        </xsl:variable>

        <xsl:variable name="file">
            <xsl:if
                test="contains($repo, 'tslac') or contains($repo, 'aushc') or contains($repo, 'houpub') or contains($repo, 'tsusm')
                or contains($repo, 'utarl') or contains($repo, 'utep') or contains($repo, 'utmb')
                or contains($repo, 'ojac') or contains($repo, 'utsa') or contains($repo, 'utmda') or contains($repo, 'smu')
                or contains($repo, 'twu') or contains($repo, 'hamtmc') or contains($repo, 'dalpub') or contains($repo, 'unt')
                or contains($repo, 'stthomas') or contains($repo, 'sama') or contains($repo, 'txglo') or contains($repo, 'drtsa')
                or contains($repo, 'sjmh') or contains($repo, 'aalgs') or contains($repo, 'apts') or contains($repo, 'uthscsa')
                or contains($repo, 'tyrrell') or contains($repo, 'uttyler') or contains($repo, 'tamucc') or contains($repo, 'concordia') 
                or contains($repo, 'tsu') or contains($repo, 'hrdi') or contains($repo, 'haines') or contains($repo, 'trinity')
                or contains($repo, 'untmlsc') or contains($repo, 'etrc') or contains($repo, 'lamar') or contains($repo, 'dalhs') 
                or contains($repo, 'tamuk') or contains($repo, 'shsu') or contains($repo, 'chhsm') or contains($repo, 'swestern')">
                <xsl:value-of select="substring-after(ead/eadheader/eadid, '.')"/>
            </xsl:if>
            <xsl:if
                test="not(contains($repo, 'tslac') or contains($repo, 'aushc') or contains($repo, 'houpub')
                or contains($repo, 'swtsu') or contains($repo, 'utarl') or contains($repo, 'utpanam')
                or contains($repo, 'utep') or contains($repo, 'ojac') or contains($repo, 'utmb') or contains($repo, 'utsa')
                or contains($repo, 'utmda') or contains($repo, 'smu') or contains($repo, 'twu') or contains($repo, 'hamtmc')
                or contains($repo, 'dalpub') or contains($repo, 'unt') or contains($repo, 'stthomas') or contains($repo, 'sama')
                or contains($repo, 'txglo') or contains($repo, 'drtsa') or contains($repo, 'sjmh')or contains($repo, 'aalgs')
                or contains($repo, 'apts') or contains($repo, 'uthscsa') or contains($repo, 'tyrrell') or contains($repo, 'uttyler') 
                or contains($repo, 'tamucc') or contains($repo, 'concordia')or contains($repo, 'tsu') or contains($repo, 'hrdi') 
                or contains($repo, 'haines') or contains($repo, 'trinity') or contains($repo, 'untmlsc') or contains($repo, 'etrc') 
                or contains($repo, 'lamar') or contains($repo, 'dalhs') or contains($repo, 'tamuk') or contains($repo, 'shsu') 
                or contains($repo, 'chhsm') or contains($repo, 'swestern'))">
                <xsl:value-of select="substring-after(substring-after(ead/eadheader/eadid, '.'), '.')"/>
            </xsl:if>
        </xsl:variable>

        <xsl:variable name="repository">
            <xsl:choose>
                <xsl:when test="contains($repo, 'blac')">
                    <xsl:value-of select="'utlac'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'hrc')">
                    <xsl:value-of select="'uthrc'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'tslac')">
                    <xsl:value-of select="'tslac'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'ttu.rb')">
                    <xsl:value-of select="'tturb'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'ttu.ua')">
                    <xsl:value-of select="'ttuua'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'wrc')">
                    <xsl:value-of select="'ricewrc'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'cush')">
                    <xsl:value-of select="'tamucush'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'ttu.sw')">
                    <xsl:value-of select="'ttusw'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'aaa')">
                    <xsl:value-of select="'utaaa'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'cah')">
                    <xsl:value-of select="'utcah'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'swcpc')">
                    <xsl:value-of select="'swcpc'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'uh.ua')">
                    <xsl:value-of select="'uhua'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'uh.warc')">
                    <xsl:value-of select="'uhwarc'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'uh.sc')">
                    <xsl:value-of select="'uhsc'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'law')">
                    <xsl:value-of select="'utlaw'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'aushc')">
                    <xsl:value-of select="'aushc'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'houpub')">
                    <xsl:value-of select="'houpub'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'tsusm')">
                    <xsl:value-of select="'tsusm'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'utarl')">
                    <xsl:value-of select="'utarl'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'utmb')">
                    <xsl:value-of select="'utmb'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'utsa')">
                    <xsl:value-of select="'utsa'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'smu')">
                    <xsl:value-of select="'smu'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'utmda')">
                    <xsl:value-of select="'utmda'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'ojac')">
                    <xsl:value-of select="'ojac'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'hamtmc')">
                    <xsl:value-of select="'hamtmc'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'twu')">
                    <xsl:value-of select="'twu'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'dalpub')">
                    <xsl:value-of select="'dalpub'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'unt')">
                    <xsl:value-of select="'unt'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'stthomas')">
                    <xsl:value-of select="'stthomas'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'sama')">
                    <xsl:value-of select="'sama'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'txglo')">
                    <xsl:value-of select="'txglo'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'drtsa')">
                    <xsl:value-of select="'drtsa'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'sjmh')">
                    <xsl:value-of select="'sjmh'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'aalgs')">
                    <xsl:value-of select="'aalgs'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'ttu.va')">
                    <xsl:value-of select="'ttuva'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'apts')">
                    <xsl:value-of select="'apts'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'hrdi')">
                    <xsl:value-of select="'hrdi'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'uthscsa')">
                    <xsl:value-of select="'uthscsa'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'lsc')">
                    <xsl:value-of select="'utlsc'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'tyrrell')">
                    <xsl:value-of select="'tyrrell'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'utep')">
                    <xsl:value-of select="'utep'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'uttyler')">
                    <xsl:value-of select="'uttyler'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'tamucc')">
                    <xsl:value-of select="'tamucc'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'concordia')">
                    <xsl:value-of select="'concordia'"/>
                </xsl:when>              
                <xsl:when test="contains($repo, 'etrc')">
                    <xsl:value-of select="'etrc'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'haines')">
                    <xsl:value-of select="'haines'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'lamar')">
                    <xsl:value-of select="'lamar'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'trinity')">
                    <xsl:value-of select="'trinity'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'tsu')">
                    <xsl:value-of select="'tsu'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'ttu.av')">
                    <xsl:value-of select="'ttuav'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'untmlsc')">
                    <xsl:value-of select="'untmlsc'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'tamuk')">
                    <xsl:value-of select="'tamuk'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'dalhs')">
                    <xsl:value-of select="'dalhs'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'bay.abl')">
                    <xsl:value-of select="'bayabl'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'bay.kc')">
                    <xsl:value-of select="'baykc'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'bay.tc')">
                    <xsl:value-of select="'baytc'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'bay.pll')">
                    <xsl:value-of select="'baypll'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'shsu')">
                    <xsl:value-of select="'shsu'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'chhsm')">
                    <xsl:value-of select="'chhsm'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'swestern')">
                    <xsl:value-of select="'swestern'"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>

        <!-- Testing area -->

        <xsl:variable name="acronym">
            <xsl:choose>
                <xsl:when test="contains($repo, 'blac')">
                    <xsl:text>lac</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'hrc')">
                    <xsl:text>hrc</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'tslac')">
                    <xsl:text>tsl</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'ttu.rb')">
                    <xsl:text>trb</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'ttu.ua')">
                    <xsl:text>tua</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'wrc')">
                    <xsl:text>rice</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'cush')">
                    <xsl:text>tamu</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'ttu.sw')">
                    <xsl:text>tsw</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'aaa')">
                    <xsl:text>aaa</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'cah')">
                    <xsl:text>cah</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'swcpc')">
                    <xsl:text>swc</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'uh.ua')">
                    <xsl:text>hua</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'uh.warc')">
                    <xsl:text>warc</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'uh.sc')">
                    <xsl:text>hsc</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'law')">
                    <xsl:text>law</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'aushc')">
                    <xsl:text>ahc</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'houpub')">
                    <xsl:text>hpub</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'tsusm')">
                    <xsl:text>tsu</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'utarl')">
                    <xsl:text>arl</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'utmb')">
                    <xsl:text>utmb</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'utsa')">
                    <xsl:text>utsa</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'smu')">
                    <xsl:text>smu</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'utmda')">
                    <xsl:text>mda</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'ojac')">
                    <xsl:text>ojac</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'twu')">
                    <xsl:text>twu</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'hamtmc')">
                    <xsl:text>tmc</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'dalpub')">
                    <xsl:text>dpub</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'unt')">
                    <xsl:text>unt</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'stthomas')">
                    <xsl:text>ust</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'sama')">
                    <xsl:text>sama</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'txglo')">
                    <xsl:value-of select="'glo'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'drtsa')">
                    <xsl:value-of select="'drt'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'sjmh')">
                    <xsl:value-of select="'sjmh'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'aalgs')">
                    <xsl:value-of select="'aal'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'ttu.va')">
                    <xsl:value-of select="'tva'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'apts')">
                    <xsl:text>apts</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'hrdi')">
                    <xsl:text>hrdi</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'uthscsa')">
                    <xsl:text>hscsa</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'lsc')">
                    <xsl:value-of select="'lsc'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'tyrrell')">
                    <xsl:value-of select="'thl'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'utep')">
                    <xsl:text>utep</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'uttyler')">
                    <xsl:value-of select="'thl'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'tamucc')">
                    <xsl:value-of select="'tcc'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'concordia')">
                    <xsl:value-of select="'cu'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'etrc')">
                    <xsl:text>etrc</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'haines')">
                    <xsl:text>hml</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'lamar')">
                    <xsl:value-of select="'lu'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'trinity')">
                    <xsl:text>tu</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'tsu')">
                    <xsl:text>tsu</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'ttu.av')">
                    <xsl:text>tav</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'untmlsc')">
                    <xsl:value-of select="'mlsc'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'tamuk')">
                    <xsl:value-of select="'tk'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'dalhs')">
                    <xsl:value-of select="'dhs'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'bay.abl')">
                    <xsl:text>babl</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'bay.kc')">
                    <xsl:text>bkc</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'bay.tc')">
                    <xsl:text>btc</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'bay.pll')">
                    <xsl:text>bpll</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'shsu')">
                    <xsl:value-of select="'shs'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'chhsm')">
                    <xsl:value-of select="'chh'"/>
                </xsl:when>
                <xsl:when test="contains($repo, 'swestern')">
                    <xsl:value-of select="'swu'"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        
        <!-- /testing area -->

        <!-- Beginning of XML File -->

        <xsl:text>&#10;</xsl:text>
        <!-- <work><xsl:text>&#10;</xsl:text> -->

        <!-- Listing for the body of work -->

        <dublin_core>
            <xsl:text>&#10;</xsl:text>
            <xsl:text disable-output-escaping="yes">&#60;dcvalue element="identifier" qualifier="urn"&#62;</xsl:text>
            <xsl:value-of select="ead/eadheader/eadid" />
            <xsl:text disable-output-escaping="yes">&#60;/dcvalue&#62;</xsl:text>
            <xsl:text>&#10;</xsl:text>

            <xsl:text disable-output-escaping="yes">&#60;dcvalue element="title"&#62;</xsl:text>
            <xsl:value-of select="normalize-space(ead/eadheader/filedesc/titlestmt/titleproper)" />
            <xsl:text> </xsl:text>
            <xsl:value-of select="normalize-space(ead/eadheader/filedesc/titlestmt/subtitle)" />
            <xsl:text disable-output-escaping="yes">&#60;/dcvalue&#62;</xsl:text>
            <xsl:text>&#10;</xsl:text>

            <xsl:text disable-output-escaping="yes">&#60;dcvalue element="author"&#62;</xsl:text>
            <xsl:choose>
                <xsl:when test="not(ead/archdesc/did/origination)">
                    <xsl:value-of select="normalize-space(ead/archdesc/did/unittitle)" />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="normalize-space(ead/archdesc/did/origination)" />
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text disable-output-escaping="yes">&#60;/dcvalue&#62;</xsl:text>
            <xsl:text>&#10;</xsl:text>

            <xsl:for-each select="ead//controlaccess/persname | ead//controlaccess/corpname">
                <xsl:choose>
                    <xsl:when test="@encodinganalog='700'">
                        <xsl:text disable-output-escaping="yes">&#60;dcvalue element="contributor"&#62;</xsl:text>
                        <xsl:value-of select="normalize-space(.)" />
                        <xsl:text disable-output-escaping="yes">&#60;/dcvalue&#62;</xsl:text>
                        <xsl:text>&#10;</xsl:text>
                    </xsl:when>
                    <xsl:when test="@encodinganalog='710'">
                        <xsl:text disable-output-escaping="yes">&#60;dcvalue element="contributor"&#62;</xsl:text>
                        <xsl:value-of select="normalize-space(.)" />
                        <xsl:text disable-output-escaping="yes">&#60;/dcvalue&#62;</xsl:text>
                        <xsl:text>&#10;</xsl:text>
                    </xsl:when>
                    <xsl:when test="@encodinganalog='600'">
                        <xsl:text disable-output-escaping="yes">&#60;dcvalue element="subject"&#62;</xsl:text>
                        <xsl:value-of select="normalize-space(.)" />
                        <xsl:text disable-output-escaping="yes">&#60;/dcvalue&#62;</xsl:text>
                        <xsl:text>&#10;</xsl:text>
                    </xsl:when>
                    <xsl:when test="@encodinganalog='610'">
                        <xsl:text disable-output-escaping="yes">&#60;dcvalue element="subject"&#62;</xsl:text>
                        <xsl:value-of select="normalize-space(.)" />
                        <xsl:text disable-output-escaping="yes">&#60;/dcvalue&#62;</xsl:text>
                        <xsl:text>&#10;</xsl:text>
                    </xsl:when>
                    <xsl:when test="@encodinganalog='611'">
                        <xsl:text disable-output-escaping="yes">&#60;dcvalue element="subject"&#62;</xsl:text>
                        <xsl:value-of select="normalize-space(.)" />
                        <xsl:text disable-output-escaping="yes">&#60;/dcvalue&#62;</xsl:text>
                        <xsl:text>&#10;</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&#60;dcvalue element="contributor"&#62;</xsl:text>
                        <xsl:value-of select="normalize-space(.)" />
                        <xsl:text disable-output-escaping="yes">&#60;/dcvalue&#62;</xsl:text>
                        <xsl:text>&#10;</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>

            <xsl:for-each select="ead//controlaccess/subject">
                <xsl:text disable-output-escaping="yes">&#60;dcvalue element="subject"&#62;</xsl:text>
                <xsl:value-of select="normalize-space(.)" />
                <xsl:text disable-output-escaping="yes">&#60;/dcvalue&#62;</xsl:text>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each>

            <xsl:text disable-output-escaping="yes">&#60;dcvalue element="publisher"&#62;</xsl:text>
            <xsl:choose>
                <xsl:when test="contains($repo, 'blac')">
                    <xsl:text>The University of Texas at Austin. Benson Latin American Collection</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'hrc')">
                    <xsl:text>Harry Ransom Humanities Research Center, University of Texas at Austin</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'tslac')">
                    <xsl:text>Texas State Archives</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'ttu.rb')">
                    <xsl:text>Texas Tech University Southwest Collection/Special Collections Library</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'ttu.ua')">
                    <xsl:text>Texas Tech University Southwest Collection/Special Collections Library</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'wrc')">
                    <xsl:text>Rice University Fondren Library</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'cush')">
                    <xsl:text>Texas A &amp; M University Cushing Memorial Library</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'ttu.sw')">
                    <xsl:text>Texas Tech University Southwest Collection/Special Collections Library</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'aaa')">
                    <xsl:text>The University of Texas at Austin. Alexander Architectural Archive</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'cah')">
                    <xsl:text>The University of Texas at Austin. Center for American History</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'swcpc')">
                    <xsl:text>Texas Tech University Southwest Collection/Special Collections Library</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'uh.ua')">
                    <xsl:text>University of Houston Libraries, Special Collections and Archives</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'uh.warc')">
                    <xsl:text>University of Houston Libraries, Special Collections and Archives</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'uh.sc')">
                    <xsl:text>University of Houston Libraries, Special Collections and Archives</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'utlaw')">
                    <xsl:text>Tarlton Law Library, University of Texas at Austin</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'aushc')">
                    <xsl:text>Austin History Center</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'houpub')">
                    <xsl:text>Houston Public Library</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'tsusm')">
                    <xsl:text>Texas State Special Collections</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'utarl')">
                    <xsl:text>UT Arlington Library</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'utmb')">
                    <xsl:text>UT Medical Branch at Galveston</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'utsa')">
                    <xsl:text>UT San Antonio</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'smu')">
                    <xsl:text>Southern Methodist University</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'utmda')">
                    <xsl:text>UT MD Anderson Center</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'ojac')">
                    <xsl:text>Robert E. Nail, Jr. Historical Archives at Old Jail Art Center</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'twu')">
                    <xsl:text>Texas Woman's University, the Woman's Collection</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'hamtmc')">
                    <xsl:text>Houston Academy of Medicine-Texas Medical Center Library, John P. McGovern Historical Collections and Research Center</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'dalpub')">
                    <xsl:text>Texas/Dallas History and Archives Division, Dallas Public Library</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'unt')">
                    <xsl:text>University of North Texas Archives</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'stthomas')">
                    <xsl:text>University of St. Thomas Archives</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'sama')">
                    <xsl:text>San Antonio Municipal Archives</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'txglo')">
                    <xsl:text>Texas General Land Office Archives and Records</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'drtsa')">
                    <xsl:text>Daughters of the Republic of Texas Library at the Alamo</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'sjmh')">
                    <xsl:text>Albert and Ethel Herzstein Library, San Jacinto Museum of History</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'aalgs')">
                    <xsl:text>African American Library at the Gregory School </xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'ttu.va')">
                    <xsl:text>The Vietnam Center and Archive, Texas Tech University</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'apts')">
                    <xsl:text>Austin Presbyterian Theological Seminary</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'hrdi')">
                    <xsl:text>Human Rights Documentation Initiative, University of Texas at Austin</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'uthscsa')">
                    <xsl:text>UT Health Science Center San Antonio</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'lsc')">
                    <xsl:text>University of Texas H.J. Lutcher Stark Center</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'tyrrell')">
                    <xsl:text>Tyrrell Historical Library, Beaumont Public Library System</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'utep')">
                    <xsl:text>UT El Paso</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'uttyler')">
                    <xsl:text>University of Texas at Tyler, University Archives and Special Collections</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'tamucc')">
                    <xsl:text>Special Collections and Archives, Texas A&amp;M University-Corpus Christi</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'concordia')">
                    <xsl:text>Concordia University Texas Historical Online Collection</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'etrc')">
                    <xsl:text>East Texas Research Center, Stephen F. Austin State University</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'haines')">
                    <xsl:text>Haines Medical Library at Scott &amp; White</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'lamar')">
                    <xsl:text>Lamar University's Archives and Special Collections</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'trinity')">
                    <xsl:text>Trinity University Special Collections and Archives</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'tsu')">
                    <xsl:text>Texas Southern University</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'ttu.av')">
                    <xsl:text>Texas Tech University Southwest Collection/Special Collections Library</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'untmlsc')">
                    <xsl:text>University of North Texas Music Library Special Collections</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'tamuk')">
                    <xsl:text>South Texas Archives at Texas A&amp;M University-Kingsville</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'dalhs')">
                    <xsl:text>Dallas Historical Society</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'bay.abl')">
                    <xsl:text>Baylor University, Armstrong Browning Library</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'bay.kc')">
                    <xsl:text>Baylor University, Keston Center for Religion, Politics, and Society</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'bay.tc')">
                    <xsl:text>Baylor University, The Texas Collection</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'bay.pll')">
                    <xsl:text>Baylor University, W.R. Poage Legislative Library</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'shsu')">
                    <xsl:text>Sam Houston State University, Special Collections</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'chhsm')">
                    <xsl:text>Chappell Hill Historical Society Museum</xsl:text>
                </xsl:when>
                <xsl:when test="contains($repo, 'swestern')">
                    <xsl:text>Southwestern University, Special Collections and Archives</xsl:text>
                </xsl:when>
            </xsl:choose>
            <xsl:text disable-output-escaping="yes">&#60;/dcvalue&#62;</xsl:text>
            <xsl:text>&#10;</xsl:text>

            <xsl:text disable-output-escaping="yes">&#60;dcvalue element="description"&#62;</xsl:text>
            <xsl:value-of select="normalize-space(ead/archdesc/did/abstract)" />
            <xsl:text disable-output-escaping="yes">&#60;/dcvalue&#62;</xsl:text>
            <xsl:text>&#10;</xsl:text>

        </dublin_core>
        <xsl:text>&#10;</xsl:text>

        <!-- Listing for the work's XML document -->
        
        <item>
            <xsl:text>&#10;</xsl:text>
            <dublin_core>
                <xsl:text>&#10;</xsl:text>
                <xsl:text disable-output-escaping="yes">&#60;dcvalue element="identifier"&#62;</xsl:text>
                <xsl:value-of select="concat($file, '.xml')" />
                <xsl:text disable-output-escaping="yes">&#60;/dcvalue&#62;</xsl:text>
                <xsl:text>&#10;</xsl:text>

                <xsl:text disable-output-escaping="yes">&#60;dcvalue element="identifier" qualifier="urn"&#62;</xsl:text>
                <xsl:value-of select="concat($repo, '.xml')" />
                <xsl:text disable-output-escaping="yes">&#60;/dcvalue&#62;</xsl:text>
                <xsl:text>&#10;</xsl:text>

                <xsl:text disable-output-escaping="yes">&#60;dcvalue element="identifier" qualifier="url"&#62;</xsl:text>
                <xsl:value-of select="concat('http://www.lib.utexas.edu/taro/', $repository, '/', $file, '.xml')" />
                <xsl:text disable-output-escaping="yes">&#60;/dcvalue&#62;</xsl:text>
                <xsl:text>&#10;</xsl:text>

                <xsl:text disable-output-escaping="yes">&#60;dcvalue element="type"&#62;</xsl:text>
                <xsl:text>Textual archival finding aid</xsl:text>
                <xsl:text disable-output-escaping="yes">&#60;/dcvalue&#62;</xsl:text>
                <xsl:text>&#10;</xsl:text>

                <xsl:text disable-output-escaping="yes">&#60;dcvalue element="format"&#62;</xsl:text>
                <xsl:text>text/xml</xsl:text>
                <xsl:text disable-output-escaping="yes">&#60;/dcvalue&#62;</xsl:text>
                <xsl:text>&#10;</xsl:text>
            </dublin_core>
            <xsl:text>&#10;</xsl:text>
        </item>
        <xsl:text>&#10;</xsl:text>

        <!-- Listing for the work's main HTML document -->

        <xsl:variable name="file2" select="substring-before($file, 'p1')" />
        <xsl:variable name="repo2" select="substring-before($repo, 'p1')" />

        <item>
            <xsl:text>&#10;</xsl:text>
            <dublin_core>
                <xsl:text>&#10;</xsl:text>
                <xsl:text disable-output-escaping="yes">&#60;dcvalue element="identifier"&#62;</xsl:text>
                <xsl:value-of select="concat($acronym, '-', $file, '.html')" />
                <xsl:text disable-output-escaping="yes">&#60;/dcvalue&#62;</xsl:text>
                <xsl:text>&#10;</xsl:text>

                <xsl:text disable-output-escaping="yes">&#60;dcvalue element="identifier" qualifier="urn"&#62;</xsl:text>
                <xsl:value-of select="concat($repo2, '.', $acronym, '-', $file, '.html')" />
                <xsl:text disable-output-escaping="yes">&#60;/dcvalue&#62;</xsl:text>
                <xsl:text>&#10;</xsl:text>

                <xsl:text disable-output-escaping="yes">&#60;dcvalue element="identifier" qualifier="url"&#62;</xsl:text>
                <xsl:value-of select="concat('http://www.lib.utexas.edu/taro/', $repository, '/', $file2, '/', $acronym, '-', $file, '.html')" />
                <xsl:text disable-output-escaping="yes">&#60;/dcvalue&#62;</xsl:text>
                <xsl:text>&#10;</xsl:text>

                <xsl:text disable-output-escaping="yes">&#60;dcvalue element="type"&#62;</xsl:text>
                <xsl:text>Textual archival finding aid</xsl:text>
                <xsl:text disable-output-escaping="yes">&#60;/dcvalue&#62;</xsl:text>
                <xsl:text>&#10;</xsl:text>

                <xsl:text disable-output-escaping="yes">&#60;dcvalue element="format"&#62;</xsl:text>
                <xsl:text>text/html</xsl:text>
                <xsl:text disable-output-escaping="yes">&#60;/dcvalue&#62;</xsl:text>
                <xsl:text>&#10;</xsl:text>
            </dublin_core>
            <xsl:text>&#10;</xsl:text>
        </item>
        <xsl:text>&#10;</xsl:text>

        <!-- Listing for the work's Print HTML document -->

        <item>
            <xsl:text>&#10;</xsl:text>
            <dublin_core>
                <xsl:text>&#10;</xsl:text>
                <xsl:text disable-output-escaping="yes">&#60;dcvalue element="identifier"&#62;</xsl:text>
                <xsl:value-of select="concat($file, '-P.html')" />
                <xsl:text disable-output-escaping="yes">&#60;/dcvalue&#62;</xsl:text>
                <xsl:text>&#10;</xsl:text>

                <xsl:text disable-output-escaping="yes">&#60;dcvalue element="identifier" qualifier="urn"&#62;</xsl:text>
                <xsl:value-of select="concat($repo2, '.', $file, '-P.html')" />
                <xsl:text disable-output-escaping="yes">&#60;/dcvalue&#62;</xsl:text>
                <xsl:text>&#10;</xsl:text>

                <xsl:text disable-output-escaping="yes">&#60;dcvalue element="identifier" qualifier="url"&#62;</xsl:text>
                <xsl:value-of select="concat('http://www.lib.utexas.edu/taro/', $repository, '/', $file2, '/', $file, '-P.html')" />
                <xsl:text disable-output-escaping="yes">&#60;/dcvalue&#62;</xsl:text>
                <xsl:text>&#10;</xsl:text>

                <xsl:text disable-output-escaping="yes">&#60;dcvalue element="type"&#62;</xsl:text>
                <xsl:text>Textual archival finding aid</xsl:text>
                <xsl:text disable-output-escaping="yes">&#60;/dcvalue&#62;</xsl:text>
                <xsl:text>&#10;</xsl:text>

                <xsl:text disable-output-escaping="yes">&#60;dcvalue element="format"&#62;</xsl:text>
                <xsl:text>text/html</xsl:text>
                <xsl:text disable-output-escaping="yes">&#60;/dcvalue&#62;</xsl:text>
                <xsl:text>&#10;</xsl:text>
            </dublin_core>
            <xsl:text>&#10;</xsl:text>
        </item>
        <xsl:text>&#10;</xsl:text>

        <!-- Listing for the work's Images and Sound bites -->

        <xsl:for-each select="ead//dao">

            <xsl:variable name="filename">
                <xsl:call-template name="filename-from-path">
                    <xsl:with-param name="name" select="@href" />
                </xsl:call-template>
            </xsl:variable>

            <item>
                <xsl:text>&#10;</xsl:text>
                <dublin_core>
                    <xsl:text>&#10;</xsl:text>
                    <xsl:text disable-output-escaping="yes">&#60;dcvalue element="identifier"&#62;</xsl:text>
                    <xsl:value-of select="$filename" />
                    <xsl:text disable-output-escaping="yes">&#60;/dcvalue&#62;</xsl:text>
                    <xsl:text>&#10;</xsl:text>

                    <xsl:text disable-output-escaping="yes">&#60;dcvalue element="identifier" qualifier="title"&#62;</xsl:text>
                    <xsl:value-of select="@title" />
                    <xsl:text disable-output-escaping="yes">&#60;/dcvalue&#62;</xsl:text>
                    <xsl:text>&#10;</xsl:text>

                    <xsl:text disable-output-escaping="yes">&#60;dcvalue element="identifier" qualifier="url"&#62;</xsl:text>
                    <xsl:value-of select="@href" />
                    <xsl:text disable-output-escaping="yes">&#60;/dcvalue&#62;</xsl:text>
                    <xsl:text>&#10;</xsl:text>

                    <xsl:text disable-output-escaping="yes">&#60;dcvalue element="format"&#62;</xsl:text>
                    <xsl:choose>
                        <xsl:when test="contains(@href, '.txt')">
                            <xsl:text>text/plain</xsl:text>
                        </xsl:when>
                        <xsl:when test="contains(@href, '.htm') or contains(@href, '.html')">
                            <xsl:text>text/html</xsl:text>
                        </xsl:when>
                        <xsl:when test="contains(@href, '.mp1') or contains(@href, '.mp2') or contains(@href, '.mp3')">
                            <xsl:text>audio/mpeg</xsl:text>
                        </xsl:when>
                        <xsl:when test="contains(@href, '.ram') or contains(@href, '.rm') or contains(@href, '.ra')">
                            <xsl:text>audio/x-pn-realaudio</xsl:text>
                        </xsl:when>
                        <xsl:when test="contains(@href, '.wav')">
                            <xsl:text>audio/x-pn-windows-pcm</xsl:text>
                        </xsl:when>
                        <xsl:when test="contains(@href, '.jpeg') or contains(@href, '.jpe') or contains(@href, '.jpg')">
                            <xsl:text>image/jpeg</xsl:text>
                        </xsl:when>
                        <xsl:when test="contains(@href, '.gif')">
                            <xsl:text>image/gif</xsl:text>
                        </xsl:when>
                        <xsl:when test="contains(@href, '.png')">
                            <xsl:text>image/png</xsl:text>
                        </xsl:when>
                        <xsl:when test="contains(@href, '.tif')">
                            <xsl:text>image/tiff</xsl:text>
                        </xsl:when>
                        <xsl:when test="contains(@href, '.mov') or contains(@href, '.qt')">
                            <xsl:text>video/quicktime</xsl:text>
                        </xsl:when>
                        <xsl:when test="contains(@href, '.pdf')">
                            <xsl:text>application/pdf</xsl:text>
                        </xsl:when>
                        <xsl:when test="contains(@href, '.doc')">
                            <xsl:text>application/msword</xsl:text>
                        </xsl:when>
                        <xsl:when test="contains(@href, '.ppt')">
                            <xsl:text>application/powerpoint</xsl:text>
                        </xsl:when>
                        <xsl:when test="contains(@href, '.rtf')">
                            <xsl:text>application/rtf </xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>Format unknown</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:text disable-output-escaping="yes">&#60;/dcvalue&#62;</xsl:text>
                    <xsl:text>&#10;</xsl:text>
                </dublin_core>
                <xsl:text>&#10;</xsl:text>
            </item>
            <xsl:text>&#10;</xsl:text>

        </xsl:for-each>

        <!-- </work> -->

    </xsl:template>

    <xsl:template name="filename-from-path">
        <xsl:param name="name" />
        <xsl:choose>
            <xsl:when test="contains($name, '/')">
                <xsl:call-template name="filename-from-path">
                    <xsl:with-param name="name" select="substring-after($name, '/')" />
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$name" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
