{-# LANGUAGE OverloadedStrings #-}
module Lib
    ( someFunc
    ) where

import Language.Wasm.Structure
import Language.Wasm ( encode, validate )
import qualified Data.ByteString as B

someFunc :: IO ()
someFunc = do
    putStrLn "someFunc"
    case validate jutska of
        Right _ -> putStrLn "valid"
        Left e -> putStrLn $ "invalid" ++ show e
    let kontsa = encode jutska
    B.writeFile "jutska.wasm" kontsa
    return ()

jutska :: Module
jutska = Module {
    types = [FuncType [I32, I32] [I32]],
    functions = [Function 0 [] [GetLocal 0, GetLocal 1, IBinOp BS32 IAdd]],
    tables = [],
    mems = [Memory (Limit 1 Nothing)],
    globals = [],
    elems = [],
    datas = [],
    imports = [],
    exports = [Export "myadd" (ExportFunc 0)],
    start = Nothing
}
