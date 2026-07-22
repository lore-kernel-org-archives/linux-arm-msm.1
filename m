Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58523B8D4A
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784702224; cv=none; b=WNZRX9bbIRnRWV1PDxUtKEq2rYwXL4sJrXzoyGQYp3c7TKW43h+qGuOjpgH31V9VFothTm9EiOTMQn8ddM3G1RRH5Q8O6O60aKVZcSqVe1vGEtVanYDd7QWodyw59yYOKfJBJuj6kVyXkLUnHhkeVkHZNI99R22p04Q+D7lco5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784702224; c=relaxed/simple;
	bh=mic+nEGujiZA8skeNgXqs73Yz1UH5vF0sRWJb295FiA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hrWvbalD5pLgXku2jWH31zLVLkmr1b0zJ7wl1OLn8fN+uYhlOdEi0Sg6fs1N9itIYx9msNUqXRgARe52Xh7lnzwMCLMp/9FFd1hKXiIT/bpala0X5H9MNKV5p45g+3HcaU6VRmCLmdtZmj9KY0Rk9pTX9raslThDVDEjyXXbuMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xal8yxiR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aNAcE4lr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xal8yxiR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aNAcE4lr"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53hZR4168826
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bu7eRwc4ThvRAi2plwmdFoPFrPMRFwSAWWRJNUn4iXs=; b=Xal8yxiRF3YwO/jy
	SmWVze4QAW16aYwtowEsdIxb16iDe9JUtwFXa43WLPQHAqatyHnQm5lymADYYjKq
	cxGjp7ctX+c56LJ93owMAnd8biX6IRg8L5eDtHzEgifPxJ54i7iio/euKbdT3BFo
	3eJD7trz2QQaOlR9M4wH+hq5qfn3BKrZBmiPpLgVJeTFckGYqwp8/K2MTxueiqM2
	Kr9tsVLsHCx66wIXAAKyyTujvCbdR7aw0OdbtcrY7eZJL1WhgbghUPImiWCDtftP
	Eo/LZ8tWI38ljjsRyvA5YG7QYS39I7spQL64eNcI0LVONtZ8hqqVMoALR6xuUosX
	NJ6YIw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6r3mphp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:37:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5276aa86d00so17747751cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784702221; x=1785307021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bu7eRwc4ThvRAi2plwmdFoPFrPMRFwSAWWRJNUn4iXs=;
        b=aNAcE4lr6uJYmgoRyYJA315QBa/WLTlKNs/tSdp4eZrWVYkymbvEjA+VPgN00OC+Ki
         dJfXPRY64Yi+dHwzG86uP6E7UdAcL5orCk5jgt+/BrJXYFWSO4iOeWqrb9evM8DhhWMD
         d1/gXwWCpu1hKu+8luGuRJFpgfb4VIt/MCj8xn/OKP1rKg3Y/s0VNR5xuehd7muD9YSx
         5w7EPsYIs29k8qF49GlnaGJ5jb2eonWvEWznJUYMP08YfOfcFf4K2ORe32N5xGZxhgDE
         akNpCbkXyZJISootcmN7fxh3OwnXf3Iwqc9MUj7YjiRHrRj0pLC2FRReF4RdtncMFnNQ
         uF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784702221; x=1785307021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bu7eRwc4ThvRAi2plwmdFoPFrPMRFwSAWWRJNUn4iXs=;
        b=r4OU1GbXjnO6d7mJKwdYiwMS1f+EpmT/m5+QGjZyw5RbiuUe2u/TWlLjE7lq2zgotS
         GxB80e2RBh74P5thqnGVEAFjpSXMYxCcN92w1t6/SOO6Ce7ECQSUEtRxZliSSluj5Na9
         cu7vdZZ0ADmimoKsIxdqH4v8uex+1kYOZ1zwkQttbcIXgT8LYAzhoNJHK3Y5/wC7Wv93
         9OHlaDBQYtyB6njmVglKkxggj0xsw7kUaXQDFDgpTyKe41I2RgSnhPS7BAmWLyHkwMSl
         nzWcZzSCMWMh2DuWjszSVt43629ny4qmqI7x2uYNTOQZ0UqenF2YVMYfYPuTt07OzmEa
         UjaQ==
