function sayMyName(name) {
  console.log("Antes de executar a callback")
  name()
  console.log("Depois de executar a callback")
}

sayMyName(() => {
  console.log("Estou em uma callback")
})

// Forma para melhor compreensão

function sayMyName() {
  console.log("Antes de executar a callback")

  function name() {
    console.log("Estou em uma callback")
  }

  name()

  console.log("Depois de executar a callback")
}

sayMyName()
