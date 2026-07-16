Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E66386C37
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 05:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784181328; cv=none; b=mK/0l7HN+B47C27PQ4xLeOk8xDLXZrSnk8zRVTbqqmiszbaRYOMSV0mBaK4iSWIX7ZjTu5nPIhfCDGHkpagp207GT2AO0f78iNejvMFZDMBuvopD8APsTIctHekosTtlKVSK8aZT8WmC795XM/fQdh4ywopxvqprhJjfhrXBUCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784181328; c=relaxed/simple;
	bh=vJFXQJP096D6YldUoenCakW3XgnnE2kNJtgpz9My/6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rwYSDKhv3NBygb7WW/FYvsp7ZKf97IRpdhNn0L+2a518bCv1549551MyyCUkxcBaAmqxnoacKZfE9EVQGMw/Nwdb2ESLHp6X4EQuHkCFjRhSgyJKaV164SEuQIuj64u06nTD15miCOSa0j+K5hyQNYGTMk+9SBld789Zci0fE4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c9YmADEI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N+/SyTQN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c9YmADEI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N+/SyTQN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G3wNaH1299342
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 05:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gfE+seesef0XrJ1w0q53ykOxjGZ6GwmOgnbech7VoIg=; b=c9YmADEIRFtzUHdM
	5nTR7vJ9i+goTofgLneu9h0WHVyBQvJLXqEyjch2qtRM2dKmf9wtpjylXBggX7AD
	8BaUHLGQaFpmAlflXRmgStOoKrGSGjWjz110+wt+6fVDISGpxSar7ZYBWoWJrIep
	/FzsKqZlQxER5iEPr665gnv4hciJRe/+2My1jE0Deb/CrGG4CygcxpmH+FLQfLRh
	PBs1RlPLAw+k4iSX9gDicq5tIZ5hAY0+HEpRaPbC9i4VRXZSkl/6icjdJFHKVD5u
	BNg+Ddt/pLPaAP4Kxhs+gNPM8oXVxgEQsr3IKbhHMlMs7IRyZ9y+YokcEoIMIxxA
	WM3fAg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fed062trj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 05:55:26 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c89704da8c7so9147053a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 22:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784181325; x=1784786125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gfE+seesef0XrJ1w0q53ykOxjGZ6GwmOgnbech7VoIg=;
        b=N+/SyTQNO/Q+t6zYsX4PPcmE0ICDEvqlE/baIpGeibCuzxUfhOZJZiW3F6UEJXmECp
         A+WNcjtvuqi+zwZdmDBAQ+d9pwCmu76TDINvWk5hcgj8ykbZWWRESprSyc9+CqyR6oII
         ZyBQ/q8W7Q+ficn+HjWjTyf3Sjfbo3PhLzxL+0MQHmmks5KzFNYDgo0sclWm91m1BguV
         1oc5ZHazrPhegbzgRP9wXpD/5YCyeNp1lBrbYhwVOwx9Z/Qa80i5SjFb40m6s7RebUf2
         ktVh0axSaA32F1gzTTA047wYyDvsVqEeTajrFyYaYqaux2du+y1vHLeKt0WWIQ3bZ3xW
         gJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784181325; x=1784786125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gfE+seesef0XrJ1w0q53ykOxjGZ6GwmOgnbech7VoIg=;
        b=SxBHE41gziDOUpL5ttlUpCnbKBBUDEjKqIoAjyoF/t7luj3kbX+YD1uK3MEqNNRahJ
         xDGeLe+ZwN3vyVXnfrHaMeFT2mPpI4EOYZ0KKFWx8+24G6TdPOARm6tgmskm3IxsSvBb
         VakAl53TE3Q36H7yWTxW8lElKMhhgOwr/dDcImin9e7WzQFOpfrXwbtesx0neQuGi1JR
         nEB6gezVnYnGqUa2r4NWzEGifGGmQjsZkzlJl6+d5HSSGg5l7QAbWniJFj8QcGokCxly
         GFlwnHQqVS5xYqhhBBjYuMBGLHbFwlgNyn1mZpf4af3N8CPquf19drOJtlDl/w2Xgti/
         JICQ==
X-Gm-Message-State: AOJu0YxXcqC4Mlt/CFOeQ9fHvmpilPKdm+z9tXyAq/7KNA1hZV8CZuXd
	lKXBGr2/RKFMr/pbvh88Be3o4VGnV4a9mvR9hi1ce5uuK5npzlgyT4AvY5mvxTl+ON2MfmQZ9H6
	XZ68QGbbTDbilV3OmpS5EwPYFeg5asMqOCx+DMgnHj+dqXVTcPqcKioj9fWYQXMN6TE2c
