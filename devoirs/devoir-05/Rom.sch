<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <sch:ns prefix="tei" uri="http://www.tei-c.org/ns/1.0" /> 
    <sch:pattern>
        <sch:rule context="tei:TEI">
            <sch:assert test="tei:teiHeader and tei:text"> Le document doit contenir un teiHeader et un text.</sch:assert>
        </sch:rule>
        <sch:rule abstract="true" id="contient-p">
            <sch:assert test="self::*/tei:p ">L'élément <sch:name/> contient toujours un enfant paragraphe..</sch:assert>
        </sch:rule>
        <!--<sch:rule context="tei:sp">
            <sch:extends rule="contient-p"/>
        </sch:rule>-->
        <sch:rule context="tei:projectDesc">
            <sch:extends rule="contient-p"/>
        </sch:rule>
     </sch:pattern>
    <sch:pattern abstract="true" id="div">
        <sch:rule context="tei:$element[@type='act']">
            <sch:assert test="count(tei:head) =1 and count(tei:div[@type='scene']) > 1">Chaque div qui sont des actes doivent contenir un élément head et plusieurs scènes.</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern is-a="div" id="id">
        <sch:param name="element" value="div"/>
    </sch:pattern>
    
</sch:schema>