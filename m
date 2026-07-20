Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E913ACA5D
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784527924; cv=none; b=Pv0yBjjhexrfgJS27+q7CdspYNdmVEW9FWPOXQQNgfhdyHxnRQch0k4WP5qAwVCqTbL8bi9FXQ7MknGKnsmbIU2foQAF0bVuNTdfS/c9+Ps3iKB13LXnEnkAX1GeCqEEjBeCHA10oyve6ZJxqswkMY1FJXj5N24NKrQViBYk0TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784527924; c=relaxed/simple;
	bh=iJwLCpzlsBGfwCY2/7QRL+lJXpcG2vTyp3jMaoa9lNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=irLkGE+ms6B1Ktf5k0P25rpXe7W1OGyoUu9mn/JS9BL8HqFQfmsUNidY3XJzFixJDkYKZOXsVuDUWklxISqwz1d3lvjZ/RBcpqTkFDVFPn/mLwIbsGwolnuMKCsLhxgdX1it4rXwSJb744jK0V75GfXG9wCSuvAjSn64FzRNuCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nfc0b8yc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jM5my5zE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nfc0b8yc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jM5my5zE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNsgYh408496
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lhiQV8OxOvmaAeJu25Jj+stsPzIy4U8Brw014ne08/0=; b=nfc0b8ycJqKhwX1V
	561eSKp5y8FsK24IQle6o8A8IY2nzy51gRhYdzDVwhTIxxd4lqFovZ0DitA+avkg
	IuaQvUtmrPEvhpTZQL3JQmHLSzRQeGPoQLxko9CtaO85s/LkKAeXwA0FWFhgQi0b
	ATiRhL/43wz+dlR7YbzgT3N2o0T8ll5f1nWe3g93ioopqcNWz60YF+BDuJKYfmPI
	tBBTj+COb4cGR+1NU6SNb5s1JYEvJqHXPvU/6E7iMQ6RGHXZTIG/NnZT9A9MDYxV
	J0UEyrh1oV7Fc6cobkZb5WXxs/45FDXtCCrypGnnVUXJQ4x0P6i2y60amzYWC/uf
	lIFETw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2nhmmxf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:11:50 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8e9489f62bfso216591576d6.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jul 2026 23:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784527910; x=1785132710; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lhiQV8OxOvmaAeJu25Jj+stsPzIy4U8Brw014ne08/0=;
        b=jM5my5zEzbFPd8UwBc1/YwG4nx3A+QTjzwKxpf/6kc5NdvQ0QxIc3FdcBw//cHm4lr
         V9UeKs54NkaZTBH7zwS0wYXRB11fqcULLMleSGLAfDpWEjMY/gQaFmZKXoIoiaJeg8Pq
         ppWc/zakA2o183y/METG45xv0RoGPUp6MjwSOJPExstDRpAVAgzn9Hhq2yv2OLOCbPRf
         6+nwSJTLQJ3/RduSK1hpZ9J4M64+veZQi58EDOR0Loi5ncRWAEMpRB9JLoSSeR9A5yhT
         FyC+UsyR9jgQowjlx0CUNNWbY4hFHucnsSXKyVXd+6EZZIPkAq65CT0wdsS/5hcqJgqR
         Fchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784527910; x=1785132710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lhiQV8OxOvmaAeJu25Jj+stsPzIy4U8Brw014ne08/0=;
        b=Z52WNry6euf9SSfGD6A5UvGuy4jhGhFZT7JUVm8wIkubi4xRmGdKRUHZ00JUP88CIp
         zOzFAEBUClrAGzEBRiy45A3W/G8WwNnAzNJwVua0D29b9FbdwKFMT4eBVEXMestjBf8/
         V2gNRNn/5SEH4glHHnVhduzhqp4xpaEHCT7rLfk1S8bINRkgz+01CFUBx93TxwqvZheD
         iXSfFb3mC3AOvYdj3Pxbt5S111s6fuejrPWSaj503SfIH5PJgf9CPmwV4SO11RolvJ6T
         gxKD/Z43hPQYjDcGXDbwsCHAR8JOG/VGGsj0hQBM51ZuCP6kDEgr/CHcIzsnVHG6dq/S
         KMVw==
X-Gm-Message-State: AOJu0YzfSvvhRjPTV4PmSoqPvF/zvu3U+vWri7wG6lkcqfQJ3faKFJGU
	oedMcbmUUAxFkTwr+uCUpa/Am8duFagFMgl+4mFucQEE6/EFwQIkBSIDx4d9rEzUKbn74nzlbxZ
	FN7WRH4XRqSTtJ5NK2iUDvcuRgaovX9LyUdF7i3ASVHy+oUdBwC8QsoJDVkku+TBiwZuJ
