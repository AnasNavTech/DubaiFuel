PageExtension 50007 "Item Journal Ext" extends "Item Journal"
{
    layout
    {

        modify(Control1903326807)
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
        addafter("Item No.")
        {
            field("Vehicle Code"; Rec."Vehicle Code")
            {
                ApplicationArea = Basic;
            }
            field("Starting KM"; Rec."Starting KM")
            {
                ApplicationArea = Basic;
                Editable = false;
            }
            field("Ending KM"; Rec."Ending KM")
            {
                ApplicationArea = Basic;
            }
            field("Driver Code"; Rec."Driver Code")
            {
                ApplicationArea = Basic;
            }
            field("Driver Name"; Rec."Driver Name")
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {

        addafter("Post and &Print")
        {
            action("Delivery Note")
            {
                ApplicationArea = Basic;
                Caption = 'Delivery Note';

                trigger OnAction()
                begin
                    /*ItemJnlLine.RESET;
                    ItemJnlLine.SETRANGE("Journal Template Name","Journal Template Name");
                    ItemJnlLine.SETRANGE("Journal Batch Name","Journal Batch Name");
                    ItemJnlLine.SETRANGE("Document No.","Document No.");
                    REPORT.RUNMODAL(50004,TRUE,TRUE,ItemJnlLine);
                     */

                    // Clear(DeliveryNote);
                    // ItemJnlLine.Reset;
                    // ItemJnlLine.SetRange("Document No.", Rec."Document No.");
                    // DeliveryNote.CallDocNo(Rec."Document No.");
                    // DeliveryNote.CallBatch(Rec."Journal Batch Name");
                    // DeliveryNote.Run; //TODO

                end;
            }
        }
    }

    var
        ItemJnlLine: Record "Item Journal Line";
        EntryNo: Integer;
        VCD: Record "Vehicle Consumption Detail";
        ItemJournalBatch: Record "Item Journal Batch";
        //DeliveryNote: Report UnknownReport50004;
        OldInvtAccNo: Code[10];
        RecGPS: Record "General Posting Setup";
        InvtPG: Code[10];
        Flag: Boolean;

    procedure LastEntryNo(): Integer
    var
        VechConsumpDetl: Record "Vehicle Consumption Detail";
    begin
        VechConsumpDetl.Reset;
        if VechConsumpDetl.FindLast then
            exit(VechConsumpDetl."Entry No.")
        else
            exit(0);
    end;
}

