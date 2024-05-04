main :: IO()
main = do
    print $ votes ("Ritchie","C") [b1, b2, b3]
    print $ election [b1, b2, b3] cl
    print $ sortResults $ election [b1, b2, b3] cl
    print $ selectCouncil 2 [b1, b2, b3] cl == ["Ritchie","Kernighan"]

cl = [("Kernighan","C"),("Ritchie","C"),("Stroustrup","C++"),("Steele","Scheme"),("Sussman","Scheme"),("Church","Lambda"),("Curry","Lambda")]
b1 (name, specialty) = specialty == "Lambda" || last name == 'e'
b2 (name, specialty) = name == "Church" || head specialty == 'C'
b3 (name, specialty) = length name > 6 && specialty /= "C++"

votes cand ballots = ???
election ballots cl = ??? (\ ??? -> (???, ???)) cl
sortResults [] = []
sortResults ??? = more ++ equal ++ less
 where
    more  = ???
    equal = ???
    less  = ???
selectCouncil max ballots cl =
    ??? (map ??? (filter ??? results))
 where results = sortResults (election ballots cl)
