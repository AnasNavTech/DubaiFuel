PageExtension 50029 "Cash Receipt Journal Ext" extends "Cash Receipt Journal"
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
        addafter("Account No.")
        {
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
            action("Print &Voucher")
            {
                ApplicationArea = Basic;
                Caption = 'Print &Voucher';

                trigger OnAction()
                begin
                    GenJnlLine.Reset;
                    GenJnlLine.SetRange(GenJnlLine."Journal Template Name", Rec."Journal Template Name");
                    GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", Rec."Journal Batch Name");
                    GenJnlLine.SetRange(GenJnlLine."Document No.", Rec."Document No.");
                    Report.Run(50046, true, true, GenJnlLine); //TODO
                end;
            }
        }
    }

    var
        GenJnlLine: Record "Gen. Journal Line";
}

