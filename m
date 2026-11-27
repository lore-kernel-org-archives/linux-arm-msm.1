Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795808711;
	b=TC1Afp8huU6AVzY6lnAbsXP034s+aI3NVGMC1yM9xfjjmfZFIN5iwdupQtPe7oQssNNM
	 Y7DaFOufadPF1lBVdkDETbbgXMFQWIf6INtXdOyvwK3B/BVmisaCcABUgKswD65/4Ogcw
	 giJdSIhbiyZQExEje86A2IDt2ae+9jhNK9bYQPNfPQ8QzI0jKcTknyiBKnXBH55JHy2Be
	 S3hkiE6x/y4bI5tIH3QoUhH4/aHvN87i4rN1+aDWE92NFKkGd9BJgCkUkinCeN5tT0QQ+
	 ScUNrM2tjiDqJgbmCem0c6bpKOFKSg9GCZ4gclt1fMLwXogwQmTQG58V/AkCcZcsxBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795808711;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hi2RgCzxsniZkcpizYBKzBTqqeH5jvUpama9Qmo6TGQ=;
	b=TUol+J4Juele9l9byJIB9xBp5PcRwCo/sJm5aI9x9MD4Oa80laQ9f53AK2oz2hgbSQ8D
	 jlHhPiwxY2OzpkssimrBG3McVBCQWc9L+//DKtuz9ELGrg6NdoNJePQHCzO7oVTBNdHPu
	 0ilDMqbCjO+FTrmLscMBTc+vtjtX+8W70APIiMUs+Tgt77NbLNfu3IijTygM0PNSBW5nP
	 LUtZeoVhvbxH2WGx2cyBhwA+eGV5XedikfrSrcdjkchN5a3N+gPpLyAMrFX/gTXNhvNnK
	 hGazynk41NYfqQgA9YiWuexHwUSmHZWxJPBLZWeVvdgH5PxiXWEleEVtKCbkPtSsPjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=duV2URsl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V9hcgY7J;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C542D606A687
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C542D606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=duV2URsl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V9hcgY7J
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJB2Em3752853
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:45:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hi2RgCzxsniZkcpizYBKzBTqqeH5jvUpama9Qmo6TGQ=; b=duV2URslxQonYqnN
	90AHfyEuqeukXJcKdOegFzUbAv298WpYy8WXqN6MLc60Z9iCQBJwegXRVyZnqZxh
	6lO7eFBvWqBawflDt4TeseIN8eLX4URm93LZEWieyHdo1wQWDGCbVwOuo9djqplM
	WQ5YUEErnUy1spneq0yuto3Lw8A7u9x5cG9WghPJgwlwrA9qsZQKvNXwdhUk16UL
	9JXxYxKk/NAM1lpkIVzvTmIdRiblhJTsGxNgw2jkU3FWazh2edpxHH38p+tR3tEV
	qh7M+gEMAAjFGquIpNDQ57y4eKsmHeSEujaz4BqUiPKallrbUDpnp1KUNGNcDqfP
	C/k5eA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74ghapn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:45:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844e383so1225830585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795808709; x=1796413509; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hi2RgCzxsniZkcpizYBKzBTqqeH5jvUpama9Qmo6TGQ=;
        b=V9hcgY7JFx6leALyF+Ls5XwJt0YzGoigrJmyGHvn9WZ0h/zaBLOVUZwzYldapQIiW+
         yv4BzmDi97ViXEHMFS165rngUwJeaEODl66c9WtswyFQmZy2fqe7UQqVXdY5RCX78csy
         TxXBXYLCokgkQ0Fohg+i+XT9fTXRlBV1VszlYPPdrmb4X83sWvhvDbJTmA1NOyILaAto
         elgjc7yNwHunYhCbR7S57qwxKWI0zQ1mvJm12v/9skVspUufOGtEvSPp6fHYwwzXPt0X
         XqtbbcZQEtxK76VQCivkdpTEk8Zo2oFWoHiXhSqgWtH3BZdpDtnsX0293UsQ8hbiebq/
         WzZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795808709; x=1796413509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hi2RgCzxsniZkcpizYBKzBTqqeH5jvUpama9Qmo6TGQ=;
        b=B4a24ULJV6kBn+B5UQk3nuyHZEW1qbU8jGKhau8fqXwH+ZtDVGvHQndtYgwblxQSKK
         DhLT+tuJCYq/Um8fvSvcu5ASlggacE3Wp7JMrsiQLh5MnuMTM3ApSADYfTq8Ps6RCrnJ
         yI41L9UEweehgodCfL3xpUQ3wCV4/kNo1DZk+V+RDG4+fZHAJi5bm34lxDbHYum2uhDF
         i92U1KSKzRzH6JYEB+r8+O5hE9N9jxetrmTN1bPSijTYs39NQsJIYgvNh6v/IBsQxLsC
         ZopiO4RVAIgDEJu5Gu7JKo5TJ/lH6SaHzLFdHIrUmQsAhoLy0RZWnvDpRbVvPg4Ebhof
         ZDuQ==
