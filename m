Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835091;
	b=bVdbnQSCWE/nLBzm4ncRRLlH40+ebMEHDpftMisYM+h05Eh7lDIPmLLXn+HxlIu3dCaS
	 Z092LfoLocQMpaez0V2NlxfZZTHaDaoB6VsdPJukOgYIYpgXm9d6Fe9svlxVutHzFEntL
	 PayDt+XRQ+F0c1Sj0Jlq4L2UMykrdMRCvMaT/eP5TsA8TreLB5uav1akQQyVsYpdW2tIq
	 8IFLqdeK8Xb6llQjJK/SC8ooinnN62wm93bGAGiRiPK8MYRS3MvMebpXpXTXzajfZeP65
	 qNJT83O7QiTycvJbEUJk55XcrdkI5v0xhIOB7mYYoSgQTG+P9RSdh+ly9OzzrZN5r+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835091;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=v7E6DqGo000I7uPq00z0emYDzpAMFMtfVm3oUlX4g4c=;
	b=dFw0R/1qexFVIlMcKPo7guLzdxloScs6luPuzEu6zHc5OwJFILrW07JXmO4zR7M8/3QQ
	 taQR7kWqeq/eAD2jco48sGdXHFU1rfttku6poyZzCZVU858PQhA33mXq0tvjQBGkZQhJs
	 27plhSeNn8+Ympe2+Of2xlzbYtyHPJSB4iT/pXpV96IbftRoHaWCiBkJN3Jg3AH827dZ1
	 nVY4q7SZO4E793I7uF/DNVgb315EJfg8N1cdh3wiIV+pKGFVkJ8DU9H7bRi2BLc4fvWR8
	 5xn6v8LXxnsWltd+fQoHga1BdLhDBvnoad9PU4Yl68qe1ByJ8ctebxoK9NBM77GvafA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zc7kL8HQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L2XD5HdT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F72606A881
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:18:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8F72606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zc7kL8HQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L2XD5HdT
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC1Mo01004660
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v7E6DqGo000I7uPq00z0emYDzpAMFMtfVm3oUlX4g4c=; b=Zc7kL8HQ1JDu3LsG
	qhLcwxYLryxLs3hRcdFlehR+VbQl9CdHfnp7kAXQI8M6/BOF2h1hGQfrYEC3Qiby
	jpPgbBjyxs7EnWcuyBK6S6qrFOqIJBiIuQLjHArQisBn3EsjgDF99UZFcqtDfdHh
	5eiYdPGqq99JWMmo9DdUrRui4hgafPHQFT5+om0TDMobDxg7W1gMoz4g4XLHagdp
	myd0A2MCOeydg1vO5y71eLfdAqfRomtjk15LKznV/8UaiAeNjEkuhl6/pYEDzHZs
	xxIIek1Xn9oBCWHhRZw44OPVAtgKvQOMTqLSP/MpKHkWGXh/cUdtQi4ifxDnobgp
	3DnK9w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j000g0m4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:18:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2005ce21so632022085a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 05:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794835089; x=1795439889; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v7E6DqGo000I7uPq00z0emYDzpAMFMtfVm3oUlX4g4c=;
        b=L2XD5HdTd75SKhGi+GwrIWG5P5ABq9CumOOAQ0znN+x0HmM2ZsK8ZrxNAG2uu5SHNO
         JAerf7vWqU5RfjTwAwKy1UwHXDV8fx367KjHTI9yXA9wR7Jrh0BHlgvOSR/uq8MWfPv/
         CFQGApX2HU1iLFukQ0j2UW7uP2OsyCrd3dbf5ldeDbvCOKp33VreXh0lDICL7ZZmkgAi
         uzWc9H6Yfb7C93nUHfuUdHgfjtsIxToKvZXLfcKhZKom6GfirAjRYPSXMnug9u9FpiRu
         VZDdvgqsj5JF4z4Hz3Fds6a7zZYjk5+vCbODhU1HtUAvUCtW4qnajqOvJ34teuU0/V+7
         Giqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835089; x=1795439889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v7E6DqGo000I7uPq00z0emYDzpAMFMtfVm3oUlX4g4c=;
        b=seX5up2Xg8QLm6Ga7QXethYlsAiejeq8HZzXdJkuGr4Bo3CkbuS7AccpTIBAJYIGwP
         eFP+0Bzw84iM8jhvEA6sSbLvy7iG4n15O2/w0xQejS5ux+h1t5yarpIjrRMXCAss4ZIO
         UxEQhe8XT6QMbQwTHGWfwOqf+TsAU64XSGFOLoGKVP3MEx4ZxYWY5Hx9EMy/5M4SsIg4
         v/HY8I8fvKulP87EvspEBupdU5DzHBNMH2KR7jmaapsHkw044HAaXoWTMGH6ZYbJ4/3v
         b9IKt4S7OgYZW3kZViMcBl8iLNmDApENu922bQjYSyzJZZYkSJAFdzjUh87Ap6OqM7JR
         P/Vg==
