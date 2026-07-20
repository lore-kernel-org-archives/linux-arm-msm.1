Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5293A9620
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784527859; cv=none; b=C8aYsWbBB41o9NqD1nN+yyyFl7o6Qm8k3I8XKukzaN6T05vjr2+usTQUX7xyO4gvSC/VMWeGCifQNBmCoPJRvogdRGT6MayI/O1WyEq+gOFqZs4rDpDsoM5gJNStldq7Tj/A88jBGYm1X1voVJU2g4Yu5xYgxE8YFu6FTcvIAoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784527859; c=relaxed/simple;
	bh=LP1bBf0Vb6ZnUlayEv9S2XfnnOCE62sCsJ2zjFS/NEU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GOVu3wfD485ff27XTe/eJIT0WmyLxhKzjzlSzqAvD+xT/RssREOa7wwR5u1VldvyDDlIFGL0ELN6D2W0n0U6fOUXfuwtvTEyRkrmmNvBtC/tEMFbhn8Tqvjeje4IHrcTbl0u9ki3VOCTEFmPKGtKnUlMTfQ/L/+C6U+m3WoKcBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=otzPeTWg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UQellTn2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="otzPeTWg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UQellTn2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNtVkP1913615
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6RVYwkb4H54FkQQb0ZYMBEcWB3pTj6pVlXuH6Bm32ok=; b=otzPeTWgE/U3cyK7
	s52yq6jMdoNyOGjp1uvcVGxrdMQtr4+2riWykNmf/qvi1cQLmMTu3j777XpSHcwu
	UtaSaR6tO+04H5wi+kJ5HBgwGgEBNQVmEKoV+RfHnuwcRPmBHPlk4aGcXY85cGmX
	MPwRMUzFoEQ28yBYQ8oJMZYIcSC0IR6aziLzNcRpdjdDH9gQbRhCAyFkjYDVSdSF
	CPdbTvtzTqqJrM8UvCoqxrKUD+i2jXqP6X0vxyX7/7S/S0+6ue+cQ3ARElZDBTHT
	+Dq+RQ8hzVjp/MxO5RKIPc85buc6JZk88lDl69Y5favmzky3pBLKC641ZRbH3YMz
	7hf21g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2aavmfw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:10:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e55f0613cso1443188385a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jul 2026 23:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784527851; x=1785132651; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6RVYwkb4H54FkQQb0ZYMBEcWB3pTj6pVlXuH6Bm32ok=;
        b=UQellTn247SAWWhnMG/VQSnQHbhl0FC+sj8eUT6UfU2lc6yrnqO+PQKuUAnPjO81tY
         9Ibk/UOa1xKgnCu19Q4aTCKBohUDD4fug8gBLQq0JI7Sv43O9fTvdtEcizFr+YPu2i40
         5/1ABvPAk6Yui4esMKtpgRD65F9pRKDXTmDZICuaDlpL+Lp7bg/tg3x5oAlSFRLCptO2
         7RucqHTSiOZxoQuMyElTNau8LPD7nmFd11IDI7IELBnJ2auycF6REq20lq+n+lVcIqwk
         NRDj9Aw3fnAjoRTrpDDnoNp9etMINQopseGY8FJnuSMQI7WO1PoYxW1QIcVCqBjKkb09
         mDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784527851; x=1785132651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6RVYwkb4H54FkQQb0ZYMBEcWB3pTj6pVlXuH6Bm32ok=;
        b=OcbY3afc9YYhMDVJHEuw2MDy+fysax/IvrXQO5XIHq3kXo+aWYfm8ChpzAfKRq0cPT
         TokJwNbfEQjkSXnIy6fC6gQY6Y+n3Z8oFP9yRaVWzc3EfaGI/MQZ3oE7OryTyW3uQJXh
         XyjkroWV8qhLiZLXhTcE6C6jc+htu7KfjoiknggElZqSwQAfgoQFI77lhbvxn+g4jEA9
         U0z+vB6CbtHD9HLAeicvUqcrvUNGLa0vYrFLzk2s4720Tdh/1WWfvVXy2I/bZ1CMuZ5g
         4PHKLDPlrTe2j8z5I6NvKf4/lDqRg2RoZ83vSmyLhQppgsG01jwOWAhRBpVHMe1PWoZc
         BQvg==
X-Gm-Message-State: AOJu0Yy/TMo0V/VOrgEZRay/25JuTNE8BxVmNbGvk2sfbpv0/DOxbi4V
	lBDIYQ/YWDgRqtrTk1Q3lmjETpuZtnj4n1mk3RIw1s7NWrQ8iSnymOyBKjjm+IXEus+1aiYNZRl
	4k5rUFzG6K3hYjRISPqbFtn/uAq4gzFHjdOCoxRQ5tGYvg0ifIUPY6R+/7+fB8FiEoM/C
