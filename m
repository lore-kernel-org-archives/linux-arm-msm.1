Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2513C4562
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784702227; cv=none; b=kkmecsvdbGOEWYxgS5EaPf2TWoBikI5557gybSZPOH/mpKLcrOb1nC2+woNoWbQJHCWOLFxwnmeTUAhi3hHWdsbGUIt8MwOVAN3O39Qvw3xkNtUNJ4ysfJ04tueyl9nnDwVdu3JSo1LeV/7fNCKhINoMXdauh2sk716izfxg3lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784702227; c=relaxed/simple;
	bh=iW1HxeBV/OI9ywvqkNJiv6+quKkZPYuL+t2SrY2ZMEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TQH69mG9JT+TfWiQpaUjBFjmMJOBJQBAElOzX4w9d0xT5j3AdogD/lZQbJAK9tOfFQ5wQa/rac3F9ZQ7gGSlx1cIyHGLYUqg8HG4/hdVSlRnH8wa4+dqs1f/yWHaC7kM4imgjGdruxeqVrZhMAJJrTZ5qqsru9xoL33PDeh5IxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mx06ZQ5c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=juc8WBSZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mx06ZQ5c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="juc8WBSZ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53ZFq4054825
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yaFuNCRXAnSBOSZbKpBDQZFE6PEtYKAhtV7IE6fz5U8=; b=Mx06ZQ5cHMSTVUJA
	NgVYJxtuOH3q+cprAmcBhKy6pUnSr8eOcsPQr5wMKznZ1/wBvQOKtM+CSOCjHKDH
	exW5wQOjbwvuZgMPoh8M5CahkuR4dxvWu5nVsM/10rnwdn+LJk85lMLzmCaLO9zj
	ayyQz37QmyGTIO3IiGjb+8GPM48XbKhHrQGb9GveF8cGI2KyRXHUVcewml84nnZC
	v307/+68a4Uk360TyziE8baem0rTDix0gUoUdtZ6vmbVkH+L8yywkUHZPw2hdLRS
	iZrXn1zJ6A8nMlAToN744pqeWtq3kRODMUL4XQmyyd9hwntI1AKnEGBuzA5+q1qB
	RepVwA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjpxdgdak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:37:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d137a68so333056691cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784702224; x=1785307024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yaFuNCRXAnSBOSZbKpBDQZFE6PEtYKAhtV7IE6fz5U8=;
        b=juc8WBSZp/2uGNhHD8+dQODXxXT3bi0ClHwNzZRV6bTFdijIK1TgjP3FbBafcHIL4R
         An9UOsTs46nYVvXSaOIKzXEky5KzgAKS4AZ9V9etXkkvydX7v52NdM9Y3SVIQaudqG9V
         Rik1xSQM/RBcvG0yBpQzNTvHvFAJZ6h1i9c00/zkIzmSfSbrJmu4jYZWLYTKaHjaKI2f
         8geUQ5jqa0kaLkcKtGmSIDRkEq9dlacW0dEkKg32Ixlz1TzbiOwfcuLwQl245dlbd19R
         erlqZxKKnewvXnU3rZWXfixUVLhOwFAaaXrRWsAqk8hNKwDxCIhm28QYM5mhDMbOTHoJ
         7jNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784702224; x=1785307024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yaFuNCRXAnSBOSZbKpBDQZFE6PEtYKAhtV7IE6fz5U8=;
        b=QPLxE2XU9NJOFuCGs8OIuaOufWwR3P6KTKcBXVb2gX8yqSHH++YONQjFzKQQaeSG0V
         6jl8CMv9Qf/e1zmLMNyo8LIl/0dQTMIwOQFxGSIBHufs1yIKsxEUmEDoESr9pldbJulW
         CFk6+Jm63d/up38DSfpvvbud3r0UQEmvpw00WuxacPfXz5D0SDf7WlTf0Zeq9uIZlLew
         0OOorxhxyLsSaXHyW/wpuea+Mpyf9GWyUgpINoqdIlWPVJWAXDX/EwJIqEE7gcRFvXg8
         nmEw1DZB4R6Xu/aT68zVRwEA4zdSsXszpCGjTrNa0FkjQRJlF8nGOsahRBwh1tf3ixH3
         cxGA==
