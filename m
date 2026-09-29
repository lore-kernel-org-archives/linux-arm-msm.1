Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B2C3ED5CD
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656068; cv=none; b=Rq+MCyPIzKTqzeGozbubE8/PmurSCG0onuwvVUdyiCfKA+5ia0yhS1MzHmGoveeRYRLWYfmnF9exwoYtSZzRn/HHQp+o+PhihFqrGZwYqM1Jq0Y6DoIoBcpcOMeAy+xdcDNmHZra00fdbR+DMyyxJVXiNX5AmD/ZSmXhQTAWeI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656068; c=relaxed/simple;
	bh=C/o0ZCDpplNMSGFNccofcP0FNVSX5E147vDc2o0AxL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QFiLIgDxFAYlA3XaMfxnLuVdE+SwXHIDOCNmtz0tBnMb61l8pirPqBp+XIXk/7Eh+ULrc2HQ7kN3/eaeMn1PW/92MT9kZ3NQDctFVPKeePdFUb52gH8U108xpdsIPncYbwYB/6V+uoIGWOej9DxX9DaPVASXTpTDGBHXA9ConwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lc+w9zQH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cQv7d1rm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lc+w9zQH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cQv7d1rm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47Agk2126503
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:27:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hiy+4MSFHQi0b8MUudXcZS5aUdLcyy1D41z/sf1hcaI=; b=Lc+w9zQHGoHQYcav
	biKQMZEH8n0+BlB+dyjh1O7dhR3e0XMndIGNdEn4M+BOrfM3FaHuKuVz3mFCE2OQ
	2yR7WXE2twBLTL6a4mNYj96ZtvhP6A/RYKtbvjU37wqzOAk/pMxmCyFEUKsCXByB
	oRnU+a3bkv2Nv5EU3Td4XQPT7YzfI5RIgIR7HtTYtYKDU0WjpNUv/A0L8YdAiBDD
	6vVuGGkIphEC1GXeBzfAaVRWI1TAq8+lEH5KWUVcRgwGr5LDm2eeros5HSejKGck
	fNSp8vdpsRtrevL1+SB8PwVIEO79SACbD/g7y0ftiKRAgAeT6CJJIhNLsc8SFL/I
	agHsYg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h02mn8qn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:27:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93c673116e3so478703285a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 21:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656064; x=1791260864; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hiy+4MSFHQi0b8MUudXcZS5aUdLcyy1D41z/sf1hcaI=;
        b=cQv7d1rm+jy17YOMGd+nowMrBcmin/3uvji+Pg2eQ/VC/52vA4Wb6y8yWyKAfB0RxR
         oKg3yUCtFOT0yP9Ul/12YvCmrixm406r2jpO8USWMAxAXdYiQu6/y2ulaLaG5IsPF5oN
         RH6BALotGV4nJPdYAxU7W5AdP5wLZLZzV0vXa6QbgVB7xIK+cvYmazXWBY60tOrEk6iz
         ppEw7V6Uun6AzzSRoaYfIML2S9fwZzSX7G2P6WWh2WozI5BwTUQYXNgbvXEw1b4m3B0N
         c4hlVNkX9SCo6BW8qbKTo3i8GjlytUJ3hmQps6UzSAbAdQzEAUQNYW3UQli70oELP8Dz
         E42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656064; x=1791260864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hiy+4MSFHQi0b8MUudXcZS5aUdLcyy1D41z/sf1hcaI=;
        b=xC4/Iw2d9ty3biu12SmhXUn6lF57dDwKjXZzeLw2aZpdNk6AGg0rFc3iEpL1uydGBU
         9AknfveyN2hfbv9iGR5p/gy+hRZ//CdTgrkgaTdmpyWMqWlXsAgBK8vUIdvzCZ94ZQc9
         dlSPU/j8rn74eT2RJUKHjESNvfWoFypVeqNF/AkMzUFMVoTotMUowM5P0gOdWMeCDcjY
         uvbrNwLR8IhaKOcmkB8VwCcwjFisQ/W4SxObLmpwBP80aO3yjroO0GVSWsloGQXnHb9I
         y9ridV2l9NHyLG1rQXr48+n0rDJzNhlXJHr4rlQrB8L/MMZpUDLxmt8idzw9/RCDByGu
         JETg==
