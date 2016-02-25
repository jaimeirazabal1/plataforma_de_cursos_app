function archivo(evt) {
      var files = evt.target.files; // FileList object
       
        //Obtenemos la imagen del campo "file". 
      for (var i = 0, f; f = files[i]; i++) {         
           //Solo admitimos imágenes.
           if (!f.type.match('image.*')) {
                continue;
           }
       
           var reader = new FileReader();
           
           reader.onload = (function(theFile) {
               return function(e) {
               // Creamos la imagen.
                      var imagen = document.getElementById("imagen_perfil");
                      document.getElementById("imagen_perfil").src = e.target.result;
                      document.getElementById("imagen_perfil").title = escape(theFile.name);
               };
           })(f);
 
           reader.readAsDataURL(f);
       }
}
             
      document.getElementById('archivo').addEventListener('change', archivo, false);