module bidir_buffer(
    inout wire bus,         // Shared bus line
    input wire data_in,     // Data to be sent to bus
    output wire data_out,   // Data received from bus
    input wire ctrl         // Direction control: 1 = output to bus, 0 = input from bus
);
    assign bus = ctrl ? data_in : 1'bz;
    assign data_out = bus;
endmodule