X-Gm-Message-State: AFuF++lsigeALhfKtZys/Ja3IEzZqoNh6sGnvtmAQCkIWQwb/7TRagR2
	jB1sx98l5c4PM3YzowbcqsSL+LWeGfbXTIfV0pRwhAMnc9KvvGUkp55cUnY+7OkQbrEeMXrHXKj
	IcNPdV7CPD34u8ztHv8XmL2xnmNbk4Hm36n84zUdaUj/cNDrQ6xvgdeTBCiCm/3n0HDkr
X-Gm-Gg: AYBFou3zGzwH5OnXOx3nC+xWl3WH7gDm2gZovfeTQEYKJ1eMXXJ/jiJhaWkkl7dP61M
	NEGmpjHnSdBBzXP9dewPGdLX+Pqi2axWG5oB+nLw7s+VmZsK8Tl70vXtr2/ffqXTdHf1fzafeHF
	mILJDcU5bZPwHkDxHeduLPtDYLyuWD9FVXBwOH+W4KISlEOlLBLt0nLTWXrSYSxRI2nDu4nuyXn
	yzJM/9nVGQr+6f08AH2mPIeg2jbEZjkdYvrCjTXGDd0e1I/JqpRDXDEBJkMG/krfjTkANKfUv+Y
	ZL//adn+CGCcMWwNVM33KU9udlobyKmzj70mixonRROHUqHXu19hpmtoB5N7rsX4Tvc7PXWCmSY
	m2Sd9HjMHTaePEsmqKPSNSwYb26peZioBnj9PzdbeINfl0oP5dbWtES8pkhqM3Vc=
X-Received: by 2002:a05:6214:488d:b0:914:4e89:131e with SMTP id 6a1803df08f44-9144e8919fdmr170215986d6.28.1790656064280;
        Mon, 28 Sep 2026 21:27:44 -0700 (PDT)
X-Received: by 2002:a05:6214:488d:b0:914:4e89:131e with SMTP id 6a1803df08f44-9144e8919fdmr170215856d6.28.1790656063892;
        Mon, 28 Sep 2026 21:27:43 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:27:43 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:40 +0800
Subject: [PATCH v7 16/35] drm/msm/dp: add link_ready to manage link-level
 operations
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-16-4b81473185e7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=3521;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=C/o0ZCDpplNMSGFNccofcP0FNVSX5E147vDc2o0AxL4=;
 b=pUXU5DEn9FspX/uIKxuUa3h2Vd0pZ12m5jZssq9UMdQUTPtd14jVS7tdGQ14ufwGLAMA9CcxT
 wji2U832fCYDbDiMHklLX5A2B3U1+NWyeGMa7TS5wj5T2qidK+iwoEM
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=X9fHu2Te c=1 sm=1 tr=0 ts=6abb3e41 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=r0U9Mmpn2XdHegFmGjAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: qp9i9y22XjGMRhWkrpPPCbQcz80A80Vf
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX1YbhynBKAi+y
 DBdBJajvFByZI1hLfzj0/3OiaCG5XNTUZIOCL1n4Ucuy7r2U2e/1hUDGyNkiSdMZvhyl87JYYWU
 cImrrvoYZ56slR8p8ph2MlQWFN12PuM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX6BtuCJtfw8lk
 dRGg2W4V6K7VeVj/aOxaT1nYcRKgIuXLDhFGAgr4nKUU39pQOwjl/JjQjKPXePnVi+6VVVXr+4k
 jdRe9QALpf2Fhk41gt5cuDMMRGiCOF1GbkMGfwZ2h71Vx3itrwClDgpjG4bFxYBcB8ngKm2elh9
 cZQ0srhpEXXa3yAvVTNAUnXrJpkFfyeAk9vQE6YsrXB13q3nSSkC52xqjKegJbslME5/1UxYbSF
 E5tSkUe0BEaxIhgh9JQIYS/m/bCs2xAbPLY7XK4oEXLUAUjmYwMe7oy3FVNNVkdhwL5l50P5TMm
 5wTD9VNxCvWflWDuY4iLk6HE/pOd+CHTkIJNUZ9nKTNWiZ3tZe8sfs3DsYHh5lp5AzXIcJil+RY
 kx0a/si3y/UIMicqk21fGTbRA6KLIfoDgQfKjsrFRUAdnWJWplLUuAt3e/EokIax7ToSibUmELR
 Gw7FDcnQycvT4mmyQDw==
