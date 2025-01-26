# Input variables, change these
fn_meta <- 'metadata.csv'

	   
cell2_wnt = c('Component_Section', 'Subcomponent', 'ERDDAP_Dataset_ID', 'PI', 'Contact')

df1 <- read.csv(fn_meta)
df2 <- subset(df1, df1$'ERDDAP_Dataset_ID'==ds_id)


vec2 <- vector(length=length(cell2_wnt))
for (j in seq_along(cell2_wnt)) {
    vec2[j] <- df2[[cell2_wnt[j]]][1]
}
names(vec2) <- cell2_wnt

num_ts_id_list <- length(ts_id_list)

rgn_lbl_vec <- vector(mode="character", length=num_ts_id_list)


for (i in seq_along(ts_id_list)) {
    df3 <- subset(df1, df1$'CCIEA_timeseries_ID'==ts_id_list[i])
    rgn <- df3[['region']][1]
    lat <- df3[['latitude']][1]
    lon <- df3[['longitude']][1]
    lat2 <- df3[['latitude2']][1]
    lon2 <- df3[['longitude2']][1]

    if (!is.na(lat)) {
        if (is.na(lon)) {
            latlon <- sprintf("%s (%.1fN, %.1fW)", rgn, lat, lon)
        } else {
            latlon <- sprintf("%s (%.1fN)",rgn, lat) }

        if (!is.na(lat2)) {
            if (!is.na(lon2)) {
                 latlon <- sprintf("%s (%.1f-%.1fN, %.1f-%.1fW)",rgn, lat, lat2, lon, lon2)
	    } else {
	         latlon <- sprintf("%s (%.1f-%.1fN)",rgn, lat, lat2)}}
	
	
	    
    } else {
        latlon <- NA }

    rgn_lbl_vec[i] <- latlon

	
}



rgn_lbl <- paste(rgn_lbl_vec, collapse=', ')
ds_id_lbl <- paste(ts_id_list, collapse=', ')


