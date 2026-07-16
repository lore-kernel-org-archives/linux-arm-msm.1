Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A367243F084
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 05:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784181334; cv=none; b=Y1Zz7O1fD+CDvjnHaekLqhPn3YwltNVfZ9jZ0knk4SZ88qEacakAB783MQ71UvtGB2Ybu/Z/J6dJC7sloEMaQ/+q8G4vPUsyixV+RfH/awKRSoMCIwFVlmPiiO8pG5tg9o2ZE1xwKYEl6r1lpP5PxYMGSeSqU5CKqDe+KjduxOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784181334; c=relaxed/simple;
	bh=g3lh3xv2fJOemJMqNdGCGf5chbAN1y19wJfzOCGzwLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kkcRJLFew/kb87QToz6exAbX8pgX5Y1RwzmmfqgYuVdXEd/Utt9DKqExsjJ2kTcoAVPCCVVMTTr/T3PaMHI2lhwcNheeh/5RAVMesOE+Ep73Ex8Cjk8OEWOTg7LurutQte+5T9eF5u5awZnn9PQ7ZSl1jOM4fpwDDviYI6sgaY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J04Q5rs3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h1Jnbncb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J04Q5rs3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h1Jnbncb"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G3wArl1666454
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 05:55:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T31LVZtn7JiiyDj/D+0HVxLzonmSW7DXPuwYVl1T0g4=; b=J04Q5rs3t7iJMp8z
	zOG9L9Ty4EtD9fYpHsCrMAcQoeTIvT5ii9YnzM4AIXN/MF9UO/WoCgO/grjABeaZ
	P9S2VWMGd8pHEIqV2/y8yxSoIemAKvFYF+vrt0MZQ+UdkJrMPkf3PnEnAT4R1FGm
	Z1Y8LM0nb+p4PWM8XROlUXf6lV22lJmwbtf5+k7eeXIaTmOg50dsjR42lyPwfz68
	UI9WRK8tIEOTsG56mM6cH5sQY7JwR6fkW6tPv6yPtV65rrA+ADytKPV8tuLRscuW
	fxtX76KCJU7tRLeR+8WzenpzmEC7hyDhF+wvWYsO9Ydgyt+17v7ad4lyxlfTx6gw
	ic7cDQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fen4w8vf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 05:55:33 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9151bf6ce7so6994743a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 22:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784181332; x=1784786132; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T31LVZtn7JiiyDj/D+0HVxLzonmSW7DXPuwYVl1T0g4=;
        b=h1Jnbncb5LzoHgvJ1OoBBkLilz16mo8Mu62t3BTdoyjdgeUnZa5wmzvDRjlF3DlAQd
         P5Bf7lh6imr2ofT/rnO+R9npPN6V5bE5iQGYLthJmDnpDcANaaeWa7ItjUOos6gTVkPB
         5hlDtzXTLs2XXZZRdPhPH4VS4XoIp5tMs+ZMEAnbbDd8n05TazC8l8C65HQRLViGnTMX
         QFlR6xf+VOWAUkLP1vB6owdE1pEiKNFkRxpL7yVIngP/KLgVYtJ1pepsK2VHYFkxlLtA
         11ApHvEDW1tihCCZFfLrrpRyIUy5h50pWH7BNAmhOBSMNrtEbB19VTjF0KAQYkghiuSX
         EB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784181332; x=1784786132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T31LVZtn7JiiyDj/D+0HVxLzonmSW7DXPuwYVl1T0g4=;
        b=ZbbbaaxJCgICSHSQU8/TMwcUm5d0wwhXLwnBwOhMYY4ygF8bh/hlyx6JqbmhFHbj4N
         tHsh3Y3qvrL8V54slLShftvAaVIjcX5cPNQTMg9V+l34/yMeDiw+JlcL1qCD6qHBfb/S
         EnJmaxhC4Q2utkml/K4GnSTSvzAYslSjxbq/qTl8lk4PWLdFa/eWOowXvIejKVsNM2Fj
         7gDQeFqujTw876TSGUngiqbSu8xZ/5vpYVkY+Nsf7s2pmFhs8mjqyPlci34L+cZMYf+4
         CuAvnNz9N4oMbWkKUsk0jHXV+WuO7SFyumri022fZiAr7FfzNX+uwRq7J8qdiIR6+kS/
         xOfA==
X-Gm-Message-State: AOJu0Yz3W8BbY/+VKIfx2MhggLSiHNw3jHgS5XBvc8kG1N7gZF1jZfc5
	6Kg7k0sJiC8NwHWlQMhUSwjC1xck8TkQzTISZhlutTRArcVlTnKi9tawJR/Om0q8Sv/S9tJrk1w
	M3dji+D65AITL3sZ/FhqfkT0i6Cypl17Y4bpQQRGkYIS0lqV7zE0tX3/mNjD7um0OZiFW
