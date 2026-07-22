Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEAE3C76BC
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784702229; cv=none; b=fPhzs/eeHnIW1FTpIAE6C9QTWKflSluv0R69qhqkoR9tzyljwC+hhNpSWhwuP9tG+RwsFUHVAiskGkpo6I18GRLWDQ5DTymCTlnfxz+th++Ax3FnBvi/yJtMU5h/B4H4GXMvXFMkXdJNzzy/C+I+R2h3cJlVQWS3cW3TuKL7hxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784702229; c=relaxed/simple;
	bh=J5JcUdjVT9C9QWSw0xv74Lqie6fwSBbv71Yn78RRXBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=daRNsPKKqYlNppFjPtWEgV6BAcwzaLkXahOqkoAP38NtFp9E1xdCSL1yTLKp/u6lFM5lf8jJqrSQO2MvZBVCbq7KuPOYHIkcfr4Wo5BE5nmiU5wETqiXgf6S2pyjYzbbprYDli8LbZ6OS6uIh6zUcD0iUAluMNmSwxyRzk+FOno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BlqLdlbH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uut7bUb1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BlqLdlbH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uut7bUb1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53gOU3473525
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:37:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dh9XTLUmPOwHTHXAtvP3AK+tH304PXtEioaM+6qNcog=; b=BlqLdlbHaMzZxr8x
	Jfa8wsPRL+T4xkXL8ZoGJLniwsokR2JzvSTXLFEOOo8QLpcsKNE2ibD0RUDzETvm
	ZK+wtpbiT6jrHC6D+eledNVHz92Tf17cYDCzKRiBVyyvYYYS5Qu/2wynX4lS1D54
	EAjRsJu5cGBO+6HSlKG0Jgm8i4gyQuL67dSBxYPJknn6fxkf6tpI4QUqSnAyNPM1
	d2w7Wn7GAS2HmOCF4dBrxhYuyrFgApJXcs2rmy9qjdSAKVkgSxFIjJ53UE2tx9hE
	VDzpV/pDwQsGIxSZRu6IVjfQ5YZsZzZ6R0v9OhhjJNByXPWRpaWccg+s2Ze7MJYr
	1gsM5w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6ftmaf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:37:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1a97644aso34080671cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784702226; x=1785307026; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dh9XTLUmPOwHTHXAtvP3AK+tH304PXtEioaM+6qNcog=;
        b=Uut7bUb141upI/6spqRHVpfGWc+9QrImxqmuvN6Dyzc6+vl+dJl756FzDSgZUZBToh
         kyEXQAvo+dLiDO2O6AYnJM0VmMhA9UEpRZMujzJkVuG4alkJWVJXHem9ahGF8cE5oTCS
         97mJHj2N3jz/JJwQNoGc+2Q5OvafeJdgt2i1OS/FlC+BbaShh8WEp0vfBpYsIlv2f8on
         4FVSAGGEwLl7w+/xwri0U2gkmjL0AF/qOhTPB16qCPbs3Z07+3AJaqBlPQL7F9zwfwmX
         GsuuZrZr2vWE5y2XDfPet0KstmbuEPaYId4EVnseNnzjztfT+RL0S+ho+S8apzToeXoW
         83Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784702226; x=1785307026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dh9XTLUmPOwHTHXAtvP3AK+tH304PXtEioaM+6qNcog=;
        b=E4fEcjA96ErNTdlTcAX3N9XRcQNOY5NQUS2jn1IiOKDj2rb9VIQTolPTG+kLlrJ+dr
         BcSNdRcGd23fJnAVAO+k3KfRrf0ihqyQMRoUSOjUe6E589ano2Dh24ga9PLXqLi1S4Fy
         fcpg9QtXUx8+vCrYce0loQ1H0Bgoe35D4FX9/AJpbJSf3d+YiitiAeKEPdQtXLwXpXow
         d07X+Cbn7LrA9xCenY+f+C4LM0xh8RJcOjWpkTRG1iPDYS1D3PDBsyPUuOzywm5uIspZ
         0MoT7LMFZ1ekLRjgatUucbfYW8IjTaWUarKW2PHkV3UthWqbL4IEe67P9RILM8Qasa8e
         QWTA==
X-Gm-Message-State: AOJu0YwRENzGqHzSySSJWPbcNbzZ5OlLBoWAI359FawwM4iJ6bXcQNOE
	/XrphKJzcwsWpoiDRtgd42iPu945qecMZpq5bFOP6SU6uNiuq+AebYvw7BNj9d79Zp8ohni4UAT
	DnZMCUCvjyv3kxdGW1suhK+vYulVjvf+4wsdFDrDehRgE0W5M7hT+BtskcypdhACWeklJlG9OOs
	kk
