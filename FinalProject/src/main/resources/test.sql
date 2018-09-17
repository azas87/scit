ALTER SEQUENCE buyNum INCREMENT BY 1;


select * from buyList;

delete buyList where weight=4;

select * from BuyList where	buyerId = '2' and saleStatus = 'onSale' order by buyNum asc;

select * from BuyList order by buyNum asc;
                 
update BUYLIST SET SALESTATUS='saleComplete' where buyNum = 2;
UPDATE buylist SET saleStatus = 'saleComplete' WHERE buyNum = #{buyNum};

select 	* from	BuyList where buyerId = #{buyerId}	and	saleStatus = 'onSale' order by buyNum asc;

select * from buylist b, salelist s where b.buynum=s.buynum; 


select 
			b.buyNum,
			fishName,
			buyerId,
			registDate,
			uploadDate,
			deadline,
			weight,
			saleStatus,
			price,
			s.sellerid as successSellerId,
			buyListComment,
			location 
		from BuyList b, SaleList s
		where b.buynum=s.buynum 
		and buyerId = 'id1'
		and saleStatus = 'onSale'	
		order by buyNum asc		;
        
