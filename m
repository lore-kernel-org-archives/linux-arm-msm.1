Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81A63D9691
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164407; cv=none; b=ROpFcWWiFWwFnkfo9rYwUGpGBwYxntwpYjXgoGIEc+/QZfZej/Qf1oAC9QdZdW1YbojuNayeYFM6EOgT7wh5vqLKRoTqo2ZICF9lPNTEWLTVr/WfSaLA5rPISFHq7xLTW+WiS5x6YW47vEt96k5K2obxfmId8IWzEuzKE07GhDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164407; c=relaxed/simple;
	bh=nkrNz+77v3rJdHEYFsHcEMPGXjBx6xVUGJoYMgqzVw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sG6sHQWZpJ23Dmqe1D4fdaXOCJrskQ2CSd+FnyuoN1JH1dw1+zKOBzOKM3m+Qm4uciDeaOVhBzX6CiZz8iBY75Im1zGNq9EzPehdP+7ZHUx/2XLRonS02yvli91eJH8vxhK/h6CR3rlvmT0MWvVWkTKtTQO1zGuND4rgP0DgbrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iqHW096j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dydn6ADF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iqHW096j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dydn6ADF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xRKJ4081943
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:20:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JMJxYVwjgN4k+mFm4VS/dxq4WKhyHKBwLuJ9pdotNNg=; b=iqHW096jC8G2TY7F
	A/sCxxKlh2JlDNudHSy7rX4iUJnbcNoU0kknjyszC7uNWIO8gDLZlrw690NJIRaN
	uJJ4OBQmcQ1/qxY5r89xhMPWattX+VZsR4rlGVR80eZ7NJS9iCNoxEogOzXWcp3J
	2fhgiRtnEuEc1RN7LZbdqiB7P0vpMpwCLR0r7tYiV0fYX9y963rsxnWiuuVuB5Up
	3bG9Zt8qbeYt4IOhJJaDm7ZyEDijM6f2ThK/W+ok8YNdrTaIzYin8rVo723GeMQE
	dMXZQZTAxtPce56VnJkmxWtjNwNWqCK4Sx7HTN9TNASTRZcI49taH8V86RN1NPPj
	f73Hxw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv8h1ngq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:20:04 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90c8da50f4fso17797016d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 01:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164404; x=1788769204; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JMJxYVwjgN4k+mFm4VS/dxq4WKhyHKBwLuJ9pdotNNg=;
        b=dydn6ADFyoRbaTCsaYMeKkbJ64WVWVaLbMNhgE/WAGVJZMluhMNDcW75yB6er2JXbW
         SRizPe7W2C0di8bOLU5ehrSNro1345CoYXyNwi7rWcu7UEcu6iXaVP9xGNkFpNiWBTb3
         SMU4Xgxcw4i5RMjEXFcSL8We3UVwdXfBPFykGg6TlKXMYkQh/GbJ8a1Gdm0n1OW/g7vx
         NGyt8b1B8T485KNoku2ulR4H/g8F3mKHsWRSo4stDC2NEUHxzPlYV5QJ9W2H70e+L0uO
         7l2f9m6qcvLjgkPY3na0deGqQrX6WnYB49yAZ17xu6rcX7yc6yxmcRvbLU2wgySKQFUO
         uysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164404; x=1788769204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JMJxYVwjgN4k+mFm4VS/dxq4WKhyHKBwLuJ9pdotNNg=;
        b=rKZi68o0c59WWLhoUtvDznSFgzmU7vakGl/ix5XPyHK5IORc1iaZ5AGcaPShRew/J+
         KBaKJ/MgaiLc8FoIaFG4kPNN/4JrqE82Luh9ElQr6glwrisFmWcIVCodNK/s9amcTETV
         Oxb1+6sUo0J6CXIPvoajBglWi9fODW7IPeRQMg2bst5OBSdv8WKaM/J2RrkoRt2TQb9S
         V/Y/lT8LR//4A+qr4GnrfnjW0KW8qH+a8et6fNNi2Gm0lhJtuDuAx3mLsq3ln/Xvjq/1
         s+AlBf6fs7GpOJ204/D4r5U1XFUtYho8HNMVy09lfBzZhKzn5BVsn0s3Wd8cbPnNjBJ0
         0QRg==
X-Gm-Message-State: AFuF++lGYItEOeI1bsu6z3GOnDSyjseAV+BI8c7zuf9Ct37T48JZoB6d
	DRDvE7tNW3N+kui+N716QMGvWGSCE3Mj84sQlXBInKaAS3xjnYctEvs+gGKe55XdrkrM+xeLHdR
	adginh22cIXzfADt3P6u66pmr+I9j/8mKGPNh/jLMRWn1P0qdfYo1sJ/lTNy+VtfjX7lb7xkuVN
	+GMBI=
