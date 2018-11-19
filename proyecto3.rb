require 'byebug'
require 'terminal-table'

# pila
def limpiar_pantalla  #limpia pantalla
  system('clear')
end
#pila

def insertar(pila , valor) # ingresa el valor a la pila
  valor.each do |n|
    elemento = {   # nodo
        valor: n,   # valores que se estan ingresando
        siguiente: nil  # apunta al valor siguienete como nulo ... el fondo de la pila
    }
    if pila[:esta_vacia]    # mustra si la pila esta vacia
        pila[:tope] = elemento # ingresa el elemento al tope de la pila
        pila[:esta_vacia] = false
    else
        #paso 0
        tope = pila[:tope]   # mustra el tope de la pila
        elemento[:siguiente] = tope # inserta el elemento al tope de la pila o en dond se tenfa q ingresar
        #paso 1
        pila[:tope] = elemento # ingresa el nodo o elemento al tope de la pila ... arriba
    end
  end
  end


def solucion(valor)   # ordena
  vec = []
  @q = 0
  c = 0
  while (valor.size() > 0 ) # mustra si el valor es mayor  a 0
    @q += 1                # contador de los pasos a realizar
    vec [c]= valor.pop()
     @q += 1       # contador de los pasos a realizar
    c = c + 1        # contador
     @q += 1       # contador de los pasos a realizar
  end
  band = false      # bandera = falso
   @q += 1        # contador de los pasos a realizar
  while !band        # bandera igual falso
     @q += 1       # contador de los pasos a realizar
    band =true   # bandera igual verdadero
     @q += 1     # contador de los pasos a realizar
    for i in 0..(vec.length)-2     # recorre lo numeros
       @q += 1      # contador de los pasos a realizar
      if vec[i] < vec[i+1]   # numeros menores a
         @q += 1       # contador de los pasos a realizar
        aux = vec[i+1] # ingresa en una pila auxiliar
         @q += 1      # contador de los pasos a realizar
        vec[i+1] = vec[i]  # recorre e ingresa a la pila auxiliar
         @q += 1      # contador de los pasos a realizar
        vec[i] = aux     # pasa de la pila a pila auxiliar
         @q += 1      # contador de los pasos a realizar
        band = false    # bandera verdadera
         @q += 1 # contador   de los pasos a realizar
      end
    end
  end
  for i in 0..15  # recorre la pila

    valor.push vec[i] # ingresa la pila a una tabla
     @q += 1
    puts 'PILA ORDENADA '
  tabla = Terminal::Table.new do |t|    # tabla
    t.headings = ['Valor']  # titulo de la tabla
    t.add_row([
      valor.delete(" "), # ingresa los numeros a la tabla
    ])
  end
  puts 'PILA ORDENADA ' # muestra un aviso que la pila se ordeno
  puts tabla # imprime la tabla
  puts valor # imprime los valores
  puts 'PASOS PILA'   # muestra un aviso de pasos de la pila
  puts @q # imprime los pasos que  se hicieron en la pila
  end
end

 # cola
def vacia?(cola)  # cola vacia
  return cola[:tope].nil? && cola[:final] == nil # compara el tope de la cola para ver si tiene numeros o no
end

def insertar(cola, valor)  # inserta el la cola un valor
  if vacia?(cola) # pregunta si la cola esta vacia
    elemento = {   # nodo de la cola
      valor: valor,   # mira el valor
      posicion: 0, # posicion en  0
      siguiente: nil # mira el fondo de la cola
    }
    cola[:tope] = elemento # el tope de la cola es igual al elemento o nodo
    cola[:final] = elemento # el final de la cola es igual al elemento o nodo
  else
    elemento = {     # elemento o nodo
      valor: valor, # valor ingresado
      posicion: cola[:size], # busc la posicion , y el tamaño de la cola
      siguiente: nil # apunta a siguiente
    }
    elemento_final = cola[:final] # el elemento final es igual a el final de la cola
    elemento_final[:siguiente] = elemento # el elemento siguiente de de final es igual al elemento

    cola[:final] = elemento # el final de la cola es igual al elemento
  end
  cola[:size] += 1 # aumenta el size 1
