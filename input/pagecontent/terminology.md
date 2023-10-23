
This page lists all the ValueSets, CodeSystems, and ConceptMaps defined as part of the Consolidated CDA Implementation Guide

### Value Sets

{% include valueset-list.xhtml %}

These value sets are used in this implementation guide:

<div class="bg-success" markdown="1">
{% for vs in site.data.valuesets -%}
1. {% if vs[1] %}[{{ vs[0] }}]({{ vs[1] }}){% else %}`{{ vs[0] }}`{% endif %}
{% endfor %}
</div>

### Code Systems

These code systems are used in this implementation guide:

{% for cs in site.data.codesystems -%}
1. {% if cs[1] %}[{{ cs[0] }}]({{ cs[1] }}){% else %}`{{ cs[0] }}`{% endif %}
{% endfor %}
