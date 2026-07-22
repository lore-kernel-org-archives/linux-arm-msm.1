Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107233AD528
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784702214; cv=none; b=omAlf2WnGZg8x+4bxYSd6k9Wsd3AmdaahzaZEP4ma3s6VB2FxTcnekK0CT7pTlLe796kITYZU/h0IpDqAo+FhU8bTWds4L7vwbICfdZrF26GtLVYw83o+ezUflMMsrug3ytI7EVngcqMA8PsNlJ4g1RceR/ve8SmIayp46sC1pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784702214; c=relaxed/simple;
	bh=+OUGc5FgVaREgTIXpTKbHBCCj4cUh+urB6VbsBn5Osk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W8BTF/fIzmQSFLEzAuA1ebFuOFFEfg1nn/MkygVkpXF+n7uNJyJnrLOgFMo8arxiPgQXRtZ+bEy1dgnhdgRtQotsxF3lrYeaba5AghWur9ymoKFoIHwcA3lV/SsoX3J+57qGaJHvuX2jHZjMMauu2SVMdytxiNZx66Y/P1bzXR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RcW4rOuK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AgX58w0R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RcW4rOuK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AgX58w0R"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53iN54168991
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YWr9wwuoYNg3NTbM6h8++bi9NeLoqHztxgk7/YWPoxM=; b=RcW4rOuK2fwD+LzM
	N13XfMOdyCqjokMjHcDrkyMb389lIWNH2UbJGpmcluaqtE+HStWcpY8ihhFdyt4z
	1+gFGH/DIVNE6Y1OnmoeEYWJc1IGNZO9eYkf1dmff6FMgrxr+J2rLOGSKADH1XwP
	tLh2O7wTNMPOMmM4HGL+EEJC3SajW+AH2SpKlen1EelVecK0FHf1LNKoXgs3bVJw
	jGk0pT7VivPGPurJ06WwlKBhNdmLvuLniaen2vBrCRdYNQnr3FpVpfQPoZtL5Ebg
	+obvv3lk7Mg2ZbAbpyOgCK03KfcssuUK4UjdU2FAarjfgo90gFCbHnASzz/hH0cj
	AX/H/Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6r3mph2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:36:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bff5c7035so145624891cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784702211; x=1785307011; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YWr9wwuoYNg3NTbM6h8++bi9NeLoqHztxgk7/YWPoxM=;
        b=AgX58w0RdvPSwzqcauZ+ddFXgRp5NOb5d3DrgIv2chNun3rkVaIMt1UM+SkbXyJRHP
         Zb2e3r5nunnDeYaiVh/ZeJAVq/+tsslgXAt+xkMRjNDlUnxUCmUzjZOpZV7l4o35AgxH
         9lt6IdDW49OLWEEQpEy+d0ORG8IVJQhM7vSx41g6JG/ahtYOL57ejTVtz9XZ+XA94OyJ
         1SGqalPXJ6r7WllRFk6ykn46wek6aF2sFo6wSrepDI/ht5xeFB+Kf7pu+1QoUxAGS8QN
         rxUN/NIc0gBND1SY8mq23Z0J166WJOoRaVRNbMPwrkfvJyx/7sId3uzcG2bu2cxuA4Np
         V/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784702211; x=1785307011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YWr9wwuoYNg3NTbM6h8++bi9NeLoqHztxgk7/YWPoxM=;
        b=GnsnZex5m2VXq+KfBUvMpei3jFLH8IJmkccbzEPZ7tIH7zkmV2nmwdsQZVoWkeMNj2
         1hGlCxF9Y+q8n4HV1RMKJdgoTS3DxnJBn2TMv8P2SddxiEponiTov2IQeyXxmP2Ue12C
         /0pSxtDRsBspBf/iiH7vMmycx173K08XEkvZmuXZRpi776k3cVwmmxj6jm5S1cI40jaL
         FEGiDSaPvnw7zSuaKb8zr3tFp0alzv/XxWZinkbYPXgoBZ5ethhx2LkMTzplr23373tJ
         N73e8bcWHZr/y5ms1YQFHVhaGmJyqgjH4SMYMcHZdXgZQ9YhLsx0JhYeDdWD226ebcru
         zYmg==
X-Gm-Message-State: AOJu0YzfleYKxtKRDfQp2dy4YQGK+fr/HIjZuweRTrM2yubSTOWozXh7
	owrwsDJdh87Yf86yrPrBH119C4qYth3w6snO5rVaxjnRRiG1eRUQEpZPaJx07SJzdoJDExYgfNO
	e9pPyO/OtlXIXtMVAp/X/lUSbRV2CjNXGO6mTkJj+K1407fs/o/43tA9eTPEae2DvLWmeawJ4BK
	jP
