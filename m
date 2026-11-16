Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835101;
	b=qb5fetYnRcpuRhNhSsaw2HvOxwTYidPAH+E1FL1TJHxezsM4YXf9OWCEukVRsP0AhJJn
	 k47UbWrlhaXsqLxU3xXkC/RxVfbkGvLBLVXrwF3c8N7JQDsQ2fFWrD1WNPxesAEmdlSy8
	 pjSn1pS0uimnc4/gQidk89GrxVqoHKVp6x70o+YtA3CDRgaUVd2YPqu3EFBEyc1zFSjP9
	 pW/nPY737IsM3hZvC+5ms474vr2JOq448qlv9IaY4ivfBuMKIWtrCu+awOUasCSd0w4KK
	 06uSMCr+cEm7fS3T8wsZSnFrndGN7g9H/WiUUkhULx1Lax/7eXNTvYQjCMvPSw8U1OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835101;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eiucA+wtjzHIfQz9RvwaXxBQzP8Dhf3ByqiqoY+aurM=;
	b=A4zfGWnWKwdvPH1vr84KncB9oKoVykiuOgfVgfkW7j5ttUY19mB2wV1NAM6k4XDFipfD
	 S85zEd1ly4WTiBMxmbCsrEdOX6fzB2pvDudwH0HlFKaqG3RrM8KZIFz8Ii4CMOJb0pAgr
	 aX0861wZuqr/vd0Ldwikwwgu5pVOhj4zzUVvDbZHvygqqIi9GICec9VnvyMhNi+A97F19
	 QxRHHPa3LolNYffyD33eI7e+d6iN0Sw/MqTGf+evVuZKjfLXG5WJaqIdtEacrM6oxIT7O
	 2nBpGDwtPzX+3WkyquRRycIvoXxsPT73Gqz9nD2f8Pm+pf/rDMtG6ZRskr5hfXFgr2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V0tPSJ6P;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XzaKo140;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1615606A331
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1615606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V0tPSJ6P;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XzaKo140
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC0uck1482774
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:18:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eiucA+wtjzHIfQz9RvwaXxBQzP8Dhf3ByqiqoY+aurM=; b=V0tPSJ6PVwrpjHtZ
	Zi3tJ/BSazgFYTmvRqQdk9TSdWokZLmDiLT90OIxED+9p57GGOD3U08rHm/qmUbq
	utNEDf4rSsqp7PuU/t0Z2ichhhuQ2ipjAzQm2ht05MTwZ/tz6S9za4Yi3cCYj7rR
	r6rsEEy7S33hlrbO1axgP235Un0U52/PvBNAQS192Q5iMD47cm4c8n1gFdnN8uAc
	RgKpRgJsGzr88ApI1peasgiYfrdoHK5LLsTB+7A6Lpvopf2/YHMJdQxmberQ9tKW
	uZ5o4INsXMDSszEtSW7tBRTlperwt+Q+uVguZfP1uvIWHu1JXH7HBUJaFEKOAB69
	b+yGIg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyrqgnnr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:18:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2005ce21so632050885a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 05:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794835099; x=1795439899; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eiucA+wtjzHIfQz9RvwaXxBQzP8Dhf3ByqiqoY+aurM=;
        b=XzaKo140ticZp2E/PdGzh0yUQYwZzTMVgBNA/DRkbmgeAipynYUXaVUOvrjjI4RMIN
         Ojj4DpyRCzXxoV1z8+/rUn6ZKfPw7+HRrtvI4+tu+67nUHWoViUX9DBjtl+1YbRHha3h
         deE5OIiADaaCP6NEjOHARcl/aDoWs7eniOhlyqv0W4ljpc7bMRIsDjBwHanC4sMJ+fzt
         dceS6gC7MJp6fF31MD2Tpbudgu2x2larYDcF4wR2rrs1nGuOvr+yVz9jHabu98nFWZgK
         UpIjBCSn6bVEAgEH/kr0JjFLZyPdyKp6ALo14bo2tohhajUYxFUku9HpW6dpKYodGwpl
         +WeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835099; x=1795439899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eiucA+wtjzHIfQz9RvwaXxBQzP8Dhf3ByqiqoY+aurM=;
        b=NIIaAuDVSII/l2I0+POFR20Lw1kW3hVe1QdDZS2UH4dGHoXJoYsN5RDyt/kjlKkfeW
         jhLchGOJQG8YkHX744PpUGXNIFIaCKlxHg20fC7kNUva9eT7fooCzLKDWPxZC59A2dcD
         jnmRP3M6LUZiCQNWdpCaWeffN9QMO98jv39Hw9LxmMdsDt1zCKcmGdzAifSavcIvrYdG
         xydbk6LSkRDhdizW66jmCRMGYWV+TIKqhqEay2e5fd/RTSIEax0hrwhZEbtBWn+88BPw
         xSCzP0J8DDfdxWF3p/LoyTiAcNUKQFe3IS41WIUQnvSpzIfHPfq8Q2584fcUHHmY6/wo
         jAFQ==
