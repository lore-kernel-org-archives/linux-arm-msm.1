Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076755;
	b=0RzR2is72Qed8ON9q0VGoY0F5+gZCNGaj74RXs/D2jEU8hgSXYaz7Kqz+k48/+2+3ox3
	 Z1b6nuG/1XbL3xWsB7ydlWQ6i/2X+bqk6uPY28fO6lw2IvqcND2WH7nRRoSW0xRjHdFhb
	 3wP7B7cDxDNDxPoL20kNBGhQB8JzDndgoO+dVzWc1GJsYCFYZGiNVL3JjMVNPtSCsk2lt
	 sOK47zjYsrVZx0ZKCRSjDo/LoD2nvG943Ci8SJRkTWi63TRNBCT6PpnkGL/bdbaMiNpnw
	 QUA3bK0A0rn6vhIacBtGEmm8vxVNPgihAcJjNOLlwUG5dlcbsJKDEqOEJj0ZINTIlyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076755;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=j4YaO0ZYpT/FRxBM0qcc+7tzTgK+KPS5LT6PmLgtxE8=;
	b=lBvkStmntcw2QzF2Ap0zsPf8ateOCUT46Zhzf1a2+DGu+LAFmiW+tGYeSBadrutfMn18
	 1R3eZhpDJLEwiih1tSGPmZANfnpug0Fqpbr2OeailMKJaCWbBRnxqKuUMfQDET0DyGETd
	 NhRe4q984f3JD7vn1mYm6CdwA7pGgLMkY6iAATfjYQKg6mA+3M8HAp+30Ht5Ba0KuUl8n
	 TjpPPlQMPstfR1WJnGWoniRm46qeeXCvV5ezMe5i9FQQjZGRXim2WyuOlCjoFxAW3UT7Q
	 PX8QiHV9U+H/kb1YjBOqmFgM2eV8rorrMO1V8hZ6xGN//iezqqr0aDzXnQ5AYP7/+ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mrqMU72R;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ilpclyp6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D92606A32A
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:25:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58D92606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mrqMU72R;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ilpclyp6
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vWk6330681
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:25:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j4YaO0ZYpT/FRxBM0qcc+7tzTgK+KPS5LT6PmLgtxE8=; b=mrqMU72RwCR8e/Bw
	hpq45S/bOuJOy8zZRHAXsklXiSyFQZLOIkfvloaiiy1NpPFyZV/nOQKK2x2/8t/p
	BFv3fJpYBs+WnEM3s8lNeCMOPLDcaDwlKTQUoZauqs6Zae+DTBz23uwKP+XhRjcf
	KtqNeG4FXe8J+0V8ZHJZgi+GXkp/5VV6iQUJfeIWGXpN/qn5SgsY3BBgATZqcsGt
	IS2xamnHnYILjowomeWqHl3Om7ufMcC9OhnHoK2Kln/g9ivd15jmoF7ZfX0X3D3V
	cC5GiyQ8k16aEQBtHJxlVLs5RohhIlgwTmtCeyUlpm6OMZkOMg0kkyvM5DBX56LL
	qUmN+A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1fpnkgg9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:25:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-949b0d322fbso39414185a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 00:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076752; x=1795681552; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j4YaO0ZYpT/FRxBM0qcc+7tzTgK+KPS5LT6PmLgtxE8=;
        b=ilpclyp6M67XbX1sJ+/CR7vkuZ/VY1SIrLPR/MVESTUyie9z0SCC+3s8X4QsSRAB3f
         5VvvuPIChIm65u/GWaHFpSBNJe34ioHpWnMlgfYJJ7IcPV7Z0v38HKDOKRy5Ojq4t1Gb
         bAuTUaqaK611bJn49aCp6xt2/Rx5041O0KNwHBRdNigwd7qsSXB96j8q11qvKE3p2prF
         nx+i2EDPlWFy/DXVdUOSrZXT2nWKEQ9Lzt5yY/bfQd7A9F8ErL/FpySijk1IyRM2X4WH
         vYUHR0Hs6AXmlszsHrTA0Pm4FIxOljWMSwuDevaH3l3VYcod/wDLghfsZ8urD/YUWlds
         EIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076752; x=1795681552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j4YaO0ZYpT/FRxBM0qcc+7tzTgK+KPS5LT6PmLgtxE8=;
        b=Tfj9HMn3gyn/0y8Ysr+Qe55JRlK2VMEzAHMO9hdlmK1U5x0weHVe8mgf7XIBT1qIgw
         KleyhWfDOx5NPlmPrtY6rhXZwA5rtDUZMghlG7emo6eE1kbqa+haLRszhkly70XlGsl2
         /1oFGnwkOatvU8qSP/fuJmg94OAr35IfDeDi7J1Ix6W0aFH5+bHHyZJNzejmUwN2/mn7
         Ys/MVl/IifmUkrC13g1BkTcl/nfK4z2Ue7C8e7hxZaVdHmX1hATMD5gEU1Xf5rBew0ib
         NvZW84jGPtm7Nw2RJcQndCx/TP93tzemHYqn6W0lp2Uh17OMdcQDZ+fgtBFC4os3ql/A
         8nzg==
