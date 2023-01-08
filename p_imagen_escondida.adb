with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Directories;
use  Ada.Text_IO, Ada.Integer_Text_IO, Ada.Directories;

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
  function Imagen_Vacia ( Filas , Columnas : in Positive ) return T_Imagen is
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
    prueba : boolean := Fil - 1 in Img'Range(1);
  begin

    for I in Fil - 1 .. Fil + 1 loop
      for J in Col - 1 .. Col + 1 loop
        if Existe_coordenadas( Img , I , J ) then

          case Img( I , J ) is
            when Duda =>

              Contador(Duda) := Contador(Duda) + 1;

            when Blanco =>

              Contador(Blanco) := Contador(Blanco) + 1;

            when Negro =>

              Contador(Negro) := Contador(Negro) + 1;

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

    if Existe_coordenadas( Img , Fil - 1 , Col - 1 ) then
    
      if Img( Fil - 1 , Col - 1 ) = Duda then
        Img( Fil - 1 , Col - 1 ) := Negro;
      end if;

    end if;

    if Existe_coordenadas( Img , Fil - 1 , Col ) then
    
      if Img( Fil - 1 , Col ) = Duda then
        Img( Fil - 1 , Col ) := Negro; 
      end if;

    end if;

    if Existe_coordenadas( Img , Fil - 1 , Col + 1 ) then
    
      if Img( Fil - 1 , Col + 1 ) = Duda then
        Img( Fil - 1 , Col + 1 ) := Negro;
      end if;

    end if;

    if Existe_coordenadas( Img , Fil , Col - 1 ) then
    
      if Img( Fil , Col - 1 ) = Duda then
        Img( Fil , Col - 1 ) := Negro;
      end if;

    end if;

    if Existe_coordenadas( Img , Fil , Col ) then
    
      if Img( Fil , Col ) = Duda then
        Img( Fil , Col ) := Negro;
      end if;

    end if;

    if Existe_coordenadas( Img , Fil , Col + 1 ) then
    
      if Img( Fil , Col + 1 ) = Duda then
        Img( Fil , Col + 1 ) := Negro;
      end if;

    end if;

    if Existe_coordenadas( Img , Fil + 1 , Col - 1 ) then
    
      if Img( Fil + 1 , Col - 1 ) = Duda then
        Img( Fil + 1 , Col - 1 ) := Negro;
      end if;

    end if;

    if Existe_coordenadas( Img , Fil + 1 , Col ) then
    
      if Img( Fil + 1 , Col ) = Duda then
        Img( Fil + 1 , Col ) := Negro;
      end if;

    end if;

    if Existe_coordenadas( Img , Fil + 1 , Col + 1 ) then
    
      if Img( Fil + 1 , Col + 1 ) = Duda then
        Img( Fil + 1 , Col + 1 ) := Negro;
      end if;

    end if;

  end Pintar_Negro;

  procedure Pintar_Blanco( Img : in out T_Imagen ; Fil , Col : in Integer ) is
  begin

    if Existe_coordenadas( Img , Fil - 1 , Col - 1 ) then
    
    if Img( Fil - 1 , Col - 1 ) = Duda then
      Img( Fil - 1 , Col - 1 ) := Blanco;
    end if;

    end if;

    if Existe_coordenadas( Img , Fil - 1 , Col ) then
    
    if Img( Fil - 1 , Col ) = Duda then
      Img( Fil - 1 , Col ) := Blanco; 
    end if;

    end if;

    if Existe_coordenadas( Img , Fil - 1 , Col + 1 ) then
    
    if Img( Fil - 1 , Col + 1 ) = Duda then
      Img( Fil - 1 , Col + 1 ) := Blanco;
    end if;

    end if;

    if Existe_coordenadas( Img , Fil , Col - 1 ) then
    
    if Img( Fil , Col - 1 ) = Duda then
      Img( Fil , Col - 1 ) := Blanco;
    end if;

    end if;

    if Existe_coordenadas( Img , Fil , Col ) then
    
    if Img( Fil , Col ) = Duda then
      Img( Fil , Col ) := Blanco;
    end if;

    end if;

    if Existe_coordenadas( Img , Fil , Col + 1 ) then
    
    if Img( Fil , Col + 1 ) = Duda then
      Img( Fil , Col + 1 ) := Blanco;
    end if;

    end if;

    if Existe_coordenadas( Img , Fil + 1 , Col - 1 ) then
    
    if Img( Fil + 1 , Col - 1 ) = Duda then
      Img( Fil + 1 , Col - 1 ) := Blanco;
    end if;

    end if;

    if Existe_coordenadas( Img , Fil + 1 , Col ) then
    
    if Img( Fil + 1 , Col ) = Duda then
      Img( Fil - 1 , Col ) := Blanco;
    end if;

    end if;

    if Existe_coordenadas( Img , Fil + 1 , Col + 1 ) then
    
    if Img( Fil + 1 , Col + 1 ) = Duda then
      Img( Fil + 1 , Col + 1 ) := Blanco;
    end if;

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
      (Es_Esquina( Img , P.Fil , P.Col) AND P.Valor = 4) OR
      (Es_Lateral( Img , P.Fil , P.Col ) AND P.Valor = 6) OR
      (Es_Interior( Img , P.Fil , P.Col ) AND P.Valor = 9) then
      -- todas las casilla se PINTAN de negro

      Pintar_Negro( Img , P.Fil , P.Col);
    
    elsif P.Valor = contador(Negro) then -- todas las negras estan pintadas, son blancas las dudas
      Pintar_Blanco( Img , P.Fil , P.Col);

    elsif contador(Duda) + contador(Negro) = P.Valor then -- ya se han pintado todas las blancas, hay q pintar negras
      Pintar_Negro( Img , P.Fil , P.Col);

    end if;

  end Colorear;

  -------------
  -- Mostrar --
  -------------
  procedure Mostrar ( L : in T_Lista_E_Pistas ) is
  begin

    Put_Line("Pistas: ");

    for I in L.Rest'First .. L.Cont loop

      Put_Line("Posición: (fila, columna)");
      Put( L.Rest(I).Fil ); Put(","); Put( L.Rest(I).Col );
      
      New_line;

      Put("Valor: "); Put(L.Rest(I).Valor);

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

      if P = L.Rest( I ) then

        L.Rest( I .. L.Cont - 1 ) := L.Rest( I + 1 .. L.Cont);
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
    -- Si devuelve una pista con valor Integer'First es que no hay mas pista que se puedan resolver
    I : Integer := Lp.Rest'First;
    pista : T_Pista := ( 1 , 1 , Integer'First );
  begin

    loop

      if Es_Posible_Resolver( Img , Lp.Rest(I) ) then
        pista := Lp.Rest(I);
        exit;
      end if;

      exit when I = Lp.Cont;

      I := I + 1;

    end loop;

    P := pista;

  end Buscar_Pista;

  --------------
  -- longitud --
  --------------
  function longitud( L : in T_Lista_D_Pistas ) return Natural is
    aux : T_Lista_D_Pistas := L;
    contador : Natural := 0;
  begin

    while aux /= null loop

      contador := contador + 1;

      aux := aux.Sig;

    end loop;

    return contador;

  end longitud;

  ------------
  -- Anadir --
  ------------
  procedure Anadir ( L : in out T_Lista_D_Pistas ; P : in T_Pista ) is
    aux : T_Lista_D_Pistas := L;
  begin

    loop

      if aux.Sig = null then
        aux.Sig := new T_Nodo_Pista'( P , null );
        exit;
      end if;

      aux := aux.Sig;

    end loop;

  end Anadir;

  ----------------
  -- Concatenar --
  ----------------
  procedure Concatenar ( L1 , L2 : in out T_Lista_D_Pistas ) is
    aux_l1 : T_Lista_D_Pistas := L1;
  begin

    loop

      if aux_l1.Sig = null then
        aux_l1.Sig := new T_Nodo_Pista'( L2.Pista , L2.Sig );
        exit;
      end if;

      aux_l1 := aux_l1.Sig;

    end loop;

  end Concatenar;


  -------------
  -- Mostrar --
  -------------
  procedure Mostrar ( L : in T_Lista_D_Pistas ) is
    aux : T_Lista_D_Pistas := L;
  begin

    while aux /= null loop

      Put_Line("Posición: (fila, columna)");
      Put( L.Pista.Fil ); Put(", ");
      Put( L.Pista.Col );
      
      New_line;

      Put("Valor: "); Put( L.Pista.Valor );

      New_line(2);

      aux := aux.Sig;

    end loop;

  end Mostrar;


  -------------------
  -- Iniciar_Juego --
  -------------------
  procedure Iniciar_Juego ( Ruta : in String ; filas , columnas : out Integer ; LP : out T_Lista_E_Pistas ) is
    F : File_Type;
    Caracter : Character;
    L : T_Lista_E_Pistas := (Cont => 0 , Rest => ( others => (Fil => 1, Col => 1, Valor => Integer'First) ) );
    indice : Integer := Lp.Rest'First;
  begin
    Open( F , In_File , Ruta & ".txt" );
    Get( F , filas );
    Get( F , columnas ); 
    Skip_Line( F );

    for I in 1..filas loop

      for J in 1..columnas loop

        Get( F, Caracter );

        if Caracter /= '.' then

          Lp.Rest( indice ) := ( Fil => I, Col => J, Valor => Integer'Value( ( 1 => Caracter ) ) );

          Lp.Cont := Lp.Cont + 1;

          indice := indice + 1;

        end if;


      end loop;

      Skip_Line(F);
      
    end loop;

    Close(F);

  end Iniciar_Juego;


  -------------------
  -- Guardar_Juego --
  -------------------
  procedure Guardar_Juego( filename : in String ; fils , cols : in Integer ; Lp : in T_Lista_E_Pistas ; Ls : in T_lista_D_Pistas) is
    F : File_Type;
    pistas_length : Natural := Lp.Cont;
    aux : T_Lista_D_Pistas := Ls;
  begin
    Create( F , In_File , filename & ".txt" );
    Put( F , fils );
    Put( F , cols );

    Skip_Line( F );

    Put( F , pistas_length );

    for I in 1..pistas_length loop

      Put( F , Lp.Rest(I).Fil );
      Put( F , Lp.Rest(I).Col );
      Put( F , Lp.Rest(I).Valor );
      
    end loop;

    Skip_Line(F);

    while aux /= null loop
      Put( F , aux.Pista.Fil );
      Put( F , aux.Pista.Col );
      Put( F , aux.Pista.Valor );

      aux := aux.Sig;
    end loop;

    Close(F);
  end Guardar_Juego;


  --------------------
  -- Reanudar_Juego --
  --------------------
  procedure Reanudar_Juego( filename : in String ; filas , columnas : out Integer ; Lp : out T_Lista_e_Pistas ; LS : out T_lista_D_Pistas ) is
    F : File_Type;
    pistas_length : Natural := Lp.Cont;
    aux : T_Lista_D_Pistas := Ls;
  begin
    Open( F , In_File , filename & ".txt" );
    Get( F , filas );
    Get( F , columnas );

    Skip_Line( F );

    Get( F , pistas_length );

    for I in 1..pistas_length loop

      Get( F , Lp.Rest(I).Fil );
      Get( F , Lp.Rest(I).Col );
      Get( F , Lp.Rest(I).Valor );
      
    end loop;

    Skip_Line(F);

    while aux /= null loop
      Get( F , aux.Pista.Fil );
      Get( F , aux.Pista.Col );
      Get( F , aux.Pista.Valor );

      aux := aux.Sig;
    end loop;

    Close(F);
  end Reanudar_Juego;


  -------------------------
  -- Es_Posible_Resolver --
  -------------------------
  function Es_Posible_Resolver( Img : in T_Imagen ; P : in T_Pista ) return Boolean is
    contador : T_Contador;
  begin
    Contar_cuadros( Img , P.Fil , P.Col , contador );

    if Existe_coordenadas( Img , P.Fil , P.Col) then

      if  (P.Valor = 0) OR
          (Es_Esquina( Img , P.Fil , P.Col) AND P.Valor = 4) OR
          (Es_Lateral( Img , P.Fil , P.Col ) AND P.Valor = 6) OR
          (Es_Interior( Img , P.Fil , P.Col ) AND P.Valor = 9) OR
          (P.Valor = contador(Negro)) OR
          (contador(Duda) + contador(Negro) = P.Valor) 
          then

        return True;

      end if;

    end if;

    return False;
  end Es_Posible_Resolver;

  -------------------
  -- Obtener_Pista --
  -------------------
  procedure Obtener_Pista( Filas , Columnas : in Integer ; Lp : in T_Lista_E_Pistas ; P : out T_Pista ) is
    fila_teclado , columna_teclado : Integer;
    I : Integer := Lp.Rest'First;
  begin

    loop
      Put("Número de fila: "); Get( fila_teclado ); New_Line;
      Put("Número de columna: ");Get( columna_teclado ); New_Line;

      exit when fila_teclado in 1 .. Filas AND columna_teclado in 1 .. Columnas;

      Put_Line("Debe insertar un número dentro de los rangos.");

    end loop;

    -- Recorremos la lista estática para encontrar la primera pista con la fila y columna indicada

    loop 

      if Lp.Rest(I).Fil = fila_teclado AND Lp.Rest(I).Col = columna_teclado then
        P := Lp.Rest(I);
        exit;
      end if;

      exit when I > Lp.Cont;

      I := I + 1;

    end loop;

  end Obtener_Pista;


  --------------
  -- Resolver --
  --------------
  function Resolver( Filas , Columnas : in Integer ; Lp : in T_Lista_E_Pistas ) return T_Imagen is
    I : T_Imagen( 1..Filas , 1..Columnas ) := ( others => ( others => Duda ) );
    J : Integer := Lp.Rest'First;
    pista : T_Pista;
    salir : Boolean := False;
  begin

    while not Completa(I) AND not salir loop

      pista := Lp.Rest(J);

      Buscar_Pista( Lp, I, pista );
      Colorear( I , pista );

      if pista.Valor = Integer'First OR J > Lp.Cont then
        Put_Line("No hay más pistas para resolver");
        salir := True;
      end if;

      J := J + 1;

    end loop;

    return I;
  end Resolver;

  ------------
  -- Fase_1 --
  ------------
  procedure Fase_1( filas , columnas : in Integer ; Lp : in out T_Lista_E_Pistas ; Sol : out T_lista_D_Pistas ) is
    imagen : T_Imagen := Imagen_vacia( filas , columnas );

  begin

    Mostrar( imagen );

    Mostrar( Lp );

    Put_Line("Resolviendo...");

    while not Completa( imagen ) loop

      imagen := Resolver( filas , columnas , Lp );

    end loop;

    Mostrar( imagen );

  end Fase_1;


  ------------
  -- Fase_2 --
  ------------
  procedure Fase_2( filas , columnas : in Integer ; LP : in out T_Lista_E_Pistas ; Sol : in out T_Lista_D_Pistas ) is
  begin
    null;
  end Fase_2;


end P_Imagen_Escondida;