X-Gm-Gg: AR+sD13cfeK7yBlOwGZvFSNmQVmmsacwrxnLOh1QcWlvgYB1NL9vykcuj7hXOF5eKcO
	SeU7JhgzLca8V4C8FGmXRM2z7ZW7+Vl7hWnvler5IYaX4Vjfla13IHLC4eGrpCt0pTGTzy2fvct
	QrUeF4AtPEfu8lwbFC0Q3IFU9tvoOq1I4CnZC4cR0qBC9VwHOixckRsvz74AbDUNM8Oq/MXLAnQ
	4JhfbAyWmgpX9qI1yGMKEj7newovWndwViSr1sQBSSHhKzjkeRnP+7r/jIOzSP/NDR3b186KnD8
	+OcviI+Bp5x1MWIsv+qif+IFubG2UbIje/by5EU8s7zKgHfc74eZS9YqtIaZHFESfH+ai8CIrOT
	KeTb3Y+LCmb+ggFJMrP/B4hU+FXwhdUQfw2BmTr6fJmq5j5nNF4Zi2N7SVdphguw=
X-Received: by 2002:a05:620a:2b48:b0:936:ce17:dac3 with SMTP id af79cd13be357-939139aef87mr2862035785a.40.1788164403933;
        Mon, 31 Aug 2026 01:20:03 -0700 (PDT)
X-Received: by 2002:a05:620a:2b48:b0:936:ce17:dac3 with SMTP id af79cd13be357-939139aef87mr2862030485a.40.1788164403453;
        Mon, 31 Aug 2026 01:20:03 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917236b86sm735974285a.13.2026.08.31.01.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:20:03 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 16:17:44 +0800
Subject: [PATCH v6 27/29] drm/msm/dp: enable MST on capable sinks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-msm-dp-mst-v6-27-c91d35d6fb9e@oss.qualcomm.com>
References: <20260831-msm-dp-mst-v6-0-c91d35d6fb9e@oss.qualcomm.com>
In-Reply-To: <20260831-msm-dp-mst-v6-0-c91d35d6fb9e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788164246; l=6893;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=mcUALd6iaRGlrPJ5zk1Qq/kc9K8hnA46zdrjtFBolVA=;
 b=iH4w4T7aWISCno+nXOlT4cFopuM323XTtUezd1kX0b9gpLZLGstz3sFM85Ugw9lx2wEWOsCYs
 6MxN7IGAVLDBCCpyECzyy1SW/XLRO2bRiLh82qMuwL/1LZKwT0wik5+
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=DY0nbPtW c=1 sm=1 tr=0 ts=6a953935 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=7j1SYuFnmNb8ZMggdUIA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX8EQ1TPEya4TW
 5Re5+cRJXIlw37ieyyPd8yRoeDwNisaSXVPAd/0qTEVpCniikin97x0GMPG3TcWrE5esgniWyTh
 pMOsWwd5AiIgVqQW6aQg3enESZnI3+JjzHSUFziTLInQ9FA1GCnWTLhuehYQ14U9H6C+b1MBeKH
 1+c8BqonQBkoOY+emOg0O+BSGOQhiVRYfFW4LaLij3GNwkrKKdyWZoj/LjFQVWmyylzdqY1nls8
 OAo0L0itEA/uS2wd+FmwKQBh9B/987WTQdCO4rcHddfI7bYC4STJwBgRpglR3v9UwPhk9CjeZnA
 E4PttCOPXCtPH8TvtfLebOACjFfsOPngdYKEOB2YP7EQv0htnTUsNzROo1vzEas4mMSr9EzxXw9
 cMLJpUox2LPTZGWHUPBT8gnJBJ+KwZoXhk7EZeCk6JFEIdbKonToaJq8jS59cy41t4mHKqwuXUf
 ZfyKj9ICkuyQbKnSyMw==
X-Proofpoint-ORIG-GUID: CsvLnnHOdp1TXDoNG-4MFJEhJnGZCFvC
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX9vMEg83gUTqI
 AeY2dJWgFDCQw2bOFit39eu/ennAhc9xLkk2Ae7iJN1rC05l90n4Q30UzM9/o2JtkGJcxs0Dgm2
 yef0bvwxktlx+8/54ec0NdbKluIUPOo=
X-Proofpoint-GUID: CsvLnnHOdp1TXDoNG-4MFJEhJnGZCFvC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310070

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

MST topology discovery requires the sink to operate in MST mode.
Enable MST on sinks that advertise MST capability and are connected
to a multi-stream capable DP controller.

Once MST is enabled, downstream sink discovery and EDID retrieval are
handled through the MST topology rather than the primary DP connector.
Activate the MST topology manager on connect and disable it on
disconnect to track the sink topology lifecycle.

Snapshot the negotiated link parameters when MST is enabled so
subsequent MST payload allocation can derive bandwidth information
from a stable link configuration.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 59 ++++++++++++++++++++++++++++++++-----
 drivers/gpu/drm/msm/dp/dp_display.h |  2 ++
 drivers/gpu/drm/msm/dp/dp_mst_drm.c | 18 +++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.h |  1 +
 4 files changed, 73 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index f350c1d03b06..dbc0e82d333a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -14,6 +14,7 @@
 #include <linux/string_choices.h>
 #include <drm/display/drm_dp_aux_bus.h>
 #include <drm/display/drm_hdmi_audio_helper.h>