X-Gm-Gg: AR+sD10tYJpym92a6ATZO+aVkUZtd6vhpP9gVU91c/gijJRO5dmmwN5/EwxB93UzXiA
	10lnTaWUxQYTNAqApg4sN63ZDNpbqWq+SRvx1nnnVDPKrppoIMfAc7aoIknjQMItuP+/gHUKqlJ
	CAGC+6fxWIIFFf+AGHsdWvtQB8dD01RgJL9z+RODF0XUO2uNutoDPXG/kadv+R2gvTCy9OM3Tka
	HVrsfsqMDQaQWVzCEtFFyEehu3lH5NKKNu6lDXa/F55f1yKNEz45dNz2l0y+jco7AF9ksf8ksqf
	YvsUsZfyxOYzQfew9i3Edu0x8QOCFCAKRD7thmASFXepGfmmfUE5b6hF7utO/S9zJPEAftzL9aO
	zZ31lM//uHDGj+uek+RZwMmn+RViuEPFM+FjXikaEoNl3W58WmzR4hiv7t9v3zSZCUcVz/gF8pn
	QBTKQs934UhOKUZQ==
X-Received: by 2002:a05:622a:118c:b0:51c:8571:1ccc with SMTP id d75a77b69052e-5213c7e67acmr203287301cf.41.1784702211170;
        Tue, 21 Jul 2026 23:36:51 -0700 (PDT)
X-Received: by 2002:a05:622a:118c:b0:51c:8571:1ccc with SMTP id d75a77b69052e-5213c7e67acmr203287141cf.41.1784702210731;
        Tue, 21 Jul 2026 23:36:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8c6f6sm309696e87.4.2026.07.21.23.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:36:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 09:36:22 +0300
Subject: [PATCH 07/24] drm/msm: add the wide_bus_enabled callback to
 msm_display
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-drm-msm-display-interface-v1-7-368c10fe62fd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8943;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+OUGc5FgVaREgTIXpTKbHBCCj4cUh+urB6VbsBn5Osk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqYGTnQ1UXylmG+15DdhP4e9ml2vmSj7jklAamp
 ggsil/0I/WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamBk5wAKCRCLPIo+Aiko
 1V6qB/9WyRNAfBFo35hPzLIXNxJaPSTXCFo5MdVTLj/MZzFIixos99vQgv1VDVt5nayNyjSHzdG
 F7bzWkzNqVLs6fo3ewHfJFx0d8rRoNMhw9LmG5Ruwy3EDVlsm2dfCMeQIjZq9S9RSiAM3/xUAxd
 y4jkLJG7TbL/G+dbyt0md1kbg9ZuszRYd73LAfteM1dvtSbZXhx69xIF/maWWvCHutu0zr6XgHo
 fWyrVTNnX6PQBkPHuP64K1Pyb/m2DfloFhS+/5FySCEDHFEL6Yirn/s25exAaHqN1vsBnRVMmiG
 j++SL3Q6Fc8xHwECqLYW3vQkzZuFltepPqE3SR6p9kTKplBH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfX9urCPxUF0FeN
 hGHS9auYZ4z95a4V9iBkwMk2s95jToxLdA7QgjHlweoa2NRunpXQksh86DPOZQET7pke3bVWzQS
 jCFAWKPxd582ydlGki3WgGFY9C+fjh2yInOIpVESlQ/sCIbHrBRMvv2CaPCWk6aAdoaPxhFv9iI
 2Rh6S5yzOw3FhUHXo6uajTO83jd9yVE1YBD8N3JVLZV9/OvEX/TOQPavWBRKPr7M0AZ0JGd48f3
 NXjVRnAW40hf/e9SuN3JeHZWF2GmWdCLiQRnXXIMNT2oQPCTo1hnonoXtkmEXu25notQimmpdaz
 dauAiSWQDtoILlx62IyQD057cff0u/UZM6/L2hjgJZZcsOsLFbSXy/g2AAKLnWHJm5XqdVrLB9T
 v/ABRmbqwLpG9m5G84tWSk9W6u3aKqXVd/ODZGkNyax2zacVbudkogDfDhwsHMqNB1h6H4a3soY
 hXtadKHdOE0B4engjBQ==
