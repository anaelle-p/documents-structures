<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <sch:pattern>
        <sch:rule context="fermeture">
            <sch:assert test="not(self::*/text())">L'élément <sch:name/> ne doit pas contenir de texte.</sch:assert>
        </sch:rule>
        <sch:rule context="ouverture">
            <sch:assert test="@debut != '' and @fin != ''">L'élément <sch:name/> doit avoir un début et une fin.</sch:assert>
        </sch:rule>
        <sch:rule context="ouverture">
            <sch:report test="@saufjour=''" role="warn">Ils devraient prendre des vacances...</sch:report>
        </sch:rule>
        <sch:rule context="ville/text()">
            <sch:report test="text() = upper-case(text())" role="warn">Les noms de villes devraient être tous en majuscule pour la consistance.</sch:report>
        </sch:rule>
    </sch:pattern>
</sch:schema>