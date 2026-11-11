Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794368897;
	b=vDVoINSm2BbbPorx4HJTHPV+1bmKHA4UPYLI6OHiZAI6WGLg+G8YzD4OUSN81fMiA9WF
	 grpCnHBB0vOsnKwWgzpErJB9qpR+90EgSRti/7ok73Fqgy/g1aa7gqF/IheMC6HtXlg0N
	 3VskriXdr7kJvvFOUYT+rHcY+mKYqIl5HC47+RuSEtmbLvArA3bJhpDn0X0G8PH6t78hf
	 puHa38/40d3xEp/kie7yjnaeG3S+ZPlRE+Jve+0myrZwu0KIs3ocK/GvDVjHvGf43nkda
	 3gJ5XI/5ACFpwRRRiDQjlrTeubAc4/ZVt0lTchy7FWhHdkeO8z4mlgTDFY1shGv3+zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794368897;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Y+gDBNf49rkgosutsknPz5W/PScX4B9MIdqzXnISpRk=;
	b=bAP7y0en34kuGlt3dgETAXVQTx01RT3GP1i64+qt475J5NkFz1LWkKEXj3WRY5K0YeGC
	 kqRxw5GJTWc/UboPivFzaWB9uJ6hpcxjP0/fM9UJ4k3vII4tImt9/BM/9td1ZUxX87buH
	 VE+ZjtBWaJWLwywd9NwENR49Xf9OW/ovZh7LEE/3nabAI44gxhJd53xFxJkcOZc4gngvQ
	 pw9RaNX+xhE1oW90z26aqSnyNVxb+AQ8OJLReg3xx70jPuIV6gmCFYblTfozVL97HpEta
	 RyasJCU05R7O101mmtJbn7B7S6xVDZh4HXU78MLw+GDc3XYY0TU0Fow1mG2k8ZBbaPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Z6/HxJB8";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RpXO46+A;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A62606A324
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 03:48:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10A62606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z6/HxJB8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RpXO46+A
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB299ps450399
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 03:48:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Y+gDBNf49rkgosutsknPz5W/PScX4B9MIdq
	zXnISpRk=; b=Z6/HxJB8CeO3hDq5RjUpJw3BHW73HQ+mvupRxnMpI0ECfEzaKf3
	6tnWmRJeQay2o+pZ9yYCP/ERRebUzVT8fE+uWTtpW/fcQtNu/OjKNDN9Aycgeylv
	eX8WT+izI2q/mVtiNE4+ykK/VveDiUbf7RXIAeF81kkqCKSOyRIcdfdF/AeGBfQz
	jgAvHwxhEk6bBmJTHjKS0wlWihBCWYG1IPuHchBdYQ4HiO548Dj4izOCUynm2qB4
	E3SzfGRzLO2rgJ0wUBii7IGCsfBr3pXxwgW5/fdW2FeJxT6erm/8TRObFQ6sHwZD
	+nxTgAG9rMaj2IEotuC/YDxif382UeyOjAQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawga8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 03:48:15 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso3499388eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 19:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794368895; x=1794973695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y+gDBNf49rkgosutsknPz5W/PScX4B9MIdqzXnISpRk=;
        b=RpXO46+AKeaq3sOFob1lc2ggdMtty/nTnv1gtCShI9Hd1MozF1Svj5wj1xKyObXeQK
         1V2pa0qH5J2KiXJ+yqmPy8EsIdwcdThxehsgZCPQuDiAtRYJ84OksXq29Y/f1I6UfD2t
         vVIuSaLHFRe7S6zJZLtZJ3OybSQZYpfieMSeOTVxbpQpVRNopVy9rtJinpHutkugbkZK
         dlvaBckHrqm4Za2ScwL7Zw3fsJJAJVK3EydF9Lp9X+bEKQTP8+nmgz49obQoXk24yI0T
         O7GysHJoSa1ICwcEE+Sa48Q8L6yTCQQ3SlZYTM8+nFN5BzFr0x2Tfn7phToXlP67VWwM
         LtqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794368895; x=1794973695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y+gDBNf49rkgosutsknPz5W/PScX4B9MIdqzXnISpRk=;
        b=Cvj4re02PlwBNkxSsEuF7D6yu3feJ9MjQVX5de/ltSWMABpmKEOB2AUEYqoOELEdYA
         sjcYA0QQmRTDToTIVPGjwDh1JYRFse85OTPK335AL2XcMHaaWOfkkYy2+jgsa7xmt7Xa
         WPRQtMQQdBtfF1o6f6ICjbf3cci+e4pV3iPbAIbPYV9kHTUtcG/q6/SdWzxMWn1MIlwO
         et5WtAPeRlaQPAJbT0AXFbq3bweNu9WVaWoErugclNLs25BxORFl7CPfTfZzz2yF9rwH
         8tbebs7/wHAJgg1YNRpYwfnSBEXTQvIG8Y4ak9mQlS3+D0CJx5NLJIyQHoPqqzr+74+E
         SuTA==
X-Forwarded-Encrypted: i=1; AL+hErHrl9jRa6OCHxJffoFiqdqFKc9JrhoMls7iFIeC9U4M1PrGkqsLnGmXXKQ60JtGqTfxK04eo9ANufxKcUw0@vger.kernel.org
X-Gm-Message-State: APuU4Z9gfylmMAsLCaX24jjlBvL9CgrYB0GHS5rYhZzvlS/Nd4097Ppn
	LIllbeT40OabQC39C/3gvDd3K4tRQalleGmMkdadM/PpXtt2GfAzuSEtfF0W090RupoWc2yQz4W
	AjAuaNAxrUileI3JBjcP9lUcAhDZK1U3uP/uYSP+aOyZ83VkwARjw3lXNU8k8id023ql2
