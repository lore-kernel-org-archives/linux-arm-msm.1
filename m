Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF72E4048A3
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784702259; cv=none; b=pBhDYhalapH/VmH9q6oKQwqAPKqoKhA+l4T1xBsmKlClesLK2AQkA5h4Q6rNmTkoE4DbNxEm+z6smsT1DG13gatpUCos/3vuUDzOcxRX1FblKmhyIugjmsgjBg5vcdInOhrYtmPFcNA8BTFcXtmxcI2GmV/NAJvfiL9m/rQnXHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784702259; c=relaxed/simple;
	bh=4DQ+lOA4heDv16vW0D7GnzkPlJPQ4WBc9Cgaiq6YU8A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LK07KjQFDB95N4BVWgNXOaYH6ZXHt40tWsNHtTLSezRGp1TQV9opqDfqg77u5hLrWnqfbbE0vRGi4HHGJGeaDLbP39QMP05anBovZAqu7vA0+CsoLBxhHdVY7kP2zX6m36h0eenIBrRg/Cutkb6J4bFXcQJvzINfafUWCsaNw/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NDwMdLfb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f4I8QzH3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NDwMdLfb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f4I8QzH3"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53gNf3473632
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:37:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HuTHf7DomnxmyAExRr8cqK/t+KfaKhs7NDehApDC6xM=; b=NDwMdLfbIkuUR8NY
	YGReKEO4pd1aFg4ji/06nfPg5rwsZaVp38ZFVGkfrIZjVoOEwnG3DcZyylGKfwsl
	eMIos9RvQD7MXxr+VomicoVcDRcbFyz21uAOXG4C5VleC3gcsDsoPMmOlPOh62hz
	TOW14ZEYYxJvwi+wqhedQfd5Z1cBBrVEnk7VD/jbQRQVZbr2LnKcMSur/GUAVVNd
	14Rp7xGTUuUAIM1UjjYz/Q7sx7FfTJRdY0jew9G9L4cYYM/rZpMRVzGg05mfhGu8
	EyLM1WZlX0uz8PaG0DbTEOHYFxOQ3ffXfHsddmVtfeT8wBa9JQDhsjQeb0xZtqxs
	QBoVuQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6ftme2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:37:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1b4d961dso102809411cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784702256; x=1785307056; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HuTHf7DomnxmyAExRr8cqK/t+KfaKhs7NDehApDC6xM=;
        b=f4I8QzH3PWLrf3k9w3f9U1hOBOTMUIpPb8hwYcrE9Yu9+py75Z3pX3u3AcDQiCezcI
         ZjdMex0Kp2AOJov+gyemu4BnZpuJQ0FGoyZ4W6EkXdAUUBMZBM5Vq/OGb7iuD9TNA9KD
         luYDQgC+H8/4WwC869Cwh7TUc1wyyK8BFlG00FVVpUhnUNxMhkrByHcn4L99gdmufHzg
         E9nH5nLLQhpXBHy/JdGfbmyombtQqnQ+QiCxRNnydkq/AJfK8tR1XgCmalw4aUC4DzV1
         u0RauvBjJu0eaMbMIQBRZp0H+5ME6zgpR+e6451+EZnP9IaxsOLo/BJYS5pkWup5U9bz
         DuYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784702256; x=1785307056;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HuTHf7DomnxmyAExRr8cqK/t+KfaKhs7NDehApDC6xM=;
        b=p+7xqUvFazmo5ry5k/dmmFf744iPDuuyzvWXxV8jd/Z5BdbSZssYnwisXjmsFzXmDT
         8wAN71/VN6AUu4N1sAGp/mLfWdLwQ1rzcqcd/EdRjYd9chMPQeKinzQKihjmRDQauG3v
         n9C5yDSFYWsqK8bMilyBBKozkEMro43FjABSYwPdX0eAHTxPXgi3cplBdKhZxrEQLoez
         zEwwU1/ykVr1a5w6JE5Vpn4pI2nD9DUr53Tig4bazgGo83ssJth63vg9tFVyXh7RJ5lK
         wX6o8AIM8Y418gHdyRFwLLXwFBdm3DgHvtMOsPUVN79OaUdyVIyc9cDWngOVjFcUxi58
         X1SQ==
X-Gm-Message-State: AOJu0YyuaJfATKjvUahxkQVyXskGCoMfoXuW6WPQEXcPemg/cMBtesBU
	+Vgr1sUX0hzIHe8/6/3CCNHpeJ+9lCqYD5CsIMX9GthlmS5TayBMdtvR2cIXSQ10pIljjv96vWb
	EDMAKt+VnulzlydXhHLsfmboivrxUO4UDYapiqtUFeuZ8wyIpaXupMladixNo6sehLRt9u5OxUW
	6D
