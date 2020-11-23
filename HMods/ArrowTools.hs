module ArrowTools
  ( module Control.Arrow
  , module Control.Category
  , module Prelude
  , K(..)
  , k
  , runK
  , split
  , unsplit
  , liftAr2
  )
where

import           Control.Arrow
import           Control.Category
import           Prelude                 hiding ( id
                                                , (.)
                                                )

type K = Kleisli

k = Kleisli

runK = runKleisli

split :: Arrow a => a b (b, b)
split = arr (\x -> (x, x))

unsplit :: Arrow a => (b -> c -> d) -> a (b, c) d
unsplit = arr . uncurry

-- (***) f g = first f >>> second g

-- (&&&) f g = split >>> first f >>> second g

liftAr2 :: Arrow a => (b -> c -> d) -> a e b -> a e c -> a e d
liftAr2 op f g = split >>> f *** g >>> unsplit op

liftArN :: (Foldable f, ArrowZero a) => (c -> c -> c) -> f (a b c) -> a b c
liftArN op = foldl1 (liftAr2 op)

pipe :: (Foldable f, ArrowZero a) => f (a b b) -> a b b
pipe = foldl1 (>>>)
