main :: IO()
main = do
    print $ votes ("Ritchie","C") [b1, b2, b3] == 3
    print $ votes ("RitchieL","C") [b1, b2, b3] == 2
    print $ election [b1, b2, b3] cl == [("Kernighan",2),("Ritchie",3),("Stroustrup",1),("Steele",1),("Sussman",1),("Church",2),("Curry",1)]
    print $ (sortResults $ election [b1, b2, b3] cl) == [("Ritchie",3),("Kernighan",2),("Church",2),("Stroustrup",1),("Steele",1),("Sussman",1),("Curry",1)]
    print $ selectCouncil 2 [b1, b2, b3] cl == ["Ritchie","Kernighan"]

cl = [("Kernighan","C"),("Ritchie","C"),("Stroustrup","C++"),("Steele","Scheme"),("Sussman","Scheme"),("Church","Lambda"),("Curry","Lambda")]
b1 (name, specialty) = specialty == "Lambda" || last name == 'e'
b2 (name, specialty) = name == "Church" || head specialty == 'C'
b3 (name, specialty) = length name > 6 && specialty /= "C++"

votes cand ballots = length $ filter (\ ballot -> ballot cand) ballots

election ballots cl = map (\ candidate@(name, spec) -> (name, votes candidate ballots)) cl

sortResults [] = []
sortResults results@((_, lhsVotes):xs) = more ++ equal ++ less
 where
    more  = sortResults $ filter (\ (_, rhsVotes) -> rhsVotes > lhsVotes) xs
    equal = filter (\ (_, rhsVotes) -> rhsVotes == lhsVotes) results
    less  = sortResults $ filter (\ (_, rhsVotes) -> rhsVotes < lhsVotes) xs

selectCouncil max ballots cl =
    take max (map fst (filter (\ (_, votes) -> votes * 2 > length ballots) results))
 where results = sortResults (election ballots cl)
