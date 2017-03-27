Algoritmo ATM
	//Cuentas
	//Se declaran las columnas de la informaciòn
	Dimension accounts_id(3)
	Dimension accounts_owner(3)
	Dimension accounts_value(3)
	Dimension accounts_pass(3)
	
	//Se asignan informacion por defecto a las cuentas
	accounts_id(1)<-123
	accounts_id(2)<-234
	accounts_id(3)<-345
	
	accounts_owner(1)<-"Guillermo Jimenez"
	accounts_owner(2)<-"Natalia Alfaro"
	accounts_owner(3)<-"Fabian Cordero"
	
	accounts_value(1)<-30000
	accounts_value(2)<-223000 
	accounts_value(3)<-8000
	
	accounts_pass(1)<-9876
	accounts_pass(2)<-8765
	accounts_pass(3)<-7654
	
	//Billetes
	Dimension cash(6,2)
	//Billetes
	cash(1,1)<-1000
	cash(2,1)<-2000
	cash(3,1)<-5000
	cash(4,1)<-10000
	cash(5,1)<-20000
	cash(6,1)<-50000
	
	//Cantidad
	cash(1,2)<-100
	cash(2,2)<-150
	cash(3,2)<-50
	cash(4,2)<-50
	cash(5,2)<-50
	cash(6,2)<-20
	
	
	//Variables de administracion y seguridad
	Dimension data_reader(2)
	index<-3
	Escribir "ATM"
	// Mensajes para el usuario
	Escribir "Insert your Id"
	//Lectura de id
	Leer data_reader(1)
	// Mensajes para el usuario
	Escribir "Insert your Pass"
	//Lectura de datos
	Leer data_reader(2)
	error<-Verdadero
	//Revision 
	Para i<-1 Hasta 3 Con Paso 1 Hacer
		Si data_reader(1)=accounts_id(i) Y data_reader(2)=accounts_pass(i) Entonces
			error<-Falso
			//Inicio del sistema
			Limpiar Pantalla
			//Bienvenida
			Escribir Concatenar("Welcome ", accounts_owner(i))
			op<-0
			Escribir "Menu"
			Escribir "1)Query"
		    Escribir "2)Deposit"
			Escribir "3)Withdrawal"
			Escribir "4)Settings" 
			Escribir "5)Sign out"
			Escribir "-Select an option:"
			Leer op
			Segun op Hacer
				1:
					//Consultas del usuario: ver el monto de su cuenta
					Limpiar Pantalla
					Escribir "Query"
					Escribir "Accounts value: "
					Escribir accounts_value(i)
				2:
					//Depositos del usuario: depositar dinero en la cuenta
					Repetir
						Limpiar Pantalla
						d_amount<-0
						Escribir "Deposit"
						Escribir "-Insert an amount"
						Leer d_amount
						Si d_amount<0 Entonces
							Limpiar Pantalla
							Escribir "Please insert a real amount"
						sino 
							accounts_value(i)<-accounts_value(i)+d_amount
							Escribir "The deposit has been done successfully"
							Escribir accounts_value(i)
						Fin Si
					Hasta Que d_amount>0
				3:
					//Retiros del usuario: retirar dinero de la cuenta
					Dimension w_cash(6)
					Repetir
						Limpiar Pantalla
						w_amount<-0
						w_cash(1)<-0
						w_cash(2)<-0
						w_cash(3)<-0
						w_cash(4)<-0
						w_cash(5)<-0
						w_cash(6)<-0
						Escribir "Withdrawal"
						Escribir "-Insert an amount"
						Leer w_amount
						Si w_amount<=accounts_value(i) Y w_amount != 0 Y w_amount MOD 1000 = 0  Entonces
							ne_cash<-Falso
							Para v<-6 Hasta 1 Con Paso -1 Hacer
								Si w_amount > 0 Entonces
									Si w_amount >= cash(v,1) Entonces
										//Se asiga matematicamente la cantidad de billetes necesarios
										Si w_amount MOD cash(v,1) = 0 Entonces
											w_cash(v)<- w_amount/cash(v,1)
										Sino
											w_cash(v)<- (w_amount- w_amount MOD cash(v,1))/cash(v,1)
										Fin Si
										
										//Se revisa que la cantidad de billetes asignados esten disponibles en el cajero
										Si w_cash(v) > cash(v,2) Entonces
											//Si la cantidad no estuviera disponible se debe corregir
											Si v = 1 Entonces
												//Si el proceso se encuentra tratando de llenar con la ultima denominacion y el cajero se queda sin dinero, entonces se enciende la alarma de que no se tiene suficiente efectivo 
												ne_cash<-Verdadero
											Sino
												w_cash(v) <- cash(v,2)
											Fin Si
										Fin Si

										//Despues de asignarle una cantidad de billetes se le descuentan de la cantidad vigente de dinero
										w_amount <- w_amount - w_cash(v)*cash(v,1)
									Fin Si
								Sino
									//Cuando el ciclo no ha pasado por todos los billetes pero ya se cubrió todo el dinero solicitado
									v<-1
								Fin Si
							Fin Para
							Si ne_cash=Falso Entonces
								Escribir "Take your money"
								Para c<-6 Hasta 1 Con Paso -1 Hacer
									Si w_cash(c) > 0 Entonces
										value<-""
										value<-ConvertirATexto(cash(c,1))
										value<-Concatenar(value," bills")
										quantity<-""
										quantity<-ConvertirATexto(w_cash(c))
										quantity<- Concatenar(": ",quantity)
										Escribir Concatenar(value,quantity)
									Fin Si
								Fin Para
							Sino
								Escribir "Sorry not enough cash available"
							Fin Si
						Sino
							Escribir "Not enough funds or invalid amount"
						Fin Si
					Hasta Que w_amount <= accounts_value(i) Y w_amount MOD 1000 = 0
				4:
					Escribir "Settings"
				5:
					Escribir "Sign out"
				De Otro Modo:
					Escribir "Invalid option"
			Fin Segun
			
		Sino
			Si i=3 Entonces
				Si error=Verdadero Entonces
					Escribir "ID or Pass or both incorrect"
				Fin Si
			Fin Si
		Fin Si
		
	Fin Para
	
	
	
	
	
	
	
	
FinAlgoritmo
