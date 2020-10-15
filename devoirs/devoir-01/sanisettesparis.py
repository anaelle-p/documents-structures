# -*- coding : utf-8 -*-
#Anaëlle Pierredon

from lxml import etree

entree = "sanisettesparis.csv"
sortie = "sanisettesparis.xml"

with open(entree, 'r') as f:
    with open(sortie, 'wb') as g:
        g.write(bytes("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n", "utf-8"))
        g.write(bytes("<!DOCTYPE toilettes SYSTEM \"wc.dtd\">\n", "utf-8"))
        root = etree.Element("toilettes")
        for line in f:
            line = line.split(';')
            if line[0] == "TYPE":
                continue
            if line[1]:
                toilette = etree.SubElement(root, "toilette", type = line[0], statut = line[1])
            else:
                toilette = etree.SubElement(root, "toilette", type = line[0])
            
            adresse = etree.SubElement(toilette, "adresse")
            libelle = etree.SubElement(adresse, "libelle")
            libelle.text = line[2]
            arrondissement = etree.SubElement(adresse, "arrondissement")
            arrondissement.text = line[3]
            
            horaire = etree.SubElement(toilette, "horaire")
            horaire.text = line[4]
            
            services = etree.SubElement(toilette, "services")
            accespmr = etree.SubElement(services, "acces-pmr")
            accespmr.text = line[5]
            relaisbebe = etree.SubElement(services, "relais-bebe")
            relaisbebe.text = line[6]
            
            
            equipement = etree.SubElement(toilette, "equipement")
            equipement.text = line[7]
            
        g.write(etree.tostring(root, pretty_print = True))
            
            
        
