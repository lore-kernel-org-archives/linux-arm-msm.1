Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472459;
	b=E0UnSRIlo0TkrX2LNsO7vW+/xZp8Gwol42EP2aAfIhyqiQR0h7uuGTj6vc/swXLJ9Bdg
	 zDyBXoc4bKHXAoSxnLFp/4MD21E0jI1y7NT6elhAFKMEW+RkkzEs+1OZPflRoz2feX9xp
	 Llf4YH79kw3XTkBwcko8cTGqLmuG4JoZ03/CB0B8zvbAWMNAiQat9hwqcWLVD9JHACBMY
	 jGX//9TJLhmRPspRbjciTDGit2Xxsvj/chw+d95YYyJTLZNOAKjqzEBTWXWPITuqdUUmW
	 BriHzm0JqJwsdshbucfycho2kL5TQ2gaPLpeHhbXcrxEqgdCK03/GnFhlQpBiUStAiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472459;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lCEAyTVsKfqf2TuD0MbUKn2c2nJtOpDVRa0HC47OHj8=;
	b=GqFG68er9ZrcAFNsN/mCJOfAxd8wF10RKveEiCC1Ksl6PShbzWmkm3ogVUpt650KoOPp
	 LiWHXVOAfTYYAKqxLPKuOmJBNYvwch3n5iMhzGFiO37A7LhLi57XBnXroPX47LJTT1NVo
	 4CQ+I6nhrAdHM6Ym8wU7zRI7Xf/APvZ8XCQ09gbWb1xdTPk50xe9YI8H6p8QksdbWaFUK
	 nNGCFCHIeXvYPwhCI1Jm99xr2c0yVs4pnaqybMNUEVBG66PE6u/IrzngSXmJE9g5GG3ub
	 bTKHdSe4Yjic/37kL4QlyN0wMquftDErzCBWL15w0nd7Z7mgZ5du3Jd3sgPK0o02lvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ebXST0T4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AflhbXMn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25BC60A3820
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 08:34:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E25BC60A3820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ebXST0T4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AflhbXMn
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZVFg4092549
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 08:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lCEAyTVsKfq
	f2TuD0MbUKn2c2nJtOpDVRa0HC47OHj8=; b=ebXST0T4Q8PYIyuHJxnW2EU1d7D
	47DArYhnx2wuor8XCNT4mzvfpg9fY7gcClF6hBO+KGUy4WjBwcJqJuGCnE7LyGsw
	V0h7wpSQO9PhK7zYHSOT5rfQEdTZvoTC9Jc5A88Q/0HCxuiJyfDa9jlvzt3Cb5B7
	Dnsf8EDJR3JH4k3Na4kVfKzCCiTA/QbYhTDl+idNnrVMmouA7FL7PfrsZy7RLm0L
	mtg5E54RzNrs0XipgSKGfuvPRJniNxTqgZ5uZfOfIPYLKnjvgG58PInor4gW+Zes
	EF2k87vUVlcM+BdwICHsbVZz9cN4isdnPv6QpoRjJJLadiW22j+9jL7+2Yg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8hybm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 08:34:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed79b01ef3so2446895ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 00:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472458; x=1795077258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lCEAyTVsKfqf2TuD0MbUKn2c2nJtOpDVRa0HC47OHj8=;
        b=AflhbXMnSngbZc9iibNl3tWDyawGvcbezmok6YhLz3Rs96qfcRtIO/rJdoo3gsgKHp
         mqp23qu47b4M+SV/6ZFfnT2uNkRfG94UXgSjt6eHVp8k0AlzNzOxlyxiDTlvxnD0P8IX
         eCiP3LB0SyF/joWoBC1Rqx5VBig3s1QY+NXV7w/hQ4Px/iRwKyeEglgB6/Mi2NvjWuMD
         No/IBFQh6ax7hl4kcrYCVAGnqpLA/DQ86NRcZlvuW7W2wOu6b6U0kfJuZI7x0YqlFcWV
         esZq2ReVspek2iMXYbuS9DVa3EBP3rt0XVUDQ4E+n2r439W+k7A/x0wzjwMmVxqIfNQL
         ZmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472458; x=1795077258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lCEAyTVsKfqf2TuD0MbUKn2c2nJtOpDVRa0HC47OHj8=;
        b=rMsLCwn2xXOMpXVgKJT624U1ZQmsqZTf+WbkD1IxxCfB/2PGzmMPNDQUafQKnD7hlo
         Sk7qu8jF0LhVrjMM4mfMDi73CEu/ciN6AEsgOre66DEXwOoD1YKhh2D1P8D53K5w2+eu
         6r/onYzKTdGAvgU8UkIxWMhR4u9L/tzR8GXdjaUPPzNtHAlS3lcJr17shgLwXaMnaBVt
         C/dP1bj8MuVyP8dAL5xwCG+T56bnVZ7qn+RrgJGYQMsnUBTzt9gkvaU6VwKE1GrZcdL7
         goMtZAWclPJot6ZyeDmxuglcZfb9GrcwTpfiTm8oE/aW590SLZhU3S6Tl0otD+JyDy+T
         ZXfQ==
