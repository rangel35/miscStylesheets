<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
	xmlns:ead="urn:isbn:1-931666-22-9" xmlns:xlink="http://www.w3.org/1999/xlink">
	<xsl:output omit-xml-declaration="yes" indent="yes"/>
	<xsl:strip-space elements="*"/>

	<xsl:include href="xmlsize_2.xsl"/>

	<!-- Creates the body of the finding aid.-->
	<xsl:template match="/">
		<xsl:variable name="file">
			<xsl:value-of select="ead:ead/ead:eadheader/ead:eadid"/>
		</xsl:variable>
		<html lang="en">
			<head>
				<title>
					<xsl:value-of
						select="normalize-space(ead:ead/ead:eadheader/ead:filedesc/ead:titlestmt/ead:titleproper)"/>
					<xsl:text> </xsl:text>
					<xsl:value-of
						select="normalize-space(ead:ead/ead:eadheader/ead:filedesc/ead:titlestmt/ead:subtitle)"
					/>
				</title>
				<link href="/taro/taro-aid.css" rel="styleSheet" type="text/css"/>
				<xsl:element name="meta">
					<xsl:attribute name="name">DC.Title</xsl:attribute>
					<xsl:attribute name="content">
						<xsl:value-of
							select="normalize-space(ead:ead/ead:eadheader/ead:filedesc/ead:titlestmt/ead:titleproper)"/>
						<xsl:text> </xsl:text>
						<xsl:value-of
							select="normalize-space(ead:ead/ead:eadheader/ead:filedesc/ead:titlestmt/ead:subtitle)"
						/>
					</xsl:attribute>
				</xsl:element>
				<xsl:if test="ead:ead/ead:archdesc/ead:did/ead:abstract[string-length(text()|*)!=0]">
					<xsl:element name="meta">
						<xsl:attribute name="name">DC.Description</xsl:attribute>
						<xsl:attribute name="content">
							<xsl:value-of
								select="normalize-space(ead:ead/ead:archdesc/ead:did/ead:abstract)"
							/>
						</xsl:attribute>
					</xsl:element>
				</xsl:if>
				<xsl:element name="meta">
					<xsl:attribute name="name">DC.Contributor</xsl:attribute>
					<xsl:attribute name="content">
						<xsl:for-each
							select="ead:ead/ead:archdesc/ead:did/ead:origination/ead:persname | ead:ead/ead:archdesc/ead:did/ead:origination/ead:corpname | ead:ead/ead:archdesc//ead:controlaccess//ead:persname | ead:ead/ead:archdesc//ead:controlaccess//ead:corpname[@encodinganalog='700'] | ead:ead/ead:archdesc//ead:controlaccess//ead:corpname[@encodinganalog='710'] | ead:ead/ead:archdesc//ead:controlaccess//ead:famname | ead:ead/ead:archdesc//ead:controlaccess//ead:name">
							<xsl:value-of select="normalize-space(.)"/>
							<xsl:text>  </xsl:text>
						</xsl:for-each>
					</xsl:attribute>
				</xsl:element>
				<xsl:element name="meta">
					<xsl:attribute name="name">DC.Creator</xsl:attribute>
					<xsl:attribute name="content">
						<xsl:for-each select="ead:ead/ead:archdesc/ead:did/ead:origination">
							<xsl:value-of select="normalize-space(.)"/>
							<xsl:text>  </xsl:text>
						</xsl:for-each>
					</xsl:attribute>
				</xsl:element>
				<xsl:element name="meta">
					<xsl:attribute name="name">names</xsl:attribute>
					<xsl:attribute name="content">
						<xsl:for-each
							select="ead:ead/ead:archdesc/ead:did/ead:origination/ead:persname | ead:ead/ead:archdesc/ead:did/ead:origination/ead:corpname | ead:ead/ead:archdesc/ead:did/ead:origination | ead:ead/ead:archdesc//ead:controlaccess//ead:persname | ead:ead/ead:archdesc//ead:controlaccess//ead:corpname[@encodinganalog='700'] | ead:ead/ead:archdesc//ead:controlaccess//ead:corpname[@encodinganalog='710'] | ead:ead/ead:archdesc//ead:controlaccess//ead:famname | ead:ead/ead:archdesc//ead:controlaccess//ead:name">
							<xsl:value-of select="normalize-space(.)"/>
							<xsl:text>  </xsl:text>
						</xsl:for-each>
					</xsl:attribute>
				</xsl:element>
				<xsl:variable name="repo">
					<xsl:value-of select="ead:ead/ead:eadheader/ead:eadid"/>
				</xsl:variable>
				<xsl:element name="meta">
					<xsl:choose>
						<xsl:when test="contains($repo, 'tslac')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">Texas State Archives</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'aushc')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">Austin History Center, Austin Public
								Library</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'houpub')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">Houston Metropolitan Research Center,
								Houston Public Library</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'hrc')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">Harry Ransom Humanities Research Center,
								University of Texas at Austin</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'law')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">Tarlton Law Library, University of Texas
								at Austin</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'aaa')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">The University of Texas at Austin.
								Alexander Architectural Archive</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'cah')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">The University of Texas at Austin. Dolph
								Briscoe Center for American History</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'blac')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">The University of Texas at Austin. Benson
								Latin American Collection</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'ttu.va')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">The Vietnam Center and Archive, Texas Tech
								University</xsl:attribute>
						</xsl:when>
						<xsl:when
							test="contains($repo, 'swcpc') or contains($repo, 'ttu.sw') or contains($repo, 'ttu.rb') or contains($repo, 'ttu.ua') or contains($repo, 'ttu.av')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">Texas Tech University Southwest
								Collection/Special Collections Library</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'cush')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">Texas A &amp; M University Cushing
								Memorial Library</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'uh')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">University of Houston Libraries, Special
								Collections</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'wrc')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">Rice University Fondren
								Library</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'smu')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">Southern Methodist
								University</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'utpanam')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">University of Texas-Pan
								American</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'tsusm')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">Texas State University</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'utsa')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">University of Texas San
								Antonio</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'utep')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">University of Texas El
								Paso</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'utmb')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">Truman G. Blocker, Jr. History of Medicine
								Collections, Moody Medical Library, University of Texas Medical
								Branch</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'utmda')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">University of Texas M.D. Anderson Cancer
								Center</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'ojac')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">Robert E. Nail, Jr. Historical Archives at
								Old Jail Art Center</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'utarl')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">University of Texas Arlington Library,
								Special Collections</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'twu')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">Texas Woman's University, the Woman's
								Collection</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'hamtmc')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">Houston Academy of Medicine-Texas Medical
								Center Library, John P. McGovern Historical Collections and Research
								Center</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'dalpub')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">Texas/Dallas History and Archives
								Division, Dallas Public Library</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'unt')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">University of North Texas
								Archives</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'stthomas')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">University of St. Thomas
								Archives</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'sama')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">San Antonio Municipal
								Archives</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'fal')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">Fine Arts Library, University of Texas at
								Austin</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'txglo')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">Texas General Land Office, Archives &amp;
								Records</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'drtsa')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">Daughters of the Republic of Texas Library
								at the Alamo</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'sjmh')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">Albert and Ethel Herzstein Library, San
								Jacinto Museum of History</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'aalgs')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">African American Library at the Gregory
								School </xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'apts')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">Austin Presbyterian Theological
								Seminary</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'hscsa')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">University of Texas Health Science Center
								San Antonio</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'hrdi')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">Human Rights Documentation Initiative,
								University of Texas at Austin</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'lsc')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">University of Texas H.J. Lutcher Stark
								Center</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'tyrrell')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">Tyrrell Historical Library, Beaumont
								Public Library System</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'tamucc')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">Special Collections and Archives, Texas
								A&amp;M University-Corpus Christi</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'uttyler')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">University of Texas at Tyler, University
								Archives and Special Collections</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'concordia')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">Concordia University Texas Historical
								Online Collection</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'lamar')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">Lamar University, Archives and Special
								Collections</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'shsu')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">Sam Houston State University, Special
								Collections</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'tamuk')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">Texas A&amp;M University Kingsville, South
								Texas Archives</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'dalhs')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">Dallas Historical Society</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'baylor.tc')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">Baylor University, The Texas
								Collection</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'baylor.abl')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">Baylor University, Armstrong Browning
								Library</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'baylor.kc')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">Baylor University, Keston Center for
								Religion, Politics, and Society</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'baylor.pll')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">Baylor University, W.R. Poage Legislative
								Library</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'trinity')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">Trinity University Special Collections and
								Archives</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'etrc')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">East Texas Research Center, Stephen F.
								Austin State University</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'haines')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">Haines Medical Library at Scott &amp;
								White</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'untmlsc')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">University of North Texas Music Library
								Special Collections</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'tsu')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">Texas Southern University</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'swestern')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">Southwestern University, Special
								Collections &amp; Archives</xsl:attribute>
						</xsl:when>
						<xsl:when test="contains($repo, 'chhsm')">
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">Chappell Hill Historical Society
								Museum</xsl:attribute>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="name">DC.Publisher</xsl:attribute>
							<xsl:attribute name="content">Error</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:element>
				<xsl:for-each
					select="ead:ead/ead:archdesc//ead:controlaccess//ead:persname | ead:ead/ead:archdesc//ead:controlaccess//ead:corpname">
					<xsl:choose>
						<xsl:when test="@encodinganalog='600'">
							<xsl:element name="meta">
								<xsl:attribute name="name">DC.Subject</xsl:attribute>
								<xsl:attribute name="content">
									<xsl:value-of select="normalize-space(.)"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:when>
						<xsl:when test="@encodinganalog='610'">
							<xsl:element name="meta">
								<xsl:attribute name="name">DC.Subject</xsl:attribute>
								<xsl:attribute name="content">
									<xsl:value-of select="normalize-space(.)"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:when>
						<xsl:when test="@encodinganalog='611'">
							<xsl:element name="meta">
								<xsl:attribute name="name">DC.Subject</xsl:attribute>
								<xsl:attribute name="content">
									<xsl:value-of select="normalize-space(.)"/>
								</xsl:attribute>
							</xsl:element>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
				<xsl:for-each select="ead:ead/ead:archdesc//ead:controlaccess//ead:subject">
					<xsl:element name="meta">
						<xsl:attribute name="name">DC.Subject</xsl:attribute>
						<xsl:attribute name="content">
							<xsl:value-of select="normalize-space(.)"/>
						</xsl:attribute>
					</xsl:element>
				</xsl:for-each>
				<xsl:if
					test="ead:ead/ead:archdesc//ead:controlaccess//ead:genreform[string-length(text()|*)!=0]">
					<xsl:element name="meta">
						<xsl:attribute name="name">DC.Format</xsl:attribute>
						<xsl:attribute name="content">
							<xsl:for-each
								select="ead:ead/ead:archdesc//ead:controlaccess//ead:genreform">
								<xsl:value-of select="normalize-space(.)"/>
								<xsl:text>  </xsl:text>
							</xsl:for-each>
						</xsl:attribute>
					</xsl:element>
				</xsl:if>
				<xsl:if
					test="ead:ead/ead:archdesc//ead:controlaccess//ead:geogname[string-length(text()|*)!=0]">
					<xsl:element name="meta">
						<xsl:attribute name="name">DC.Coverage</xsl:attribute>
						<xsl:attribute name="content">
							<xsl:for-each
								select="ead:ead/ead:archdesc//ead:controlaccess//ead:geogname">
								<xsl:value-of select="normalize-space(.)"/>
								<xsl:text>  </xsl:text>
							</xsl:for-each>
						</xsl:attribute>
					</xsl:element>
				</xsl:if>
			</head>
			<body class="findingaid-full">
				<xsl:variable name="reps">
					<xsl:value-of select="ead:ead/ead:eadheader/ead:eadid"/>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="contains($reps, 'tslac')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_tslac1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'ojac')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_ojac1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'aushc')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_ahc1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'houpub')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_hpub1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'hrc')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_hrc1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'law')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_law1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'aaa')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_aaa1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'cah')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_cah1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'blac')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_lac1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when
						test="contains($reps, 'swcpc') or contains($reps, 'ttu.sw') or contains($reps, 'ttu.rb') or contains($reps, 'ttu.ua') or contains($reps, 'ttu.av')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_tech1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'cush')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_tamu1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'uh')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_houston1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'wrc')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_rice1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'smu')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_smu1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'utpanam')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_utpanam1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'tsusm')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_tsu1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'utsa')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_utsa1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'utep')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_utep1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'utmb')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_utmb1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'utmda')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_utmda1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'utarl')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_utarl1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'twu')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_twu1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'hamtmc')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_tmc1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'dalpub')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_dpub1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'unt')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_unt1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'stthomas')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_ust1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'sama')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_sama1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'fal')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_fal1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'txglo')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_glo1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'drtsa')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_drt1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'sjmh')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_sjmh1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'aalgs')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_aal1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'ttu.va')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_tva1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'apts')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_apts1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'hscsa')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_hscsa1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'hrdi')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_hrdi1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'lsc')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_lsc1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'tyrrell')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_thl1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'tamucc')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_tcc1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'uttyler')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_tyl1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'concordia')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_cu1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'lamar')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_lu1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'shsu')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_shsu1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'dalhs')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_dhs1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'chhsm')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_chh1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'swestern')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_su1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'tamuk')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_tk1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'baylor.tc')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_btc1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'baylor.abl')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_babl1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'baylor.kc')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_bkc1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'baylor.pll')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_bpll1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'trinity')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_tu1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'etrc')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_etrc1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'haines')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_hml1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'untmlsc')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_mlsc.html"> Repository Browse List</a>
						</div>
					</xsl:when>
					<xsl:when test="contains($reps, 'tsu')">
						<div class="breadcrumb_aid-full">
							<a href="/taro/index.html">TARO</a> &gt; Finding Aid</div>
						<div class="breadcrumb_aid-full">
							<a href="/taro/browse/browse_ts1.html"> Repository Browse List</a>
						</div>
					</xsl:when>
				</xsl:choose>
				<table border="0" width="100%">
					<tr>
						<td valign="bottom">
							<div align="left">
								<xsl:choose>
									<xsl:when test="contains($reps, 'tslac')">
										<a href="http://www.tsl.state.tx.us/arc/archmail.html">
											<big class="contact">Contact Us</big>
										</a>
									</xsl:when>
									<xsl:when test="contains($reps, 'aushc')">
										<a
											href="http://library.austintexas.gov/ahc/contact-austin-history-center">
											<big class="contact">Contact Us</big>
										</a>
									</xsl:when>
									<xsl:otherwise>
										<form action="/taro/contact.html" method="post">
											<input type="hidden" name="referer" value="{$reps}"/>
											<input type="submit" name="foo" value="Contact Us"/>
										</form>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</td>
						<td align="left" valign="top">
							<br/>
							<div align="right">
								<xsl:call-template name="toggle"/>
							</div>
							<a href="/taro/index.html">
								<img src="/taro/graphics/head-tarosmall.jpg" width="292" height="31"
									alt="Texas Archival Resources Online" border="0"/>
							</a>
							<xsl:text>&#10;</xsl:text>
							<div align="right">
								<xsl:text>&#10;</xsl:text>
								<xsl:text disable-output-escaping="yes">&#60;?php include("../access.html");?&#62;</xsl:text>
							</div>
						</td>
					</tr>
				</table>
				<table width="100%" cellpadding="5">
					<tr>
						<td width="20%"/>
						<td width="80%"/>
					</tr>
					<tr>
						<td valign="top" class="toc-aid">
							<xsl:call-template name="toc"/>
						</td>
						<td valign="top" class="content-aid">
							<xsl:call-template name="body"/>
						</td>
					</tr>
				</table>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="toc">
		<xsl:variable name="file">
			<xsl:value-of select="ead:ead/ead:eadheader/ead:eadid"/>
		</xsl:variable>
		<a name="a0">
			<h3>TABLE OF CONTENTS</h3>
		</a>
		<br/>
		<!-- A series of tests determine which elements will be included in the table of contents.-->
		<xsl:if test="ead:ead/ead:archdesc/ead:did">
			<p>
				<strong>
					<a href="#did">
						<xsl:value-of select="ead:ead/ead:archdesc/ead:did/ead:head"/>
					</a>
				</strong>
			</p>
		</xsl:if>
		<xsl:for-each select="ead:ead/ead:archdesc/ead:bioghist">
			<xsl:if test="self::node()[string-length(text()|*)!=0]">
				<p class="toc-lev1">
					<strong>
						<xsl:text disable-output-escaping="yes">&#60;a href="#bioghist</xsl:text>
						<xsl:value-of select="attribute::id"/>
						<xsl:text disable-output-escaping="yes">"&#62;</xsl:text>
						<xsl:value-of select="ead:head"/>
						<xsl:text disable-output-escaping="yes">&#60;/a&#62;</xsl:text>
					</strong>
				</p>
			</xsl:if>
		</xsl:for-each>
		<xsl:if test="ead:ead/ead:archdesc/ead:scopecontent[string-length(text()|*)!=0]">
			<p class="toc-lev1">
				<strong>
					<a href="#scopecontent">
						<xsl:value-of select="ead:ead/ead:archdesc/ead:scopecontent/ead:head"/>
					</a>
				</strong>
			</p>
		</xsl:if>
		<xsl:if test="ead:ead/ead:archdesc/ead:arrangement[string-length(text()|*)!=0]">
			<p class="toc-lev1">
				<strong>
					<a href="#arrangementlink">
						<xsl:value-of select="ead:ead/ead:archdesc/ead:arrangement/ead:head"/>
					</a>
				</strong>
			</p>
		</xsl:if>
		<xsl:if
			test="ead:ead/ead:archdesc//ead:userestrict[string-length(text()|*)!=0] | ead:ead/ead:archdesc//ead:accessrestrict[string-length(text()|*)!=0]">
			<p class="toc-lev1">
				<strong>
					<a href="#restrictlink">
						<xsl:text>Restrictions</xsl:text>
					</a>
				</strong>
			</p>
		</xsl:if>
		<xsl:if test="ead:ead/ead:archdesc/ead:controlaccess[string-length(text()|*)!=0]">
			<p class="toc-lev1">
				<strong>
					<a href="#controlaccess">
						<xsl:value-of select="ead:ead/ead:archdesc/ead:controlaccess/ead:head"/>
					</a>
				</strong>
			</p>
		</xsl:if>
		<xsl:if test="ead:ead/ead:archdesc//ead:relatedmaterial[string-length(text()|*)!=0]">
			<p class="toc-lev1">
				<strong>
					<a href="#relatedmatlink"> Related Material </a>
				</strong>
			</p>
		</xsl:if>
		<xsl:if test="ead:ead/ead:archdesc//ead:separatedmaterial[string-length(text()|*)!=0]">
			<p class="toc-lev1">
				<strong>
					<a href="#sepmatlink"> Separated Material </a>
				</strong>
			</p>
		</xsl:if>
		<xsl:if
			test="ead:ead/ead:archdesc//ead:acqinfo[string-length(text()|*)!=0] | ead:ead/ead:archdesc//ead:processinfo[string-length(text()|*)!=0] | ead:ead/ead:archdesc//ead:prefercite[string-length(text()|*)!=0] | ead:ead/ead:archdesc//ead:custodialhist[string-length(text()|*)!=0] | ead:ead/ead:archdesc//ead:appraisal | ead:ead/ead:archdesc//ead:altformavailable | ead:ead/ead:archdesc//ead:accruals[string-length(text()|*)!=0]">
			<p class="toc-lev1">
				<strong>
					<a href="#adminlink"> Administrative Information </a>
				</strong>
			</p>
		</xsl:if>
		<xsl:if test="ead:ead/ead:archdesc//ead:otherfindaid[string-length(text()|*)!=0]">
			<p class="toc-lev1">
				<strong>
					<xsl:choose>
						<xsl:when test="ead:archdesc/ead:otherfindaid/ead:head">
							<a href="#otherfindaid">
								<xsl:value-of select="ead:archdesc/ead:otherfindaid/ead:head"/>
							</a>
						</xsl:when>
						<xsl:when test="ead:archdesc/*/ead:otherfindaid/ead:head">
							<a href="#otherfindaid">
								<xsl:value-of select="ead:archdesc/*/ead:otherfindaid/ead:head"/>
							</a>
						</xsl:when>
					</xsl:choose>
				</strong>
			</p>
		</xsl:if>
		<!--The next test covers the situation where there is more than one odd element in the document. -->
		<xsl:if test="ead:ead/ead:archdesc/ead:odd[string-length(text()|*)!=0]">
			<xsl:for-each select="ead:ead/ead:archdesc/ead:odd">
				<xsl:choose>
					<xsl:when test="@type='index'"/>
					<xsl:otherwise>
						<p class="toc-lev1">
							<strong>
								<a>
									<xsl:attribute name="href">#odd<xsl:number value="position()"
											format="1"/>
									</xsl:attribute>
									<xsl:value-of select="./ead:head"/>
								</a>
							</strong>
						</p>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="ead:ead/ead:archdesc//ead:bibliography[string-length(text()|*)!=0]">
			<p class="toc-lev1">
				<strong>
					<xsl:choose>
						<xsl:when
							test="ead:ead/ead:archdesc//ead:bibliography/ead:head[string-length(text()|*)!=0]">
							<a href="#bibliography">
								<xsl:value-of
									select="ead:ead/ead:archdesc//ead:bibliography/ead:head"/>
							</a>
						</xsl:when>
						<xsl:otherwise>
							<a href="#a10">
								<xsl:text>Bibliography</xsl:text>
							</a>
						</xsl:otherwise>
					</xsl:choose>
				</strong>
			</p>
		</xsl:if>
		<!--   <xsl:if test="ead:ead/ead:archdesc/ead:dsc[string-length(text()|*)!=0]">
      <p class="toc-lev1">
        <strong>
          <xsl:choose>
            <xsl:when test="ead:archdesc/ead:dsc/ead:head[string-length(text()|*)!=0]">
              <a href="#a23">
                <xsl:value-of select="ead:archdesc/ead:dsc/ead:head"/>
              </a>
            </xsl:when>
            <xsl:otherwise>
              <a href="#a23">
                <xsl:value-of select="ead:archdesc/*/ead:index/ead:head"/>
              </a>
            </xsl:otherwise>
          </xsl:choose>
        </strong>
      </p>
    </xsl:if> -->
		<xsl:if test="ead:ead/ead:archdesc/ead:dsc[string-length(text()|*)!=0]">
			<xsl:choose>
				<xsl:when
					test="ead:ead/ead:archdesc/ead:dsc/ead:c01/child::ead:c02 | ead:ead/ead:archdesc/ead:dsc/ead:c01/child::ead:scopecontent">
					<xsl:choose>
						<xsl:when test="string(ead:archdesc/ead:dsc/ead:head)">
							<p class="toc-lev1">
								<strong>
									<a href="#a23">
										<xsl:value-of select="ead:archdesc/ead:dsc/ead:head"/>
									</a>
								</strong>
							</p>
						</xsl:when>
						<xsl:otherwise>
							<p class="toc-lev1">
								<strong>
									<a href="#a23">
										<xsl:text>Description of Series</xsl:text>
									</a>
								</strong>
							</p>
						</xsl:otherwise>
					</xsl:choose>
					<!-- Displays the title and date of each series and numbers them to form a hyperlink to them.-->
					<xsl:for-each select="ead:ead/ead:archdesc/ead:dsc/ead:c01">
						<p class="toc-lev2">
							<strong>
								<a>
									<xsl:attribute name="href">#series<xsl:number value="position()"
											format="1"/>
									</xsl:attribute>
									<xsl:choose>
										<xsl:when test="ead:did/ead:unittitle/ead:unitdate">
											<xsl:for-each select="ead:did/ead:unittitle">
												<xsl:value-of select="text()"/>
												<xsl:text> </xsl:text>
												<xsl:apply-templates select="./ead:unitdate"/>
											</xsl:for-each>
										</xsl:when>
										<xsl:when test="ead:did/ead:unittitle/ead:emph">
											<xsl:choose>
												<xsl:when
												test="ead:did/ead:unittitle/ead:emph/ead:unitdate">
												<xsl:for-each
												select="ead:did/ead:unittitle/ead:emph">
												<xsl:value-of select="text()"/>
												<xsl:text> </xsl:text>
												<xsl:apply-templates select="./ead:unitdate"/>
												</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
												<xsl:apply-templates
												select="ead:did/ead:unittitle/ead:emph"/>
												<xsl:text> </xsl:text>
												<xsl:apply-templates
												select="ead:did/ead:unitdate/ead:emph"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:when>
										<xsl:otherwise>
											<xsl:apply-templates select="ead:did/ead:unittitle"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates select="ead:did/ead:unitdate"/>
										</xsl:otherwise>
									</xsl:choose>
								</a>
							</strong>
						</p>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<a href="#a23">
						<p class="toc-lev1">
							<strong>
								<xsl:choose>
									<xsl:when
										test="ead:ead/ead:archdesc/ead:dsc/ead:head[string-length(text()|*)!=0]">
										<xsl:value-of select="ead:ead/ead:archdesc/ead:dsc/ead:head"
										/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text>Description of Series</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
							</strong>
						</p>
					</a>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<!--The next test covers the situation where the index is labelled as an one odd element in the document. -->
		<xsl:if test="ead:ead/ead:archdesc/ead:odd[string-length(text()|*)!=0]">
			<xsl:for-each select="ead:ead/ead:archdesc/ead:odd">
				<xsl:if test="@type='index'">
					<p class="toc-lev1">
						<strong>
							<a>
								<xsl:attribute name="href">#odd<xsl:number value="position()"
										format="1"/>
								</xsl:attribute>
								<xsl:text>Index</xsl:text>
							</a>
						</strong>
					</p>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="ead:ead/ead:archdesc/ead:index[string-length(text()|*)!=0]">
			<p class="toc-lev1">
				<strong>
					<xsl:choose>
						<xsl:when
							test="ead:ead/ead:archdesc/ead:index/ead:head[string-length(text()|*)!=0]">
							<a href="#index">
								<xsl:value-of select="ead:ead/ead:archdesc/ead:index/ead:head"/>
							</a>
						</xsl:when>
						<xsl:otherwise>
							<a href="#index">
								<xsl:text>Index</xsl:text>
							</a>
						</xsl:otherwise>
					</xsl:choose>
				</strong>
			</p>
		</xsl:if>
		<!--End of the table of contents. -->
	</xsl:template>
	<xsl:template name="sponsor">
		<xsl:for-each select="ead:ead/ead:eadheader//ead:sponsor">
			<table width="100%">
				<tr>
					<td width="5%"/>
					<td width="20%" valign="top">
						<strong>
							<xsl:text>Sponsor: </xsl:text>
						</strong>
					</td>
					<td width="75%">
						<xsl:apply-templates/>
					</td>
				</tr>
			</table>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="body">
		<xsl:variable name="file">
			<xsl:value-of select="ead:ead/ead:eadheader/ead:eadid"/>
		</xsl:variable>
		<xsl:call-template name="eadlogo"/>
		<xsl:call-template name="eadheader"/>
		<xsl:call-template name="archdesc-did"/>
		<xsl:call-template name="sponsor"/>
		<hr/>
		<xsl:call-template name="archdesc-bioghist"/>
		<xsl:call-template name="archdesc-scopecontent"/>
		<xsl:call-template name="archdesc-arrangement"/>
		<xsl:call-template name="archdesc-restrict"/>
		<xsl:call-template name="archdesc-control"/>
		<xsl:call-template name="archdesc-relatedmaterial"/>
		<xsl:call-template name="archdesc-admininfo"/>
		<xsl:call-template name="archdesc-otherfindaid"/>
		<xsl:call-template name="archdesc-odd"/>
		<xsl:call-template name="archdesc-bibliography"/>
		<xsl:call-template name="dsc"/>
		<xsl:call-template name="archdesc-index"/>
		<xsl:call-template name="archdesc-odd2"/>
		<!-- <xsl:call-template name="index-list"/> -->
		<xsl:call-template name="endnav"/>
	</xsl:template>
	<!-- MR added to create school logo -->
	<xsl:template name="eadlogo">
		<xsl:text>&#10;</xsl:text>
		<xsl:text disable-output-escaping="yes">&#60;?php include("../logo.html");?&#62;</xsl:text>
	</xsl:template>
	<xsl:template name="eadheader">
		<xsl:for-each select="ead:ead/ead:eadheader/ead:filedesc/ead:titlestmt">
			<h2 style="text-align:center">
				<xsl:value-of select="ead:titleproper"/>
			</h2>
			<h3 style="text-align:center">
				<xsl:value-of select="ead:subtitle"/>
			</h3>
			<br/>
		</xsl:for-each>
		<hr/>
	</xsl:template>
	<!-- The following general templates format the display of various RENDER attributes.-->
	<xsl:template match="ead:emph[@render='bold']">
		<strong>
			<xsl:apply-templates/>
		</strong>
	</xsl:template>
	<xsl:template match="ead:emph[@render='italic']">
		<em>
			<xsl:apply-templates/>
		</em>
	</xsl:template>
	<xsl:template match="ead:emph[@render='underline']">
		<u>
			<xsl:apply-templates/>
		</u>
	</xsl:template>
	<xsl:template match="ead:emph[@render='sub']">
		<sub>
			<xsl:apply-templates/>
		</sub>
	</xsl:template>
	<xsl:template match="ead:emph[@render='super']">
		<super>
			<xsl:apply-templates/>
		</super>
	</xsl:template>
	<xsl:template match="ead:emph[@render='doublequote']">
		<xsl:text>"</xsl:text>
		<xsl:apply-templates/>
		<xsl:text>"</xsl:text>
	</xsl:template>
	<xsl:template match="ead:emph[@render='singlequote']">
		<xsl:text>'</xsl:text>
		<xsl:apply-templates/>
		<xsl:text>'</xsl:text>
	</xsl:template>
	<xsl:template match="ead:emph[@render='bolddoublequote']">
		<strong>
			<xsl:text>"</xsl:text>
			<xsl:apply-templates/>
			<xsl:text>"</xsl:text>
		</strong>
	</xsl:template>
	<xsl:template match="ead:emph[@render='boldsinglequote']">
		<strong>
			<xsl:text>'</xsl:text>
			<xsl:apply-templates/>
			<xsl:text>'</xsl:text>
		</strong>
	</xsl:template>
	<xsl:template match="ead:emph[@render='boldunderline']">
		<strong>
			<u>
				<xsl:apply-templates/>
			</u>
		</strong>
	</xsl:template>
	<xsl:template match="ead:emph[@render='bolditalic']">
		<strong>
			<em>
				<xsl:apply-templates/>
			</em>
		</strong>
	</xsl:template>
	<xsl:template match="ead:emph[@render='boldsmcaps']">
		<span style="font-variant: small-caps">
			<strong>
				<xsl:apply-templates/>
			</strong>
		</span>
	</xsl:template>
	<xsl:template match="ead:emph[@render='smcaps']">
		<span style="font-variant: small-caps">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<xsl:template match="ead:title[@render='bold']">
		<strong>
			<xsl:apply-templates/>
		</strong>
	</xsl:template>
	<xsl:template match="ead:title[@render='italic']">
		<em>
			<xsl:apply-templates/>
		</em>
	</xsl:template>
	<xsl:template match="ead:title[@render='underline']">
		<u>
			<xsl:apply-templates/>
		</u>
	</xsl:template>
	<xsl:template match="ead:title[@render='sub']">
		<sub>
			<xsl:apply-templates/>
		</sub>
	</xsl:template>
	<xsl:template match="ead:title[@render='super']">
		<super>
			<xsl:apply-templates/>
		</super>
	</xsl:template>
	<xsl:template match="ead:title[@render='boldunderline']">
		<strong>
			<u>
				<xsl:apply-templates/>
			</u>
		</strong>
	</xsl:template>
	<xsl:template match="ead:title[@render='bolditalic']">
		<strong>
			<em>
				<xsl:apply-templates/>
			</em>
		</strong>
	</xsl:template>
	<xsl:template match="ead:title[@render='doublequote']">
		<xsl:text>"</xsl:text>
		<xsl:apply-templates/>
		<xsl:text>"</xsl:text>
	</xsl:template>
	<xsl:template match="ead:title[@render='singlequote']">
		<xsl:text>'</xsl:text>
		<xsl:apply-templates/>
		<xsl:text>'</xsl:text>
	</xsl:template>
	<xsl:template match="ead:title[@render='bolddoublequote']">
		<strong>
			<xsl:text>"</xsl:text>
			<xsl:apply-templates/>
			<xsl:text>"</xsl:text>
		</strong>
	</xsl:template>
	<xsl:template match="ead:title[@render='boldsinglequote']">
		<strong>
			<xsl:text>'</xsl:text>
			<xsl:apply-templates/>
			<xsl:text>'</xsl:text>
		</strong>
	</xsl:template>
	<xsl:template match="ead:title[@render='boldsmcaps']">
		<span style="font-variant: small-caps">
			<strong>
				<xsl:apply-templates/>
			</strong>
		</span>
	</xsl:template>
	<xsl:template match="ead:title[@render='smcaps']">
		<span style="font-variant: small-caps">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<!--This template rule formats a role attribute used in some tags.-->
	<xsl:template match="*[@role]">
		<strong>
			<xsl:apply-templates select="@role"/>
		</strong>
		<xsl:text> </xsl:text>
		<xsl:apply-templates/>
	</xsl:template>
	<!--This template rule formats a label attribute used in some tags.-->
	<xsl:template match="*[@label]">
		<br/>
		<strong>
			<xsl:apply-templates select="@label"/>
		</strong>
		<xsl:text> </xsl:text>
		<xsl:apply-templates/>
	</xsl:template>
	<!--This template rule formats an ID attribute used for the target of a ref.-->
	<xsl:template match="*[@id]">
		<a name="{@id}"/>
	</xsl:template>
	<!-- This template converts a Ref element into an HTML anchor.-->
	<xsl:template match="*/ead:ref"> &#32;&#32; <a href="#{@target}">
			<xsl:apply-templates/>
		</a>
	</xsl:template>
	<xsl:template match="ead:ptrgrp">
		<xsl:apply-templates/>
	</xsl:template>
	<!-- This template converts an "archref" element into an HTML anchor.-->
	<xsl:template match="ead:archref">
		<xsl:choose>
			<xsl:when test="@xlink:show='replace'">
				<a href="{@xlink:href}" target="_self">
					<xsl:apply-templates/>
				</a>
			</xsl:when>
			<xsl:when test="@xlink:show='new'">
				<a href="{@xlink:href}" target="_blank">
					<xsl:apply-templates/>
				</a>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- This template converts an "bibref" element into an HTML anchor.-->
	<xsl:template match="*/ead:bibref[@xlink:show='replace']">
		<a href="{@xlink:href}" target="_self">
			<xsl:apply-templates/>
		</a>
	</xsl:template>

	<xsl:template match="*/ead:bibref[@xlink:show='new']">
		<a href="{@xlink:href}" target="_blank">
			<xsl:apply-templates/>
		</a>
	</xsl:template>
	<!-- This template converts an "extptr" element into an HTML anchor.-->
	<xsl:template match="ead:extptr">
		<xsl:if test="@xlink:show='replace'">
			<a href="{@xlink:href}" target="_self">
				<xsl:apply-templates/>
			</a>
		</xsl:if>
		<xsl:if test="@xlink:show='embed'">
			<xsl:choose>
				<xsl:when test="@xlink:title">
					<img src="{@xlink:href}" alt="{@xlink:title}"/>
				</xsl:when>
				<xsl:otherwise>
					<img src="{@xlink:href}"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="@xlink:show='new'">
			<a href="{@xlink:href}" target="_blank">
				<xsl:apply-templates/>
			</a>
		</xsl:if>
	</xsl:template>
	<!-- This template converts a "dao" element into an HTML anchor.-->
	<!-- <dao linktype="simple" href="http://www.lib.utexas.edu/benson/rg/atitlan.jpg" actuate="onrequest" show="new"/> -->
	<xsl:template name="dao">
		<xsl:choose>
			<xsl:when test="@xlink:actuate='onload'">
				<xsl:choose>
					<xsl:when test="@xlink:title">
						<img src="{@xlink:href}" alt="{@xlink:title}"/>
					</xsl:when>
					<xsl:otherwise>
						<img src="{@xlink:href}"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="@xlink:actuate='onLoad'">
				<xsl:choose>
					<xsl:when test="@xlink:title">
						<img src="{@xlink:href}" alt="{@xlink:title}"/>
					</xsl:when>
					<xsl:otherwise>
						<img src="{@xlink:href}"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="@xlink:actuate='onrequest'">
				<xsl:choose>
					<xsl:when test="@xlink:title">
						<a href="{@xlink:href}" target="_blank">
							<xsl:value-of select="@xlink:title"/>
						</a>
					</xsl:when>
					<xsl:otherwise>
						<a href="{@xlink:href}" target="_blank">
							<xsl:value-of select="@xlink:href"/>
						</a>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="@xlink:actuate='onRequest'">
				<xsl:choose>
					<xsl:when test="@xlink:title">
						<a href="{@xlink:href}" target="_blank">
							<xsl:value-of select="@xlink:title"/>
						</a>
					</xsl:when>
					<xsl:otherwise>
						<a href="{@xlink:href}" target="_blank">
							<xsl:value-of select="@xlink:href"/>
						</a>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<a href="{@xlink:href}" target="_blank">
					<xsl:value-of select="@xlink:href"/>
				</a>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- This template converts an "extref" element into an HTML anchor.-->
	<xsl:template match="ead:extref">
		<xsl:if test="@xlink:show='replace'">
			<a href="{@xlink:href}" target="_self">
				<xsl:apply-templates/>
			</a>
		</xsl:if>
		<xsl:if test="@xlink:show='new'">
			<a href="{@xlink:href}" target="_blank">
				<xsl:apply-templates/>
			</a>
		</xsl:if>
		<xsl:if test="@xlink:show='showother'">
			<a href="{@xlink:href}">
				<xsl:apply-templates/>
			</a>
		</xsl:if>
	</xsl:template>
	<!--This template rule formats a list element.-->
	<xsl:template match="ead:list">
		<xsl:for-each select="ead:head">
			<h3>
				<xsl:apply-templates select="."/>
			</h3>
			<br/>
		</xsl:for-each>
		<xsl:choose>
			<xsl:when test="@type">
				<xsl:choose>
					<xsl:when test="@type='marked'">
						<ul>
							<xsl:for-each select="ead:item">
								<li>
									<xsl:apply-templates/>
								</li>
							</xsl:for-each>
						</ul>
					</xsl:when>
					<xsl:when test="@type='ordered'">
						<ol>
							<xsl:for-each select="ead:item">
								<li>
									<xsl:apply-templates/>
								</li>
							</xsl:for-each>
						</ol>
					</xsl:when>
					<xsl:when test="@type='deflist'">
						<dl>
							<xsl:for-each select="ead:listhead">
								<lh>
									<xsl:apply-templates/>
								</lh>
							</xsl:for-each>
							<xsl:for-each select="ead:defitem">
								<dt>
									<xsl:apply-templates select="ead:label"/>
									<dd>
										<xsl:apply-templates select="ead:item"/>
									</dd>
								</dt>
							</xsl:for-each>
						</dl>
					</xsl:when>
					<xsl:otherwise>
						<ul class="nostyle">
							<xsl:for-each select="ead:item">
								<li>
									<xsl:apply-templates/>
								</li>
							</xsl:for-each>
						</ul>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<ul class="nostyle">
					<xsl:for-each select="ead:item">
						<li>
							<xsl:apply-templates/>
						</li>
					</xsl:for-each>
				</ul>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--Formats a simple table with border. The width of each column is defined by the colwidth attribute in a colspec element.-->
	<xsl:template match="ead:table">
		<h3>
			<xsl:apply-templates select="ead:head"/>
		</h3>
		<xsl:for-each select="ead:tgroup">
			<table border="1" align="center">
				<tr>
					<xsl:for-each select="ead:colspec">
						<td width="{@colwidth}"/>
					</xsl:for-each>
				</tr>
				<xsl:for-each select="ead:thead">
					<xsl:for-each select="ead:row">
						<tr>
							<xsl:for-each select="ead:entry">
								<xsl:choose>
									<xsl:when test="@align and @valign">
										<td align="{@align}" valign="{@valign}">
											<strong>
												<xsl:value-of select="."/>
											</strong>
										</td>
									</xsl:when>
									<xsl:when test="@align">
										<td align="{@align}">
											<strong>
												<xsl:value-of select="."/>
											</strong>
										</td>
									</xsl:when>
									<xsl:when test="@valign">
										<td align="left" valign="{@valign}">
											<strong>
												<xsl:value-of select="."/>
											</strong>
										</td>
									</xsl:when>
									<xsl:otherwise>
										<td align="left">
											<strong>
												<xsl:value-of select="."/>
											</strong>
										</td>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</tr>
					</xsl:for-each>
				</xsl:for-each>
				<xsl:for-each select="ead:tbody">
					<xsl:for-each select="ead:row">
						<tr>
							<xsl:for-each select="ead:entry">
								<xsl:choose>
									<xsl:when test="@align and @valign">
										<td align="{@align}" valign="{@valign}">
											<xsl:value-of select="."/>
										</td>
									</xsl:when>
									<xsl:when test="@align">
										<td align="{@align}">
											<xsl:value-of select="."/>
										</td>
									</xsl:when>
									<xsl:when test="@valign">
										<td align="left" valign="{@valign}">
											<xsl:value-of select="."/>
										</td>
									</xsl:when>
									<xsl:otherwise>
										<td align="left">
											<xsl:value-of select="."/>
										</td>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
						</tr>
					</xsl:for-each>
				</xsl:for-each>
			</table>
		</xsl:for-each>
	</xsl:template>
	<!--This template rule formats a name element.-->
	<xsl:template match="ead:name">
		<xsl:choose>
			<xsl:when test="parent::ead:origination">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:otherwise>
				<br/>
				<strong>
					<xsl:apply-templates/>
				</strong>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--This template rule formats an imprint element.-->
	<xsl:template match="ead:imprint">
		<xsl:for-each select="ead:geogname | ead:publisher | ead:date | ead:publicationstmt">
			<br/>
			<xsl:apply-templates/>
		</xsl:for-each>
	</xsl:template>
	<!--This template rule formats a num element.-->
	<xsl:template match="ead:num">
		<br/>
		<xsl:apply-templates/>
	</xsl:template>
	<!--This template rule formats an abbr element.-->
	<xsl:template match="ead:abbr">
		<br/>
		<strong>
			<xsl:apply-templates/>
		</strong>
	</xsl:template>
	<!--This template rule formats an extent element under a physdesc.-->
	<xsl:template match="*/ead:extent">
		<xsl:choose>
			<xsl:when test="parent::ead:physdesc">
				<xsl:value-of select="."/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--This template rule formats an expan element.-->
	<xsl:template match="ead:expan">
		<br/>
		<xsl:text>&#32;&#32;&#32;&#32;</xsl:text>
		<xsl:apply-templates/>
	</xsl:template>
	<!--This template rule formats a chronlist element.-->
	<xsl:template match="ead:chronlist">
		<table width="100%">
			<tr>
				<td width="5%"/>
				<td width="30%"/>
				<td width="65%"/>
			</tr>
			<xsl:apply-templates/>
		</table>
	</xsl:template>
	<xsl:template match="ead:chronlist/ead:listhead">
		<tr>
			<td/>
			<td>
				<strong>
					<xsl:apply-templates select="ead:head01"/>
				</strong>
			</td>
			<td>
				<strong>
					<xsl:apply-templates select="ead:head02"/>
				</strong>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="ead:chronlist/ead:chronitem">
		<!--Determine if there are event groups.-->
		<xsl:choose>
			<xsl:when test="ead:eventgrp">
				<!--Put the date and first event on the first line.-->
				<tr>
					<td/>
					<td valign="top">
						<xsl:apply-templates select="ead:date"/>
					</td>
					<td valign="top">
						<xsl:apply-templates select="ead:eventgrp/ead:event[position()=1]"/>
					</td>
				</tr>
				<!--Put each successive event on another line.-->
				<xsl:for-each select="ead:eventgrp/ead:event[not(position()=1)]">
					<tr>
						<td/>
						<td/>
						<td valign="top">
							<xsl:apply-templates select="."/>
						</td>
					</tr>
				</xsl:for-each>
			</xsl:when>
			<!--Put the date and event on a single line.-->
			<xsl:otherwise>
				<tr>
					<td/>
					<td valign="top">
						<xsl:apply-templates select="ead:date"/>
					</td>
					<td valign="top">
						<xsl:apply-templates select="ead:event"/>
					</td>
				</tr>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--This template rule formats the top-level did element.-->
	<xsl:template name="archdesc-did">
		<xsl:variable name="file">
			<xsl:value-of select="ead:ead/ead:eadheader/ead:eadid"/>
		</xsl:variable>
		<!-- For each element of the did, this template inserts the value of the LABEL attribute or, if none is present, a default value. -->
		<xsl:for-each select="ead:ead/ead:archdesc/ead:did">
			<table width="100%">
				<tr>
					<td width="5%"/>
					<td width="20%"/>
					<td width="75%"/>
				</tr>
				<tr>
					<td colspan="3">
						<h3>
							<a name="did">
								<xsl:apply-templates select="ead:head"/>
							</a>
						</h3>
					</td>
				</tr>
				<!--One can change the order of appearance for the children of did by changing the order of the following statements.-->
				<xsl:apply-templates select="ead:origination"/>
				<xsl:apply-templates select="ead:unittitle"/>
				<!--<xsl:apply-templates select="ead:unitdate"/>-->
				<xsl:call-template name="ead-unitdate"/>
				<xsl:apply-templates select="ead:abstract"/>
				<xsl:apply-templates select="ead:unitid"/>
				<xsl:apply-templates select="ead:physdesc"/>
				<xsl:apply-templates select="ead:physloc"/>
				<xsl:apply-templates select="ead:langmaterial"/>
				<xsl:apply-templates select="ead:materialspec"/>
				<xsl:apply-templates select="ead:note"/>
				<xsl:apply-templates select="ead:repository"/>
			</table>
			<xsl:if test="child::ead:dao">
				<table width="100%">
					<xsl:for-each select="ead:dao">
						<tr>
							<td>
								<xsl:call-template name="dao"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
				<hr/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!--This template formats the repostory, origination, physdesc, abstract, unitid, physloc and materialspec elements of archdesc/did which share a common presentaiton. The sequence of their appearance is governed by the previous template.-->
	<xsl:template
		match="ead:archdesc/ead:did/ead:repository | ead:archdesc/ead:did/ead:origination | ead:archdesc/ead:did/ead:physdesc | ead:archdesc/ead:did/ead:unitid | ead:archdesc/ead:did/ead:physloc | ead:archdesc/ead:did/ead:abstract | ead:archdesc/ead:did/ead:langmaterial | ead:archdesc/ead:did/ead:materialspec">
		<!--The template tests to see if there is a label attribute, inserting the contents if there is or adding display textif there isn't. The content of the supplied label depends on the element.  To change the supplied label, simply alter the template below.-->
		<xsl:choose>
			<xsl:when test="@label">
				<tr>
					<td/>
					<td valign="top">
						<strong>
							<xsl:value-of select="@label"/>
						</strong>
					</td>
					<td>
						<xsl:apply-templates/>
					</td>
				</tr>
			</xsl:when>
			<xsl:otherwise>
				<tr>
					<td/>
					<td valign="top">
						<strong>
							<xsl:choose>
								<xsl:when test="self::ead:repository">
									<xsl:text>Repository: </xsl:text>
								</xsl:when>
								<xsl:when test="self::ead:origination">
									<xsl:text>Creator: </xsl:text>
								</xsl:when>
								<xsl:when test="self::ead:physdesc">
									<xsl:text>Quantity: </xsl:text>
								</xsl:when>
								<xsl:when test="self::ead:physloc">
									<xsl:text>Location: </xsl:text>
								</xsl:when>
								<xsl:when test="self::ead:unitid">
									<xsl:text>Identification: </xsl:text>
								</xsl:when>
								<xsl:when test="self::ead:abstract">
									<xsl:text>Abstract:</xsl:text>
								</xsl:when>
								<xsl:when test="self::ead:langmaterial">
									<xsl:text>Language: </xsl:text>
								</xsl:when>
								<xsl:when test="self::ead:materialspec">
									<xsl:text>Technical: </xsl:text>
								</xsl:when>
							</xsl:choose>
						</strong>
					</td>
					<td>
						<xsl:apply-templates/>
					</td>
				</tr>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template
		match="ead:archdesc/ead:did/ead:origination/ead:persname | ead:archdesc/ead:did/ead:origination/ead:corpname | ead:archdesc/ead:did/ead:origination/ead:famname">
		<xsl:if test="position() > 1">
			<xsl:text>, </xsl:text>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="*/ead:address">
		<br />
		<xsl:for-each select="ead:addressline">
			<xsl:value-of select="text()"/>
			<xsl:text>&#44;</xsl:text>
			<xsl:text>&#32;</xsl:text>
		</xsl:for-each>
	</xsl:template>
	<!-- The following two templates test for and processes various permutations of unittitle and unitdate.-->
	<xsl:template match="ead:archdesc/ead:did/ead:unittitle">
		<!--The template tests to see if there is a label attribute for unittitle, inserting the contents if there is or adding one if there isn't. -->
		<xsl:choose>
			<xsl:when test="@label">
				<tr>
					<td/>
					<td valign="top">
						<strong>
							<xsl:value-of select="@label"/>
						</strong>
					</td>
					<td>
						<!--Inserts the text of unittitle and any children other that unitdate.-->
						<xsl:apply-templates select="text() | *[not(self::ead:unitdate)]"/>
					</td>
				</tr>
			</xsl:when>
			<xsl:otherwise>
				<tr>
					<td/>
					<td valign="top">
						<strong>
							<xsl:text>Title: </xsl:text>
						</strong>
					</td>
					<td>
						<xsl:apply-templates select="text() | *[not(self::ead:unitdate)]"/>
					</td>
				</tr>
			</xsl:otherwise>
		</xsl:choose>
		<!--If unitdate is a child of unittitle, it inserts unitdate on a new line.  -->
		<xsl:if test="child::ead:unitdate">
			<!--The template tests to see if there is a label attribute for unitdate, inserting the contents if there is or adding one if there isn't. -->
			<xsl:choose>
				<xsl:when test="ead:unitdate/@label">
					<tr>
						<td/>
						<td valign="top">
							<strong>
								<xsl:value-of select="ead:unitdate/@label"/>
							</strong>
						</td>
						<td>
							<xsl:value-of select="ead:unitdate"/>
						</td>
					</tr>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td/>
						<td valign="top">
							<strong>
								<xsl:text>Dates: </xsl:text>
							</strong>
						</td>
						<td>
							<xsl:apply-templates select="ead:unitdate"/>
						</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<!-- Processes the unit date if it is not a child of unit title but a child of did, the current context.-->
	<xsl:template name="ead-unitdate">
		<!--The template tests to see if there is a label attribute for a unittitle that is the child of did and not unittitle, inserting the contents if there is or adding one if there isn't.-->
		<tr>
			<td/>
			<xsl:for-each select="ead:unitdate[@type='inclusive']">
				<xsl:choose>
					<xsl:when test="position()=1">
						<td valign="top">
							<strong>
								<xsl:text>Dates: </xsl:text>
							</strong>
						</td>
					<xsl:text disable-output-escaping="yes">&#60;td valign="top"&#62;</xsl:text>
						<xsl:apply-templates/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
			<xsl:text disable-output-escaping="yes">&#60;/td&#62;</xsl:text>
		</tr>
	<tr>
			<td/>
			<xsl:for-each select="ead:unitdate[@type='bulk']">
				<xsl:choose>
					<xsl:when test="position()=1">
						<td valign="top">
							<strong>
								<xsl:text>Dates (Bulk): </xsl:text>
							</strong>
						</td>
						<xsl:text disable-output-escaping="yes">&#60;td valign="top"&#62;</xsl:text>
						<xsl:apply-templates/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates/>
					</xsl:otherwise>
				</xsl:choose>
				
			</xsl:for-each>
			<xsl:text disable-output-escaping="yes">&#60;/td&#62;</xsl:text>
		</tr>
		
	</xsl:template>
	<!--This template processes the note element.-->
	<xsl:template match="ead:archdesc/ead:did/ead:note">
		<xsl:for-each select="ead:p">
			<!--The template tests to see if there is a label attribute,
 inserting the contents if there is or adding one if there isn't. -->
			<xsl:choose>
				<xsl:when test="parent::ead:note[@label]">
					<!--This nested choose tests for and processes the first paragraph. Additional paragraphs do not get a label.-->
					<xsl:choose>
						<xsl:when test="position()=1">
							<tr>
								<td/>
								<td valign="top">
									<strong>
										<xsl:value-of select="@label"/>
									</strong>
								</td>
								<td valign="top">
									<xsl:apply-templates/>
								</td>
							</tr>
						</xsl:when>
						<xsl:otherwise>
							<tr>
								<td/>
								<td valign="top"/>
								<td valign="top">
									<xsl:apply-templates/>
								</td>
							</tr>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<!--Processes situations where there is no label attribute by supplying default text.-->
				<xsl:otherwise>
					<!--This nested choose tests for and processes the first paragraph. Additional paragraphs do not get a label.-->
					<xsl:choose>
						<xsl:when test="position()=1">
							<tr>
								<td/>
								<td valign="top">
									<strong>
										<xsl:text>Note: </xsl:text>
									</strong>
								</td>
								<td>
									<xsl:apply-templates/>
								</td>
							</tr>
						</xsl:when>
						<xsl:otherwise>
							<tr>
								<td/>
								<td valign="top"/>
								<td>
									<xsl:apply-templates/>
								</td>
							</tr>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
			<!--Closes each paragraph-->
		</xsl:for-each>
	</xsl:template>
	<!--This template rule formats the top-level bioghist element.-->
	<xsl:template name="archdesc-bioghist">
		<xsl:variable name="file">
			<xsl:value-of select="ead:ead/ead:eadheader/ead:eadid"/>
		</xsl:variable>
		<xsl:if
			test="ead:ead/ead:archdesc/ead:bioghist[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:descgrp/ead:bioghist[string-length(text()|*)!=0]">
			<xsl:for-each
				select="ead:ead/ead:archdesc/ead:bioghist | ead:ead/ead:archdesc/ead:descgrp/ead:bioghist">
				<xsl:apply-templates/>
				<p>
					<a href="#a0">Return to the Table of Contents</a>
				</p>
				<hr/>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template
		match="ead:ead/ead:archdesc/ead:bioghist/ead:head | ead:ead/ead:archdesc/ead:descgrp/ead:bioghist/ead:head">
		<h3>
			<xsl:text disable-output-escaping="yes">&#60;a name="bioghist</xsl:text>
			<xsl:value-of select="ancestor-or-self::bioghist/@id"/>
			<xsl:text disable-output-escaping="yes">"&#62;</xsl:text>
			<xsl:apply-templates/>
			<xsl:text disable-output-escaping="yes">&#60;/a&#62;</xsl:text>
		</h3>
	</xsl:template>
	<xsl:template
		match="ead:ead/ead:archdesc/ead:bioghist/ead:p | ead:ead/ead:archdesc/ead:descgrp/ead:bioghist/ead:p">
		<p class="bod-in25">
			<xsl:apply-templates/>
		</p>
	</xsl:template>
	<xsl:template
		match="ead:ead/ead:archdesc/ead:bioghist/ead:note/ead:p | ead:ead/ead:archdesc/ead:descgrp/ead:bioghist/ead:note/ead:p">
		<p class="bod-in25">
			<xsl:apply-templates/>
		</p>
	</xsl:template>
	<xsl:template
		match="ead:ead/ead:archdesc/ead:bioghist/ead:dao | ead:ead/ead:archdesc/ead:descgrp/ead:bioghist/ead:dao">
		<div class="bod-in25">
			<xsl:call-template name="dao"/>
		</div>
	</xsl:template>
	<xsl:template
		match="ead:ead/ead:archdesc/ead:bioghist/ead:chronlist | ead:ead/ead:archdesc/ead:descgrp/ead:bioghist/ead:chronlist">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template
		match="ead:ead/ead:archdesc/ead:bioghist/ead:bioghist | ead:ead/ead:archdesc/ead:descgrp/ead:bioghist/ead:bioghist">
		<h3 class="bod-in25">
			<xsl:apply-templates select="ead:head"/>
		</h3>
		<xsl:for-each select="ead:p">
			<p class="bod-in50">
				<xsl:apply-templates/>
			</p>
		</xsl:for-each>
	</xsl:template>
	<!--This template rule formats a chronlist element.-->
	<xsl:template match="*/ead:chronlist">
		<table width="100%">
			<tr>
				<td width="5%"/>
				<td width="30%"/>
				<td width="65%"/>
			</tr>
			<xsl:for-each select="ead:listhead">
				<tr>
					<td>
						<strong>
							<xsl:apply-templates select="ead:head01"/>
						</strong>
					</td>
					<td>
						<strong>
							<xsl:apply-templates select="ead:head02"/>
						</strong>
					</td>
				</tr>
			</xsl:for-each>
			<xsl:for-each select="ead:chronitem">
				<tr>
					<td/>
					<td valign="top">
						<xsl:apply-templates select="ead:date"/>
					</td>
					<td valign="top">
						<xsl:apply-templates select="ead:event"/>
					</td>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
	<!--This template rule formats the scopecontent element.-->
	<xsl:template name="archdesc-scopecontent">
		<xsl:if
			test="ead:ead/ead:archdesc/ead:scopecontent[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:descgrp/ead:scopecontent[string-length(text()|*)!=0]">
			<xsl:for-each
				select="ead:ead/ead:archdesc/ead:scopecontent | ead:ead/ead:archdesc/ead:descgrp/ead:scopecontent">
				<xsl:apply-templates/>
			</xsl:for-each>
			<p>
				<a href="#a0">Return to the Table of Contents</a>
			</p>
			<hr/>
		</xsl:if>
	</xsl:template>
	<xsl:template
		match="ead:ead/ead:archdesc/ead:scopecontent/ead:head | ead:ead/ead:archdesc/ead:descgrp/ead:scopecontent/ead:head">
		<h3>
			<a name="scopecontent">
				<xsl:apply-templates/>
			</a>
		</h3>
	</xsl:template>
	<xsl:template
		match="ead:ead/ead:archdesc/ead:scopecontent/ead:p | ead:ead/ead:archdesc/ead:descgrp/ead:scopecontent/ead:p">
		<p class="bod-in25">
			<xsl:apply-templates/>
		</p>
	</xsl:template>
	<xsl:template
		match="ead:ead/ead:archdesc/ead:scopecontent/ead:note/ead:p | ead:ead/ead:archdesc/ead:descgrp/ead:scopecontent/ead:note/ead:p">
		<p class="bod-in25">
			<xsl:apply-templates/>
		</p>
	</xsl:template>
	<xsl:template
		match="ead:ead/ead:archdesc/ead:scopecontent/ead:dao | ead:ead/ead:archdesc/ead:descgrp/ead:scopecontent/ead:dao">
		<div class="bod-in25">
			<xsl:call-template name="dao"/>
		</div>
	</xsl:template>
	<xsl:template
		match="ead:archdesc/ead:scopecontent/ead:scopecontent/ead:head | ead:archdesc/ead:descgrp/ead:scopecontent/ead:scopecontent/ead:head">
		<h3 class="bod-in25">
			<xsl:apply-templates/>
		</h3>
	</xsl:template>
	<xsl:template
		match="ead:archdesc/ead:scopecontent/ead:scopecontent/ead:p | ead:archdesc/ead:descgrp/ead:scopecontent/ead:scopecontent/ead:p">
		<p class="bod-in50">
			<xsl:apply-templates/>
		</p>
	</xsl:template>
	<xsl:template
		match="ead:archdesc/ead:scopecontent/ead:scopecontent/ead:dao | ead:archdesc/ead:descgrp/ead:scopecontent/ead:scopecontent/ead:dao">
		<div class="bod-in50">
			<xsl:call-template name="dao"/>
		</div>
	</xsl:template>
	<!-- This formats an arrangement list embedded in a scope content statement.-->
	<xsl:template
		match="ead:archdesc/ead:scopecontent/ead:arrangement/ead:head | ead:archdesc/ead:descgrp/ead:scopecontent/ead:arrangement/ead:head">
		<h4 class="bod-in25">
			<strong>
				<xsl:apply-templates/>
			</strong>
		</h4>
	</xsl:template>
	<xsl:template
		match="ead:archdesc/ead:scopecontent/ead:arrangement/p | ead:archdesc/ead:descgrp/ead:scopecontent/ead:arrangement/p">
		<p class="bod-in25">
			<xsl:apply-templates/>
		</p>
	</xsl:template>
	<xsl:template
		match="ead:archdesc/ead:scopecontent/ead:arrangement/ead:list/ead:head | ead:archdesc/ead:descgrp/ead:scopecontent/ead:arrangement/ead:list/ead:head">
		<div class="bod-in25">
			<xsl:apply-templates/>
		</div>
	</xsl:template>
	<xsl:template
		match="ead:archdesc/ead:scopecontent/ead:arrangement/ead:list/ead:item | ead:archdesc/ead:descgrp/ead:scopecontent/ead:arrangement/ead:list/ead:item">
		<div class="bod-in50">
			<xsl:apply-templates/>
		</div>
	</xsl:template>
	<!--This template rule formats the arrangement element.-->
	<xsl:template name="archdesc-arrangement">
		<xsl:if
			test="ead:ead/ead:archdesc/ead:arrangement[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:descgrp/ead:arrangement[string-length(text()|*)!=0]">
			<a name="arrangementlink">&#32;</a>
			<xsl:for-each
				select="ead:ead/ead:archdesc/ead:arrangement | ead:ead/ead:archdesc/ead:descgrp/ead:arrangement">
				<table width="100%">
					<tr>
						<td width="5%"/>
						<td width="5%"/>
						<td width="90%"/>
					</tr>
					<tr>
						<td colspan="3">
							<h3>
								<xsl:apply-templates select="ead:head"/>
							</h3>
						</td>
					</tr>
					<xsl:for-each select="ead:p">
						<tr>
							<td/>
							<td colspan="2">
								<xsl:apply-templates select="."/>
							</td>
						</tr>
					</xsl:for-each>
					<xsl:for-each select="ead:list">
						<tr>
							<td/>
							<td colspan="2">
								<xsl:apply-templates select="ead:head"/>
							</td>
						</tr>
						<xsl:for-each select="ead:item">
							<tr>
								<td/>
								<td/>
								<td colspan="1">
									<xsl:apply-templates select="."/>
								</td>
							</tr>
						</xsl:for-each>
					</xsl:for-each>
				</table>
			</xsl:for-each>
			<p>
				<a href="#a0">Return to the Table of Contents</a>
			</p>
			<hr/>
		</xsl:if>
	</xsl:template>
	<!--This template rule formats the top-level relatedmaterial element.-->
	<xsl:template name="archdesc-relatedmaterial">
		<xsl:if
			test="ead:ead/ead:archdesc/ead:relatedmaterial[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:descgrp/ead:descgrp/ead:relatedmaterial[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:archdescgrp/ead:relatedmaterial[string-length(text()|*)!=0]">
			<xsl:if test="ead:ead/ead:archdesc/ead:descgrp/ead:descgrp/ead:relatedmaterial">
				<h3>
					<xsl:value-of select="ead:ead/ead:archdesc/ead:descgrp/ead:descgrp/ead:head"/>
				</h3>
			</xsl:if>
			<xsl:for-each
				select="ead:ead/ead:archdesc/ead:relatedmaterial | ead:ead/ead:archdesc/ead:descgrp/ead:descgrp/ead:relatedmaterial | ead:ead/ead:archdesc/ead:archdescgrp/ead:relatedmaterial">
				<xsl:choose>
					<xsl:when test="child::ead:head">
						<h3>
							<a name="relatedmatlink">
								<strong>
									<xsl:apply-templates select="ead:head"/>
								</strong>
							</a>
						</h3>
					</xsl:when>
					<xsl:otherwise>
						<h3>
							<a name="relatedmatlink">
								<strong>
									<xsl:text>Related Material</xsl:text>
								</strong>
							</a>
						</h3>
					</xsl:otherwise>
				</xsl:choose>
				<table width="100%">
					<tr>
						<td width="5%"/>
						<td width="5%"/>
						<td width="90%"/>
					</tr>
					<tr>
						<td/>
						<td colspan="2">
							<xsl:for-each select="ead:p">
								<p class="bod-in30">
									<xsl:apply-templates/>
								</p>
							</xsl:for-each>
						</td>
					</tr>
					<xsl:for-each select="ead:archref | ead:bibref ">
						<tr>
							<td/>
							<td colspan="2">
								<xsl:apply-templates select="."/>
							</td>
						</tr>
					</xsl:for-each>
					<xsl:for-each select="ead:list">
						<tr>
							<td/>
							<td/>
							<td>
								<xsl:apply-templates select="."/>
							</td>
						</tr>
					</xsl:for-each>
					<xsl:for-each select="./ead:relatedmaterial">
						<tr>
							<td/>
							<td colspan="2">
								<strong>
									<xsl:apply-templates select="ead:p"/>
								</strong>
							</td>
						</tr>
						<xsl:for-each select="ead:list">
							<tr>
								<td/>
								<td/>
								<td>
									<xsl:apply-templates select="."/>
								</td>
							</tr>
						</xsl:for-each>
						<xsl:for-each select="ead:note">
							<tr>
								<td/>
								<td/>
								<td>
									<xsl:apply-templates select="."/>
								</td>
							</tr>
						</xsl:for-each>
						<xsl:for-each select="ead:archref | ead:bibref">
							<tr>
								<td/>
								<td/>
								<td>
									<xsl:apply-templates select="."/>
								</td>
							</tr>
						</xsl:for-each>
					</xsl:for-each>
				</table>
			</xsl:for-each>
			<p>
				<a href="#a0">Return to the Table of Contents</a>
			</p>
			<hr/>
		</xsl:if>
		<xsl:if
			test="ead:ead/ead:archdesc/ead:separatedmaterial[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:descgrp/ead:separatedmaterial[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:archdescgrp/ead:separatedmaterial[string-length(text()|*)!=0]">
			<xsl:choose>
				<xsl:when test="child::ead:head">
					<h3>
						<a name="sepmatlink">
							<strong>
								<xsl:apply-templates select="ead:head"/>
							</strong>
						</a>
					</h3>
				</xsl:when>
				<xsl:otherwise>
					<h3>
						<a name="sepmatlink">
							<strong>
								<xsl:text>Separated Material</xsl:text>
							</strong>
						</a>
					</h3>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:for-each
				select="ead:ead/ead:archdesc/ead:archdescgrp/ead:separatedmaterial | ead:ead/ead:archdesc/ead:separatedmaterial | ead:ead/ead:archdesc/ead:descgrp/ead:separatedmaterial">
				<table width="100%">
					<tr>
						<td width="5%"/>
						<td width="5%"/>
						<td width="90%"/>
					</tr>
					<tr>
						<td/>
						<td colspan="2">
							<xsl:for-each select="ead:p">
								<p class="bod-in30">
									<xsl:apply-templates/>
								</p>
							</xsl:for-each>
						</td>
					</tr>
					<xsl:for-each select="./ead:separatedmaterial">
						<tr>
							<td/>
							<td colspan="2">
								<strong>
									<xsl:apply-templates select="ead:p"/>
								</strong>
							</td>
						</tr>
						<xsl:for-each select="ead:list">
							<tr>
								<td/>
								<td/>
								<td>
									<xsl:apply-templates select="."/>
								</td>
							</tr>
						</xsl:for-each>
						<xsl:for-each select="ead:note">
							<tr>
								<td/>
								<td/>
								<td>
									<xsl:apply-templates select="."/>
								</td>
							</tr>
						</xsl:for-each>
						<xsl:for-each select="ead:archref | ead:bibref">
							<tr>
								<td/>
								<td/>
								<td>
									<xsl:apply-templates select="."/>
								</td>
							</tr>
						</xsl:for-each>
					</xsl:for-each>
				</table>
			</xsl:for-each>
			<p>
				<a href="#a0">Return to the Table of Contents</a>
			</p>
			<hr/>
		</xsl:if>
	</xsl:template>
	<!--This template rule formats the top-level otherfindaid element.-->
	<xsl:template name="archdesc-otherfindaid">
		<xsl:if test="ead:ead/ead:archdesc//ead:otherfindaid[string-length(text()|*)!=0]">
			<xsl:for-each
				select="ead:ead/ead:archdesc/ead:archdescgrp/ead:otherfindaid | ead:ead/ead:archdesc/ead:otherfindaid | ead:ead/ead:archdesc/ead:descgrp/ead:otherfindaid">
				<xsl:choose>
					<xsl:when test="child::ead:head">
						<h3>
							<a name="otherfindaid">
								<strong>
									<xsl:apply-templates select="ead:head"/>
								</strong>
							</a>
						</h3>
					</xsl:when>
					<xsl:otherwise>
						<h3>
							<strong>
								<xsl:text>Other Finding Aid</xsl:text>
							</strong>
						</h3>
					</xsl:otherwise>
				</xsl:choose>
				<div class="bod-in30">
					<xsl:for-each select="ead:p">
						<xsl:choose>
							<xsl:when test="child::ead:bibref">
								<p>
									<xsl:apply-templates/>
								</p>
							</xsl:when>
							<xsl:otherwise>
								<p>
									<xsl:apply-templates select="."/>
								</p>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</div>
				<p>
					<a href="#a0">Return to the Table of Contents</a>
				</p>
				<hr/>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!--This template rule formats the top-level index element.-->
	<xsl:template name="archdesc-index">
		<xsl:if test="ead:ead/ead:archdesc//ead:index[string-length(text()|*)!=0]">
			<xsl:for-each
				select="ead:ead/ead:archdesc/ead:archdescgrp/ead:index | ead:ead/ead:archdesc/ead:index | ead:ead/ead:archdesc/ead:descgrp/ead:index">
				<h3>
					<a name="index">
						<xsl:apply-templates select="ead:head"/>
					</a>
				</h3>
				<xsl:for-each select="ead:p">
					<p style="margin-left : 30pt">
						<xsl:apply-templates select="."/>
					</p>
				</xsl:for-each>
				<xsl:for-each select="ead:indexentry">
					<div style="margin-left: 30pt">
						<xsl:apply-templates select="."/>
					</div>
				</xsl:for-each>
				<p>
					<a href="#a0">Return to the Table of Contents</a>
				</p>
				<hr/>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- MR new template for "add" describing index listings -->
	<xsl:template name="index-list">
		<xsl:if test="ead:ead/ead:archdesc//ead:list[string-length(text()|*)!=0]">
			<xsl:for-each select="ead:ead/ead:archdesc//ead:head">
				<table width="100%">
					<tr>
						<td width="5%"/>
						<td width="5%"/>
						<td width="90%"/>
					</tr>
					<xsl:variable name="idx">
						<xsl:value-of select="position()"/>
					</xsl:variable>
					<tr>
						<td colspan="3">
							<h3>
								<a>
									<xsl:attribute name="name">index<xsl:value-of select="$idx"/>
									</xsl:attribute>
									<xsl:value-of select="text()"/>
								</a>
							</h3>
						</td>
					</tr>
					<xsl:for-each select="ancestor::ead:p">
						<tr>
							<td/>
							<td colspan="2">
								<xsl:apply-templates select="."/>
							</td>
						</tr>
					</xsl:for-each>
					<xsl:for-each select="ancestor::ead:list">
						<tr>
							<td/>
							<td colspan="2">
								<xsl:apply-templates select="."/>
							</td>
						</tr>
						<xsl:for-each select="ead:item">
							<tr>
								<td/>
								<td/>
								<td colspan="1">
									<xsl:apply-templates select="."/>
								</td>
							</tr>
						</xsl:for-each>
					</xsl:for-each>
				</table>
				<p>
					<a href="#a0">Return to the Table of Contents</a>
				</p>
				<hr/>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- MR end additions -->
	<!-- MR new bibliography element -->
	<xsl:template name="archdesc-bibliography">
		<xsl:if test="ead:ead/ead:archdesc/ead:bibliography[string-length(text()|*)!=0]">
			<xsl:for-each select="ead:ead/ead:archdesc/ead:bibliography">
				<xsl:choose>
					<xsl:when test="child::ead:head">
						<h3>
							<a name="bibliography">
								<strong>
									<xsl:apply-templates select="ead:head"/>
								</strong>
							</a>
						</h3>
					</xsl:when>
					<xsl:otherwise>
						<h3>
							<a name="a10">
								<strong>
									<xsl:text>Bibliograpy</xsl:text>
								</strong>
							</a>
						</h3>
					</xsl:otherwise>
				</xsl:choose>
				<table width="100%">
					<tr>
						<td width="5%"/>
						<td width="5%"/>
						<td width="90%"/>
					</tr>
					<tr>
						<td/>
						<td colspan="2">
							<xsl:for-each select="ead:p">
								<p class="bod-in30">
									<xsl:apply-templates/>
								</p>
							</xsl:for-each>
						</td>
					</tr>
					<xsl:for-each select="ead:note">
						<tr>
							<td/>
							<td/>
							<td>
								<xsl:apply-templates select="."/>
							</td>
						</tr>
					</xsl:for-each>
					<xsl:for-each select="ead:list ">
						<tr>
							<td/>
							<td/>
							<td>
								<xsl:apply-templates select="."/>
							</td>
						</tr>
					</xsl:for-each>
					<xsl:for-each select="ead:bibref">
						<tr>
							<td/>
							<td/>
							<td>
								<p class="bod-in30">
									<xsl:apply-templates/>
								</p>
							</td>
						</tr>
					</xsl:for-each>
					<xsl:for-each select="ead:bibliography ">
						<tr>
							<td/>
							<td/>
							<td>
								<xsl:if test="child::ead:head">
									<p>
										<h4>
											<xsl:apply-templates select="ead:head"/>
										</h4>
									</p>
								</xsl:if>
								<xsl:for-each select="ead:p">
									<p class="bod-in50">
										<xsl:apply-templates/>
									</p>
								</xsl:for-each>
								<xsl:for-each select="ead:bibref">
									<p class="bod-in50">
										<xsl:apply-templates/>
									</p>
								</xsl:for-each>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:for-each>
			<p>
				<a href="#a0">Return to the Table of Contents</a>
			</p>
			<hr/>
		</xsl:if>
	</xsl:template>
	<!-- MR end new bibliography element -->
	<!-- This template rule formats the top-level odd element.-->
	<!-- MR changes for adding tables to odd tag -->
	<xsl:template name="archdesc-odd">
		<xsl:if test="ead:ead/ead:archdesc/ead:odd[string-length(text()|*)!=0]">
			<xsl:for-each select="ead:ead/ead:archdesc/ead:odd">
				<xsl:choose>
					<xsl:when test="@type='index'"/>
					<xsl:otherwise>
						<h3>
							<a>
								<xsl:attribute name="name">odd<xsl:number/>
								</xsl:attribute>&#32;<xsl:apply-templates select="ead:head"/>
							</a>&#32;</h3>
						<xsl:for-each select=".//ead:p">
							<p class="bod-in30">
								<xsl:apply-templates select="."/>
							</p>
						</xsl:for-each>
						<xsl:for-each select="./ead:list">
							<div class="bod-in30">
								<xsl:apply-templates select="."/>
							</div>
						</xsl:for-each>
						<xsl:for-each select=".//ead:dao">
							<div class="bod-in30">
								<xsl:call-template name="dao"/>
							</div>
						</xsl:for-each>
						<xsl:for-each select=".//ead:table">
							<xsl:for-each select="ead:tgroup">
								<table width="100%" border="0">
									<tr>
										<xsl:for-each select="ead:colspec">
											<td width="{@colwidth}"/>
										</xsl:for-each>
									</tr>
									<xsl:for-each select="ead:thead">
										<xsl:for-each select="ead:row">
											<tr>
												<xsl:for-each select="ead:entry">
												<td valign="top">
												<strong>
												<xsl:apply-templates select="."/>
												</strong>
												</td>
												</xsl:for-each>
											</tr>
										</xsl:for-each>
									</xsl:for-each>
									<xsl:for-each select="ead:tbody">
										<xsl:for-each select="ead:row">
											<tr>
												<xsl:for-each select="ead:entry">
												<td valign="top">
												<xsl:apply-templates select="."/>
												</td>
												</xsl:for-each>
											</tr>
										</xsl:for-each>
									</xsl:for-each>
								</table>
								<p>&#32;</p>
							</xsl:for-each>
						</xsl:for-each>
						<p>
							<a href="#a0">Return to the Table of Contents</a>
						</p>
						<hr/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template name="archdesc-odd2">
		<xsl:if test="ead:ead/ead:archdesc/ead:odd[string-length(text()|*)!=0]">
			<xsl:for-each select="ead:ead/ead:archdesc/ead:odd">
				<xsl:if test="@type='index'">
					<h3>
						<a>
							<xsl:attribute name="name">odd<xsl:number/>
							</xsl:attribute>&#32;<xsl:apply-templates select="ead:head"/>
						</a>&#32;</h3>
					<xsl:for-each select=".//ead:p">
						<p class="bod-in30">
							<xsl:apply-templates select="."/>
						</p>
					</xsl:for-each>
					<xsl:for-each select="./ead:list">
						<div class="bod-in30">
							<xsl:apply-templates select="."/>
						</div>
					</xsl:for-each>
					<xsl:for-each select=".//ead:dao">
						<div class="bod-in30">
							<xsl:call-template name="dao"/>
						</div>
					</xsl:for-each>
					<xsl:for-each select=".//ead:table">
						<xsl:for-each select="ead:tgroup">
							<table width="100%" border="0">
								<tr>
									<xsl:for-each select="ead:colspec">
										<td width="{@colwidth}"/>
									</xsl:for-each>
								</tr>
								<xsl:for-each select="ead:thead">
									<xsl:for-each select="ead:row">
										<tr>
											<xsl:for-each select="ead:entry">
												<td valign="top">
												<strong>
												<xsl:apply-templates select="."/>
												</strong>
												</td>
											</xsl:for-each>
										</tr>
									</xsl:for-each>
								</xsl:for-each>
								<xsl:for-each select="ead:tbody">
									<xsl:for-each select="ead:row">
										<tr>
											<xsl:for-each select="ead:entry">
												<td valign="top">
												<xsl:apply-templates select="."/>
												</td>
											</xsl:for-each>
										</tr>
									</xsl:for-each>
								</xsl:for-each>
							</table>
							<p>&#32;</p>
						</xsl:for-each>
					</xsl:for-each>
					<p>
						<a href="#a0">Return to the Table of Contents</a>
					</p>
					<hr/>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- END MR changes for adding tables to odd tag -->
	<xsl:template name="archdesc-control">
		<xsl:if test="ead:ead/ead:archdesc/ead:controlaccess[string-length(text()|*)!=0]">
			<xsl:for-each select="ead:ead/ead:archdesc/ead:controlaccess">
				<table width="100%">
					<tr>
						<td width="5%"/>
						<td width="5%"/>
						<td width="90%"/>
					</tr>
					<tr>
						<td colspan="3">
							<h3>
								<a name="controlaccess">
									<xsl:choose>
										<xsl:when test="child::ead:head">
											<xsl:apply-templates select="ead:head"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>Index Terms</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</a>
							</h3>
						</td>
					</tr>
					<tr>
						<td/>
						<td colspan="2">
							<xsl:apply-templates select="ead:p"/>
						</td>
					</tr>
					<xsl:for-each
						select="ead:subject | ead:corpname | ead:persname | ead:famname | ead:genreform | ead:title | ead:geogname | ead:occupation | ead:function">
						<tr>
							<td/>
							<td/>
							<td>
								<xsl:choose>
									<xsl:when
										test="child::ead:subarea | child::ead:emph | child::ead:extptr | child::ead:lb | child::ead:ptr">
										<xsl:apply-templates select="."/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="text()"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</xsl:for-each>
					<xsl:for-each select="./ead:controlaccess">
						<tr>
							<td/>
							<td colspan="2">
								<strong>
									<xsl:apply-templates select="ead:head"/>
								</strong>
							</td>
						</tr>
						<xsl:for-each
							select="ead:subject | ead:corpname | ead:persname | ead:famname | ead:genreform | ead:title | ead:geogname | ead:occupation | ead:function">
							<tr>
								<td/>
								<td/>
								<td>
									<xsl:choose>
										<xsl:when
											test="child::ead:subarea | child::ead:emph | child::ead:extptr | child::ead:lb | child::ead:ptr">
											<xsl:apply-templates select="."/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="text()"/>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</xsl:for-each>
					</xsl:for-each>
				</table>
			</xsl:for-each>
			<p>
				<a href="#a0">Return to the Table of Contents</a>
			</p>
			<hr/>
		</xsl:if>
	</xsl:template>
	<!--This template rule formats a top-level accessretrict element.-->
	<xsl:template name="archdesc-restrict">
		<xsl:if
			test="ead:ead/ead:archdesc/ead:accessrestrict[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:userestrict[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:archdescgrp/ead:accessrestrict[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:archdescgrp/ead:userestrict[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:descgrp/ead:accessrestrict[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:descgrp/ead:userestrict[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:phystech[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:archdescgrp/ead:phystech[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:descgrp/ead:phystech[string-length(text()|*)!=0]">
			<h3>
				<a name="restrictlink">
					<strong>
						<xsl:text>Restrictions</xsl:text>
					</strong>
				</a>
			</h3>
			<xsl:for-each
				select="ead:ead/ead:archdesc/ead:accessrestrict | ead:ead/ead:archdesc/ead:archdescgrp/ead:accessrestrict | ead:ead/ead:archdesc/ead:descgrp/ead:accessrestrict">
				<h4 class="bod-in15">
					<strong>
						<xsl:value-of select="ead:head"/>
					</strong>
				</h4>
				<xsl:for-each select="ead:p">
					<p class="bod-in30">
						<xsl:apply-templates select="."/>
					</p>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each
				select="ead:ead/ead:archdesc/ead:userestrict | ead:ead/ead:archdesc/ead:archdescgrp/ead:userestrict | ead:ead/ead:archdesc/ead:descgrp/ead:userestrict">
				<h4 class="bod-in15">
					<strong>
						<xsl:value-of select="ead:head"/>
					</strong>
				</h4>
				<xsl:for-each select="ead:p">
					<p class="bod-in30">
						<xsl:apply-templates select="."/>
					</p>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each
				select="ead:ead/ead:archdesc/ead:phystech | ead:ead/ead:archdesc/ead:archdescgrp/ead:phystech | ead:ead/ead:archdesc/ead:descgrp/ead:phystech">
				<h4 class="bod-in15">
					<strong>
						<xsl:value-of select="ead:head"/>
					</strong>
				</h4>
				<xsl:for-each select="ead:p">
					<p class="bod-in30">
						<xsl:apply-templates select="."/>
					</p>
				</xsl:for-each>
			</xsl:for-each>
			<p>
				<a href="#a0">Return to the Table of Contents</a>
			</p>
			<hr/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="archdesc-admininfo">
		<xsl:if
			test="ead:ead/ead:archdesc/ead:prefercite[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:custodhist[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:altformavail[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:originalsloc[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:acqinfo[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:processinfo[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:appraisal[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:accruals[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:archdescgrp/ead:prefercite[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:archdescgrp/ead:custodhist[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:archdescgrp/ead:altformavail[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:archdescgrp/ead:originalsloc[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:archdescgrp/ead:acqinfo[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:archdescgrp/ead:processinfo[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:archdescgrp/ead:appraisal[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:archdescgrp/ead:accruals[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:descgrp/ead:prefercite[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:descgrp/ead:custodhist[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:descgrp/ead:altformavail[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:descgrp/ead:originalsloc[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:descgrp/ead:acqinfo[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:descgrp/ead:processinfo[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:descgrp/ead:appraisal[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:descgrp/ead:accruals[string-length(text()|*)!=0]">
			<h3>
				<a name="adminlink">
					<xsl:text>Administrative Information</xsl:text>
				</a>
			</h3>
			<xsl:call-template name="archdesc-custodhist"/>
			<xsl:call-template name="archdesc-prefercite"/>
			<xsl:call-template name="archdesc-acqinfo"/>
			<xsl:call-template name="archdesc-processinfo"/>
			<xsl:call-template name="archdesc-appraisal"/>
			<xsl:call-template name="archdesc-accruals"/>
			<xsl:call-template name="archdesc-altform"/>
			<xsl:call-template name="archdesc-originalsloc"/>
			<p>
				<a href="#a0">Return to the Table of Contents</a>
			</p>
			<hr/>
		</xsl:if>
	</xsl:template>
	<!--This template rule formats a top-level custodhist element.-->
	<xsl:template name="archdesc-custodhist">
		<xsl:if
			test="ead:ead/ead:archdesc/ead:custodhist[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:archdescgrp/ead:custodhist[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:descgrp/ead:custodhist[string-length(text()|*)!=0]">
			<xsl:for-each
				select="ead:ead/ead:archdesc/ead:archdescgrp/ead:custodhist | ead:ead/ead:archdesc/ead:custodhist | ead:ead/ead:archdesc/ead:descgrp/ead:custodhist">
				<xsl:if test="child::ead:head">
					<h4 class="bod-in15">
						<a name="{generate-id(ead:head)}">
							<strong>
								<xsl:apply-templates select="ead:head"/>
							</strong>
						</a>
					</h4>
				</xsl:if>
				<xsl:for-each select="ead:p">
					<p class="bod-in30">
						<xsl:apply-templates select="."/>
					</p>
				</xsl:for-each>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!--This template rule formats a top-level altformavail element.-->
	<xsl:template name="archdesc-altform">
		<xsl:if
			test="ead:ead/ead:archdesc/ead:altformavail[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:archdescgrp/ead:altformavail[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:descgrp/ead:altformavail[string-length(text()|*)!=0]">
			<xsl:for-each
				select="ead:ead/ead:archdesc/ead:archdescgrp/ead:altformavail | ead:ead/ead:archdesc/ead:altformavail | ead:ead/ead:archdesc/ead:descgrp/ead:altformavail">
				<xsl:if test="child::ead:head">
					<h4 class="bod-in15">
						<a name="{generate-id(ead:head)}">
							<strong>
								<xsl:apply-templates select="ead:head"/>
							</strong>
						</a>
					</h4>
				</xsl:if>
				<xsl:for-each select="ead:p">
					<p class="bod-in30">
						<xsl:apply-templates select="."/>
					</p>
				</xsl:for-each>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!--This template rule formats a top-level originalsloc element.-->
	<xsl:template name="archdesc-originalsloc">
		<xsl:if
			test="ead:ead/ead:archdesc/ead:originalsloc[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:archdescgrp/ead:originalsloc[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:descgrp/ead:originalsloc[string-length(text()|*)!=0]">
			<xsl:for-each
				select="ead:ead/ead:archdesc/ead:archdescgrp/ead:originalsloc | ead:ead/ead:archdes/ead:coriginalsloc | ead:ead/ead:archdesc/ead:descgrp/ead:originalsloc">
				<xsl:if test="child::ead:head">
					<h4 class="bod-in15">
						<a name="{generate-id(ead:head)}">
							<strong>
								<xsl:apply-templates select="ead:head"/>
							</strong>
						</a>
					</h4>
				</xsl:if>
				<xsl:for-each select="ead:p">
					<p class="bod-in30">
						<xsl:apply-templates select="."/>
					</p>
				</xsl:for-each>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!--This template rule formats a top-level prefercite element.-->
	<xsl:template name="archdesc-prefercite">
		<xsl:if
			test="ead:ead/ead:archdesc/ead:prefercite[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:archdescgrp/ead:prefercite[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:descgrp/ead:prefercite[string-length(text()|*)!=0]">
			<xsl:for-each
				select="ead:ead/ead:archdesc/ead:archdescgrp/ead:prefercite | ead:ead/ead:archdesc/ead:prefercite | ead:ead/ead:archdesc/ead:descgrp/ead:prefercite">
				<xsl:if test="child::ead:head">
					<h4 class="bod-in15">
						<a name="{generate-id(ead:head)}">
							<strong>
								<xsl:apply-templates select="ead:head"/>
							</strong>
						</a>
					</h4>
				</xsl:if>
				<xsl:for-each select="ead:p">
					<p class="bod-in30">
						<xsl:apply-templates select="."/>
					</p>
				</xsl:for-each>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!--This template rule formats a top-level acqinfo element.-->
	<xsl:template name="archdesc-acqinfo">
		<xsl:if
			test="ead:ead/ead:archdesc/ead:acqinfo[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:archdescgrp/ead:acqinfo[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:descgrp/ead:acqinfo[string-length(text()|*)!=0]">
			<xsl:for-each
				select="ead:ead/ead:archdesc/ead:archdescgrp/ead:acqinfo | ead:ead/ead:archdesc/ead:acqinfo | ead:ead/ead:archdesc/ead:descgrp/ead:acqinfo">
				<xsl:if test="child::ead:head">
					<h4 class="bod-in15">
						<a name="{generate-id(ead:head)}">
							<strong>
								<xsl:apply-templates select="ead:head"/>
							</strong>
						</a>
					</h4>
				</xsl:if>
				<xsl:for-each select="ead:p">
					<p class="bod-in30">
						<xsl:apply-templates select="."/>
					</p>
				</xsl:for-each>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!--This template rule formats a top-level procinfo element.-->
	<xsl:template name="archdesc-processinfo">
		<xsl:if
			test="ead:ead/ead:archdesc/ead:processinfo[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:archdescgrp/ead:processinfo[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:descgrp/ead:processinfo[string-length(text()|*)!=0]">
			<xsl:for-each
				select="ead:ead/ead:archdesc/ead:archdescgrp/ead:processinfo | ead:ead/ead:archdesc/ead:processinfo | ead:ead/ead:archdesc/ead:descgrp/ead:processinfo">
				<xsl:if test="child::ead:head">
					<h4 class="bod-in15">
						<a name="{generate-id(ead:head)}">
							<strong>
								<xsl:apply-templates select="ead:head"/>
							</strong>
						</a>
					</h4>
				</xsl:if>
				<xsl:for-each select="ead:p">
					<p class="bod-in30">
						<xsl:apply-templates select="."/>
					</p>
				</xsl:for-each>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!--This template rule formats a top-level appraisal element.-->
	<xsl:template name="archdesc-appraisal">
		<xsl:if
			test="ead:ead/ead:archdesc/ead:appraisal[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:archdescgrp/ead:appraisal[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:descgrp/ead:appraisal[string-length(text()|*)!=0]">
			<xsl:for-each
				select="ead:ead/ead:archdesc/ead:archdescgrp/ead:appraisal | ead:ead/ead:archdesc/ead:appraisal | ead:ead/ead:archdesc/ead:descgrp/ead:appraisal">
				<xsl:if test="child::ead:head">
					<h4 class="bod-in15">
						<a name="{generate-id(ead:head)}">
							<strong>
								<xsl:apply-templates select="ead:head"/>
							</strong>
						</a>
					</h4>
				</xsl:if>
				<xsl:for-each select="ead:p">
					<p class="bod-in30">
						<xsl:apply-templates select="."/>
					</p>
				</xsl:for-each>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!--This template rule formats a top-level accruals element.-->
	<xsl:template name="archdesc-accruals">
		<xsl:if
			test="ead:ead/ead:archdesc/ead:accruals[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:archdescgrp/ead:accruals[string-length(text()|*)!=0] | ead:ead/ead:archdesc/ead:descgrp/ead:accruals[string-length(text()|*)!=0]">
			<xsl:for-each
				select="ead:ead/ead:archdesc/ead:archdescgrp/ead:accruals | ead:ead/ead:archdesc/ead:accruals | ead:ead/ead:archdesc/ead:descgrp/ead:accruals">
				<xsl:if test="child::ead:head">
					<h4 class="bod-in15">
						<a name="{generate-id(ead:head)}">
							<strong>
								<xsl:apply-templates select="ead:head"/>
							</strong>
						</a>
					</h4>
				</xsl:if>
				<xsl:for-each select="ead:p">
					<p class="bod-in25">
						<xsl:apply-templates select="."/>
					</p>
				</xsl:for-each>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX-->
	<!--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX-->
	<xsl:template name="dsc">
		<xsl:if test="ead:ead/ead:archdesc/ead:dsc">
			<xsl:for-each select="ead:ead/ead:archdesc/ead:dsc">
				<xsl:call-template name="dsc-analytic"/>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template name="dsc-analytic">
		<h2>
			<a name="a23">
				<xsl:choose>
					<xsl:when test="child::ead:head">
						<xsl:value-of select="ead:head"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>Detailed Description of the Collection </xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</a>
		</h2>
		<p class="bod-in25">
			<em>
				<xsl:apply-templates select="ead:p"/>
			</em>
		</p>
		<!--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX-->
		<!--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX-->
		<!-- Process each c01.-->
		<xsl:for-each select="ead:c01">
			<table width="100%">
				<tr>
					<td width="7%"> </td>
					<td width="7%"> </td>
					<td width="6%"> </td>
					<td width="6%"> </td>
					<td width="6%"> </td>
					<td width="6%"> </td>
					<td width="6%"> </td>
					<td width="6%"> </td>
					<td width="6%"> </td>
					<td width="6%"> </td>
					<td width="6%"> </td>
					<td width="7%"> </td>
					<td width="7%"> </td>
					<td width="18%"> </td>
				</tr>
				<tr>
					<td colspan="14">
						<xsl:if test="@id">
							<a>
								<xsl:attribute name="name"><xsl:apply-templates select="@id"/></xsl:attribute>
								<xsl:text>&#32;</xsl:text>
							</a>
						</xsl:if>
						<a>
							<xsl:attribute name="name">series<xsl:number/></xsl:attribute>
							<xsl:text>&#32;</xsl:text>
						</a>
					</td>
				</tr>
				<xsl:for-each select="ead:did">
					<xsl:choose>
						<xsl:when test="./child::ead:container">
							<xsl:call-template name="showbox-c01-box-only"/>
						</xsl:when>
						<xsl:otherwise>
							<tr>
								<td colspan="14">
									<h3>
										<xsl:call-template name="component-did"/>
									</h3>
								</td>
							</tr>
							<xsl:if
								test="ead:abstract[string-length(text()|*)!=0] | ead:note[string-length(text()|*)!=0]">
								<xsl:for-each select="ead:abstract | ead:note">
									<tr>
										<td/>
										<td colspan="13" valign="top">
											<xsl:apply-templates select="."/>
										</td>
									</tr>
								</xsl:for-each>
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<xsl:for-each select="ead:descgrp">
					<xsl:for-each select="ead:head">
						<tr>
							<td/>
							<td colspan="13" valign="top">
								<strong>
									<xsl:apply-templates select="."/>
								</strong>
							</td>
						</tr>
					</xsl:for-each>
					<xsl:for-each
						select="ead:phystech | ead:scopecontent | ead:bioghist | ead:arrangement | ead:acqinfo">
						<xsl:for-each select="ead:head">
							<tr>
								<td/>
								<td colspan="13" valign="top">
									<strong>
										<xsl:apply-templates select="."/>
									</strong>
								</td>
							</tr>
						</xsl:for-each>
						<xsl:for-each select="ead:p">
							<tr>
								<td/>
								<td colspan="13" valign="top">
									<xsl:apply-templates select="."/>
								</td>
							</tr>
						</xsl:for-each>
						<xsl:for-each select="ead:list/ead:item">
							<tr>
								<td/>
								<td colspan="13" valign="top">
									<xsl:apply-templates select="."/>
								</td>
							</tr>
						</xsl:for-each>

					</xsl:for-each>
				</xsl:for-each>
				<xsl:for-each select="ead:scopecontent | ead:bioghist | ead:arrangement">
					<xsl:for-each select="ead:head">
						<tr>
							<td/>
							<td colspan="13" valign="top">
								<strong>
									<xsl:apply-templates select="."/>
								</strong>
							</td>
						</tr>
					</xsl:for-each>
					<xsl:for-each select="ead:p">
						<tr>
							<td/>
							<td colspan="13" valign="top">
								<xsl:apply-templates select="."/>
							</td>
						</tr>
					</xsl:for-each>
					<xsl:for-each select="ead:list/ead:item">
						<tr>
							<td/>
							<td colspan="13" valign="top">
								<xsl:apply-templates select="."/>
							</td>
						</tr>
					</xsl:for-each>
				</xsl:for-each>
				<xsl:for-each select="ead:dao">
					<tr>
						<td/>
						<td colspan="13" valign="top">
							<xsl:call-template name="dao"/>
						</td>
					</tr>
				</xsl:for-each>
				<xsl:for-each select="ead:controlaccess">
					<xsl:for-each select="ead:head">
						<tr>
							<td/>
							<td colspan="13" valign="top">
								<strong>
									<xsl:apply-templates select="."/>
								</strong>
							</td>
						</tr>
					</xsl:for-each>
					<tr>
						<td/>
						<td colspan="13" valign="top">
							<xsl:apply-templates select="ead:p"/>
						</td>
					</tr>
					<xsl:for-each
						select="ead:subject | ead:corpname | ead:persname | ead:famname | ead:genreform | ead:title | ead:geogname | ead:occupation | ead:function">
						<tr>
							<td/>
							<td/>
							<td colspan="12" valign="top">
								<xsl:choose>
									<xsl:when
										test="child::ead:subarea | child::ead:emph | child::ead:extptr | child::ead:lb | child::ead:ptr">
										<xsl:apply-templates select="."/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="text()"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</xsl:for-each>
					<xsl:for-each select="./ead:controlaccess">
						<tr>
							<td/>
							<td/>
							<td colspan="12" valign="top">
								<strong>
									<xsl:apply-templates select="ead:head"/>
								</strong>
							</td>
						</tr>
						<xsl:for-each
							select="ead:subject | ead:corpname | ead:persname | ead:famname | ead:genreform | ead:title | ead:geogname | ead:occupation | ead:function">
							<tr>
								<td/>
								<td/>
								<td/>
								<td colspan="11" valign="top">
									<xsl:choose>
										<xsl:when
											test="child::ead:subarea | child::ead:emph | child::ead:extptr | child::ead:lb | child::ead:ptr">
											<xsl:apply-templates select="."/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="text()"/>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</xsl:for-each>
					</xsl:for-each>
				</xsl:for-each>
				<xsl:for-each select="ead:relatedmaterial | ead:separatedmaterial">
					<xsl:for-each select="ead:head">
						<tr>
							<td/>
							<td colspan="13" valign="top">
								<strong>
									<xsl:apply-templates select="."/>
								</strong>
							</td>
						</tr>
					</xsl:for-each>
					<tr>
						<td/>
						<td colspan="13" valign="top">
							<xsl:apply-templates select="ead:p"/>
						</td>
					</tr>
					<xsl:for-each select="./ead:relatedmaterial | ./ead:separatedmaterial">
						<tr>
							<td/>
							<td/>
							<td colspan="12" valign="top">
								<xsl:apply-templates select="ead:p"/>
							</td>
						</tr>
						<xsl:for-each select="ead:note">
							<tr>
								<td/>
								<td/>
								<td colspan="12" valign="top">
									<xsl:apply-templates select="."/>
								</td>
							</tr>
						</xsl:for-each>
						<xsl:for-each select="ead:archref | ead:bibref">
							<tr>
								<td/>
								<td/>
								<td colspan="12" valign="top">
									<xsl:apply-templates select="."/>
								</td>
							</tr>
						</xsl:for-each>
					</xsl:for-each>
				</xsl:for-each>
				<xsl:for-each select="ead:note | ead:accessrestrict | ead:userestrict | ead:phystech | ead:prefercite | ead:appraisal | ead:acqinfo | ead:originalsloc | ead:processinfo | ead:odd | ead:altformavail | ead:otherfindaid">
					<xsl:for-each select="ead:head">
						<tr>
							<td/>
							<td colspan="13" valign="top">
								<strong>
									<xsl:apply-templates select="."/>
								</strong>
							</td>
						</tr>
					</xsl:for-each>
					<xsl:for-each select="ead:p">
						<tr>
							<td/>
							<td colspan="13" valign="top">
								<xsl:apply-templates select="."/>
							</td>
						</tr>
					</xsl:for-each>
					<xsl:for-each select="ead:table">
						<tr>
							<td/>
							<td colspan="13" valign="top">
								<xsl:apply-templates select="."/>
							</td>
						</tr>
					</xsl:for-each>
				<xsl:for-each select="ead:archref | ead:bibref | ead:extref">
						<tr>
							<td/>
							<td colspan="13" valign="top">
								<xsl:apply-templates select="."/>
							</td>
						</tr>            
					</xsl:for-each>					
				</xsl:for-each>
				<!-- Proceses each c02.-->
				<xsl:for-each select="ead:c02">
					<xsl:for-each select="ead:did">
						<xsl:variable name="cntr-number" select="ead:container[@type][1]"/>
						<xsl:variable name="cntr-type" select="ead:container[1]/@type"/>
						<xsl:choose>
							<xsl:when
								test="preceding::ead:did[1][ead:container[@type][1]=$cntr-number] and preceding::ead:did[1][ead:container[1]/@type=$cntr-type] or not(./ead:container)">
								<xsl:call-template name="hidebox-c02-box-only"/>
							</xsl:when>
							<!-- If the box number did appear in a previous component, hide it here. -->
							<xsl:otherwise>
								<xsl:call-template name="showbox-c02-box-only"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
					<!-- Process any remaining c02 elements of the type specified.-->
					<xsl:for-each select="ead:scopecontent | ead:bioghist | ead:arrangement">
						<xsl:for-each select="ead:head">
							<tr>
								<td/>
								<td/>
								<td/>
								<td colspan="11" valign="top">
									<strong>
										<xsl:apply-templates select="."/>
									</strong>
								</td>
							</tr>
						</xsl:for-each>
						<xsl:for-each select="ead:p">
							<tr>
								<td/>
								<td/>
								<td/>
								<td colspan="11" valign="top">
									<xsl:apply-templates select="."/>
								</td>
							</tr>
						</xsl:for-each>
						<xsl:for-each select="ead:list/ead:item">
							<tr>
								<td/>
								<td/>
								<td/>
								<td colspan="11" valign="top">
									<xsl:apply-templates select="."/>
								</td>
							</tr>
						</xsl:for-each>
					</xsl:for-each>
					<xsl:for-each select="ead:dao">
						<tr>
							<td/>
							<td/>
							<td/>
							<td colspan="11" valign="top">
								<xsl:call-template name="dao"/>
							</td>
						</tr>
					</xsl:for-each>
					<xsl:for-each select="ead:controlaccess">
						<xsl:for-each select="ead:head">
							<tr>
								<td/>
								<td/>
								<td/>
								<td colspan="11" valign="top">
									<strong>
										<xsl:apply-templates select="."/>
									</strong>
								</td>
							</tr>
						</xsl:for-each>
						<tr>
							<td/>
							<td/>
							<td/>
							<td colspan="11" valign="top">
								<xsl:apply-templates select="ead:p"/>
							</td>
						</tr>
						<xsl:for-each
							select="ead:subject | ead:corpname | ead:persname | ead:famname | ead:genreform | ead:title | ead:geogname | ead:occupation | ead:function">
							<tr>
								<td/>
								<td/>
								<td/>
								<td/>
								<td colspan="10" valign="top">
									<xsl:choose>
										<xsl:when
											test="child::ead:subarea | child::ead:emph | child::ead:extptr | child::ead:lb | child::ead:ptr">
											<xsl:apply-templates select="."/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="text()"/>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</xsl:for-each>
						<xsl:for-each select="./ead:controlaccess">
							<tr>
								<td/>
								<td/>
								<td/>
								<td/>
								<td colspan="10" valign="top">
									<strong>
										<xsl:apply-templates select="ead:head"/>
									</strong>
								</td>
							</tr>
							<xsl:for-each
								select="ead:subject | ead:corpname | ead:persname | ead:famname | ead:genreform | ead:title | ead:geogname | ead:occupation | ead:function">
								<tr>
									<td/>
									<td/>
									<td/>
									<td/>
									<td/>
									<td colspan="9" valign="top">
										<xsl:choose>
											<xsl:when
												test="child::ead:subarea | child::ead:emph | child::ead:extptr | child::ead:lb | child::ead:ptr">
												<xsl:apply-templates select="."/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="text()"/>
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
					<xsl:for-each select="ead:relatedmaterial | ead:separatedmaterial">
						<xsl:for-each select="ead:head">
							<tr>
								<td/>
								<td/>
								<td/>
								<td colspan="11" valign="top">
									<strong>
										<xsl:apply-templates select="."/>
									</strong>
								</td>
							</tr>
						</xsl:for-each>
						<tr>
							<td/>
							<td/>
							<td/>
							<td colspan="11" valign="top">
								<xsl:apply-templates select="ead:p"/>
							</td>
						</tr>
						<xsl:for-each select="./ead:relatedmaterial | ./ead:separatedmaterial">
							<tr>
								<td/>
								<td/>
								<td/>
								<td/>
								<td colspan="10" valign="top">
									<xsl:apply-templates select="ead:p"/>
								</td>
							</tr>
							<xsl:for-each select="ead:note">
								<tr>
									<td/>
									<td/>
									<td/>
									<td/>
									<td colspan="10" valign="top">
										<xsl:apply-templates select="."/>
									</td>
								</tr>
							</xsl:for-each>
							<xsl:for-each select="ead:archref | ead:bibref">
								<tr>
									<td/>
									<td/>
									<td/>
									<td/>
									<td colspan="10" valign="top">
										<xsl:apply-templates select="."/>
									</td>
								</tr>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
					<xsl:for-each
						select="ead:note | ead:accessrestrict | ead:userestrict | ead:phystech | ead:prefercite | ead:acqinfo | ead:originalsloc | ead:processinfo | ead:odd">
						<xsl:for-each select="ead:head">
							<tr>
								<td/>
								<td/>
								<td/>
								<td colspan="11" valign="top">
									<strong>
										<xsl:apply-templates select="."/>
									</strong>
								</td>
							</tr>
						</xsl:for-each>
						<xsl:for-each select="ead:p">
							<tr>
								<td/>
								<td/>
								<td/>
								<td colspan="11" valign="top">
									<xsl:apply-templates select="."/>
								</td>
							</tr>
						</xsl:for-each>
						<xsl:for-each select="ead:table">
							<tr>
								<td/>
								<td/>
								<td/>
								<td colspan="11" valign="top">
									<xsl:apply-templates select="."/>
								</td>
							</tr>
						</xsl:for-each>
					</xsl:for-each>
					<xsl:for-each select="ead:note | ead:accessrestrict | ead:userestrict | ead:phystech | ead:prefercite | ead:appraisal | ead:acqinfo | ead:originalsloc | ead:processinfo | ead:odd | ead:altformavail | ead:otherfindaid">
						<xsl:for-each select="ead:head">
							<tr>
								<td/>
								<td/>
								<td/>
								<td colspan="11" valign="top">
									<strong>
										<xsl:apply-templates select="."/>
									</strong>
								</td>
							</tr>
						</xsl:for-each>
						<xsl:for-each select="ead:p">
							<tr>
								<td/>
								<td/>
								<td/>
								<td colspan="11" valign="top">
									<xsl:apply-templates select="."/>
								</td>
							</tr>
						</xsl:for-each>
						<xsl:for-each select="ead:table">
							<tr>
								<td/>
								<td/>
								<td/>
								<td colspan="11" valign="top">
									<xsl:apply-templates select="."/>
								</td>
							</tr>
						</xsl:for-each>
						<xsl:for-each select="ead:archref | ead:bibref | ead:extref">
							<tr>
								<td/>
								<td/>
								<td/>
								<td colspan="11" valign="top">
									<xsl:apply-templates select="."/>
								</td>
							</tr>            
						</xsl:for-each>
						
					</xsl:for-each>
					
					<!-- Processes each c03.-->
					<xsl:for-each select="ead:c03">
						<xsl:for-each select="ead:did">
							<xsl:variable name="cntr-number" select="ead:container[@type][1]"/>
							<xsl:variable name="cntr-type" select="ead:container[1]/@type"/>
							<xsl:choose>
								<xsl:when
									test="../preceding::ead:did[1][ead:container[@type][1]=$cntr-number] and ./preceding::ead:did[1][ead:container[1]/@type=$cntr-type] or not(./ead:container)">
									<xsl:call-template name="hidebox-c03-box-only"/>
								</xsl:when>
								<!-- If the box number did appear in a previous component, hide it here. -->
								<xsl:otherwise>
									<xsl:call-template name="showbox-c03-box-only"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
						<!-- Process any remaining c03 elements of the type specified.-->
						<xsl:for-each select="ead:scopecontent | ead:bioghist | ead:arrangement">
							<xsl:for-each select="ead:head">
								<tr>
									<td/>
									<td/>
									<td/>
									<td/>
									<td colspan="10" valign="top">
										<strong>
											<xsl:apply-templates select="."/>
										</strong>
									</td>
								</tr>
							</xsl:for-each>
							<xsl:for-each select="ead:p">
								<tr>
									<td/>
									<td/>
									<td/>
									<td/>
									<td colspan="10" valign="top">
										<xsl:apply-templates select="."/>
									</td>
								</tr>
							</xsl:for-each>
							<xsl:for-each select="ead:list/ead:item">
								<tr>
									<td/>
									<td/>
									<td/>
									<td/>
									<td colspan="10" valign="top">
										<xsl:apply-templates select="."/>
									</td>
								</tr>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:for-each select="ead:dao">
							<tr>
								<td/>
								<td/>
								<td/>
								<td/>
								<td colspan="10" valign="top">
									<xsl:call-template name="dao"/>
								</td>
							</tr>
						</xsl:for-each>
						<xsl:for-each select="ead:controlaccess">
							<xsl:for-each select="ead:head">
								<tr>
									<td/>
									<td/>
									<td/>
									<td/>
									<td colspan="10" valign="top">
										<strong>
											<xsl:apply-templates select="."/>
										</strong>
									</td>
								</tr>
							</xsl:for-each>
							<tr>
								<td/>
								<td/>
								<td/>
								<td/>
								<td colspan="10" valign="top">
									<xsl:apply-templates select="ead:p"/>
								</td>
							</tr>
							<xsl:for-each
								select="ead:subject | ead:corpname | ead:persname | ead:famname | ead:genreform | ead:title | ead:geogname | ead:occupation | ead:function">
								<tr>
									<td/>
									<td/>
									<td/>
									<td/>
									<td/>
									<td colspan="9" valign="top">
										<xsl:choose>
											<xsl:when
												test="child::ead:subarea | child::ead:emph | child::ead:extptr | child::ead:lb | child::ead:ptr">
												<xsl:apply-templates select="."/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="text()"/>
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
							</xsl:for-each>
							<xsl:for-each select="./ead:controlaccess">
								<tr>
									<td/>
									<td/>
									<td/>
									<td/>
									<td/>
									<td colspan="9" valign="top">
										<strong>
											<xsl:apply-templates select="ead:head"/>
										</strong>
									</td>
								</tr>
								<xsl:for-each
									select="ead:subject | ead:corpname | ead:persname | ead:famname | ead:genreform | ead:title | ead:geogname | ead:occupation | ead:function">
									<tr>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td colspan="8" valign="top">
											<xsl:choose>
												<xsl:when
												test="child::ead:subarea | child::ead:emph | child::ead:extptr | child::ead:lb | child::ead:ptr">
												<xsl:apply-templates select="."/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:value-of select="text()"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:for-each select="ead:relatedmaterial | ead:separatedmaterial">
							<xsl:for-each select="ead:head">
								<tr>
									<td/>
									<td/>
									<td/>
									<td/>
									<td colspan="10" valign="top">
										<strong>
											<xsl:apply-templates select="."/>
										</strong>
									</td>
								</tr>
							</xsl:for-each>
							<tr>
								<td/>
								<td/>
								<td/>
								<td/>
								<td colspan="10" valign="top">
									<xsl:apply-templates select="ead:p"/>
								</td>
							</tr>
							<xsl:for-each select="./ead:relatedmaterial | ./ead:separatedmaterial">
								<tr>
									<td/>
									<td/>
									<td/>
									<td/>
									<td/>
									<td colspan="9" valign="top">
										<xsl:apply-templates select="ead:p"/>
									</td>
								</tr>
								<xsl:for-each select="ead:note">
									<tr>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td colspan="9" valign="top">
											<xsl:apply-templates select="."/>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:for-each select="ead:archref | ead:bibref">
									<tr>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td colspan="9" valign="top">
											<xsl:apply-templates select="."/>
										</td>
									</tr>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:for-each select="ead:note | ead:accessrestrict | ead:userestrict | ead:phystech | ead:prefercite | ead:appraisal | ead:acqinfo | ead:originalsloc | ead:processinfo | ead:odd | ead:altformavail | ead:otherfindaid">
							<xsl:for-each select="ead:head">
								<tr>
									<td/>
									<td/>
									<td/>
									<td/>
									<td colspan="10" valign="top">
										<strong>
											<xsl:apply-templates select="."/>
										</strong>
									</td>
								</tr>
							</xsl:for-each>
							<xsl:for-each select="ead:p">
								<tr>
									<td/>
									<td/>
									<td/>
									<td/>
									<td colspan="10" valign="top">
										<xsl:apply-templates select="."/>
									</td>
								</tr>
							</xsl:for-each>
							<xsl:for-each select="ead:table">
								<tr>
									<td/>
									<td/>
									<td/>
									<td/>
									<td colspan="10" valign="top">
										<xsl:apply-templates select="."/>
									</td>
								</tr>
							</xsl:for-each>
						<xsl:for-each select="ead:archref | ead:bibref | ead:extref">
								<tr>
									<td/>
									<td/>
									<td/>
									<td/>
									<td colspan="10" valign="top">
										<xsl:apply-templates select="."/>
									</td>
								</tr>            
							</xsl:for-each>
							
						</xsl:for-each>
						<!-- Processes each c04.-->
						<xsl:for-each select="ead:c04">
							<xsl:for-each select="ead:did">
								<xsl:variable name="cntr-number" select="ead:container[@type][1]"/>
								<xsl:variable name="cntr-type" select="ead:container[1]/@type"/>
								<xsl:choose>
									<xsl:when
										test="preceding::ead:did[1][ead:container[@type][1]=$cntr-number] and preceding::ead:did[1][ead:container[1]/@type=$cntr-type] or not(./ead:container)">
										<xsl:call-template name="hidebox-c04-box-only"/>
									</xsl:when>
									<!-- If the box number did appear in a previous component, hide it here. -->
									<xsl:otherwise>
										<xsl:call-template name="showbox-c04-box-only"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
							<!-- Process any remaining c04 elements of the type specified.-->
							<xsl:for-each select="ead:scopecontent | ead:bioghist | ead:arrangement">
								<xsl:for-each select="ead:head">
									<tr>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td colspan="9" valign="top">
											<strong>
												<xsl:apply-templates select="."/>
											</strong>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:for-each select="ead:p">
									<tr>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td colspan="9" valign="top">
											<xsl:apply-templates select="."/>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:for-each select="ead:list/ead:item">
									<tr>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td colspan="9" valign="top">
											<xsl:apply-templates select="."/>
										</td>
									</tr>
								</xsl:for-each>
							</xsl:for-each>
							<xsl:for-each select="ead:dao">
								<tr>
									<td/>
									<td/>
									<td/>
									<td/>
									<td/>
									<td colspan="9" valign="top">
										<xsl:call-template name="dao"/>
									</td>
								</tr>
							</xsl:for-each>
							<xsl:for-each select="ead:controlaccess">
								<xsl:for-each select="ead:head">
									<tr>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td colspan="9" valign="top">
											<strong>
												<xsl:apply-templates select="."/>
											</strong>
										</td>
									</tr>
								</xsl:for-each>
								<tr>
									<td/>
									<td/>
									<td/>
									<td/>
									<td/>
									<td colspan="9" valign="top">
										<xsl:apply-templates select="ead:p"/>
									</td>
								</tr>
								<xsl:for-each
									select="ead:subject | ead:corpname | ead:persname | ead:famname | ead:genreform | ead:title | ead:geogname | ead:occupation | ead:function">
									<tr>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td colspan="8" valign="top">
											<xsl:choose>
												<xsl:when
												test="child::ead:subarea | child::ead:emph | child::ead:extptr | child::ead:lb | child::ead:ptr">
												<xsl:apply-templates select="."/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:value-of select="text()"/>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:for-each select="./ead:controlaccess">
									<tr>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td colspan="8" valign="top">
											<strong>
												<xsl:apply-templates select="ead:head"/>
											</strong>
										</td>
									</tr>
									<xsl:for-each
										select="ead:subject | ead:corpname | ead:persname | ead:famname | ead:genreform | ead:title | ead:geogname | ead:occupation | ead:function">
										<tr>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td colspan="7" valign="top">
												<xsl:choose>
												<xsl:when
												test="child::ead:subarea | child::ead:emph | child::ead:extptr | child::ead:lb | child::ead:ptr">
												<xsl:apply-templates select="."/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:value-of select="text()"/>
												</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:for-each>
							</xsl:for-each>
							<xsl:for-each select="ead:relatedmaterial | ead:separatedmaterial">
								<xsl:for-each select="ead:head">
									<tr>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td colspan="9" valign="top">
											<strong>
												<xsl:apply-templates select="."/>
											</strong>
										</td>
									</tr>
								</xsl:for-each>
								<tr>
									<td/>
									<td/>
									<td/>
									<td/>
									<td/>
									<td colspan="9" valign="top">
										<xsl:apply-templates select="ead:p"/>
									</td>
								</tr>
								<xsl:for-each
									select="./ead:relatedmaterial | ./ead:separatedmaterial">
									<tr>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td colspan="8" valign="top">
											<xsl:apply-templates select="ead:p"/>
										</td>
									</tr>
									<xsl:for-each select="ead:note">
										<tr>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td colspan="8" valign="top">
												<xsl:apply-templates select="."/>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:for-each select="ead:archref | ead:bibref">
										<tr>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td colspan="8" valign="top">
												<xsl:apply-templates select="."/>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:for-each>
							</xsl:for-each>
							<xsl:for-each
								select="ead:note | ead:accessrestrict | ead:userestrict | ead:phystech | ead:prefercite | ead:acqinfo | ead:originalsloc | ead:processinfo | ead:odd">
								<xsl:for-each select="ead:head">
									<tr>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td colspan="9" valign="top">
											<strong>
												<xsl:apply-templates select="."/>
											</strong>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:for-each select="ead:p">
									<tr>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td colspan="9" valign="top">
											<xsl:apply-templates select="."/>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:for-each select="ead:table">
									<tr>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td colspan="9" valign="top">
											<xsl:apply-templates select="."/>
										</td>
									</tr>
								</xsl:for-each>
							</xsl:for-each>
							<xsl:for-each select="ead:note | ead:accessrestrict | ead:userestrict | ead:phystech | ead:prefercite | ead:appraisal | ead:acqinfo | ead:originalsloc | ead:processinfo | ead:odd | ead:altformavail | ead:otherfindaid">
								<xsl:for-each select="ead:head">
									<tr>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td colspan="9" valign="top">
											<strong>
												<xsl:apply-templates select="."/>
											</strong>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:for-each select="ead:p">
									<tr>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td colspan="9" valign="top">
											<xsl:apply-templates select="."/>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:for-each select="ead:table">
									<tr>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td colspan="9" valign="top">
											<xsl:apply-templates select="."/>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:for-each select="ead:archref | ead:bibref | ead:extref">
									<tr>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td colspan="9" valign="top">
											<xsl:apply-templates select="."/>
										</td>
									</tr>            
								</xsl:for-each>
								
							</xsl:for-each>
							
							<!-- Processes each c05-->
							<xsl:for-each select="ead:c05">
								<xsl:for-each select="ead:did">
									<xsl:variable name="cntr-number"
										select="ead:container[@type][1]"/>
									<xsl:variable name="cntr-type" select="ead:container[1]/@type"/>
									<xsl:choose>
										<xsl:when
											test="preceding::ead:did[1][ead:container[@type][1]=$cntr-number] and preceding::ead:did[1][ead:container[1]/@type=$cntr-type] or not(./ead:container)">
											<xsl:call-template name="hidebox-c05-box-only"/>
										</xsl:when>
										<!-- If the box number did appear in a previous component, hide it here. -->
										<xsl:otherwise>
											<xsl:call-template name="showbox-c05-box-only"/>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
								<!-- Process any remaining c05 elements of the type specified.-->
								<xsl:for-each
									select="ead:scopecontent | ead:bioghist | ead:arrangement">
									<xsl:for-each select="ead:head">
										<tr>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td colspan="8" valign="top">
												<strong>
												<xsl:apply-templates select="."/>
												</strong>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:for-each select="ead:p">
										<tr>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td colspan="8" valign="top">
												<xsl:apply-templates select="."/>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:for-each select="ead:list/ead:item">
										<tr>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td colspan="8" valign="top">
												<xsl:apply-templates select="."/>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:for-each>
								<xsl:for-each select="ead:dao">
									<tr>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td colspan="8" valign="top">
											<xsl:call-template name="dao"/>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:for-each select="ead:controlaccess">
									<xsl:for-each select="ead:head">
										<tr>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td colspan="8" valign="top">
												<strong>
												<xsl:apply-templates select="."/>
												</strong>
											</td>
										</tr>
									</xsl:for-each>
									<tr>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td colspan="8" valign="top">
											<xsl:apply-templates select="ead:p"/>
										</td>
									</tr>
									<xsl:for-each
										select="ead:subject | ead:corpname | ead:persname | ead:famname | ead:genreform | ead:title | ead:geogname | ead:occupation | ead:function">
										<tr>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td colspan="7" valign="top">
												<xsl:choose>
												<xsl:when
												test="child::ead:subarea | child::ead:emph | child::ead:extptr | child::ead:lb | child::ead:ptr">
												<xsl:apply-templates select="."/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:value-of select="text()"/>
												</xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:for-each select="./ead:controlaccess">
										<tr>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td colspan="7" valign="top">
												<strong>
												<xsl:apply-templates select="ead:head"/>
												</strong>
											</td>
										</tr>
										<xsl:for-each
											select="ead:subject | ead:corpname | ead:persname | ead:famname | ead:genreform | ead:title | ead:geogname | ead:occupation | ead:function">
											<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="6" valign="top">
												<xsl:choose>
												<xsl:when
												test="child::ead:subarea | child::ead:emph | child::ead:extptr | child::ead:lb | child::ead:ptr">
												<xsl:apply-templates select="."/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:value-of select="text()"/>
												</xsl:otherwise>
												</xsl:choose>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
								<xsl:for-each select="ead:relatedmaterial | ead:separatedmaterial">
									<xsl:for-each select="ead:head">
										<tr>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td colspan="8" valign="top">
												<strong>
												<xsl:apply-templates select="."/>
												</strong>
											</td>
										</tr>
									</xsl:for-each>
									<tr>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td/>
										<td colspan="8" valign="top">
											<xsl:apply-templates select="ead:p"/>
										</td>
									</tr>
									<xsl:for-each
										select="./ead:relatedmaterial | ./ead:separatedmaterial">
										<tr>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td colspan="7" valign="top">
												<xsl:apply-templates select="ead:p"/>
											</td>
										</tr>
										<xsl:for-each select="ead:note">
											<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="7" valign="top">
												<xsl:apply-templates select="."/>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:for-each select="ead:archref | ead:bibref">
											<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="7" valign="top">
												<xsl:apply-templates select="."/>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
								<xsl:for-each
									select="ead:note | ead:accessrestrict | ead:userestrict | ead:phystech | ead:prefercite | ead:acqinfo | ead:originalsloc | ead:processinfo | ead:odd">
									<xsl:for-each select="ead:head">
										<tr>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td colspan="8" valign="top">
												<strong>
												<xsl:apply-templates select="."/>
												</strong>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:for-each select="ead:p">
										<tr>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td colspan="8" valign="top">
												<xsl:apply-templates select="."/>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:for-each select="ead:table">
										<tr>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td colspan="8" valign="top">
												<xsl:apply-templates select="."/>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:for-each>
								<xsl:for-each select="ead:note | ead:accessrestrict | ead:userestrict | ead:phystech | ead:prefercite | ead:appraisal | ead:acqinfo | ead:originalsloc | ead:processinfo | ead:odd | ead:altformavail | ead:otherfindaid">
									<xsl:for-each select="ead:head">
										<tr>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td colspan="8" valign="top">
												<strong>
													<xsl:apply-templates select="."/>
												</strong>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:for-each select="ead:p">
										<tr>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td colspan="8" valign="top">
												<xsl:apply-templates select="."/>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:for-each select="ead:table">
										<tr>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td colspan="8" valign="top">
												<xsl:apply-templates select="."/>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:for-each select="ead:archref | ead:bibref | ead:extref">
										<tr>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td colspan="8" valign="top">
												<xsl:apply-templates select="."/>
											</td>
										</tr>            
									</xsl:for-each>
									
								</xsl:for-each>
								
								<!-- Processes each c06-->
								<xsl:for-each select="ead:c06">
									<xsl:for-each select="ead:did">
										<xsl:variable name="cntr-number"
											select="ead:container[@type][1]"/>
										<xsl:variable name="cntr-type"
											select="ead:container[1]/@type"/>
										<xsl:choose>
											<xsl:when
												test="preceding::ead:did[1][ead:container[@type][1]=$cntr-number] and preceding::ead:did[1][ead:container[1]/@type=$cntr-type] or not(./ead:container)">
												<xsl:call-template name="hidebox-c06-box-only"/>
											</xsl:when>
											<!-- If the box number did appear in a previous component, hide it here. -->
											<xsl:otherwise>
												<xsl:call-template name="showbox-c06-box-only"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:for-each>
									<!-- Process any remaining c06 elements of the type specified.-->
									<xsl:for-each
										select="ead:scopecontent | ead:bioghist | ead:arrangement">
										<xsl:for-each select="ead:head">
											<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="7" valign="top">
												<strong>
												<xsl:apply-templates select="."/>
												</strong>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:for-each select="ead:p">
											<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="7" valign="top">
												<xsl:apply-templates select="."/>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:for-each select="ead:list/ead:item">
											<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="8" valign="top">
												<xsl:apply-templates select="."/>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:for-each>
									<xsl:for-each select="ead:controlaccess">
										<xsl:for-each select="ead:dao">
											<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="7" valign="top">
												<xsl:call-template name="dao"/>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:for-each select="ead:head">
											<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="7" valign="top">
												<strong>
												<xsl:apply-templates select="."/>
												</strong>
												</td>
											</tr>
										</xsl:for-each>
										<tr>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td colspan="7" valign="top">
												<xsl:apply-templates select="ead:p"/>
											</td>
										</tr>
										<xsl:for-each
											select="ead:subject | ead:corpname | ead:persname | ead:famname | ead:genreform | ead:title | ead:geogname | ead:occupation | ead:function">
											<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="6" valign="top">
												<xsl:choose>
												<xsl:when
												test="child::ead:subarea | child::ead:emph | child::ead:extptr | child::ead:lb | child::ead:ptr">
												<xsl:apply-templates select="."/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:value-of select="text()"/>
												</xsl:otherwise>
												</xsl:choose>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:for-each select="./ead:controlaccess">
											<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="6" valign="top">
												<strong>
												<xsl:apply-templates select="ead:head"/>
												</strong>
												</td>
											</tr>
											<xsl:for-each
												select="ead:subject | ead:corpname | ead:persname | ead:famname | ead:genreform | ead:title | ead:geogname | ead:occupation | ead:function">
												<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="5" valign="top">
												<xsl:choose>
												<xsl:when
												test="child::ead:subarea | child::ead:emph | child::ead:extptr | child::ead:lb | child::ead:ptr">
												<xsl:apply-templates select="."/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:value-of select="text()"/>
												</xsl:otherwise>
												</xsl:choose>
												</td>
												</tr>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
									<xsl:for-each
										select="ead:relatedmaterial | ead:separatedmaterial">
										<xsl:for-each select="ead:head">
											<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="7" valign="top">
												<strong>
												<xsl:apply-templates select="."/>
												</strong>
												</td>
											</tr>
										</xsl:for-each>
										<tr>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td/>
											<td colspan="7" valign="top">
												<xsl:apply-templates select="ead:p"/>
											</td>
										</tr>
										<xsl:for-each
											select="./ead:relatedmaterial | ./ead:separatedmaterial">
											<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="6" valign="top">
												<xsl:apply-templates select="ead:p"/>
												</td>
											</tr>
											<xsl:for-each select="ead:note">
												<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="6" valign="top">
												<xsl:apply-templates select="."/>
												</td>
												</tr>
											</xsl:for-each>
											<xsl:for-each select="ead:archref | ead:bibref">
												<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="6" valign="top">
												<xsl:apply-templates select="."/>
												</td>
												</tr>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
									<xsl:for-each
										select="ead:note | ead:accessrestrict | ead:userestrict | ead:phystech | ead:prefercite | ead:acqinfo | ead:originalsloc | ead:processinfo | ead:odd">
										<xsl:for-each select="ead:head">
											<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="7" valign="top">
												<strong>
												<xsl:apply-templates select="."/>
												</strong>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:for-each select="ead:p">
											<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="7" valign="top">
												<xsl:apply-templates select="."/>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:for-each select="ead:table">
											<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="7" valign="top">
												<xsl:apply-templates select="."/>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:for-each>
									<xsl:for-each select="ead:note | ead:accessrestrict | ead:userestrict | ead:phystech | ead:prefercite | ead:appraisal | ead:acqinfo | ead:originalsloc | ead:processinfo | ead:odd | ead:altformavail | ead:otherfindaid">
										<xsl:for-each select="ead:head">
											<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="7" valign="top">
													<strong>
														<xsl:apply-templates select="."/>
													</strong>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:for-each select="ead:p">
											<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="7" valign="top">
													<xsl:apply-templates select="."/>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:for-each select="ead:table">
											<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="7" valign="top">
													<xsl:apply-templates select="."/>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:for-each select="ead:archref | ead:bibref | ead:extref">
											<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="7" valign="top">
													<xsl:apply-templates select="."/>
												</td>
											</tr>            
										</xsl:for-each>
										
									</xsl:for-each>
									
									<!-- Processes each c07.-->
									<xsl:for-each select="ead:c07">
										<xsl:for-each select="ead:did">
											<xsl:variable name="cntr-number"
												select="ead:container[@type][1]"/>
											<xsl:variable name="cntr-type"
												select="ead:container[1]/@type"/>
											<xsl:choose>
												<xsl:when
												test="preceding::ead:did[1][ead:container[@type][1]=$cntr-number] and preceding::ead:did[1][ead:container[1]/@type=$cntr-type] or not(./ead:container)">
												<xsl:call-template name="hidebox-c07-box-only"/>
												</xsl:when>
												<!-- If the box number did appear in a previous component, hide it here. -->
												<xsl:otherwise>
												<xsl:call-template name="showbox-c07-box-only"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:for-each>
										<!-- Process any remaining c07 elements of the type specified.-->
										<xsl:for-each
											select="ead:scopecontent | ead:bioghist | ead:arrangement">
											<xsl:for-each select="ead:head">
												<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="6" valign="top">
												<strong>
												<xsl:apply-templates select="."/>
												</strong>
												</td>
												</tr>
											</xsl:for-each>
											<xsl:for-each select="ead:p">
												<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="6" valign="top">
												<xsl:apply-templates select="."/>
												</td>
												</tr>
											</xsl:for-each>
											<xsl:for-each select="ead:list/ead:item">
												<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="6" valign="top">
												<xsl:apply-templates select="."/>
												</td>
												</tr>
											</xsl:for-each>
										</xsl:for-each>
										<xsl:for-each select="ead:dao">
											<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="6" valign="top">
												<xsl:call-template name="dao"/>
												</td>
											</tr>
										</xsl:for-each>
										<xsl:for-each select="ead:controlaccess">
											<xsl:for-each select="ead:head">
												<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="6" valign="top">
												<strong>
												<xsl:apply-templates select="."/>
												</strong>
												</td>
												</tr>
											</xsl:for-each>
											<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="6" valign="top">
												<xsl:apply-templates select="ead:p"/>
												</td>
											</tr>
											<xsl:for-each
												select="ead:subject | ead:corpname | ead:persname | ead:famname | ead:genreform | ead:title | ead:geogname | ead:occupation | ead:function">
												<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="5" valign="top">
												<xsl:choose>
												<xsl:when
												test="child::ead:subarea | child::ead:emph | child::ead:extptr | child::ead:lb | child::ead:ptr">
												<xsl:apply-templates select="."/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:value-of select="text()"/>
												</xsl:otherwise>
												</xsl:choose>
												</td>
												</tr>
											</xsl:for-each>
											<xsl:for-each select="./ead:controlaccess">
												<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="5" valign="top">
												<strong>
												<xsl:apply-templates select="ead:head"/>
												</strong>
												</td>
												</tr>
												<xsl:for-each
												select="ead:subject | ead:corpname | ead:persname | ead:famname | ead:genreform | ead:title | ead:geogname | ead:occupation | ead:function">
												<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="4" valign="top">
												<xsl:choose>
												<xsl:when
												test="child::ead:subarea | child::ead:emph | child::ead:extptr | child::ead:lb | child::ead:ptr">
												<xsl:apply-templates select="."/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:value-of select="text()"/>
												</xsl:otherwise>
												</xsl:choose>
												</td>
												</tr>
												</xsl:for-each>
											</xsl:for-each>
										</xsl:for-each>
										<xsl:for-each
											select="ead:relatedmaterial | ead:separatedmaterial">
											<xsl:for-each select="ead:head">
												<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="6" valign="top">
												<strong>
												<xsl:apply-templates select="."/>
												</strong>
												</td>
												</tr>
											</xsl:for-each>
											<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="6" valign="top">
												<xsl:apply-templates select="ead:p"/>
												</td>
											</tr>
											<xsl:for-each
												select="./ead:relatedmaterial | ./ead:separatedmaterial">
												<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="5" valign="top">
												<xsl:apply-templates select="ead:p"/>
												</td>
												</tr>
												<xsl:for-each select="ead:note">
												<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="5" valign="top">
												<xsl:apply-templates select="."/>
												</td>
												</tr>
												</xsl:for-each>
												<xsl:for-each select="ead:archref | ead:bibref">
												<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="5" valign="top">
												<xsl:apply-templates select="."/>
												</td>
												</tr>
												</xsl:for-each>
											</xsl:for-each>
										</xsl:for-each>
										<xsl:for-each
											select="ead:note | ead:accessrestrict | ead:userestrict | ead:phystech | ead:prefercite | ead:acqinfo | ead:originalsloc | ead:processinfo | ead:odd">
											<xsl:for-each select="ead:head">
												<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="6" valign="top">
												<strong>
												<xsl:apply-templates select="."/>
												</strong>
												</td>
												</tr>
											</xsl:for-each>
											<xsl:for-each select="ead:p">
												<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="6" valign="top">
												<xsl:apply-templates select="."/>
												</td>
												</tr>
											</xsl:for-each>
											<xsl:for-each select="ead:table">
												<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="6" valign="top">
												<xsl:apply-templates select="."/>
												</td>
												</tr>
											</xsl:for-each>
										</xsl:for-each>
										<xsl:for-each select="ead:note | ead:accessrestrict | ead:userestrict | ead:phystech | ead:prefercite | ead:appraisal | ead:acqinfo | ead:originalsloc | ead:processinfo | ead:odd | ead:altformavail | ead:otherfindaid">
											<xsl:for-each select="ead:head">
												<tr>
													<td/>
													<td/>
													<td/>
													<td/>
													<td/>
													<td/>
													<td/>
													<td/>
													<td colspan="6" valign="top">
														<strong>
															<xsl:apply-templates select="."/>
														</strong>
													</td>
												</tr>
											</xsl:for-each>
											<xsl:for-each select="ead:p">
												<tr>
													<td/>
													<td/>
													<td/>
													<td/>
													<td/>
													<td/>
													<td/>
													<td/>
													<td colspan="6" valign="top">
														<xsl:apply-templates select="."/>
													</td>
												</tr>
											</xsl:for-each>
											<xsl:for-each select="ead:table">
												<tr>
													<td/>
													<td/>
													<td/>
													<td/>
													<td/>
													<td/>
													<td/>
													<td/>
													<td colspan="6" valign="top">
														<xsl:apply-templates select="."/>
													</td>
												</tr>
											</xsl:for-each>
											<xsl:for-each select="ead:archref | ead:bibref | ead:extref">
												<tr>
													<td/>
													<td/>
													<td/>
													<td/>
													<td/>
													<td/>
													<td/>
													<td/>
													<td colspan="6" valign="top">
														<xsl:apply-templates select="."/>
													</td>
												</tr>            
											</xsl:for-each>
											
										</xsl:for-each>
										
										<!-- Processes each c08.-->
										<xsl:for-each select="ead:c08">
											<xsl:for-each select="ead:did">
												<xsl:variable name="cntr-number"
												select="ead:container[@type][1]"/>
												<xsl:variable name="cntr-type"
												select="ead:container[1]/@type"/>
												<xsl:choose>
												<xsl:when
												test="preceding::ead:did[1][ead:container[@type][1]=$cntr-number] and preceding::ead:did[1][ead:container[1]/@type=$cntr-type] or not(./ead:container)">
												<xsl:call-template name="hidebox-c08-box-only"/>
												</xsl:when>
												<!-- If the box number did appear in a previous component, hide it here. -->
												<xsl:otherwise>
												<xsl:call-template name="showbox-c08-box-only"/>
												</xsl:otherwise>
												</xsl:choose>
											</xsl:for-each>
											<!-- Process any remaining c08 elements of the type specified.-->
											<xsl:for-each
												select="ead:scopecontent | ead:bioghist | ead:arrangement">
												<xsl:for-each select="ead:head">
												<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="5" valign="top">
												<strong>
												<xsl:apply-templates select="."/>
												</strong>
												</td>
												</tr>
												</xsl:for-each>
												<xsl:for-each select="ead:p">
												<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="5" valign="top">
												<xsl:apply-templates select="."/>
												</td>
												</tr>
												</xsl:for-each>
												<xsl:for-each select="ead:list/ead:item">
												<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="5" valign="top">
												<xsl:apply-templates select="."/>
												</td>
												</tr>
												</xsl:for-each>
											</xsl:for-each>
											<xsl:for-each select="ead:dao">
												<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="5" valign="top">
												<xsl:call-template name="dao"/>
												</td>
												</tr>
											</xsl:for-each>
											<xsl:for-each select="ead:controlaccess">
												<xsl:for-each select="ead:head">
												<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="5" valign="top">
												<strong>
												<xsl:apply-templates select="."/>
												</strong>
												</td>
												</tr>
												</xsl:for-each>
												<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="5" valign="top">
												<xsl:apply-templates select="ead:p"/>
												</td>
												</tr>
												<xsl:for-each
												select="ead:subject | ead:corpname | ead:persname | ead:famname | ead:genreform | ead:title | ead:geogname | ead:occupation | ead:function">
												<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="4" valign="top">
												<xsl:choose>
												<xsl:when
												test="child::ead:subarea | child::ead:emph | child::ead:extptr | child::ead:lb | child::ead:ptr">
												<xsl:apply-templates select="."/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:value-of select="text()"/>
												</xsl:otherwise>
												</xsl:choose>
												</td>
												</tr>
												</xsl:for-each>
												<xsl:for-each select="./ead:controlaccess">
												<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="4" valign="top">
												<strong>
												<xsl:apply-templates select="ead:head"/>
												</strong>
												</td>
												</tr>
												<xsl:for-each
												select="ead:subject | ead:corpname | ead:persname | ead:famname | ead:genreform | ead:title | ead:geogname | ead:occupation | ead:function">
												<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="3" valign="top">
												<xsl:choose>
												<xsl:when
												test="child::ead:subarea | child::ead:emph | child::ead:extptr | child::ead:lb | child::ead:ptr">
												<xsl:apply-templates select="."/>
												</xsl:when>
												<xsl:otherwise>
												<xsl:value-of select="text()"/>
												</xsl:otherwise>
												</xsl:choose>
												</td>
												</tr>
												</xsl:for-each>
												</xsl:for-each>
											</xsl:for-each>
											<xsl:for-each
												select="ead:relatedmaterial | ead:separatedmaterial">
												<xsl:for-each select="ead:head">
												<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="5" valign="top">
												<strong>
												<xsl:apply-templates select="."/>
												</strong>
												</td>
												</tr>
												</xsl:for-each>
												<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="5" valign="top">
												<xsl:apply-templates select="ead:p"/>
												</td>
												</tr>
												<xsl:for-each
												select="./ead:relatedmaterial | ./ead:separatedmaterial">
												<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="4" valign="top">
												<xsl:apply-templates select="ead:p"/>
												</td>
												</tr>
												<xsl:for-each select="ead:note">
												<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="4" valign="top">
												<xsl:apply-templates select="."/>
												</td>
												</tr>
												</xsl:for-each>
												<xsl:for-each select="ead:archref | ead:bibref">
												<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="4" valign="top">
												<xsl:apply-templates select="."/>
												</td>
												</tr>
												</xsl:for-each>
												</xsl:for-each>
											</xsl:for-each>
											<xsl:for-each select="ead:note | ead:accessrestrict | ead:userestrict | ead:phystech | ead:prefercite | ead:appraisal | ead:acqinfo | ead:originalsloc | ead:processinfo | ead:odd | ead:altformavail | ead:otherfindaid">
												<xsl:for-each select="ead:head">
												<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="5" valign="top">
												<strong>
												<xsl:apply-templates select="."/>
												</strong>
												</td>
												</tr>
												</xsl:for-each>
												<xsl:for-each select="ead:p">
												<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="5" valign="top">
												<xsl:apply-templates select="."/>
												</td>
												</tr>
												</xsl:for-each>
												<xsl:for-each select="ead:table">
												<tr>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td/>
												<td colspan="5" valign="top">
												<xsl:apply-templates select="."/>
												</td>
												</tr>
												</xsl:for-each>
											<xsl:for-each select="ead:archref | ead:bibref | ead:extref">
													<tr>
														<td/>
														<td/>
														<td/>
														<td/>
														<td/>
														<td/>
														<td/>
														<td/>
														<td/>
														<td colspan="5" valign="top">
															<xsl:apply-templates select="."/>
														</td>
													</tr>            
												</xsl:for-each>
												
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
				</xsl:for-each>
			</table>
			<p>
				<a href="#a0">Return to the Table of Contents</a>
			</p>
			<br/>
			<hr/>
			<br/>
		</xsl:for-each>
	</xsl:template>
	<!--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX-->
	<!--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX-->
	<!-- Shows the container numbers for a c01.-->
	<xsl:template name="showbox-c01-box-only">
		<tr>
			<xsl:for-each select="ead:container[@type][1]">
				<td>
					<span style="font-size: small">
						<strong>
							<xsl:value-of select="@type"/>
						</strong>
					</span>
				</td>
			</xsl:for-each>
			<xsl:for-each select="ead:container[@type][2]">
				<td>
					<span style="font-size: small">
						<strong>
							<xsl:value-of select="@type"/>
						</strong>
					</span>
				</td>
			</xsl:for-each>
		</tr>
		<tr>
			<td valign="top">
				<xsl:if test="ead:container[@type][1]">
					<xsl:value-of select="ead:container[@type][1]"/>
					<!--<xsl:apply-templates select="ead:container[@type][1]"/>-->
				</xsl:if>
			</td>
			<td valign="top">
				<xsl:if test="ead:container[@type][2]">
					<xsl:value-of select="ead:container[@type][2]"/>
					<!--<xsl:apply-templates select="ead:container[@type][2]"/>-->
				</xsl:if>
			</td>
			<td colspan="11" valign="top">
				<xsl:call-template name="component-did"/>
			</td>
		</tr>
		<xsl:if
			test="ead:abstract[string-length(text()|*)!=0] | ead:note[string-length(text()|*)!=0]">
			<xsl:for-each select="ead:abstract | ead:note">
				<tr>
					<td/>
					<td/>
					<td colspan="10" valign="top">
						<xsl:apply-templates select="."/>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Shows the container numbers for a c02.-->
	<xsl:template name="showbox-c02-box-only">
		<tr>
			<xsl:for-each select="ead:container[@type][1]">
				<td>
					<span style="font-size: small">
						<strong>
							<xsl:value-of select="@type"/>
						</strong>
					</span>
				</td>
			</xsl:for-each>
			<xsl:for-each select="ead:container[@type][2]">
				<td>
					<span style="font-size: small">
						<strong>
							<xsl:value-of select="@type"/>
						</strong>
					</span>
				</td>
			</xsl:for-each>
		</tr>
		<tr>
			<td valign="top">
				<xsl:if test="ead:container[@type][1]">
					<xsl:value-of select="ead:container[@type][1]"/>
					<!--<xsl:apply-templates select="ead:container[@type][1]"/>-->
				</xsl:if>
			</td>
			<td valign="top">
				<xsl:if test="ead:container[@type][2]">
					<xsl:value-of select="ead:container[@type][2]"/>
					<!--<xsl:apply-templates select="ead:container[@type][2]"/>-->
				</xsl:if>
			</td>
			<td/>
			<td colspan="11" valign="top">
				<xsl:call-template name="component-did"/>
			</td>
		</tr>
		<xsl:if
			test="ead:abstract[string-length(text()|*)!=0] | ead:note[string-length(text()|*)!=0]">
			<xsl:for-each select="ead:abstract | ead:note">
				<tr>
					<td/>
					<td/>
					<td/>
					<td/>
					<td colspan="10" valign="top">
						<xsl:apply-templates select="."/>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!--Hides the container number for a c02.-->
	<xsl:template name="hidebox-c02-box-only">
		<tr>
			<td/>
			<td valign="top">
				<xsl:if test="ead:container[@type][2]">
					<xsl:value-of select="ead:container[@type][2]"/>
					<!--<xsl:apply-templates select="ead:container[@type][2]"/>-->
				</xsl:if>
			</td>
			<td/>
			<td colspan="11" valign="top">
				<xsl:call-template name="component-did"/>
			</td>
		</tr>
		<xsl:if
			test="ead:abstract[string-length(text()|*)!=0] | ead:note[string-length(text()|*)!=0]">
			<xsl:for-each select="ead:abstract | ead:note">
				<tr>
					<td/>
					<td/>
					<td/>
					<td/>
					<td colspan="10" valign="top">
						<xsl:apply-templates select="."/>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Shows the box number for a c03.-->
	<xsl:template name="showbox-c03-box-only">
		<tr>
			<xsl:for-each select="ead:container[@type][1]">
				<td>
					<span style="font-size: small">
						<strong>
							<xsl:value-of select="@type"/>
						</strong>
					</span>
				</td>
			</xsl:for-each>
			<xsl:for-each select="ead:container[@type][2]">
				<td>
					<span style="font-size: small">
						<strong>
							<xsl:value-of select="@type"/>
						</strong>
					</span>
				</td>
			</xsl:for-each>
		</tr>
		<tr>
			<td valign="top">
				<xsl:if test="ead:container[@type][1]">
					<xsl:value-of select="ead:container[@type][1]"/>
					<!--<xsl:apply-templates select="ead:container[@type][1]"/>-->
				</xsl:if>
			</td>
			<td valign="top">
				<xsl:if test="ead:container[@type][2]">
					<xsl:value-of select="ead:container[@type][2]"/>
					<!--<xsl:apply-templates select="ead:container[@type][2]"/>-->
				</xsl:if>
			</td>
			<td/>
			<td/>
			<td colspan="10" valign="top">
				<xsl:call-template name="component-did"/>
			</td>
		</tr>
		<xsl:if
			test="ead:abstract[string-length(text()|*)!=0] | ead:note[string-length(text()|*)!=0]">
			<xsl:for-each select="ead:abstract | ead:note">
				<tr>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td colspan="9" valign="top">
						<xsl:apply-templates select="."/>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!--Hides the container number for a c03.-->
	<xsl:template name="hidebox-c03-box-only">
		<tr>
			<td/>
			<td valign="top">
				<xsl:if test="ead:container[@type][2]">
					<xsl:value-of select="ead:container[@type][2]"/>
					<!--<xsl:apply-templates select="ead:container[@type][2]"/>-->
				</xsl:if>
			</td>
			<td/>
			<td/>
			<td colspan="10" valign="top">
				<xsl:call-template name="component-did"/>
			</td>
		</tr>
		<xsl:if
			test="ead:abstract[string-length(text()|*)!=0] | ead:note[string-length(text()|*)!=0]">
			<xsl:for-each select="ead:abstract | ead:note">
				<tr>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td colspan="9" valign="top">
						<xsl:apply-templates select="."/>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Shows the container number for a c04.-->
	<xsl:template name="showbox-c04-box-only">
		<tr>
			<xsl:for-each select="ead:container[@type][1]">
				<td>
					<strong>
						<span style="font-size: small">
							<xsl:value-of select="@type"/>
						</span>
					</strong>
				</td>
			</xsl:for-each>
			<xsl:for-each select="ead:container[@type][2]">
				<td>
					<strong>
						<span style="font-size: small">
							<xsl:value-of select="@type"/>
						</span>
					</strong>
				</td>
			</xsl:for-each>
		</tr>
		<tr>
			<td valign="top">
				<xsl:if test="ead:container[@type][1]">
					<xsl:value-of select="ead:container[@type][1]"/>
					<!--<xsl:apply-templates select="ead:container[@type][1]"/>-->
				</xsl:if>
			</td>
			<td valign="top">
				<xsl:if test="ead:container[@type][2]">
					<xsl:value-of select="ead:container[@type][2]"/>
					<!--<xsl:apply-templates select="ead:container[@type][2]"/>-->
				</xsl:if>
			</td>
			<td/>
			<td/>
			<td/>
			<td colspan="9" valign="top">
				<xsl:call-template name="component-did"/>
			</td>
		</tr>
		<xsl:if
			test="ead:abstract[string-length(text()|*)!=0] | ead:note[string-length(text()|*)!=0]">
			<xsl:for-each select="ead:abstract | ead:note">
				<tr>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td colspan="8" valign="top">
						<xsl:apply-templates select="."/>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!--Hides the container number for a c04.-->
	<xsl:template name="hidebox-c04-box-only">
		<tr>
			<td/>
			<td valign="top">
				<xsl:if test="ead:container[@type][2]">
					<xsl:value-of select="ead:container[@type][2]"/>
					<!--<xsl:apply-templates select="ead:container[@type][2]"/>-->
				</xsl:if>
			</td>
			<td/>
			<td/>
			<td/>
			<td colspan="9" valign="top">
				<xsl:call-template name="component-did"/>
			</td>
		</tr>
		<xsl:if
			test="ead:abstract[string-length(text()|*)!=0] | ead:note[string-length(text()|*)!=0]">
			<xsl:for-each select="ead:abstract | ead:note">
				<tr>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td colspan="8" valign="top">
						<xsl:apply-templates select="."/>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Shows the box number for a c05.-->
	<xsl:template name="showbox-c05-box-only">
		<tr>
			<xsl:for-each select="ead:container[@type][1]">
				<td>
					<strong>
						<span style="font-size: small">
							<xsl:value-of select="@type"/>
						</span>
					</strong>
				</td>
			</xsl:for-each>
			<xsl:for-each select="ead:container[@type][2]">
				<td>
					<strong>
						<span style="font-size: small">
							<xsl:value-of select="@type"/>
						</span>
					</strong>
				</td>
			</xsl:for-each>
		</tr>
		<tr>
			<td valign="top">
				<xsl:if test="ead:container[@type][1]">
					<xsl:value-of select="ead:container[@type][1]"/>
					<!--<xsl:apply-templates select="ead:container[@type][1]"/>-->
				</xsl:if>
			</td>
			<td valign="top">
				<xsl:if test="ead:container[@type][2]">
					<xsl:value-of select="ead:container[@type][2]"/>
					<!--<xsl:apply-templates select="ead:container[@type][2]"/>-->
				</xsl:if>
			</td>
			<td/>
			<td/>
			<td/>
			<td/>
			<td colspan="8" valign="top">
				<xsl:call-template name="component-did"/>
			</td>
		</tr>
		<xsl:if
			test="ead:abstract[string-length(text()|*)!=0] | ead:note[string-length(text()|*)!=0]">
			<xsl:for-each select="ead:abstract | ead:note">
				<tr>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td colspan="7" valign="top">
						<xsl:apply-templates select="."/>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!--Hides the container number for a c05.-->
	<xsl:template name="hidebox-c05-box-only">
		<tr>
			<td/>
			<td valign="top">
				<xsl:if test="ead:container[@type][2]">
					<xsl:value-of select="ead:container[@type][2]"/>
					<!--<xsl:apply-templates select="ead:container[@type][2]"/>-->
				</xsl:if>
			</td>
			<td/>
			<td/>
			<td/>
			<td/>
			<td colspan="8" valign="top">
				<xsl:call-template name="component-did"/>
			</td>
		</tr>
		<xsl:if
			test="ead:abstract[string-length(text()|*)!=0] | ead:note[string-length(text()|*)!=0]">
			<xsl:for-each select="ead:abstract | ead:note">
				<tr>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td colspan="7" valign="top">
						<xsl:apply-templates select="."/>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Shows the container number for a c06.-->
	<xsl:template name="showbox-c06-box-only">
		<tr>
			<xsl:for-each select="ead:container[@type][1]">
				<td>
					<strong>
						<span style="font-size: small">
							<xsl:value-of select="@type"/>
						</span>
					</strong>
				</td>
			</xsl:for-each>
			<xsl:for-each select="ead:container[@type][2]">
				<td>
					<strong>
						<span style="font-size: small">
							<xsl:value-of select="@type"/>
						</span>
					</strong>
				</td>
			</xsl:for-each>
		</tr>
		<tr>
			<td valign="top">
				<xsl:if test="ead:container[@type][1]">
					<xsl:value-of select="ead:container[@type][1]"/>
					<!--<xsl:apply-templates select="ead:container[@type][1]"/>-->
				</xsl:if>
			</td>
			<td valign="top">
				<xsl:if test="ead:container[@type][2]">
					<xsl:value-of select="ead:container[@type][2]"/>
					<!--<xsl:apply-templates select="ead:container[@type][2]"/>-->
				</xsl:if>
			</td>
			<td/>
			<td/>
			<td/>
			<td/>
			<td/>
			<td colspan="7" valign="top">
				<xsl:call-template name="component-did"/>
			</td>
		</tr>
		<xsl:if
			test="ead:abstract[string-length(text()|*)!=0] | ead:note[string-length(text()|*)!=0]">
			<xsl:for-each select="ead:abstract | ead:note">
				<tr>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td colspan="6" valign="top">
						<xsl:apply-templates select="."/>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!--Hides the container number for a c06.-->
	<xsl:template name="hidebox-c06-box-only">
		<tr>
			<td/>
			<td valign="top">
				<xsl:if test="ead:container[@type][2]">
					<xsl:value-of select="ead:container[@type][2]"/>
					<!--<xsl:apply-templates select="ead:container[@type][2]"/>-->
				</xsl:if>
			</td>
			<td/>
			<td/>
			<td/>
			<td/>
			<td/>
			<td colspan="7" valign="top">
				<xsl:call-template name="component-did"/>
			</td>
		</tr>
		<xsl:if
			test="ead:abstract[string-length(text()|*)!=0] | ead:note[string-length(text()|*)!=0]">
			<xsl:for-each select="ead:abstract | ead:note">
				<tr>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td colspan="6" valign="top">
						<xsl:apply-templates select="."/>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Shows the box number for a c07.-->
	<xsl:template name="showbox-c07-box-only">
		<tr>
			<xsl:for-each select="ead:container[@type][1]">
				<td>
					<strong>
						<span style="font-size: small">
							<xsl:value-of select="@type"/>
						</span>
					</strong>
				</td>
			</xsl:for-each>
			<xsl:for-each select="ead:container[@type][2]">
				<td>
					<strong>
						<span style="font-size: small">
							<xsl:value-of select="@type"/>
						</span>
					</strong>
				</td>
			</xsl:for-each>
		</tr>
		<tr>
			<td valign="top">
				<xsl:if test="ead:container[@type][1]">
					<xsl:value-of select="ead:container[@type][1]"/>
					<!--<xsl:apply-templates select="ead:container[@type][1]"/>-->
				</xsl:if>
			</td>
			<td valign="top">
				<xsl:if test="ead:container[@type][2]">
					<xsl:value-of select="ead:container[@type][2]"/>
					<!--<xsl:apply-templates select="ead:container[@type][2]"/>-->
				</xsl:if>
			</td>
			<td/>
			<td/>
			<td/>
			<td/>
			<td/>
			<td/>
			<td colspan="6" valign="top">
				<xsl:call-template name="component-did"/>
			</td>
		</tr>
		<xsl:if
			test="ead:abstract[string-length(text()|*)!=0] | ead:note[string-length(text()|*)!=0]">
			<xsl:for-each select="ead:abstract | ead:note">
				<tr>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td colspan="5" valign="top">
						<xsl:apply-templates select="."/>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!--Hides the container number for a c07.-->
	<xsl:template name="hidebox-c07-box-only">
		<tr>
			<td/>
			<td valign="top">
				<xsl:if test="ead:container[@type][2]">
					<xsl:value-of select="ead:container[@type][2]"/>
					<!--<xsl:apply-templates select="ead:container[@type][2]"/>-->
				</xsl:if>
			</td>
			<td/>
			<td/>
			<td/>
			<td/>
			<td/>
			<td/>
			<td colspan="6" valign="top">
				<xsl:call-template name="component-did"/>
			</td>
		</tr>
		<xsl:if
			test="ead:abstract[string-length(text()|*)!=0] | ead:note[string-length(text()|*)!=0]">
			<xsl:for-each select="ead:abstract | ead:note">
				<tr>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td colspan="5" valign="top">
						<xsl:apply-templates select="."/>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Shows the box number for a c08.-->
	<xsl:template name="showbox-c08-box-only">
		<tr>
			<xsl:for-each select="ead:container[@type][1]">
				<td>
					<strong>
						<span style="font-size: small">
							<xsl:value-of select="@type"/>
						</span>
					</strong>
				</td>
			</xsl:for-each>
			<xsl:for-each select="ead:container[@type][2]">
				<td>
					<strong>
						<span style="font-size: small">
							<xsl:value-of select="@type"/>
						</span>
					</strong>
				</td>
			</xsl:for-each>
		</tr>
		<tr>
			<td valign="top">
				<xsl:if test="ead:container[@type][1]">
					<xsl:value-of select="ead:container[@type][1]"/>
					<!--<xsl:apply-templates select="ead:container[@type][1]"/>-->
				</xsl:if>
			</td>
			<td valign="top">
				<xsl:if test="ead:container[@type][2]">
					<xsl:value-of select="ead:container[@type][2]"/>
					<!--<xsl:apply-templates select="ead:container[@type][2]"/>-->
				</xsl:if>
			</td>
			<td/>
			<td/>
			<td/>
			<td/>
			<td/>
			<td/>
			<td/>
			<td colspan="5" valign="top">
				<xsl:call-template name="component-did"/>
			</td>
		</tr>
		<xsl:if
			test="ead:abstract[string-length(text()|*)!=0] | ead:note[string-length(text()|*)!=0]">
			<xsl:for-each select="ead:abstract | ead:note">
				<tr>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td colspan="4" valign="top">
						<xsl:apply-templates select="."/>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!--Hides the container number for a c08.-->
	<xsl:template name="hidebox-c08-box-only">
		<tr>
			<td/>
			<td valign="top">
				<xsl:if test="ead:container[@type][2]">
					<xsl:value-of select="ead:container[@type][2]"/>
					<!--<xsl:apply-templates select="ead:container[@type][2]"/>-->
				</xsl:if>
			</td>
			<td/>
			<td/>
			<td/>
			<td/>
			<td/>
			<td/>
			<td/>
			<td colspan="5" valign="top">
				<xsl:call-template name="component-did"/>
			</td>
		</tr>
		<xsl:if
			test="ead:abstract[string-length(text()|*)!=0] | ead:note[string-length(text()|*)!=0]">
			<xsl:for-each select="ead:abstract | ead:note">
				<tr>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td/>
					<td colspan="4" valign="top">
						<xsl:apply-templates select="."/>
					</td>
				</tr>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
	<!-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -->
	<!--Displays unittitle and date information for a component level did.-->
	<xsl:template name="component-did">
		<xsl:if test="../@level = 'subseries'">
			<xsl:if test="../@id">
				<a>
					<xsl:attribute name="name">
						<xsl:value-of select="../@id"/>
					</xsl:attribute>
					<xsl:text>&#32;</xsl:text>
				</a>
			</xsl:if>
		</xsl:if>
		<xsl:for-each select="ead:unitid/@audience[not(self::internal)]">
			<xsl:if test="@label">
				<strong>
					<xsl:value-of select="@label"/>
				</strong>
				<xsl:text>  </xsl:text>
			</xsl:if>
			<xsl:apply-templates/>
		</xsl:for-each>
		<xsl:choose>
			<xsl:when test="unittitle/unitdate">
				<xsl:for-each select="ead:unittitle">
					<xsl:if test="@label">
						<strong>
							<xsl:value-of select="@label"/>
						</strong>
						<xsl:text>  </xsl:text>
					</xsl:if>
					<xsl:apply-templates select="text()|*[not(self::ead:unitdate)]"/>
					<xsl:text> </xsl:text>
					<xsl:apply-templates select="./ead:unitdate"/>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<xsl:for-each select="ead:unittitle">
					<xsl:if test="@label">
						<strong>
							<xsl:value-of select="@label"/>
						</strong>
						<xsl:text>  </xsl:text>
					</xsl:if>
					<xsl:apply-templates/>
				</xsl:for-each>
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="ead:unitdate"/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:for-each select="ead:dao">
			<br/>
			<xsl:call-template name="dao"/>
		</xsl:for-each>
		<xsl:for-each select="ead:physdesc | ead:materialspec | ead:origination | ead:physloc">
			<br/>
			<xsl:if test="@label">
				<strong>
					<xsl:value-of select="@label"/>
				</strong>
				<xsl:text>  </xsl:text>
			</xsl:if>
			<xsl:apply-templates/>
			<xsl:text> </xsl:text>
		</xsl:for-each>
		<xsl:if test="ead:physloc">
			<xsl:for-each select="ead:physloc">
				<xsl:if test="@label">
					<strong>
						<xsl:value-of select="@label"/>
					</strong>
					<xsl:text>  </xsl:text>
				</xsl:if>
				<xsl:apply-templates/>
			</xsl:for-each>
			<br/>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