X-Gm-Gg: AfdE7cn3MbwwriSwYp8DpGYgywWs5OprZx/Hemou4qQYHW+tAxSPmgHgHR47i2pZa+U
	cFUq6enzlea4g7EmSelgyKCe+TRfOl8Xw4mWUVf4hyFlArY1P9slux031SClrE+BKsiFfZSkrXm
	TMA+AzTRK3bUf/kVQp17lPt0qzaYGNl4zXk8jpf1OG8nmQmpJsZkOgfO91MyJV9yOblcOkrZAc1
	sN0uIQM9N4+xmDwA/KOi/5czv+b14/45fgAcGK/+DO53B5f2Ing5PN6kchT/FAGWRlZ7XAo1/Vs
	L+msQrZSWF25KwIPBs6T+ebfGxjyUrr6SmDPhD+W9N58HE9bgdEZuMs6mW/16qbHbsLITMl5M4l
	OuHrW9RiZWW194JIxE+f7IqU5VC5WbAaS/MxTcgG72+h3HgOCjxqDsCN05XocMb4=
X-Received: by 2002:a0c:f107:0:b0:907:83d1:e819 with SMTP id 6a1803df08f44-90783d1eb6bmr74783076d6.41.1784527850727;
        Sun, 19 Jul 2026 23:10:50 -0700 (PDT)
X-Received: by 2002:a0c:f107:0:b0:907:83d1:e819 with SMTP id 6a1803df08f44-90783d1eb6bmr74782786d6.41.1784527850261;
        Sun, 19 Jul 2026 23:10:50 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90778588a39sm84793216d6.20.2026.07.19.23.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 23:10:49 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 14:08:08 +0800
Subject: [PATCH v8 01/15] drm/msm/dp: remove cached drm_edid from panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-dp_mstclean-v8-1-bea261bf4e7d@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784527840; l=9288;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=LP1bBf0Vb6ZnUlayEv9S2XfnnOCE62sCsJ2zjFS/NEU=;
 b=2tpWPTo75rPsOpwU/EEWSvH/jNEwz68u/ggOO1aNiVtvcHNGss44JgTlhV4J4DOzQqbUHPAyY
 8njByBoQ/nmAxan9z6KPHcb7MYY2ArglmZIjPL1279PBo1oo+3zRY/1
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: jkgxLGMVVCi4e1UuXXTbylMtP9PNFHad
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA2NiBTYWx0ZWRfXxgud80Q5DTLM
 r3kPa+ZjbKlpN27OUwbSuJqKl6fKjwK0XmBm3XqKlt7xCT07KKIpdjkowZcKuqahyGW9OcWyFUm
 gRy/VkWL23Vw21EMW4y4+Kji4SCsbAk=
X-Authority-Analysis: v=2.4 cv=b9aCJNGx c=1 sm=1 tr=0 ts=6a5dbbeb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=nMQ0Ez7JKoBJ6qvYvS4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: jkgxLGMVVCi4e1UuXXTbylMtP9PNFHad
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA2NiBTYWx0ZWRfX8sIW68qyowxH
 SeRvuAvCnZb7gWrmqIMCnrpEn7FcovfhXO7rRlacViuNZf0JhM9HOpOld6Svr+Rm+H+U3hKelbd
 QIbUC0gYmiDcwrvzC0MQHsfOCqYvQccLxvJmRkdrzI56W1pOcOQuEnW8ET1diHsgD4R/qRkTQAy
 bA68Cva2wWtJuHKfEHgdRhtE3ogcuvbOB6PbStgoRYSPZpklrfo27dYeA7qXOyUsPf94M2JqY64
 A5BECEHEnPc7sj5VDPpi5klN3mJPPk6IlXr8W+EZDOUmpTuf8dxMDKSIdsAEveh0q+NO8EcvYGT
 cxpvJYynsHcb+XKUOIru0kHCrDhitd0F6W3xu9HQKTrPow2EfvriN1Z4/e68MFIG4lHytyEDKBr
 v3oHNGwrF1oPqO+iiBk1S1B1aI8J520Eim2GAU1AFbD/Tng1Y+w+BraZEV7djuBX8+Xm/LXvbgS
 mdAj7Bm8cV8LfZ7Z/zQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200066

