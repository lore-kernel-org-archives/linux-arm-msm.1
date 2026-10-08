Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D47840862F
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 21:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791493629; cv=none; b=g4GN/AZ9QbUl0B+PRmxUs2iTcYqmYnQV+l4FKJe7DE717SErAa2Z0kZ3Z7YZSEsO1jQOlp+ewMfcjgbPaxlaK9AifIgdUSqq1Ep5i8y1jv9fr3/4uRGlqEKloaqiFeILysG+kR9lg8xXTdhW9SGR5WG7V1zAZIrpBqWKqsxpDKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791493629; c=relaxed/simple;
	bh=OAsh6BHsJWICYaqgCYPxTfrGA9OgSXttDi2giyj8A0Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=e4ivq02OyBCzNuDlZA4xExIyRrAGd513kBJ5FALfrKESo/2806RuOqcwbQk0ejRc3kjEHAzrwDDt2/ZjneH7cHGeutPb1iC7ndgZstJXBUACHJaUizgGe5Bj0A3Q5bsfKy/syYZuJsqbrmqbwHVn0PESvI2tLJ0q8dTkql7BFl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TMrc9B65; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PUizhU5r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TMrc9B65";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PUizhU5r"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698KxsR3921790
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 21:07:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qkepF2/gI8XkHqq9Zdif/+
	4ePDfuAtYx0d2zgLKoctI=; b=TMrc9B65CA7fCBxrrDjjD4XLcAd1EQ+cmdd9TP
	JF9lTVG8cvg2UO3ub9I4RbY84NCyVwGeA0ZAEA88Izu0YVfq4OKaGZLkti0P2AVF
	iURaXxF4Az4DWxed/NiNq3xpA5JTBb8mTKMOBZV8a8j8NivyoDGd450tt3vxXIXz
	kF5axqGhGv1k5BRGSO3Jxr+I/VG8JUf0K+SrQl6pugLASuSzu+7Jwj5ozQ0KbQPz
	Ep0icAnZXj96A2K4MtWkk+lt1NcLVJ3rikRIBkY6nRJzXQlHgOKLmnQAmZDrF33u
	XOoRRfwCGUILDx+SVX/RhoVioMyumpUiKG3iW1RS7YzdBbAg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxw8ne8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 21:07:07 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3425098ae4bso5939882eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 14:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791493627; x=1792098427; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qkepF2/gI8XkHqq9Zdif/+4ePDfuAtYx0d2zgLKoctI=;
        b=PUizhU5rzM1zTgM/WeSPNWJ8DlKu/ULmx2CPQcIl/6aMvL1ZiHiA0sgLsoq8PyVefi
         WHVSHbRbZpbQQzOaNfQ+3ZoQx782Se2dSGKS4Wyf70SN7T5GHCC19FW9rAq+vIOHTogR
         5BSQpL84B7JLdUKPXObJ3m1mIIQgLAcwIlfP2NOabkHjHDcujaHhDwNFF29e42QNz16q
         ZRCc2obGPgVTIablZneNazqZwam8/ETZKI29QC0gPLHCDdM2yNZWGse/C7BlYul4W3g1
         9rSLejpn4KClFnzMl4VswSgY6ZVqIPE8z1+d8Lnb858UHbibPyZyDhaETjylE3udrA/l
         8xHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791493627; x=1792098427;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qkepF2/gI8XkHqq9Zdif/+4ePDfuAtYx0d2zgLKoctI=;
        b=xZDmcqI+LY/hNWHG/QX4sbDHrb30tGESiqbMRul8aslNx1MA5NP4Iob14cv3sexpU9
         0NYF4+rvuKWZSy81+NvV9f8DcLtmgeXajcjcWxNO4JnPp8ZpIavpzXfu+x/NaINhYeV7
         y2J5+BUQTqOXdGZW4yILMuaMKhh3qjt1qxffbuKLoXN2GL/1L/1n2am2plCYGR4oFgeJ
         PUqJ8UfldqIIPKSNB1B3CczbRW8FMINcII04mKoj7DA76uuVUh5EExSO96YyqD0p3mFW
         jKUnaiamluJcBKf9jF6qZiGNgmeOidjotcDXQ/YgLN0u/CutPpsUg4DQHESIL0Rq5+z8
         TGFw==
X-Gm-Message-State: AFq9FYL9gNlQjq8VBaRPRm1csq4rmJdU/a+s0IiOsQSW+vCalESbB8cX
	TnwbQdggHl8EKTuNoi6+CR630Ivn73ndYXbPpTxtQwIJD4FKUrGtHbU2k3b9J5TDP6eIKfgFdR+
	Qxyr427ta2M6tAgYOvO7kGbu+LMqqWtC9vgn1iP7IQhSefcbuu+X7/7RgHqYBmjwK7BZo
X-Gm-Gg: AYBFou33mutFaCxySljQ96KwLQOZjIBPDVzgHLOUmBRbIT2bImBgoo1Ny6enqUWn6gK
	0aRGGpjwh6x9dzM8BnXLWe6ObWaIkmqmFQsdPWyOaxY5OCr/9fr3LnJqRU6q9+rcTLPnOHvut+n
	LWAtNCt3dI1O8FY0HAfmrWtHKujTcCQHkCatIqV+4RbMlSvcJ5uuuLtFopL+XMYup1BGdF8sWnL
	JGs4MRqguvnReBL1Zo0iznpxayfoClxQXbAGiAkNDZsK8uoqy2DIWUf/D1VuqAZ7b8z8Zuh6TI6
	bHxZkj2tfdJ8B67h4rlvbYsRE1h8fIWSnueoBE8pn+fWGLJ2mpSlCVWUKu13a+uITMQCFAyJuos
	f9U/0R+/x9WU/Wydff20yvaM=