X-Gm-Message-State: APuU4Z9zcCxKAWRAaGEOKyNaSPxKjSLs9lXgHacoYGqg+3i4/AvjXLAb
	Rl75DuJEJRwcQaOvsA8H7g2y7iU+o7P0S65r/de4F20j75p04Co1MNlIaNcNndxtOgDgQGfHMJA
	u4WgP+CqsKS7KzLu3tTyKe64HzT+i+/QrqrmwCQn3p2WmdyLvpVq61d6YooiDc//jbSMJ
X-Gm-Gg: AZFdTZdcDwc5cwdKMCX9LWxLD3voSdt3SxQwwaMtQQrJiRtI3oUW11arpXKu3Eib2sP
	EjwjGhc58ZFKKiAs/kB2HjpXMdch9ExMrXpw1S3LDS0AWsh4Uwfm0RISSFyYpCVCJTnSmA86Y6D
	G9yRnBw75c5LtLu2TzVKkFeg4FQABxZTBGpcMH7TzlBVIisRX6j9oRyYzol66lBa7Z2eAJ64JYg
	SgDGotMPU6NCW296g7sCt9RN4OWNfg1viJk97h8319AFVKI3MQLRdUXBuX9pCp2YVA8LrvC436y
	IsLha7kE9czMDX62mpIzTLhRxUPjglmd+DG82LECDY10tOCNei4+pLaRdvwXGxM6WGHvBHAPZla
	mdlNQMffLbuUwhP99Vqe4VLN8SmTKFqPd4SuQYwDj/KqWS92RSH9/jSTNG+Dw2jgTFt+y9kL+cL
	5AdNNo1Zdaojk2CMAGa4y3ukt7Abqc+8082Y0dAOeaHl9DO68JKlkpnMwcWqBG0g==
X-Received: by 2002:a05:620a:5394:10b0:949:bda2:194d with SMTP id af79cd13be357-949bda21c95mr3243191785a.83.1795808709044;
        Fri, 27 Nov 2026 11:45:09 -0800 (PST)
X-Received: by 2002:a05:620a:5394:10b0:949:bda2:194d with SMTP id af79cd13be357-949bda21c95mr3243187585a.83.1795808708535;
        Fri, 27 Nov 2026 11:45:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805575b5sm59655571fa.34.2026.11.27.11.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:45:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 21:44:23 +0200
Subject: [PATCH v4 10/14] drm/msm: tear down only a successfully
 initialised KMS
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
Message-Id: <20261127-msm-kms-destroy-fixes-v4-10-242b0a3f8e47@oss.qualcomm.com>
References: <20261127-msm-kms-destroy-fixes-v4-0-242b0a3f8e47@oss.qualcomm.com>
In-Reply-To: <20261127-msm-kms-destroy-fixes-v4-0-242b0a3f8e47@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4504;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=v7Mlp0RWyEHoJHxf2OONOylgsUewN5Mb0W8CnMnixnE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBrCd2mkBra9+DbLS1cq/6zB6w6gPspz7g9Yw5Od
 9ZA497Hp12JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCawndpgAKCRCLPIo+Aiko
 1U6WB/0YngWOTcYQOCIvcyFPXNqfa9S73l1L1PGsWaAGoADnOfA9OtJZ2oBnpRJre8A8AY7pIW0
 btpxh5lXs58eIttKIA/4wVaoVdZjA676k86qto2NxMRlny+P44GLs9UnIi2wa6C80mkG7BviJy3
 PUYgSYhHGfpZ9L3GgMWS12JZR9d3hHjM0Nk0AYoXz/BOh3uIYfAyEYBYPTzGc0Cex0QJuUdCJju
 TxPUg118fUz1Vb4CIKYfAWHXRoiN6Sfa7R70OQFrXOKeyU1szC6EYCW/MDrKTnOnTx/K8UbE/m7
 87iGJXiwFwoBcjQGnfcGj6H2rcZwSOlqrkaT495ChKBaBBrm
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfXygwK+AFdnI5W
 0tT4MRRBL5aQIxAio/nLBmbUPIIPSt/5MjEwDsqjEediWOQDRVruYw+6MorEYwDuS1oyPfhtDik
 hiSSIEWAIBqbU061BLimJ9e71e0VvYU=