The cached drm_edid seems unnecessary here. Use the drm_edid pointer
directly in the plug stage instead of caching it. Remove the cached
drm_edid and the corresponding oneliner to simplify the code.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 28 +++++++++++-------
 drivers/gpu/drm/msm/dp/dp_panel.c   | 59 ++++---------------------------------
 drivers/gpu/drm/msm/dp/dp_panel.h   | 13 +++-----
 3 files changed, 27 insertions(+), 73 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index dc6f33809ca5..bce165bac106 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -269,6 +269,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	const struct drm_display_info *info = &connector->display_info;
 	int rc = 0;
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
+	const struct drm_edid *drm_edid = NULL;
 
 	rc = drm_dp_read_dpcd_caps(dp->aux, dpcd);
 	if (rc)
@@ -276,10 +277,20 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 
 	dp->link->lttpr_count = msm_dp_display_lttpr_init(dp, dpcd);
 
-	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
+	rc = msm_dp_panel_read_link_caps(dp->panel, connector);
 	if (rc)
 		goto end;
 
+	drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
+	drm_edid_connector_update(connector, drm_edid);
+
+	if (!drm_edid) {
+		DRM_ERROR("panel edid read failed\n");
+		/* check edid read fail is due to unplug */
+		if (!msm_dp_aux_is_link_connected(dp->aux))
+			return -ETIMEDOUT;
+	}
+
 	msm_dp_link_process_request(dp->link);
 
 	if (!dp->msm_dp_display.is_edp)
@@ -291,7 +302,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	dp->msm_dp_display.psr_supported = dp->panel->psr_cap.version && psr_enabled;
 
 	dp->audio_supported = info->has_audio;
-	msm_dp_panel_handle_sink_request(dp->panel);
+	msm_dp_panel_handle_sink_request(dp->panel, drm_edid);
 
 	/*
 	 * set sink to normal operation mode -- D0
@@ -302,6 +313,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
 
 end:
+	drm_edid_free(drm_edid);
 	return rc;
 }
 
@@ -453,7 +465,7 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 
 	/* Don't forget modes for eDP */
 	if (!dp->msm_dp_display.is_edp)
-		msm_dp_panel_unplugged(dp->panel, dp->msm_dp_display.connector);
+		drm_edid_connector_update(dp->msm_dp_display.connector, NULL);
 
 	/* triggered by irq_hdp with sink_count = 0 */
 	if (dp->link->sink_count == 0)
@@ -515,7 +527,6 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
 static void msm_dp_display_deinit_sub_modules(struct msm_dp_display_private *dp)
 {
 	msm_dp_audio_put(dp->audio);
-	msm_dp_panel_put(dp->panel);
 	msm_dp_aux_put(dp->aux);
 }
 
@@ -566,7 +577,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 		rc = PTR_ERR(dp->ctrl);
 		DRM_ERROR("failed to initialize ctrl, rc = %d\n", rc);
 		dp->ctrl = NULL;
-		goto error_ctrl;
+		goto error_link;
 	}
 
 	dp->audio = msm_dp_audio_get(dp->msm_dp_display.pdev, dp->link_base);
@@ -574,13 +585,11 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 		rc = PTR_ERR(dp->audio);
 		pr_err("failed to initialize audio, rc = %d\n", rc);
 		dp->audio = NULL;
-		goto error_ctrl;
+		goto error_link;
 	}
 
 	return rc;
 
-error_ctrl:
-	msm_dp_panel_put(dp->panel);
 error_link:
 	msm_dp_aux_put(dp->aux);
 error:
@@ -744,8 +753,7 @@ int msm_dp_display_get_modes(struct msm_dp *dp)
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
-	return msm_dp_panel_get_modes(msm_dp_display->panel,
-		dp->connector);
+	return drm_edid_connector_add_modes(msm_dp_display->panel->connector);
 }
 
 bool msm_dp_display_check_video_test(struct msm_dp *dp)
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 5b4954e7cb74..bde4a772d22c 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -232,8 +232,8 @@ static u32 msm_dp_panel_get_supported_bpp(struct msm_dp_panel *msm_dp_panel,
 	return min_supported_bpp;
 }
 
