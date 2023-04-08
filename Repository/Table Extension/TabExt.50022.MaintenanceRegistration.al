TableExtension 50022 TabExtMaintanRegistration extends "Maintenance Registration"
{
    fields
    {
        field(50001; "Maintenance Type"; Code[20])
        {
            TableRelation = Maintenance;
        }
        field(50002; Close; Boolean)
        {

            trigger OnValidate()
            begin

                IF CONFIRM('Do you want to Post this Maintenance Record?', TRUE) THEN BEGIN
                    TESTFIELD("FA No.");
                    TESTFIELD("Line No.");
                    TESTFIELD("Service Date");
                    TESTFIELD("Maintenance Type");

                    MaintRegn.SETRANGE(MaintRegn."FA No.", "FA No.");
                    MaintRegn.SETRANGE(MaintRegn."Service Date", "Service Date");
                    MaintRegn.SETRANGE(MaintRegn.Close, TRUE);

                    IF MaintRegn.FIND('-') THEN BEGIN
                        ERROR('The Record already exists');
                    END
                    ELSE BEGIN
                        MaintRegn.Close := TRUE;
                        MODIFY;
                    END;
                END ELSE BEGIN
                    MaintRegn.Close := FALSE;
                    MODIFY;
                END;


            end;
        }
    }
    var
        MaintRegn: Record "Maintenance Registration";
}

