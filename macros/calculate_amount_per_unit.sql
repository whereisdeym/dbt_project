{% macro calculate_amount_per_unit(amount_column, unit_column) %}
    ROUND(
        CAST({{ amount_column }} AS DECIMAL(18,2)) / NULLIF({{ unit_column }}, 0), 
        2
    )
{% endmacro %}