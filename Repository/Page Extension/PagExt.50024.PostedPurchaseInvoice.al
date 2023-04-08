PageExtension 50024 "Posted Purchase Invoice Ext" extends "Posted Purchase Invoice"
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
        addafter("&Invoice")
        {
            action(PrintInvoice)
            {
                ApplicationArea = all;
                trigger OnAction()
                var
                    PurchInvHeader: Record "Purch. Inv. Header";
                begin
                    PurchInvHeader.RESET;
                    PurchInvHeader.SETRANGE("No.", Rec."No.");
                    REPORT.RUNMODAL(50011, TRUE, TRUE, PurchInvHeader);
                end;


            }
        }


    }
}

