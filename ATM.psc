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
	
	//Interrupcion
	stop<-""
	
	//Inicializadores
	Dimension d_cash(6)
	Dimension w_cash(6)
	//Variables de administracion y seguridad
	Dimension data_reader(2)
	index<-3
	
	//default settings
	apagar<-falso
	
	Repetir
		Limpiar Pantalla
		Escribir "ATM"		
		Escribir "1)Client"
		Escribir "2)Manager"
		Leer op
		Segun op Hacer
			1:
				Limpiar Pantalla
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
						exit<-Falso
						sign_out_r<-"N"
						Repetir
							Limpiar Pantalla
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
									Limpiar Pantalla
									d_cash(1)<-0
									d_cash(2)<-0
									d_cash(3)<-0
									d_cash(4)<-0
									d_cash(5)<-0
									d_cash(6)<-0
									d_cash_check<-Falso
									d_amount<-0
									Escribir "Deposit"
									Escribir "-Insert the quantity of bills for each amount"
									Leer stop
									Para d<-6 Hasta 1 Con Paso -1 Hacer
										Repetir
											Limpiar Pantalla
											d_valor<-ConvertirATexto(cash(d,1))
											Escribir Concatenar(d_valor," Bills:")
											Leer d_cash(d)
										Hasta Que d_cash(d) >= 0 
										accounts_value(i) <- accounts_value(i) + (cash(d,1) * d_cash(d))
										cash(d,2) <- cash(d,2) + d_cash(d)
										d_amount<- d_amount + (cash(d,1) * d_cash(d))
									Fin Para
									Si d_amount = 0
										Limpiar Pantalla
										Escribir "Please insert bills"
									sino 
										d_amount_value<-ConvertirATexto(d_amount)
										Escribir Concatenar("The deposit has been done successfully: ",d_amount_value)
										accounts_value_v<-ConvertirATexto(accounts_value(i))
										Escribir Concatenar("Your account new value is: ",accounts_value_v)
									Fin Si
									
								3:
									//Retiros del usuario: retirar dinero de la cuenta
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
														accounts_value(i)<- accounts_value(i) - (w_cash(c)*cash(c,1))
													Fin Si
												Fin Para
											Sino
												Escribir "Sorry not enough cash available"
												Para c<-6 Hasta 1 Con Paso -1 Hacer
													Si w_cash(c) > 0 Entonces			
														cash(c,2)<- cash(c,2) + w_cash(c)
													Fin Si
												Fin Para
											Fin Si
										Sino
											Escribir "Not enough funds or invalid amount"
										Fin Si
									Hasta Que w_amount <= accounts_value(i) Y w_amount MOD 1000 = 0
								4:
									Repetir
										Limpiar Pantalla
										again<-Falso
										Escribir "Settings"
										Escribir "1)Change accounts owner name"
										Escribir "2)Change accounts pass"
										Leer op
										Limpiar Pantalla
										Segun op Hacer
											1:
												Escribir "Type the new accounts owner name:"
												Leer accounts_owner(i)
												Limpiar Pantalla
												Escribir Concatenar("Accounts owner name has been changed succesfully: ",accounts_owner(i))
											2:
												Escribir "Type the new accounts pass:"
												Leer accounts_pass(i)
												Limpiar Pantalla
												Escribir Concatenar("Accounts pass has been changed succesfully: ",accounts_owner(i))
											De Otro Modo:
												again <-Verdadero
										Fin Segun
									Hasta Que again=Falso
								5:
									exit<-Verdadero
								De Otro Modo:
									Escribir "Invalid option"
							Fin Segun
							leer stop
							Repetir
								again <- Falso
								Limpiar Pantalla
								Escribir "Sign out?"
								Leer sign_out_r
								Segun sign_out_r Hacer
									"Y":
										exit<-Verdadero
									"N":
										exit<-Falso
									"y":
										exit<-Verdadero
									"n":
										exit<-Falso
									De Otro Modo:
										again<-Verdadero
								Fin Segun
							Hasta Que again=Falso
						Hasta Que exit=Verdadero
					Sino
						Si i=3 Entonces
							Si error=Verdadero Entonces
								Limpiar Pantalla
								Escribir "ID or Pass or both incorrect"
								Leer stop
								Repetir
									again <- Falso
									Limpiar Pantalla
									Escribir "Sign out?"
									Leer sign_out_r
									Segun sign_out_r Hacer
										"Y":
											exit<-Verdadero
										"N":
											exit<-Falso
										"y":
											exit<-Verdadero
										"n":
											exit<-Falso
										De Otro Modo:
											again<-Verdadero
									Fin Segun
								Hasta Que again=Falso
							Fin Si
						Fin Si
					Fin Si
				Fin Para
			2:
				Limpiar Pantalla
				Escribir "Insert manager key"
				Leer key
				Si key=1590 Entonces
					Repetir
						Limpiar Pantalla
						sign_out_m <- Falso
						Escribir "Welcome Manager"
						Escribir "Menu"
						Escribir "1)Check bills quantity"
						Escribir "2)Insert bills"
						Escribir "3)Add new user"
						Escribir "4)Apagar ATM"
						Leer op
						Segun op Hacer
							1:
								Limpiar Pantalla
								Escribir "Bills quantity"
								Para b<-1 Hasta 6 Con Paso 1 Hacer
									bill<-ConvertirATexto(cash(b,1))
									cantidad<-ConvertirATexto(cash(b,2))
									bill<-Concatenar(bill,": ")
									Escribir Concatenar(bill,cantidad)
								Fin Para
								Leer stop
							2:
								Limpiar Pantalla
								d_cash(1)<-0
								d_cash(2)<-0
								d_cash(3)<-0
								d_cash(4)<-0
								d_cash(5)<-0
								d_cash(6)<-0
								d_cash_check<-Falso
								d_amount<-0
								Escribir "Insert bills"
								Escribir "-Insert the quantity of bills for each amount"
								Leer stop
								Para d<-6 Hasta 1 Con Paso -1 Hacer
									Repetir
										Limpiar Pantalla
										d_valor<-ConvertirATexto(cash(d,1))
										Escribir Concatenar(d_valor," Bills:")
										Leer d_cash(d)
									Hasta Que d_cash(d) >= 0 
									cash(d,2) <- cash(d,2) + d_cash(d)
									d_amount<- d_amount + (cash(d,1) * d_cash(d))
								Fin Para
								Si d_amount = 0
									Limpiar Pantalla
									Escribir "Please insert bills"
								sino 
									d_amount_value<-ConvertirATexto(d_amount)
									Escribir Concatenar("Bills has been inserted successfully: ",d_amount_value)
									Para t<-1 Hasta 6 Con Paso 1 Hacer
										atm_value<-atm_value+(cash(t,1)*cash(t,2))
									Fin Para
									atm_value_t<-ConvertirATexto(atm_value)
									Escribir Concatenar("ATM funds: ",atm_value_t)
								Fin Si
								Leer stop
							3:
								Repetir
									Limpiar Pantalla
									again<-Verdadero
									Escribir "Add new user"
									Escribir "Insert Id"
									Leer id
									Para r<-1 Hasta 3 Con Paso 1 Hacer
										Si id = accounts_id(r) Entonces
											Escribir "Type the new accounts owner name:"
											Leer name
											accounts_owner(r)<-name
											Escribir "Type the new accounts pass:"
											Leer pass
											accounts_pass(r)<-pass
											again<-Falso
										Fin Si
									Fin Para
									Si again= Verdadero Entonces
										Escribir "Id does not exist"
									Fin Si
									leer stop
								Hasta Que again=falso
							4:
								apagar<-Verdadero
							De Otro Modo:
								Limpiar Pantalla
								Escribir "Invalid option"
								Leer stop
						Fin Segun
						Si apagar= Verdadero Entonces
							sign_out_m <- Verdadero
						Sino
							Repetir
								again <- Falso
								Limpiar Pantalla
								Escribir "Sign out?"
								Leer sign_out_r
								Segun sign_out_r Hacer
									"Y":
										sign_out_m<-Verdadero
									"N":
										sign_out_m<-Falso
									"y":
										sign_out_m<-Verdadero
									"n":
										sign_out_m<-Falso
									De Otro Modo:
										again<-Verdadero
								Fin Segun
							Hasta Que again=Falso
						Fin Si
					Hasta Que sign_out_m = Verdadero
				Sino
					Limpiar Pantalla
					Escribir "Invalid Key"
					Leer stop
				Fin Si
			De Otro Modo:
				Limpiar Pantalla
				Escribir "Invalid option"
				Leer stop
		Fin Segun
	Hasta Que apagar=Verdadero
FinAlgoritmo
