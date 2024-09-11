<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes" encoding="utf-8"/>

    <xsl:template match="/">
		<h3>Autose üldkogus xml jadas</h3>
		<br>
			kasutame count() funktsioni
		</br>
		<br></br>
		<xsl:value-of select="count(autod/auto)"/>
		<br></br>
		--------------------------------------------
		<br></br>
		<h3>Autose üldkogus xml jadas, mis on vaasta 2000</h3>
		<br>
			kasutame count() funktsioni
		</br>
		<br></br>
		<xsl:value-of select="count(autod/auto[vaasta = 2005])"/>
		<h3>Auto regnumbrid mis algavad 2</h3>
		<br>Kasutame starts -with funktsioni</br>
		<ul>
			<xsl:for-each select="autod/auto[starts-with(registrinumber, '2')]">

				<xsl:sort select="vaasta" order="descending"/>
			<li>
				<xsl:value-of select="concat(mark,',',registrinumber)"/>
			</li>
			
		</xsl:for-each>
		</ul>
		<hr></hr>
		<h3>1.Trüki välja eralda komaga auto registrinumrite osa</h3>
		<ul>
			<xsl:for-each select="autod/auto">
				<li>
					<xsl:value-of select="concat(substring(registrinumber,1,3),'=',concat(substring(registrinumber,1,1), ',', substring(registrinumber,2,1), ',', substring(registrinumber,3,1)))"/>

				</li>
			</xsl:for-each>
			
		</ul>
		<hr></hr>
		<h3>2.Trüki välja eralda komaga omaniku nime viimane täht</h3>
		<ul>
			<xsl:for-each select="autod/auto">
				<li>
					<xsl:value-of select="concat(omanik,' Viimane täht on ',substring(omanik,string-length(omanik),1))"/>

				</li>
			</xsl:for-each>

		</ul>
		<hr></hr>
		<h3>3.Auto omaniku, mis sialdavad A täht:</h3>
		<ul>
			<xsl:for-each select="autod/auto[contains(omanik, 'a')]">
				<li>
					<xsl:value-of select="omanik"/>

				</li>
			</xsl:for-each>

		</ul>
		<hr></hr>
		<h3>4.Leia mitme auto registrimärgi munbritest viimane on 2</h3>
		<ul>
			<xsl:for-each select="autod/auto[substring(registrinumber, 3,1) = '2']">

				<xsl:sort select="vaasta" order="descending"/>
				<li>
					<xsl:value-of select="registrinumber"/>
				</li>

			</xsl:for-each>
		</ul>
		<hr></hr>
		<h3>5.Teata iga registrinumbri puhul, millises kuus auto ülevaatus</h3>
		<hr></hr>
		<h2>Autod tabelina</h2>
		<table border ="1px" bordercolor="black">
			<tr>
				<th>Registri number</th>
				<th>Mark</th>
				<th>Väljastamise aasta</th>
				<th>Omanik</th>
				<th>Ülevaatusepuu</th>
			</tr>
			<xsl:for-each select="autod/auto">
				<tr>
					<td>
						<xsl:value-of select="registrinumber"/>
					</td>
					<td>
						<xsl:value-of select="mark"/>
					</td>
					<td>
						<xsl:value-of select="vaasta"/>
					</td>
					<xsl:if test="contains(omanik, 'a')">
					<td bgcolor="lightyellow">
						<xsl:value-of select="omanik"/>
					</td>
					</xsl:if>
					<xsl:if test="not(contains(omanik, 'a'))">
						<td>
							<xsl:value-of select="omanik"/>
						</td>
					</xsl:if>
				
						<xsl:if test="number(substring(registrinumber,3,1)+2)>=9">
							<td bgcolor="red">
								<xsl:value-of select="substring(registrinumber,3,1)+2"/>
							</td>
						</xsl:if>
					<xsl:if test="number(substring(registrinumber,3,1)+2)&lt;9">
						<td bgcolor="green">
							<xsl:value-of select="substring(registrinumber,3,1)+2"/>
						</td>
					</xsl:if>


					</tr>
				
			</xsl:for-each>
		</table>
		<h2>Marin Nõmmiste ülesanne </h2>
		1. Leia kõigi autode numbrimärkide keskmine.

		2. Trükkige välja kõik registreerimisnumbrid, mis lõpevad tähega L
		<br></br>
		<table border="1px" bordercolor="black">
			<tr>
				<th>Registri number</th>
				<th>Mark</th>
				<th>Väljastamise aasta</th>
				<th>Omanik</th>
				<th>Numbri keskmine</th>
			</tr>


			<xsl:for-each select="autod/auto[substring(registrinumber, 7, 1) = 'L']">
				<tr>
					<td>
						<xsl:value-of select="registrinumber"/>
					</td>
					<td>
						<xsl:value-of select="mark"/>
					</td>
					<td>
						<xsl:value-of select="vaasta"/>
					</td>
					<td>
						<xsl:value-of select="omanik"/>
					</td>
					<td>
						<xsl:variable name="number1" select="number(substring(registrinumber, 1, 1))" />
						<xsl:variable name="number2" select="number(substring(registrinumber, 2, 1))" />
						<xsl:variable name="number3" select="number(substring(registrinumber, 3, 1))" />
						<xsl:variable name="sum" select="$number1 + $number2 + $number3" />
						<xsl:variable name="average" select="$sum div 3" />
						<xsl:value-of select="format-number($average, '0.00')" />

					</td>
				</tr>
			</xsl:for-each>
		</table>
    </xsl:template>
</xsl:stylesheet>