X-Gm-Message-State: AOJu0Yx0haIMQBIPB/xVnE1cht11/fBBUTqrWPAcPBBdJ0aqDBZLo1al
	Jmki0MSurKIoPNfYVn2te1Jmk2SMIkEbBQGXgP6/2Vg+DQNzNcDASKzTLPSZH6wDjGgPOHjcd5V
	Rig2fxxHS1a3KI+DJmEn/jt0KNzmcaRRoZsHLDiVwMsoXDWPuSYUhpg4mf1NQklj3AHvW4OSMUU
	+r
X-Gm-Gg: AR+sD13+KMswwm50rpF/ViWTzzlIz1lecDXgDp199CtrJPX0DijoXvgdqtkKxWzLjZ7
	En3fmYfEPVYilDH25jzK59px1BQ36MHo7p0CfArpadKB5aZ7qDEZhxtQoIcZrDD/fS+ywRbmZds
	8+4fZ/0Uh/V3+hSCrr/5zP/or3ZxtJjl4eNF8BiUH4+JiCZLfOi8XXeFKGWHx6+ViBxyWOdu9V9
	SkQ6MZbCqCG8SGCORS5ku2jmU+zJQXfr6WVi6dSPArkK6ort87V/Pw9C2woOSxtvYOQbJ7JCFf7
	HU4V5P0XWzwyR4Vecmjc0YFcEMJotZQEVuslB74t8CLv2pxwppV0Lb32xwg9qBR7MTzbZP7fiee
	lZVb0vT7pQAOAjve23QEOhXEc9wkCEUA0PIiV2ycxkuhaFg/VT4WfQ98//7wAOHydfk6Kf1SW0f
	4ASELgC8sKVtq0kA==
X-Received: by 2002:ac8:5948:0:b0:528:2e9:c0e8 with SMTP id d75a77b69052e-52802e9cb3fmr13546991cf.79.1784702224115;
        Tue, 21 Jul 2026 23:37:04 -0700 (PDT)
X-Received: by 2002:ac8:5948:0:b0:528:2e9:c0e8 with SMTP id d75a77b69052e-52802e9cb3fmr13546751cf.79.1784702223696;
        Tue, 21 Jul 2026 23:37:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8c6f6sm309696e87.4.2026.07.21.23.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:37:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 09:36:26 +0300
Subject: [PATCH 11/24] drm/msm: add the get_te_source callback to
 msm_display
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-drm-msm-display-interface-v1-11-368c10fe62fd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6856;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=iW1HxeBV/OI9ywvqkNJiv6+quKkZPYuL+t2SrY2ZMEk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqYGTnw1h0vZ/U19qP9/PsZqlqJC1adcirKYutC
 5BZP5dFV6GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamBk5wAKCRCLPIo+Aiko
 1SO9B/43+hlIiu2z8gpg4OwbpHLYJYpOfC4IFQ72OIXq4yxPiC4131IQIllEtx7uhIBV+8SB+9G
 /UlJKn2TwpCVGJnoavS1DqpuSQF+bPu+WMCstxSJZ2Mvh0KctK4KX8BXKSNGHVKwpYQTVz8c0yq
 rfAVw3a+IjW35ykK6HsVwF3zolXhnVFO1v4CuCMMmPqlp0ohP8oql9Etl3ojOh5djwqdHyUz+e7
 Sor1NjCmE0KZ8vpFSzaCdiY7Pknd5Zrm8y/rhHSMfy2keblcuzE16X/p1W3EU2ruMV3tYyVhxAL
 DOeW8XkHS9N1jJi7nyqP8b74To7TuHmP5jS6KBaofMS3k+iL
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfX5QFUDbv9Ewtz
 PH8zxB6zg5YlU/lT/6HKrFw69tglhhZ6SvgvnTC/VFRyFaN9cDOcF3lzxvKUpraX0kECxjMK2QS
 wKjrotqbu1ZrMNBB+av7txBt3r7/TA+p93hxMFgZ1ow5MYMaZPu3Stf2NsYq6Q9/vIeRCatorUs
 59f7cGrQq7b1RuQIJXqlczFU/BAO04SvuWJRsPBxg6VF/S0RWWsNAuDpNLrECqL2TPyKHy+EZA8
 6C7h1IFYR0vIGCOYtFKXxYVrwMHuX1pWqjDfDlXunCxWEMHSd+/39MBvHJsQ7IzTURaAh5dQZE7
 LNKOpcOD2cqXBdT9FskWN4POHVi41vDLIB6cH4VCo8saaPlSC/OIrXUiddRZCrNktFv9E+0kAA+
 xKpN7bGxHCpXIh7HU67MAbIgQMQ89vjLb//i2YAw/ywQWSN572bqYBHKNSujfP1XiTSnmJDPSyX
 MFh4nNSVBp8KvZyBpSw==
