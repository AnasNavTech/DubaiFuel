PageExtension 50034 "Blanket Purchase Order Ext" extends "Blanket Purchase Order"
{


    Caption = 'Purchase Order';
    layout
    {

        modify(Control1901138007)
        {
            Visible = false;
        }
        modify(Control1904651607)
        {
            Visible = false;
        }
        modify(Control1900383207)
        {
            Visible = false;
        }
        modify(Control1905767507)
        {
            Visible = false;
        }
        addafter("Buy-from Contact")
        {
            field("Posting Date"; Rec."Posting Date")
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {
        modify(MakeOrder)
        {
            Caption = 'Make &Receipt';


        }


        addafter(Approve)
        {
            action(PrintOrder)
            {
                ApplicationArea = all;
                trigger OnAction()
                var
                    PurchHeader: Record "Purchase Header";
                begin
                    IF Rec.Status = Rec.Status::Released THEN BEGIN
                        PurchHeader.RESET;
                        PurchHeader.SETRANGE("Document Type", Rec."Document Type");
                        PurchHeader.SETRANGE("No.", Rec."No.");
                        REPORT.RUN(50015, TRUE, TRUE, PurchHeader);
                    END
                    ELSE
                        ERROR('Status must be Released');
                end;


            }
        }

    }

    var
        PurchHeader: Record "Purchase Header";
}