X-Gm-Message-State: APuU4Z9jxVonx9Xgbx489HPtE4lcPz+6Cl3CyDCTOeKD7XvSCE21qA3K
	EIjiuM4s1jNRP7W855+2x3ksJctIugD7MWFYOG/sCFTl0mF48lsd0ng66mWh+axOtnE+4d5kV2E
	6rICVoMLXPDrFjJ9oM4b+27z18n25JNRvxTUDZhGsxIt9OJqs7Y6EDwmx5o1jmrmiKBqJHqqF2B
	bCtMs=
X-Gm-Gg: AYBFou0f7xD7cTaeXqcg2SX+h5GRSOUgaVnocQJ74bPnuSTM4c2xhdxRo1U7g1p2yG4
	a/cMbZvOZI4vGS8k6m/5fHzDKjk45sjrEHbFen2wPS7bHNa7Wkrl4Tod8dGpg9x2VEXydEPdVmK
	jlZ1nuAM/xXu8lJXvELAER3n1bvm7zM2rz9ZeAiGEqhksOO3McHSodCaPsihhO7HCbznesOFPQL
	FzPZLhP8xM9nAsOpPKJ8jV2m6M4lM2z2+plBDc+pW2QwIsOw3Mrf/2JsneB8LtBtPg2fcfG/Fyq
	34EvwbOjbDJKbYDET8lvWvVEghBziFzj2m1RRaysDtV7LUDlxFIsBv9qfMrzRbgD5JPWYlz7Vkj
	qO+Inj8uiZ422ieuD/Laqm/hKluiLHYikLaqjBOQt1V59pqp/mvOecn0sRBSBDclgVY85Jqiti7
	kWsO7Rwpg0ZMjAz1rWfV96VvsxOS00HMHhd0w+
X-Received: by 2002:a05:620a:19a4:b0:949:7656:ca0a with SMTP id af79cd13be357-949995b3446mr967706385a.35.1795076752449;
        Thu, 19 Nov 2026 00:25:52 -0800 (PST)
X-Received: by 2002:a05:620a:19a4:b0:949:7656:ca0a with SMTP id af79cd13be357-949995b3446mr967703085a.35.1795076751880;
        Thu, 19 Nov 2026 00:25:51 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:25:51 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:18 +0800
