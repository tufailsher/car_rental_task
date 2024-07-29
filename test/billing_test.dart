import 'package:test/test.dart';

/////////////////////////////////////////////////////////////
/////////// This is where your tests should go //////////////
/////////////////////////////////////////////////////////////

void main() 
{
  group ('The <<something>> should', ()
  {
    test('Match first expectation', ()
    {
      expect(1,1);
    });

    test('Match second expectation', ()
    {
      expect(2,2);
    });
  });
}