X-Forwarded-Encrypted: i=1; AL+hErHq3wSD487p8yciJKS6W56TH9ZItxS+5zs5OJlpi2Zo+7O+7pl0eDjBFlrEtSKX0zpCI9cXCKJUNOMkzsi6@vger.kernel.org
X-Gm-Message-State: APuU4Z8QFgxs55y+z3T1I9dID1P87hMxa0OeA04EdQzC4QdBdRtjIgyn
	6A8ki/ImZ9UB/LNZfBHSBNaM52KIjsKILOpx7poMsWLMZAJaKPLEWY+jmUx0JwkGgaknWL8/z9M
	BEi+2LuH5Lc9f8XBnpQW/+A88zWCd/l+pWeGnxuYDZnbn/lk8gvciru+6v1Xu0puxeu5E
X-Gm-Gg: AYBFou21IhtoxvHeP+8KPWj/i6T8mh+t4o94UVg7SXtUnpZ9luBeXGZ3tikOtO4iG5F
	Z5S6rcpHRgoLOmy4MFe74BxfyvLFjLvhC8rOnX6+D/ao3PY+Jen68nA4A92xW8il50/9DDXdEJf
	e8Kei3mzEF5hKlnGEjAs3H46xaLyFTubitEmpKcRPjA9pXaDgMiysHizTw46LBo35izCM6SksmB
	X3wmz4IDF4bDGA2u+RHUPEGN2gMftAMlOSkvkNFwzZLRYLxAy6EOCPekvaRKS6TRk7ZZu0RqJy4
	Q38Lp7ueaawrw7lu447h6phi0mcnyzOdutib2wpkWoMc6/VhaJCT/bKduAuXGiDOnidUND7rGem
	8+z9aUgK0u8sSQSIV2jZgm61i2eQS00NjVq57/q5nugClVza3FQmahYole8L90ZfpGhLDj+KIfu
	ln
X-Received: by 2002:a05:620a:2709:b0:944:d79:c02 with SMTP id af79cd13be357-9494ba55576mr1456186285a.10.1794835098950;
        Mon, 16 Nov 2026 05:18:18 -0800 (PST)
X-Received: by 2002:a05:620a:2709:b0:944:d79:c02 with SMTP id af79cd13be357-9494ba55576mr1456179385a.10.1794835098475;
        Mon, 16 Nov 2026 05:18:18 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8e1c94sm843927285a.39.2026.11.16.05.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:18:18 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 18:46:46 +0530
Subject: [PATCH v3 07/11] drm/msm: mdss: Add support for MDSS on Nord
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
Message-Id: <20261116-nord-drv-dt-v3-7-e3d3bf0e2c49@oss.qualcomm.com>
References: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
In-Reply-To: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794835013; l=978;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=cUv9ygkqVGKsKi0AqbVOUesQJiSTwCdwgeTcXPt+zc0=;
 b=feVgYY8v1OmtMYZhR56xObEddH4ZfXk+7alnHhbbpkFAvGzUXeze73NFNgFXi7LWeLUnEunZb
 K9td4X7BvYFCOuLLmWeFhM3EL6B86ftpqGoAb+5luNQDk3Pj6p2k7jJ
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=VcJir1p9 c=1 sm=1 tr=0 ts=6afb029c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ikCT10dxFQO67KJDykEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: NbozaXNFA84XE4kbixNalf1xk0YiXRje
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfX/5OhVPu2fjdr
 iuUTYLinq5PvsO6NVIwAQibUl4I94wiYG5pQkRPp+pduVYMPappVo96sHZsZU6KXlT3zfOm0+wb
 osH0AgAsvUqVNYvltG2Dvu7TsbDoe7hDI1DhE0UVbQ5zZTwuTrI674AwkOWIAoJSFKWFsaDCNoD
 N1+bZBiHlr0blSvMTdjMlpIalmrNpVSr2CUJe9anNky4qyEdxq47Tn/OWsOcjrH5RuDuZY3Yu/s
 a2dfh9TPF/ai4pzPeUSgNffqU9bL7gTLzKifWfKXOSANXFSqcWEKiUOGEn9EGSrllEbVlmfb4lZ
 9h4Rs/zylfTjZrMvCzrSoIWSBfziByYtOowZzZGH5xXMmkFDN9tpsoNxHyOXRyNOWNX96lg3sqb
 qVlRYJmFkMOo1CVp4ffD3UfoMbj0ZmLm6J5580kUdRD1wo4I9MAmQBc6O9ICe4CBZz+wsXLCpqu
 6eA7hsqBrhH7LOTl6Kw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfX0baRmRrWj7Wb
 dLwNWpFo59OusbY7Nyle8RZnBYG2fBI7bGX1yjvgx4/BN04GRkPMeHrlgMAYDXHhNfQRamriRFI
 7deZzqHZTRK3M6ElCJsaTDXis8HBGZs=
X-Proofpoint-GUID: NbozaXNFA84XE4kbixNalf1xk0YiXRje
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160052

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Add Mobile Display Subsystem (MDSS) support for the Nord
platform.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 9087c4b290db..90bcc8c28dc2 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -531,6 +531,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,kaanapali-mdss", .data = &data_57k },
 	{ .compatible = "qcom,milos-mdss", .data = &data_14k },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,nord-mdss", .data = &data_57k },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcs8300-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sa8775p-mdss", .data = &data_74k },

-- 
2.34.1

