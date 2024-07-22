from robot.api.deco import library, keyword
from robot.api.exceptions import Error, Failure
from robot.api.logger import info
import re

# REGEX TO VALIDATE INPUT
text_regex = "[A-Za-z]+"
numeric_regex = "[0-9]+"
alfanumeric_regex = "[A-Za-z0-9]+"
date_regex = "([0-9]+(/[0-9]+)+)"

@library
class Generics():
    def __init__(self) -> None:
        pass

    @keyword
    def is_data_valid_for_field(self, field_type:str, input_data:str):
        """
        Uses RegEx to validate if data should be accepted by the given field_type.
        
        If you don't want the value to be verified, just send an ``empty string [""]`` for
        ``input_data``.

        The ``field type`` can be:\n
        * Text\n
        * Alfanumeric\n
        * Numeric\n
        * Date
        """
        if input_data == "":
            info("Not Tested as data is empty.")
            return
        else:
            try:
                match field_type:
                    case "Text":
                        pattern = re.compile(rf"{text_regex}", re.IGNORECASE)
                        info(f"Comparing '{input_data}' with: {text_regex}")
                        if pattern.match(input_data):
                            return
                        else:
                            raise Error("Input Data Is Not The Required Type.") 
                    case "Alfanumeric":
                        pattern = re.compile(rf"{alfanumeric_regex}", re.IGNORECASE)
                        info(f"Comparing '{input_data}' with: {alfanumeric_regex}")
                        if pattern.match(input_data):
                            return
                        else:
                            raise Error("Input Data Is Not The Required Type.")
                    case "Numeric":
                        pattern = re.compile(rf"{numeric_regex}", re.IGNORECASE)
                        info(f"Comparing '{input_data}' with: {numeric_regex}")
                        if pattern.match(input_data):
                            return
                        else:
                            raise Error("Input Data Is Not The Required Type.")
                    case "Date":
                        pattern = re.compile(rf"{date_regex}", re.IGNORECASE)
                        info(f"Comparing '{input_data}' with: {date_regex}")
                        if pattern.match(input_data):
                            return
                        else:
                            raise Error("Input Data Is Not The Required Type.")
            except TypeError:
                Failure("Programming Error: field_type is not string.")