X-Proofpoint-ORIG-GUID: PM-ULDGBQtGVrfpBN2aeGS2LFoYuKXza
X-Proofpoint-GUID: PM-ULDGBQtGVrfpBN2aeGS2LFoYuKXza
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfX41PnwKvM9RzX
 VFt082Q9/2mVbCF+pkxDpsD2bo3Cmb+N5SLDby7a3joRtOwEHT+O83O8GJqA+A0ttfOHm6gGNTL
 JGCOTzwlN6UdRqwMvcborMQHZcxYfxg=
X-Authority-Analysis: v=2.4 cv=SIRykuvH c=1 sm=1 tr=0 ts=6a606504 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=EXGRFEm-sg837V2a6F4A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220060

dpu_encoder_is_widebus_enabled() switches on the interface type to call
either msm_dsi_wide_bus_enabled() or msm_dp_wide_bus_available(), two
differently named sub-block functions.

Replace them with a single mandatory wide_bus_enabled() callback on
struct msm_display_funcs. DSI and DP implement it (DP keeps its internal
msm_dp_wide_bus_available() helper, now declared privately in
dp_display.h); HDMI, which never drives a wide bus, returns false.

Add a dpu_encoder_get_display() helper that maps a struct msm_display_info
to its struct msm_display, so the DPU encoder can look up the sub-block
and call the callback without open-coding the interface-type switch. It is
reused by the following callback conversions.

No functional change intended.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 42 +++++++++++++++++++++--------
 drivers/gpu/drm/msm/dp/dp_display.c         |  8 ++++++
 drivers/gpu/drm/msm/dp/dp_display.h         |  1 +
 drivers/gpu/drm/msm/dsi/dsi.c               |  5 +++-
 drivers/gpu/drm/msm/hdmi/hdmi.c             |  6 +++++
 drivers/gpu/drm/msm/msm_drv.h               | 14 +++-------
 6 files changed, 53 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1f20695f81e3..ce358c1c9757 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -268,25 +268,45 @@ bool dpu_encoder_needs_periph_flush(struct dpu_encoder_phys *phys_enc)
 	       msm_dp_needs_periph_flush(priv->kms->dp[disp_info->h_tile_instance[0]], mode);
 }
 
+/**
+ * dpu_encoder_get_display - find the display sub-block driving an interface
+ * @dev:        the DRM device
+ * @disp_info:  the interface description
+ *
+ * Return: the &struct msm_display (DSI/DP/HDMI) driving the interface, or NULL
+ * for interfaces (e.g. writeback) that have no such sub-block.
+ */
+static struct msm_display *dpu_encoder_get_display(struct drm_device *dev,
+		const struct msm_display_info *disp_info)
+{
+	struct msm_drm_private *priv = dev->dev_private;
+	int index = disp_info->h_tile_instance[0];
+
+	switch (disp_info->intf_type) {
+	case INTF_DP:
+		return msm_dp_get_display(priv->kms->dp[index]);
+	case INTF_DSI:
+		return msm_dsi_get_display(priv->kms->dsi[index]);
+	case INTF_HDMI:
+		return msm_hdmi_get_display(priv->kms->hdmi);
+	default:
+		return NULL;
+	}
+}
+
 /**
  * dpu_encoder_is_widebus_enabled - return bool value if widebus is enabled
  * @drm_enc:    Pointer to previously created drm encoder structure
  */
 bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc)
 {
-	const struct dpu_encoder_virt *dpu_enc;
-	struct msm_drm_private *priv = drm_enc->dev->dev_private;
-	const struct msm_display_info *disp_info;
-	int index;
+	const struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
+	struct msm_display *display;
 
-	dpu_enc = to_dpu_encoder_virt(drm_enc);
-	disp_info = &dpu_enc->disp_info;
-	index = disp_info->h_tile_instance[0];
+	display = dpu_encoder_get_display(drm_enc->dev, &dpu_enc->disp_info);
 
-	if (disp_info->intf_type == INTF_DP)
-		return msm_dp_wide_bus_available(priv->kms->dp[index]);
-	else if (disp_info->intf_type == INTF_DSI)
-		return msm_dsi_wide_bus_enabled(priv->kms->dsi[index]);
+	if (display)
+		return display->funcs->wide_bus_enabled(display);
 
 	return false;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index f4fa86d1b9c7..04d291a93d20 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1354,9 +1354,17 @@ static int msm_dp_modeset_init(struct msm_display *display,
 	return 0;
 }
 
+static bool msm_dp_display_wide_bus_enabled(struct msm_display *display)
+{
+	struct msm_dp *dp = container_of(display, struct msm_dp, display);
+
+	return msm_dp_wide_bus_available(dp);
+}
+
 static const struct msm_display_funcs msm_dp_display_funcs = {
 	.modeset_init = msm_dp_modeset_init,
 	.snapshot = msm_dp_snapshot,
+	.wide_bus_enabled = msm_dp_display_wide_bus_enabled,
 };
 
 struct msm_display *msm_dp_get_display(struct msm_dp *msm_dp_display)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 20a71afb1f90..8c34a473c7db 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -34,6 +34,7 @@ int msm_dp_display_get_test_bpp(struct msm_dp *msm_dp_display);
 void msm_dp_display_signal_audio_start(struct msm_dp *msm_dp_display);
 void msm_dp_display_signal_audio_complete(struct msm_dp *msm_dp_display);
 void msm_dp_display_set_psr(struct msm_dp *dp, bool enter);
+bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
 void msm_dp_display_debugfs_init(struct msm_dp *msm_dp_display, struct dentry *dentry, bool is_edp);
 
 #endif /* _DP_DISPLAY_H_ */
diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index c86142f66237..ce3b261123ea 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -17,8 +17,10 @@ struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi)
 	return msm_dsi_host_get_dsc_config(msm_dsi->host);
 }
 
