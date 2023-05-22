from mage_ai.data_preparation.repo_manager import get_repo_path
from mage_ai.io.bigquery import BigQuery
from mage_ai.io.config import ConfigFileLoader
from pandas import DataFrame
from os import path

if 'data_exporter' not in globals():
    from mage_ai.data_preparation.decorators import data_exporter


@data_exporter
def export_data_to_big_query(data, **kwargs) -> None:
    """
    Function which exports data to a BigQuery warehouse.
    Configuration settings are located in 'io_config.yaml'.
    """
    
    config_path = path.join(get_repo_path(), 'io_config.yaml')
    config_profile = 'default'
    
    # Convert value to data frame and put tables in targetted datasets
    for key, value in data.items():
        table_id = 'data-with-bryan.uber_data.{}'.format(key)
        BigQuery.with_config(ConfigFileLoader(config_path, config_profile)).export(
            DataFrame(value),
            table_id,
            if_exists='replace',  # Specify resolution policy if table name already exists
        )

    
    