+#include <drm/display/drm_dp_mst_helper.h>
 #include <drm/drm_edid.h>
 
 #include "msm_drv.h"
@@ -269,6 +270,29 @@ static int msm_dp_display_lttpr_init(struct msm_dp_display_private *dp, u8 *dpcd
 	return lttpr_count;
 }
 
+static void msm_dp_display_mst_enable(struct msm_dp_display_private *dp)
+{
+	struct msm_dp *msm_dp = &dp->msm_dp_display;
+	int ret;
+
+	/* Clear any pre-existing MST state before enabling MST. */
+	ret = drm_dp_dpcd_write_byte(dp->aux, DP_MSTM_CTRL, 0);
+	if (ret < 0) {
+		DRM_ERROR("failed to clear DP_MSTM_CTRL, ret=%d\n", ret);
+		return;
+	}
+
+	ret = drm_dp_dpcd_write_byte(dp->aux, DP_MSTM_CTRL,
+				     DP_MST_EN | DP_UP_REQ_EN | DP_UPSTREAM_IS_SRC);
+	if (ret < 0) {
+		DRM_ERROR("sink MST enablement failed\n");
+		return;
+	}
+
+	msm_dp->mst_active = true;
+	msm_dp_mst_display_set_mgr_state(msm_dp, true);
+}
+
 static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 {
 	struct drm_connector *connector = dp->msm_dp_display.connector;
@@ -287,14 +311,17 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	if (rc)
 		goto end;
 
-	drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
-	drm_edid_connector_update(connector, drm_edid);
+	if (msm_dp_ctrl_get_stream_cnt(dp->ctrl) <= 1 ||
+	    !drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd)) {
+		drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
+		drm_edid_connector_update(connector, drm_edid);
 
-	if (!drm_edid) {
-		DRM_ERROR("panel edid read failed\n");
-		/* check edid read fail is due to unplug */
-		if (!msm_dp_aux_is_link_connected(dp->aux))
-			return -ETIMEDOUT;
+		if (!drm_edid) {
+			DRM_ERROR("panel edid read failed\n");
+			/* check edid read fail is due to unplug */
+			if (!msm_dp_aux_is_link_connected(dp->aux))
+				return -ETIMEDOUT;
+		}
 	}
 
 	msm_dp_link_process_request(dp->link);
@@ -316,6 +343,10 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	 */
 	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
 
+	if (msm_dp_ctrl_get_stream_cnt(dp->ctrl) > 1 &&
+	    drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd))
+		msm_dp_display_mst_enable(dp);
+
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
 
 end:
@@ -490,6 +521,11 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 						 dp->panel->dpcd,
 						 dp->panel->downstream_ports);
 
+	if (dp->msm_dp_display.mst_active) {
+		msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, false);
+		dp->msm_dp_display.mst_active = false;
+	}
+
 	/* signal the disconnect event early to ensure proper teardown */
 	msm_dp_display_handle_plugged_change(&dp->msm_dp_display, false);
 
@@ -566,6 +602,15 @@ struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display,
 	return dp_panel;
 }
 
+void msm_dp_display_get_link_info(struct msm_dp *msm_dp_display,
+				  struct msm_dp_link_info *link_info)
+{
+	struct msm_dp_display_private *dp =
+		container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	memcpy(link_info, &dp->panel->link_info, sizeof(*link_info));
+}
+
 static void msm_dp_display_deinit_sub_modules(struct msm_dp_display_private *dp)
 {
 	msm_dp_audio_put(dp->audio);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index ca2faf478c95..96b53d5b6090 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -65,4 +65,6 @@ int msm_dp_get_mst_max_stream(struct msm_dp *msm_dp_display);
 int msm_dp_mst_register(struct msm_dp *msm_dp_display);
 struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display,
 					      enum msm_dp_stream_id stream_id);
+void msm_dp_display_get_link_info(struct msm_dp *msm_dp_display,
+				  struct msm_dp_link_info *link_info);
 #endif /* _DP_DISPLAY_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index 2e625a7db981..b2905c894ce5 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -328,6 +328,24 @@ int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, unsigned int stream_id,
 	return 0;
 }
 
+int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state)
+{
+	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
+	int rc;
+
+	rc = drm_dp_mst_topology_mgr_set_mst(&mst->mst_mgr, state);
+	if (rc < 0) {
+		drm_err(dp_display->drm_dev,
+			"[MST] failed to set topology mgr state to %d rc:%d\n", state, rc);
+	}
+
+	if (state)
+		msm_dp_display_get_link_info(dp_display, &mst->link_info);
+
+	drm_dbg_kms(dp_display->drm_dev, "[MST] set_mgr_state state:%d\n", state);
+	return rc;
+}
+
 void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display)
 {
 	int rc;
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
index 8546214cbca1..4a5707dd50a9 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
@@ -10,6 +10,7 @@
 int msm_dp_mst_mgr_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux);
 int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, unsigned int stream_id,
 			      struct drm_encoder *encoder);
+int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state);
 void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display);
 
 #endif /* _DP_MST_DRM_H_ */

-- 
2.43.0

