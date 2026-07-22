Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5221C3AD51F
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784702211; cv=none; b=le0w0wh2VWrEaSYeE6fz1Rw2wJsrxEnJWtDHGeldv6o0+uYNrGia9C07tz0bbNlvNlw+bHN2/vbO2tqmloMIiuzPjKiAX8wzUPUGqCfTikDH7aN2SvvSbtuxENmwiK2TsvRfftJT06vS3noPvY7t9yrxhx0dQGlPOYeirBMQObs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784702211; c=relaxed/simple;
	bh=wHwe7eJuJTYqmz/TsunqqWhXimzjZh7z7oauF1VXkeg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oYN4aT44vTT73J5RRHGWHPi44+0KwdaBeHJXzJHFclKFQ5Sy6KRXN+eLcWPHW/y/WbbEVXpnsQ8zbv3QZL11l9HSdq4M0gS9+mVUcuKoG1pRMIKOghOgCzK+V8JnbTMUuCKgs6mAQo6sGnX39mivf6SZhfE9Iega42z4N1a7jaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=islnYv1w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nrzd+i26; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="islnYv1w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nrzd+i26"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53idN4168890
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f8f3pTQWb1DUH/SMD1hqL4uhPClug+lZg6FGrEkFBbg=; b=islnYv1w0yq2w6d0
	2ninNRob4gjDNO995Owp67Jp9+wDIHuCd1/kEX+UWRKwKlqOfXmYd1g0nIHK7ouY
	I8S6NBY/PZDr8eI6eBqYJyQu1vS5NKjgF48fllkYQe/yy9zNJC6WHPKkGi4++x4L
	Wes6+Wtb5dAo2hqLBqVWmpu90baFBycXMB4aCKeaxjsw0MjgmrtYiGxYmHP+2mhE
	Jd99Hpgi9Gs/DBZFXCfr675pRuKK6h4nNcv1QGoEXTbpwkVy+cLB6W8Y+/mC9K4q
	gJZ38hbJLimlxAMwO0WwJE7ZC49/5+zJB119betri8Nim1KP1gOJPpuos35MYCDs
	1tOysA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6r3mpgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:36:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-526da7e3c9dso24035871cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784702208; x=1785307008; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f8f3pTQWb1DUH/SMD1hqL4uhPClug+lZg6FGrEkFBbg=;
        b=Nrzd+i26yuz8yaQI8MwuUOIuFr0Lfqq25obiP5LVVXZlxoNUuaLzxuzTMieXQ7Vs1w
         cUyTT/pi39SXoYQDYJ9EjlF17E7Xgm4XbFD6BLn21ybodspce0+0zD9+telh+Y31b+u9
         FCkAY/DcYsGsLFkeCboZ4WHWTWKm8OgKJV/gWJYYS2H9OUHGcL3B60NhAU5gzenqb7nK
         ysMRRD21EZAAPIVgfYF3VSXXLoew5c+Se7pqeSuom/DSKzBB7ft9x48J/oMatuDLnil0
         iAWISf+6MPqjJB7SrG/H1+4koyNG5WVmdRLHuvkb1tZC7nuqI6bwI/AhBGuZfL9Xg8f/
         +cYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784702208; x=1785307008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f8f3pTQWb1DUH/SMD1hqL4uhPClug+lZg6FGrEkFBbg=;
        b=SaNZGPZB1aZlpdmBicO29VbesMY/FQySlms2jYurhcysBlXNM1uxKicOz+IEzhL9wz
         /lNCcbpMrokw672vVrQQ24n1xcqgV42ianzMZI7dfxi89N+h2y5Tfxe+9ULBJZRrlicf
         nped1ubF9u/N/8WzDfZVHkzStTeLnhnnSYMVq9YHYjihZQcup93a7kqckuGQ1v6VZusW
         CnDC2LW5suMsqhUSwRi62F+L3Vwz8MQPPguAyxHX3wGqTuwAjIPn4wjLK03VEoQjjJbu
         eWly5qa5g1AhyiRqX8gcZo5mr9G3UANPDxztvqc3hWfldale9Qt2o0hMGE32WnDkwW7+
         bx1w==