X-Gm-Gg: AR+sD11Vo38eIdYXo4DXFTzCxw0P/D+xSgRh6x/LjShjtzj6FDZ99ow0CxWt81OHiu4
	WlesctZIGES3CcHVRFMp0KufH/jvsSeQDqQuzXvUaGdYUOaHX6diufqNTIJuLRhIfBjMyTi5hJ7
	Vlq82e98lnln+oS9fJDP+2m3rCF7B31AAjl+DsDp/cW4O1d61D0QTS6Y/jRBzJkthBTZksWif/U
	grC5+ETOqE1Wt+UWYAGRiwnz6Lto0cl2w4i/8DFglMe9RNKrYdPjZjpx/y15emFJoGdjkwCgO8z
	yCmw7nddKltkBn7l6k+PYkNH2Dd7q1NrBO4stOrwyBbM6+2h6uEpq9eQmImEPZoXWrup/YNnjUd
	Stbpi1k3m6tfuYv1T2/j/ydIy8mGtZDeMIDsh2RbiEd8svhKkiPnr7nIaWOR15Y/ghUkqkooxzN
	BNsMAAfZNGPDvdbA==
X-Received: by 2002:ac8:5fc4:0:b0:51c:17cd:1fd4 with SMTP id d75a77b69052e-5213e28d313mr204926741cf.41.1784702225806;
        Tue, 21 Jul 2026 23:37:05 -0700 (PDT)
X-Received: by 2002:ac8:5fc4:0:b0:51c:17cd:1fd4 with SMTP id d75a77b69052e-5213e28d313mr204926451cf.41.1784702225287;
        Tue, 21 Jul 2026 23:37:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8c6f6sm309696e87.4.2026.07.21.23.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:37:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 09:36:27 +0300
Subject: [PATCH 12/24] drm/msm: add is_bonded and needs_encoder callbacks
 to msm_display
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-drm-msm-display-interface-v1-12-368c10fe62fd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8063;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=J5JcUdjVT9C9QWSw0xv74Lqie6fwSBbv71Yn78RRXBM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqYGTosLfEn7Qh9Mbdbzfe8ragWNL7jpuO/cg9W
 DHuVF5y2SyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamBk6AAKCRCLPIo+Aiko
 1SGwB/4xm0DUK8KHEcta9ibJjkjRO9FRytup/K4DbMJyJ0zE6VcTSRiXFjUWWGgUMBIflwbeZ4i
 b6xKzQjtnNyFGSgjDioL2216MMJNsgdSALZFv2Y9pfrvBn6EIReMcVLnYL2sytQ3tXcqSDXnfdn
 shd5EmCnU1ZsaBi7pzpoy9Jq6voCLLYxQ/gkivR/mR5lWuM+H0t7tbLmAxylAvbR/poqZ16f10X
 kaoC7JjkzeCiZJdRt8NyZxURXKli5X718e4+SB1XfwCON+y25v9k1KM97yMM7t/6C+FQTwEyV5Q
 Je4BY1FrNMC0DL1qriYBEbKa1ORQv4nTITo+u8/rzGk0UNqb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: MYjWqQ2LPMl16IHHDNp1r7UWF685KzLf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfX3wm19GTaq6Q2
 kQYelAXoZEZEOelu/d5KtsyNBJuo/LOoymSFDZAL7Xci1VXgGZwEASQOdEMOJ4O/fPCIlxUUQUD
 WPVhMiO93wmsZgkpU5PFax/wkXIZ+1cbWB7uJULnxYHV0LWZceM0cVZnXTBoQLy6SywHyZIb2B9
 qVAxZNs2LFvmvXfQW4+BKO7gLdJVFr4rfVG4ED5qODqslIfn2X1XS6gzklMikGX67ZN+uvAjUGx
 3iY7264zR5A7EDVrMi5mSS5OTozBMn8cJIK7MZqsua8K6kH7JEXfobQxVtCEHW8CBiPuHOIKE9H
 jOIoySmCDVV2UjD+QDqL2wYW9WawyXLA3xSrBoD8Xk9O7XgfqJVw9ighJdPR37Bw60Y7t2Agawa
 b5YoLbWUcClVbbLbv3a5H7Uk7ShkgkItXbkG7CZmSkc8c44YlSgfBPC/cphxxSRqNo6pCegVski
 hp1zwvGOhe6pF15mcJw==
