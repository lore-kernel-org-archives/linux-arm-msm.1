Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286550;
	b=kVlTQrL6QZtWazRXcAzVe0elBSDZeP6ZfDnrm7VFbubbdafB7sHMVeUXP6oA/EJerDir
	 RfPIqgUa1C5F6CsmBGpcA5Dci3BppPYp0hFaeDRsI67IX8iU3xfEWL68krU+JuzJ+S5HJ
	 25A5Nd6v1dsmJK6azYHDwJB/u2lJFLNMUGOVa3icdOBFkaZx0gNJJijLwn2Vxfcpka9Xv
	 k4QdNn9AWKC9ydfu/HHwEu914BmA5tO3jEQkx/HFqowgqeWczU0Ocy4l4bNxhSDagOAjv
	 5U9so0xu7LurdvsAX/86JIH/+ubmvyIkaUdnS8qfGuzsEMj71zkUYt+CQTS2f/W/VPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286550;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6jiJ2cFfcWZ4T7THjimnFH1H/Fp94wK+5rOFj6cs9cU=;
	b=Q5I1DN8v5fm2zr/qQbJd7mBODlyUOe7pfDFoEpwGRQFy3WPb2hB5lSA25KSlGxmh+Fgr
	 BSYsYOrksREmjGzpgm33CXdwIyaj/UZP/zfamfMPLqnqYQiB6qkj2/XGl8SMQqK5l4ODb
	 ysJ+neVFRu+vKPQxwShyPHhifj45a+RDSZufeIIx0nekiJ1uUm5jpP0cD+RnOZWd1BPSY
	 xoVl6Q0BtjtXnzeWtQk2Dfu5vaqxm8zyFznXvkoz83Mw/J/CEQ4GU8WcmOeZKKGUGAz3V
	 Zi1UTyrTTXwtbTS/HI9PpNVe1h+OKLunzbrzfLUdgdCHNCEDVkN8BeUK1z3EmVz+xSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fcyn5uXG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jUHtQQse;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680C9606A33A
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:55:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 680C9606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fcyn5uXG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jUHtQQse
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A7xE2297923
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:55:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6jiJ2cFfcWZ4T7THjimnFH1H/Fp94wK+5rOFj6cs9cU=; b=fcyn5uXGlEOxgr7J
	vKYy5UxYs/jvQMDXNuM+6cIaRvZRTaZpS/g122vf2JHqTWtWL8Ohl5S62Vyh9zgu
	EYDiopSocboliLclnveumNfe2DM/lCGizlSv0Je+AYac9T8Y3nPabbowX7pVrbG3
	T5EqHZeg8cy5BoPIartY48aqyV+LCDSSAG5zR5GyX1cQ++2s0vCVptsRyF5oeFrj
	If7fYZ5DWHn32t2/z2sVW818mMn4xdymBUQZZoSVUgpBk/dxTixGHW0iQ2UOr3ZG
	kwI8wauSDtTpeKB5t3ltKI4oNFYfwaPuEQZJAnu+9Cjh/+265T2CU94EWoTtekCX
	UQtuIg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2n0hj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:55:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f6f4fe531so299847885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 20:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286549; x=1794891349; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6jiJ2cFfcWZ4T7THjimnFH1H/Fp94wK+5rOFj6cs9cU=;
        b=jUHtQQsexeRDeIxe/8OAML91q/TYRvejjK16FsSwbcIFsANJdjPoGYS/Xm+NRPWHSF
         KqJwoqzjVJlfpqO9WJvzSNtMsNXdoT5Ite5kx88mN2CT6FSNN90o91hfRKk/8Hpys6e+
         ZnjwOaGZRwUcWkDkXX9lUpRw0YDSVRXQvB03cBOQBrwriGx8Mwk5mf98ahWN2AyjbFvY
         gaW+JtW4W8qCPrJEY238criGl7AyESIP0fJQGtcsEsZjifr0KcMZEuH6tn9ggTbJFbcr
         7tAUrbqn93DyrtBZzrgoM/0k7O9jU1ERRl7DBYbMXhNzelEJHzgiipzaS9fPXHdUs0Ex
         Mopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286549; x=1794891349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6jiJ2cFfcWZ4T7THjimnFH1H/Fp94wK+5rOFj6cs9cU=;
        b=qQkpWyYGi9ldcek293M/Q+qRPHtr9iI6sAuQxubpoqd4ILqMkORk+jlx68ZMVGWc6q
         rcmJpNDwCCT7ZRjNlef40vN4mEDADOmPeX0s6sGDRrjGmGlRvxiAu0/ZMMQ2UFf50+of
         wfm/zx0d9wjh+5mSqKwFwLKZ6d9AynTWvP9VQMX0G2tltEsNCT8SkBSCkkXsyZgf4PEN
         5aHUNxGeYnvbGQsO1eCbIEuql7QGMc5yPGVjktkOIHiheDshFu9v+R2ZoA8Ckx4I2QW+
         nbfpKR2cFMxNFp2EFcwUsdBdSaj/Y7JznmeDFkgNl3ly3KROYO7xYztxF5MiGXWHxRn6
         ti9Q==
