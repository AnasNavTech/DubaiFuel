PageExtension 50009 "Sales List Ext" extends "Sales List"
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
        addafter("External Document No.")
        {


            field("Shipment Date"; Rec."Shipment Date")
            {
                ApplicationArea = Basic;
            }

        }
    }
    actions
    {

        modify("Sales Reservation Avail.")
        {
            Visible = false;
        }
    }
}

