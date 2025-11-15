
float32 t # time
float32[3] pos # pos
float32[3] euler # euler
float32[6] pj # stance toe positions (old)
float32[6] twist # twist state
float32 flight_leg
float32 sw_phase
float32[3] u_twist # cmd twist (only valid when no COP control)
float32[6] u_rj # cmd step locations in hip frame (old)
float32[3] u_zrp # cmd pose delta ZRP
float32[3] goal
float32[6] pjnom
float32[6] pjdes
float32 terrain_error # not used now
float32 terrain_lost # not used now
float32[3] dock_pose_ref
float32 dock_z_ref
float32 dock_err
float32 dock_mode
float32[3] inspection_orn_ref
float32 inspection_mode