X-Gm-Message-State: AOJu0YxlgOZ44JEwBeegJYNNBhDENs+j03YFRxV0n08hMZKjUbQuwRXm
	bpEqkyUN34DYpyD2BJ0Xn2G/NtIRph+RUJS9e8GfVQUtr4Gbvz98fSKVyVEGmdz3qNyPH5nS+nQ
	xs0aTJisg+ia7d7Xy34AsHSCi0FN8684q+DO4TcvDHe97OFQskm82jIPGHBpML3zQrbYiApXQMx
	bh
X-Gm-Gg: AR+sD11KqPvpmmeaUgG6L42tekHX6eo82nKWvsOpar4DerwTUwQ0d2yAzc3Z6z7O6GJ
	FZgMCSoIjETDT6sSEhs5jS72NWztlzy9LhfqogVHzHs7zWaA70Fsg6yzBCkoBnhXK1n25YAyfMp
	fjAZurKdQlitT3EO7byCMU/PvnzcbJ12AWRe5iBjYC4Bp/ej7j8ZYg3OftNj88y37z6JQPTfFs7
	NwL8+tFcYede17f1za/u/WaS38y3s6/NYRTV5s4jx42YODcm4j4zEBhhpVBPWDotO1l9HbP/4qB
	6+ddMGU9dCJzJ97cTFGPJYNVWbqJjhEixnKmo3RTdkI/mTQWx69T+HBPsWKY5tnYRmWFyejh2v0
	nhLLxZtEkOhgabmxM/R4DE63P58sYe0g8qEExwk/Z75FjqEmbFTXOAHuSg6SM2Iu+SrZEUvOB2r
	EQxVEkbYDWYs1vfg==
X-Received: by 2002:ac8:58cd:0:b0:51c:1117:c7c with SMTP id d75a77b69052e-5213c2015femr202516311cf.25.1784702207998;
        Tue, 21 Jul 2026 23:36:47 -0700 (PDT)
X-Received: by 2002:ac8:58cd:0:b0:51c:1117:c7c with SMTP id d75a77b69052e-5213c2015femr202516161cf.25.1784702207520;
        Tue, 21 Jul 2026 23:36:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8c6f6sm309696e87.4.2026.07.21.23.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:36:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 09:36:21 +0300
Subject: [PATCH 06/24] drm/msm/hdmi: capture the HDMI registers in the
 display snapshot
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-drm-msm-display-interface-v1-6-368c10fe62fd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2412;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=wHwe7eJuJTYqmz/TsunqqWhXimzjZh7z7oauF1VXkeg=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1ZCyvOUHD6riAeqFdIfzqzVm8yjksD7+YKAgwt37+Wtb
 z2Wu27pZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBETiux/y9gvzFFd+oKnocH
 133fZByUtqF8QWnR6b9PpPqib93XZ88NTBRYHFim9mB5R7IYY9PRqUtbLI92bLMWWja74NGFhq3
 HvzB5aawW+ZF4zWylhNIKwSyfW9LLQhNT6qL3yk87J+dgKa4Vcr+t4rLy5Ud7duwW/LmmxG3fiX
 9/JDI8/dMPvZW8/sFM+5Wk02ZP7kMnX842VFBqNXitskJ7fZ9pQ19bvk/sMt7fJf/eT2zSVue4m
 HY5cprcDMPkome7hf7Z6eh2f8ti3pZ3v2qy0M+PiyQFz6VOTRIzl9R9ZPjXKq/XmLNXvDU24uof
 EW3z0zrJC8pyX4cl6VYwW6oLeu/516RY6S8eUbkmLXshAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfX+LsjsJLorcRT
 fNWZVfhrtQoo3vaYOiNu7jZSZ1cx4+MsdE5OhEkLDFSbRBZp+aszEgssmFZwCf9c8bGWvc6TQs9
 DK7ZV8dd9+/pwc05nfPTg6gUGgpxlEjB3m1Jy9R8ve4QAVcSdT6xpnFDPYFC3kdSv52JXDc3a0+
 nhZMOv8YnJk7QyRbrJOm2XO4snvFM+s6o6OVJn+4MLrXZb4dvzvn1uzgONFvdjHtLFtRuQNzmXP
 p3yNspdEU2qbLVmgKr4CgSh2/abKewWJGIFrdKUxv+tpeOQMtu51SaitZcturGB14SbCe4CWMi1
 cD78TO9H9kcnxebCbNp6brm+io5JOC+mgyV172S4BeTl4PWR8Jfk+ED2Z5RD/vZ+4FAL//pOZFf
 D5qQxzy485SY0R6Lgfl0X70oZx7Uiqm2YcD7ZtiMf1jruo62HMHp88fz+n8665Rqgm4YFHvf1Bs
 pw2RqE4sXmFde7UphdQ==
