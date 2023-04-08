TableExtension 50023 TabExtItemLederEntry extends "Item Ledger Entry"
{
    fields
    {

        field(60000; "Order No.1"; Code[20])

        {
            Description = 'GTFS-09.05.2011- To get the balace qty for PO/SO';
        }
        field(60001; "Order Quantity"; Decimal)
        {
            Description = 'GTFS-09.05.2011- To get the balace qty for PO/SO';
        }
        field(60002; "Balance Quantity"; Decimal)
        {
            Description = 'GTFS-09.05.2011- To get the balace qty for PO/SO';
        }

        field(60003; "Order Line No.1"; Integer)

        {
            Description = 'GTFS-09.05.2011- To get the balace qty for PO/SO';
        }
    }
    keys
    {
        key(Key1001; "Item No.", "Source No.")
        {
        }
        key(Key2001; "Item No.", "Location Code")
        {
        }
        key(Key3001; "Order No.", "Item No.", "Order Line No.")
        {
            SumIndexFields = Quantity;
        }

        key(Key4001; "Posting Date", "Item No.")
        {
        }
    }
}

