Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA1C3D16E6
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784702230; cv=none; b=AwlQcco/FgMWx4+tonUm/r1lEvb5OOMJDvFI5Sa2LbaOIEN7rIXaqH69tRcmbNgBLA52Ig7ojqhrlsfuvottM91Oln1zkwJZAhKxfMyh9vomjdQma3mSIGy/Ykl5/LT0NQsBhfXC8RRkqfsgEVH1T+QXOizhdCdCBzz3XRjJqBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784702230; c=relaxed/simple;
	bh=AqGGr0Rt7sNJZEaxYRLu/whaI4ak/KQrIfKpyXCjw1s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ckfQHZCweaXfJnTgHYI0dYiHedEY59Hk4Gfop3gj0gness/aa1OwxC9f5Ezzyiw/gPCBhfgXAqc3Qp/Wvwe4+jSS3Rk31hG/v6F9appusn+UWcOA2iyITcAckDrmNK6VXsUBgmmQwweXn3Aw2SMO8kQ/ByzdPtsYbz5sU9MP/cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SDcDK5Nz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S7+z+97q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SDcDK5Nz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S7+z+97q"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53YxG4054814
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZiBIsylPCkNax8ix1SjuSMzRFBkg3HmZWMUJ4ntbMfo=; b=SDcDK5NzOu0F0wCC
	GoJNcV1rxw/IqBHHa1n7PGIYUAtlVSyG4fj0IRuuqhhl5KUn2skmScdaGaUArIIM
	G/Va/HMc2q/XA4bkfOHgxxatHHza2ac5zf2syYmrkKrGfvaYfOj/diBRHRgJOD8b
	wEus41X/Yvy0ZF2THHh+VC2uhyMc9gavYZE/pw54Chrg4HeqsFjJoO3VZhfWfdo6
	15YyTwo0UhJNhCVsmyJqWkaxyUBwMCOrjyYsqyUv2PMFRR90+2QJiYjh7zS+FXQY
	2BC/D3/HRQ1TIojFO7YEpgBgfU6wgdUkAO1k9flHvw/kDStBw2VujDZgDFvmW+x5
	34kV0g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjpxdgdaw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:37:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1b4d961dso102805091cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784702227; x=1785307027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZiBIsylPCkNax8ix1SjuSMzRFBkg3HmZWMUJ4ntbMfo=;
        b=S7+z+97qyMQHAhsvYHmOtBD0GShvwOeHEJINHbax9nbkHEQoxmaichNnFyiPFy3Lt7
         iK9rHcwiy5woXy38N30PkWJC0Rj3FEqmdXWDTY0iCDKsy0XjfQyCIur5iCkJrApBAyvK
         ZGQdlEm8RCOqiPikoQ8AWC0xN1EZmY8S+jcshBeVTm75HLFxoU1D2i+F9qlsr+ieJ7Ny
         w8o5yiSt/UDPBk2t2F53m9dFQ+s2tKKTR0nLG6klTS28ER01NNshPcSlrTffk+D6s8ZC
         RtmSxK+HjKeeuQxUaAo/CYPLq281zRuRbIar8K4gL4sh0mOrfO0tMCbu/NproP5d7j+G
         QaqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784702227; x=1785307027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZiBIsylPCkNax8ix1SjuSMzRFBkg3HmZWMUJ4ntbMfo=;
        b=W0cqednHXae/tjkhNrOs+eQbhSAzLCSJCAmyWqFQHa70rVFwBieMzoY8p9LmChbI5o
         WMDfHxy2svjE3NGCBwxjpDyrIVveC5Sw9uU/p2w/JP5ohOfGc7pT1Xabyyzr0giyMJ1U
         /JJmLqYxVBSDtCxJ1Zkg9L5q9EeOi3LR/0HAI2zZyAABCzmjSvXPWilfWZ7g16wnAfbF
         cQJWvysrR1Yyrki1+NBGyjsPezTJcbHtrW1mXD9DPMAPYg0udhZ8MuzKQBYPDY8QpTkS
         dqHGlJD1kPmBogmktRfIHrIgAmnM45fdu0WXkOKpwWxry+npSTMDlG6QuPWEPcqwTjtX
         ovSA==
X-Gm-Message-State: AOJu0YxACMIMjYBcXo/0a1DFsPBgQIre48kopZv3kP8cgL3ObbSNwDtb
	GI2WH73MDSaq7UV2eFciJ5d1kfxVEXw6IY98J5x1e70qa7nxdddbeiRJYnkj8duAW3ASpbnyhMG
	ipNySwusUs2QTMcr+YHcOtjwkcoC0ZtphkL75ofa2M9dPSJ9LhSeF8fKuDyhJ5TGf1swh61qk2B
	zh
X-Gm-Gg: AR+sD12FmrMpQ34VDpP5cI/iHNg+716B+M4HYmzdXtUgCdfBpN3cYUe0g4fxpyTKL5F
	F6vGZiLXp0WFqt8U8AUdveMCZHq3eC2SjkVWgR7s8mZUDEQj4zyILiIFxpBU5amSqo0gnggoTYa
	GyKaJQ4z51Dkflhd2+9GzvsRPDFE9044uV5qWl9uEuRDLj3RO7ytoES617cZ042x9IzgKhEP/HT
	57kSj9GKyMFZhONWNdNUhwBARXBHFzWOrKQE4lu2OhfFO3PUsxGEqZ4zgRRz/eimpXU5mfkHscQ
	goN3fc46jxtXoDRBkD9z50LBHBWruAEcWLOZeIkuokWDgCKvCUyvc9S9PerQR6glqyrs3LHBrDm
	qWyj59oOQdsvKLWbxaUKiRVoKYHgSv4dCQcQIjSyn7iNZaiCH2DEgXNloQc/1QEYCHCOnmGIYIF
	b3gVwfzmAi8PGM9Q==
