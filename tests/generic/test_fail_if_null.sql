{% test if_null(model, column_name) %}
    SELECT *
    FROM {{ model }}
    WHERE {{ column_name }} is null
{% endtest %}