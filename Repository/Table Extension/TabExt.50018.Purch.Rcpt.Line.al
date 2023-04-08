TableExtension 50018 tabExtPurchRcptLine extends "Purch. Rcpt. Line"
{
    fields
    {
        field(50001; "QA Done"; Boolean)
        {
        }
        field(50145; Cancelled; Boolean)
        {
            Description = '//GTFSDFPC1.00-Biswajit-03.05.11';
        }
        field(50146; "Vehicle Code"; Code[20])
        {
            Description = '//GTFSDFPC1.00-Biswajit-08.05.11';
            TableRelation = Vehicle."No.";
        }
        field(50147; "Driver No."; Code[20])
        {
            Description = '//GTFSDFPC1.00-Biswajit-08.05.11';
            TableRelation = Resource."No." where(Type = const(Person));
        }
        field(50148; "Driver Name"; Text[50])
        {
            Description = '//GTFSDFPC1.00-Biswajit-08.05.11';
        }
    }

    procedure InsertTrnsferLineFromRcptLine(var TransferLine: Record "Transfer Line")
    var
        TransferHeader: Record "Transfer Header";
        PurchOrderHeader: Record "Purchase Header";
        TransferOrderLine: Record "Transfer Line";
        TempTransferLine: Record "Transfer Line";
        NextLineNo: Integer;
        ExtTextLine: Boolean;
    begin
        SetRange("Document No.", "Document No.");

        TempTransferLine := TransferLine;
        if TransferLine.Find('+') then
            NextLineNo := TransferLine."Line No." + 10000
        else
            NextLineNo := 10000;

        if TransferHeader."No." <> TempTransferLine."Document No." then
            TransferHeader.Get(TempTransferLine."Document No.");

        if TransferLine."Receipt No." <> "Document No." then begin
            TransferLine.Init;
            TransferLine."Line No." := NextLineNo;
            TransferLine."Document No." := TempTransferLine."Document No.";
            TransferLine.Description := StrSubstNo(Text000, "Document No.");
            TransferLine.Insert;
            NextLineNo := NextLineNo + 10000;
        end;


        repeat

            TransferLine."Line No." := NextLineNo;
            TransferLine."Item No." := "No.";
            TransferLine.Description := Description;

            TransferLine."Document No." := TempTransferLine."Document No.";
            TransferLine."Quantity (Base)" := 0;
            TransferLine.Quantity := 0;
            TransferLine."Outstanding Qty. (Base)" := 0;
            TransferLine."Receipt No." := "Document No.";
            TransferLine."Receipt Line No." := "Line No.";
            TransferLine."Unit of Measure Code" := "Unit of Measure Code";
            TransferLine.Validate(Quantity, Quantity - "Quantity Invoiced");


            TransferLine.Insert;


            NextLineNo := NextLineNo + 10000;
        until (Next = 0);
    end;

    var

        Text000: label 'Receipt No. %1';

}

