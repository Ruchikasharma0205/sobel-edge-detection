`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.11.2019 09:18:31
// Design Name: 
// Module Name: edge
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////
////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.11.2019 12:22:19
// Design Name: 
// Module Name: test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module test(
     output reg  startr,starts,endr,ends,startw,endw

    
    );
     reg pix [0:512*512-1];
     reg temp [0:511];
    // reg edges [0:37*37-1];
    reg clk;
   initial begin
	   clk=0;
	   forever #5 clk=~clk;
    end
	   integer img;
    integer ir,jr,iw,jw;
    integer i,j;
     integer gx,gy,g;
    integer p11,p12,p13,p21,p23,p31,p32,p33;
    reg [0:509*509-1]edg;
    integer result;
    initial begin
     img=$fopen("/home/ruchika/Downloads/data6.txt","r");
      result=$fopen("/home/ruchika/res6666img.txt","w");
    end
    initial
    begin
        startr=1;
        endr=0;
        starts=0;
        ends=0;
        startw=0;
        endw=0;
    end
    
    
    
    always @(*)
    begin:loop
       // if(startr==1&endr==0&starts==0&ends==0)
      //  begin
//            reg [7 : 0]   total_memory [0 : sizeOfLengthReal-1];
    //reg [0:512*512l-1]pix;
  
   
       
            for(ir=0;ir<512;ir=ir+1)
            begin
                $fscanf(img,"%d",temp);
               // $display(temp);
                for(jr=0;jr<512;jr=jr+1)
                begin
                            pix[512*ir+jr]=temp[jr];
                        
                    //end
//                        $fscanf(img,"%d ");
                    //$display(pix[40*ir+jr],ir,jr);
                end
                $fscanf(img,"\n");
            end
//                if(!$feof(img))
//                begin
//                    $fscanf(img,"%d",pix);
//                    $display(pix);
//                end
                            //if(i==512&j==512) begin
                endr=1;
                starts=1;
                ir=0;
                jr=0;
                
            //end
        
        
       // end
   // end
            if(endr==1)
            begin
                 startr=0;
                 starts=1;
            for(i=0;i<510;i=i+1)
            begin
                for(j=0;j<510;j=j+1)
                begin
                    p11=pix[i*512+j];
                    p12=pix[i*512+j+1];
                    p13=pix[i*512+j+2];
                    p21=pix[(i+1)*512+j];
                    p23=pix[(i+1)*512+j+2];
                    p31=pix[(i+2)*512+j];
                    p32=pix[(i+2)*512+j+1];
                    p33=pix[(i+2)*512+j+2];
                    gx=(p31+2*p32+p33)-(p11+2*p12+p13);
                    gy=(p13+2*p23+p33)-(p11+2*p21+p31);
                    if(gx<0)
                        gx=gx-2*gx;
                    if(gy<0)
                        gy=gy-2*gy;
                    g=gx+gy>4?1:0;
                    edg[i*509+j]=g;   
                end
            end
//             if(i==38&j==39) begin
//                 ends=1;
//                 startw=1;
//             end
             end
        
                // if(ends==1&startw==1)
                 //begin
                     starts=0; 
                    // write(edges,startw,endw);
                    for(iw=0;iw<509;iw=iw+1)
                     begin
                         for(jw=0;jw<509;jw=jw+1)
                          begin 
                            //if(edg[i*36+j]!="x")
                            //begin
                             $fwrite(result,"%d",edg[iw*509+jw]);
                             $display("write",edg[iw*509+jw]);
                            //end
                          end
                          $fwrite(result,"\n");
                    end 
                  if(i==509&j==509)
                   begin
                        startw=0;
                        endw=1;
                        disable loop;
                        
                   end  
                  
                     
                 //end
               $fclose(result);
     end
    
    
//    always @(posedge clk)
//    begin:loop
//        if(startr==1&endr==0&starts==0&ends==0)
//        begin
//            read(pix,startr,endr);
        
    
endmodule
