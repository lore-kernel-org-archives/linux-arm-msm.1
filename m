Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2FF3A6B66
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 07:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851472; cv=none; b=qVi05BgLHEfNF6z3hPk/HSof4Az2ExfPRNudBlq8+ef6ATqFW9rM/seTklSJrdcNHQPHNsoUuUZh7h55Da1gArRcR/BIuXNMzrHJE+PRevU/MuMfnhgO4clP6VZVeRCPBGZHDT7SDa11fhWpYvXTm861a28gAKirMNiH1IPmL/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851472; c=relaxed/simple;
	bh=Wpzp/cK3JYV/8SlC8t8vd470HwV9IihYSTjTRLAsIu0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lJsXlY+wIXE6yNwnvFRFvon7pgytoU7DGopfschUDSY+JNc9met2TjzqcnysqdgEUG0WmaiPSxzqB2lCOPL3L8/WsXlBhhaO6bIHeqORDkrmpzQ5Ldb5ZP8C5+8PXS2ytu4P5mtV5JsYwpPciyWM1MX8IxlIiyyMIhEADMS/UEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WGcKJ0ca; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ii3JAsts; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WGcKJ0ca";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ii3JAsts"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LiCW3299264
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 07:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5f4iUpOb3yH3JsFpfvQ0KdsnnuKnbeOttiwhu6PZwtc=; b=WGcKJ0caoM3MNYsI
	kTAtfJAYbYZ7Eywwr4p9/VhHn1ihucM02V/Q1eKF7bxhvo7wVjWFP4Y/5ZkNGcWv
	8U9UhRXBx/XeDfDp147sptkMKZG3rOQufbQLDyj6rRlwG5y/i7QOUYN5ImD+qJzp
	eOLJdf0amU8mKWoB4wCmXH8exhs6+soAY7PaaoQXt3oScaEPmPDqHC6+vY5SA3oE
	wkHMRze+q/VquDCRIQ+Fa2e6Wbq3bvz4eKplzRBa6IGcm9j4OeuPs3/y88rO2wEm
	iHxYf3zkq+AMlBHMobx/U7nzlUnE9S5J+1Us991otwt+6XPh37GB9ewLmlHnSYAB
	o/kCsQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjb0p8mwu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 07:11:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939a6937513so227980485a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 00:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788851468; x=1789456268; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5f4iUpOb3yH3JsFpfvQ0KdsnnuKnbeOttiwhu6PZwtc=;
        b=Ii3JAstsp6qUZglM6MRK0z0pIBk+idLRQlmEDux9hGo/gdyR/aA7YHx1POcbUqnikY
         +kHBg43ixHigCM+7ooiRxiFnAW9z8cDGq/9bajkcV7i6D/nnCZ6tTqpvCil3zhskb4+1
         deos4t5k22U+gFBrjzNFhgGLWgErBshFXhKKMnGONoAlyRpC5vYd2q7uTVhSZLDyGR6/
         oKuNfDiR6RAk1qBM5Ozyawf2BhAgRHS/SvJkQzjAGZsvTdrc3RRFhZBM1z/8SCrlb2ih
         2UI7SPbmlnDa7K4GWuS1LasuHcIOWC2KVjKme6Cf9x77zSFCUXbLWwEZTm838vDo32tf
         z8vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788851468; x=1789456268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5f4iUpOb3yH3JsFpfvQ0KdsnnuKnbeOttiwhu6PZwtc=;
        b=SiH9FaQOpP6khOkfHgnpL5VW2TArVFUDERKoy8v5Z6PQBk8KJJTssdTTCpm9Kc1cbg
         uzaOPUforB4Z6jUFrkV/dF5uiGkEYyPCCw2GLxHSEaLuUdnDnykBVEMCGgyi4rNlLppl
         IGaPKV4GurR3vNg7jfnqZ+H+3asDF4sKDdxAuPvgagEM+IsOYwiDjleTRHyRUHqUR/Q1
         Lk3QSomhY++nwXCpaP3lVDRS4mFg/ytBJ68KeSnTUiv6Rb3yyYtUIhsTzZM1ieDM2AXc
         M+Ii3gbKl0ZDLFRFjtUrONuDCyQI0uPOLzQrq/tslsTwz4iCxkk8KLu3dQyazYCb7Up0
         e3Eg==