X-Gm-Gg: AfdE7cmezU6ZB6G2KWetjhbzf/lCGCJ1WRT0qgUWKmWlhmvSRNAcrsKGOhVefTuBYpV
	eL46dRsD/qRWagjbMvOzp0qsB3ka53/RFSaKtd0n9aSxgKriExK4jXqrJk44z/eptuEJU3hXbuZ
	1/tG2VwiHwuYutNyl5gruYvUGR+W6HJoSrL3R2AstrwFLRZm3pNOJ00C1pVEpIR3taGDxb91wcf
	puRRW9gw5RFwlwr6suoQXOvDGHd9xOoJCcfz3sWdE+ts+qnrTzLbeyMTbcej5MlZC69N4OeH9XR
	SC8eyLAuLELmLM2ZipIKBfyLcjgCxyXOKMh7eSJB6IDYAfMa9ILqGsSY1C7Z8sH4KZDIVPH/DeN
	vzb6IdJWjX6ouoYADONRYADVojwLJTfLDH0HLhLjojP/pLcASACIdIjSyYt43w91r1kcCVyd942
	mndibNqxnJ+ZA=
X-Received: by 2002:a05:6a20:6a22:b0:3c3:8041:89f5 with SMTP id adf61e73a8af0-3c380418fb0mr3931302637.66.1784181325402;
        Wed, 15 Jul 2026 22:55:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a22:b0:3c3:8041:89f5 with SMTP id adf61e73a8af0-3c380418fb0mr3931272637.66.1784181324967;
        Wed, 15 Jul 2026 22:55:24 -0700 (PDT)
Received: from hu-mdalam-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6a4779sm9046846eec.17.2026.07.15.22.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 22:55:24 -0700 (PDT)
From: Md Sadre Alam <md.alam@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 11:25:12 +0530
Subject: [PATCH 1/3] arm64: dts: qcom: ipq9574-rdp-common: Enable quad SPI
 mode for SPI-NAND
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-quad_dts-v1-1-74d86792944a@oss.qualcomm.com>
References: <20260716-quad_dts-v1-0-74d86792944a@oss.qualcomm.com>
In-Reply-To: <20260716-quad_dts-v1-0-74d86792944a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Md Sadre Alam <md.alam@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA1OCBTYWx0ZWRfXze4AARvQFxZH
 G0SwYPUIk1X5jxMiAOwe9zKqOJKLc2wSJYCguvu547zyQGGZA3WWATC1m17pBq6V20lwOxo9jhw
 84m6bfcU9LAtIpC690vz0O3Rs/AtRFM=
X-Proofpoint-GUID: BnolqD5MKKvXVxtTK09mRZYwMupbzPv6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA1OCBTYWx0ZWRfX4FbK0mMfIE7l
 baeCWQA0ZnOZ0Jf5KIn7yqFkdsk43UYRvNNWviOxEiNBRrz7agzdfejanRWzfoD7VVJ5mVbyQ3x
 o7E970tIQfxMhRIby4zrOeW7afulAzKv9OIbhPQQYnKtAIL6BHnwwen3CgDu1df/yAyyCplzWGO
 cDVqgcnkcpwS3/clSgZ287qiH5d9427dhW9XmQHnmhodK1T+qEXeMvWJO1GqHVRIfmV47/RCxqQ
 Cctu6LP5fPdfrXECFk7QZFbnGe2sYzuICxtlN8YRQFA2sYJd8c7VFQDhxEL1PzMthqWV4vOHxKO
 B+92h0BlfegCWKC26t+F6Ol0xCHL6D6numqOPIjMdhQa8RCe+CKEtxUymEHdLPPgv6Q6eRV3tRa
 ATsaSvi/hY6eN29nkHyZWO5EjWaz3LlYV+2/IiEEGw5SqK8mddz6+rylY11vRvrcFwLpKy1c2SV
 P7Mjlwssxddz60pERgw==
X-Authority-Analysis: v=2.4 cv=Xb25Co55 c=1 sm=1 tr=0 ts=6a58724e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=QrhUAEvljbRiGgZU1AMA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: BnolqD5MKKvXVxtTK09mRZYwMupbzPv6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160058

Set the SPI-NAND device node to use 4-bit transmit and receive bus widths.

The board supports quad SPI transfers, but the device tree currently does
not describe the wider bus. Add spi-tx-bus-width and spi-rx-bus-width so
the controller and flash can use quad mode instead of single-bit transfers.

Signed-off-by: Md Sadre Alam <md.alam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
index 62877b46f9b3..86138529ba77 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
@@ -249,6 +249,8 @@ flash@0 {
 		nand-ecc-engine = <&qpic_nand>;
 		nand-ecc-strength = <4>;
 		nand-ecc-step-size = <512>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
 	};
 };
 

-- 
2.34.1

