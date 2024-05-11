main :: IO()
main = do
    print $ sumProd [[1, 2, 3], [-3, 2, 1], [1], [-1]] == 7

sumProd :: [[Int]] -> Int
sumProd ll = sum $ map (\ xs -> if any (<0) xs then 0 else product xs) ll