-int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
-	struct drm_connector *connector)
+int msm_dp_panel_read_link_caps(struct msm_dp_panel *msm_dp_panel,
+				struct drm_connector *connector)
 {
 	int rc, bw_code;
 	int count;
@@ -271,36 +271,9 @@ int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
 
 	rc = drm_dp_read_downstream_info(panel->aux, msm_dp_panel->dpcd,
 					 msm_dp_panel->downstream_ports);
-	if (rc)
-		return rc;
-
-	drm_edid_free(msm_dp_panel->drm_edid);
-
-	msm_dp_panel->drm_edid = drm_edid_read_ddc(connector, &panel->aux->ddc);
-
-	drm_edid_connector_update(connector, msm_dp_panel->drm_edid);
-
-	if (!msm_dp_panel->drm_edid) {
-		DRM_ERROR("panel edid read failed\n");
-		/* check edid read fail is due to unplug */
-		if (!msm_dp_aux_is_link_connected(panel->aux)) {
-			rc = -ETIMEDOUT;
-			goto end;
-		}
-	}
-
-end:
 	return rc;
 }
 
-void msm_dp_panel_unplugged(struct msm_dp_panel *msm_dp_panel,
-			    struct drm_connector *connector)
-{
-	drm_edid_connector_update(connector, NULL);
-	drm_edid_free(msm_dp_panel->drm_edid);
-	msm_dp_panel->drm_edid = NULL;
-}
-
 u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel,
 		u32 mode_edid_bpp, u32 mode_pclk_khz)
 {
@@ -324,22 +297,6 @@ u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel,
 	return bpp;
 }
 
-int msm_dp_panel_get_modes(struct msm_dp_panel *msm_dp_panel,
-	struct drm_connector *connector)
-{
-	if (!msm_dp_panel) {
-		DRM_ERROR("invalid input\n");
-		return -EINVAL;
-	}
-
-	if (msm_dp_panel->drm_edid) {
-		drm_edid_connector_update(connector, msm_dp_panel->drm_edid);
-		return drm_edid_connector_add_modes(connector);
-	}
-
-	return 0;
-}
-
 static u8 msm_dp_panel_get_edid_checksum(const struct edid *edid)
 {
 	edid += edid->extensions;
@@ -347,7 +304,8 @@ static u8 msm_dp_panel_get_edid_checksum(const struct edid *edid)
 	return edid->checksum;
 }
 
-void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel)
+void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel,
+				      const struct drm_edid *drm_edid)
 {
 	struct msm_dp_panel_private *panel;
 
@@ -360,7 +318,7 @@ void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel)
 
 	if (panel->link->sink_request & DP_TEST_LINK_EDID_READ) {
 		/* FIXME: get rid of drm_edid_raw() */
-		const struct edid *edid = drm_edid_raw(msm_dp_panel->drm_edid);
+		const struct edid *edid = drm_edid_raw(drm_edid);
 		u8 checksum;
 
 		if (edid)
@@ -757,10 +715,3 @@ struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux
 	return msm_dp_panel;
 }
 
-void msm_dp_panel_put(struct msm_dp_panel *msm_dp_panel)
-{
-	if (!msm_dp_panel)
-		return;
-
-	drm_edid_free(msm_dp_panel->drm_edid);
-}
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 9173e90a5053..53b7b4463551 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -33,7 +33,6 @@ struct msm_dp_panel {
 	u8 downstream_ports[DP_MAX_DOWNSTREAM_PORTS];
 
 	struct msm_dp_link_info link_info;
-	const struct drm_edid *drm_edid;
 	struct drm_connector *connector;
 	struct msm_dp_display_mode msm_dp_mode;
 	struct msm_dp_panel_psr psr_cap;
@@ -47,15 +46,12 @@ struct msm_dp_panel {
 int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel);
 int msm_dp_panel_deinit(struct msm_dp_panel *msm_dp_panel);
 int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en);
-int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
-		struct drm_connector *connector);
-void msm_dp_panel_unplugged(struct msm_dp_panel *msm_dp_panel,
-			    struct drm_connector *connector);
+int msm_dp_panel_read_link_caps(struct msm_dp_panel *msm_dp_panel,
+				struct drm_connector *connector);
 u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel, u32 mode_max_bpp,
 			u32 mode_pclk_khz);
-int msm_dp_panel_get_modes(struct msm_dp_panel *msm_dp_panel,
-		struct drm_connector *connector);
-void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel);
+void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel,
+				      const struct drm_edid *drm_edid);
 void msm_dp_panel_tpg_config(struct msm_dp_panel *msm_dp_panel, bool enable);
 
 void msm_dp_panel_clear_dsc_dto(struct msm_dp_panel *msm_dp_panel);
@@ -94,5 +90,4 @@ struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux
 			      struct msm_dp_link *link,
 			      void __iomem *link_base,
 			      void __iomem *p0_base);
-void msm_dp_panel_put(struct msm_dp_panel *msm_dp_panel);
 #endif /* _DP_PANEL_H_ */

-- 
2.43.0

