declare function local:normalise-texte($texte as xs:string) as xs:string* {
let $ponctuations := "?!;.,'"
return translate($texte, $ponctuations, "") => lower-case() => tokenize(' ')
};

declare function local:noeud($texte as xs:string*) as node() {
let $noeud :=  for $mot in $texte return <mot frequence = "{local:frequence($mot, $texte)}">{$mot}</mot>
return
<dictionnaire>
    {$noeud}
</dictionnaire>
};

declare function local:frequence($mot as xs:string, $texte as xs:string*) as xs:integer {

let $freq := count(for $el in $texte return if($el = $mot) then $el else())
return $freq
};

local:normalise-texte('Le petit chat dort. Il est tranquillement installé sur le canapé dans le petit salon.') => local:noeud()






