// Função construtora
function Person(name) {
  this.name = name
  this.walk = function () {
    return this.name + " está andando"
  }
}

const lucas = new Person("Lucas")
const joao = new Person("João")
console.log(lucas.walk())
console.log(joao.walk())