Subject: [PATCH v9 16/29] drm/msm/dpu: add per-stream MST encoders
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
Message-Id: <20261119-msm-dp-mst-v9-16-ca61be4edfc3@oss.qualcomm.com>
References: <20261119-msm-dp-mst-v9-0-ca61be4edfc3@oss.qualcomm.com>
In-Reply-To: <20261119-msm-dp-mst-v9-0-ca61be4edfc3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=5908;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=y5jRzeNla1e8Iwt1s5LRc06RYsVeZV4O7u84IZgL2qk=;
 b=YXb7dK2Y0C8iU3tKJ19krcBiKXjTJ99U7QeYpJcArJZQn2kMsv4+pys1oNx8gRqzWQ/VJK9UJ
 81EeLLxFd3+Ak2uIgdhANCJ0+p3imfZlKXhz7ZxJANYeFgQtTaIQwJ/
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: yb0ISECeNI6scg1asAV1l4ifraO6JZqX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfXy3jO7wn5PvMh
 XUELv8ci6QpOYEXCmj4wMuBbJonsrtjv4l0n3/YvUVi5LH+NxDvySDrHAOwCbkgqjbDh+TZ78Po
 eFptbIkynLL1xDKBG9emiJBlXSm9s//AbI0bsMw2CdMj5SWLWlWsDgiUMqI0nuAgxkDY/2Uq5Wc
 u+WDD071ci3kqVomSW17AI/stqW2XXpxqtm7CEwPdyUyWk+DlsE1GwL8y+1QrghRH07ladGSOzq
 oldZt67wtF02NgN3LBwZO6FWnxAFi4OOiTn4nHWK7c+zTL7Fbq+TffyWwcw910f7WuKRAOMpm5V
 FnZ3GVa674JSBG6nMigF/Luw8+5dE7PHseq9lV09irR4k6m2cKPXs1i2sLluo9cbCSWx/HUAmJl
 EREwQy82CvTcbE/3JIhOKqLS4A6bHV+fU5tL7tEmyLDAlnA8hTDvA3N3ieeUKGnpQ4vOEaLHZne
 N0ajXHJ9fommFEZqucw==
X-Proofpoint-ORIG-GUID: yb0ISECeNI6scg1asAV1l4ifraO6JZqX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX2/b7ZH4QWUXy
 raOCWNvcA0hjcjUB3aeXEzK3rGCiv+2NVkgKC+NDYT5bnDJ/jrJqTQOvW7evc6GBjkTzyT8dQGV
 tD6KVFr7JwZoWFIIPh4MKTh2p9h+qRE=
X-Authority-Analysis: v=2.4 cv=PJ6aavqC c=1 sm=1 tr=0 ts=6afeb291 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=aoVTMipVTiCx4Xnk7jUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190033

Unlike SST, where a DP controller is represented by a single encoder,
MST requires an encoder instance for each stream.

Create one DRM encoder per MST stream, associate it with a stream ID,
and initialize it with MST-specific encoder helper callbacks.

This establishes the per-stream encoder infrastructure required for DP
MST support.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 23 ++++++++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 15 +++++++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.c         | 20 ++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.h         |  2 ++
 drivers/gpu/drm/msm/msm_drv.h               |  9 +++++++++
 5 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index a8dcc8c684eb..802cb62fc010 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2742,6 +2742,24 @@ static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
 	.atomic_enable = dpu_encoder_virt_atomic_enable,
 };
 
+static void dpu_encoder_mst_atomic_enable(struct drm_encoder *enc,
+				      struct drm_atomic_commit *state)
+{
+	dpu_encoder_virt_atomic_enable(enc, state);
+}
+
+static void dpu_encoder_mst_atomic_disable(struct drm_encoder *enc,
+				       struct drm_atomic_commit *state)
+{
+	dpu_encoder_virt_atomic_disable(enc, state);
+}
+
+static const struct drm_encoder_helper_funcs dpu_mst_encoder_helper_funcs = {
+	.atomic_mode_set = dpu_encoder_virt_atomic_mode_set,
+	.atomic_enable   = dpu_encoder_mst_atomic_enable,
+	.atomic_disable  = dpu_encoder_mst_atomic_disable,
+};
+
 static const struct drm_encoder_funcs dpu_encoder_funcs = {
 	.debugfs_init = dpu_encoder_debugfs_init,
 };
