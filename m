Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D771420487
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785234109; cv=none; b=ckyfhwJhliyLQzfqML8lB8olYPy5V9fhqTwaMzI0yd3B8udjC/bcmg61Ry8lSS+95uc4isWuaZ2MGZ4zu+Ah5+OIx1tTZO65pOugNWnKn2DpkJquKs+Pfdn/Z+KdgGaOqbP+x+3fOetXbMvJJbCzfTIpzocUy58uq4wcRnmftjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785234109; c=relaxed/simple;
	bh=s8rdGo4O0mhuKz5Cx6GYw6NsZqFohaGuUi8GNAOlPhs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YhQI13jzOAOPk5bx1VPXwegydFOtFyEazkaXfCYdnn/RF0Kg5hzzAMjf9Nuydr3ARnWxREhORJPnmL0+uuHQ3cMB/q+My3PkRRk+mjntqLx/uNt0MEdB/YjvlTd3exJnu6iunx/EfhVRDWHTFpt9/70A/MUteX5L9gomQHy01Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NXQDf/Zb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dp7+apdq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NXQDf/Zb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dp7+apdq"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82Aqq3295066
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YyD8ZkvyjHNC8hSyNjzxEIQwc+4wkWjG+0IWoFpyg7I=; b=NXQDf/ZbL19N8uFU
	sslLJHChFHLqOfWKB+r2tzVytz3BdDI0g0Dni7EM3y1TuCM0iQWd8FDhngQpa18A
	wXM0waH+KbaqCKYXmiA1eSi0a7B1AoVQAZzEVyMLaI57w68d+9xjeIhbkhR9zeEi
	9/hRQ82470jfZwn7zlorEey7bdYW8mNBxEL/ou0ryoPbyuyVKBu5qPDnGnni7e+k
	nXbe/gGAdA+TCQT9+PjWxFbdryimOB5hkGzcD2wnzsYF8dsijogeItiotU8PAFr/
	LOEu/MrV+HFJq7PfFeovErT5iLEn3xn5nlSAfeRvQuIuDcXxCIPfMuKt8LDNoMmx
	IlLHEA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbp5krxt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:21:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e8004d60eso717156685a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 03:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785234106; x=1785838906; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YyD8ZkvyjHNC8hSyNjzxEIQwc+4wkWjG+0IWoFpyg7I=;
        b=dp7+apdq+xBIDbXujAM+onGrfbsBRzd3jD0cc4YnrOj7j5wmaSojnTfX5HaujqpNus
         jeb9lgICy39OqicOEB4rt7bgcodg/o7/z0vwvQPnI+B/JcFf0KFUiaLHD9zWxpfC/aem
         WIZPykDiYesRPIm+d3snaBeZ/W3AW9E6E5BmEtNU2Sj/vHQmw6JPmnDz9tGp1jNrVpnY
         qys23VhIbU2Od+EYzJ22AF72KpKB8hZu7RlO7rc2Qo9ZkuX9GKZ3twPxeW2oMeAuInn+
         8aGLt51Rtn53JIsO+CadZLurtjvyrFW1Tw8wagcQgCc63q/vRMY+UMGhPYBYJSw7aHMj
         qiMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785234106; x=1785838906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YyD8ZkvyjHNC8hSyNjzxEIQwc+4wkWjG+0IWoFpyg7I=;
        b=nHFSs3mhplwATaLW00iKbr5cYASOfdsjC3IvarQ9hwTLEXe1fxBTI+InfZYcRxRp7n
         tC61pdoVSRmY0YxGaI6gW7c/+6boimI12Uj8jcELjh4yR6UGOOP7W2J8Qq8OFeIpdWx7
         iLr7JefLVtxr9ZFxYXJAcvEhDsNF+tE1/1XDWQ5fRO0WXFT9RHTM3sNWwHfEK+z0poSY
         XJhW1b0AIkeRVYO3kd/id2TBbad+HVgPZSOnemVwK5AomnH+kSBjrvJ2HQGY6Sw8w3id
         mmM9hfIH4DHQBUXr094tPsPuHJaqmPEAAV/9KNAgjtfwI4+AMD056sCfuT3JA7HFU+iY
         pcVg==
X-Gm-Message-State: AOJu0Yw4SEale/3tVUEyY8Ygd4I3v/3qeyZ2Eag6DYQcvvbPivIIr/pj
	cTLdIuIa3YlZeog/FeGFYuIKxQo8zSo46k5ISnqN/mkg7Y8aTp139N+s8qPFhZh8KqlsiJnQhek
	4VPaaDTACALrv3cmbuH1zMVAb8pi+9U6MeUGlD9frpJf8DNpp/OKyZ2xKLtDi205fYS34AoMHA5
	ILNY0=
