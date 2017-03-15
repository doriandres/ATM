Algoritmo ATM
	//Cuentas
	//Se declaran las columnas de la informaciòn
	Dimension accounts_id(2)
	Dimension accounts_owner(2)
	Dimension accounts_value(2)
	Dimension accounts_pass(2)
	
	//Cantidad de billetes
	Dimension cash(6,1)
	
	//Se asignan informacion por defecto a las cuentas
	accounts_id(0)<-123
	accounts_id(1)<-234
	accounts_id(2)<-345
	
	accounts_owner(0)<-"Guillermo Jimenez"
	accounts_owner(1)<-"Natalia Alfaro"
	accounts_owner(2)<-"Fabian Cordero"
	
	accounts_value(0)<-30000
	accounts_value(1)<-223000 
	accounts_value(2)<-8000
	
	accounts_pass(0)<-9876
	accounts_pass(1)<-8765
	accounts_pass(2)<-7654
	
	//Variables de administracion y seguridad
	Dimension data_reader(1)
	index<-3
	
	// Mensajes para el usuario
	Escribir "Insert your id"
	//Lectura de id
	Leer data_reader(0)
	// Mensajes para el usuario
	Escribir "Insert your pass"
	//Lectura de datos
	Leer data_reader(1)
	
	//Revision 
	Para i<-0 Hasta 2 Con Paso 1 Hacer
		Si data_reader(0)=accounts_id(i) Y data_reader(1)=accounts_pass(i) Entonces
			
			Escribir Concatenar("Welcome ", accounts_owner(i))
			
			Escribir ""
			
			
			
			
			
			
			
			
		Sino
			Escribir "ID or pass are incorrect"
		Fin Si
	Fin Para
	
	
	
	
	
	
	
	
FinAlgoritmo