end

def mostrar(cola) # mustra la cola
  tope = cola[:tope] #  el tope de la cola es igual a topa
  tabla = Terminal::Table.new do |t| # se ingresan los datos a la tabla
    t.headings = ['Valor'] #, 'Posicion', 'Siguiente'

    aux = cola[:tope] # la cola se convierte a auxiliar
    loop do
      siguiente = aux[:siguiente] # el valor de auxiliar siguiente es igual  a siguiente
      t.add_row([ # ingresa los datos en la cola
        aux[:valor], # ingresa datos a ka tabla
        #aux[:posicion],
        #siguiente == nil ? 'NIL' : siguiente[:valor]
      ])
      if aux[:siguiente] == nil # si el auxililiar siguiente es ifual a nulo
        break
      end
      aux = aux[:siguiente]
    end
  end
  puts tabla # muestra la tabla

end
def ordenar(cola,colamen, colamay)  # ordena la cola , recibe cola , y las variables necesarias con los valores de la cola
  @r = 0        # contador de pasos
  aux= cola[:tope] # cola auxiliarr es igual a la cola del tope
  cant = cola[:size] # el tamaño de la cola
    @r += 1 # contador de pasos
  while ( aux!=nil) # si el auxiliar no es igual a nulo
      @r += 1 # contador de pasos
    aux1=aux[:siguiente] # cola 1 es igual al valor siguiente del el auxiliar de la cola
      @r += 1 # contador de pasos
    while (aux1!=nil) # auxiliar 1 no es igual a nulo
        @r += 1 # contador de pasos
      if aux[:valor]>aux1[:valor] # el vslor de la cola auxiliar sea mayor a la cola 1 y su valor
          @r += 1 # contador de pasos
        temp = aux[:valor] # es igua  al calor de la cola auxiliar
          @r += 1 # contador de pasos
        aux[:valor]= aux1[:valor] # el valor de la cola auxiliar sea igual al de la cola 1
          @r += 1 # contador de pasos
        aux1[:valor] = temp # el valor de la cola 1 es iguak a temp
          @r += 1 # contador de pasos
      end
      aux1=aux1[:siguiente] # el valor siguiente de la cola 1 sea igual a cola 1
        @r += 1 # contador de pasos
    end
    aux=aux[:siguiente]  # el auxiliar sea igual a su calor siguiente
      @r += 1 # contador de pasos
  end
  puts 'PASOS COLA' # mustra un aviso de los pasos q se realizaron el la cola
  puts @r # contador total de los pasos de la cola
end

def vacia?(lista) # mira si la cola esta vacia
  lista[:tope].nil? && lista[:fondo].nil? # compara el tope y el fondo para ver si estan en la posicion nulo o hay alguan valor
end

def ordenar_lista(valor) # ordena la lista
aux =[] # recibe un arreglo
t=0  #contador
  for i in 1..valor.length-1 # recorre el arreglo en el valor
    t = i-1
    while aux << valor[t] # si el valor es mayor que la lista auxiliar
      t = t- 1
    end
    if valor[t] < aux # si el auxiliar es menor que el valor
    else
      valor[t+1] = valor[t] # aumenta el valor de t y comapra con el valor anterir
      valor[t]=aux # que el valor sea igual a auxiliar
    end
  end
    for i in 0..50 # recorre la lista
      q += 1
      valor.push aux[i] # introduce los valores a la lista
      q += 1
      puts 'LISTA ORDENADA ' # ordena  la list a
    tabla = Terminal::Table.new do |t| # introduce los datos a la tabla
      t.headings = ['Valor'] # titulo
      t.add_row([
        valor.delete(" "), # introduce los datos a la tabla
      ])
    end
    puts tabla #muestra la tabla
    puts valor # muestra los valores
  end
end

