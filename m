Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795478664;
	b=0l8erEtfXPkKmzXc+j/agdymhXEC7svYCrdFZyYQLZh9kEOvXUHMPMcD/RL7Mbl0c/cF
	 KkQlUn2GB+ikaYi4Ml3XzNG/JVdaIexeSmAdnNf0YiFTr/j41N1yJ+05tt+1Jg7h/o/oH
	 vS8f5gPjtuPlUQ6ZHtT+VVwfGQqJv0bW2D59DC80JmDDKMqsPP3xnRHB1158L8t5uRuAE
	 v2ycZJXJHjCkq5o0Cb9wkoGLbMvtWKw5odySVUZip2GvtQaAQAI60EBQ6HAB0YEv+iOia
	 kJ3mfu76C06joP6AwubuD+45hgYvHAdXDYBcSXvPjGbc+UiRvyKxwjgnY4YhWXrC2Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795478664;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tkSEjYs0iAZII4zNsyDNS7uDKaKgENnoiGQDdLvw080=;
	b=puObbhrzs1e8GWh3JETgiOkHJLS867lJ4JXqfHALH9O80QQ9DKRT/hzvHUWVBTW0AniS
	 F+iFiCKQI0IsepNq/oFFOreJNfzvnSVRcZVLEQ3KPnKGG0UO4MnEefYe/Gh0JiMUWujQ+
	 KteGjKDZODK3KlMzM+K/uOpYVUR+f1AJDCL/+0rezj3vT2jTun1oHEtwMdmjvl2hDklq2
	 85S45Ua90u8heMkPfCZCefvQP/fbAt285meVUxrFcWpHY0f6UgynN+oafwzQa4a2Za/51
	 gQSXcGXqPHiNH69BcgSguxrsrhWfyK0rEcWoR8piuuBFihlOqMwKl/yHSN0Nz7Ihzog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=avSY7g7K;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pom5NQ1D;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9397A606A6A4
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 00:04:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9397A606A6A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=avSY7g7K;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pom5NQ1D
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuqFe2862102
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 00:04:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tkSEjYs0iAZ
	II4zNsyDNS7uDKaKgENnoiGQDdLvw080=; b=avSY7g7K+veGUjaoH+V+9C6Dj9q
	/3J37fz3iFIuXjNgbV+odze9uz5j6gvfLI/pXYl1+xn6I/SjUNGdx7jfbrmDEx5D
	ppoz9gXGDMr8/MFAEUQ5m+jkZTsd6PFRtPlrOgel/MnN866r8L+4QlBwlvdODSXx
	x7B/tzE2NjyHDpiIglB7ZDfLTXOwWqOD2KK9S+Pip8sZiHCcWzo33y9DRIhwv6QG
	akhEF2BmRga6co4uRbY7XSF60UPDuAWu7YCQiY++gx/PMgN/A3eexBggQ6n4rXBo
	tuyMFrEeBE8nyX7pggQzpyAFTcrUY3eaVsfD3RX5w3wjWRDrjbbDfM9zSqw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4m7utyj9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 00:04:22 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386a0f79047so3651146eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 16:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795478662; x=1796083462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tkSEjYs0iAZII4zNsyDNS7uDKaKgENnoiGQDdLvw080=;
        b=Pom5NQ1DlQM9WTClFG7Bx9gJcAQm5uhmSz6OLxzWKDH8eVyZbrLSEjbI5rcEbNSNu8
         BVNIkXlpnedJdZtHIj7Dk+4P4bnwvP/t/u8fi5MwvZe5QMRYdu91fn+84C8TCGDr2WAC
         bIjn1cDYFpr++GdaAh1DeFz/Xm94l6Cs4iVcxLCXv0CHVFWw22h3sWwrVEWpgRlfu008
         1PQyL9h34Ut9uqurypf1SDjQ8kOaGpu9Fp2YGzz6b2nKYckLgfjuqVpVXnBc+78Y75No
         FKPrXuYBirvjV4JE6wr+neGJXAc84Qmvdg+hVCui2by8NAdVioD7Xx2Xy9dGE7Nl4O/l
         heYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795478662; x=1796083462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tkSEjYs0iAZII4zNsyDNS7uDKaKgENnoiGQDdLvw080=;
        b=ey1OayT5NrrpJYKwShM5Wd8hA4jCuz9yu52h50yhFLr1oB5a3MBSdsYLF2243UyZGu
         loLV+K2BSigUEQfIQDM6K74ZHbEdwpIeizh24EjguFcNJplDOS4beejHFMdC0Jo7fJ/5
         UQ+ujz9PJrN47nMTL4CoJawXoswgDvZUUpfYOV/zTnoVzRbQ2jF90vgzIsoUWgRr6nSR
         27nf6GHOxMQxi/3KpfC0s9gtXjaottQbnEAa/4KVVAthGNFK7FOc3JqtAulIIQRHyb6h
         xCCRS/G/v8jDa8K5PK7XCVBOMJCzjuTFiFCx9uozJBqe6jlFNTEoHsVPqQNflHGmGtZj
         4UTQ==
