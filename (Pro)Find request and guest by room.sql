DECLARE
	lv_roomid GP_RESERVATION.ROOM_ID%TYPE := 3;
	lv_guest_num NUMBER(10);
	lv_request_des VARCHAR2(50);
BEGIN
	DBMS_OUTPUT.PUT_LINE('Let''s begin');
	find_guestnum_sp(lv_roomid, lv_guest_num, lv_request_des);
	DBMS_OUTPUT.PUT_LINE(lv_guest_num);
	DBMS_OUTPUT.PUT_LINE(lv_request_des);
END;