@@ -2767,7 +2785,10 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
 	if (IS_ERR(dpu_enc))
 		return ERR_CAST(dpu_enc);
 
-	drm_encoder_helper_add(&dpu_enc->base, &dpu_encoder_helper_funcs);
+	if (drm_enc_mode == DRM_MODE_ENCODER_DPMST)
+		drm_encoder_helper_add(&dpu_enc->base, &dpu_mst_encoder_helper_funcs);
+	else
+		drm_encoder_helper_add(&dpu_enc->base, &dpu_encoder_helper_funcs);
 
 	spin_lock_init(&dpu_enc->enc_spinlock);
 	dpu_enc->enabled = false;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 3c3203ca32c7..92691d39dcb2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -688,6 +688,21 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 				return rc;
 			}
 		}
+
+		for (int stream_id = 0; stream_cnt > 1 && stream_id < stream_cnt; stream_id++) {
+			info.stream_id = stream_id;
+			encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DPMST, &info);
+			if (IS_ERR(encoder)) {
+				DPU_ERROR("encoder init failed for dp mst display\n");
+				return PTR_ERR(encoder);
+			}
+
+			rc = msm_dp_mst_attach_encoder(priv->kms->dp[i], stream_id, encoder);
+			if (rc) {
+				DPU_ERROR("dp_mst attach_encoder failed, rc = %d\n", rc);
+				return rc;
+			}
+		}
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index a2900ff3b0ab..ef5fb70863b8 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -147,6 +147,26 @@ static int msm_dp_mst_encoder_stream_id(struct msm_dp_mst *mst,
 	return -1;
 }
 
+int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, unsigned int stream_id,
+			      struct drm_encoder *encoder)
+{
+	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
+	struct msm_dp_panel *dp_panel;
+
+	dp_panel = msm_dp_display_get_panel(dp_display, stream_id);
+	if (!dp_panel) {
+		drm_err(dp_display->drm_dev,
+			"[MST] failed to allocate panel for stream %d\n", stream_id);
+		return -ENOMEM;
+	}
+
+	mst->mst_encoders[stream_id].enc = encoder;
+	mst->mst_encoders[stream_id].stream_id = stream_id;
+	mst->mst_encoders[stream_id].dp_panel = dp_panel;
+
+	return 0;
+}
+
 static struct drm_encoder *
 msm_dp_mst_atomic_best_encoder(struct drm_connector *connector, struct drm_atomic_commit *state)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
index 7f35e7524cfd..3cbd2a674675 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
@@ -9,5 +9,7 @@
 
 int msm_dp_mst_mgr_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux);
 void msm_dp_mst_mgr_destroy(struct msm_dp *dp_display);
+int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, unsigned int stream_id,
+			      struct drm_encoder *encoder);
 
 #endif /* _DP_MST_DRM_H_ */
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 31ab50f620bc..cc665888ce7f 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -360,6 +360,8 @@ bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
 int msm_dp_get_mst_max_stream(struct msm_dp *dp_display);
 int msm_dp_mst_register(struct msm_dp *dp_display);
 void msm_dp_mst_unregister(struct msm_dp *dp_display);
+int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, unsigned int stream_id,
+			      struct drm_encoder *encoder);
 
 #else
 static inline int __init msm_dp_register(void)
@@ -406,6 +408,13 @@ static inline void msm_dp_mst_unregister(struct msm_dp *dp_display)
 {
 }
 
+static inline int msm_dp_mst_attach_encoder(struct msm_dp *dp_display,
+					    unsigned int stream_id,
+					    struct drm_encoder *encoder)
+{
+	return -EINVAL;
+}
+
 #endif
 
 #ifdef CONFIG_DRM_MSM_MDP4

-- 
2.43.0

