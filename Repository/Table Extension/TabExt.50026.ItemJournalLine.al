TableExtension 50026 tabExtItemJournalLine extends "Item Journal Line"
{
    fields
    {


        field(50000; "Vehicle Code"; Code[20])
        {
            Description = '//GTFSDF1.00-Biswajit-02.05.11';
            TableRelation = Vehicle."No.";

            trigger OnValidate()
            begin
                VCD.Reset;
                VCD.SetRange("Vehicle Code", "Vehicle Code");
                if VCD.FindLast then begin
                    if VCD."Ending KM" <> 0 then
                        "Starting KM" := VCD."Ending KM";
                end;
            end;
        }
        field(50001; "Starting KM"; Decimal)
        {
            Description = '//GTFSDF1.00-Biswajit-02.05.11';

            trigger OnValidate()
            begin
                TestField("Vehicle Code");
            end;
        }
        field(50002; "Ending KM"; Decimal)
        {
            Description = '//GTFSDF1.00-Biswajit-02.05.11';
        }
        field(50003; "Driver Code"; Code[10])
        {
            Description = '//GTFSDF1.00-Biswajit-02.05.11';
            TableRelation = Resource."No." where(Type = const(Person));

            trigger OnValidate()
            begin

                Resource.Get("Driver Code");
                "Driver Name" := Resource.Name;
            end;
        }
        field(50004; "Driver Name"; Text[30])
        {
            Description = '//GTFSDF1.00-Biswajit-02.05.11';
        }

        field(60001; "Order Quantity"; Decimal)
        {
        }


    }
    keys
    {
        key(Key1001; "Document No.", "Posting Date")
        {
        }
    }

    var
        Resource: Record Resource;
        VCD: Record "Vehicle Consumption Detail";
        EndKM: Decimal;
}

