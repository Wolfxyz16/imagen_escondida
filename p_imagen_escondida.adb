package body P_Imagen_Escondida is

  ----------------
  -- Es_Lateral --
  ----------------
  function Es_Lateral( Img : in T_Imagen ; Fil , Col : in Positive ) return Boolean is
  begin

    if ( Fil = Img'First(1) OR Fil = Img'First(2) ) 
    OR ( Col = Img'Last(1) OR Col = Img'Last(2) ) then
      return True;
    end if;

    return False;

  end Es_Lateral;

  ----------------
  -- Es_Esquina --
  ----------------
  function Es_Esquina( Img : in T_Imagen ; Fil , Col : in Positive ) return Boolean is
  begin

    if ( Fil = Img'First(1) OR Fil = Img'First(2) ) 
    AND ( Col = Img'Last(1) OR Col = Img'Last(2) ) then
      return True;
    end if;

    return False;
  
  end Es_Esquina;

  -----------------
  -- Es_Interior --
  -----------------
  function Es_Interior( Img : in T_Imagen ; Fil , Col : in Positive ) return Boolean is
  begin

    if not ( Fil = Img'First(1) OR Fil = Img'First(2) ) 
    AND not ( Col = Img'Last(1) OR Col = Img'Last(2) ) then
      return True;
    end if;

    return False;

  end Es_Interior;

  ------------------
  -- Imagen_vacia --
  ------------------
  function Imagen_Vacia ( Filas , Columnas : in Integer ) return T_Imagen is
    I : constant T_Imagen( 1 .. Filas , 1 .. Columnas ) := ( others => ( others => Duda ) );
  begin
    return I;
  end Imagen_vacia;

  -------------
  -- Mostrar --
  -------------
  procedure Mostrar ( Img : in T_Imagen ) is
  begin

    for I in Img'Range(1) loop
      for J in Img'Range(2) loop
        
        if Img( I , J ) = Negro then
          Put("■");

        elsif Img( I , J ) = Blanco then
          Put("⛶");

        else
          Put("⁇");

        end if;

      end loop;
      New_line;
    end loop;

  end Mostrar;

  ------------------------
  -- Existe_coordenadas --
  ------------------------
  function Existe_coordenadas(Img : in T_Imagen ; Fil , Col : in Integer) return Boolean is
  begin

    if Fil in Img'Range(1) AND Col in Img'Range(2) then
      return True;
    end if;

    return False;

  end Existe_coordenadas;

  --------------------
  -- Contar_cuadros --
  --------------------
  procedure Contar_cuadros(Img : in T_Imagen ; Fil , Col : in Integer ; Contador : out T_contador) is
  begin

    for I in Fil - 1 .. Fil + 1 loop
      for J in Col -1 .. Col + 1 loop
        if Existe_coordenadas( Img , Fil , Col ) then

          case Img( I , J ) is
            when Duda =>

              Contador(1) := Contador(1) + 1;

            when Blanco =>

              Contador(2) := Contador(2) + 1;

            when Negro =>

              Contador(3) := Contador(3) + 1;

          end case;

        end if;
      end loop;
    end loop;

  end Contar_cuadros;

  --------------
  -- Completa --
  --------------
  function Completa (Img: in T_Imagen) return Boolean is
  begin
    for I in Img'Range(1) loop
      for J in Img'Range(2) loop
        
        if Img( I , J ) = Duda then
          return False;
        end if;

      end loop;
    end loop;

    return True;
  end Completa;

  --------------
  -- Colorear --
  --------------
  procedure Colorear ( Img : in out T_Imagen ; P : in T_Pista ) is
    contador : T_Contador;
  begin
    Contar_cuadros( Img , P.Fil , P.Col , contador );

    if P.Valor = contador(3) then -- hay tantas

    end if;

  end Colorear;

  -------------
  -- Mostrar --
  -------------
  procedure Mostrar (L: in T_Lista_E_Pistas) is
  begin

    Put_Line("Pistas: ");

    for I in L.Rest'First .. L.Cont loop

      Put_Line("Posición: (fila, columna)");
      Put( L.Rest(1) & ", " & L.Rest(2) );
      
      New_line;

      Put("Valor: " & L.Rest(3) );

      New_line(2);

    end loop;

  end Mostrar;

  ------------
  -- Anadir --
  ------------
  procedure Anadir (L: in out T_Lista_E_Pistas; P: in T_Pista) is
  begin

    if L.Cont < L.Rest'Length then
      
    end if;

  end Anadir;

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