X-Gm-Gg: AYBFou2/08FUPIcl6EXwmaLZ1pUHwpsyYxNVOYvpLRmCaNbS06DM9/E6cYxO+LFrO6j
	bxPd105a8n4USA0qTxz/MZT8oRauYtH9gJ0u1X5n76DG+H7dX+ltFIcmZRowjrxQNqNPDSlGwsW
	Xq2JXpSBDMwomWch+ajtCzLIBIE9b5kvbYxh9qvdjpV16OiSyP7/RbNWXpzhoWrEACI97odbTna
	FfleWlCoWMkKEhNPqtilXjqIsgCEyMquxC8DLiKe25i5UAbs6ckWl/zoNh/sBerK9z7CvctTtAA
	566/xOplQFAG52DiGLNKt6kMch/cm36kCYWxoGT6yjmnhjR2YmM/NweKplb65ad6oo9AizgV2rs
	xiYCdfFlh8jgd45npxSwHOhIwVmolFLSSKwHTTdZeyEt/r7mXC5U81QMKfUQwhq7EFHGUVwuZCR
	/EXVooO64BGyhzi8WGx4jrCbqyOyxSDqb1
X-Received: by 2002:a05:693c:87cf:20b0:376:77e6:a66 with SMTP id 5a478bee46e88-37685d7371bmr1915858eec.16.1794368894780;
        Tue, 10 Nov 2026 19:48:14 -0800 (PST)
X-Received: by 2002:a05:693c:87cf:20b0:376:77e6:a66 with SMTP id 5a478bee46e88-37685d7371bmr1915822eec.16.1794368894068;
        Tue, 10 Nov 2026 19:48:14 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751d9f135asm11286054eec.2.2026.11.10.19.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 19:48:13 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: nord: Sort adreno_smmu_0 node by unit address
Date: Wed, 11 Nov 2026 11:47:56 +0800
Message-ID: <20261111034756.3632469-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxNCBTYWx0ZWRfXwdtebBacPYY6
 vcCcMhIk9S+vB/556c6H1Orr8d0Se0h+fc0U9c6MU/J21UgQRgkXrU7ZeUV2c7dyjYi9llwmX7I
 MURtxB5mt+hPfg/lhd03cuhx02wi1so=
X-Proofpoint-ORIG-GUID: k4fQinWOFgHsYlZUquEpk5QSL96MOZHn
X-Proofpoint-GUID: k4fQinWOFgHsYlZUquEpk5QSL96MOZHn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxNCBTYWx0ZWRfX9OQnTp28AWGP
 UvZsneVSveV2wtATqxTKIETvcVhjYv8qBlnZ5f7U1tsNybrkddgXo89PqD7gttgRu9lE1MX3j+P
 pXxVIkje0OeHLngccflXcb5JoEnvHrtyXR0bK1IVgJbYpGaj+2pnhEFRL8jgT9o0MZ0oWU/Q1/1
 kqRdfuoedUmc8eTlK54l8TYyWEP9FXLB81QnBSXg3noQZV7w5LlGKcEsZuws3GmyIOysAUB4iDw
 Bo9eeVYuQRL1ZOA7Eov7/Iex+QCJcZ+JilME+lZU1KBXZEdKkJKb0TMSZeonnp83jQpuiDQSEUo
 KU1rqC13VLx+6NSCK7i3Vp5IDRDyXKcXoU8qIe2cEVEbPzO4el+Un/kZ7NUrtlxbKkgCaqpWv5j
 fdCXGVOb0WKXaAlgMbtVD2BfAifBUjM1XKQ8AhETN4Y1D8WGg/BiNuQZ00V2kMUNOeL9nYMl0OY
 v9lMJL6t95TIeptGgxg==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af3e57f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=iDbv_3reLaKZJHcXULIA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110014

The adreno_smmu_0 node at 0x3da0000 was placed after ipcc0 at 0x9007000,
breaking the unit address ordering of nodes under /soc.

Move it between syscon@1f60000 and remoteproc@4c00000.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 74 +++++++++++++++---------------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 617e5312f4c4..4f422f9e39c7 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1712,6 +1712,43 @@ tcsr: syscon@1f60000 {
 			reg = <0x0 0x01f60000 0x0 0xa0000>;
 		};
 
+		adreno_smmu_0: iommu@3da0000 {
+			compatible = "qcom,nord-smmu-500",
+				     "qcom,adreno-smmu",
+				     "qcom,smmu-500",
+				     "arm,mmu-500";
+			reg = <0x0 0x03da0000 0x0 0x40000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			interrupts = <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 660 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 662 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 667 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 670 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 700 IRQ_TYPE_LEVEL_HIGH>;
+			dma-coherent;
+		};
+
 		remoteproc_adsp: remoteproc@4c00000 {
 			compatible = "qcom,nord-adsp-pas";
 			reg = <0x0 0x04c00000 0x0 0x10000>;
@@ -1812,43 +1849,6 @@ ipcc0: mailbox@9007000 {
 			#mbox-cells = <2>;
 		};
 
-		adreno_smmu_0: iommu@3da0000 {
-			compatible = "qcom,nord-smmu-500",
-				     "qcom,adreno-smmu",
-				     "qcom,smmu-500",
-				     "arm,mmu-500";
-			reg = <0x0 0x03da0000 0x0 0x40000>;
-			#iommu-cells = <2>;
-			#global-interrupts = <1>;
-			interrupts = <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 660 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 662 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 667 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 670 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 700 IRQ_TYPE_LEVEL_HIGH>;
-			dma-coherent;
-		};
-
 		adreno_smmu_1: iommu@98a0000 {
 			compatible = "qcom,nord-smmu-500",
 				     "qcom,adreno-smmu",
-- 
2.43.0

