--==============================================================================
--------------------------------------------------------------------------------
-- "Core Verbs" by Tristano Ajmone
--------------------------------------------------------------------------------
--==============================================================================

-- A set of minimum required verbs to test objects manipulation, looking, ecc.


--==============================================================================
-- Looking, Inventory
--==============================================================================

Synonyms
  l = 'look'.
  i = inventory.

Verb 'look'
  Does look.
End verb.

Verb inventory
  Does list hero.
End verb.

-- =============================================================================
-- Taking, Dropping and Putting
-- =============================================================================

Syntax take = take (obj)*
  Where obj IsA object
    else "You can only handle objects."

Syntax drop = drop (obj)*
  Where obj IsA object
    else "You can only handle objects."

Syntax put = put (obj1)* 'in' (obj2)
  Where obj1 IsA object
    else "You can only handle objects."
  And obj2 IsA object
    else "You can only handle objects."
  And obj2 IsA container
    else "You can't put anything in $+2."

Add to every object
  Verb take
    Does
      "You pick up $+1."
      Locate obj in hero.
  End verb.

  Verb drop
    Check obj in hero
      else "You don't have $+1."
    Does
      "You drop $+1."
      Locate obj at hero.
  End verb.

  Verb put
    When obj1
      Check obj1 <> obj2
        else "You can't put something into itself!"
      -- Check obj1 in hero
      --   else "You don't have $+1."
      Does
        If obj1 not in hero
          then "(first taking $+1)$n"
          Locate obj1 in hero.
        End if.
        "You put $+1 into $+2."
        Locate obj1 in obj2.
  End verb.
End add to object.
