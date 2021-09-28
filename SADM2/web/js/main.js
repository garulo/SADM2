/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

window.addEventListener('load', function(){
    
    document.getElementById('btniniciar').addEventListener('click', function (){
        
        var usuario = document.getElementById('txtUsuario').value;
        var pass = document.getElementById('txtPassword').value;
        
        var ban = false;
        
        if(usuario.length > 0 && pass.length > 0){
            ban = true;
        }
        
        if (ban){
           document.getElementById('formlogin').submit();            
        } else{
            alert('Favor de introducir Usuario y Contraseña')
        }
        
    });    
}); 

