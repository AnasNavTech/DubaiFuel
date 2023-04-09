codeunit 50001 EventSubscription
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterInitRecord', '', true, true)]
    local procedure "SalesHeader_OnAfterInitRecord"(var SalesHeader: Record "Sales Header")
    begin
        SalesHeader.VALIDATE("Location Code", 'TANK 4');

    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterModifyEvent', '', false, false)]
    local procedure OnafterModifySalesLine(RunTrigger: Boolean; var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin

        IF Rec.Cancelled THEN
            ERROR('You Can Not Modify a Cancelled Line');

    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterDeleteEvent', '', false, false)]
    local procedure OnafterDelSalesLine(RunTrigger: Boolean; var Rec: Record "Sales Line")
    begin

        IF Rec.Cancelled THEN
            ERROR('You Can Not Delete a Cancelled Line');

    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterModifyEvent', '', false, false)]
    local procedure OnafterModifyPurchaseLine(RunTrigger: Boolean; var Rec: Record "Purchase Line"; var xRec: Record "Purchase Line")
    begin

        IF Rec.Cancelled THEN
            ERROR('You Can Not Modify a Cancelled Line');

    end;




    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterInitItemLedgEntry', '', true, true)]
    local procedure "Item Jnl.-Post Line_OnAfterInitItemLedgEntry"
    (
        var NewItemLedgEntry: Record "Item Ledger Entry";
        var ItemJournalLine: Record "Item Journal Line";
        var ItemLedgEntryNo: Integer
    )
    var
        RecILE: Record "Item Ledger Entry";
        ILEQty: Decimal;
    begin

        NewItemLedgEntry."Order No." := ItemJournalLine."Order No.";
        NewItemLedgEntry."Order Line No." := ItemJournalLine."Order Line No.";
        NewItemLedgEntry."Order Quantity" := ItemJournalLine."Order Quantity";
        RecILE.RESET;
        RecILE.SETCURRENTKEY("Order No.", "Item No.");
        RecILE.SETRANGE("Order No.", ItemJournalLine."Order No.");
        RecILE.SETRANGE(RecILE."Order Line No.", ItemJournalLine."Order Line No.");
        RecILE.SETRANGE("Item No.", ItemJournalLine."Item No.");
        IF RecILE.FINDFIRST THEN BEGIN
            RecILE.CALCSUMS(Quantity);
        END;
        ILEQty := ABS(RecILE.Quantity + ItemJournalLine.Quantity);
        NewItemLedgEntry."Balance Quantity" := (ItemJournalLine."Order Quantity" - ILEQty);


    end;
}