X-Gm-Message-State: AFuF++n7Biko44e+0PMMMFwv2Fug5DBViHlaB8MssUUHaDSEKDsTZlhd
	JoJK5m+Zj2m5srHa1IPoUVuv0cQtn0R+7OK5z8VVhxgn1prsPcx/M700bVRCKUoVung7osb4gDa
	aUquUzUR6UvNEG8xol/AugCxIjza95s6MSOVqR1KFWcbMxnMcBHbLPD23QWrekRG5c+do
X-Gm-Gg: AYBFou1NxkN5wZavQpVRlMWKfvLcUPRzqEv2egMAUtaN1SIdxgGTT3aB9YoWUkPwK0M
	MTPBn41DJ0vSmG56DJDFznLvzqZ9oeOYD+CLtWR4HAgLGI3UXC6d+yUXmZqYPROxic633ycGk+B
	Iq8yCXJD1vwyd/fdYBYJO02hk83a1jHGfakS7v9wZnpfwzem3nVOmXH4teVxzo69Gw/AV2YloBD
	1Rf8lFGjfASUE9iYLA+zYyUkkKjcOQEGjXxtbP7gQ6QNkfC1yB24qzrYCnXcvdfGGj5aaJikLkm
	wyTlixPjgH+/yd7+AKRKbg6yNXcfX3NPt3cAGJBIrGSnURTsfUh0BMw5Cr3INYKZbsZNnV7j7dp
	vR07gWt0cSD0VL8imFg5ACOY=
X-Received: by 2002:a05:620a:6413:b0:939:5cd5:e243 with SMTP id af79cd13be357-93980324c12mr3025895585a.6.1788851468442;
        Tue, 08 Sep 2026 00:11:08 -0700 (PDT)
X-Received: by 2002:a05:620a:6413:b0:939:5cd5:e243 with SMTP id af79cd13be357-93980324c12mr3025888785a.6.1788851467992;
        Tue, 08 Sep 2026 00:11:07 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5927b68sm453173805e9.1.2026.09.08.00.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:11:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 09:10:45 +0200
Subject: [PATCH v3 5/7] drm/msm: Properly handle msm_ioremap() without name
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-5-dcf8956878ca@oss.qualcomm.com>
References: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-0-dcf8956878ca@oss.qualcomm.com>
In-Reply-To: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-0-dcf8956878ca@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1351;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Wpzp/cK3JYV/8SlC8t8vd470HwV9IihYSTjTRLAsIu0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqn7T7GoYekeeNs936mhSqK6BTQzcjxgH/n/DP4
 3PSvBcLAmKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCap+0+wAKCRDBN2bmhouD
 1y4FD/92yv8+hHdjHnG5SA81WkyDML6FYcE9zaxhdIMgyRMN20VVvPLGmh5cuUShIvlbKsq0TzI
 T/b6Rel4LYsz/QtZJB9DcGki+3k1DHDpmiEbqtINZk3dNhqdABLTPi2rCHYg5zkIxsMrkqRcNjo
 vTWdv/fEFpNC7n9dJ75Y1AJiaktcoC+M1Rup9bmEREZvW1tZr/KlCy++WCr8Jtsoz6sYpZz5kYE
 lAUaHlfFX4wc62YvBCalhyctCQMw2PD9Jb/wo9AMLkGNrb/lnj1OzNP3q77oKAuYOflY+G+neZ2
 UqNObT2Is4xuc2WVqtqSMaLRnKtAGEeNMDWj2H5EvJw3U2Wx4WZ9OX372zgSTBnAcy67PS9ybH9
 rRDzT4QnCDLkVjo/5wJkIOw/TILMPymDK/VBd9ZJH77AZxWckUmAWO7zASl2neMk78F3rHZOaYW
 kyuQMR17A8mrJqbYxD+ZUKNKKIfiee+HcBabo94KkSu77Ul8XX2E+rotqFI4dKU0DPwqQNmW1qo
 nGly+iA47fok9w04upya8/OmXgpgyObpaTLxUTJAyqYQnAyGfwx5A8OO4lqHHs39Xfdh+TOJ5H/
 40Yp6xcWuRpphG6oucHjBPUpQPZgBnzWAtr/VhhrpSLMNS85SwRBjVEhcVhbKUJ77L8XusVizD5
 dMPXziW8Ml1jDsQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: yD1vyDO-k8iCwnx5VATIf2In1GYh0DjI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3MiBTYWx0ZWRfX/3JoMeeLmrjP
 /MGGHo3t70CkrZcvnFW/DPmxJZtDAZzePBG938GboY54sOnBajM9ZT4+y8NWmYipsqtHRx1R9Vk
 hSf0JAaYiTeq33EgR4yICyLTMp1tZvA=