X-Proofpoint-GUID: w1LGyHqQMRmbkMFIYiN99MOzpdyAJ5Zx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfX5i0kjqWx5Aiw
 iNyJXw6NQOQTifo8gYmknzaLRPFfu/RRwN9v2KFiJJZUH5jDHOY5gl9u7PELrIK3ni8rr+egdGN
 KgBF4RL2T/akCH8plKDCiAw8+ykW9SwCqYXrS2Y9qoON3F35Qem0pskH69YgQHiKHHQnenlRrtC
 tfd84ROwPt4dR5MJMpkgK5LgJUcUjgfqsp8Yh15qL7zeLca3oYw75kmfl7wOTK4zZkRwZ51EVvA
 cnVoi4yVieTun16C1XwLPg4RmaezgAP2F34uWUcLYFOtwtoLY3yqCugQh/t9pSMX9B/IPfo74A8
 VTF2x4ZIh+TMbSmkWzUSAOCLvPO3YAXIn3R9w5hT+Pmp9CA5gaTiC8ewd609Vp+7MZmnnfrDZ1P
 uqLjSSpCfBTEOx0Or0rYKFMN6myp9HdQ3BcFEdfVUv6XDX4JwaQYnPMa6vqgRXuseKJj7NiNJXS
 bzUPtrP4NqAeHjN03yg==
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b09ddc5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=kQpT_P1mV4N9NWRngdgA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: w1LGyHqQMRmbkMFIYiN99MOzpdyAJ5Zx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270078

All the kms drivers now undo their own failures in kms_init() and have
folded their hardware setup into it.

Drop ->hw_init(), call ->destroy() only for a KMS which was initialised
successfully, and remove the flag which let the drivers opt in to that
one at a time, as well as the handling of a half torn down KMS in
msm_kms_destroy().

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  2 --
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  2 --
 drivers/gpu/drm/msm/msm_kms.c            | 16 ++--------------
 drivers/gpu/drm/msm/msm_kms.h            | 10 ++--------
 5 files changed, 4 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 255beb83fc94..65ba8fa697e9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1290,8 +1290,6 @@ static int dpu_kms_init(struct drm_device *ddev)
 	int ret = 0;
 	unsigned long max_freq = ULONG_MAX;
 
-	dpu_kms->base.init_unwinds = true;
-
 	opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
 	if (!IS_ERR(opp))
 		dev_pm_opp_put(opp);
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index c2172e5f9e85..c1f61ecf800f 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -409,7 +409,6 @@ static int mdp4_kms_init(struct drm_device *dev)
 	/* TODO: Chips that aren't apq8064 have a 200 Mhz max_clk */
 	max_clk = 266667000;
 
-	kms->init_unwinds = true;
 	mdp4_kms->dev = dev;
 
 	ret = mdp_kms_init(&mdp4_kms->base, &kms_funcs);
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 30af8ef51e4c..c349eedd55a6 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -505,8 +505,6 @@ static int mdp5_kms_init(struct drm_device *dev)
 	struct drm_gpuvm *vm;
 	int i, ret;
 
-	kms->init_unwinds = true;
-
 	ret = mdp5_init(to_platform_device(dev->dev), dev);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index da9ba8583420..838bcb2c9e19 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -293,17 +293,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	ret = priv->kms_init(ddev);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "failed to load kms\n");
-		if (kms->init_unwinds)
-			goto err_destroy_snapshot;
-		goto err_destroy_kms;
-	}
-
-	if (kms->funcs->hw_init) {
-		ret = kms->funcs->hw_init(kms);
-		if (ret) {
-			DRM_DEV_ERROR(dev, "kms hw init failed: %d\n", ret);
-			goto err_destroy_kms;
-		}
+		goto err_destroy_snapshot;
 	}
 
 	drm_helper_move_panel_connectors_to_head(ddev);
@@ -347,10 +337,8 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 
 err_destroy_event_threads:
 	msm_drm_kms_destroy_event_threads(kms);
-err_destroy_kms:
 	msm_disp_snapshot_destroy(ddev);
-	if (kms->funcs)
-		kms->funcs->destroy(kms);
+	kms->funcs->destroy(kms);
 
 	return ret;
 
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 2f097e23e2e9..b5e1cd38cd8a 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -23,8 +23,6 @@
  * for constructing the appropriate planes/crtcs/encoders/connectors.
  */
 struct msm_kms_funcs {
-	/* hw initialization: */
-	int (*hw_init)(struct msm_kms *kms);
 	/* irq handling: */
 	void (*irq_preinstall)(struct msm_kms *kms);
 	int (*irq_postinstall)(struct msm_kms *kms);
@@ -149,9 +147,6 @@ struct msm_kms {
 	int irq;
 	bool irq_requested;
 
-	/* set by the kms drivers whose kms_init() undoes its own failures */
-	bool init_unwinds;
-
 	/* rate limit the snapshot capture to once per attach */
 	atomic_t fault_snapshot_capture;
 
@@ -214,9 +209,8 @@ static inline void msm_kms_destroy(struct msm_kms *kms)
 	for (i = 0; i < ARRAY_SIZE(kms->pending_timers); i++)
 		msm_atomic_destroy_pending_timer(&kms->pending_timers[i]);
 
-	/* the kms drivers' ->destroy() also runs after a failed init */
-	if (kms->wq)
-		destroy_workqueue(kms->wq);
+	destroy_workqueue(kms->wq);
+	kms->wq = NULL;
 }
 
 #define for_each_crtc_mask(dev, crtc, crtc_mask) \

-- 
2.47.3

