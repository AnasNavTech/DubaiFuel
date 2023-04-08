PageExtension 50022 "Posted Purchase Receipt Ext" extends "Posted Purchase Receipt"
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
    }
    actions
    {
        addafter("&Receipt")
        {
            action(PrintReceipt)
            {
                ApplicationArea = all;
                Caption = 'Print Receipt';
                Image = Print;
                trigger OnAction()
                var
                    PurchRcptHeader: Record "Purch. Rcpt. Header";
                begin
                    PurchRcptHeader.RESET;
                    PurchRcptHeader.SETRANGE(PurchRcptHeader."No.", Rec."No.");
                    REPORT.RUN(50048, TRUE, TRUE, PurchRcptHeader);
                end;


            }
        }

      
    }
}