X-Forwarded-Encrypted: i=1; AL+hErFgXuHvEVZbHbVSnEydrhHKC6pxoh7mjQ8huDuwj35nyFpX/27LTy+xGEwZ0IbI6gowP984YhPO6w/1gLOh@vger.kernel.org
X-Gm-Message-State: APuU4Z+6y4pKtfJObaXuewoCUKdPsG4F9IoCKeksRmmf8sT8HFDac5tc
	sPX/M5DTfWnerqCjPNWkMd/dHWFcvdFQUD+lWBK2X0aG8dVRVR13HjOraXIvGq0uL+lNoeSj4RD
	ly9VX1MegfkHzDcBha6M0rfzQS0NDO3mePDNioaZ2RCAEx3I8BwQ277y+pq9txoSlWU45
X-Gm-Gg: AYBFou0JoMwTdwSz2BeX3wN6XimYU9pAmrWTAh8/tFCyHcEf1orFqm0Ky27TTnj+Cr8
	b5wu5J2xNZUkH9Nr1cLc2+4IUkj7ubvilLNXvvU2yvCx+tXcaLF2n4Q6oUl/0xo094Xa2U/tlI5
	fM+eDm8UIwiuxDW167HlchrMBd2qC52j/QanpcW5Ga++D36TyjyE4hu9yRgig676pjHpNg2lOyr
	e6o6oXGaoWhgiIkMKqlNfgzNxsGaMwrJL8XCC6jLKz/vpS37J/cgmmdUK4RaY2pKUv30KCX8ICR
	HP8CGk9KODEbbU0euYDBsjsnFiF9PEo7lQDQ4oMojaPy/401oCWubxZ4N2ZNvvJ3wWJ+umfokeH
	1v8Uy7MRGobUyx8l38dWYD+MCd9knSJSbZ2SvmtHMiML1MODkI/+354MxsrBAT5p3sLokC1eTfm
	NdJQ==
X-Received: by 2002:a17:902:fc8d:b0:2e9:5714:607b with SMTP id d9443c01a7336-2edd7146534mr83242175ad.0.1794472457675;
        Thu, 12 Nov 2026 00:34:17 -0800 (PST)
X-Received: by 2002:a17:902:fc8d:b0:2e9:5714:607b with SMTP id d9443c01a7336-2edd7146534mr83242005ad.0.1794472457290;
        Thu, 12 Nov 2026 00:34:17 -0800 (PST)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4b950sm29351705ad.13.2026.11.12.00.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:34:16 -0800 (PST)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>,
        Cheng Jiang <cheng.jiang@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/4] PCI: qcom: add support for the Shikra PCIe controller
Date: Thu, 12 Nov 2026 16:33:53 +0800
Message-ID: <20261112083355.3884737-3-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112083355.3884737-1-linghui.wu@oss.qualcomm.com>
References: <20261112083355.3884737-1-linghui.wu@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX98wDfXnesIwR
 qKp3c622gfiyVBEWFWSnhiXufMcRfhL+vASHpUl2gYiibk0K6ChS0zP2E4NX3Z8C/pddVoA4vHb
 udcEbRd/XKOIfH1ces34mYO9vkXO+KI=
X-Proofpoint-GUID: Exd6FLuivpO9cL722H8R5R_TS-T3WHnR
X-Proofpoint-ORIG-GUID: Exd6FLuivpO9cL722H8R5R_TS-T3WHnR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXzTmmnqidQVoy
 T9iNXgn445/v7+h9hrQt6x9WRKLDiL7PxQR15HINM5Nj3aX5gFOzWHRjwZ/Tjpe62JwAvS1JZB9
 brQrrURVPE2KOFXbuqSWCl8+cTMF8oY2qUyCvShV3zHNyrydzAaWJTysrzJ9QrBdVAnMRpHxgo1
 F6r5p9p2wTeSvgEJ1w6hwwNwVUDbntfyPhGM8t0Rjq+NRsnlxLDUX0M8mWCrlK/SnmdOwMp/FK8
 YOJvFcyo7ZbBHh2ErThIygrR82Y18cl6h9p9d2G3Jutc2xf+sURivEBfWnp/0hMvzaDCqWkKsu6
 ir6UadHM3UoJnjjzS1sdTqJ+2pP1itaLfz1zPkFXdlW4y/9nGF1vw5xWrPHw41e5CQlFaqJt+1g
 BGO/bQYEifB0eZKC7AWBYzQfgQfUKR93F5O0sNFX/4Sc1Y/VQ8SVD5+U5VT3PxiSQMKBaC9hXX8
 9LpomH2n7rUVjPjk0Lg==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af57a0a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=OQKFvcYlbweCljSKIGEA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120033

From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>

Add support for the PCIe controller found on the Qualcomm Shikra platform.

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index eba1b2cb30f0..7573c509d7ce 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -2623,6 +2623,7 @@ static const struct of_device_id qcom_pcie_match[] = {
 	{ .compatible = "qcom,pcie-sc8280xp", .data = &cfg_sc8280xp },
 	{ .compatible = "qcom,pcie-sdm845", .data = &cfg_2_7_0 },
 	{ .compatible = "qcom,pcie-sdx55", .data = &cfg_1_9_0 },
+	{ .compatible = "qcom,pcie-shikra", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-sm8150", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-sm8250", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-sm8350", .data = &cfg_1_9_0 },
-- 
2.43.0

