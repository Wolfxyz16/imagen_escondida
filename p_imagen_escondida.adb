package body P_Imagen_Escondida is

  ----------------
  -- Es_Lateral --
  ----------------

  function Es_Lateral(
    Img:in T_Imagen;
    Fil,Col:in Positive) return Boolean
  is
  begin
    return img(fil,fil)=img(col,col);
  end Es_Lateral;

  ----------------
  -- Es_Esquina --
  ----------------

  function Es_Esquina(
    Img:in T_Imagen;
    Fil,Col:in Positive) return Boolean
  is
  begin
    return img(fil,fil)=img(col,col);
  end Es_Esquina;

  -----------------
  -- Es_Interior --
  -----------------

  function Es_Interior(
    Img: in T_Imagen;
    Fil,Col: in Positive)return Boolean
  is
  begin
    return img(fil,fil)=img(col,col);
  end Es_Interior;

   ------------------
   -- Imagen_vacia --
   ------------------

   function Imagen_Vacia (
       Filas,Columnas: in Integer) return T_Imagen is
     I:constant T_Imagen(1..Filas,1..Columnas):=(others=>(others=>Duda));
   begin
      return I;
   end Imagen_vacia;

   -------------
   -- Mostrar --
   -------------

   procedure Mostrar (Img: in T_Imagen) is null;

   --------------------
   -- Contar_cuadros --
   --------------------

   procedure Contar_cuadros
     (Img: in T_Imagen;
      Fil, Col: in Integer;
      Contador: out T_contador)
   is null;

   --------------
   -- Completa --
   --------------

   function Completa (Img: in T_Imagen) return Boolean is
   begin
      return Img = Img;
   end Completa;

   --------------
   -- Colorear --
   --------------

   procedure Colorear (Img: in out T_Imagen; P: in T_Pista) is null;

   -------------
   -- Mostrar --
   -------------

   procedure Mostrar (L: in T_Lista_E_Pistas) is null;

   ------------
   -- Anadir --
   ------------

   procedure Anadir (L: in out T_Lista_E_Pistas; P: in T_Pista) is null;

   ------------
   -- Borrar --
   ------------

   procedure Borrar (L: in out T_Lista_E_Pistas; P: in T_Pista) is null;

   ------------------
   -- Buscar_Pista --
   ------------------

   procedure Buscar_Pista
     (Lp: in T_Lista_E_Pistas;
      Img: in T_Imagen;
      P: out T_Pista)
   is null;

   --------------
   -- longitud --
   --------------

   function longitud (L:in T_Lista_D_Pistas) return Natural is
   begin
      return Boolean'pos(L=null);
   end longitud;

   ------------
   -- Anadir --
   ------------

   procedure Anadir (L: in out T_Lista_D_Pistas; P: in T_Pista) is null;

   ----------------
   -- Concatenar --
   ----------------

   procedure Concatenar (L1,L2: in out T_Lista_D_Pistas) is null;


   -------------
   -- Mostrar --
   -------------

   procedure Mostrar (L: in T_Lista_D_Pistas) is null;


   -------------------
   -- Iniciar_Juego --
   -------------------

   procedure Iniciar_Juego
     (Ruta: in String;
      filas,columnas:  out Integer;
      LP :  out T_Lista_E_Pistas)
   is null;


   -------------------
   -- Guardar_Juego --
   -------------------

   procedure Guardar_Juego
     (filename: in String;
      fils,cols:  in Integer;
      Lp :  in T_Lista_e_Pistas;
      LS :  in T_lista_D_Pistas)
   is null;


   --------------------
   -- Reanudar_Juego --
   --------------------

   procedure Reanudar_Juego
     (filename: in String;
      filas, columnas:  out Integer;
      Lp :  out T_Lista_e_Pistas;
      LS :  out T_lista_D_Pistas)
   is null;


   -------------------------
   -- Es_Posible_Resolver --
   -------------------------

   function Es_Posible_Resolver
     (Img: in T_Imagen;
      P: in T_Pista)
      return Boolean
   is
   begin
     if P.fil=P.col then  --eliminar el doble return
       return Img = Img;
       else
       return Img/=Img;
     end if;
   end Es_Posible_Resolver;

   -------------------
   -- Obtener_Pista --
   -------------------

   procedure Obtener_Pista
     (Filas,Columnas: in Integer;
      Lp: in T_Lista_E_Pistas;
      P: out T_Pista)
   is null;


   --------------
   -- Resolver --
   --------------

   function Resolver
     (Filas, Columnas: in Integer;
      Lp: in T_Lista_E_Pistas)
      return T_Imagen
   is
     I:constant T_Imagen(1..Filas,1..Columnas):=(others=>(others=>Duda));
   begin
      return I;
   end Resolver;

   ------------
   -- Fase_1 --
   ------------

   procedure Fase_1
     (filas, columnas: in Integer;
      Lp:in out T_Lista_E_Pistas;
      Sol: out T_lista_D_Pistas)
   is  null;


   ------------
   -- Fase_2 --
   ------------

   procedure Fase_2
     (filas, columnas: in Integer;
      LP: in out T_Lista_E_Pistas;
      Sol: in out T_Lista_D_Pistas)
   is null;


end P_Imagen_Escondida;
