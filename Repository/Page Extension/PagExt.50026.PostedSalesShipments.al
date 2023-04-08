PageExtension 50026 "Posted Sales Shipments Ext" extends "Posted Sales Shipments"
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

        addafter("Sell-to Country/Region Code")
        {
            field("User ID"; Rec."User ID")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Sell-to Contact")
        {
            field("Order No."; Rec."Order No.")
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {
        addfirst("&Shipment")
        {
            action(Card)
            {
                ApplicationArea = Basic;
                Caption = 'Card';
                Image = EditLines;
                RunPageLink = "No." = field("No.");
                RunObject = Page "Posted Sales Shipment";
                ShortCutKey = 'Shift+F7';
            }
        }
    }


}

