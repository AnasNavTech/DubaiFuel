codeunit 50005 "Purchase-Post Ext"
{
    trigger OnRun()
    begin

    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnPostItemJnlLineOnAfterCopyDocumentFields', '', true, true)]
    local procedure "Purch.-Post_OnPostItemJnlLineOnAfterCopyDocumentFields"
    (
        var ItemJournalLine: Record "Item Journal Line";
        PurchaseLine: Record "Purchase Line";
        WarehouseReceiptHeader: Record "Warehouse Receipt Header";
        WarehouseShipmentHeader: Record "Warehouse Shipment Header";
        PurchRcptHeader: Record "Purch. Rcpt. Header"
    )
    var
        PurchLine3: Record "Purchase Line";
        Qty: Decimal;
    begin


        ItemJournalLine."Order No." := PurchaseLine."Blanket Order No.";
        ItemJournalLine."Order Line No." := PurchaseLine."Blanket Order Line No.";
        PurchLine3.RESET;
        PurchLine3.SETRANGE(PurchLine3."Document Type", PurchLine3."Document Type"::"Blanket Order");
        PurchLine3.SETRANGE(PurchLine3."Document No.", PurchaseLine."Blanket Order No.");
        PurchLine3.SETRANGE(PurchLine3."Line No.", PurchaseLine."Blanket Order Line No.");
        IF PurchLine3.FINDFIRST THEN
            Qty := PurchLine3."Quantity (Base)";
        ItemJournalLine."Order Quantity" := Qty;


    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post (Yes/No)", 'OnBeforeConfirmPostProcedure', '', true, true)]
    local procedure "Purch.-Post (Yes/No)_OnBeforeConfirmPostProcedure"
    (
        var PurchaseHeader: Record "Purchase Header";
        var DefaultOption: Integer;
        var Result: Boolean;
        var IsHandled: Boolean
    )
    begin
        if PurchaseHeader.Status = PurchaseHeader.Status::Released then
            DefaultOption := 1


    end;








    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post (Yes/No)", 'OnBeforeConfirmSalesPost', '', true, true)]
    local procedure "Sales-Post (Yes/No)_OnBeforeConfirmSalesPost"
    (
        var SalesHeader: Record "Sales Header";
        var HideDialog: Boolean;
        var IsHandled: Boolean;
        var DefaultOption: Integer;
        var PostAndSend: Boolean
    )
    var
        UserSetup: Record "User Setup";
    begin


        IF UserSetup.GET(USERID) THEN BEGIN
            IF UserSetup."Sales Price Visible" THEN
                DefaultOption := 3
            else
                DefaultOption := 1;

        END;


    end;





    var
        myInt: Integer;
}