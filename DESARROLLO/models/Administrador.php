<?php

class Administrador extends DB{

    public function all(){
        try{

            $stm=parent::conectar()->prepare('SELECT * FROM contratista') ;
            $stm->execute(); 
             return $stm->fetchAll(PDO::FETCH_OBJ);

        }catch(Exception $e)    {

             die($e->getMessage());

        }
    }

   

 public function consultarIDX($id = ''){
     try{       
        $stm = parent::conectar()->prepare("SELECT id_contratista, nombres, apellidos, numero_documento, edad, edad, direccion, email, celular, telefono FROM contratista INNER JOIN tipo_documento ON fk_tipo_documento = tipo_documento.id_tipo_documento INNER JOIN generos ON fk_genero = generos.id_genero INNER JOIN cargo_contratista ON fk_cargo = cargo_contratista.id_cargo_contratista INNER JOIN localidad ON  fk_localidad = localidad.id_localidad INNER JOIN eps ON fk_eps = eps.id_eps INNER JOIN sedes ON fk_sede_contratista = sedes.id_sede AND id_contratista = $id");
         $stm -> execute();
         return $stm->fetch(PDO::FETCH_OBJ);
     }catch(Exception $e){
         die($e->getMessage());
     }
 }

 public function consultarDocumento(){
     try{
        $stm=parent::conectar()->prepare('SELECT * FROM tipo_documento');
        $stm -> execute();
        return $stm->fetchAll(PDO::FETCH_OBJ);
     }catch(Exception $e){
         die($e->getMessage());
     }
 }

 public function consultarGenero(){
    try{
       $stm=parent::conectar()->prepare('SELECT * FROM generos');
       $stm -> execute();
       return $stm->fetchAll(PDO::FETCH_OBJ);
    }catch(Exception $e){
        die($e->getMessage());
    }
}
public function consultarCargo(){
    try{
       $stm=parent::conectar()->prepare('SELECT * FROM cargo_contratista');
       $stm -> execute();
       return $stm->fetchAll(PDO::FETCH_OBJ);
    }catch(Exception $e){
        die($e->getMessage());
    }
}
public function consultarLocalidad(){
    try{
       $stm=parent::conectar()->prepare('SELECT * FROM localidad');
       $stm -> execute();
       return $stm->fetchAll(PDO::FETCH_OBJ);
    }catch(Exception $e){
        die($e->getMessage());
    }
}

public function consultarEps(){
    try{
       $stm=parent::conectar()->prepare('SELECT * FROM eps');
       $stm -> execute();
       return $stm->fetchAll(PDO::FETCH_OBJ);
    }catch(Exception $e){
        die($e->getMessage());
    }
}

public function consultarSede(){
    try{
       $stm=parent::conectar()->prepare('SELECT * FROM sedes');
       $stm -> execute();
       return $stm->fetchAll(PDO::FETCH_OBJ);
    }catch(Exception $e){
        die($e->getMessage());
    }
}

 



    public function registro($Nombres,$Apellidos,$Clave,$Tipo_documento,$Numero_documento,$Genero,$Cargo,$Edad,$Direccion,$Localidad,$Email,$Celular,$Telefono,$Eps,$Sede_contratista){
        try{

            $stm = parent::conectar()->prepare("INSERT INTO contratista(nombres,apellidos,contraseña,fk_tipo_documento,numero_documento,fk_genero,fk_cargo,edad,direccion,fk_localidad,email,celular,telefono,fk_eps,fk_sede_contratista) VALUES('$Nombres','$Apellidos','$Clave','$Tipo_documento','$Numero_documento','$Genero','$Cargo','$Edad','$Direccion','$Localidad','$Email','$Celular','$Telefono','$Eps','$Sede_contratista')");
            $stm -> execute();

        }catch(Exception $e){
             die($e->getMessage());

        }

    }

    public function eliminardato($id){
        try{

            $stm=parent::conectar()->prepare("DELETE FROM contratista WHERE id_contratista = $id");
            $stm->execute();

        }catch(Exception $e){
             die($e->getMessage());
        }
            
    }

    public function updateUsuario($id_contratista,$Nombres,$Apellidos,$Edad,$Direccion,$Localidad,$Email,$Clave,$Celular,$Telefono,$Eps){
        try{

            $stm = parent::conectar()->prepare("UPDATE contratista SET nombres = '$Nombres' , apellidos = '$Apellidos' , edad='$Edad', direccion='$Direccion', fk_localidad = '$Localidad' , email='$Email',contraseña='$Clave' , celular='$Celular' , telefono='$Telefono' , fk_eps='$Eps' WHERE id_contratista = '$id_contratista'");
            $stm->execute();
            
        }catch(Exception $e){
            die($e->getMessage());
        }
    }
}

 


?>