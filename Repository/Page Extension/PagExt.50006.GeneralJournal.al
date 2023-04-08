PageExtension 50006 "Gen Journal ext1" extends "General Journal"
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


        addafter(PostAndPrint)
        {
            action("Print & JV")
            {
                ApplicationArea = Basic;
                Caption = 'Print & JV';

                trigger OnAction()
                begin
                    GenJnlLine.Reset;
                    GenJnlLine.SetRange(GenJnlLine."Journal Template Name", Rec."Journal Template Name");
                    GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", Rec."Journal Batch Name");
                    GenJnlLine.SetRange(GenJnlLine."Document No.", Rec."Document No.");

                    Report.Run(50047, true, true, GenJnlLine);
                end;
            }
        }
    }

    var
        GenJnlLine: Record "Gen. Journal Line";
}

