PageExtension 50002 "General Ledger Entries Ext" extends "General Ledger Entries"
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

        addafter("G/L Account No.")
        {
            field("System-Created Entry"; Rec."System-Created Entry")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

