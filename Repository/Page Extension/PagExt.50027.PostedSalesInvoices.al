PageExtension 50027 "Posted Sales Invoices Ext" extends "Posted Sales Invoices"
{


    layout
    {

        modify(Control1900383207)
        {
            Visible = false;
        }
        modify(Control1905767507)
        {
            Visible = false;
        }
        addafter("Sell-to Customer Name")
        {
            field("Payment Method Code"; Rec."Payment Method Code")
            {
                ApplicationArea = Basic;
            }
            field("Order Date"; Rec."Order Date")
            {
                ApplicationArea = Basic;
            }

        }
    }


}