X-Gm-Gg: AR+sD1393rEvujXdzQ2H7whJP/BKAldi0eqQXLzyCTsBClQPO3oLUPY5dOUJF40/1lc
	EWkk50daiq65nN5dXU7NU0PExsYxmBvYNOGWrRQxD5RxhmkgoYautu4x6T6yp+K78ioUK+OldEP
	UoYsSTHPfPwsWMCWCVOdoWaRp9BdM9ji8TPDcCQYkrPoDegURdI37rfb6Y/g5uxe7p3o4Fm29g6
	UlV4CajWGrQSHdAWKWUuq2EwSuVFzcNxnSG9z9LaPqanraPI6fZEUd9Lbcq2PxdyCrGLrvEPl8Q
	W3AqcB8zShB2VltmjB5qtjVpibBdgA1iwfU34GXLYeJ48f9giEs0H72bpkUBzqrWG+VLtBijJzb
	MVEz/ld36An0Fp7/GPWwmDdRwRhTb7QP7XebtOvpdhyC7R4ayqJq5IPqetPVNF/A=
X-Received: by 2002:a05:620a:2683:b0:92e:c28c:9dff with SMTP id af79cd13be357-9330272a8e7mr137454785a.6.1785234105377;
        Tue, 28 Jul 2026 03:21:45 -0700 (PDT)
X-Received: by 2002:a05:620a:2683:b0:92e:c28c:9dff with SMTP id af79cd13be357-9330272a8e7mr137452985a.6.1785234104904;
        Tue, 28 Jul 2026 03:21:44 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907e869ba73sm84791396d6.25.2026.07.28.03.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 03:21:44 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 18:21:30 +0800
Subject: [PATCH v9 01/14] drm/msm/dp: remove cached drm_edid from panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-dp_mstclean-v9-1-f7779fce10f4@oss.qualcomm.com>
References: <20260728-dp_mstclean-v9-0-f7779fce10f4@oss.qualcomm.com>
In-Reply-To: <20260728-dp_mstclean-v9-0-f7779fce10f4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785234095; l=9357;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=s8rdGo4O0mhuKz5Cx6GYw6NsZqFohaGuUi8GNAOlPhs=;
 b=nTI59mUcKIb8v+V1AUArpldMibiUi7TJ0TGfhxhaA7jkIhQE9Jg3//e4yH98n5R2VRLealmti
 PPdmmib8n1zBpf5mfnSWp6bVbClUQCp0CS1y41m0MVudgycT4oV0Ki4
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA5MSBTYWx0ZWRfXw+cAdoS+4Apn
 lXl52MKmOtdh/434XPg32scZ4PZPYD2GTFF5pQvNCgjBX0fJt+l7DvxVh7wOe0Adsb+ytnGjScz
 UIojTMs8BoeUrOU4nQubRhdY7g9C2bY=
X-Authority-Analysis: v=2.4 cv=XuDK/1F9 c=1 sm=1 tr=0 ts=6a6882ba cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=nMQ0Ez7JKoBJ6qvYvS4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA5MSBTYWx0ZWRfX4LjbjjLjdnWW
 MeX+4j+AG/mZXs+o0lEuFxg+nYpJaaZiGV+pmfwjSQ2NcdH4XQhvELpA+A7aMdLo7sNE6oG4pCN
 +T36eNAJC+MGehj8ptvdbtaPYNBX2vBESJRN5S9qGIzcvJo5uZMDSzU/PjUhC92JpDps+UtzeBP
 8miKoleSEwrewgcwaONldgsZ5mTbiilnfMU/mPnz+NSBZQMwROvmCGa7fgPXWKJbrpm7jHiPIRE
 ikZk1TdQdCMEsHnV5LTY28mkmcJMdYfRoE/Nfo1Odr6Vj2opc5liXwtx92bZGAzC6EAzRH5Oowb
 MYda5uhP7N9MzMLjOCHdTFgMSZkfhPYq7zrieQ6t3+iyKiXLjWbEjc2u9J2GDSUD7C49WT1Blcz
 jC6VXN5vyzRv6ZDMOqrXHG185b/EvRn2xRXK8YfGa+3bhlTuO+MSEAzsfHas4NAaIS7Kbt1Ftwp
 14BjTaQhvHTTuoQBy/w==
X-Proofpoint-ORIG-GUID: k_d_6hKmN7NOO0YfwmD5WUQ6Hfi1sDvX
X-Proofpoint-GUID: k_d_6hKmN7NOO0YfwmD5WUQ6Hfi1sDvX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280091

The cached drm_edid seems unnecessary here. Use the drm_edid pointer
directly in the plug stage instead of caching it. Remove the cached
drm_edid and the corresponding oneliner to simplify the code.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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

