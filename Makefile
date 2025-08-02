NAME=SaveOrganizer.jar
TARGET=target/*-jar-with-dependencies.jar

.PHONY: all run clean help

all: $(NAME)

$(NAME):
		@if [ ! -f $(NAME) ]; then \
				echo 'Building $(NAME)...'; \
				echo ''; \
				mvn clean package; \
				cp $(TARGET) $(NAME); \
				echo ''; \
				echo 'File created successfully. To run it, type "make run"'; \
		fi

run: $(NAME)
		@echo 'Running $(NAME)...';
		@java --enable-native-access=ALL-UNNAMED -jar $(NAME)

clean:
		@if [ -f $(NAME) ]; then \
				echo 'Removing $(NAME)'; \
				echo ''; \
				mvn clean; rm $(NAME); \
				echo ''; \
				echo 'File removed successfully.'; \
				echo 'If you also want to remove the repo, type "cd .. && rm -rf SoulsSpeedruns-Save-Organizer"'; \
		else \
				echo "$(NAME) doesn't exist. Nothing to remove."; \
		fi

help:
	@echo 'Build SpeedSouls Save Organizer (for Linux systems):'
	@echo ''
	@echo 'Note: Maven and a Java Development Kit (JDK) is required for the commands to work:'
	@echo "    make          - Build the file if it doesn't exist"
	@echo "    make run      - Check if the file exists, then run the file"
	@echo '    make clean    - Remove all generated files'
