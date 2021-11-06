import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class DataFormatters {
  MaskTextInputFormatter brazilianPostalCode = MaskTextInputFormatter(
    mask: '#####-###',
    filter: {"#": RegExp(r'[0-9]')},
  );

  MaskTextInputFormatter brazilianPhoneMask = MaskTextInputFormatter(
    mask: '(##) ####-####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  MaskTextInputFormatter brazilianCellphoneMask = MaskTextInputFormatter(
    mask: '(##) #####-####',
    filter: {"#": RegExp(r'[0-9]')},
  );
}