X-Received: by 2002:a05:7301:6487:b0:351:695d:c942 with SMTP id 5a478bee46e88-3537e01235fmr96077eec.11.1791493626687;
        Thu, 08 Oct 2026 14:07:06 -0700 (PDT)
X-Received: by 2002:a05:7301:6487:b0:351:695d:c942 with SMTP id 5a478bee46e88-3537e01235fmr96028eec.11.1791493626045;
        Thu, 08 Oct 2026 14:07:06 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cab27d5sm634773eec.17.2026.10.08.14.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 14:07:04 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH 0/5] drm/msm: Support for GPU in Nord
Date: Fri, 09 Oct 2026 02:36:34 +0530
Message-Id: <20261009-nord-gpu1-v1-0-a06a6c57bde7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANsFyGoC/y2OSw6DMAwFr4KybqKY8gmseo+KRQouRCoJxKRCQ
 ty9AbqxNE/PY2+M0BskVicb8/g1ZJyNALeEtYO2PXLTRWapTAuQUnHrfMf7KQAvsQRdgcYiv7P
 Ynzy+zXq6ns3FHucQlcsVspcm5K0bR7PUicV14X9teeyPSKTPg3Vy5LJKM6kyJXMBMoUyVxw4D
 Wj7+JkTfXAPRyTmoD+HU8TBmn3/ATHlVR7TAAAA
X-Change-ID: 20261008-nord-gpu1-7e71a91ae653
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Shivam Rawat <shivrawa@qti.qualcomm.com>,
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791493617; l=1744;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=OAsh6BHsJWICYaqgCYPxTfrGA9OgSXttDi2giyj8A0Y=;
 b=YgHWFIUSJr0YEcLnzDSY5byxjOWwNyX+PJZro+6umZXkfli7BA+dmcwc3RKILkKkwlwg3vjxi
 O/rDZCbeDreAvPHn4DN73Fqf2ryoiCHknbeQClyPMDFg9UMrvYfZctY
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA4NCBTYWx0ZWRfX7WqoDOQ7Hd43
 bq1Nx7PrN1qs7UY9pr89bwgPm9y2pj9t8C4PFLu7N40qzAJT744+vCIVpj+ELeGNxqbE943wfrd
 2+oib9Qy83inABWtKOzw4jEE0C2YBOEg4MPMJzBkArhIebxdPoZZDKtFsebchvdtEVy1EU2ky9H
 PIx46t76CGUflOAo0rhCzcenQoZqlZpB0jKKA14ALstFOoZKoeXg0S9pKu6H9atqNwc1iDZzC82
 WGUk7DANjfNfvjYWsRVthof9VfZaL3riOr/KpxLyejagS/807tOYXWhdWmS1CMOgD+m/dN7BQGH
 FEz8aOfYUTJRQAUlX3MDyXy83RBlj3XkDBj8jocTn/CX3k7jnBCIR14hCI8YhhpXrq9nSvBsjpR
 wn2vZZNMGLf0b5/CSwFke0Yc0B8epMA7BmHptc1x8Cga8AFgX768+4Pw5q1qDNh5ezj50vdR1Ql
 2wLm5AFvoZsWnYY7k5g==
X-Proofpoint-GUID: dkVUZTle1Ia07BEQEcC21jnP6hM-1vsn
X-Authority-Analysis: v=2.4 cv=cMB1IVeN c=1 sm=1 tr=0 ts=6ac805fb cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=eQK-ig326sWed8EMzPoA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA4NCBTYWx0ZWRfX6CrBJjTHUWLl
 HEiJaIm5JsO6iKOW6sOm1nJstYqYAZvVdCx+7nWz67U3qvVeuAmUp3FcMPDgKL0Sk2PJOcEtUNA
 S6XOfYyeKqNW7D41knMtDaeeo4gHt7s=
X-Proofpoint-ORIG-GUID: dkVUZTle1Ia07BEQEcC21jnP6hM-1vsn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_07,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080084

Nord is the first Snapdragon chipset with 2 integrated GPUs. It has
an Adreno 753 GPU which is very similar to the existing A750 (SM8650
chipset) and an Adreno A735 which is similar to the Adreno X1-45 GPU.
This series adds support for the A753 GPU. A735 support will come later
in a separate series.

The driver and dt-bindings patches are for Rob Clark and the devicetree
bits are for Bjorn to pick up.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Aastha Pandey (1):
      arm64: dts: qcom: nord: Add GPU cooling

Shivam Rawat (4):
      drm/msm/a6xx: Add Adreno 753 support
      dt-bindings: display/msm: Document Adreno 753 GPU/GMU
      arm64: dts: qcom: nord: Add Adreno 753 GPU and GMU nodes
      arm64: dts: qcom: nord-rrd: Enable Adreno 753 GPU

 .../devicetree/bindings/display/msm/gmu.yaml       |  33 +++
 .../devicetree/bindings/display/msm/gpu.yaml       |   1 +
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi        | 293 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/nord-rrd.dts              |   8 +
 arch/arm64/boot/dts/qcom/nord.dtsi                 |  80 +++---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  35 +++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   6 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |   5 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   5 +
 9 files changed, 423 insertions(+), 43 deletions(-)
---
base-commit: cf4a8255a424f691f95dfa378e88336f33aa8ae4
change-id: 20261008-nord-gpu1-7e71a91ae653
prerequisite-message-id: 20260924084805.1021758-1-shengchao.guo@oss.qualcomm.com
prerequisite-patch-id: 62d07f5574a5d15ac0097efcea4a70dc96331cb3

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