X-Gm-Gg: AR+sD11WGUnL1xKT0miNxexfl3wcTj0Q9ZDByAGu876Vl05wGZEaa3GsuNBx/9G7Ht+
	wQno11VnHN3uoYf6g6iaBZxf5/HZy/5RhyVInM3LT7KLPPsV/HZ3qsnuf6ElTDwAAGvs7DJpCec
	JnpVqD/j5lIIATWbfCFZmm1BlOUJnnnq6Y2AOiM4/m94qR3DOGXPpOC+a4MbRd3E48LmLCSOC8l
	f3Me5BTygZVqL93UtzjuZ94n7aV9pBeekmpYomtPeFscHYKEjS3OeEHBcsF3lhtoBERhMbs0mkC
	wu9FXDdrsXe5khxwKnJSyNmzpUmGT/ymZRvMZ9ta1WhnfRl967ZPnND7c5pt/lbEIUct5MR6eq9
	Tu6G/WVR3vtEUP9sCCt1vuvHGdz8gCkBKEpei+Ry9Hontcz++zKqwdILIRYr8D6MLVgknwNz7st
	8hG9AL5flrIPeuDw==
X-Received: by 2002:ac8:5a48:0:b0:51b:fe30:b8d5 with SMTP id d75a77b69052e-527a8a4d134mr26737011cf.29.1784702255876;
        Tue, 21 Jul 2026 23:37:35 -0700 (PDT)
X-Received: by 2002:ac8:5a48:0:b0:51b:fe30:b8d5 with SMTP id d75a77b69052e-527a8a4d134mr26736751cf.29.1784702255379;
        Tue, 21 Jul 2026 23:37:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8c6f6sm309696e87.4.2026.07.21.23.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:37:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 09:36:37 +0300
Subject: [PATCH 22/24] drm/msm/dp: stop storing the connector in struct
 msm_dp
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-drm-msm-display-interface-v1-22-368c10fe62fd@oss.qualcomm.com>
References: <20260722-drm-msm-display-interface-v1-0-368c10fe62fd@oss.qualcomm.com>
In-Reply-To: <20260722-drm-msm-display-interface-v1-0-368c10fe62fd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13595;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4DQ+lOA4heDv16vW0D7GnzkPlJPQ4WBc9Cgaiq6YU8A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqYGTpe1tl9LAYAHn9BQxGCC9zj6NtvemDcrpAm
 /gk44xsM0CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamBk6QAKCRCLPIo+Aiko
 1dS2B/44xAvMauZtbuskbxSHEvfPTLbq+Cnb10iufjr1MKytVxUY1h4S7mSgtvzM9cqmZGi8UpZ
 jBPd0cG5dU/zX+rGg3Dn0uwJ89V9hc10p88pJvctAtyvGz2UjkQkZ4vX+JjhULF4+DSokoZPcAj
 UQbHgpzO3/hRUNZ3B0E3L0CgoCfY42wfTE2WOMpHe+y19WtRzCOEvDWtmTYfLzAzP/CQGj/hUDY
 q30g35YXhS/qYJwARjdnp84BV12OL9Nrl7Wiah9VUBdyLY2pvJ3xOoBt7CiZOcr3HPorHKbMc2+
 rG9ObS0mPRbi5OmQtyqtE05XkQfIaEDpw+8JTcksWDgtgXrH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: rcA95auUFiF56XkGsIb7ETNO5VKYYPXp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfX5fGifAJEUODr
 jXoLLBbwkXz5uupc/R+UttE5qlrkIYHo+MEwE0EaiJXobYndoJi5DSfF2uuVSQNG6A9lfmYwkAb
 j/OyQkFQ+8Sw9jK4xearfRCAmrj2ybo8wLb1NvfqH3Gk0PkujvSCsNnUQtFfZN0xd1kNzm4GL5X
 KcK+wVQ8tkBK2y+Jt1RGCtA/VMpDLd/QJFSN7Umh1aGvU6jaM2KzP5uGb+dry+n3yJQhg/cN3sd
 zJBbYwQheem8FrtsgOf+kKqB360v9N39MIVGFjF34Icic10M/vxhXP/zLGXmSU2U9NVUQXCbiHS
 E3qv4opUYhWEiUTMzeXo33bortcG5eh+eJGkDKk/feleKFjHVt/DS9kwTrR+mSHqZRVajXKTJOk
 2co4EswQXvQvP0e3+ISdtm1z/qH2+uZsZhfCM1vMft9aQGlobC0jCg8aX5ZTa41eZPDVU/iHuH+
 qTqNNtFmP+HdbVoEoAQ==
