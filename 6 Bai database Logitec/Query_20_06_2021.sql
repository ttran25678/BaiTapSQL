##	1.	Viết câu truy vấn trả về Tên nước, tên cảng, mã cảng 
		SELECT c.NAME COUNTRY_NAME,
			p.NAME PORT_NAME,
            p.PORT_ID PORT_ID
        FROM COUNTRY c LEFT JOIN PORT p ON c.ID = p.COUNTRY
        ORDER BY c.NAME, p.NAME;
        
##	2.	Viết câu truy vấn trả về thông tin người dùng gồm first name, last name, email, phone, tên nước
		SELECT u.FIRST_NAME,
			u.LAST_NAME,
            u.EMAIl,
            u.PHONE,
            c.NAME AS COUNTRY
        FROM USER u LEFT JOIN COUNTRY c ON u.COUNTRY = c.ID
        ORDER BY c.NAME, u.FIRST_NAME;
##	3.	Viết câu truy vấn trả về thông tin của hành trình (voyage) gồm ID hành trình, tên tuyến (route), 
##		tên tàu, ngày bắt đầu, ngày kết thúc
		SELECT v.VOYAGE_ID,
			r.NAME ROUTE_NAME,
            s.NAME SHIP_NAME,
            v.START_DATE,
            v.END_DATE
        FROM VOYAGE v LEFT JOIN ROUTE r ON v.ROUTE_ID = r.ROUTE_ID
					  LEFT JOIN SHIP s ON v.SHIP_ID = s.SHIP_ID
		ORDER BY r.NAME, s.NAME;

##	4.	Viết câu truy vấn trả về thông tin tất cả shipment của tuyến có tên là 'Prado'
SELECT sh.SHIPMENT_ID,
	sh.CARGO_CONTENT,
    sh.TEQ_QUANTITY,
    sh.TOTAL_COST,
    sh.STATUS,
    vr.ROUTE_NAME
FROM SHIPMENT sh
		LEFT JOIN (SELECT v.VOYAGE_ID, r.NAME ROUTE_NAME, vs.SHIPMENT_ID FROM VOYAGE v, ROUTE r, VOYAGE_SHIPMENT vs
				    WHERE v.ROUTE_ID = r.ROUTE_ID
						AND v.VOYAGE_ID = vs.VOYAGE_ID
						AND r.NAME = 'Prado' ) vr
			ON sh.SHIPMENT_ID = vr.SHIPMENT_ID;
##	5.	Viết câu truy vấn để lấy thông tin của tất cả khách hàng đã có ít nhất 1 đơn hàng
SELECT u.USER_ID, u.FIRST_NAME, u.LAST_NAME
FROM USER u
where u.USER_ID in ( SELECT USER_ID
			FROM USER_SHIPMENT
			WHERE USER_ID is not null
            GROUP BY USER_ID
            HAVING count(USER_ID) >= 1 );

##	5.1	Viết câu truy vấn để lấy thông tin của tất cả khách hàng đã có ít nhất 2 đơn hàng
SELECT u.USER_ID, u.FIRST_NAME, u.LAST_NAME
FROM USER u
where u.USER_ID in ( SELECT USER_ID
			FROM USER_SHIPMENT
			WHERE USER_ID is not null
            GROUP BY USER_ID
            HAVING count(USER_ID) >= 2 );

##	6.	Viết câu truy vấn trả về thông tin của hành trình gồm ID, ngày bắt đầu, ngày kết thúc, tên tuyến, tên tàu,
##		thông tin các shipment của hành trình gồm ID, cargo content, số lượng teq, tổng giá trị, tình trạng
##		nâng cao: lấy thêm thông tin: cảng khởi hàng và cảng đến
select v.VOYAGE_ID, v.START_DATE, v.END_DATE, sub.SHIPMENT_ID, sub.CARGO_CONTENT, sub.TEQ_QUANTITY, sub.TOTAL_COST, sub.IS_DELETED, r.DEST_PORT_ID, r.SOURCE_PORT_ID
from ROUTE r, SHIP s, VOYAGE v join (select vm.VOYAGE_ID, sm.SHIPMENT_ID, sm.CARGO_CONTENT, sm.TEQ_QUANTITY, sm.TOTAL_COST, sm.IS_DELETED
										from VOYAGE_SHIPMENT vm, SHIPMENT sm
                                        where vm.SHIPMENT_ID = sm.SHIPMENT_ID) sub
								on v.VOYAGE_ID = sub.VOYAGE_ID
where v.SHIP_ID = s.SHIP_ID and v.ROUTE_ID = r.ROUTE_ID;

##	Viết câu truy vấn trả về thông tin khách hàng gồm: Full name, 
##	địa chỉ (gồm tên đường, thành phố, bang), phone, email,  tên quốc gia