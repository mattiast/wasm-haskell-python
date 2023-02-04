from wasmer import engine, wat2wasm, Store, Module, Instance
from wasmer_compiler_cranelift import Compiler

store = Store(engine.Universal(Compiler))
module = Module(store, open("jutska.wasm", "rb").read())
instance = Instance(module)
print(instance.exports.myadd(3, 4))