X-Authority-Analysis: v=2.4 cv=e/o2j6p/ c=1 sm=1 tr=0 ts=6a606513 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=RdJ1Xk1vZwbINtqq3GsA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: MYjWqQ2LPMl16IHHDNp1r7UWF685KzLf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfX7wB+dQ7GfqfA
 C1vm14JmvETiYX83s0fs4euBqdyqctWvUskEk5RpdCAJfELuY8B5WT/opiD3gtw4XMp6mPzwtAU
 IzXnge+FFKrO96XzyQHAJeAyx37QGCE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220060

The DPU DSI setup calls msm_dsi_is_bonded_dsi() and msm_dsi_is_master_dsi()
on the concrete sub-block to decide whether to create an encoder (the slave
of a bonded pair shares the master's) and whether to add a second tile.

Add two mandatory callbacks: is_bonded() and needs_encoder(). DSI
implements them in terms of its internal bonded/master helpers (now
declared privately in dsi.h); DP and HDMI are never bonded and always need
their own encoder. The DPU backend uses the callbacks, dropping the last
concrete msm_dsi_*() queries from its display setup.

No functional change intended.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |  8 ++++----
 drivers/gpu/drm/msm/dp/dp_display.c     | 12 ++++++++++++
 drivers/gpu/drm/msm/dsi/dsi.c           | 15 +++++++++++++++
 drivers/gpu/drm/msm/dsi/dsi.h           |  2 ++
 drivers/gpu/drm/msm/hdmi/hdmi.c         | 12 ++++++++++++
 drivers/gpu/drm/msm/msm_drv.h           | 17 +++++++----------
 6 files changed, 52 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 8dacde316033..2eeaef963e1a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -603,18 +603,18 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 		if (!priv->kms->dsi[i])
 			continue;
 
-		if (msm_dsi_is_bonded_dsi(priv->kms->dsi[i]) &&
-		    !msm_dsi_is_master_dsi(priv->kms->dsi[i]))
+		display = msm_dsi_get_display(priv->kms->dsi[i]);
+
+		if (!display->funcs->needs_encoder(display))
 			continue;
 
 		memset(&info, 0, sizeof(info));
 		info.intf_type = INTF_DSI;
 
 		info.h_tile_instance[info.num_of_h_tiles++] = i;
-		if (msm_dsi_is_bonded_dsi(priv->kms->dsi[i]))
+		if (display->funcs->is_bonded(display))
 			info.h_tile_instance[info.num_of_h_tiles++] = other;
 
-		display = msm_dsi_get_display(priv->kms->dsi[i]);
 		info.is_cmd_mode = display->funcs->is_cmd_mode(display);
 
 		rc = dpu_kms_dsi_set_te_source(&info, display);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 95810e3b01a7..914cf9dd0f21 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1384,6 +1384,16 @@ static const char *msm_dp_display_get_te_source(struct msm_display *display)
 	return NULL;
 }
 
+static bool msm_dp_display_is_bonded(struct msm_display *display)
+{
+	return false;
+}
+
+static bool msm_dp_display_needs_encoder(struct msm_display *display)
+{
+	return true;
+}
+
 static const struct msm_display_funcs msm_dp_display_funcs = {
 	.modeset_init = msm_dp_modeset_init,
 	.snapshot = msm_dp_snapshot,
@@ -1392,6 +1402,8 @@ static const struct msm_display_funcs msm_dp_display_funcs = {
 	.is_cmd_mode = msm_dp_display_is_cmd_mode,
 	.get_dsc_config = msm_dp_display_get_dsc_config,
 	.get_te_source = msm_dp_display_get_te_source,
+	.is_bonded = msm_dp_display_is_bonded,
+	.needs_encoder = msm_dp_display_needs_encoder,
 };
 
 struct msm_display *msm_dp_get_display(struct msm_dp *msm_dp_display)
diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index e07d1a964c7c..69e57ab47258 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -27,6 +27,19 @@ static const char *msm_dsi_get_te_source(struct msm_display *display)
 	return msm_dsi->te_source;
 }
 
