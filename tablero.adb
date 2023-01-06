package body Tablero is

    type t_casilla is (Duda, Blanco, Negro);

    type t_pista is range 0..8;

    type t_tablero is array ( Integer range <> , Integer range <> ) of t_casilla;

    function get_tablero( X , Y : Positive ) return t_tablero is
        tablero : t_tablero( X , Y );
    begin
        tablero := ( others => ( others => Duda ) );
        return tablero;
    end get_tablero;



end Tablero;