X-Proofpoint-ORIG-GUID: qp9i9y22XjGMRhWkrpPPCbQcz80A80Vf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290017

In MST mode, multiple streams share the same DP link. Track a link_ready
state so msm_dp_display_prepare_link() runs only once per link and
repeated calls are skipped.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 33 +++++++++++++++++++++++++--------
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 2 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 49a718f4e464..487c76e0f990 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -638,6 +638,10 @@ int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display)
 	if (msm_dp_display->is_edp)
 		msm_dp_hpd_plug_handle(dp);
 
+	/* Serialized by modeset lock or mst_lock. */
+	if (msm_dp_display->link_ready)
+		return 0;
+
 	rc = pm_runtime_resume_and_get(&msm_dp_display->pdev->dev);
 	if (rc) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
@@ -659,7 +663,11 @@ int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display)
 		}
 	}
 
-	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, dp->panel, force_link_train);
+	rc = msm_dp_ctrl_prepare_stream_on(dp->ctrl, dp->panel, force_link_train);
+	if (!rc)
+		msm_dp_display->link_ready = true;
+
+	return rc;
 }
 
 static int msm_dp_display_enable(struct msm_dp_display_private *dp,
@@ -1501,14 +1509,16 @@ void msm_dp_display_enable_helper(struct msm_dp *msm_dp_display,
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	rc = msm_dp_display_enable(dp, msm_dp_panel);
-	if (rc)
-		DRM_ERROR("DP display enable failed, rc=%d\n", rc);
+	if (msm_dp_display->link_ready) {
+		rc = msm_dp_display_enable(dp, msm_dp_panel);
+		if (rc)
+			DRM_ERROR("DP display enable failed, rc=%d\n", rc);
 
-	rc = msm_dp_display_post_enable(msm_dp_display);
-	if (rc) {
-		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
-		msm_dp_display_disable(dp, msm_dp_panel);
+		rc = msm_dp_display_post_enable(msm_dp_display);
+		if (rc) {
+			DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
+			msm_dp_display_disable(dp, msm_dp_panel);
+		}
 	}
 
 	drm_dbg_dp(msm_dp_display->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
@@ -1565,6 +1575,11 @@ void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
+	if (!msm_dp_display->link_ready) {
+		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
+		return;
+	}
+
 	if (msm_dp_display->active_stream_cnt) {
 		drm_dbg_dp(dp->drm_dev, "stream still active, return\n");
 		return;
@@ -1583,6 +1598,8 @@ void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
 		msm_dp_display_host_phy_exit(dp);
 
 	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
+
+	msm_dp_display->link_ready = false;
 }
 
 void msm_dp_display_atomic_post_disable_helper(struct msm_dp *dp, struct msm_dp_panel *msm_dp_panel)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 9ecd5025fe4a..51eace1d1346 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -20,6 +20,7 @@ struct msm_dp {
 	bool audio_enabled;
 	u32 active_stream_cnt;
 	bool mst_active;
+	bool link_ready;
 	unsigned int connector_type;
 	bool is_edp;
 

-- 
2.43.0