X-Gm-Message-State: APuU4Z/yvdBHHqZeDmoCANBIB/gk5yj6ocjsZ5GgUTze2dAmkYrrx8fc
	gtA/7qfSqyG1/7mVJ80JKOSWy5b5faZE1pjH+/2gvelTYrR8xrze89N18KAXUTb31JEMdYc/lf8
	Lg59dICGUigtk5ShAGS8K9oHiewAAjeTVnISvgyQWXJ/vHMWXTyBbDcWUUc/Tsf/9AEUr
X-Gm-Gg: AYBFou1Yt9jf64yBw5DM3TuTEDZ5X8H8Xln9QYmYFyPZ9GWjTNWeu3n2M19YscTFhsf
	GqR67elGY8ftrwT4+cxdxJm5PemIork4jg7HJWXdjbOe/q1AG9tY6GHFi7XagSI05df9g9JSXS7
	5+4/04yY5xzRQtyBRaMFxq5WJGDrNKu1KGnpp7tfNIQkvgSLqd8e2gzeTCJCWSrQ+RqTh3Us73b
	PuVkVty4fkgPNaptFhnuf8MR1BmpPCHdgW0kmvLROa/Q/tRGdhTDzQxbIq3mNCLiSwijJHIoL06
	PABRkd0H1z79+2vm1Zqh9MgcIjF9ZWWZQI2si/Mb2xpgTyMblG6gsAlWMl0j47Fv2exErmy+B/b
	4/SDcgdi0L8l7e1Jy8Xrcg81ABmF/6eL7lfUdzSNgeURQasHoXzzbVFaVckC6B1XWPogv6kvAOh
	zBuL6BK8hrJtaIHTiN+IqV6BqAAHHKj/MpxnNX
X-Received: by 2002:a05:620a:31a0:b0:93e:95ce:539c with SMTP id af79cd13be357-9479f1d7b57mr250437985a.2.1794286548846;
        Mon, 09 Nov 2026 20:55:48 -0800 (PST)
X-Received: by 2002:a05:620a:31a0:b0:93e:95ce:539c with SMTP id af79cd13be357-9479f1d7b57mr250435585a.2.1794286548408;
        Mon, 09 Nov 2026 20:55:48 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:55:48 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:36 +0800
