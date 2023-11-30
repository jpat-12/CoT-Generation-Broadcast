import pandas as pd

# Path to the CSV file
csv_file_path = '/opt/cot-gen/csv/mission-data.csv'

# Function to generate COT-BROADCAST.xml file from a CSV
def generate_xml_from_csv():
    # Read the CSV file into a DataFrame
    df = pd.read_csv(csv_file_path)

    # Open COT-BROADCAST.xml in write mode
    with open('/var/www/html/COT-BROADCAST.xml', 'w') as xml_file:
        for index, row in df.iterrows():
            event_data = ';'.join(map(str, row))  # Join row elements with a separator

            # Write each event data as a new line in the XML file
            xml_file.write(f"{event_data}\n")

if __name__ == "__main__":
    generate_xml_from_csv()