X-Proofpoint-GUID: S25p-MkexB3Cl0O7e1J3W5abU5ECt5l6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfX3nhDwAdJb3Ew
 JE6n1te6e/ammIWTsOjuRQHomANm9ptMjlZ/yLyl5ggCT479EYaSgqtk0uz8ijyCol49n2CclYY
 24tIAGgR4TlmoH0Kmm270oQ0gPt5GLE=
X-Authority-Analysis: v=2.4 cv=b7iCJNGx c=1 sm=1 tr=0 ts=6a606510 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=5UgVsPALq_5EqvSQFhsA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: S25p-MkexB3Cl0O7e1J3W5abU5ECt5l6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220060

The DPU backend reads the tear-check source name of a DSI link through
msm_dsi_get_te_source() on the concrete sub-block while building the
display info.

Add a mandatory get_te_source() callback to struct msm_display_funcs; DSI
returns its te_source string, DP and HDMI return NULL. dpu_kms_dsi_set_te_
source() now takes a struct msm_display and dispatches through the
callback.

No functional change intended.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 6 +++---
 drivers/gpu/drm/msm/dp/dp_display.c     | 6 ++++++
 drivers/gpu/drm/msm/dsi/dsi.c           | 8 ++++++++
 drivers/gpu/drm/msm/dsi/dsi_manager.c   | 5 -----
 drivers/gpu/drm/msm/hdmi/hdmi.c         | 6 ++++++
 drivers/gpu/drm/msm/msm_drv.h           | 8 ++------
 6 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 7928bc1a73f3..8dacde316033 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -555,9 +555,9 @@ static const char *dpu_vsync_sources[] = {
 };
 
 static int dpu_kms_dsi_set_te_source(struct msm_display_info *info,
-				     struct msm_dsi *dsi)
+				     struct msm_display *display)
 {
-	const char *te_source = msm_dsi_get_te_source(dsi);
+	const char *te_source = display->funcs->get_te_source(display);
 	int i;
 
 	if (!te_source) {
@@ -617,7 +617,7 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 		display = msm_dsi_get_display(priv->kms->dsi[i]);
 		info.is_cmd_mode = display->funcs->is_cmd_mode(display);
 
-		rc = dpu_kms_dsi_set_te_source(&info, priv->kms->dsi[i]);
+		rc = dpu_kms_dsi_set_te_source(&info, display);
 		if (rc) {
 			DPU_ERROR("failed to identify TE source for dsi display\n");
 			return rc;
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 047295d46c02..95810e3b01a7 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1379,6 +1379,11 @@ static struct drm_dsc_config *msm_dp_display_get_dsc_config(struct msm_display *
 	return NULL;
 }
 
+static const char *msm_dp_display_get_te_source(struct msm_display *display)
+{
+	return NULL;
+}
+
 static const struct msm_display_funcs msm_dp_display_funcs = {
 	.modeset_init = msm_dp_modeset_init,
 	.snapshot = msm_dp_snapshot,
@@ -1386,6 +1391,7 @@ static const struct msm_display_funcs msm_dp_display_funcs = {
 	.needs_periph_flush = msm_dp_display_needs_periph_flush,
 	.is_cmd_mode = msm_dp_display_is_cmd_mode,
 	.get_dsc_config = msm_dp_display_get_dsc_config,
+	.get_te_source = msm_dp_display_get_te_source,
 };
 
 struct msm_display *msm_dp_get_display(struct msm_dp *msm_dp_display)
diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index e42f5b929b84..e07d1a964c7c 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -20,6 +20,13 @@ static struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_display *display
 	return msm_dsi_host_get_dsc_config(msm_dsi->host);
 }
 
+static const char *msm_dsi_get_te_source(struct msm_display *display)
+{
+	struct msm_dsi *msm_dsi = container_of(display, struct msm_dsi, display);
+
+	return msm_dsi->te_source;
+}
+
 static bool msm_dsi_wide_bus_enabled(struct msm_display *display)
 {
 	struct msm_dsi *msm_dsi = container_of(display, struct msm_dsi, display);
@@ -294,6 +301,7 @@ static const struct msm_display_funcs msm_dsi_display_funcs = {
 	.needs_periph_flush = msm_dsi_needs_periph_flush,
 	.is_cmd_mode = msm_dsi_is_cmd_mode,
 	.get_dsc_config = msm_dsi_get_dsc_config,
+	.get_te_source = msm_dsi_get_te_source,
 };
 
 struct msm_display *msm_dsi_get_display(struct msm_dsi *msm_dsi)
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 959daa88b1d0..2a5326f1fa8b 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -614,8 +614,3 @@ bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi)
 {
 	return IS_MASTER_DSI_LINK(msm_dsi->id);
 }
-
-const char *msm_dsi_get_te_source(struct msm_dsi *msm_dsi)
-{
-	return msm_dsi->te_source;
-}
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 918fc9c88a19..6e077747ebce 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -249,6 +249,11 @@ static struct drm_dsc_config *msm_hdmi_get_dsc_config(struct msm_display *displa
 	return NULL;
 }
 
+static const char *msm_hdmi_get_te_source(struct msm_display *display)
+{
+	return NULL;
+}
+
 static const struct msm_display_funcs msm_hdmi_display_funcs = {
 	.modeset_init = msm_hdmi_modeset_init,
 	.snapshot = msm_hdmi_snapshot,
@@ -256,6 +261,7 @@ static const struct msm_display_funcs msm_hdmi_display_funcs = {
 	.needs_periph_flush = msm_hdmi_needs_periph_flush,
 	.is_cmd_mode = msm_hdmi_is_cmd_mode,
 	.get_dsc_config = msm_hdmi_get_dsc_config,
+	.get_te_source = msm_hdmi_get_te_source,
 };
 
 struct msm_display *msm_hdmi_get_display(struct hdmi *hdmi)
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index cda9849811b1..989b0a37d6aa 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -288,6 +288,7 @@ struct msm_disp_state;
  * @needs_periph_flush: whether @mode requires a peripheral flush; mandatory.
  * @is_cmd_mode:  whether the sub-block runs in command mode; mandatory.
  * @get_dsc_config: return the DSC config for the sub-block, or NULL; mandatory.
+ * @get_te_source: return the tear-check source name, or NULL; mandatory.
  */
 struct msm_display_funcs {
 	int (*modeset_init)(struct msm_display *display, struct drm_device *dev,
@@ -299,6 +300,7 @@ struct msm_display_funcs {
 				   const struct drm_display_mode *mode);
 	bool (*is_cmd_mode)(struct msm_display *display);
 	struct drm_dsc_config *(*get_dsc_config)(struct msm_display *display);
+	const char *(*get_te_source)(struct msm_display *display);
 };
 
 /**
@@ -336,7 +338,6 @@ void __exit msm_dsi_unregister(void);
 struct msm_display *msm_dsi_get_display(struct msm_dsi *msm_dsi);
 bool msm_dsi_is_bonded_dsi(struct msm_dsi *msm_dsi);
 bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi);
-const char *msm_dsi_get_te_source(struct msm_dsi *msm_dsi);
 #else
 static inline void __init msm_dsi_register(void)
 {
@@ -356,11 +357,6 @@ static inline bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi)
 {
 	return false;
 }
-
-static inline const char *msm_dsi_get_te_source(struct msm_dsi *msm_dsi)
-{
-	return NULL;
-}
 #endif
 
 struct msm_dp;

-- 
2.47.3

