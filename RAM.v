module  RAM #( parameter MEM_DEPTH = 256,
               parameter ADDR_SIZE = 8)
             ( output reg [7:0] dout,
               output reg tx_valid,
               input [9:0] din,
               input clk,rst_n,rx_valid);
   reg [ADDR_SIZE-1:0] ram [MEM_DEPTH-1:0] ;
   reg [ADDR_SIZE-1:0] w_addr,r_addr;
   always @(posedge clk) begin
      if (!rst_n) begin
         dout <= 0;
         tx_valid <= 0;
      end            
      else if (rx_valid) begin
        if (din[9:8] == 2'b00) begin
            w_addr <= din[7:0];
            tx_valid <= 0;
        end
        else if (din[9:8] == 2'b01) begin
            ram[w_addr] <= din[7:0];
            tx_valid <= 0;
        end 
        else if (din[9:8] == 2'b10) begin
            r_addr <= din[7:0];
            tx_valid <= 0;
        end 
        else if (din[9:8] == 2'b11) begin
            dout <= ram[r_addr];
            tx_valid <= 1;
        end         
     end
   end  
endmodule