X-Received: by 2002:ac8:7e86:0:b0:51c:7aa7:e0e9 with SMTP id d75a77b69052e-527a8c47932mr28197971cf.38.1784702227414;
        Tue, 21 Jul 2026 23:37:07 -0700 (PDT)
X-Received: by 2002:ac8:7e86:0:b0:51c:7aa7:e0e9 with SMTP id d75a77b69052e-527a8c47932mr28197901cf.38.1784702227021;
        Tue, 21 Jul 2026 23:37:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8c6f6sm309696e87.4.2026.07.21.23.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:37:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 09:36:28 +0300
Subject: [PATCH 13/24] drm/msm/hdmi: use dev_get_drvdata() in
 msm_hdmi_unbind()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-drm-msm-display-interface-v1-13-368c10fe62fd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1198;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AqGGr0Rt7sNJZEaxYRLu/whaI4ak/KQrIfKpyXCjw1s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqYGToionz/6DV8ZJm4VhBU5q5cv0PTogHzLvP1
 E0dMH7Ja2eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamBk6AAKCRCLPIo+Aiko
 1c4jB/sGpoJuEPkjQmHA+gOgJJldC9vfgxczwZ/mlbfo1qcHv0crA6wb9wWjkhGqtdoke/T3+Xq
 zoCmjXzS6pjPL6FAgqbp1fnb4eSoe87Ny0Q+b1ZjW+3Yr2fNpMPUinjSmFt5wihbljgyXqoJhsM
 fCO/pYrPPiKuPpvuUw9LyboJUxAS7kig8cx9xIyb9XcG1Zl04chRDqu9/tdxg+lZa/KiS5ZeVBL
 T8XAwNPGXw5l0J0qfOo/JieidzCUlkTbPj6DbWdId1m007EXNRd2M3zDj6pQ35/nNkAXziYrFIw
 rlEM+HoJ5UjEEs1QvYvW5F69w8tr01Z/9WuzUyfQ+D/POHU4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfX2/VfNDyBONM/
 gLfezF+aZGPPONiAiQSfOT/jld8QKF2WJzGI0NoMoDrLhNox2Dj82g9KtSrLnHbAr54OFnvPXK1
 MbBlgKuUA2kCArPo+rHMdvyFXcItIOQ/ZYxTNmapJUee86P4yU9wT+XsxSPuomiJW1w3/4REsVq
 4uxSBQR69qzBPSdM0uisdm1Ut5ysLHyJ/OLqEau0KzKhCA1OZhVwnvOc+bB+3JwxlZtLX4fLZAL
 b8nLpPbIXA+Z/rPhXXkFaLVLELP5RvNtyve1E0YCl5SNRrOcOqUPyfh3lv5yGJGbTvaaa4qzrho
 VgREvXd3rtX95VhXDtw7VPcl+Cak4UtkMOpbY667a/1y+6aC5m2NCjFwCKUyo3JFasAT1n4blJM
 7nvVyPGwV7XQ1bcLarjsVIHy9+1w5LrIwLvf9bzNYMCHcnSUgExbX4z573iJHFB/sZpUjJbh/2l
 cjH2JB5rLYJAZvOwV8A==
X-Proofpoint-GUID: Ap6S6e2vCOLwCfXVtwPG-6CReITSmZu-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfX1aVTLm/EpmW2
 FRY40BEUww4ATMzNC95XrnbNSywzFxFJf32H5I1CyMa07PJz1njlslIeQLeKxCHK+bDz3S0yYzy
 LWxBo8iPfPgty1cezNzBxAK3z27Oavw=
X-Authority-Analysis: v=2.4 cv=b7iCJNGx c=1 sm=1 tr=0 ts=6a606513 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=sJWZvIJlLrokpUqr1y0A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Ap6S6e2vCOLwCfXVtwPG-6CReITSmZu-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220060

msm_hdmi_unbind() fetches its struct hdmi indirectly through
priv->kms->hdmi. The hdmi structure is already stored as the driver data
of the HDMI device (and retrieved that way in msm_hdmi_bind()), so use
dev_get_drvdata() here too. The hdmi pointer is always valid at unbind
time, so the priv->kms->hdmi check can be dropped as well.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 506a9856459e..0327098287d1 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -324,11 +324,10 @@ static void msm_hdmi_unbind(struct device *dev, struct device *master,
 		void *data)
 {
 	struct msm_drm_private *priv = dev_get_drvdata(master);
+	struct hdmi *hdmi = dev_get_drvdata(dev);
 
-	if (priv->kms->hdmi) {
-		msm_hdmi_destroy(priv->kms->hdmi);
-		priv->kms->hdmi = NULL;
-	}
+	msm_hdmi_destroy(hdmi);
+	priv->kms->hdmi = NULL;
 }
 
 static const struct component_ops msm_hdmi_ops = {

-- 
2.47.3