X-Forwarded-Encrypted: i=1; AL+hErGP8ohxVXI1TVyuGi852jTPLw62SL/dVlRTPk0guwfiofCJEWA3Uzz/8ogAdfL+x9DstdR2EYAuLBGev0tF@vger.kernel.org
X-Gm-Message-State: APuU4Z/qOpAMtXsaXAMNCE7aM0sVyNjFuVGGV3GZTO+N6wAkCGnXRH3h
	QgPTd4TtGlaslmAZpO4zb4MIOgccR1KIHQCWz9OULnLuHAQlmA2KNANrptnQKo8R/1JedXU69KK
	/6gWOqwmhU5xUl8Y6sFPDuA0h7UBc7H6j7DGOw89/8my5G5ubaerzO9WuABtGuaE8wqYcr9UuNJ
	ju
X-Gm-Gg: AZFdTZdzWDfRNHTUDlH/vOxzOT8239rsUmSPWkSDOzzX2kRJnrIMYHAAuVRr9U8hjzn
	CtrWEEBg3nbqOIAcCefI8ogqXQSz6aK65aIGVWkEJ80xq60FA8bhqDy2HVWuIyW6Pwa1f+V+0Co
	BqbwDWwTX1DeUxfMjNDgKLDPvgyrw4sMSqfDQwPMPiBCQHIcoE9KZS8KlLzqv6MZsudM0ubOFN6
	krfgRAuwG0EQDj2io/Wr7dEC3EmeezEAEBCAQrpWla5cLQJgH7/X031NWxvVdeNY0I3lRo/3L2M
	rQ5RnLTJ3rbBir+UUxZ3PXguUFb2NCjPV2NNgiHJItQW04w/ZP0uvwNpCILGBnFUrGydykYceTD
	dlv9epfGAZBMQBDQmmJPJ3mrT68eVQkse5EbovR9xopbV8a/Fc64LX7wTnMU4hdo78Fw5DTc8FX
	9RLezeMR0nt0Ke4VO89/3kxsczJ4QBqF4bfqM=
X-Received: by 2002:a05:7300:8816:b0:385:5b47:8aad with SMTP id 5a478bee46e88-38570451daemr14414828eec.19.1795478661467;
        Mon, 23 Nov 2026 16:04:21 -0800 (PST)
X-Received: by 2002:a05:7300:8816:b0:385:5b47:8aad with SMTP id 5a478bee46e88-38570451daemr14414791eec.19.1795478661002;
        Mon, 23 Nov 2026 16:04:21 -0800 (PST)