def insertar_final(lista, valorau) # inserta en el final de la lista

  nodo = {  # nodo o elemento
    valor: valorau, # valor
    anterior: nil, # apunta a anterior el siguiente valor
    siguiente: nil # apunta  a nulo el siguiente valor
  }
  if vacia?(lista) # mira si la lista esta vacia
    lista[:tope] = nodo # el tipe de la lista sea igual al nodo
    lista[:fondo] = nodo # el fondo de la lista sea igual al nodo
  else
    lista[:fondo][:siguiente] = nodo # apunta al nodo siguiente de la lista y se introduce el nodo
    lista[:fondo] = nodo # el fondo de la lista sea igual al nodo
  end

  lista[:size] += 1 # se aumenta el tamañao de la lista
end





=begin
def insertar_inicio(lista, valoraux)
  nodo = {
    valor: valoraux,
    siguiente: nil
  }
  if vacia?(lista)
    lista[:tope] = nodo
    lista[:fondo] = nodo
  else
    nodo[:siguiente] = lista[:tope]
    lista[:tope] = nodo
  end

  lista[:size] += 1
end

 def ordenar_lista(valor)

  for i in 1..valor.length-1
    t = i-1
    while aux < valor[t]
      t = t- 1
    end
    if valor[t] <= aux
    else
      valor [t+1] = valor[t]
      valor[t]=aux
      puts valor
    end
    end
    puts valor
  end
=end
=begin
def ordenarlista(lista)
 i=0
 j=0
  n = lista[:size]
 for i in 0..n-1
  elemento_actual=lista[:tope]
  for j in 0..n-i-1
    elemento_siguiente = elemento_actual[:siguiente]
    if elemento_actual[:valor] >= elemento_actual[:siguiente]
      temp = elemento_actual[:valor]
      elemento_actual[:valor] = elemento_siguiente[:valor]
      elemento_siguiente[:valor] = temp
    end
    elemento_actual = elemento_siguiente
  end
  puts lista
end
end
=end


def mostrar(lista) # mustra la lista
  @s = 0 # contador
   @s += 1 # contador de pasos
  tope = lista[:tope] # el tope de la lista sea igual al tope
   @s += 1# contador de pasos
  tabla = Terminal::Table.new do |t| # introduce los datos a la tabla
      @s += 1 # contador de pasos
    t.headings = ['Valor'] #, 'Posicion', 'Siguiente'
     @s += 1 # contador de pasos
    aux = lista[:tope] # el tope de la lista sea igual a un auxiliar
     @s += 1 # contador de pasos
    loop do
       @s += 1 # contador de pasos
      siguiente = aux[:siguiente] # el auxiliar siguietne se convierte el siguiente
       @s += 1 # contador de pasos
      t.add_row([
        aux[:valor], # se introducen loss datos a la tabla

        #aux[:posicion],
        #siguiente == nil ? 'NIL' : siguiente[:valor]
      ])
      if aux[:siguiente] == nil # el auxilia siguiente sea igual a nulo
         @s += 1 # contador de pasos
        break
      end
      aux = aux[:siguiente] # el suxiliar queda como el dato de el siguiente
      @s +=1# contador de pasos
    end
  end
  puts tabla  # muestra la tabla
   puts 'PASOS LISTA ' # muestra un aviso de los pasos de la table
   puts @s # total de pasos
end


# lista
lista = {
tope: nil,
fondo: nil,
size: 0
}
#puts 'ingrese la cadena de numeros que decea ordenar '
#puts 'separe con  espacios cada numero '
#dato = gets.split(' ')
#dato.each do |elemento|

#pila =[]
# pilas
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
#pila.push 3}

 # colas
cola = {
  tope: nil,
  final: nil,
  max: -1,
  size: 0
}
colaMenores = {
  tope1: nil,
  final1: nil,
  max1: -1,
  size1: 0
}
colaMayores = {
  tope1: nil,
  final1: nil,
  max1: -1,
  size1: 0
}

#insertar(cola, 11)
#insertar(cola, 13)
#insertar(cola, 'a')
#insertar(cola, 15)



begin
 # menu
