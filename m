Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7BD3E763B
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 08:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789894190; cv=none; b=h+P5VVGQTNyqae8XJGakc2cUp+PyJx77556frSpmctMxrTHrRuw6/rQsKP7lxLP5WBBTqJMtuZwhS2mevjzVFBRQ0bxTJdHsDwIfuIg0iyEKingHJjcidEzIx924xOq0ReuKBl9DpScProuJejKwRzXVXZHB1oQNvdlre5r4jGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789894190; c=relaxed/simple;
	bh=K0mrV3SZdbvnKcSQAKh6cACwu2vBqTk7IkteI4rnFIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DoC4RTuSvZxr25a74GeQqCakrygBjlnoBg5WuY9/WKHzBuW6PwPxjmEe17kbg5mXkhOyOXLvF+WY42YJyFGncPh3JiJGZqXQYj7NuyC+e1p8yAYXCRUqUXaUuy9bRjew7bsGvxy8mvsF7f694gMcxzgVq3IaycKUS0+n+L19fpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fXTsNg0f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eORNnNbu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fXTsNg0f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eORNnNbu"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K8VVIQ3047625
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 08:49:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xe6HhPLEn0w
	3R1ECXKMEXuVbXcw/o/+tTan1PrIOEhs=; b=fXTsNg0fEf0UGZ1Ku134oUxxsNG
	5l9UJpCHTBEfpgFi6u/ASmCg20uiQH3UG+mwQsU/C0NpGSyrwQDMl0ZVSLkg5NFV
	POJgwe2D01ztZ/7qe4Z5I+9C+ONXW8AkakbINJxRyc6vNJ1PFu0G+64eI7tZSLd+
	AimEk5uXykq0pJiZfw1yT7mkZCkCEajbIzibTihjZAqNqfuzu8Ozz/SOYquGLlNs
	uKBKY6DwVr3hDB3dHyGDQT2JJPnuBu/uNh2Y2tlJFeXD+aGuFRuwhs4/gxOWe1qO
	jYyzruQNkcHUXewU4LoQRBFaasBSySStXwMlFvJ8SjrNl1DAplJePSHC8uA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsg3f2yhg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 08:49:48 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39533bb224cso4136371a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 01:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789894188; x=1790498988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xe6HhPLEn0w3R1ECXKMEXuVbXcw/o/+tTan1PrIOEhs=;
        b=eORNnNbuRTffWtLD9QOY8muw8SPIQS3YX2+XXARbr807eZeXyUUGcxW3V8Mb3wUrW0
         pW5OzWx180cVrE4xzJiwVlilelsZqn+exA3u3hviTm6pRx40hZfyIFjeQP/LcbR0p0FM
         aNhZBjaMCp+G7NJSCT0qgRb4qn2V5IS9M4BTJcdr4x2MlGJuFxvLr+ilR45QpdwkGZ03
         gmvfFcQA3dBZ5mNrg9B+DdwLEHaOrYbH9xkVrHJrAVRn1EyBnXcZBnhIjfxQvADp8Qtp
         0Qh99j/JHNY+8O4OCAPdVWN31hRiKnrP5c9ZJRZk3+n50KsNTc1MDOS4H5pLxHCpw1Iw
         WNCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789894188; x=1790498988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xe6HhPLEn0w3R1ECXKMEXuVbXcw/o/+tTan1PrIOEhs=;
        b=HHRNwKfcqcVN84WuKf1/laxEz1O/F5EqPohb4WzhQXZhaL0yuh6r6hB5pVOVIha+hg
         5lxGJos4PG9n9io4m+44PCwAz3qAZz1Ymmm+IzsBE+wEssgenA5eSTxyYBKprYdxbT58
         uzjKh8eBNweRAwRSPREh0fRo+ZV1XANOfxqjJXxfZDp/citgOBfbH6NMkTr0Bw/M56hj
         u7g3GKGH7Q7tgcdSbSmRqev+UBHcAB+7jjowq31PLh+jY+16bvHrYx6ib/0J/zrjuDKL
         5ySq5mfPqYGFT7rnqvmcxjchSdCJqcPZVX6bReX5nqS569YcSShZYZL/peYok+Kaw+va
         1DRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQcBtBLoGL3hm3Ogx9zyVfoOaWS5LpJ1wXsxlbLuITPB5JN+0Jh2fgmS7h3S8tLV9tQnSd5EnQZaMBncut@vger.kernel.org
X-Gm-Message-State: AFuF++n5S8GgheJCk3o8bt4mTUM/jtZAiCGYSpPcZQBbOyfyJxHkkcel
	KxrnsNWCtlhSHhbgT2fRoduF2jsn7KJRxnWtbUQBqqar54gyqSTtiCsIVnmPYCal55ye0ZrVEa+
	DYrfauYNLAEjOMpzOqlk2QibB6tkCsdgunzoccXiMGMlp8x9oT0v93LWV5U4LyS8ZbI6q
