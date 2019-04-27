CREATE 
	OR REPLACE TRIGGER gp_workorder_trg 
	AFTER UPDATE OF IDNUMBER ON gp_GUEST FOR EACH ROW

DECLARE
	CURSOR gp_reservation_cur IS SELECT
	room_id,
	numberguest,
	totalstays 
	FROM
		gp_reservation ;

	lv_od_des VARCHAR2 ( 50 );
BEGIN
		FOR gp_reservation_rec IN gp_reservation_cur
		LOOP
			IF
				gp_reservation_rec.TOTALSTAYS < 7 THEN
					lv_od_des := ( 'Payment is master' );
			ELSIF
				gp_reservation_rec.TOTALSTAYS >= 7 AND gp_reservation_rec.TOTALSTAYS < 9 THEN
					lv_od_des := ( 'Payment is debit' );
			ELSIF
				gp_reservation_rec.TOTALSTAYS >= 9 AND gp_reservation_rec.TOTALSTAYS < 12 THEN
					lv_od_des := ( 'Payment is paypal' );
			ELSE lv_od_des := ( 'Payment is credit' );
		
			END IF;
		UPDATE gp_workorders 
		SET orderdescription = lv_od_des
		WHERE
			room_id = gp_reservation_rec.room_id;
	
		END LOOP;
END;