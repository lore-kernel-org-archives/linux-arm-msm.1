Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE873EA976
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656058; cv=none; b=asXghEGa5hTJJXaev19qyjW133lRC1EMvjTOpQs3nKK6Hdg84gdt09HjSFQJnpmugzDM9SIdEK2q8A2m0MBzV/7JcUfzFz/RGydFt+Db7PaiN0AJ26m49eT6GVD+v7PMWLmh+BjsGbEwz41V8NpoSX1IYLI9H3WRlL0Y4b51DCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656058; c=relaxed/simple;
	bh=N2rKoa4yQ0dXrj5qJj+QnlNcYX2wqfuglaYZEki8WA0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VDobVIgR2HmMSL2onLl9Faq4u79bZBNmCT5wUfAadN/KtOXXDA/m8wDhJ+1bauzdBkWFIyMnDp2REwCRcmi7jr+FqC5F5jWyOM+PuTKsJiwS9KFj+HsI6874fMp7hXXBtSvpljV3/fXhGl+eIDTLmQSxUiH0Pcn1wkaTjvgKc8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iqzQj4ZA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ME65puot; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iqzQj4ZA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ME65puot"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47Iew2775210
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:27:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EdkXDqWxRD4i1VWXd4Haq4U6gn4wnuanLlD7mZRKGRU=; b=iqzQj4ZAn1mxFY5R
	ouFjSA9zwTldIEuCqEhKa9fh2IgVC1374FN5lt1Qkwg5lLvgVATwowa/F1R40k/J
	V6ck9a7JCcCVaM1RSayENuNSBQXLmZBX31WRm/DTmQVi5cPQ+nK0d5aN1w9/K0yZ
	QCAm8L05alOFDrl33xPZqhptrzUEJkjIqZdpAUNoP8mGxzeE5fAkb3O/MbJv56SP
	VEQw1pB2mDAPPbQjknBluN03+VRp0Q4FMvw0Hn4wJQsm1Bjw8ebkUP1A1zJTkRVw
	4c3V/PRmg1c6KS7azOcrS5EdpKwqvL4jRgr/ao1HZAfgC3PAYvknSTu407dwGjsD
	3CqXXw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvw22499-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:27:36 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91431adf55eso69544986d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 21:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656055; x=1791260855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EdkXDqWxRD4i1VWXd4Haq4U6gn4wnuanLlD7mZRKGRU=;
        b=ME65puot0bJRkifbqP7a0UaAR8UprMsZlrfGEr20GdRTXBAAeG8kgRSXBff+nlGv/2
         86ma5dzWFaKg5nzWg7O/Ri5YiWqgv5lue/ccI7rLQbvn3PKvqPH5R2alx3RlkHgvVcwo
         VgS3mF8lCfTLLXSQ3ae736DoUKjEct18RvF1M+kf0VlLszufQI8uMqg17x3eQVsu6RqN
         DTd51VNhlpK6BurWwUa6ESPcW2LrIdplksuVzgkqIVdhO38y4qujWANpBeAkOXqPQ6nr
         wxQTNbYG/2XgmI0FK6sNMh1oJEUqtdguExo9fhxjgZhqK3Tdd9ztiSBgOjNmUcB569Gx
         oiLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656055; x=1791260855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EdkXDqWxRD4i1VWXd4Haq4U6gn4wnuanLlD7mZRKGRU=;
        b=uMqIZES9yVA9LjlO1WxQAjMu/ULCcZIhwigIzkc8ItwKhOVYShR1u1dYgTfJIKkLJS
         pOggZJWP2cS3mEqV2k3saqO7gdmcwbfhcXzl5IXHXG9BmVyWXRIMyeXh1roBouwuI4Um
         8Ph7TR1qV7lzDOV5jAra5ezezLsp6pjQqLWzt0aDfBaH9eA63Jl0ZV0W+zp+VkNayvkW
         k/ru3j5TR2PRAXe+3hQdptR37YSKXdmPz1BXdEYk3Z1fiBfgLzKUnyEG8gmvY3Um9o9P
         kh+YshNIZyMSYbTMK2Vo9U5wSEfe5bvKm4UdgtAjVXs4KRGeWDRn8x7JNXCClAE/7wbu
         KYqw==
