main :: IO()
main = do
    print $ calc lib (head exprs) 3 == 8
    print $ score (-10) 10 lib [(\x -> x^2-1), (\x -> x*3+2), (\x -> x^3+2*x^2), (\x -> x^3+1)] exprs == 0.5

data Expr = N Integer | X | F Char Expr Expr

exprs = [F '-' (F '*' X X) (N 1), F '+' (F '*' X (N 2)) (N 3), F '*' (F '*' X X) (F '+' X (N 2)), F '+' (F '^' X (N 3)) (N 1)]
lib = [('+',(+)),('-',(-)),('*',(*))]

correct lib (F f l r) = ??? && ??? && ???
correct lib _ = ???
calc lib (N n) ???
calc lib X ???
calc lib (F c l r) ???
    ???
check a b lib f expr = ??? (\x -> ??? && ???) [a..b]
score a b lib fs exprs =  fromIntegral (length (filter ???))
                        / fromIntegral (length ???)
