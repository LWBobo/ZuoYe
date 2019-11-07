
# After 触发器
# 1.在lineitem表上定义一个INSERRT触发器，当增加一项订单明细时，自
#    动修改订单orders的totalprice，以保持数据一致性。

   UPDATE lineitem a ,part b SET a.extendedprice=a.linenumber*b.retailprice where a.partkey=b.partkey;
   UPDATE lineitem a ,part b SET a.quantity=a.linenumber*b.retailprice*a.discount*(1+a.tax) where a.partkey=b.partkey;



create trigger trigger2
  after insert on lineitem
   for each row
   begin 
   UPDATE orders a , lineitem b Set a.totalprice = b.quantity where a.orderkey = b.orderkey;
   end;
  
  
   insert into lineitem (orderkey,partkey,suppkey,linenumber,quantity,extendedprice,discount,
  tax,returnflag,linestatus,shipdate,commitdate,receiptdate,shipinstruct,shipmode,comment) values
  (41006,11007,21007,5000,50002500.0,50002500.0,0.99,0.05,'0','1','2019-10-3','2019-10-3','2019-10-5','打包发货',
  '空运','无');
  
  
  
  Before触发器
1.在lineitem表上定义一个BEFORE INSERRT触发器，当插入订单明细项
时，先检查供应表partsupp中的可用数量availqty是否足够。


  create trigger trigger1
  before insert on lineitem
   for each row
   begin 
		declare availqty1 int;
		select availqty into availqty1 from partsupp
			where partkey = new.partkey and suppkey = new.suppkey; 
		if 
		new.linenumber > availqty1
	then
		signal sqlstate 'ERROR' set message_text = '库存不足啦!';
	end if;
   end;
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  