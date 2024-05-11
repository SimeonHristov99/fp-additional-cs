main :: IO()
main = do
    -- print "Hello, world"
    -- print (5 + 6)
    -- print $ 5 + 6
    print $ minIf 15 (-60) == -60
    print $ minIf 15 60 == 15
    print $ minIf 60 15 == 15
    print $ minGuard 15 60 == 15
    print $ minGuard 60 15 == 15
    print $ minBuiltIn 60 15 == 15

    print $ lastDigit 154 == 4

    print $ quotientWhole 64 2 == 32
    print $ divWhole 154 17 == 9.058823529411764

    print $ removeLastDigit 154 == 15    

    print $ divReal 154.451 10.01 == 15.42967032967033
    print $ quotientReal 154.21 17.17 == 8

    print $ avgWhole 5 1542 == 773.5

    print $ roundTwoDig 3.1413465345321 == 3.14
    print $ roundTwoDigButWithMagic 3.1413465345321 == 3.14

    print $ inside 1 5 4 == True -- start = 1, finish = 5, x = 4
    print $ inside 5 1 4 == True
    print $ inside 10 50 20 == True
    print $ inside 10 50 1 == False
    -- print $ Circle 5 == Circle 10
    -- print $ getFirstArg (Circle 5)

inside :: Int -> Int -> Int -> Bool
inside start end x = elem x [min start end .. max start end]
-- inside start end x = min start end <= x && x <= max start end

roundTwoDigButWithMagic :: Double -> Double
roundTwoDigButWithMagic = (/100) . fromIntegral . round . (*100)
-- roundTwoDigButWithMagic n = (/100) $ fromIntegral $ round $ 100 * n
-- roundTwoDigButWithMagic n = (/100) $ fromIntegral $ round $ n * 100

roundTwoDig :: Double -> Double
roundTwoDig n = (/100) $ fromIntegral $ round $ n * 100

avgWhole :: Int -> Int -> Double
avgWhole x y = (fromIntegral $ x + y) / 2
-- avgWhole x y = fromIntegral (x + y) / 2

quotientReal :: Double -> Double -> Int
quotientReal n d = floor $ n / d

divReal :: Double -> Double -> Double
divReal n d = n / d

removeLastDigit :: Int -> Int
removeLastDigit n = div n 10

divWhole :: Int -> Int -> Double
divWhole n d = fromIntegral n / fromIntegral d

quotientWhole :: Int -> Int -> Int
quotientWhole n d = div n d

lastDigit :: Int -> Int
lastDigit = (`mod` 10)
-- lastDigit n = mod n 10

minBuiltIn :: Int -> Int -> Int
minBuiltIn = min
-- minBuiltIn x y = min x y

minGuard :: Int -> Int -> Int
minGuard x y
 | x < y = x
 | otherwise = y

minIf :: Int -> Int -> Int
minIf x y = if x < y then x else y

getFirstArg :: Shape a -> a
getFirstArg (Circle radius) = radius

data Shape a = Circle a | Triangle a a a
 deriving (Show, Eq) 