puts 'TERCER PROYECTO '
puts '1.- INGRESO DE NUMEROS '
puts '2.- EJECUTAR ORDENAMIENTO'
puts '3.- PASO A PASO'
puts '4.- salir '
dato = gets.chomp.to_i
if dato == 1
  puts 'ingrese la cadena de numeros que decea ordenar '
  puts 'separe con  espacios cada numero '
  valor = gets.split(' ')

  size = valor.size # tamaño del arreglo
  for i in 0..size-1  # recorre el arreglo
  valoraux=valor[i] # valor es igual a valoraux
 # @numeros.each { |valor| print elemento, "-" }

 # insertar(pila)
 insertar(cola,valoraux) # introduce en la cola
 #gets
   #end
   end
   valo = valor.sort
    si = valor.size # tamaño del arreglo
   for i in 0..si-1 # recorre el arreglo
    valorau=valo[i] # el valor sera igual al valorau
   # @numeros.each { |valor| print elemento, "-" }
   insertar_final(lista, valorau) # inserta el la lista
   end
elsif dato == 2
  puts 'pila '
  #solucion(pila)
  solucion(valor) # mustra los pasos de la pila
  puts 'cola '
 # mostrar(cola)
  ordenar(cola,colaMenores,colaMayores) # muestra los pasos de la cola
  mostrar(cola)
  puts 'lista '
  mostrar(lista) # mustra los pasos de la lista

  puts 'MAYOR EFICIENCIA ' # mayor eficiencia entre la pila , cola y lista
  if @q > @r && @q > @s # si los pasos de la pila son mayores que los de cola y lista
          # se pone el mayor y se divide con los demas y se multiplica con 100 para sacar el %
    z= ((@q/@q) *100)
     y= ((@q / @r) *100)
     w= ((@q / @s) *100)
     # mustra los porcentajes de cada uno
    puts'porcentaje de rendimiento '
    puts "pila  #{z} %"
    puts "cola  #{y} %"
    puts "lista  #{w} %"
  elsif @r > @q && @r > @s # si los pasos de la cola son mayores a los de pila y lista
     # se pone el mayor y se divide con los demas y se multiplica con 100 para sacar el %
    z1= ((@r / @q) *100)
     y1= ((@r / @r) *100)
     w1= ((@r / @s) *100)
     # mustra los porcentajes de cada uno
    puts'porcentaje de rendimiento '
    puts "pila #{z1} %"
    puts "cola #{y1} %"
    puts "lista #{w1} %"
  elsif  # si los valores de la lista son mayores al de la cola y pila
     # se pone el mayor y se divide con los demas y se multiplica con 100 para sacar el %
    z2= ((@s / @q) *100)
     y2= ((@s / @r) *100)
     w2= ((@s / @s) *100)
     # mustra los porcentajes de cada uno
    puts'porcentaje de rendimiento '
    puts "pila#{z2} %"
    puts "cola#{y2} %"
    puts "lista#{w2} %"
  end

# paso a paso
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
end while dato!= 4 # sale del programa
  
  



 # pruevas del ordenamiento
=begin
  def ordenamiento_lista($dato_ingresado)

    paso= 0
    size = dato_ingresado.size - 1
    lista= Lista.new
    for x in 0..size
        if lista.tope== nil
            lista.insertar(dato_ingresado[x])

            paso +=1
            puts paso
        else

            a = lista.tope
            while a != nil
                if a.siguiente == nil
                    lista.insertar_despues(dato_ingresado[x], a.valor)


                    paso +=1
                    puts paso
                    break
                elsif a.valor <=dato_ingresado[x] && a.siguiente.valor >= dato_ingresado[x]
                    lista.insertar_despues(dato_ingresado[x], a.valor)

                    paso += 1
                    puts paso
                    break
                    if a.valor >= dato_ingrepasosado[x]
                        lista.insertar_antes(dato_ingresado[x], a.valor)

                        paso +=1
                        puts  paso
                        break
                   else
                       a = a.siguiente
                       puts paso
                   end
                end
            end
        end
    end

end


puts "ingresar los datos"

$dato_ingresado= gets.chomp.split(",")
puts ordenamiento_lista(dato_ingresado)

=end
