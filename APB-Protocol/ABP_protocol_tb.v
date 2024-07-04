module tb;

reg p_clk,
    p_rst_n,
    p_write,
    p_enable,
    p_sel;

reg [31:0]p_w_data;
reg [1:0]p_addr;

wire p_ready,p_slv_err;
wire [31:0]p_r_data;

apb_slave dut(.p_ready(p_ready),
              .p_slv_err(p_slv_err),
              .p_r_data(p_r_data),
              .p_clk(p_clk),
              .p_rst_n(p_rst_n),
              .p_w_data(p_w_data),
              .p_write(p_write),
              .p_enable(p_enable),
              .p_sel(p_sel),
              .p_addr(p_addr));

initial p_clk=0;
 always #10 p_clk=~p_clk;

initial
 begin
 p_rst_n=1;
 @(posedge p_clk) p_rst_n=0;
 @(posedge p_clk) p_rst_n=1;
 end

initial
 begin
 #2000;
 $finish;
 end

initial
 begin

//READ - WRITE//

write_data(2'b10,32'd16);
read_data(2'b10);

//READ - ONLY//

write_data(2'b00,32'd20);
read_data(2'b00);

//WRITE - ONLY//

write_data(2'b01,32'd22);
read_data(2'b01);

//FIXED - VALUE//

write_data(2'b11,32'd20);
read_data(2'b11);

 end

//---------write data task-------//
task write_data(
 input [1:0] address,
 input [31:0]data);
 begin

  p_write<=0;
 repeat(3) @(posedge p_clk);
 p_sel<=1;
 p_enable<=0;

 //---------setup
 @(posedge p_clk)
 p_enable<=1;
 p_write<=1;
 p_addr<=address;
 p_w_data<=data;

 @(posedge p_clk)
 p_enable<=0;
 p_sel<=0;
 end
endtask
//-----------------------------//

//---------read data task-------//
task read_data(
 input [1:0] address);
 begin

  p_write<=0;
 repeat(3) @(posedge p_clk);
 p_sel<=1;
 p_enable<=0;

 //---------setup
 @(posedge p_clk)
 p_enable<=1;
 p_write<=0;
 p_addr<=address;

 @(posedge p_clk)
 p_enable<=0;
 p_sel<=0;
 end
endtask
//-----------------------------//


endmodule
