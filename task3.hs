import Data.List

main :: IO()
main = do
    print $ hardestSubject [("John", "Maths", 5), ("Kennedy", "English", 2), ("Joe", "Programming", 4), ("Claudia", "Programming", 6), ("Sam", "Maths", 4), ("Jenn", "English", 2)] == "English"
    print $ hardestSubject [("John", "Maths", 5), ("Kennedy", "English", 5), ("Joe", "Programming", 4), ("Claudia", "Programming", 6), ("Sam", "Maths", 4), ("Jenn", "English", 5)] == "Maths"

type Student = String
type Subject = String
type Note = Double
type Record = (Student, Subject, Note)

average xs = sum xs / (fromIntegral $ length xs)

hardestSubject :: [Record] -> Subject
hardestSubject rs = foldr1 (\ s1 s2 -> if getAvgGr s1 < getAvgGr s2 then s1 else s2) subjects
 where
    subjects = nub $ map (\ (_, subject, _) -> subject) rs
    getAvgGr subject = average [grade | (_, cS, grade) <- rs, cS == subject]
