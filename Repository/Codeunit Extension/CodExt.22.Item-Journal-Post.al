codeunit 50002 ItemJournlPostSubs
{
    trigger OnRun()
    begin

    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post", 'OnCodeOnBeforeItemJnlPostBatchRun', '', true, true)]
    local procedure "Item Jnl.-Post_OnCodeOnBeforeItemJnlPostBatchRun"(var ItemJournalLine: Record "Item Journal Line")
    begin
        Flag := FALSE;
        ItemJournalBatch.GET(ItemJournalLine."Journal Template Name", ItemJournalLine."Journal Batch Name");
        IF ItemJournalBatch."Internal Consumption" THEN BEGIN
            Flag := TRUE;
            CLEAR(InvtPG);
            InvtPG := ItemJournalLine."Inventory Posting Group";
            RecGPS.RESET;
            RecGPS.SETRANGE(RecGPS."Gen. Bus. Posting Group", '');
            RecGPS.SETRANGE(RecGPS."Gen. Prod. Posting Group", ItemJournalLine."Inventory Posting Group");
            IF RecGPS.FINDFIRST THEN BEGIN
                OldInvtAccNo := RecGPS."Inventory Adjmt. Account";
                RecGPS."Inventory Adjmt. Account" := ItemJournalBatch."G/L Account No.";
                RecGPS.MODIFY;
            END;


            EntryNo := LastEntryNo();
            IF EntryNo = 0 THEN
                EntryNo := 1
            ELSE
                EntryNo := EntryNo + 1;
            ItemJnlLine.RESET;
            ItemJnlLine.SETRANGE("Journal Template Name", ItemJournalLine."Journal Template Name");
            ItemJnlLine.SETRANGE("Journal Batch Name", ItemJournalLine."Journal Batch Name");
            IF ItemJnlLine.FINDFIRST THEN
                REPEAT
                    VCD.INIT;
                    VCD."Entry No." := EntryNo;
                    VCD."Vehicle Code" := ItemJnlLine."Vehicle Code";
                    VCD."Item No." := ItemJnlLine."Item No.";
                    VCD.Quantity := ItemJnlLine.Quantity;
                    VCD."Starting KM" := ItemJnlLine."Starting KM";
                    VCD."Ending KM" := ItemJnlLine."Ending KM";
                    VCD.UOM := ItemJnlLine."Unit of Measure Code";
                    VCD."Driver Code" := ItemJnlLine."Driver Code";
                    VCD."Driver Name" := ItemJnlLine."Driver Name";
                    VCD."Posting Date" := ItemJnlLine."Posting Date";
                    VCD."Document No." := ItemJnlLine."Document No.";
                    VCD.INSERT;
                    EntryNo := EntryNo + 1;
                UNTIL ItemJnlLine.NEXT = 0;
        END;



        IF Flag THEN BEGIN
            RecGPS.RESET;
            RecGPS.SETRANGE(RecGPS."Gen. Bus. Posting Group", '');
            RecGPS.SETRANGE(RecGPS."Gen. Prod. Posting Group", InvtPG);
            IF RecGPS.FINDFIRST THEN BEGIN
                RecGPS."Inventory Adjmt. Account" := OldInvtAccNo;
                RecGPS.MODIFY;
                COMMIT;
            END;
        END;



    end;

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




    var

        EntryNo: Integer;
        VCD: Record "Vehicle Consumption Detail";
        ItemJournalBatch: Record "Item Journal Batch";
        OldInvtAccNo: Code[10];
        RecGPS: Record "General Posting Setup";
        InvtPG: Code[10];
        Flag: Boolean;
        ItemJnlLine: Record "Item Journal Line";


}