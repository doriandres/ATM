Algoritmo ATMuno
	//Cuentas
	id_a<-123
	id_c<-456
	id_b<-789
	
	owner_a<-"Guillermo Jimenez"
	owner_b<-"Natalia Alfaro"
	owner_c<-"Fabian Cordero"
	
	value_a<-30000
	value_b<-175000
	value_c<-5000
	
	pass_a<-9876
	pass_b<-8765
	pass_c<-7654
	
	//Efectivo
	b_k<-100
	b_dk<-150
    b_vk<-50
	b_xk<-50
	b_xxk<-50
	b_xvk<-20
	
	stop<-""
	
	//Auxiliares
	d_k<-0
	d_dk<-0
    d_vk<-0
	d_xk<-0
	d_xxk<-0
	d_xvk<-0
	
	w_k<-0
	w_dk<-0
    w_vk<-0
	w_xk<-0
	w_xxk<-0
	w_xvk<-0
	
	data_id<-0
	data_pass<-0
	
	apagar<-Falso
	
	op<-0
	
	//Ciclo del sistema
	Repetir
		
		//Inicio del sistema
		Limpiar Pantalla
		Escribir "ATM"		
		Escribir "1)Client"
		Escribir "2)Manager"
		Leer op
		
		Segun op Hacer
			1:
				error<-Falso
				Limpiar Pantalla
				Escribir "ATM"
				// Mensajes para el usuario
				Escribir "Insert your Id"
				//Lectura de id
				Leer data_id
				Escribir "Insert your pass"
				//Lectura de pass
				Leer data_pass
				Segun data_id Hacer
					id_a:
						Si data_pass=pass_a Entonces
							Repetir
								Limpiar Pantalla
								Escribir Concatenar("Welcome ", owner_a)
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
										Escribir value_a
										
									2:
										//Depositos del usuario: depositar dinero en la cuenta
										Limpiar Pantalla
										d_k<-0
										d_dk<-0
										d_vk<-0
										d_xk<-0
										d_xxk<-0
										d_xvk<-0
										d_cash_check<-Falso
										d_amount<-0
										Escribir "Deposit"
										Escribir "-Insert the quantity of bills for each amount"
										Leer stop
										
										//50 000
										Limpiar Pantalla
										Escribir Concatenar("c50 000"," Bills:")
										Leer d_xvk
										value_a <- value_a + (50000 * d_xvk)
										b_xvk <- b_xvk + d_xvk
										d_amount<- d_amount + (50000 * d_xvk)
										//20 000
										Limpiar Pantalla
										Escribir Concatenar("c20 000"," Bills:")
										Leer d_xxk
										value_a <- value_a + (20000 * d_xxk)
										b_xxk <- b_xxk + d_xxk
										d_amount<- d_amount + (20000 * d_xxk)
										//10 000
										Limpiar Pantalla
										Escribir Concatenar("c10 000"," Bills:")
										Leer d_xk
										value_a <- value_a + (10000 * d_xk)
										b_xk <- b_xk + d_xk
										d_amount<- d_amount + (10000 * d_xk)
										//5000
										Limpiar Pantalla
										Escribir Concatenar("c5000"," Bills:")
										Leer d_vk
										value_a <- value_a + (5000 * d_vk)
										b_vk <- b_vk + d_vk
										d_amount<- d_amount + (5000 * d_vk)
										//2000
										Limpiar Pantalla
										Escribir Concatenar("c2000"," Bills:")
										Leer d_dk
										value_a <- value_a + (2000 * d_dk)
										b_dk <- b_dk + d_dk
										d_amount<- d_amount + (2000 * d_dk)
										//1000
										Limpiar Pantalla
										Escribir Concatenar("c1000"," Bills:")
										Leer d_k
										value_a <- value_a + (1000 * d_k)
										b_k <- b_k + d_k
										d_amount<- d_amount + (1000 * d_k)
										
										Si d_amount = 0
											Limpiar Pantalla
											Escribir "Please insert bills and try again"
										sino 
											d_amount_value<-ConvertirATexto(d_amount)
											Escribir Concatenar("The deposit has been done successfully: ",d_amount_value)
											accounts_value_v<-ConvertirATexto(value_a)
											Escribir Concatenar("Your account new value is: ",accounts_value_v)
										Fin Si
										
									3:
										//Retiros del usuario: retirar dinero de la cuenta
										Repetir
											Limpiar Pantalla
											w_amount<-0
											w_k<-0
											w_dk<-0
											w_vk<-0
											w_xk<-0
											w_xxk<-0
											w_xvk<-0
											Escribir "Withdrawal"
											Escribir "-Insert an amount"
											Leer w_amount
											Si w_amount<=value_a Y w_amount != 0 Y w_amount MOD 1000 = 0  Entonces
												ne_cash<-Falso
												
												Si w_amount > 0 Entonces
													Si w_amount >= 50000 Entonces
														//Se asiga matematicamente la cantidad de billetes necesarios
														Si w_amount MOD 50000 = 0 Entonces
															w_xvk<- w_amount/50000
														Sino
															w_xvk<- (w_amount- w_amount MOD 50000)/50000
														Fin Si
														
														//Se revisa que la cantidad de billetes asignados esten disponibles en el cajero
														Si w_xvk > b_xvk Entonces
															//Si la cantidad no estuviera disponible se debe corregir
															w_xvk <- b_xvk
														Fin Si
														//Despues de asignarle una cantidad de billetes se le descuentan de la cantidad vigente de dinero
														w_amount <- w_amount - w_xvk*50000
													Fin Si
												Fin Si
												
												Si w_amount > 0 Entonces
													Si w_amount >= 20000 Entonces
														//Se asiga matematicamente la cantidad de billetes necesarios
														Si w_amount MOD 20000 = 0 Entonces
															w_xxk<- w_amount/20000
														Sino
															w_xxk<- (w_amount- w_amount MOD 20000)/20000
														Fin Si
														
														//Se revisa que la cantidad de billetes asignados esten disponibles en el cajero
														Si w_xxk > b_xxk Entonces
															//Si la cantidad no estuviera disponible se debe corregir
															w_xxk <- b_xxk
														Fin Si
														//Despues de asignarle una cantidad de billetes se le descuentan de la cantidad vigente de dinero
														w_amount <- w_amount - w_xxk*20000
													Fin Si
												Fin Si
												
												Si w_amount > 0 Entonces
													Si w_amount >= 10000 Entonces
														//Se asiga matematicamente la cantidad de billetes necesarios
														Si w_amount MOD 10000 = 0 Entonces
															w_xk<- w_amount/10000
														Sino
															w_xk<- (w_amount- w_amount MOD 10000)/10000
														Fin Si
														
														//Se revisa que la cantidad de billetes asignados esten disponibles en el cajero
														Si w_xk > b_xk Entonces
															//Si la cantidad no estuviera disponible se debe corregir
															w_xk <- b_xk
														Fin Si
														//Despues de asignarle una cantidad de billetes se le descuentan de la cantidad vigente de dinero
														w_amount <- w_amount - w_xk*10000
													Fin Si
												Fin Si
												
												Si w_amount > 0 Entonces
													Si w_amount >= 5000 Entonces
														//Se asiga matematicamente la cantidad de billetes necesarios
														Si w_amount MOD 5000 = 0 Entonces
															w_vk<- w_amount/5000
														Sino
															w_vk<- (w_amount- w_amount MOD 5000)/5000
														Fin Si
														
														//Se revisa que la cantidad de billetes asignados esten disponibles en el cajero
														Si w_vk > b_vk Entonces
															//Si la cantidad no estuviera disponible se debe corregir
															w_vk <- b_vk
														Fin Si
														//Despues de asignarle una cantidad de billetes se le descuentan de la cantidad vigente de dinero
														w_amount <- w_amount - w_vk*5000
													Fin Si
												Fin Si
												
												Si w_amount > 0 Entonces
													Si w_amount >= 2000 Entonces
														//Se asiga matematicamente la cantidad de billetes necesarios
														Si w_amount MOD 2000 = 0 Entonces
															w_dk<- w_amount/2000
														Sino
															w_dk<- (w_amount- w_amount MOD 2000)/2000
														Fin Si
														
														//Se revisa que la cantidad de billetes asignados esten disponibles en el cajero
														Si w_dk > b_dk Entonces
															//Si la cantidad no estuviera disponible se debe corregir
															w_dk <- b_dk
														Fin Si
														//Despues de asignarle una cantidad de billetes se le descuentan de la cantidad vigente de dinero
														w_amount <- w_amount - w_dk*2000
													Fin Si
												Fin Si
												
												Si w_amount > 0 Entonces
													Si w_amount >= 1000 Entonces
														//Se asiga matematicamente la cantidad de billetes necesarios
														Si w_amount MOD 1000 = 0 Entonces
															w_k<- w_amount/1000
														Sino
															w_k<- (w_amount- w_amount MOD 1000)/1000
														Fin Si
														
														//Se revisa que la cantidad de billetes asignados esten disponibles en el cajero
														Si w_k > b_k Entonces
															//Si la cantidad no estuviera disponible se debe corregir
															ne_cash<-Verdadero
															w_k <- b_k
														Fin Si
														//Despues de asignarle una cantidad de billetes se le descuentan de la cantidad vigente de dinero
														w_amount <- w_amount - w_k*1000
													Fin Si
												Fin Si
												
												
												
												Si ne_cash=Falso Entonces
													
													Escribir "Take your money"
													//50 000
													Si w_xvk > 0 Entonces
														quantity<-ConvertirATexto(w_xvk)
														Escribir Concatenar("c50 000 bills: ",quantity)
														value_a<- value_a - (w_xvk*50000)
													Fin Si
													//20 000
													Si w_xxk > 0 Entonces
														quantity<-ConvertirATexto(w_xxk)
														Escribir Concatenar("c20 000 bills: ",quantity)
														value_a<- value_a - (w_xxk*20000)
													Fin Si
													//10 000
													Si w_xk > 0 Entonces
														quantity<-ConvertirATexto(w_xk)
														Escribir Concatenar("c10 000 bills: ",quantity)
														value_a<- value_a - (w_xk*10000)
													Fin Si
													//5 000
													Si w_vk > 0 Entonces
														quantity<-ConvertirATexto(w_vk)
														Escribir Concatenar("c5 000 bills: ",quantity)
														value_a<- value_a - (w_vk*5000)
													Fin Si
													//2 000
													Si w_dk > 0 Entonces
														quantity<-ConvertirATexto(w_dk)
														Escribir Concatenar("c2 000 bills: ",quantity)
														value_a<- value_a - (w_dk*2000)
													Fin Si
													//1 000
													Si w_k > 0 Entonces
														quantity<-ConvertirATexto(w_k)
														Escribir Concatenar("c1 000 bills: ",quantity)
														value_a<- value_a - (w_k*1000)
													Fin Si
													
												Sino
													Escribir "Sorry not enough cash available"
													//50 000
													Si w_xvk > 0 Entonces			
														b_xvk <- b_xvk + w_xvk
													Fin Si
													//20 000
													Si w_xxk > 0 Entonces			
														b_xxk <- b_xxk + w_xxk
													Fin Si
													//10 000
													Si w_xk > 0 Entonces			
														b_xk <- b_xk + w_xk
													Fin Si
													//5 000
													Si w_vk > 0 Entonces			
														b_vk <- b_vk + w_vk
													Fin Si
													//2 000
													Si w_dk > 0 Entonces			
														b_dk <- b_dk + w_dk
													Fin Si
													//1 000
													Si w_k > 0 Entonces			
														b_k <- b_k + w_k
													Fin Si
													
												Fin Si
											Sino
												Escribir "Not enough funds or invalid amount"
											Fin Si
										Hasta Que w_amount <= value_a Y w_amount MOD 1000 = 0
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
													Leer owner_a
													Limpiar Pantalla
													Escribir Concatenar("Accounts owner name has been changed succesfully: ",owner_a)
												2:
													Escribir "Type the new accounts pass:"
													Leer pass_a
													Limpiar Pantalla
													Escribir Concatenar("Accounts pass has been changed succesfully: ",owner_a)
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
							error<-Verdadero
						Fin Si
					id_b:
						Si data_pass=pass_b Entonces
							Repetir
								Limpiar Pantalla
								Escribir Concatenar("Welcome ", owner_b)
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
										Escribir value_b
										
									2:
										//Depositos del usuario: depositar dinero en la cuenta
										Limpiar Pantalla
										d_k<-0
										d_dk<-0
										d_vk<-0
										d_xk<-0
										d_xxk<-0
										d_xvk<-0
										d_cash_check<-Falso
										d_amount<-0
										Escribir "Deposit"
										Escribir "-Insert the quantity of bills for each amount"
										Leer stop
										
										//50 000
										Limpiar Pantalla
										Escribir Concatenar("c50 000"," Bills:")
										Leer d_xvk
										value_b <- value_b + (50000 * d_xvk)
										b_xvk <- b_xvk + d_xvk
										d_amount<- d_amount + (50000 * d_xvk)
										//20 000
										Limpiar Pantalla
										Escribir Concatenar("c20 000"," Bills:")
										Leer d_xxk
										value_b <- value_b + (20000 * d_xxk)
										b_xxk <- b_xxk + d_xxk
										d_amount<- d_amount + (20000 * d_xxk)
										//10 000
										Limpiar Pantalla
										Escribir Concatenar("c10 000"," Bills:")
										Leer d_xk
										value_b <- value_b + (10000 * d_xk)
										b_xk <- b_xk + d_xk
										d_amount<- d_amount + (10000 * d_xk)
										//5000
										Limpiar Pantalla
										Escribir Concatenar("c5000"," Bills:")
										Leer d_vk
										value_b <- value_b + (5000 * d_vk)
										b_vk <- b_vk + d_vk
										d_amount<- d_amount + (5000 * d_vk)
										//2000
										Limpiar Pantalla
										Escribir Concatenar("c2000"," Bills:")
										Leer d_dk
										value_b <- value_b + (2000 * d_dk)
										b_dk <- b_dk + d_dk
										d_amount<- d_amount + (2000 * d_dk)
										//1000
										Limpiar Pantalla
										Escribir Concatenar("c1000"," Bills:")
										Leer d_k
										value_b <- value_b + (1000 * d_k)
										b_k <- b_k + d_k
										d_amount<- d_amount + (1000 * d_k)
										
										Si d_amount = 0
											Limpiar Pantalla
											Escribir "Please insert bills and try again"
										sino 
											d_amount_value<-ConvertirATexto(d_amount)
											Escribir Concatenar("The deposit has been done successfully: ",d_amount_value)
											accounts_value_v<-ConvertirATexto(value_b)
											Escribir Concatenar("Your account new value is: ",accounts_value_b)
										Fin Si
										
									3:
										//Retiros del usuario: retirar dinero de la cuenta
										Repetir
											Limpiar Pantalla
											w_amount<-0
											w_k<-0
											w_dk<-0
											w_vk<-0
											w_xk<-0
											w_xxk<-0
											w_xvk<-0
											Escribir "Withdrawal"
											Escribir "-Insert an amount"
											Leer w_amount
											Si w_amount<=value_b Y w_amount != 0 Y w_amount MOD 1000 = 0  Entonces
												ne_cash<-Falso
												
												Si w_amount > 0 Entonces
													Si w_amount >= 50000 Entonces
														//Se asiga matematicamente la cantidad de billetes necesarios
														Si w_amount MOD 50000 = 0 Entonces
															w_xvk<- w_amount/50000
														Sino
															w_xvk<- (w_amount- w_amount MOD 50000)/50000
														Fin Si
														
														//Se revisa que la cantidad de billetes asignados esten disponibles en el cajero
														Si w_xvk > b_xvk Entonces
															//Si la cantidad no estuviera disponible se debe corregir
															w_xvk <- b_xvk
														Fin Si
														//Despues de asignarle una cantidad de billetes se le descuentan de la cantidad vigente de dinero
														w_amount <- w_amount - w_xvk*50000
													Fin Si
												Fin Si
												
												Si w_amount > 0 Entonces
													Si w_amount >= 20000 Entonces
														//Se asiga matematicamente la cantidad de billetes necesarios
														Si w_amount MOD 20000 = 0 Entonces
															w_xxk<- w_amount/20000
														Sino
															w_xxk<- (w_amount- w_amount MOD 20000)/20000
														Fin Si
														
														//Se revisa que la cantidad de billetes asignados esten disponibles en el cajero
														Si w_xxk > b_xxk Entonces
															//Si la cantidad no estuviera disponible se debe corregir
															w_xxk <- b_xxk
														Fin Si
														//Despues de asignarle una cantidad de billetes se le descuentan de la cantidad vigente de dinero
														w_amount <- w_amount - w_xxk*20000
													Fin Si
												Fin Si
												
												Si w_amount > 0 Entonces
													Si w_amount >= 10000 Entonces
														//Se asiga matematicamente la cantidad de billetes necesarios
														Si w_amount MOD 10000 = 0 Entonces
															w_xk<- w_amount/10000
														Sino
															w_xk<- (w_amount- w_amount MOD 10000)/10000
														Fin Si
														
														//Se revisa que la cantidad de billetes asignados esten disponibles en el cajero
														Si w_xk > b_xk Entonces
															//Si la cantidad no estuviera disponible se debe corregir
															w_xk <- b_xk
														Fin Si
														//Despues de asignarle una cantidad de billetes se le descuentan de la cantidad vigente de dinero
														w_amount <- w_amount - w_xk*10000
													Fin Si
												Fin Si
												
												Si w_amount > 0 Entonces
													Si w_amount >= 5000 Entonces
														//Se asiga matematicamente la cantidad de billetes necesarios
														Si w_amount MOD 5000 = 0 Entonces
															w_vk<- w_amount/5000
														Sino
															w_vk<- (w_amount- w_amount MOD 5000)/5000
														Fin Si
														
														//Se revisa que la cantidad de billetes asignados esten disponibles en el cajero
														Si w_vk > b_vk Entonces
															//Si la cantidad no estuviera disponible se debe corregir
															w_vk <- b_vk
														Fin Si
														//Despues de asignarle una cantidad de billetes se le descuentan de la cantidad vigente de dinero
														w_amount <- w_amount - w_vk*5000
													Fin Si
												Fin Si
												
												Si w_amount > 0 Entonces
													Si w_amount >= 2000 Entonces
														//Se asiga matematicamente la cantidad de billetes necesarios
														Si w_amount MOD 2000 = 0 Entonces
															w_dk<- w_amount/2000
														Sino
															w_dk<- (w_amount- w_amount MOD 2000)/2000
														Fin Si
														
														//Se revisa que la cantidad de billetes asignados esten disponibles en el cajero
														Si w_dk > b_dk Entonces
															//Si la cantidad no estuviera disponible se debe corregir
															w_dk <- b_dk
														Fin Si
														//Despues de asignarle una cantidad de billetes se le descuentan de la cantidad vigente de dinero
														w_amount <- w_amount - w_dk*2000
													Fin Si
												Fin Si
												
												Si w_amount > 0 Entonces
													Si w_amount >= 1000 Entonces
														//Se asiga matematicamente la cantidad de billetes necesarios
														Si w_amount MOD 1000 = 0 Entonces
															w_k<- w_amount/1000
														Sino
															w_k<- (w_amount- w_amount MOD 1000)/1000
														Fin Si
														
														//Se revisa que la cantidad de billetes asignados esten disponibles en el cajero
														Si w_k > b_k Entonces
															//Si la cantidad no estuviera disponible se debe corregir
															ne_cash<-Verdadero
															w_k <- b_k
														Fin Si
														//Despues de asignarle una cantidad de billetes se le descuentan de la cantidad vigente de dinero
														w_amount <- w_amount - w_k*1000
													Fin Si
												Fin Si
												
												
												
												Si ne_cash=Falso Entonces
													
													Escribir "Take your money"
													//50 000
													Si w_xvk > 0 Entonces
														quantity<-ConvertirATexto(w_xvk)
														Escribir Concatenar("c50 000 bills: ",quantity)
														value_b<- value_b - (w_xvk*50000)
													Fin Si
													//20 000
													Si w_xxk > 0 Entonces
														quantity<-ConvertirATexto(w_xxk)
														Escribir Concatenar("c20 000 bills: ",quantity)
														value_b<- value_b - (w_xxk*20000)
													Fin Si
													//10 000
													Si w_xk > 0 Entonces
														quantity<-ConvertirATexto(w_xk)
														Escribir Concatenar("c10 000 bills: ",quantity)
														value_b<- value_b - (w_xk*10000)
													Fin Si
													//5 000
													Si w_vk > 0 Entonces
														quantity<-ConvertirATexto(w_vk)
														Escribir Concatenar("c5 000 bills: ",quantity)
														value_b<- value_b - (w_vk*5000)
													Fin Si
													//2 000
													Si w_dk > 0 Entonces
														quantity<-ConvertirATexto(w_dk)
														Escribir Concatenar("c2 000 bills: ",quantity)
														value_b<- value_b - (w_dk*2000)
													Fin Si
													//1 000
													Si w_k > 0 Entonces
														quantity<-ConvertirATexto(w_k)
														Escribir Concatenar("c1 000 bills: ",quantity)
														value_b<- value_b - (w_k*1000)
													Fin Si
													
												Sino
													Escribir "Sorry not enough cash available"
													//50 000
													Si w_xvk > 0 Entonces			
														b_xvk <- b_xvk + w_xvk
													Fin Si
													//20 000
													Si w_xxk > 0 Entonces			
														b_xxk <- b_xxk + w_xxk
													Fin Si
													//10 000
													Si w_xk > 0 Entonces			
														b_xk <- b_xk + w_xk
													Fin Si
													//5 000
													Si w_vk > 0 Entonces			
														b_vk <- b_vk + w_vk
													Fin Si
													//2 000
													Si w_dk > 0 Entonces			
														b_dk <- b_dk + w_dk
													Fin Si
													//1 000
													Si w_k > 0 Entonces			
														b_k <- b_k + w_k
													Fin Si
													
												Fin Si
											Sino
												Escribir "Not enough funds or invalid amount"
											Fin Si
										Hasta Que w_amount <= value_b Y w_amount MOD 1000 = 0
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
													Leer owner_b
													Limpiar Pantalla
													Escribir Concatenar("Accounts owner name has been changed succesfully: ",owner_b)
												2:
													Escribir "Type the new accounts pass:"
													Leer pass_b
													Limpiar Pantalla
													Escribir Concatenar("Accounts pass has been changed succesfully: ",owner_b)
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
							error<-Verdadero
						Fin Si
					id_c:
						Si data_pass=pass_c Entonces
							Repetir
								Limpiar Pantalla
								Escribir Concatenar("Welcome ", owner_c)
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
										Escribir value_c
										
									2:
										//Depositos del usuario: depositar dinero en la cuenta
										Limpiar Pantalla
										d_k<-0
										d_dk<-0
										d_vk<-0
										d_xk<-0
										d_xxk<-0
										d_xvk<-0
										d_cash_check<-Falso
										d_amount<-0
										Escribir "Deposit"
										Escribir "-Insert the quantity of bills for each amount"
										Leer stop
										
										//50 000
										Limpiar Pantalla
										Escribir Concatenar("c50 000"," Bills:")
										Leer d_xvk
										value_c <- value_c + (50000 * d_xvk)
										b_xvk <- b_xvk + d_xvk
										d_amount<- d_amount + (50000 * d_xvk)
										//20 000
										Limpiar Pantalla
										Escribir Concatenar("c20 000"," Bills:")
										Leer d_xxk
										value_c <- value_c + (20000 * d_xxk)
										b_xxk <- b_xxk + d_xxk
										d_amount<- d_amount + (20000 * d_xxk)
										//10 000
										Limpiar Pantalla
										Escribir Concatenar("c10 000"," Bills:")
										Leer d_xk
										value_c <- value_c + (10000 * d_xk)
										b_xk <- b_xk + d_xk
										d_amount<- d_amount + (10000 * d_xk)
										//5000
										Limpiar Pantalla
										Escribir Concatenar("c5000"," Bills:")
										Leer d_vk
										value_c <- value_c + (5000 * d_vk)
										b_vk <- b_vk + d_vk
										d_amount<- d_amount + (5000 * d_vk)
										//2000
										Limpiar Pantalla
										Escribir Concatenar("c2000"," Bills:")
										Leer d_dk
										value_c <- value_c + (2000 * d_dk)
										b_dk <- b_dk + d_dk
										d_amount<- d_amount + (2000 * d_dk)
										//1000
										Limpiar Pantalla
										Escribir Concatenar("c1000"," Bills:")
										Leer d_k
										value_c <- value_c + (1000 * d_k)
										b_k <- b_k + d_k
										d_amount<- d_amount + (1000 * d_k)
										
										Si d_amount = 0
											Limpiar Pantalla
											Escribir "Please insert bills and try again"
										sino 
											d_amount_value<-ConvertirATexto(d_amount)
											Escribir Concatenar("The deposit has been done successfully: ",d_amount_value)
											accounts_value_v<-ConvertirATexto(value_c)
											Escribir Concatenar("Your account new value is: ",accounts_value_v)
										Fin Si
										
									3:
										//Retiros del usuario: retirar dinero de la cuenta
										Repetir
											Limpiar Pantalla
											w_amount<-0
											w_k<-0
											w_dk<-0
											w_vk<-0
											w_xk<-0
											w_xxk<-0
											w_xvk<-0
											Escribir "Withdrawal"
											Escribir "-Insert an amount"
											Leer w_amount
											Si w_amount<=value_c Y w_amount != 0 Y w_amount MOD 1000 = 0  Entonces
												ne_cash<-Falso
												
												Si w_amount > 0 Entonces
													Si w_amount >= 50000 Entonces
														//Se asiga matematicamente la cantidad de billetes necesarios
														Si w_amount MOD 50000 = 0 Entonces
															w_xvk<- w_amount/50000
														Sino
															w_xvk<- (w_amount- w_amount MOD 50000)/50000
														Fin Si
														
														//Se revisa que la cantidad de billetes asignados esten disponibles en el cajero
														Si w_xvk > b_xvk Entonces
															//Si la cantidad no estuviera disponible se debe corregir
															w_xvk <- b_xvk
														Fin Si
														//Despues de asignarle una cantidad de billetes se le descuentan de la cantidad vigente de dinero
														w_amount <- w_amount - w_xvk*50000
													Fin Si
												Fin Si
												
												Si w_amount > 0 Entonces
													Si w_amount >= 20000 Entonces
														//Se asiga matematicamente la cantidad de billetes necesarios
														Si w_amount MOD 20000 = 0 Entonces
															w_xxk<- w_amount/20000
														Sino
															w_xxk<- (w_amount- w_amount MOD 20000)/20000
														Fin Si
														
														//Se revisa que la cantidad de billetes asignados esten disponibles en el cajero
														Si w_xxk > b_xxk Entonces
															//Si la cantidad no estuviera disponible se debe corregir
															w_xxk <- b_xxk
														Fin Si
														//Despues de asignarle una cantidad de billetes se le descuentan de la cantidad vigente de dinero
														w_amount <- w_amount - w_xxk*20000
													Fin Si
												Fin Si
												
												Si w_amount > 0 Entonces
													Si w_amount >= 10000 Entonces
														//Se asiga matematicamente la cantidad de billetes necesarios
														Si w_amount MOD 10000 = 0 Entonces
															w_xk<- w_amount/10000
														Sino
															w_xk<- (w_amount- w_amount MOD 10000)/10000
														Fin Si
														
														//Se revisa que la cantidad de billetes asignados esten disponibles en el cajero
														Si w_xk > b_xk Entonces
															//Si la cantidad no estuviera disponible se debe corregir
															w_xk <- b_xk
														Fin Si
														//Despues de asignarle una cantidad de billetes se le descuentan de la cantidad vigente de dinero
														w_amount <- w_amount - w_xk*10000
													Fin Si
												Fin Si
												
												Si w_amount > 0 Entonces
													Si w_amount >= 5000 Entonces
														//Se asiga matematicamente la cantidad de billetes necesarios
														Si w_amount MOD 5000 = 0 Entonces
															w_vk<- w_amount/5000
														Sino
															w_vk<- (w_amount- w_amount MOD 5000)/5000
														Fin Si
														
														//Se revisa que la cantidad de billetes asignados esten disponibles en el cajero
														Si w_vk > b_vk Entonces
															//Si la cantidad no estuviera disponible se debe corregir
															w_vk <- b_vk
														Fin Si
														//Despues de asignarle una cantidad de billetes se le descuentan de la cantidad vigente de dinero
														w_amount <- w_amount - w_vk*5000
													Fin Si
												Fin Si
												
												Si w_amount > 0 Entonces
													Si w_amount >= 2000 Entonces
														//Se asiga matematicamente la cantidad de billetes necesarios
														Si w_amount MOD 2000 = 0 Entonces
															w_dk<- w_amount/2000
														Sino
															w_dk<- (w_amount- w_amount MOD 2000)/2000
														Fin Si
														
														//Se revisa que la cantidad de billetes asignados esten disponibles en el cajero
														Si w_dk > b_dk Entonces
															//Si la cantidad no estuviera disponible se debe corregir
															w_dk <- b_dk
														Fin Si
														//Despues de asignarle una cantidad de billetes se le descuentan de la cantidad vigente de dinero
														w_amount <- w_amount - w_dk*2000
													Fin Si
												Fin Si
												
												Si w_amount > 0 Entonces
													Si w_amount >= 1000 Entonces
														//Se asiga matematicamente la cantidad de billetes necesarios
														Si w_amount MOD 1000 = 0 Entonces
															w_k<- w_amount/1000
														Sino
															w_k<- (w_amount- w_amount MOD 1000)/1000
														Fin Si
														
														//Se revisa que la cantidad de billetes asignados esten disponibles en el cajero
														Si w_k > b_k Entonces
															//Si la cantidad no estuviera disponible se debe corregir
															ne_cash<-Verdadero
															w_k <- b_k
														Fin Si
														//Despues de asignarle una cantidad de billetes se le descuentan de la cantidad vigente de dinero
														w_amount <- w_amount - w_k*1000
													Fin Si
												Fin Si
												
												
												
												Si ne_cash=Falso Entonces
													
													Escribir "Take your money"
													//50 000
													Si w_xvk > 0 Entonces
														quantity<-ConvertirATexto(w_xvk)
														Escribir Concatenar("c50 000 bills: ",quantity)
														value_c<- value_c - (w_xvk*50000)
													Fin Si
													//20 000
													Si w_xxk > 0 Entonces
														quantity<-ConvertirATexto(w_xxk)
														Escribir Concatenar("c20 000 bills: ",quantity)
														value_c<- value_c - (w_xxk*20000)
													Fin Si
													//10 000
													Si w_xk > 0 Entonces
														quantity<-ConvertirATexto(w_xk)
														Escribir Concatenar("c10 000 bills: ",quantity)
														value_c<- value_c - (w_xk*10000)
													Fin Si
													//5 000
													Si w_vk > 0 Entonces
														quantity<-ConvertirATexto(w_vk)
														Escribir Concatenar("c5 000 bills: ",quantity)
														value_c<- value_c - (w_vk*5000)
													Fin Si
													//2 000
													Si w_dk > 0 Entonces
														quantity<-ConvertirATexto(w_dk)
														Escribir Concatenar("c2 000 bills: ",quantity)
														value_c<- value_c - (w_dk*2000)
													Fin Si
													//1 000
													Si w_k > 0 Entonces
														quantity<-ConvertirATexto(w_k)
														Escribir Concatenar("c1 000 bills: ",quantity)
														value_c<- value_c - (w_k*1000)
													Fin Si
													
												Sino
													Escribir "Sorry not enough cash available"
													//50 000
													Si w_xvk > 0 Entonces			
														b_xvk <- b_xvk + w_xvk
													Fin Si
													//20 000
													Si w_xxk > 0 Entonces			
														b_xxk <- b_xxk + w_xxk
													Fin Si
													//10 000
													Si w_xk > 0 Entonces			
														b_xk <- b_xk + w_xk
													Fin Si
													//5 000
													Si w_vk > 0 Entonces			
														b_vk <- b_vk + w_vk
													Fin Si
													//2 000
													Si w_dk > 0 Entonces			
														b_dk <- b_dk + w_dk
													Fin Si
													//1 000
													Si w_k > 0 Entonces			
														b_k <- b_k + w_k
													Fin Si
													
												Fin Si
											Sino
												Escribir "Not enough funds or invalid amount"
											Fin Si
										Hasta Que w_amount <= value_c Y w_amount MOD 1000 = 0
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
													Leer owner_c
													Limpiar Pantalla
													Escribir Concatenar("Accounts owner name has been changed succesfully: ",owner_c)
												2:
													Escribir "Type the new accounts pass:"
													Leer pass_c
													Limpiar Pantalla
													Escribir Concatenar("Accounts pass has been changed succesfully: ",owner_c)
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
							error<-Verdadero
						Fin Si
					De Otro Modo:
						//no hace nada solo se sale
				Fin Segun
				Si error = Verdadero Entonces
					Limpiar Pantalla
					Escribir "ID or Pass or both incorrect"
					Leer stop
				Fin Si
				
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
								//50 000
								cantidad<-ConvertirATexto(b_xvk)
								Escribir Concatenar("c50 000: ",cantidad)
								
								//20 000
								cantidad<-ConvertirATexto(b_xxk)
								Escribir Concatenar("c20 000: ",cantidad)
								
								//10 000
								cantidad<-ConvertirATexto(b_xk)
								Escribir Concatenar("c10 000: ",cantidad)
								
								//5 000
								cantidad<-ConvertirATexto(b_vk)
								Escribir Concatenar("c5 000: ",cantidad)
								
								//2 000
								cantidad<-ConvertirATexto(b_dk)
								Escribir Concatenar("c2 000: ",cantidad)
								
								//1 000
								cantidad<-ConvertirATexto(b_k)
								Escribir Concatenar("c1 000: ",cantidad)
								Leer stop
							2:
								Limpiar Pantalla
								d_k<-0
								d_dk<-0
								d_vk<-0
								d_xk<-0
								d_xxk<-0
								d_xvk<-0
								d_cash_check<-Falso
								d_amount<-0
								Escribir "Insert bills"
								Escribir "-Insert the quantity of bills for each amount"
								Leer stop
								//50 000
								Repetir
									Limpiar Pantalla
									
									Escribir Concatenar("c50 000"," Bills:")
									Leer d_xvk
								Hasta Que d_xvk >= 0 
								b_xvk <- b_xvk + d_xvk
								d_amount<- d_amount + (50000 * d_xvk)
								
								//20 000
								Repetir
									Limpiar Pantalla
									
									Escribir Concatenar("c20 000"," Bills:")
									Leer d_xxk
								Hasta Que d_xxk >= 0 
								b_xxk <- b_xxk + d_xxk
								d_amount<- d_amount + (20000 * d_xxk)
								
								//10 000
								Repetir
									Limpiar Pantalla
									
									Escribir Concatenar("c10 000"," Bills:")
									Leer d_xk
								Hasta Que d_xk >= 0 
								b_xk <- b_xk + d_xk
								d_amount<- d_amount + (10000 * d_xk)
								//5 000
								Repetir
									Limpiar Pantalla
									
									Escribir Concatenar("c5 000"," Bills:")
									Leer d_vk
								Hasta Que d_vk >= 0 
								b_vk <- b_vk + d_vk
								d_amount<- d_amount + (5000 * d_vk)
								
								//2 000
								Repetir
									Limpiar Pantalla
									
									Escribir Concatenar("c2 000"," Bills:")
									Leer d_dk
								Hasta Que d_dk >= 0 
								b_dk <- b_dk + d_dk
								d_amount<- d_amount + (2000 * d_dk)
								//1 000
								Repetir
									Limpiar Pantalla
									
									Escribir Concatenar("c1 000"," Bills:")
									Leer d_k
								Hasta Que d_k >= 0 
								b_k <- b_k + d_k
								d_amount<- d_amount + (1000 * d_k)
								
								
								Si d_amount = 0
									Limpiar Pantalla
									Escribir "Please insert bills"
								sino 
									d_amount_value<-ConvertirATexto(d_amount)
									Escribir Concatenar("Bills has been inserted successfully: ",d_amount_value)
									//50 000
									atm_value<-atm_value+(50000*b_xvk)
									//20 000
									atm_value<-atm_value+(20000*b_xxk)
									//10 000
									atm_value<-atm_value+(10000*b_xk)
									//5 000
									atm_value<-atm_value+(5000*b_vk)
									//2 000
									atm_value<-atm_value+(2000*b_dk)
									//1 000
									atm_value<-atm_value+(1000*b_k)
									
									atm_value_t<-ConvertirATexto(atm_value)
									Escribir Concatenar("ATM funds: ",atm_value_t)
								Fin Si
								Leer stop
							3:
								Repetir
									Limpiar Pantalla
									again<-Falso
									Escribir "Add new user"
									Escribir "Insert Id"
									Leer id
									Segun id Hacer
										id_a:
											Escribir "Type the new accounts owner name:"
											Leer owner_a
											Escribir "Type the new accounts pass:"
											Leer pass_a
										id_b:
											Escribir "Type the new accounts owner name:"
											Leer owner_b
											Escribir "Type the new accounts pass:"
											Leer pass_b
										id_c:
											Escribir "Type the new accounts owner name:"
											Leer owner_c
											Escribir "Type the new accounts pass:"
											Leer pass_c
										De Otro Modo:
											again<-Verdadero
									Fin Segun
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