+static bool msm_dsi_is_bonded(struct msm_display *display)
+{
+	return msm_dsi_is_bonded_dsi(container_of(display, struct msm_dsi, display));
+}
+
+static bool msm_dsi_needs_encoder(struct msm_display *display)
+{
+	struct msm_dsi *msm_dsi = container_of(display, struct msm_dsi, display);
+
+	/* the slave of a bonded pair shares the master's encoder */
+	return !(msm_dsi_is_bonded_dsi(msm_dsi) && !msm_dsi_is_master_dsi(msm_dsi));
+}
+
 static bool msm_dsi_wide_bus_enabled(struct msm_display *display)
 {
 	struct msm_dsi *msm_dsi = container_of(display, struct msm_dsi, display);
@@ -302,6 +315,8 @@ static const struct msm_display_funcs msm_dsi_display_funcs = {
 	.is_cmd_mode = msm_dsi_is_cmd_mode,
 	.get_dsc_config = msm_dsi_get_dsc_config,
 	.get_te_source = msm_dsi_get_te_source,
+	.is_bonded = msm_dsi_is_bonded,
+	.needs_encoder = msm_dsi_needs_encoder,
 };
 
 struct msm_display *msm_dsi_get_display(struct msm_dsi *msm_dsi)
diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 1d1bda0682db..d594a7399f54 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -50,6 +50,8 @@ struct msm_dsi {
 };
 
 /* dsi manager */
+bool msm_dsi_is_bonded_dsi(struct msm_dsi *msm_dsi);
+bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi);
 int msm_dsi_manager_connector_init(struct msm_dsi *msm_dsi,
 				   struct drm_encoder *encoder);
 int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg);
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 6e077747ebce..506a9856459e 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -254,6 +254,16 @@ static const char *msm_hdmi_get_te_source(struct msm_display *display)
 	return NULL;
 }
 
+static bool msm_hdmi_is_bonded(struct msm_display *display)
+{
+	return false;
+}
+
+static bool msm_hdmi_needs_encoder(struct msm_display *display)
+{
+	return true;
+}
+
 static const struct msm_display_funcs msm_hdmi_display_funcs = {
 	.modeset_init = msm_hdmi_modeset_init,
 	.snapshot = msm_hdmi_snapshot,
@@ -262,6 +272,8 @@ static const struct msm_display_funcs msm_hdmi_display_funcs = {
 	.is_cmd_mode = msm_hdmi_is_cmd_mode,
 	.get_dsc_config = msm_hdmi_get_dsc_config,
 	.get_te_source = msm_hdmi_get_te_source,
+	.is_bonded = msm_hdmi_is_bonded,
+	.needs_encoder = msm_hdmi_needs_encoder,
 };
 
 struct msm_display *msm_hdmi_get_display(struct hdmi *hdmi)
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 989b0a37d6aa..378d2cc80b66 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -289,6 +289,11 @@ struct msm_disp_state;
  * @is_cmd_mode:  whether the sub-block runs in command mode; mandatory.
  * @get_dsc_config: return the DSC config for the sub-block, or NULL; mandatory.
  * @get_te_source: return the tear-check source name, or NULL; mandatory.
+ * @is_bonded:    whether the sub-block is part of a bonded (tiled) pair;
+ *                mandatory.
+ * @needs_encoder: whether the sub-block needs its own encoder created (false
+ *                 for e.g. the slave of a bonded pair, which shares the
+ *                 master's encoder); mandatory.
  */
 struct msm_display_funcs {
 	int (*modeset_init)(struct msm_display *display, struct drm_device *dev,
@@ -301,6 +306,8 @@ struct msm_display_funcs {
 	bool (*is_cmd_mode)(struct msm_display *display);
 	struct drm_dsc_config *(*get_dsc_config)(struct msm_display *display);
 	const char *(*get_te_source)(struct msm_display *display);
+	bool (*is_bonded)(struct msm_display *display);
+	bool (*needs_encoder)(struct msm_display *display);
 };
 
 /**
@@ -336,8 +343,6 @@ void dsi_dev_detach(struct platform_device *pdev);
 void __init msm_dsi_register(void);
 void __exit msm_dsi_unregister(void);
 struct msm_display *msm_dsi_get_display(struct msm_dsi *msm_dsi);
-bool msm_dsi_is_bonded_dsi(struct msm_dsi *msm_dsi);
-bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi);
 #else
 static inline void __init msm_dsi_register(void)
 {
@@ -349,14 +354,6 @@ static inline struct msm_display *msm_dsi_get_display(struct msm_dsi *msm_dsi)
 {
 	return NULL;
 }
-static inline bool msm_dsi_is_bonded_dsi(struct msm_dsi *msm_dsi)
-{
-	return false;
-}
-static inline bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi)
-{
-	return false;
-}
 #endif
 
 struct msm_dp;

-- 
2.47.3