X-Forwarded-Encrypted: i=1; AL+hErF6sbZtscv/QD1VKyGs2JQ53yebAMAt4KTVkdAQ5nPrKn5w+cdqfmnB/6su2fICUKSrmONq/NGscFv9qqMa@vger.kernel.org
X-Gm-Message-State: APuU4Z9dhZ/Ko2mWLYDLLWVrkXXWsSLTNmAA8WYWTQn0oBs7fViBGMft
	1zMtqahAgbHQQ6/NkgIGkG1LntrqPY+MM7fi7Hq2Nq3cR0o32f6zd76EOTHxj+vvq2JqePzx3q2
	b1nTSepiNYqaGt23uzCXeh7MYJOK82oN4T8ANjFyoQU39zj0ASkU0+/5xHhaUjB1YPRBg
X-Gm-Gg: AYBFou2Cf6vgg3c2uFSy8DnZYMWVr6OdxJXl0rSJvVDCxWLfr5e5cTg9QFsdKRqfyrx
	8xn1DLT1phKtfIvMMJ1TUaL4qzEavW8h7MWqA8aW2P4GCh5ZxG5ZJ00/W4HD90zetICQ0uWplDz
	70lFSZzJIBx4UiBB0B0UL8u2mRrmmDiUVrMJqKmSE68AaIg9ymZTp15Ild05v6mkhUOB+9qyDnm
	1KRwxH2PrEq6ogJF78HdDmnAaBPMDPUo+TgP6b50QO5LcWGLfhr6A2KS+9LiNiuOEfEtoSE+wUd
	9mMepGnn+O22KY8qu4A5KpuDh3YxRbuTbj9pDx2ulhcqUT+H9lsUu4RuGe1o1gTFB3X2W9fBvCh
	oa12cCUNd9IzSjhWyX/iVXugV/fYYJPfNOezzvNw0Kj8xAjkwekGofb5msFqStzHLSCGxikR0xT
	8B
X-Received: by 2002:a05:620a:2949:b0:949:7b7e:c101 with SMTP id af79cd13be357-9497b7ec67cmr478584685a.6.1794835088832;
        Mon, 16 Nov 2026 05:18:08 -0800 (PST)
X-Received: by 2002:a05:620a:2949:b0:949:7b7e:c101 with SMTP id af79cd13be357-9497b7ec67cmr478577185a.6.1794835088123;
        Mon, 16 Nov 2026 05:18:08 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8e1c94sm843927285a.39.2026.11.16.05.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:18:07 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 18:46:45 +0530
Subject: [PATCH v3 06/11] drm/msm/dpu: Fix DSI tear interrupts broken by
 adding INTF_9 and INTF_10
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261116-nord-drv-dt-v3-6-e3d3bf0e2c49@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794835013; l=3056;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=tNJZcT1SgyiVCTR5tI3Rgit0As7OaoMsLm8aGW6FkJY=;
 b=K2WAePHAK5sxP8sTbvcHlOZbYHt25AZY6NwjI0xtAg7tOCOGfYh4hTYpP5BPWCh0oqJ1n0I7K
 MMTczlWpUd6AYrAkk6G6wJxGt1o+x4PoOqwoy4cRnsnQMZaKfTKVwAC
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfX+Nf3kYst2zlx
 vYb6nfnEuM32nrkZq5heonEYNbQtyjcv3TCuw7n2VRDMFkB3K6u26bFXaZ1shcoV1hDsP4J/0Jb
 V0ft4m3p+xIGdypYrhId92b7d+o9inN0nNSD8E/mVBoxC8TkN31NS7g4EnrDtiUPGo1DB0pMC0i
 29lyaXxuL+jiSUm/P8oZo0W0eKczojn23b6rBi/q8eDF9k2+R8TQ2twZ8SxIXXOgkxgs9gGeP+D
 U/e/EacCIcBYOWVpg64GO4VJ7ZUn0LxLppkjwsGmseYcx6tDowXcYfareBoMya5MNHHaUnsCQyC
 ZfD35MPggwsWeOu4iKYlYAksbnVUJEdX5YlbSUmCysB5onf2pbpQSSWqyqQ1NWXmrBmw9wV6H8e
 zKi32eEeCOecTQ+clqwcvWVQ9AIhHTF0nroG+6OgeXULuL13ulxdpG0YDedNSKiIuprf22m415D
 AzZ9TcehqjtC+6Su3Gw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfX2EGkIQ+0qixu
 Qz/2iQ9FQAY/krx2n5B/dtjd/OkAVS+u8Bb9M5OnPHSapevOl349sM1rXoL1lHjzQP/shpszN1g
 G5rifvkRUK1GYVOKHwlwRPNotqkPIwQ=