X-Authority-Analysis: v=2.4 cv=HL3z0Itv c=1 sm=1 tr=0 ts=6a9fb50d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=or9nyMeYumr6D7LEzWYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: yD1vyDO-k8iCwnx5VATIf2In1GYh0DjI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3MiBTYWx0ZWRfX9+f6dtMdkOC5
 vaw2MBGndVa8TmqymaYluVncnvcGW+BA0Bq7ZBTdhdt3ZuzVygt3jI2J8gwh2fJh6fip+5BirJq
 imthpktihDVOHU0Gu8YH0WGCc4ovFs8va0P2V+fSaiSvsRSGIkMa7YW3ZRyhGYZEV7hkptNc7xi
 Ocw9uQECO7mf6252k9mub4d6vzcB9LqvfPa5OVzfwRlRKoFIlL/0/65bPZQ+IX5yMWrp/goXy47
 RvR2VIlDa3rMhijVICVwn+L9z2zxJw8CBwQNo+7JXSht76V1iE3HcCN0hKO4TbrLKKg7Bf56XAR
 iZeK4LOOAJRXW3BdgP4DvSn6EENqZp6iD8ufQoPkkbx8w9kGN/mbbLivL51aICvQECTC3uBIDAv
 4SQnHqvkd5U3XAhswdSF9eYX5IitK27tUo8Skz9MbSBLIK2dPdTmHdr0m2mngZHUyQWSnRMYncX
 V/dwC3MVbw/15VRQXug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080072

msm_ioremap() accepts being called without name of the region to map and
in such case maps by index 0.  However error paths still use the name in
error message.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_io_utils.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
index a6efe1eac271..0a4ac0fc5fb5 100644
--- a/drivers/gpu/drm/msm/msm_io_utils.c
+++ b/drivers/gpu/drm/msm/msm_io_utils.c
@@ -77,7 +77,8 @@ static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name
 
 	if (!res) {
 		if (!quiet)
-			DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n", name);
+			DRM_DEV_ERROR(&pdev->dev, "failed to get memory resource: %s\n",
+				      (name ? name : "#0"));
 		return ERR_PTR(-EINVAL);
 	}
 
@@ -86,7 +87,8 @@ static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name
 	ptr = devm_ioremap(&pdev->dev, res->start, size);
 	if (!ptr) {
 		if (!quiet)
-			DRM_DEV_ERROR(&pdev->dev, "failed to ioremap: %s\n", name);
+			DRM_DEV_ERROR(&pdev->dev, "failed to ioremap: %s\n",
+				      (name ?: "#0"));
 		return ERR_PTR(-ENOMEM);
 	}
 

-- 
2.53.0

