<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                >

  <xsl:output omit-xml-declaration ="yes"/>
  
  <xsl:template match="/">
    <xsl:apply-templates select ="//OperationResponse"/>
  </xsl:template>
  
 <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>  

  <xsl:template match="OperationResponse" >
    <IntegrationResponse>
      <MessageDate>2017-07-02T10:30:00</MessageDate>
      <RequestType>GetEnquiryLookupsResponse</RequestType>
      <ServiceType>Highways</ServiceType>
      <SourceReference>27710258-6904-40AE-BED9-B92EB97A26B3</SourceReference>
      <SourceSystem>CRM</SourceSystem>
      <MessageData>
        <xsl:copy-of select ="." />
      </MessageData>
    </IntegrationResponse>
    

    <!-- TODO 
    <xsl:choose>
        <xsl:when test="ServiceType/text() == 'Highways'">
          <xsl:apply-templates select ="current()" mode ="Highways" /> 
        </xsl:when>
      <xsl:otherwise>
      </xsl:otherwise>

    </xsl:choose>
    !-->

  </xsl:template>

</xsl:stylesheet>
