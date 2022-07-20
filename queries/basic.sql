select
  p.kee,
  s.created_at,
  m.name as metric_name,
  pm.value as metric_value
from projects p
left join ce_activity c
  on p.uuid = c.component_uuid
left join snapshots s
  on s.uuid = c.analysis_uuid
left join ce_scanner_context ctx
  on c.uuid = ctx.task_uuid
left join project_measures pm
  on c.analysis_uuid = pm.analysis_uuid
left join metrics m
  on pm.metric_uuid = m.uuid
