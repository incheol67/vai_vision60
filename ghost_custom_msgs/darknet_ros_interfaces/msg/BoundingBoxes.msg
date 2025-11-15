std_msgs/Header header
std_msgs/Header image_header

uint32 img_height         # image height, that is, number of rows
uint32 img_width          # image width, that is, number of columns
int8 img_encoding          # Encoding of pixels -- channel meaning, ordering, size cv::Mat().type()
                      

BoundingBox[] bounding_boxes
uint16 cam_mount_offset_heading_deg #0-360 degree mounting offset from robot's forward facing X-axis
string cam_sub_url # URL to fetch resulting detection image