X-Gm-Message-State: AOJu0YzswsnWNpr5Gb5/LBvNivOXQjhKk7dkD8w4Ye2XAK9tLD2rN1Wp
	3Nw9Ck2rFEy+TelDQn1AykORs/syIKRSwodz/MpsCUVxIujQENPa6jPXdsS3RUP+85CBksAZem0
	kx/oq5oRvLx28DUsWTTtiVochEl32/cT19tvyF4UXcZB6MkX+w+iXDgT5EpObz7sw8GhchVLm8k
	td
X-Gm-Gg: AR+sD119xPHUyxWzlawucaY/7MxHteDP3hgM14qUgAWKyyerzkOjmorjtT0TOki0x2o
	gPzbJ+Ov4964tmIBGoWu54G8MDP23uPNstZFkLuTh2I5vKWnvO8rmhKJgdlpFlemyrsbbaIEWB8
	nVLyI0Hs+KLa301euKrYeiCrtjTplox4AU83bRL8KzRODux5krUsoQcaU9cISJ7mBZw18i9iDiu
	0O6TQHqIC+9Vxq8lSA8i9qpnSASluexjTaudhKSYR8LjTDExQOl972ymuMmgY/FNVrLdAht/f02
	QOdIf/s4pchkcwXKJxpXBsSnCXABSqYefkmA2UTBy0+Tx2nRXAoWscfqJH/RU2FpfxAK5ANXYwr
	95dZzFpqRHn9bCTiU059S2zbyFQe0DudTa1NhKbfti+CIMVXia8/cI8jmLOysOk6CUIrM+DELJp
	k/3p/osyi1hWJPBQ==
X-Received: by 2002:a05:622a:2595:b0:51c:844f:28da with SMTP id d75a77b69052e-5213aa6e34amr200542281cf.5.1784702220955;
        Tue, 21 Jul 2026 23:37:00 -0700 (PDT)
X-Received: by 2002:a05:622a:2595:b0:51c:844f:28da with SMTP id d75a77b69052e-5213aa6e34amr200542081cf.5.1784702220527;
        Tue, 21 Jul 2026 23:37:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8c6f6sm309696e87.4.2026.07.21.23.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:36:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 09:36:25 +0300
Subject: [PATCH 10/24] drm/msm: add the get_dsc_config callback to
 msm_display
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-drm-msm-display-interface-v1-10-368c10fe62fd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6149;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mic+nEGujiZA8skeNgXqs73Yz1UH5vF0sRWJb295FiA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqYGTnGBoAGG/QDQJd06aG3s1xGr+xz59NKFvji
 FbUT2sc6+mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamBk5wAKCRCLPIo+Aiko
 1QwtB/9MUZd7vpnKI3x8owNAN1eIDN7gdRv4WAb4zGN8bbEDTgO4s11JkzWdzWYx9Ch/8y4nR5R
 sTHWH7GMxNpDijjNylxwv6bO4Qq2iOazuF1Qfs0Ygc7cAUSy6iW06aAMJfg4gzOSSXf10RHlwn8
 C33CCroFRlbciRDxJB4oAn/8DxpK15cJ0f/Qh1JAmR+1PnB8Hb0wA9ZoBk1db9xo39vEnMphP47
 qDv2SGEtFFLxOJKE+Ie2/U0J2yCxmTQSaUb3oD2L4ZwLvlXF7ZYf1nGblxv2+MWcgNMakZrUETv
 JebETE7954mpiPl1TY53WOKw5Klf0onUXwkKDYHuIs/A6rYf
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfX3Y6UrTc7e/hc
 +jx54exSjLQVtX0TGhh8dz/QxrrlqC4VLJMEkncv4Fdb/0/wkSRdtVLMdmS4pHbZA2cv07+3TFS
 5cB1wMYAPDyvN9CsNYODsiUyaUXl3WqhVcFvgJklvWrcG+7iOkt8LQ8n9IrZ4+UjUdu4XUhzOWt
 nBRmDgjWB5eMS1dz93cyugsKqLeqpkiYKV1pMSl0VpcFGH0YyPFGsIzv/I/plMU6H71w63WDQIm
 RnpW0+qVvEx3oBhBqDsquwe8nZ46pvYR7bjGTcAekpcT7OLMqfwrCtAm5xVr9buQoFoG8qK44ul
 IbK6xU8UPK8XYl/Z0C7fmwDwZeowd8gNMK8XnY7OgfjRxApSxzA83C+kIJgxsIb/XF1gCv5TgZh
 d2RGAkVxSVEplpduQ+8EfxHXYoUle8XxI8LodoxTKzoc/bOHXR/HbJ/XsETLlfIripsgL2o2pln
 CmTTI+hxB5fFh8atMcA==