Subject: [PATCH v8 15/29] drm/msm/dpu: use stream_id to select MST
 interfaces
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-msm-dp-mst-v8-15-d040fb33db5f@oss.qualcomm.com>
References: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
In-Reply-To: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=2469;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=wXTPAT6DXirv1p5bLwSDFrvILw5gZg1C+bWv7KYQNRg=;
 b=VsbeXqnUOY9/AUHHQoyUfMEWeUc/SwbCyx2IzG5kK6Ql++PzgvL4QgTPtFQ5yV9/u+fSkKYSM
 rL8TwbxXiOAApl5K971OC5RESgCcT8zBNT8tDsh1364ws2iMPuk6nWL
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af2a3d5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=m4XVQ0OAQ8bppu2UB-MA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX/hud1BpIWbti
 SKLNwbQHZJc4qEisHmn5W2MD5f5Xb4rM+up0ctZOa0Cq2PaeVxPBwZXW/w2eK319hK4c8xHMA56
 tbvUstyl4caSL9bxoSG+cdky695D7wI/ENImvaFLUtZkrxL+tzh4JegaCtud9AsiYF/l6LtRn4E
 qnMGBHd8OF+BhSVdmMttylvghn/LU/iiQ0ndhp9oF18rkdV0vsXipx/9EQOZLrTS9q0vZRaHoOY
 L8KviZ8RcdYMEwecca9h7wpqLhGa1VwQx9bNgCHjhqnaUX3/q14dLw5byqgrVpgyvxXevJvvY57
 Kh07eYalLnw+mMNXbPMDK4amIn3R1FNfK7PnG4e8JgBTev95Bsv+20lnvnQAi1Q76z6kIj67yg+
 V3EZvyW9x6THKHQCRKHA067Wvs9VhjToPyo6XnB2pHY1njoBROr/WyxwEZ9kR+GjURbj7SjhhD4
 0DjumzYw5cQYFnH1GuQ==
X-Proofpoint-GUID: 0Yt8CZqQMh0mHKh5DAB-xAUCFzz5DFBk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfXxC44zEoVJumH
 P40OuqnVoHPHIjkg7qEUeAHOr587C/6MQIyVcqEYSIRLa1rL05LYpjiKyfDgMRQ8WSK5YmSijl1
 C/1wFuTVU0iQQEkqq7dzCvEC1a8HACE=
X-Proofpoint-ORIG-GUID: 0Yt8CZqQMh0mHKh5DAB-xAUCFzz5DFBk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100019

For MST, multiple streams can share the same DP controller, making
(controller_id, intf_type) insufficient to uniquely identify a DPU
interface.

Add stream_id to msm_display_info and use it to select the matching
interface for a stream.

For DSI, eDP and SST configurations, stream_id remains zero and
behavior is unchanged.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 7 ++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 2 ++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 5e1c98371181d..a8dcc8c684eb2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1437,17 +1437,18 @@ static struct dpu_hw_intf *dpu_encoder_get_intf(const struct dpu_mdss_cfg *catal
 		struct dpu_rm *dpu_rm,
 		struct msm_display_info *disp_info, int index)
 {
-	int i = 0;
+	int i = 0, cnt = 0;
 	u32 controller_id = disp_info->h_tile_instance[index];
+	int stream_id = disp_info->stream_id;
 
 	if (disp_info->intf_type == INTF_WB)
 		return NULL;
 
 	for (i = 0; i < catalog->intf_count; i++) {
 		if (catalog->intf[i].type == disp_info->intf_type
-		    && catalog->intf[i].controller_id == controller_id) {
+		    && catalog->intf[i].controller_id == controller_id
+		    && cnt++ == stream_id)
 			return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
-		}
 	}
 
 	return NULL;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 4942097e76137..9972e209bd580 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -28,6 +28,7 @@
  * @h_tile_instance:    Controller instance used per tile. Number of elements is
  *                      based on num_of_h_tiles
  * @is_cmd_mode		Boolean to indicate if the CMD mode is requested
+ * @stream_id		stream id for which the interface needs to be acquired
  * @vsync_source:	Source of the TE signal for DSI CMD devices
  */
 struct msm_display_info {
@@ -35,6 +36,7 @@ struct msm_display_info {
 	uint32_t num_of_h_tiles;
 	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
 	bool is_cmd_mode;
+	int stream_id;
 	enum dpu_vsync_source vsync_source;
 };
 

-- 
2.43.0

