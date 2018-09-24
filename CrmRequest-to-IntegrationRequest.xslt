<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" >

  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="IntegrationRequest" >

    <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
      <soap:Body>
        <ProcessOperationsRequest xmlns="http://www.confirm.co.uk/schema/am/connector/webservice" >
          <Request xmlns="">
            <Authentication>
              <Username>CSC</Username>
              <Password>3nqu1re</Password>
              <DatabaseId>Shropshire Council - Development</DatabaseId>
            </Authentication>
            <Operation>
              <RequestId>1</RequestId>
              <GetEnquiryLookups></GetEnquiryLookups>
            </Operation>
          </Request>
        </ProcessOperationsRequest>
      </soap:Body>
    </soap:Envelope>    
    
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