Received: from hu-scheluve-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm41662125eec.6.2026.11.23.16.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:04:20 -0800 (PST)
From: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
To: j.raczynski@samsung.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, cs0617.lee@samsung.com,
        k.domagalski@samsung.com, k.tegowski@samsung.com,
        abhishek.chauhan@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
        sarosh.hasan@oss.qualcomm.com, hongmei.xu@oss.qualcomm.com,
        sagar.cheluvegowda@oss.qualcomm.com
Subject: [PATCH net-next v2 3/3] include/stmmac: Increase max DMA/MTL channel count from 8 to 16
Date: Mon, 23 Nov 2026 16:04:15 -0800
Message-Id: <20261124000415.4067701-4-sagar.cheluvegowda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124000415.4067701-1-sagar.cheluvegowda@oss.qualcomm.com>
References: <20261124000415.4067701-1-sagar.cheluvegowda@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6zL7TOE6hrXoMXmKppda3STp9w7MOBNy
X-Authority-Analysis: v=2.4 cv=KurYSmWN c=1 sm=1 tr=0 ts=6b04d486 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=hD80L64hAAAA:8
 a=EUspDBNiAAAA:8 a=H7QzycyVpUVBSTYqnZAA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: 6zL7TOE6hrXoMXmKppda3STp9w7MOBNy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA5NSBTYWx0ZWRfXy03uUgcw1B8F
 s+o/unBsTCzKfwf/UmgHULvbh0Rcj7NVTdgVPDE2p3L85RQnES2EZSoW6fTJ5nx0kzJkWxHRH93
 5/5POKVlUsKwfotAcn1EJyN9uplCUAo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA5NSBTYWx0ZWRfX7v6PfDPdQe9A
 iy8BkIB8GZse8qU0TfhYOIABS4cr+jakVSpmeDWh5zC1YBYlEzmae+560bX2ZHXvcnTkQkPRH2M
 Lhc7M2nNAYDz4SbfJB3oauY15FeEV8gBHh4JP1fbfO+Z7adhBLvAsn7LLC48/vlk0N9O5EIN5et
 h6IGU8ElW3HQTArDZVEFNIyGIgB9FD2q7RkjqVUf8p3rP1YdxDhqxYBVId+1IyQfNlD9p7oOtJl
 qactDwTHkY7u2lPQuqmkKuZqSlGWX+yNfla1G3zaOsu+BJ8CKYX5qrxwjbKorVR+H75Zxw2lxvN
 +YTlaf4lP+Rt2oxnR7cymFM+DT7f4NQCEtS5Hk6NXXMbxjNuIyjo9MCQ+Zi7im3+Y4yzYEkU0Bt
 iq+/EZ5mvCh7Z5qWiCsUUAG2JePndB+vCoCQwOjXZWXiZjcGEBw9Fyp+QOpcLyTH9OA7Nt5xUJ8
 3A92ucBcoreNN23wfyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230095

From: Jakub Raczynski <j.raczynski@samsung.com>

Newer XGMAC hardware does support up to 16 DMA/MTL queues.
Add support for these after previous modifications of driver to accommodate
for that.

Co-developed-by: Chang-Sub Lee <cs0617.lee@samsung.com>
Signed-off-by: Chang-Sub Lee <cs0617.lee@samsung.com>
Signed-off-by: Jakub Raczynski <j.raczynski@samsung.com>
Signed-off-by: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
---
 include/linux/stmmac.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 00be2df63d22..b91c8d069dc2 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -15,9 +15,9 @@
 #include <linux/platform_device.h>
 #include <linux/phylink.h>
 
-#define MTL_MAX_RX_QUEUES	8
-#define MTL_MAX_TX_QUEUES	8
-#define STMMAC_CH_MAX		8
+#define MTL_MAX_RX_QUEUES	16
+#define MTL_MAX_TX_QUEUES	16
+#define STMMAC_CH_MAX		16
 
 #define STMMAC_RX_COE_NONE	0
 #define STMMAC_RX_COE_TYPE1	1
-- 
2.34.1