X-Gm-Gg: AfdE7ckJJsY4cCg27AXCARhGcV+Y7Lwn4vMHTET62ltcPnRPzi6dQyuAu1nJWEmczDw
	yHMRGTf+sYc41VFgPKJhO8W1w0FRtnfJSlD1yDuHF++zyjFIbgXsEdxRJ1hLNVSrl5mJa42C0pj
	brhB5TvRjFjMYzSBaxk/ATGbfL108/YMzzkBxGJ1Wu4U9Lb31YCPI4+qXt1a/mpEdJGIu62gS1x
	E8zNL9eDOaF0ynwwfpRxfFD+deGc/EWRkW31vcO5zFoRnEHubySMEYtWt6fmTcsUuKmnE1eCbR9
	GSI98cxOa0YIYbVPCrUY2c64Sw39NJxLfRA3+uDHbEjhjPPhHshrSaEtV+kTrSOMCGYzQRCdq2B
	39UVG+dPepsGYygyJkbD1bVfk6Mun7EexOYDIaUbYste3TJB/3312vjuavjwRb9w=
X-Received: by 2002:a05:6214:c48:b0:8e9:78d7:6b98 with SMTP id 6a1803df08f44-90778353e4emr120793836d6.6.1784527909688;
        Sun, 19 Jul 2026 23:11:49 -0700 (PDT)
X-Received: by 2002:a05:6214:c48:b0:8e9:78d7:6b98 with SMTP id 6a1803df08f44-90778353e4emr120793766d6.6.1784527909281;
        Sun, 19 Jul 2026 23:11:49 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90778588a39sm84793216d6.20.2026.07.19.23.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 23:11:49 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 14:08:20 +0800
Subject: [PATCH v8 13/15] drm/msm/dp: make bridge helpers use dp_display to
 allow re-use
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-dp_mstclean-v8-13-bea261bf4e7d@oss.qualcomm.com>
References: <20260720-dp_mstclean-v8-0-bea261bf4e7d@oss.qualcomm.com>
In-Reply-To: <20260720-dp_mstclean-v8-0-bea261bf4e7d@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784527840; l=8509;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=DdyEaeCdVA9QEZM1o4gUYj/xzzxduNmsf5XNmE5oshE=;
 b=TQ1HKjVi2QpOVMyigPVcFMvgitfp52W/1+G1F0F9EQjeqDFFNC/ivzXG6THNvTfYwih7i0S9U
 l7S2uxAfNWbB5D3/UO+WFvA3lXbo08XfWOHY+V1eCYPBqH7pFxxTSHE
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=Le0MLDfi c=1 sm=1 tr=0 ts=6a5dbc26 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=LmD7BKvqrCyCckpIDn8A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 7MS5KywJcZgKeTb9lDr4Q6DyWGvV1NT5
X-Proofpoint-ORIG-GUID: 7MS5KywJcZgKeTb9lDr4Q6DyWGvV1NT5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA2NyBTYWx0ZWRfX3winoKrCuruO
 UooQ7DbSjkS/XguZqXG9iq8CQcVKnyM0fodQP5yqJjlqbrKfTtz/eOpnyNGezOcsFmq4jUTnqvc
 i46uydPW7H4Dz64EQ/2whhpK54H2jU4V2tXM0INfEwreiACWDRj45J+HQEQR8Xq7Vu0z0+W989L
 lFkoiQ5RrP7gsiYCNb/pdM8zi+TBfogRJrfy7nBCYmM3a+NOwb/CQ3v8/UXX8CPBI5rpA+apxvi
 r7Dfjy6yVFDb9/nkVTaOKTSpG35kZXwRftMvCocN36fLromNg3LlTgETcrMLYqhwVUM8eFcE8N+
 mzKGkgN1KlyikEMkFWTOTdRBVz6UE+94mQn4o/2tdZM5xQduh7iPJYbfmYmOoYwmtj18OkiNQI4
 9MKdDdk/FNkgQLAa9o0b05IcOcD8u6ktlSKIPXMAzDpzUObwQ6SY1jXVyf3Jz/dU2jqdF6Mz5Wi
 T9ilKhEhIDhTZIctzHA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA2NyBTYWx0ZWRfXwquHEYzijQaV
 5SkSo6SQfx2Z3MiTW2mH0Yh1WYGRNfW+TGznyS9Zcgps4vzgQnVNvQJGQiVYVjFXS1ZNN/NeHpV
 XOO1W8TLZFZFqiOHwoJOPToJ9CIMa8E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200067

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

dp_bridge helpers take drm_bridge as an input and extract the
dp_display object to be used in the dp_display module. Rather than
doing it in a roundabout way, directly pass the dp_display object
to these helpers so that the MST bridge can also re-use the same
helpers.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 29 +++++++++------------------
 drivers/gpu/drm/msm/dp/dp_display.h |  7 +++++++
 drivers/gpu/drm/msm/dp/dp_drm.c     | 39 ++++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_drm.h     |  9 ---------
 4 files changed, 54 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d1a3a6f6c303..deb21cee1183 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -740,24 +740,21 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 
 /**
  * msm_dp_bridge_mode_valid - callback to determine if specified mode is valid
- * @bridge: Pointer to drm bridge structure
+ * @dp: Pointer to dp display structure
  * @info: display info
  * @mode: Pointer to drm mode structure
  * Returns: Validity status for specified mode
  */
-enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *bridge,
-					  const struct drm_display_info *info,
-					  const struct drm_display_mode *mode)
+enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
+					       const struct drm_display_info *info,
+					       const struct drm_display_mode *mode)
 {
 	const u32 num_components = 3, default_bpp = 24;
 	struct msm_dp_display_private *msm_dp_display;
 	struct msm_dp_link_info *link_info;
 	u32 mode_rate_khz = 0, supported_rate_khz = 0, mode_bpp = 0;
-	struct msm_dp *dp;
 	int mode_pclk_khz = mode->clock;
 
-	dp = to_dp_bridge(bridge)->msm_dp_display;
-
 	if (!dp || !mode_pclk_khz || !dp->connector) {
 		DRM_ERROR("invalid params\n");
 		return -EINVAL;
@@ -1408,11 +1405,9 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 	return 0;
 }
 
-void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
-				 struct drm_atomic_commit *state)
+void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display,
+				  struct drm_atomic_commit *state)
 {
-	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
-	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *crtc_state;
 	int rc = 0;
@@ -1421,7 +1416,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
 	crtc = drm_atomic_get_new_crtc_for_encoder(state,
-						   drm_bridge->encoder);
+						   msm_dp_display->bridge->encoder);
 	if (!crtc)
 		return;
 	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
@@ -1451,11 +1446,8 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	drm_dbg_dp(msm_dp_display->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
 }
 
-void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
-				  struct drm_atomic_commit *state)
+void msm_dp_display_atomic_disable(struct msm_dp *dp)
 {
-	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
-	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
 	struct msm_dp_display_private *msm_dp_display;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
@@ -1472,11 +1464,8 @@ static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
 }
 
-void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
-				       struct drm_atomic_commit *state)
+void msm_dp_display_atomic_post_disable(struct msm_dp *dp)
 {
-	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
-	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
 	struct msm_dp_display_private *msm_dp_display;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 0b65e16c790d..5116f7bbbd02 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -33,5 +33,12 @@ void msm_dp_display_signal_audio_start(struct msm_dp *msm_dp_display);
 void msm_dp_display_signal_audio_complete(struct msm_dp *msm_dp_display);
 void msm_dp_display_set_psr(struct msm_dp *dp, bool enter);
 void msm_dp_display_debugfs_init(struct msm_dp *msm_dp_display, struct dentry *dentry, bool is_edp);
+void msm_dp_display_atomic_post_disable(struct msm_dp *dp_display);
+void msm_dp_display_atomic_disable(struct msm_dp *dp_display);
+void msm_dp_display_atomic_enable(struct msm_dp *dp_display,
+				  struct drm_atomic_commit *state);
+enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
+					       const struct drm_display_info *info,
+					       const struct drm_display_mode *mode);
 
 #endif /* _DP_DISPLAY_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 763ae4239bd3..aa98f101b093 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -49,6 +49,43 @@ static void msm_dp_bridge_debugfs_init(struct drm_bridge *bridge, struct dentry
 	msm_dp_display_debugfs_init(dp, root, false);
 }
 
+static void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
+					struct drm_atomic_commit *state)
+{
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = dp_bridge->msm_dp_display;
+
+	msm_dp_display_atomic_enable(dp, state);
+}
+
+static void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
+					 struct drm_atomic_commit *state)
+{
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = dp_bridge->msm_dp_display;
+
+	msm_dp_display_atomic_disable(dp);
+}
+
+static void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
+					      struct drm_atomic_commit *state)
+{
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = dp_bridge->msm_dp_display;
+
+	msm_dp_display_atomic_post_disable(dp);
+}
+
+static enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *drm_bridge,
+						     const struct drm_display_info *info,
+						     const struct drm_display_mode *mode)
+{
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = dp_bridge->msm_dp_display;
+
+	return msm_dp_display_mode_valid(dp, info, mode);
+}
+
 static const struct drm_bridge_funcs msm_dp_bridge_ops = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state   = drm_atomic_helper_bridge_destroy_state,
@@ -115,7 +152,7 @@ static void msm_edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		return;
 	}
 
-	msm_dp_bridge_atomic_enable(drm_bridge, state);
+	msm_dp_display_atomic_enable(dp, state);
 }
 
 static void msm_edp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index 4bd788ea05d5..da412c788503 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -27,15 +27,6 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 
 enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 					       struct drm_connector *connector);
-void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
-				 struct drm_atomic_commit *state);
-void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
-				  struct drm_atomic_commit *state);
-void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
-				       struct drm_atomic_commit *state);
-enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *bridge,
-					  const struct drm_display_info *info,
-					  const struct drm_display_mode *mode);
 void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,

-- 
2.43.0