X-Gm-Gg: AfdE7cmfffukFdV1IvLU0dTWEVVVBdk1Ix74fRVT23d9r4Tv3PpHUfszVHsxUD15Z9u
	eP51emVL+h6V15oG9KfGizuDA9wusZkdfmEhfSZ5Y0QR7GfmjVH/lNEPNElPcmokBt++lCCDDN9
	0vqrrvCs9Vv2KGChR8g9pFNMjaevivngkeqdRh73+F2amupZ1NqL1DWFH4g7H008SN0hj1zytr+
	hUUNTiGHFqjGV5LIXKj9t0xOB8RLhU79p5Q21zqaUxvbbJs9qrzzqPRDlGYQrRzzqyC9+ijOSWo
	guhMKK9yEIiuDS0xpyoWZ//p284PNGEDU/MKY5pFCnGvpL0VqxEDdXlUHu9q789FQwquLS8l9UP
	kUUD3JbllYwrnKMGnimB2WOWGB1MZBU4T5jh8hqEe9w7H9gq6ZFazxxAYcTARBN50460pat/hR6
	+NAxtA5xkrDtQ=
X-Received: by 2002:a05:6a21:497:b0:3c3:8bab:804 with SMTP id adf61e73a8af0-3c38bab394emr1543783637.49.1784181332434;
        Wed, 15 Jul 2026 22:55:32 -0700 (PDT)
X-Received: by 2002:a05:6a21:497:b0:3c3:8bab:804 with SMTP id adf61e73a8af0-3c38bab394emr1543767637.49.1784181332006;
        Wed, 15 Jul 2026 22:55:32 -0700 (PDT)
Received: from hu-mdalam-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6a4779sm9046846eec.17.2026.07.15.22.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 22:55:31 -0700 (PDT)
From: Md Sadre Alam <md.alam@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 11:25:14 +0530
Subject: [PATCH 3/3] arm64: dts: qcom: ipq5332-rdp-common: Enable quad SPI
 mode for SPI-NAND
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-quad_dts-v1-3-74d86792944a@oss.qualcomm.com>
References: <20260716-quad_dts-v1-0-74d86792944a@oss.qualcomm.com>
In-Reply-To: <20260716-quad_dts-v1-0-74d86792944a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Md Sadre Alam <md.alam@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=PsejqQM3 c=1 sm=1 tr=0 ts=6a587255 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=QrhUAEvljbRiGgZU1AMA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: gD6RiDnHIFmw_SlNH7hwMT7qo_6hH03K
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA1OCBTYWx0ZWRfX43J4V0gpzYoi
 CSmIRgTjZHaSO9vU8r8nQz3wT2orKG4UgqaWTQnc/HtaXa6oCdQy0ABDSy+3N2+SB4IfkXZXmM5
 MLnuVMpuZyKyVVjT63QrzbZYU9WrV3w=
X-Proofpoint-ORIG-GUID: gD6RiDnHIFmw_SlNH7hwMT7qo_6hH03K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA1OCBTYWx0ZWRfX3R00WKhMBYRi
 Este5YFu/GqXr95gc9XpRA3Xd34JEuME++7DS+ZVbgpnZ38tV5Z5vkoF+PuEZYIkB3K9/RA6ked
 BShwhqykQfw5V0vhbG7XOux7RsEcfn7ihnfnQZi4vakOxXR3UUzB7ICg8jAXduhypX0NxkGu646
 ui2AZN62Lbd1Mnv/NDMuukQjfysLQ5eXzC2i16KoN/iq5YaF4auS/uApbn8thXH/MXBbAq2RVFo
 xAj4LZ3DHzkxd7Z5jp0N3IJa7hwcNpYGNt8pDBeUEV3WiJpHB9fepMrxMBGjGf1sCQXmzPoKEYo
 7qtfxwqC5A3m9kZxw8/XuUqbxxjO8NJ/ODm3H+j2FfzuM93ISX2rjW2r25HVlGAvBLPLFL4LnPh
 9WKRghdghTjGO1C3jeM/CNQ85asFx11jN+FeIc204sAMsBdOzW0PTzDfeq4MhTWuh2NsXcSUmhy
 MAB1m/mbaL4fkVV5JJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160058

The SPI-NAND device on the IPQ5332 RDP supports 4-bit data transfers, but
the device tree does not describe the bus width, so transfers use the
default single-bit mode.

Set spi-rx-bus-width and spi-tx-bus-width to 4 to enable quad read and
write transfers and improve SPI-NAND throughput.

Signed-off-by: Md Sadre Alam <md.alam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi
index 3bbf748f2e5c..6f5b193a204b 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi
@@ -141,5 +141,7 @@ flash@0 {
 		nand-ecc-engine = <&qpic_nand>;
 		nand-ecc-strength = <4>;
 		nand-ecc-step-size = <512>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
 	};
 };

-- 
2.34.1

