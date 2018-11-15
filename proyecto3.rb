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


#puts 'ingrese la cadena de numeros que decea ordenar '
#puts 'separe con  espacios cada numero '
#dato = gets.split(' ')
#dato.each do |elemento|

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
  
  
def lista ()
 # FUNCION PARA LIMPIAR PANTALLA
def limpiar()
 system ('clear')
end 
# FUNCION PARA CONOCER SI LA COLA ESTA VACIA
def cola_vacia(cola)
 cola[:tope] == nil && cola[:final] == nil
end 

# METODO PARA ORDENAR
def ordenar(cola)
 n= cola[:size]
 for i in 0..n-1
  #nos situamos en la posicion inicialde la cola
  actual= cola[:tope]
  for j in 0..n-i-1
   # nos movemos al elemento siguiente
   ele_siguiente = actual[:siguiente]
   if actual[:valor]>ele_siguiente[:valor]
    temp = actual[:valor]
    actual[:valor] = ele_siguiente[:valor]
    ele_siguiente[:valor] = temp
   end 
   actual = ele_siguiente
   puts ele_siguiente
  end 
 end 
end
# DICCIONARIO 
cola = {
 tope: nil,
 final: nil,
 max: -1,
 cola_vacia: true,
 cola_llena: false,
 siguiente: nil,
 size: 0
}
# INSERTAR LOS NUMEROS Y MOSTRAR EN ORDEN ASCENDENTE
def insertar(cola)
 if cola[:max]== -1
  puts "inserte un numero"
  numero= gets.chomp.to_i
  if cola[:cola_vacia]
   elemento= {
    valor:numero,
    posicion: 0,
    siguiente: nil
   }
   cola[:tope]= elemento
   cola[:cola_vacia] = false
   cola[:final]= elemento
   
   
   else 
   elemento={
    valor: numero,
    siguiente: nil,
    posicion: cola[:size]
   
   }
   final = cola[:final]
   final[:siguiente] = elemento
   cola[:final] = elemento 
   
  end 
  cola[:size]+=1
  else
  puts "COLA ESTA LLENA"
 end 
end 

# ELEGIR SI DESEA DE FORMA ASCENDENTE O DESENDENTE
def orden(cola)
 puts " seleccinar la opcion deseada"
 puts " 1. Orden ascendente"
 puts " 2. Orden descendente"
 opcion = gets.chomp
 if opcion == 1
  puts ordenar(cola)

  elsif opcion == 2
  puts ordenar(cola).reverse
 end 
end 


# ELIMINAR ELEMENTOS DE LA COLA
def eliminar(cola)
 if cola_vacia(cola)
  puts "LA COLA ESTA VACIA"
  else
  aux = cola[:tope]
  cola[:tope] = cola[:tope][:siguiente]
  aux[:siguiente]= nil
  puts aux
 end 
end 



begin 

 puts " 1. Ingresar Estudiantes"
 puts " 2. Tomar asistencia"
 puts " 3. Resumen de asistencia"
 puts " 4. salir del programa"
 puts " Ingresar opcion"
 opcion = gets.chomp

 if opcion == 1
  puts
  elsif opcion == 2
  puts
  elsif opcion == 3
  puts
 end
end while != 4 
