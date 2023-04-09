codeunit 50004 "Sales-Post Ext"
{
    trigger OnRun()
    begin

    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterInsertShipmentLine', '', true, true)]
    local procedure "Sales-Post_OnAfterInsertShipmentLine"
    (
        var SalesHeader: Record "Sales Header";
        var SalesLine: Record "Sales Line";
        var SalesShptLine: Record "Sales Shipment Line";
        PreviewMode: Boolean;
        xSalesLine: Record "Sales Line"
    )
    begin

        SalesShptLine.Cancelled := SalesLine.Cancelled;

    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnPostItemJnlLinePrepareJournalLineOnBeforeCalcQuantities', '', true, true)]
    local procedure "Sales-Post_OnPostItemJnlLinePrepareJournalLineOnBeforeCalcQuantities"
    (
        var ItemJnlLine: Record "Item Journal Line";
        SalesLine: Record "Sales Line";
        QtyToBeShipped: Decimal;
        QtyToBeShippedBase: Decimal;
        QtyToBeInvoiced: Decimal;
        QtyToBeInvoicedBase: Decimal;
        var IsHandled: Boolean;
        IsATO: Boolean
    )
    var
        ItemUOM: Record "Item Unit of Measure";
        Qty: Decimal;
    begin

        ItemJnlLine."Order No." := SalesLine."Document No.";
        IF ItemUOM.GET(SalesLine."No.", SalesLine."Unit of Measure Code") THEN BEGIN
            Qty := SalesLine.Quantity * ItemUOM."Qty. per Unit of Measure";
        END;
        ItemJnlLine."Order Quantity" := Qty;



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