with p_imagen_escondida, Ada.Text_io, Ada.Integer_Text_IO, Ada.Directories;
use  p_imagen_escondida, Ada.Text_io, Ada.Integer_Text_IO, Ada.Directories;
procedure pruebas is
   -- Este programa se ha creado para probar el paquete de implementacion del laboratorio10
   -- Tu programa no tiene por que parecerse a este, aunque puedes usarlo como base
   -- Los subprogramas tampoco tienen que utilizarse todos
   -- Los formatos de los ficheros son fijos, pero la representacion en pantalla es a tu criterio

   L_Pistas : T_Lista_E_Pistas;
   F , C : Integer;
   Solucion : T_Lista_D_Pistas := null;
   Opcion : Integer;

   type T_nombre_Fichero is record
      name: String(1..100);
      long: Natural;
   end record;

   nombre_fichero : T_nombre_Fichero;

   procedure Seleccionar_fichero ( Extension: in String; nombre_fichero : out T_nombre_Fichero ) is
      Ficheros : Search_Type;
      type T_L_Ficheros is array (1..9) of Directory_Entry_Type;
      L_Juegos : T_L_Ficheros;
      I : Integer;
      Opcion : Integer;
   begin
      loop
      
         I := 0;

         Start_Search( Search => Ficheros,
            Directory => Current_Directory,
            Pattern => "*." & Extension,
            Filter => ( Ordinary_File => True, others => False ) );

         while More_Entries(Ficheros) and I < 9 loop
            I := I + 1;
            Get_Next_Entry( Ficheros , L_Juegos(I) );
            Put(I , 2); Put(" ");
            Put_line( Simple_name( L_Juegos(I) ) );
         end loop;

         New_Line;

         Put("Elige una opcion [0 para salir]->");

         Get(Opcion);

         exit when Opcion in 0 .. I;

         Put_Line( "ERROR: Se esperaba un número entre 0 y" & I'Img );

         New_Line;

      end loop;

      if Opcion > 0 then

         nombre_fichero.long := Base_Name(Simple_Name(L_Juegos(Opcion)))'length;
         nombre_fichero.name(1..nombre_fichero.long) := Base_Name(Simple_Name(L_Juegos(Opcion)));

      end if;
   end Seleccionar_Fichero;

begin
   Put_Line("              :::::::::: ::::::::::: :::        :::                         ");
   Put_Line("              :+:            :+:     :+:        :+:                         ");
   Put_Line("              +:+            +:+     +:+        +:+                         ");
   Put_Line("              :#::+::#       +#+     +#+        +#+                         ");
   Put_Line("              +#+            +#+     +#+        +#+                         ");
   Put_Line("              #+#            #+#     #+#        #+#                         ");
   Put_Line("              ###        ########### ########## ##########                  ");
   Put_Line("                                   :::                                      ");
   Put_Line("                                 :+: :+:                                    ");
   Put_Line("                                +:+   +:+                                   ");
   Put_Line("                 +#++:++#++:++ +#++:++#++: +#++:++#++:++                    ");
   Put_Line("                               +#+     +#+                                  ");
   Put_Line("                               #+#     #+#                                  ");
   Put_Line("                               ###     ###                                  ");
   Put_Line("::::::::: ::::::::::: :::::::: ::::::::::: :::    ::: :::::::::  :::::::::: ");
   Put_Line(":+:    :+:    :+:    :+:    :+:    :+:     :+:    :+: :+:    :+: :+:        ");
   Put_Line("+:+    +:+    +:+    +:+           +:+     +:+    +:+ +:+    +:+ +:+        ");
   Put_Line("+#++:++#+     +#+    +#+           +#+     +#+    +:+ +#++:++#:  +#++:++#   ");
   Put_Line("+#+           +#+    +#+           +#+     +#+    +#+ +#+    +#+ +#+        ");
   Put_Line("#+#           #+#    #+#    #+#    #+#     #+#    #+# #+#    #+# #+#        ");
   Put_Line("###       ########### ########     ###      ########  ###    ### ########## ");

   New_Line(2);

   Put_Line(" -------------------------------------------------------------- ");
   Put_Line("|   _____                 _                              _     |");
   Put_Line("|  / ____|               | |                            | |    |");
   Put_Line("| | (___  _   _  ___ _ __| |_ ___     ___ _ __ __ _  ___| | __ |");
   Put_Line("|  \___ \| | | |/ _ \ '__| __/ _ \   / __| '__/ _` |/ __| |/ / |");
   Put_Line("|  ____) | |_| |  __/ |  | ||  __/  | (__| | | (_| | (__|   <  |");
   Put_Line("| |_____/ \__,_|\___|_|   \__\___|   \___|_|  \__,_|\___|_|\_\ |");
   Put_Line("|                                                              |");
   Put_Line(" --------------------------------------------------------------");                                                    
   Put_Line("     \                             .       .");
   Put_Line("      \                           / `.   .'  '' ");
   Put_Line("       \                  .---.  <    > <    >  .---.");
   Put_Line("        \                 |    \  \ - ~ ~ - /  /    |");
   Put_Line("              _____          ..-~             ~-..-~");
   Put_Line("             |     |   \~~~\.'                    `./~~~/");
   Put_Line("            ---------   \__/                        \__/");
   Put_Line("           .'  O    \     /               /       \  '' ");
   Put_Line("          (_____,    `._.'               |         }  \/~~~/");
   Put_Line("           `----.          /       }     |        /    \__/");
   Put_Line("                 `-.      |       /      |       /      `. ,~~|");
   Put_Line("                     ~-.__|      /_ - ~ ^|      /- _      `..-'   ");
   Put_Line("                          |     /        |     /     ~-.     `-. _  _  _");
   Put_Line("                          |_____|        |_____|         ~ - . _ _ _ _ _>");

   New_Line(2);
   Put_Line("(C)2022 Li Loaiza, Yeray");
   loop
      loop
         Put_Line("+================+");
         Put_Line("| MENU PRINCIPAL |");
         Put_Line("+================+");
         New_Line;
         Put_Line("[1] Resolver juego automaticamente");
         Put_Line("[2] Elegir y jugar a un juego");
         Put_Line("[3] Reanudar juego guardado");
         Put_Line("[4] Guardar juego");
         New_Line;
         Put("Elige una opcion [0 para salir]-> ");
         Get(Opcion);
         exit when Opcion in 0..4;
         Put_Line("ERROR: Se esperaba un numero entre 0 y 4");
         New_Line;
      end loop;

      exit when Opcion = 0;

      case Opcion is
         when 1 =>

            Seleccionar_fichero( "txt" , nombre_fichero );
            Put( "Cargando " & nombre_Fichero.name( 1..nombre_fichero.long ) & "..." ); New_Line;
            Iniciar_Juego( nombre_Fichero.name( 1..nombre_fichero.long ) , F , C , L_Pistas );
            Fase_1( F , C , L_Pistas , Solucion );
            
         when 2 =>

            Seleccionar_fichero( "txt" , nombre_fichero );
            Put( "Cargando " & nombre_Fichero.name( 1..nombre_fichero.long ) & "..." ); New_Line;
            Iniciar_Juego( nombre_Fichero.name( 1..nombre_fichero.long ) , F , C , L_Pistas );
            Fase_2( F , C , L_Pistas , Solucion );

         when 3 =>

            Seleccionar_fichero( "game" , nombre_fichero );
            Put( "Reanudando " & nombre_Fichero.name( 1..nombre_fichero.long ) & "..." ); New_Line;
            Reanudar_Juego( nombre_Fichero.name( 1..nombre_fichero.long ) , F , C , L_Pistas , Solucion );
            Fase_2( F , C , L_Pistas , Solucion );

         when others =>

            --Seleccionar_fichero("game", nombre_fichero);
            --Toma el último nombre de fichero seleccionado
            if exists(compose(Current_Directory,nombre_Fichero.name(1..nombre_fichero.long),"game")) then
               Put_Line("renombrando "& nombre_Fichero.name(1..nombre_fichero.long) &" a "&compose(Current_directory,nombre_Fichero.name(1..nombre_fichero.long),"old.game")&"...");
               rename(compose(Current_Directory, nombre_Fichero.name(1..nombre_fichero.long),"game"),compose(Current_directory,nombre_Fichero.name(1..nombre_fichero.long),"old.game"));
            end if;
            Put_Line("Guardando "&compose(Current_Directory,nombre_Fichero.name(1..nombre_fichero.long),"game"));
            Guardar_Juego(nombre_Fichero.name(1..nombre_fichero.long), F,C,L_Pistas, Solucion);
      
      end case;

   end loop;

   Put_Line("Fin del programa");

end pruebas;