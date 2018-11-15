def limpiar_pantalla
  system('clear')
end
def insertar(pila , valor)
  valor.each do |n|
    elemento = {
        valor: n,
        siguiente: nil
    }
    if pila[:esta_vacia]
        pila[:tope] = elemento
        pila[:esta_vacia] = false
    else
        #paso 0
        tope = pila[:tope]
        elemento[:siguiente] = tope
        #paso 1
        pila[:tope] = elemento
    end
  end
  end


def solucion(pila)
  vec = []
  q = 0
  c = 0

  while (@valor.size() > 0 )
    q += 1
    vec [c]= @valor.pop()
    q += 1
    c = c + 1
    q += 1
  end
  band = false
  q += 1
  while !band
    q += 1
    band =true
    q += 1
    for i in 0..(vec.length)-2
      q += 1
      if vec[i] < vec[i+1]
        q += 1
        aux = vec[i+1]
        q += 1
        vec[i+1] = vec[i]
        q += 1
        vec[i] = aux
        q += 1
        band = false
        q += 1
      end
    end
  end
  for i in 0..4
    q += 1
    @valor.push vec[i]
    q += 1
  end
  puts 'PILA ORDENADA '
  puts @valor
  puts 'PASOS'
  puts q
end



#pila =[]

pila = {
  tope: nil,
  max: -1,
  esta_vacia: true,
  esta_llena: false
}
pila1 ={
  tope1: nil,
  max1: -1,
  esta_vacia1: true,
  esta_llena1: false

}
#pila =[]
#pila.push dato
#pila.push 23
#pila.push 3



begin

puts 'TERCER PROYECTO '
puts '1.- INGRESO DE NUMEROS '
puts '2.- EJECUTAR ORDENAMIENTO'
puts '3.- PASO A PASO'
puts '4.- salir '
dato = gets.chomp.to_i
if dato == 1
  puts 'ingrese la cadena de numeros que decea ordenar '
  puts 'separe con  espacios cada numero '
  @valor = gets.split(' ')
 # insertar(pila)
  solucion(pila)
elsif dato == 2
  solucion(pila)
elsif dato == 3
  puts 'EN QUE FORMA DECEA ORDENARLOS'
  puts '1.- PILA'
  puts '2.- COLA'
  puts '3.- LISTA '
  forma = gets.chomp.to_i
  if forma == 1
  elsif forma == 2
  elsif forma == 3
  else
    puts 'NUMERO INCORRECTO'
  end
end
end while dato!= 4
  
  
