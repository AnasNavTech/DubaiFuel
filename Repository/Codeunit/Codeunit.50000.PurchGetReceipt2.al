Codeunit 50000 "Purch.-Get Receipt2"
{
    TableNo = "Transfer Line";

    trigger OnRun()
    begin
        TransferHeader.Get(Rec."Document No.");
        TransferHeader.TestField(Status, TransferHeader.Status::Open);

        PurchRcptLine.Setcurrentkey("Pay-to Vendor No.");
        PurchRcptLine.SetRange("Location Code", TransferHeader."Transfer-from Code");
        PurchRcptLine.SetFilter("Qty. Rcd. Not Invoiced", '<>0');

        GetReceipts.SetTableview(PurchRcptLine);
        GetReceipts.LookupMode := true;
        GetReceipts.SetPurchHeader(TransferHeader);
        GetReceipts.RunModal;
    end;

    procedure CreateInvLines(var PurchRcptLine2: Record "Purch. Rcpt. Line")
    var
        //        TempFromLineDim: Record UnknownRecord357 temporary;
        //      TempToLineDim: Record UnknownRecord357 temporary;
        DimMgt: Codeunit DimensionManagement;
    begin
        PurchRcptLine2.SetFilter(PurchRcptLine2."Qty. Rcd. Not Invoiced", '<>0');
        if PurchRcptLine2.Find('-') then begin
            TransferLine.LockTable;
            TransferLine.SetRange("Document No.", TransferHeader."No.");
            TransferLine."Document No." := TransferHeader."No.";

            repeat
                PurchRcptLine := PurchRcptLine2;
                PurchRcptLine.InsertTrnsferLineFromRcptLine(TransferLine);
            until PurchRcptLine2.Next = 0;
        end;

    end;

    procedure SetPurchHeader(var TransferHeader2: Record "Transfer Header")
    begin
        TransferHeader.Get(TransferHeader2."No.");
    end;

    var
        Text000: label 'The %1 on the %2 %3 and the %4 %5 must be the same.';
        TransferHeader: Record "Transfer Header";
        TransferLine: Record "Transfer Line";
        PurchRcptHeader: Record "Purch. Rcpt. Header";
        PurchRcptLine: Record "Purch. Rcpt. Line";
        GetReceipts: page "Get Receipt Lines2";

}
    


