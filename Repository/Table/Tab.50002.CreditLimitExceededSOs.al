Table 50002 "Credit Limit Exceeded SOs"
{

    fields
    {
        field(1; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order";
        }
        field(2; "Document No."; Code[20])
        {
            TableRelation = "Sales Header"."No." where("Document Type" = const(Order));
        }
        field(3; "Order Date"; Date)
        {
        }
        field(4; "Customer Code"; Code[20])
        {
            TableRelation = Customer;
        }
        field(5; "Customer Name"; Text[30])
        {
        }
        field(6; "Salesperson Code"; Code[10])
        {
            TableRelation = "Salesperson/Purchaser";
        }
        field(7; "Credit Limit Exceeded"; Boolean)
        {
        }
        field(8; Approved; Boolean)
        {

            trigger OnValidate()
            begin
                if Approved then begin
                    "Approved By" := UserId;
                    "Approved Date" := Today;
                    "Approved Time" := Time;
                    //  SalesLineN

                    SalesLineN.SetRange("Document Type", "Document Type");
                    SalesLineN.SetRange("Document No.", "Document No.");
                    if SalesLineN.FindSet(true, false) then begin
                        repeat
                            SalesLineN."Responsibility Center" := 'TERMINAL';
                            SalesLineN.Modify;
                        until SalesLineN.Next = 0;

                        salesHdr.SetRange(salesHdr."Document Type", "Document Type");
                        salesHdr.SetRange(salesHdr."No.", "Document No.");
                        if salesHdr.FindFirst then begin
                            salesHdr."Responsibility Center" := 'TERMINAL';
                            salesHdr.Modify;
                        end;


                    end;


                end
                else begin
                    Clear("Approved By");
                    Clear("Approved Date");
                    Clear("Approved Time");

                    SalesLineN.SetRange("Document Type", "Document Type");
                    SalesLineN.SetRange("Document No.", "Document No.");
                    if SalesLineN.FindSet(true, false) then begin
                        repeat
                            SalesLineN."Responsibility Center" := '';
                            SalesLineN.Modify;
                        until SalesLineN.Next = 0;

                        salesHdr.SetRange(salesHdr."Document Type", "Document Type");
                        salesHdr.SetRange(salesHdr."No.", "Document No.");
                        if salesHdr.FindFirst then begin
                            salesHdr."Responsibility Center" := '';
                            salesHdr.Modify;
                        end;
                    end;

                end;
                Modify;
            end;
        }
        field(9; "Approved By"; Code[10])
        {
            TableRelation = User;
        }
        field(10; "Approved Date"; Date)
        {
        }
        field(11; "Approved Time"; Time)
        {
        }
        field(12; "Reason/Comment"; Text[60])
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.")
        {
            Clustered = true;
        }
        key(Key2; "Order Date")
        {
        }
    }

    fieldgroups
    {
    }

    var
        SalesLineN: Record "Sales Line";
        salesHdr: Record "Sales Header";
}