X-Proofpoint-GUID: CSYxovdnMlKG7vKEw4Dc7-hI6m3_iw65
X-Proofpoint-ORIG-GUID: CSYxovdnMlKG7vKEw4Dc7-hI6m3_iw65
X-Authority-Analysis: v=2.4 cv=Vdtir1p9 c=1 sm=1 tr=0 ts=6afb0291 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=QKV3EQzOLTW8gb8NrR8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160052

Nord requires INTF_9 and INTF_10. However, enum dpu_hw_intr_reg relies
on all MDP_INTFn_INTR entries being sequential — MDP_INTFn_INTR() macro
computes the interrupt index as MDP_INTF0_INTR + (intf - INTF_0).
Appending INTF_9 and INTF_10 after the tear entries would break this
assumption, causing DSI tear interrupts on existing platforms to map to
wrong interrupt registers.

Fix this by inserting MDP_INTF9_INTR and MDP_INTF10_INTR before
MDP_INTF1_TEAR_INTR and MDP_INTF2_TEAR_INTR, keeping the sequential
block intact. Add the corresponding register entries to
dpu_intr_set_7xxx and dpu_intr_set_13xx.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 20 ++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h       |  2 ++
 3 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 5b7cd5241f45..c9c297ca080c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -206,6 +206,16 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
 		MDP_INTF_REV_7xxx_INTR_EN(8),
 		MDP_INTF_REV_7xxx_INTR_STATUS(8)
 	},
+	[MDP_INTF9_INTR] = {
+		MDP_INTF_REV_7xxx_INTR_CLEAR(9),
+		MDP_INTF_REV_7xxx_INTR_EN(9),
+		MDP_INTF_REV_7xxx_INTR_STATUS(9)
+	},
+	[MDP_INTF10_INTR] = {
+		MDP_INTF_REV_7xxx_INTR_CLEAR(10),
+		MDP_INTF_REV_7xxx_INTR_EN(10),
+		MDP_INTF_REV_7xxx_INTR_STATUS(10)
+	},
 };
 
 /*
@@ -282,6 +292,16 @@ static const struct dpu_intr_reg dpu_intr_set_13xx[] = {
 		MDP_INTF_REV_13xx_INTR_EN(8),
 		MDP_INTF_REV_13xx_INTR_STATUS(8)
 	},
+	[MDP_INTF9_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(9),
+		MDP_INTF_REV_13xx_INTR_EN(9),
+		MDP_INTF_REV_13xx_INTR_STATUS(9)
+	},
+	[MDP_INTF10_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(10),
+		MDP_INTF_REV_13xx_INTR_EN(10),
+		MDP_INTF_REV_13xx_INTR_STATUS(10)
+	},
 };
 
 #define DPU_IRQ_MASK(irq_idx)	(BIT(DPU_IRQ_BIT(irq_idx)))
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index 142358a105c5..7b8a04f8d209 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -27,6 +27,8 @@ enum dpu_hw_intr_reg {
 	MDP_INTF6_INTR,
 	MDP_INTF7_INTR,
 	MDP_INTF8_INTR,
+	MDP_INTF9_INTR,
+	MDP_INTF10_INTR,
 	MDP_INTF1_TEAR_INTR,
 	MDP_INTF2_TEAR_INTR,
 	MDP_AD4_0_INTR,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 0e65bf5ddc4a..7eccb4d2c65e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -226,6 +226,8 @@ enum dpu_intf {
 	INTF_6,
 	INTF_7,
 	INTF_8,
+	INTF_9,
+	INTF_10,
 	INTF_MAX
 };
 

-- 
2.34.1