X-Authority-Analysis: v=2.4 cv=e/o2j6p/ c=1 sm=1 tr=0 ts=6a606531 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=u0TMEBJnNnsXvnSYAqwA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: rcA95auUFiF56XkGsIb7ETNO5VKYYPXp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfX7yYlsW01X8cp
 n3meaRZrfp/2ikbGdg1skPwmj1mnCClCMo1CIG8Q1mXhbL3glFVNPnYYzzQ5W7ZoyZ71Kv7ox+1
 yqX8Knr/6ZcHn5LGz3KtDqD/AmZ4kaY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220060

struct msm_dp cached the drm_connector so that the asynchronous HPD
handlers, the YUV-420 query and debugfs could reach it. Keeping this
pointer means any common code that creates the connector has to hand it
back to the DP sub-block, and it couples the sub-block to a connector it
does not own.

Every consumer can instead obtain the connector from a context that
already has it:

 - the HPD handler chain (plug/unplug/irq -> process_hpd_high,
   handle_plugged_change) is only ever entered from the bridge
   .hpd_notify callback and the atomic enable/post_disable callbacks,
   all of which carry (or can derive from the atomic state) the
   connector; thread it through;

 - the .is_yuv_mode op is called from the DPU encoder, which already
   fetches the connector from the atomic state - pass it in;

 - .needs_periph_flush is evaluated at flush time, after ->mode_set()
   has cached the result in msm_dp_mode.out_fmt_is_yuv_420, so read the
   cached flag rather than the live connector;

 - debugfs only needs a connector to report status, so look it up from
   the sub-block's encoder.

With that, drop the stored connector.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 108 ++++++++++++++++++++++++------------
 drivers/gpu/drm/msm/dp/dp_display.h |   1 -
 2 files changed, 74 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 4f6da636f7c6..44503789d454 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -265,9 +265,9 @@ static int msm_dp_display_lttpr_init(struct msm_dp_display_private *dp, u8 *dpcd
 	return lttpr_count;
 }
 
-static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
+static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp,
+					   struct drm_connector *connector)
 {
-	struct drm_connector *connector = dp->msm_dp_display.connector;
 	const struct drm_display_info *info = &connector->display_info;
 	int rc = 0;
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
@@ -403,7 +403,8 @@ static int msm_dp_display_handle_irq_hpd(struct msm_dp_display_private *dp)
 	return 0;
 }
 
