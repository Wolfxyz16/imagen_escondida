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
  function Existe_coordenadas( Img : in T_Imagen ; Fil , Col : in Integer ) return Boolean is
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

  ---------------------------
  -- Pintar Negro | Blanco --
  ---------------------------
  procedure Pintar_Negro( Img : in out T_Imagen ; Fil , Col : in Integer ) is
  begin

    if Img( Fil - 1 , Col - 1 ) = Duda AND Existe_coordenadas( Img , Fil - 1 , Col - 1 ) then
      Img( Fil - 1 , Col - 1 ) := Negro;
    end if;

    if Img( Fil - 1 , Col ) = Duda AND Existe_coordenadas( Img , Fil - 1 , Col ) then
      Img( Fil - 1 , Col ) := Negro; 
    end if;

    if Img( Fil - 1 , Col + 1 ) = Duda AND Existe_coordenadas( Img , Fil - 1 , Col + 1 ) then
      Img( Fil - 1 , Col + 1 ) := Negro;
    end if;

    if Img( Fil , Col - 1 ) = Duda AND Existe_coordenadas( Img , Fil , Col - 1 ) then
      Img( Fil , Col - 1 ) := Negro;
    end if;

    if Img( Fil , Col ) = Duda AND Existe_coordenadas( Img , Fil , Col ) then
      Img( Fil , Col ) := Negro;
    end if;

    if Img( Fil , Col + 1 ) = Duda AND Existe_coordenadas( Img , Fil , Col + 1 ) then
      Img( Fil , Col + 1 ) := Negro;
    end if;

    if Img( Fil + 1 , Col - 1 ) = Duda AND Existe_coordenadas( Img , Fil + 1 , Col - 1 ) then
      Img( Fil + 1 , Col - 1 ) := Negro;
    end if;

    if Img( Fil + 1 , Col ) = Duda AND Existe_coordenadas( Img , Fil + 1 , Col ) then
      Img( Fil - 1 , Col ) := Negro;
    end if;

    if Img( Fil + 1 , Col + 1 ) = Duda AND Existe_coordenadas( Img , Fil + 1 , Col + 1 ) then
      Img( Fil + 1 , Col + 1 ) := Negro;
    end if;

  end Pintar_Negro;

  procedure Pintar_Blanco( Img : in out T_Imagen ; Fil , Col : in Integer ) is
  begin

    if Img( Fil - 1 , Col - 1 ) = Duda AND Existe_coordenadas( Img , Fil - 1 , Col - 1 ) then
      Img( Fil - 1 , Col - 1 ) := Blanco;
    end if;

    if Img( Fil - 1 , Col ) = Duda AND Existe_coordenadas( Img , Fil - 1 , Col ) then
      Img( Fil - 1 , Col ) := Blanco; 
    end if;

    if Img( Fil - 1 , Col + 1 ) = Duda AND Existe_coordenadas( Img , Fil - 1 , Col + 1 ) then
      Img( Fil - 1 , Col + 1 ) := Blanco;
    end if;

    if Img( Fil , Col - 1 ) = Duda AND Existe_coordenadas( Img , Fil , Col - 1 ) then
      Img( Fil , Col - 1 ) := Blanco;
    end if;

    if Img( Fil , Col ) = Duda AND Existe_coordenadas( Img , Fil , Col ) then
      Img( Fil , Col ) := Blanco;
    end if;

    if Img( Fil , Col + 1 ) = Duda AND Existe_coordenadas( Img , Fil , Col + 1 ) then
      Img( Fil , Col + 1 ) := Blanco;
    end if;

    if Img( Fil + 1 , Col - 1 ) = Duda AND Existe_coordenadas( Img , Fil + 1 , Col - 1 ) then
      Img( Fil + 1 , Col - 1 ) := Blanco;
    end if;

    if Img( Fil + 1 , Col ) = Duda AND Existe_coordenadas( Img , Fil + 1 , Col ) then
      Img( Fil - 1 , Col ) := Blanco;
    end if;

    if Img( Fil + 1 , Col + 1 ) = Duda AND Existe_coordenadas( Img , Fil + 1 , Col + 1 ) then
      Img( Fil + 1 , Col + 1 ) := Blanco;
    end if;

  end Pintar_Blanco;

  --------------
  -- Colorear --
  --------------
  procedure Colorear ( Img : in out T_Imagen ; P : in T_Pista ) is
    -- recibe una pista que se puede resolver y pinta la imagen
    contador : T_Contador;
  begin
    Contar_cuadros( Img , P.Fil , P.Col , contador );

    if P.Valor = 0 then -- pintar todas Blancas
      Pintar_Blanco( Img , P.Fil , P.Col);
    
    elsif 
      Es_Esquina( Img , P.Fil , P.Col) AND P.Valor = 4 OR
      Es_Lateral( Img , P.Fil , P.Col ) AND P.Valor = 6 OR
      Es_Interior( Img , P.Fil , P.Col ) AND P.Valor = 9 then
      -- todas las casilla se PINTAN de negro

      Pintar_Negro( Img , P.Fil , P.Col);
    
    elsif P.Valor = contador(3) then -- todas las negras estan pintadas, son blancas las dudas
      Pintar_Blanco( Img , P.Fil , P.Col);

    elsif contador(1) + contador(3) = P.Valor then -- ya se han pintado todas las blancas, hay q pintar negras
    Pintar_Negro( Img , P.Fil , P.Col);


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
      L.Rest( L.Cont + 1 ) := P;
      L.Cont := L.Cont + 1;
    end if;

  end Anadir;

  ------------
  -- Borrar --
  ------------
  procedure Borrar (L: in out T_Lista_E_Pistas; P: in T_Pista) is
    I : Integer := L.Rest'First;
  begin

    loop

      if P = L( I ) then

        L( I .. L.Cont - 1 ) := L( I + 1 .. L.Cont);
        L.Cont := L.Cont - 1;
        exit;

      end if;

      exit when I = L.Cont;

      I := I + 1;

    end loop;

  end Borrar;

  ------------------
  -- Buscar_Pista --
  ------------------
  procedure Buscar_Pista( Lp : in T_Lista_E_Pistas ; Img : in T_Imagen ; P : out T_Pista ) is
    -- P es una pista que se puede aplicar en img
    I : Integer := Lp'First;
  begin

    loop

      exit when I = L.Cont;

      I := I + 1;

    end loop;

  end Buscar_Pista;

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
   procedure Iniciar_Juego ( Ruta : in String ; filas ,columnas : out Integer ; LP :  out T_Lista_E_Pistas )
   is begin

   end Iniciar_Juego;


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