X-Proofpoint-ORIG-GUID: 83wI_9ST8bm9Q_gd9eS2jQHI9bsAqXwC
X-Proofpoint-GUID: 83wI_9ST8bm9Q_gd9eS2jQHI9bsAqXwC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfX1RlCDIGu+cF/
 a9hhvSq6JRi9srfqi74C327rFDzvHK6KF+Tzeyg/6WRNvt/3Rdu9FBhV1J9bYB8Olk38OcAUh2i
 5Lnws523RwQKMS85wV2vna1QzZd1u8k=
X-Authority-Analysis: v=2.4 cv=SIRykuvH c=1 sm=1 tr=0 ts=6a606500 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=kDeXkUw5qkRwNzW-y3oA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220060

The HDMI block was never included in the display snapshot, so its
register state is missing when a snapshot is captured for debugging.

Fill in the previously empty HDMI snapshot callback to dump the HDMI core
register block. The size of the block is now obtained via
msm_ioremap_size() at probe time and stored in the hdmi structure. As
with DP, the registers are only accessed while the block is powered on,
to avoid an unclocked access.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 14 +++++++++++++-
 drivers/gpu/drm/msm/hdmi/hdmi.h |  1 +
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 350867ada0cf..72ab2e92964e 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -17,6 +17,7 @@
 
 #include "msm_kms.h"
 #include "hdmi.h"
+#include "disp/msm_disp_snapshot.h"
 
 void msm_hdmi_set_mode(struct hdmi *hdmi, bool power_on)
 {
@@ -214,6 +215,17 @@ static int msm_hdmi_modeset_init(struct msm_display *display,
 static void msm_hdmi_snapshot(struct msm_display *display,
 			      struct msm_disp_state *disp_state)
 {
+	struct hdmi *hdmi = container_of(display, struct hdmi, display);
+
+	/*
+	 * Accessing the HDMI registers requires the clocks to be running,
+	 * which is only guaranteed while the block is powered on.
+	 */
+	if (!hdmi->power_on)
+		return;
+
+	msm_disp_snapshot_add_block(disp_state, hdmi->mmio_size,
+				    hdmi->mmio, "hdmi");
 }
 
 static const struct msm_display_funcs msm_hdmi_display_funcs = {
@@ -310,7 +322,7 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 		hdmi->next_bridge = NULL;
 	}
 
-	hdmi->mmio = msm_ioremap(pdev, "core_physical");
+	hdmi->mmio = msm_ioremap_size(pdev, "core_physical", &hdmi->mmio_size);
 	if (IS_ERR(hdmi->mmio)) {
 		ret = PTR_ERR(hdmi->mmio);
 		goto err_put_bridge;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index f24444610fe1..869f55d4704a 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -48,6 +48,7 @@ struct hdmi {
 	unsigned long pixclock;
 
 	void __iomem *mmio;
+	phys_addr_t mmio_size;
 	void __iomem *qfprom_mmio;
 	phys_addr_t mmio_phy_addr;
 

-- 
2.47.3

