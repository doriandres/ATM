//Estos son los controladores del menu
function tocar(item){
    var id_button=item.id;
    var divider=new Array();
    divider=id_button.split('_');
    var id_new_container=divider[0]+'_container';
    var id_container=divider[2]+'_container';
    desaparius(id_new_container, id_container);
}
function desaparius(id_nc, id_c){
    document.getElementById(id_c).style.display='none';
    aparius(id_nc, id_c);
}
function aparius(id_nc, id_c){
    document.getElementById(id_nc).style.display='block';
}
//Estos son los controladores de los contenidos
function show_contain(item){
    var id_button=item.id;
    var divider=new Array();
    divider=id_button.split('_');
    var id_new_container=divider[0]+'_container';
    var elmts=document.getElementsByClassName("contenido");
    for (var i=0; i< elmts.length; i++){
        document.getElementById(elmts[i].id).style.display="none";
    }    
    document.getElementById(id_new_container).style.display="block";   
}
function reset_contain(){
   var elmts=document.getElementsByClassName("contenido");   
    for (var i=0; i< elmts.length; i++){
        document.getElementById(elmts[i].id).style.display="none";
    }    
    document.getElementById("empty_container").style.display="block";   
}
//Inicializadores de datos
//Datos de los usuarios
var id_a = "1234";
var id_b = "";
var id_c = "";
var name_a="Dorian Andrés";
var name_b="";
var name_c="";
var pass_a="1234";
var pass_b="";
var pass_c="";
var amount_a=35000;
var amount_b=0;
var amount_c=0;
display_users();
//Cantidad de billetes
var b_k=0; //1000
var b_dk=0;//2000
var b_ck=0;//5000
var b_xk=0;//10 000
var b_vk=0;//20 000
var b_lk=0;//50 000
display_bills();
function fill_atm(){
    var item_k=document.getElementById("k_fill");
    var item_dk=document.getElementById("dk_fill");
    var item_ck=document.getElementById("ck_fill");
    var item_xk=document.getElementById("xk_fill");
    var item_vk=document.getElementById("vk_fill");
    var item_lk=document.getElementById("lk_fill");
    var err=false;
    //Verificación de datos
    if (item_k.classList[1]=="valid"){
        if (item_k.value < 0){
          err=true;  
        }
    }else{
        err=true;
    }
    if (item_dk.classList[1]=="valid"){
        if (item_dk.value < 0){
          err=true;  
        }
    }else{
        err=true;
    }
    if (item_ck.classList[1]=="valid"){
        if (item_ck.value < 0){
          err=true;  
        }
    }else{
        err=true;
    }
    if (item_xk.classList[1]=="valid"){
        if (item_xk.value < 0){
          err=true;  
        }
    }else{
        err=true;
    }
    if (item_vk.classList[1]=="valid"){
        if (item_vk.value < 0){
          err=true;  
        }
    }else{
        err=true;
    }
    if (item_lk.classList[1]=="valid"){
        if (item_lk.value < 0){
          err=true;  
        }
    }else{
        err=true;
    }
    if (err==false){
        b_k= item_k.value;
        item_k.value=null;
        b_dk= item_dk.value;
        item_dk.value=null;
        b_ck= item_ck.value;
        item_ck.value=null;
        b_xk= item_xk.value;
        item_xk.value=null;
        b_vk= item_vk.value;
        item_vk.value=null;
        b_lk= item_lk.value;
        item_lk.value=null;   
        Materialize.toast("El ATM se ha llenado exitosamente!", 5000);
        display_bills();
    }else{
        Materialize.toast("Hubo un error al llenar el cajero, por favor revise lo campos e intente de nuevo.", 5000);
    }
}
function display_bills(){
    var t_k=b_k*1000;
    var t_dk=b_dk*2000;
    var t_ck=b_ck*5000;
    var t_xk=b_xk*10000;
    var t_vk=b_vk*20000;
    var t_lk=b_lk*50000;
    var total=t_k+t_dk+t_ck+t_xk+t_vk+t_lk;
    var display= "<tr><td>¢1000</td><td>"+b_k+"</td><td>¢"+t_k+"</td></tr>";
    display+="<tr><td>¢2000</td><td>"+b_dk+"</td><td>¢"+t_dk+"</td></tr>";
    display+="<tr><td>¢5000</td><td>"+b_ck+"</td><td>¢"+t_ck+"</td></tr>";
    display+="<tr><td>¢10 000</td><td>"+b_xk+"</td><td>¢"+t_xk+"</td></tr>";
    display+="<tr><td>¢20 000</td><td>"+b_vk+"</td><td>¢"+t_vk+"</td></tr>";
    display+="<tr><td>¢50 000</td><td>"+b_xk+"</td><td>¢"+t_lk+"</td></tr>";
    display+="<tr><td>Disponibles</td><td></td><td>¢"+total+"</td></tr>"; 
    document.getElementById("atm-query_table").innerHTML=display;
}
function insert_user(){
    var name=document.getElementById("name_input");
    var id=document.getElementById("id_input");
    var pass=document.getElementById("pass_input");
    var amount=document.getElementById("amount_input");
    var err=false;   
    if (name.classList[1]=="valid"){
        if (name.value==null){
            err=true;
        }
    }else{
        err=true
    }
    if (id.classList[1]=="valid"){
        if (id.value==null){
            err=true;
        }
    }else{
        err=true
    }
    if (pass.classList[1]=="valid"){
        if (pass.value==null){
            err=true;
        }
    }else{
        err=true
    }
    if (amount.classList[1]=="valid"){
        if (amount.value<0){
            err=true;
        }
    }else{
        err=true
    }
    if (err==false){
        if (id_b == ""){       
            if (id.value!=id_a){
                id_b=id.value;
                name_b=name.value;
                pass_b=pass.value;
                amount_b=parseInt(amount.value);
                display_users();
                Materialize.toast("Usuario registrado exitosamente!",5000);
            }else{
                 Materialize.toast("La ID que intenta usar ya existe, por favor intente con otra.",5000);
            }
        }else{
            if (id_c == ""){
                if (id.value!=id_a && id.value!=id_b){
                    id_c=id.value;
                    name_c=name.value;
                    pass_c=pass.value;
                    amount_c=parseInt(amount.value);
                    display_users();
                    Materialize.toast("Usuario registrado exitosamente!",5000);
                }else{
                    Materialize.toast("La ID que intenta usar ya existe, por favor intente con otra.",5000);
                 }
            }else{
                Materialize.toast("Lo sentimos nuestros usuarios estan llenos",5000);
            }
        }
    }else{
         Materialize.toast("Hubo un error por favor verifique los campos e intente de nuevo",5000);
    }
    name.value=null;
    id.value=null;
    pass.value=null;
    amount.value=null;
}
function display_users(){
    var display= "<tr><td>"+name_a+"</td><td>"+id_a+"</td><td>¢"+amount_a+"</td></tr>";
    if (id_b!=""){
        display+="<tr><td>"+name_b+"</td><td>"+id_b+"</td><td>¢"+amount_b+"</td></tr>";
    }
    if (id_c!=""){
        display+="<tr><td>"+name_c+"</td><td>"+id_c+"</td><td>¢"+amount_c+"</td></tr>";
    }
    document.getElementById("users-query_table").innerHTML=display;
}
function withdraw(){
    //check credencials
    var id=document.getElementById("withdraw_credencials_id");
    var pass=document.getElementById("withdraw_credencials_pass");   
    if (id.value!=null){
        if (id.value==id_a){
            if (pass.value==pass_a){
                withdraw_exe("a")
            }else{
                pass.value=null;
                Materialize.toast("Contraseña incorrecta",5000);
            }
        }else if (id.value==id_b){
           if (pass.value==pass_b){
                withdraw_exe("b")
            }else{
              pass.value=null;
              Materialize.toast("Contraseña incorrecta",5000);  
            } 
        }else if (id.value==id_c){
            if (pass.value==pass_c){
                withdraw_exe("c")
            }else{
               pass.value=null;    
               Materialize.toast("Contraseña incorrecta",5000); 
            }
        }else{
            Materialize.toast("Usuario no existe",5000);
        }    
    }else{
        Materialize.toast("Debe llenar todos los campos",5000);
    }
}
function deposit(){
    //check credencials
    var id=document.getElementById("deposit_credencials_id");
    var pass=document.getElementById("deposit_credencials_pass");   
    if (id.value!=null){
        if (id.value==id_a){
            if (pass.value==pass_a){
                deposit_exe("a")
            }else{
                pass.value=null;
                Materialize.toast("Contraseña incorrecta",5000);
            }
        }else if (id.value==id_b){
           if (pass.value==pass_b){
                deposit_exe("b")
            }else{
              pass.value=null;
              Materialize.toast("Contraseña incorrecta",5000);  
            } 
        }else if (id.value==id_c){
            if (pass.value==pass_c){
                deposit_exe("c")
            }else{
               pass.value=null;    
               Materialize.toast("Contraseña incorrecta",5000); 
            }
        }else{
            Materialize.toast("Usuario no existe",5000);
        }    
    }else{
        Materialize.toast("Debe llenar todos los campos",5000);
    }
}
function get_value(user){
    switch (user){
        case "a":
            return amount_a;
            break;
        case "b":
            return amount_b;
            break;
        case "c":
            return amount_c;
            break;    
    }
}
function get_name(user){
    switch (user){
        case "a":
            return name_a;
            break;
        case "b":
            return name_b;
            break;
        case "c":
            return name_c;
            break;    
    }
}
function withdraw_exe(user){
    var input=document.getElementById("withdraw_input");
    var id=document.getElementById("withdraw_credencials_id");
    var pass=document.getElementById("withdraw_credencials_pass"); 
    
    var t_amount=input.value;
    var initial_t_amount=t_amount;
    var t_k=0;
    var t_dk=0;
    var t_vk=0;
    var t_xk=0;
    var t_xxk=0;
    var t_xvk=0;
    if (t_amount <= get_value(user)){
        var ne_cash = false;
        if (t_amount > 0){
            if (t_amount >= 50000){
                if (t_amount % 50000 == 0){
                   t_xvk = t_amount / 50000;
                }else{
                   t_xvk = (t_amount - (t_amount % 50000))/50000;
                }
                if (t_xvk > b_lk){
                    t_xvk = b_lk;
                }
                t_amount = t_amount - (t_xvk * 50000); 
            }
        }
        if (t_amount > 0){
            if (t_amount >= 20000){
                if (t_amount % 20000 == 0){
                   t_xxk = t_amount / 20000;
                }else{
                   t_xxk = (t_amount - (t_amount % 20000))/20000;
                }
                if (t_xxk > b_vk){
                    t_xxk = b_vk;
                }
                t_amount = t_amount - (t_xxk * 20000); 
            }
        }
        if (t_amount > 0){
            if (t_amount >= 10000){
                if (t_amount % 10000 == 0){
                   t_xk = t_amount / 10000;
                }else{
                   t_xk = (t_amount - (t_amount % 10000))/10000;
                }
                if (t_xk > b_xk){
                    t_xk = b_xk;
                }
                t_amount = t_amount - (t_xk * 10000); 
            }
        }
        if (t_amount > 0){
            if (t_amount >= 10000){
                if (t_amount % 10000 == 0){
                   t_xk = t_amount / 10000;
                }else{
                   t_xk = (t_amount - (t_amount % 10000))/10000;
                }
                if (t_xk > b_xk){
                    t_xk = b_xk;
                }
                t_amount = t_amount - (t_xk * 10000); 
            }
        }
        if (t_amount > 0){
            if (t_amount >= 5000){
                if (t_amount % 5000 == 0){
                   t_vk = t_amount / 5000;
                }else{
                   t_vk = (t_amount - (t_amount % 5000))/5000;
                }
                if (t_vk > b_ck){
                    t_vk = b_ck;
                }
                t_amount = t_amount - (t_vk * 5000); 
            }
        }
        if (t_amount > 0){
            if (t_amount >= 2000){
                if (t_amount % 2000 == 0){
                   t_dk = t_amount / 2000;
                }else{
                   t_dk = (t_amount - (t_amount % 2000))/2000;
                }
                if (t_dk > b_dk){
                    t_dk = b_dk;
                }
                t_amount = t_amount - (t_dk * 2000); 
            }
        }
        if (t_amount > 0){
            if (t_amount >= 1000){
                if (t_amount % 1000 == 0){
                   t_k = t_amount / 1000;
                }else{
                   t_k = (t_amount - (t_amount % 1000))/1000;
                }
                if (t_k > b_k){
                    ne_cash=true;
                    t_k = b_k;
                }
                t_amount = t_amount - (t_k * 1000); 
            }
        }
        if (ne_cash==false){
            substract_user(initial_t_amount, user);
            input.value=null;
            id.value=null;
            pass.value=null;
            $('#withdraw_modal').modal('close');
            Materialize.toast("Tome su dinero "+get_name(user),10000);
            if (t_xvk > 0){
                b_lk = b_lk - t_xvk;
                Materialize.toast("¢50 000 | Cantidad: "+t_xvk, 10000, "deep-purple darken-1");
            }
            if (t_xxk > 0){
                b_vk = b_vk - t_xxk;
                Materialize.toast("¢20 000 | Cantidad: "+t_xxk, 10000, "amber darken-2");
            }
            if (t_xk > 0){
                b_xk = b_xk - t_xk;
                Materialize.toast("¢10 000 | Cantidad: "+t_xk, 10000, "green accent-3");
            }
            if (t_vk > 0){
                b_ck = b_ck - t_vk;
                Materialize.toast("¢5000 | Cantidad: "+t_vk, 10000, "yellow accent-3");
            }
            if (t_dk > 0){
                b_dk = b_dk - t_dk;
                Materialize.toast("¢2000 | Cantidad: "+t_dk, 10000, "light-blue lighten-2");
            }
            if (t_k > 0){
                b_k = b_k - t_k;
                Materialize.toast("¢1000 | Cantidad: "+t_k, 10000, "red darken-1");
            }
            display_bills();
        }else{
            Materialize.toast("El cajero no cuenta con fondos suficientes", 5000);
            input.value=null;
            id.value=null;
            pass.value=null;
            $('#withdraw_modal').modal('close'); 
        }
    }else{
        Materialize.toast("No cuenta con fondos suficientes",5000);
        input.value=null;
        id.value=null;
        pass.value=null;
        $('#withdraw_modal').modal('close');
    }
}
function deposit_exe(user){
    var input=document.getElementById("deposit_input");
    var id=document.getElementById("deposit_credencials_id");
    var pass=document.getElementById("deposit_credencials_pass");    
    var t_amount=0;
    t_amount = input.value;
    var t_k=0;
    var t_dk=0;
    var t_vk=0;
    var t_xk=0;
    var t_xxk=0;
    var t_xvk=0;
    add_to_user(t_amount, user);
    if (t_amount > 0){
        if (t_amount >= 50000){
            if (t_amount % 50000 == 0){
               t_xvk = t_amount / 50000;
            }else{
               t_xvk = (t_amount - (t_amount % 50000))/50000;
            }
            t_amount = t_amount - (t_xvk * 50000); 
        }
    }
    if (t_amount > 0){
        if (t_amount >= 20000){
            if (t_amount % 20000 == 0){
                 t_xxk = t_amount / 20000;
            }else{
                  t_xxk = (t_amount - (t_amount % 20000))/20000;
             }
                
            t_amount = t_amount - (t_xxk * 20000); 
        }
    }
    if (t_amount > 0){
        if (t_amount >= 10000){
            if (t_amount % 10000 == 0){
                t_xk = t_amount / 10000;
            }else{
                t_xk = (t_amount - (t_amount % 10000))/10000;
            }
            t_amount = t_amount - (t_xk * 10000); 
        }
    }
    if (t_amount > 0){
        if (t_amount >= 10000){
            if (t_amount % 10000 == 0){
                t_xk = t_amount / 10000;
            }else{
                t_xk = (t_amount - (t_amount % 10000))/10000;
            }
            t_amount = t_amount - (t_xk * 10000); 
        }
    }
    if (t_amount > 0){
        if (t_amount >= 5000){
            if (t_amount % 5000 == 0){
                t_vk = t_amount / 5000;
            }else{
                t_vk = (t_amount - (t_amount % 5000))/5000;
            }
            t_amount = t_amount - (t_vk * 5000); 
        }
    }
    if (t_amount > 0){
        if (t_amount >= 2000){
            if (t_amount % 2000 == 0){
                t_dk = t_amount / 2000;
            }else{
                t_dk = (t_amount - (t_amount % 2000))/2000;
            }
            t_amount = t_amount - (t_dk * 2000); 
        }
    }
    if (t_amount > 0){
        if (t_amount >= 1000){
            if (t_amount % 1000 == 0){
                t_k = t_amount / 1000;
            }else{
                t_k = (t_amount - (t_amount % 1000))/1000;
            }
            t_amount = t_amount - (t_k * 1000); 
        }
    }
    b_lk+=t_xvk;
    b_vk+=t_xxk;
    b_xk+=t_xk;
    b_ck+=t_vk;
    b_dk+=t_dk;
    b_k+=t_k;
    display_bills();
     input.value=null;
     id.value=null;
     pass.value=null;
     $('#deposit_modal').modal('close');
     Materialize.toast("Dinero depositado exitosamente "+get_name(user)+"!",5000);
}
function substract_user(amount, user){
    switch (user){
        case "a":
            amount_a-=amount;
            break;
        case "b":
            amount_b-=amount;
            break;
        case "c":
            amount_c-=amount;
            break;    
    }
    display_users();
}
function add_to_user(amount, user){
    var val=parseInt(amount);
    switch (user){
        case "a":
            amount_a+=val;
            break;
        case "b":
            amount_b+=val;
            break;
        case "c":
            amount_c+=val;
            break;    
    }
    display_users();
}
function check_num(elm){
    var id=elm.id;
    var input=document.getElementById(id+"_input");
    if (input.classList[1]=="valid"){
        if (input.value>0 && input.value % 1000 == 0){
            switch (id){
                case "withdraw":
                    $('#withdraw_modal').modal('open');
                    break;
                case "deposit":
                    $('#deposit_modal').modal('open');
                    break;
            }    
        }else{
            Materialize.toast("Cantidad invalida!",5000);
            input.value=null;
        } 
    }else{
        if (input.value==null || input.value == "" || input.value == undefined){
            Materialize.toast("Inserte un monto!",5000);
        }else{
            Materialize.toast("Formato invalido!",5000);
        }
        input.value=null;
    }
}