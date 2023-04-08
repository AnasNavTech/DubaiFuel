PageExtension 50028 "Posted Purchase Receipts Ext" extends "Posted Purchase Receipts"
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
        addafter("Buy-from Vendor Name")
        {
            field("Order No."; Rec."Order No.")
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {
        addfirst("&Receipt")
        {
            action(Card)
            {
                ApplicationArea = Basic;
                Caption = 'Card';
                Image = EditLines;
                RunPageLink = "No." = field("No.");
                RunObject = Page "Posted Purchase Receipt";
                ShortCutKey = 'Shift+F7';
            }
        }
    }


}

