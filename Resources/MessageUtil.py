class MessageUtil:
    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def error_message_for(self, field_name):
        return field_name.lower()

    def success_message_for(self, name):
        return name.upper()