-bool msm_dsi_wide_bus_enabled(struct msm_dsi *msm_dsi)
+static bool msm_dsi_wide_bus_enabled(struct msm_display *display)
 {
+	struct msm_dsi *msm_dsi = container_of(display, struct msm_dsi, display);
+
 	return msm_dsi_host_is_wide_bus_enabled(msm_dsi->host);
 }
 
@@ -279,6 +281,7 @@ static void msm_dsi_snapshot(struct msm_display *display,
 static const struct msm_display_funcs msm_dsi_display_funcs = {
 	.modeset_init = msm_dsi_modeset_init,
 	.snapshot = msm_dsi_snapshot,
+	.wide_bus_enabled = msm_dsi_wide_bus_enabled,
 };
 
 struct msm_display *msm_dsi_get_display(struct msm_dsi *msm_dsi)
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 72ab2e92964e..5f24f778c7ef 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -228,9 +228,15 @@ static void msm_hdmi_snapshot(struct msm_display *display,
 				    hdmi->mmio, "hdmi");
 }
 
+static bool msm_hdmi_wide_bus_enabled(struct msm_display *display)
+{
+	return false;
+}
+
 static const struct msm_display_funcs msm_hdmi_display_funcs = {
 	.modeset_init = msm_hdmi_modeset_init,
 	.snapshot = msm_hdmi_snapshot,
+	.wide_bus_enabled = msm_hdmi_wide_bus_enabled,
 };
 
 struct msm_display *msm_hdmi_get_display(struct hdmi *hdmi)
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index d25d783b4f11..519571170207 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -283,12 +283,15 @@ struct msm_disp_state;
  *                to @encoder.
  * @snapshot:     capture the sub-block's state for a display snapshot;
  *                mandatory.
+ * @wide_bus_enabled: whether the sub-block drives a wide (2 pixel/clock) bus;
+ *                    mandatory.
  */
 struct msm_display_funcs {
 	int (*modeset_init)(struct msm_display *display, struct drm_device *dev,
 			    struct drm_encoder *encoder);
 	void (*snapshot)(struct msm_display *display,
 			 struct msm_disp_state *disp_state);
+	bool (*wide_bus_enabled)(struct msm_display *display);
 };
 
 /**
@@ -327,7 +330,6 @@ struct msm_display *msm_dsi_get_display(struct msm_dsi *msm_dsi);
 bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi);
 bool msm_dsi_is_bonded_dsi(struct msm_dsi *msm_dsi);
 bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi);
-bool msm_dsi_wide_bus_enabled(struct msm_dsi *msm_dsi);
 struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi);
 const char *msm_dsi_get_te_source(struct msm_dsi *msm_dsi);
 #else
@@ -353,10 +355,6 @@ static inline bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi)
 {
 	return false;
 }
-static inline bool msm_dsi_wide_bus_enabled(struct msm_dsi *msm_dsi)
-{
-	return false;
-}
 
 static inline struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi)
 {
@@ -376,7 +374,6 @@ void __exit msm_dp_unregister(void);
 struct msm_display *msm_dp_get_display(struct msm_dp *dp_display);
 bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
 			       const struct drm_display_mode *mode);
-bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
 
 #else
 static inline int __init msm_dp_register(void)
@@ -397,11 +394,6 @@ static inline bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
 	return false;
 }
 
-static inline bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
-{
-	return false;
-}
-
 #endif
 
 #ifdef CONFIG_DRM_MSM_MDP4

-- 
2.47.3