X-Gm-Message-State: AFuF++mjTWT3ssCmmGaxHMzAGJMQ1tcb49xfxYbmCKIBuPAPDtUElayT
	8+n4mBHWA5A5IPez6QTzCsrrFnLEFDi8x+CGaXKDIY2SRmCFDFR53a8iyepC+KYsIGnPSioWO9B
	6VKxjwQbLGWSJmhK4HxMV8IBIA6dvUDFsbj9MLgu8WJX92PeHNFSLZfNKrEiMkqicKySi
X-Gm-Gg: AYBFou0f5r92mNI++YyCoXdHFB32kYId4XhODmT/Yn28UIU+au6OFgRK0Y/1RoRfr9H
	hVh5+4FXI7O7RRJpgWffrgnillRA6XOBB+HmZ1ujkkvBRpmOKtlextpymEMLLyLU4UXDbvhOVTd
	+ggjCajPKNOQcDANrNKXLg4WgNvaCwiwz8m/3vYOnSpDyUiYq1vNRTixJTDRlFmpPX+D631V9jN
	gxsJUMcujJq9+Lv886XJCoozztTkvrZVywrNQKnqQowvlKaBvLBEb6XGVQqpjk8MRqrXvK04Ryq
	Ck5q43ZT2k+yhYqJiwWn7uA6yhZgLAsfH6I8TAlgIldOp+DX779N4whaepPn/OKCwG3l/T4IWmM
	4dN0NkqeeJG01AXr8FlKLBfB+63O3W4oBLbs3Fhipxmw65LQnkAFd+bHukz8nOrY=
X-Received: by 2002:a05:6214:f2a:b0:915:4229:17a3 with SMTP id 6a1803df08f44-915422924a5mr124882466d6.25.1790656054951;
        Mon, 28 Sep 2026 21:27:34 -0700 (PDT)
X-Received: by 2002:a05:6214:f2a:b0:915:4229:17a3 with SMTP id 6a1803df08f44-915422924a5mr124882246d6.25.1790656054467;
        Mon, 28 Sep 2026 21:27:34 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:27:34 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:38 +0800
Subject: [PATCH v7 14/35] drm/msm/dp: replace power_on with
 active_stream_cnt
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-14-4b81473185e7@oss.qualcomm.com>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
In-Reply-To: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=5066;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=67v7m0nY3ZZ469SfH0snYnVSm8decmV7B6bVBAo55no=;
 b=6QWRsfVGCVfo3Eg3TNc9E2pM+LvzM4J3dzvOJZKRlvVZ/As1QXfMZJVNqNovwtBSw063eN8sA
 NgEg3IvL1+0DWGq7/YRNf4ZcYNSIB2eQY4lORoga/ev7gSq0+f9IAQn
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=N6i8hG9B c=1 sm=1 tr=0 ts=6abb3e38 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=pA7EhmVi1NdrnwtGoTUA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: eCWvZbMzBXHaLyoDE11lp41rdsSmZrY8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX9GvqkEqgFDnB
 Xz0xhb1ExgkyeAl5cIV2ZHWcsYtRiEhdH7HO4jHoxwgIiJJ5aaSWRMcQvrPwUIMZz9P11jDB3Ff
 EAei8mOMwyKN3cdsr2Oi7qikxHHDmMsYw+um64h4X/HYdUVqFiFbREL7okgPWr1M46ykxbncMqH
 V7v4Ed7B37q0uigJzrp95FJneV0pnlUE1vbbgrIDFbGwB5nhSt3aMeSJ5l+8XUFfd5+rMI1Fk5i
 RCVWMK686RVQQkKAbBM5flF+/RZiHR2jDHKWU0fFr8Y+2V3lh8Ft6w9nZJqMmOzUHaQVScqKwC4
 JiMLig87nqETpzhtH26bJEFKIFkzSy2c0ya6polo5HPJTLweHrMZwv00gaGfgibUpfmEpBTO88L
 WYd9dZiorQLBkKOxrZrKswdtHlwcxMS2nulXv/ym7BknmuCTwS8iQs0wMdrhbMKrW4DZXAWu4at
 QWuijtkrnngD8LJLQQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfXyYS/m4xGk5jq
 hdmVUkRZgjbJCrQmkFh3uUUcsGnN9vpy8VYWVKkqz6LzzWFStAORf9T1auE41MHyKclsApUkNwY
 PGCEDYK95nYN/wQKPPfc+M0b9lilXn0=