-static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
+static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp,
+				  struct drm_connector *connector)
 {
 	int ret;
 	struct platform_device *pdev = dp->msm_dp_display.pdev;
@@ -424,7 +425,7 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 
 	msm_dp_display_host_phy_init(dp);
 
-	ret = msm_dp_display_process_hpd_high(dp);
+	ret = msm_dp_display_process_hpd_high(dp, connector);
 
 	drm_dbg_dp(dp->drm_dev, "After, type=%d sink_count=%d\n",
 			dp->msm_dp_display.connector_type,
@@ -436,7 +437,7 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 };
 
 static void msm_dp_display_handle_plugged_change(struct msm_dp *msm_dp_display,
-		bool plugged)
+		struct drm_connector *connector, bool plugged)
 {
 	struct msm_dp_display_private *dp;
 
@@ -445,11 +446,11 @@ static void msm_dp_display_handle_plugged_change(struct msm_dp *msm_dp_display,
 
 	/* notify audio subsystem only if sink supports audio */
 	if (dp->audio_supported)
-		drm_connector_hdmi_audio_plugged_notify(msm_dp_display->connector,
-							plugged);
+		drm_connector_hdmi_audio_plugged_notify(connector, plugged);
 }
 
-static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
+static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp,
+				    struct drm_connector *connector)
 {
 	struct platform_device *pdev = dp->msm_dp_display.pdev;
 
@@ -467,7 +468,7 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 
 	/* Don't forget modes for eDP */
 	if (!dp->msm_dp_display.is_edp)
-		drm_edid_connector_update(dp->msm_dp_display.connector, NULL);
+		drm_edid_connector_update(connector, NULL);
 
 	/* triggered by irq_hdp with sink_count = 0 */
 	if (dp->link->sink_count == 0)
@@ -477,14 +478,14 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 	 * We don't need separate work for disconnect as
 	 * connect/attention interrupts are disabled
 	 */
-	if (dp->msm_dp_display.connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
-		drm_dp_set_subconnector_property(dp->msm_dp_display.connector,
+	if (connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
+		drm_dp_set_subconnector_property(connector,
 						 connector_status_disconnected,
 						 dp->panel->dpcd,
 						 dp->panel->downstream_ports);
 
 	/* signal the disconnect event early to ensure proper teardown */
-	msm_dp_display_handle_plugged_change(&dp->msm_dp_display, false);
+	msm_dp_display_handle_plugged_change(&dp->msm_dp_display, connector, false);
 
 	drm_dbg_dp(dp->drm_dev, "After, type=%d, sink_count=%d\n",
 			dp->msm_dp_display.connector_type,
@@ -498,7 +499,8 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 	return 0;
 }
 
-static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
+static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp,
+				 struct drm_connector *connector)
 {
 	u32 sink_request;
 	int rc = 0;
@@ -514,7 +516,7 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
 		sink_request = dp->link->sink_request;
 		drm_dbg_dp(dp->drm_dev, "sink_request=%d\n", sink_request);
 		if (sink_request & DS_PORT_STATUS_CHANGED)
-			rc = msm_dp_display_process_hpd_high(dp);
+			rc = msm_dp_display_process_hpd_high(dp, connector);
 		else
 			rc = msm_dp_display_handle_irq_hpd(dp);
 	}
@@ -648,7 +650,8 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp, bool force_l
 	return rc;
 }
 
-static int msm_dp_display_post_enable(struct msm_dp *msm_dp_display)
+static int msm_dp_display_post_enable(struct msm_dp *msm_dp_display,
+				      struct drm_connector *connector)
 {
 	struct msm_dp_display_private *dp;
 	u32 rate;
@@ -663,7 +666,7 @@ static int msm_dp_display_post_enable(struct msm_dp *msm_dp_display)
 	}
 
 	/* signal the connect event late to synchronize video and display */
-	msm_dp_display_handle_plugged_change(msm_dp_display, true);
+	msm_dp_display_handle_plugged_change(msm_dp_display, connector, true);
 
 	if (msm_dp_display->psr_supported)
 		msm_dp_ctrl_config_psr(dp->ctrl);
@@ -671,7 +674,8 @@ static int msm_dp_display_post_enable(struct msm_dp *msm_dp_display)
 	return 0;
 }
 
-static int msm_dp_display_disable(struct msm_dp_display_private *dp)
+static int msm_dp_display_disable(struct msm_dp_display_private *dp,
+				  struct drm_connector *connector)
 {
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
@@ -681,7 +685,7 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 	/* wait only if audio was enabled */
 	if (msm_dp_display->audio_enabled) {
 		/* signal the disconnect event */
-		msm_dp_display_handle_plugged_change(msm_dp_display, false);
+		msm_dp_display_handle_plugged_change(msm_dp_display, connector, false);
 		if (!wait_for_completion_timeout(&dp->audio_comp,
 				HZ * 5))
 			DRM_ERROR("audio comp timeout\n");
@@ -1314,7 +1318,15 @@ void __exit msm_dp_unregister(void)
 static bool msm_dp_needs_periph_flush(const struct msm_dp *msm_dp_display,
 				      const struct drm_display_mode *mode)
 {
-	return drm_mode_is_420_only(&msm_dp_display->connector->display_info, mode);
+	struct msm_dp_display_private *dp = container_of(msm_dp_display,
+			struct msm_dp_display_private, msm_dp_display);
+
+	/*
+	 * The YUV-420 output format is determined during ->mode_set(), which
+	 * has already run by the time this is queried at flush time; use the
+	 * cached value so no connector lookup is needed here.
+	 */
+	return dp->panel->msm_dp_mode.out_fmt_is_yuv_420;
 }
 
 bool msm_dp_wide_bus_available(const struct msm_dp *msm_dp_display)
@@ -1329,6 +1341,25 @@ bool msm_dp_wide_bus_available(const struct msm_dp *msm_dp_display)
 	return dp->wide_bus_supported;
 }
 
+static struct drm_connector *
+msm_dp_display_get_connector(struct msm_dp *msm_dp_display)
+{
+	struct drm_encoder *encoder = msm_dp_display->bridge->encoder;
+	struct drm_connector_list_iter conn_iter;
+	struct drm_connector *connector, *found = NULL;
+
+	drm_connector_list_iter_begin(msm_dp_display->drm_dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
+		if (drm_connector_has_possible_encoder(connector, encoder)) {
+			found = connector;
+			break;
+		}
+	}
+	drm_connector_list_iter_end(&conn_iter);
+
+	return found;
+}
+
 void msm_dp_display_debugfs_init(struct msm_dp *msm_dp_display, struct dentry *root, bool is_edp)
 {
 	struct msm_dp_display_private *dp;
@@ -1338,7 +1369,9 @@ void msm_dp_display_debugfs_init(struct msm_dp *msm_dp_display, struct dentry *r
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 	dev = &dp->msm_dp_display.pdev->dev;
 
-	rc = msm_dp_debug_init(dev, dp->panel, dp->link, dp->msm_dp_display.connector, root, is_edp);
+	rc = msm_dp_debug_init(dev, dp->panel, dp->link,
+			       msm_dp_display_get_connector(msm_dp_display),
+			       root, is_edp);
 	if (rc)
 		DRM_ERROR("failed to initialize debug, rc = %d\n", rc);
 }
@@ -1347,6 +1380,7 @@ static int msm_dp_modeset_init(struct msm_display *display,
 			       struct drm_device *dev, struct drm_encoder *encoder)
 {
 	struct msm_dp *msm_dp_display = container_of(display, struct msm_dp, display);
+	struct drm_connector *connector;
 	int ret;
 
 	msm_dp_display->drm_dev = dev;
@@ -1358,12 +1392,11 @@ static int msm_dp_modeset_init(struct msm_display *display,
 		return ret;
 	}
 
-	msm_dp_display->connector = msm_dp_drm_connector_init(msm_dp_display, encoder);
-	if (IS_ERR(msm_dp_display->connector)) {
-		ret = PTR_ERR(msm_dp_display->connector);
+	connector = msm_dp_drm_connector_init(msm_dp_display, encoder);
+	if (IS_ERR(connector)) {
+		ret = PTR_ERR(connector);
 		DRM_DEV_ERROR(dev->dev,
 			"failed to create dp connector: %d\n", ret);
-		msm_dp_display->connector = NULL;
 		return ret;
 	}
 
@@ -1454,14 +1487,17 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
+	struct drm_connector *connector;
 	int rc = 0;
 	struct msm_dp_display_private *msm_dp_display;
 	bool force_link_train = false;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
+	connector = drm_atomic_get_new_connector_for_encoder(state, drm_bridge->encoder);
+
 	if (dp->is_edp)
-		msm_dp_hpd_plug_handle(msm_dp_display);
+		msm_dp_hpd_plug_handle(msm_dp_display, connector);
 
 	if (pm_runtime_resume_and_get(&dp->pdev->dev)) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
@@ -1485,10 +1521,10 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 
 	msm_dp_display_enable(msm_dp_display, force_link_train);
 
-	rc = msm_dp_display_post_enable(dp);
+	rc = msm_dp_display_post_enable(dp, connector);
 	if (rc) {
 		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
-		msm_dp_display_disable(msm_dp_display);
+		msm_dp_display_disable(msm_dp_display, connector);
 	}
 
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
@@ -1512,13 +1548,17 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
 	struct msm_dp_display_private *msm_dp_display;
+	struct drm_connector *connector;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
+	connector = drm_atomic_get_old_connector_for_encoder(state,
+							     drm_bridge->encoder);
+
 	if (dp->is_edp)
-		msm_dp_hpd_unplug_handle(msm_dp_display);
+		msm_dp_hpd_unplug_handle(msm_dp_display, connector);
 
-	msm_dp_display_disable(msm_dp_display);
+	msm_dp_display_disable(msm_dp_display, connector);
 
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
 
@@ -1581,15 +1621,15 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 
 	if (status == connector_status_connected) {
 		if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
-			msm_dp_hpd_unplug_handle(dp);
-			msm_dp_hpd_plug_handle(dp);
+			msm_dp_hpd_unplug_handle(dp, connector);
+			msm_dp_hpd_plug_handle(dp, connector);
 		} else if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT) {
-			msm_dp_irq_hpd_handle(dp);
+			msm_dp_irq_hpd_handle(dp, connector);
 		} else {
-			msm_dp_hpd_plug_handle(dp);
+			msm_dp_hpd_plug_handle(dp, connector);
 		}
 	} else {
-		msm_dp_hpd_unplug_handle(dp);
+		msm_dp_hpd_unplug_handle(dp, connector);
 	}
 
 	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index f1523dbe33d5..a93904ea33c7 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -16,7 +16,6 @@ struct msm_dp {
 
 	struct drm_device *drm_dev;
 	struct platform_device *pdev;
-	struct drm_connector *connector;
 	struct drm_bridge *next_bridge;
 	struct drm_bridge *bridge;
 	bool audio_enabled;

-- 
2.47.3

