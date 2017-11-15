<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="#all">

    <xsl:output encoding="UTF-8" method="text"></xsl:output>

<!-- for replacements of fancy quotes in source -->    
    <xsl:param name="doubleQuotePat">’</xsl:param>
    <xsl:param name="doubleQuoteRep">&apos;</xsl:param>
    
    <xsl:param name="singleQuotePat">‘</xsl:param>
    <xsl:param name="singleQuoteRep">&apos;</xsl:param>


    <xsl:template match="/">
        <xsl:apply-templates select="//tei:body/tei:div"/>
    </xsl:template>



    <!-- <xsl:strip-space elements="*"/>-->


    <xsl:template match="tei:body/tei:div">

        <xsl:variable name="sect_id" select="@xml:id"/>
        <xsl:result-document method="text" encoding="utf-8"
             href="_texts/{$sect_id}-annotated.md" omit-xml-declaration="yes">

            <xsl:text>---&#x0A;layout: narrative&#x0A;</xsl:text>
            <xsl:text>title: </xsl:text>
            <xsl:value-of select="normalize-space(tei:head)"/>
            <xsl:text>&#x0A;</xsl:text>
            <xsl:text>author:</xsl:text>
            <xsl:text>&#x0A;</xsl:text>
            <xsl:text>mode: annotated</xsl:text>
            <xsl:text>&#x0A;</xsl:text>
            <xsl:value-of select="tei:teiHeader/fileDesc/titleStmt/author"/>
            <xsl:text>editor: Minimal Edition Class&#x0A;</xsl:text>
            <xsl:text>rights: Public Domain&#x0A;</xsl:text>
            <xsl:text>---&#x0A;&#x0A;</xsl:text>

            <xsl:apply-templates/>

            <!-- inline nav -->
            <xsl:text>&#x0A;&#x0A;</xsl:text>
            <xsl:text>&lt;div class="inline-nav" markdown="1"&gt;&#x0A;</xsl:text>

	    <!-- open the div -->

            <xsl:if test="preceding-sibling::tei:div[1]">

	   <!-- preceding chapter -->
              <xsl:text>[</xsl:text>
              <xsl:value-of select="preceding-sibling::tei:div[1]/tei:head"/>
              <xsl:text>]</xsl:text>
              <xsl:text>({{site.baseurl}}/texts/</xsl:text>
              <xsl:value-of select="preceding-sibling::tei:div[1]/@xml:id"/>
              <xsl:text>-annotated.html){:.previous}&#x0A;</xsl:text>
            </xsl:if>

            <xsl:if test="following-sibling::tei:div[1]">

	   <!-- following chapter -->
              <xsl:text>[</xsl:text>
              <xsl:value-of select="following-sibling::tei:div[1]/tei:head"/>
              <xsl:text>]</xsl:text>
              <xsl:text>({{site.baseurl}}/texts/</xsl:text>
              <xsl:value-of select="following-sibling::tei:div[1]/@xml:id"/>
              <xsl:text>-annotated.html){:.following}&#x0A;</xsl:text>
            </xsl:if>

            <xsl:text>&#x0A;&lt;/div&gt;</xsl:text>

	   <!-- close the div -->

        </xsl:result-document>
    </xsl:template>

    <xsl:template match="tei:body/tei:div/tei:head">
    </xsl:template>


    <xsl:template match="tei:head">
        <xsl:text>&#xa;</xsl:text>
        <xsl:text>## </xsl:text>
        <xsl:apply-templates></xsl:apply-templates>
        <xsl:text>&#xa;&#xa;</xsl:text>
    </xsl:template>

    <xsl:template match="tei:p">
        <xsl:text>&#x0A;</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>&#x0A;</xsl:text>
    </xsl:template>

<!-- data balloons for links to notes -->    
    <xsl:template match="tei:ptr">
      <xsl:text> &lt;button markdown="0" data-balloon-pos="up" data-balloon-length="large" data-balloon="</xsl:text>
      <xsl:value-of  disable-output-escaping="yes" select="following::tei:note[@xml:id=translate(current()/@target, '#', '')]/replace(replace(replace(replace(., '-', '—'), '\s+', ' '), $doubleQuotePat, $doubleQuoteRep), $singleQuotePat, $singleQuoteRep)" />

<!--      
     <xsl:message select="translate(current()/@target, '#', '')"></xsl:message>
-->     
      <xsl:text>"&gt;</xsl:text>
      <xsl:apply-templates />
        <xsl:text>&lt;</xsl:text>span class="note_label"<xsl:text>&gt;</xsl:text><xsl:value-of select="@type"/><xsl:text>&lt;/span&gt;&#160;</xsl:text>
      <xsl:text>&lt;/button&gt; </xsl:text>
    </xsl:template>

<!-- sanitize text nodes for kramdown -->    
    <xsl:template match="text()">
        <xsl:value-of select="replace(replace(., '-', '—'), '\s+', ' ')"></xsl:value-of>
    </xsl:template>

<!-- link to page image -->    
    <xsl:template match="tei:pb">
        <xsl:text>&lt;a href=""</xsl:text>
        <xsl:value-of select="@facs"></xsl:value-of>
        <xsl:text>"&gt;</xsl:text>
        <xsl:text>&lt;img src="/assets/photo-icon.png" alt="Enlace al facsímil" style="display:inline-block; margin-bottom:-3px;"&gt;</xsl:text>
        <xsl:text>&lt;/a&gt;</xsl:text>
    </xsl:template>

    <xsl:template match="tei:hi[@rend = 'italic']">
        <span class="italic">
        <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:hi[@rend = 'bold']">
        <span class="bold">
        <xsl:apply-templates/>
        </span>
    </xsl:template>

    <!-- data ballonons for tei:app -->
    
    <xsl:template match="tei:app">
        <xsl:text> &lt;button markdown="0" data-balloon-pos="up" data-balloon-length="large" data-balloon="in MS: </xsl:text>
        <xsl:value-of  disable-output-escaping="yes" select="child::tei:rdg[1]/replace(replace(replace(replace(., '-', '—'), '\s+', ' '), $doubleQuotePat, $doubleQuoteRep), $singleQuotePat, $singleQuoteRep)" />
        <xsl:message select="translate(current()/@target, '#', '')"></xsl:message>
        <xsl:text>"&gt;</xsl:text>
        <xsl:text>&lt;</xsl:text>span class="note_label"<xsl:text>&gt;</xsl:text><xsl:value-of select="@type"/><xsl:text>&lt;/span&gt;&#160;</xsl:text>
        <xsl:text>&lt;/button&gt; </xsl:text>
    </xsl:template>

    <xsl:template match="tei:note" >
        <xsl:call-template name="newline"/>
        <xsl:text>&lt;</xsl:text>span class="note_label"<xsl:text>&gt;</xsl:text><xsl:value-of select="@xml:id"/><xsl:text>&lt;/span&gt;&#160;</xsl:text><xsl:apply-templates/>
        <xsl:call-template name="newline"/>
    </xsl:template>

    <xsl:template name="newline">
        <xsl:text>&#10;</xsl:text>
    </xsl:template>

</xsl:stylesheet>