X-Proofpoint-ORIG-GUID: lr53oOtsLr9D9-CafcQ1eoujGIMu4hhx
X-Proofpoint-GUID: lr53oOtsLr9D9-CafcQ1eoujGIMu4hhx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfX+D6GJS3wjPdF
 t+gN4r2hejWYI9TS44VuXOMaYr4s1PeYRPcrEPSTMgsaKsMmFF6k8fEtFZeYQ9MAt5VRPgJxjQ/
 ChG1lGQzGDa66kaFnQdXB/1vixl3JC0=
X-Authority-Analysis: v=2.4 cv=SIRykuvH c=1 sm=1 tr=0 ts=6a60650d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=zUt5drCBtZ0E8LnXtbIA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220060

dpu_encoder_get_dsc_config() special-cases INTF_DSI to fetch the DSC
config from the concrete DSI sub-block via msm_dsi_get_dsc_config().

Add a mandatory get_dsc_config() callback to struct msm_display_funcs; DSI
returns its host DSC config, DP and HDMI return NULL. The DPU encoder now
uses the generic display lookup and the callback, dropping the
interface-type special case.

No functional change intended.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 8 ++++----
 drivers/gpu/drm/msm/dp/dp_display.c         | 6 ++++++
 drivers/gpu/drm/msm/dsi/dsi.c               | 5 ++++-
 drivers/gpu/drm/msm/hdmi/hdmi.c             | 6 ++++++
 drivers/gpu/drm/msm/msm_drv.h               | 8 ++------
 5 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 09bf959b2ca7..569f3759d02c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -666,12 +666,12 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
  */
 struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
 {
-	struct msm_drm_private *priv = drm_enc->dev->dev_private;
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
-	int index = dpu_enc->disp_info.h_tile_instance[0];
+	struct msm_display *display = dpu_encoder_get_display(drm_enc->dev,
+							     &dpu_enc->disp_info);
 
-	if (dpu_enc->disp_info.intf_type == INTF_DSI)
-		return msm_dsi_get_dsc_config(priv->kms->dsi[index]);
+	if (display)
+		return display->funcs->get_dsc_config(display);
 
 	return NULL;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 425526db7ef9..047295d46c02 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1374,12 +1374,18 @@ static bool msm_dp_display_is_cmd_mode(struct msm_display *display)
 	return false;
 }
 
