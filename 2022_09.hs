main :: IO()
main = do
    print $ leaf (T 1 []) == True
    print $ leaf tree == False

    print $ twig (T 1 [T 2 [], T 3 []]) == True

    print $ stick (T 1 [T 2 [T 3 [T 4 []]]]) == True
    
    print $ trim tree == T 1 [T 4 [], T 7 [T 9 []]]
    
    print $ prune tree == T 1 [
        T 2 [T 3 []],
        T 4 [T 5 []],
        T 7 [T 8 [], T 9 [T 10 []]]]

leaf (T _ children) = null children -- null . subtrees
twig (T _ children) = all leaf children
stick (T _ children) = length children < 2
    && all stick children

trim (T x ts) = T x (map trim
    $ filter (not . twig) ts)
                    
prune t@(T x []) = t
prune t@(T x ts) = T x (if stick t
                        then [(T child []) | (T child _) <- ts]
                        else map prune ts)

isBST tree = let nodes = traverseDFS tree in nodes == sort nodes
isBSTWhere tree = nodes == sort nodes
 where nodes = traverseDFS tree

data Tree = T { root :: Int, subtrees :: [Tree] }
 deriving (Show, Eq)

tree = T 1 [
    T 2 [T 3 []],
    T 4 [T 5 [T 6 []]],
    T 7 [T 8 [], T 9 [T 10 [T 11 []]]]]