X-Proofpoint-GUID: eCWvZbMzBXHaLyoDE11lp41rdsSmZrY8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290017

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

The power_on boolean cannot represent DP MST, where multiple streams
share a single link and its associated resources.

Replace power_on with active_stream_cnt and use it to track the lifetime
of the shared link. Link initialization is performed when enabling the
first stream, while link teardown is deferred until the last stream is
disabled.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_audio.c   |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c | 38 ++++++++++++++++++-------------------
 drivers/gpu/drm/msm/dp/dp_display.h |  2 +-
 3 files changed, 20 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index df222943ae57..8118130a3220 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -284,7 +284,7 @@ int msm_dp_audio_prepare(struct drm_bridge *bridge,
 	 * such cases check for connection status and bail out if not
 	 * connected.
 	 */
-	if (!msm_dp_display->power_on)
+	if (!msm_dp_display->active_stream_cnt)
 		goto end;
 
 	audio = msm_dp_audio_get_data(msm_dp_display);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 471803457b14..8756e45eece5 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -645,16 +645,16 @@ static int msm_dp_display_prepare_link(struct msm_dp_display_private *dp)
 	if (dp->link->sink_count == 0)
 		return -ENOTCONN;
 
-	if (!msm_dp_display->power_on) {
+	if (!msm_dp_display->active_stream_cnt) {
 		msm_dp_display_host_phy_init(dp);
 		force_link_train = true;
-	}
 
-	rc = msm_dp_ctrl_on_link(dp->ctrl, dp->panel);
-	if (rc) {
-		DRM_ERROR("Failed link training (rc=%d)\n", rc);
-		// TODO: schedule drm_connector_set_link_status_property()
-		return rc;
+		rc = msm_dp_ctrl_on_link(dp->ctrl, dp->panel);
+		if (rc) {
+			DRM_ERROR("Failed link training (rc=%d)\n", rc);
+			// TODO: schedule drm_connector_set_link_status_property()
+			return rc;
+		}
 	}
 
 	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, dp->panel, force_link_train);
@@ -667,14 +667,10 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp,
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
 	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
-	if (msm_dp_display->power_on) {
-		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
-		return 0;
-	}
 
 	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel, msm_dp_display->mst_active);
-	if (!rc)
-		msm_dp_display->power_on = true;
+
+	msm_dp_display->active_stream_cnt++;
 
 	return rc;
 }
@@ -723,13 +719,12 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp,
 {
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
-	if (!msm_dp_display->power_on)
-		return 0;
-
 	msm_dp_panel_disable_vsc_sdp(msm_dp_panel);
 
 	msm_dp_ctrl_off_pixel_clk(dp->ctrl, msm_dp_panel->stream_id);
 
+	msm_dp_display->active_stream_cnt--;
+
 	drm_dbg_dp(dp->drm_dev, "sink count: %d\n", dp->link->sink_count);
 	return 0;
 }
@@ -854,10 +849,10 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
 	 * if we are reading registers we need the link clocks to be on
 	 * however till DP cable is connected this will not happen as we
 	 * do not know the resolution to power up with. Hence check the
-	 * power_on status before dumping DP registers to avoid crash due
+	 * active_stream_cnt status before dumping DP registers to avoid crash due
 	 * to unclocked access
 	 */
-	if (!dp->power_on)
+	if (!dp->active_stream_cnt)
 		return;
 
 	msm_disp_snapshot_add_block(disp_state, msm_dp_display->ahb_len,
@@ -1538,6 +1533,11 @@ static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
 {
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
+	if (msm_dp_display->active_stream_cnt) {
+		drm_dbg_dp(dp->drm_dev, "stream still active, return\n");
+		return;
+	}
+
 	/* dongle is still connected but sinks are disconnected */
 	if (dp->link->sink_count == 0)
 		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
@@ -1550,8 +1550,6 @@ static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
 	else
 		msm_dp_display_host_phy_exit(dp);
 
-	msm_dp_display->power_on = false;
-
 	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
 
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 317c19b809ec..7bd510cecb44 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -18,7 +18,7 @@ struct msm_dp {
 	struct drm_bridge *next_bridge;
 	struct drm_bridge *bridge;
 	bool audio_enabled;
-	bool power_on;
+	u32 active_stream_cnt;
 	bool mst_active;
 	unsigned int connector_type;
 	bool is_edp;

-- 
2.43.0

