PageExtension 50030 "Payment Journal Ext" extends "Payment Journal"
{
    layout
    {
        modify(Control1900919607)
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
        addafter(Description)
        {
            field(Narration; Rec.Narration)
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {

        addafter("Post and &Print")
        {
            action("Print & Voucher")
            {

                ApplicationArea = Basic;



                trigger OnAction()
                begin
                    GenJnlLine.Reset;
                    GenJnlLine.SetRange(GenJnlLine."Journal Template Name", Rec."Journal Template Name");
                    GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", Rec."Journal Batch Name");
                    GenJnlLine.SetRange(GenJnlLine."Document No.", Rec."Document No.");
                    Report.Run(50045, true, true, GenJnlLine);
                end;
            }
        }
    }
    var
        GenJnlLine: Record "Gen. Journal Line";
}