+static struct drm_dsc_config *msm_dp_display_get_dsc_config(struct msm_display *display)
+{
+	return NULL;
+}
+
 static const struct msm_display_funcs msm_dp_display_funcs = {
 	.modeset_init = msm_dp_modeset_init,
 	.snapshot = msm_dp_snapshot,
 	.wide_bus_enabled = msm_dp_display_wide_bus_enabled,
 	.needs_periph_flush = msm_dp_display_needs_periph_flush,
 	.is_cmd_mode = msm_dp_display_is_cmd_mode,
+	.get_dsc_config = msm_dp_display_get_dsc_config,
 };
 
 struct msm_display *msm_dp_get_display(struct msm_dp *msm_dp_display)
diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index bda778dbcc5b..e42f5b929b84 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -13,8 +13,10 @@ static bool msm_dsi_is_cmd_mode(struct msm_display *display)
 	return !(host_flags & MIPI_DSI_MODE_VIDEO);
 }
 
-struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi)
+static struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_display *display)
 {
+	struct msm_dsi *msm_dsi = container_of(display, struct msm_dsi, display);
+
 	return msm_dsi_host_get_dsc_config(msm_dsi->host);
 }
 
@@ -291,6 +293,7 @@ static const struct msm_display_funcs msm_dsi_display_funcs = {
 	.wide_bus_enabled = msm_dsi_wide_bus_enabled,
 	.needs_periph_flush = msm_dsi_needs_periph_flush,
 	.is_cmd_mode = msm_dsi_is_cmd_mode,
+	.get_dsc_config = msm_dsi_get_dsc_config,
 };
 
 struct msm_display *msm_dsi_get_display(struct msm_dsi *msm_dsi)
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 828cb89ebf9a..918fc9c88a19 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -244,12 +244,18 @@ static bool msm_hdmi_is_cmd_mode(struct msm_display *display)
 	return false;
 }
 
+static struct drm_dsc_config *msm_hdmi_get_dsc_config(struct msm_display *display)
+{
+	return NULL;
+}
+
 static const struct msm_display_funcs msm_hdmi_display_funcs = {
 	.modeset_init = msm_hdmi_modeset_init,
 	.snapshot = msm_hdmi_snapshot,
 	.wide_bus_enabled = msm_hdmi_wide_bus_enabled,
 	.needs_periph_flush = msm_hdmi_needs_periph_flush,
 	.is_cmd_mode = msm_hdmi_is_cmd_mode,
+	.get_dsc_config = msm_hdmi_get_dsc_config,
 };
 
 struct msm_display *msm_hdmi_get_display(struct hdmi *hdmi)
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 5320e4977af9..cda9849811b1 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -287,6 +287,7 @@ struct msm_disp_state;
  *                    mandatory.
  * @needs_periph_flush: whether @mode requires a peripheral flush; mandatory.
  * @is_cmd_mode:  whether the sub-block runs in command mode; mandatory.
+ * @get_dsc_config: return the DSC config for the sub-block, or NULL; mandatory.
  */
 struct msm_display_funcs {
 	int (*modeset_init)(struct msm_display *display, struct drm_device *dev,
@@ -297,6 +298,7 @@ struct msm_display_funcs {
 	bool (*needs_periph_flush)(struct msm_display *display,
 				   const struct drm_display_mode *mode);
 	bool (*is_cmd_mode)(struct msm_display *display);
+	struct drm_dsc_config *(*get_dsc_config)(struct msm_display *display);
 };
 
 /**
@@ -334,7 +336,6 @@ void __exit msm_dsi_unregister(void);
 struct msm_display *msm_dsi_get_display(struct msm_dsi *msm_dsi);
 bool msm_dsi_is_bonded_dsi(struct msm_dsi *msm_dsi);
 bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi);
-struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi);
 const char *msm_dsi_get_te_source(struct msm_dsi *msm_dsi);
 #else
 static inline void __init msm_dsi_register(void)
@@ -356,11 +357,6 @@ static inline bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi)
 	return false;
 }
 
-static inline struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi)
-{
-	return NULL;
-}
-
 static inline const char *msm_dsi_get_te_source(struct msm_dsi *msm_dsi)
 {
 	return NULL;

-- 
2.47.3