X-Gm-Gg: AYBFou1dK028YHILt2jLiiMmEWR1Ybg0e6Qwmro5NLlqJhxHk+gwJlMiSWw1bpSXjLj
	I9ODg0UxDUwGjh60NbUGz+GrevjYsU/RXXQAr+oe7aHQOeKrQ6x5KO1M/UeAjTDnKhnAyC0DCx5
	ejKjZJMjdmJWWSUYpdNEGjOlzBFMnjJKmhZe5soHLR60mtS6mMfk2JiDTJZX83xlnMzdEL+BKMi
	pAtA5Aer7jVwOmJCS+9+SvFL5oTkF0Pr9Co+8j/LjFEUOnJvfxrhaCGya2rcnjPsrCMy0Sg3oUj
	cANWpyz9hEV6HJpSoU2RXLU55OVUGPjox6v3pc/GrVOCbzCD7ezPeTxRLm2gbkf3ja7UuqrFUsF
	ghHGK073GIpFwW+p2EvHS2eEmq/lz+ET9UVDUF61wC/aEpO1/GTgdO1s3uSf5
X-Received: by 2002:a17:90b:4ac7:b0:39e:6c6a:4b6a with SMTP id 98e67ed59e1d1-39e6c6a5812mr5559929a91.52.1789894187609;
        Sun, 20 Sep 2026 01:49:47 -0700 (PDT)
X-Received: by 2002:a17:90b:4ac7:b0:39e:6c6a:4b6a with SMTP id 98e67ed59e1d1-39e6c6a5812mr5559913a91.52.1789894187207;
        Sun, 20 Sep 2026 01:49:47 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3314313esm11180808eec.14.2026.09.20.01.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 01:49:46 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 2/6] arm64: dts: qcom: nord-rrd: Enable ADSP and CDSPs
Date: Sun, 20 Sep 2026 16:49:16 +0800
Message-ID: <20260920084920.2201418-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com>
References: <20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEyNiBTYWx0ZWRfX7XsuCyzNAQZe
 +oMp1CUTEFPc32+hKO5scYj5jJOErdJPocfI3Mp1P41cADyDoJfvAuMNzWj4d0z77q3xS11b0DH
 wrQlmVJuOq5/pXgWra7YH6FvcimStow=
X-Proofpoint-ORIG-GUID: 7qUTO1bGvIJW8az1DGSPVyuM5dYlJLCm
X-Proofpoint-GUID: 7qUTO1bGvIJW8az1DGSPVyuM5dYlJLCm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEyNiBTYWx0ZWRfX/EeeXzKrPbUi
 p4rpQZA0ZdzEGLHBn3lqiWA5RR/w3cOwglMxUKce9dQX4vcC5WvSnkRX+8xgerrO9sKFczb3lnl
 LjWgefOxNl0bY7wgNoQHXqw/A509fbszdPQguqRJNMNJVAWNWpfukBzeuWh/MwQANzEr9iL/Xxj
 hfq2tBRAppc4EIZD35YfNPj7TPUzmL9ZS7MtIIhhGhcuzFmxOkqrwywPrKxMrHE04LsKZIPUj07
 h27BE6kfZrHkNypyW4+ZSP+yFcj4UaaHzkSHJ2QRyvP+CSmopaowfdVExlstn4jjlJyqDQ6nWpm
 AkHq8d+TcN2cW2ELiZ8AbGVhZGNobhMlG28hXOKr9V/ZwuH/drIxTb0LPYpMO8XeO/pPobCo9E+
 Qoy0Qpkhz6Q3T6qoOAN7ntd09Lz/2e/y4NMp3V8fEY7lQzKQbK1LOkFaml4HQFygvMj1692rtZ1
 ihr2EZ5NjN7w9hzpLbg==
X-Authority-Analysis: v=2.4 cv=N6S8hG9B c=1 sm=1 tr=0 ts=6aaf9e2c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=UZuJur8GfllDSyYqWHAA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609200126

Enable ADSP (HPASS DSP) and CDSPs remoteproc on the Nord RRD board.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 35 +++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 3673003c8b21..e4c3aee441c2 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -393,6 +393,41 @@ &qupv3_2 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/nord/adsp.mbn",
+			"qcom/nord/adsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp0 {
+	firmware-name = "qcom/nord/cdsp.mbn",
+			"qcom/nord/cdsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp1 {
+	firmware-name = "qcom/nord/cdsp1.mbn",
+			"qcom/nord/cdsp1_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp2 {
+	firmware-name = "qcom/nord/cdsp2.mbn",
+			"qcom/nord/cdsp2_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp3 {
+	firmware-name = "qcom/nord/cdsp3.mbn",
+			"qcom/nord/cdsp3_dtbs.elf";
+
+	status = "okay";
+};
+
 &spi16 {
 	status = "okay";
 };
-- 
2.43.0

