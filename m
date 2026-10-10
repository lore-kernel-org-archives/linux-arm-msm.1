Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30B83C455C
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 07:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791617322; cv=none; b=aS2L4IvRq692szyaHZk54wFJARj3nPZcDxcQEXfPDMMxtl0vGfOae/pBP76H+Wk2XCTl6qw9y7kY/MN9Aap92NFbsgTx8Vd64peOrHj3NRbvVMblOZZB867fUIIVwF/g+RokrvqWPEbTGgnk+HBq+xNMeWapXT4RJZd2XqCDtRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791617322; c=relaxed/simple;
	bh=2PycBXGVgY3RND2Le7tllKHiCDXfQ6uF7dvtV7xvn3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BzuQR5NZlMuA7ZiMLad1+loEdEdEMmW0zCaStq++sTNXdkKNaoS6tndMP/L8cdiv9AS3tQ201USbv5AKSsgbT9SyttgsXZ0JS/rpFcROOEgHfBTYw7Hl+b37fiH3fINsqII4vKjJHPvlwLYH6R0jjZ1qfozW4V9zDegpEZxT9hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eulm5Ywj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DthkVwaX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eulm5Ywj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DthkVwaX"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69A3jdV32721781
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 07:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=smQofM0ibfRg3eH0rWIrcGsuuljAa6Fkfhn
	c4jYgCRU=; b=Eulm5Ywj/qYoRQPXprkEDtzzVbkJZODnFA6lvz1M60E+Di+Y8Yp
	BgRYhxX+ak1g1yd9gzyWfiufV0hWOLmOX0SQtWJi0Ipuf8noNDIAat5ANY8/NTvb
	dzhTjcfzerXiBedObCbZI/05elQc7hngwQYOK+d2UVpjQvjEq/llD3aALKIIc1zH
	E86SFAOWWa6nZ+5ZPlE7mz8OHTMbf2X6TGq9FAGAztlnATZhA1zV4DWyV0op3Yhi
	Lb58Vc886U1dUjLs43x2f+tQC5keHFHnPI5FPwYr0o5tdfKSOsQp7e4TMbVoyA2T
	RLp9CExa3RMXmE9ZeFpxx026hMNW8wFGUAQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7dr7ge9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 07:28:39 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so1225817eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 00:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791617318; x=1792222118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=smQofM0ibfRg3eH0rWIrcGsuuljAa6Fkfhnc4jYgCRU=;
        b=DthkVwaXjcegH7eEvEap2eIZCLOdW9Gm9b2NYncWAwlODT8LZypHR8li4cBf/SwvER
         2wnlmN2H34Yg9GJ+c1SOFNLBxlOaOhEtLROM6KfILiBELMfNjK2jo6kf6/91et0nbG4x
         QV+UmUZTa9zKQfTRFMKZbkS+dJ2JDgCPNH3Dhfus9/eKnOk9gcA8o+veS1IXmCREoyw9
         DVZ68ogmesGmovt4GG6qUgdCNQqE8dpZme9mVTtgoh3DCsfc54WRjjvlmlTIAOHgY6ZU
         r7fenzTVq+Hc0gqMVy7V0SWKYDLxz7phwlBbuDBSeZRRlyJUtt0HsF9Lj6Ocm3YmBpyq
         xjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791617318; x=1792222118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=smQofM0ibfRg3eH0rWIrcGsuuljAa6Fkfhnc4jYgCRU=;
        b=1MnJSWsL8Ga/Ce6v1HxhEZ/qMFkYS3+04iGjJjwuzD2yFpfDkm560xzGTnncNEDhOt
         E0LVc7ZpkaiUz9SmGzfqC66NdzDLzGDJaF28k+H+1/dxMqxTf9RBLY3zHgaCte+lm+lp
         XjosanJJ8mZD0Vf980pvxOU07OC7SwdIHDNx0YJJ3x/Ocf5OuoC8y97Be2rMwfBJT2cT
         ruzHsRL5giIrah4GvsAVa/XhWGyPAEvOnSIoOWWit7x2JBabIkaaxT9tmhGXAx746tjV
         bOn4E7LMvgW5hREDQFg8VGIx7Me11PZuBkTEJzyKSZC0DjV/qC/FlkpYyDX/C/5eWBfz
         28fQ==
X-Forwarded-Encrypted: i=1; AKwUvByn1TTCc9O5LC0bMfcGUNHDDKa9fhf2epcSAaNKir4WYjKAfJqBGwbxJDuDWg1iYJfTzngx9VeRbxgnBrFg@vger.kernel.org
X-Gm-Message-State: AFq9FYIyDZ5D1qOsATdiLKbsakMNJNb0FqXI/Ktc9aVBgPsO2L9aTBH+
	Uj7E8GWtswnJ3Zftku1e44dWWKHMCA7l1AMvL1+sp6cnDlTB7x9Ktms59x1erVhUNLk4u4RQCX4
	vaLrn5uRE6yzqGnyCe8J9DiQRE93VfkutkKHsR16cyOLxPKAAfc89lWgylplFCR4B64jW
X-Gm-Gg: AYBFou1Ch/vl83/NlOUkj+NeMsjxh2DUsEoNxfCQR8KQa2EKM6SfJ6/yPeyOL6xmBXs
	2Q+ru0MjqLcs6kfwMYXB8+X5kRIfZCBmXbzSPyImn0FMp33lU7A+/83eA7IW6hIbk13pYeHQlbY
	sz+4emDoY3LfOg41HTDT8t/9KlMnl7v/aimPEipKM/zpWpgUdHlrYbTfr+b9ZA/URi/695kB83S
	b3HtzBt3f52nWpLtZZ5L6/d041B2g6ii4zEfWjR5WpadXnjMVX5/ETDHztzpAK6ixqdl4IDkyg7
	o+BCXKb64LbiZbWbBG8MHxsy2MUKhXfnN5VPy6vgSojZDx24z6E4Tuu05FHaJcNr0pojHfE7MEh
	FxXAoP+s+YR7fJrE9uG7VZ2cFfbRAK/BcsN0jxV6aCP6BHhisn1I55lz1QU0=
X-Received: by 2002:a05:701b:291c:b0:141:4951:f150 with SMTP id a92af1059eb24-16a5ea5d6famr4950721c88.18.1791617318206;
        Sat, 10 Oct 2026 00:28:38 -0700 (PDT)
X-Received: by 2002:a05:701b:291c:b0:141:4951:f150 with SMTP id a92af1059eb24-16a5ea5d6famr4950681c88.18.1791617317343;
        Sat, 10 Oct 2026 00:28:37 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a2d2db98sm10712985c88.10.2026.10.10.00.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 00:28:36 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3] arm64: dts: qcom: nord: Add adreno SMMU nodes
Date: Sat, 10 Oct 2026 15:28:22 +0800
Message-ID: <20261010072823.3952417-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: le_2jUoMy2CyN58fYRgPOmTGn2H7PRIB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDAyOSBTYWx0ZWRfXwnNgjH/ztmMO
 3dhmB7AA4aQ01cGPP/Q9LIaY4dwjat2rW+vb92ijXKjEBJhETofcLs3rppW2hYRmxR85kz3zn27
 zOXpAvR+Fg6JHLuGlFBt2Jfi6Q2kmIc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDAyOSBTYWx0ZWRfXyTHDtQkS0SmG
 DlR6oflZo3Qb4/hmS5Yh4K7WUadGWort+5CE9VxyS3tH5qLzjqCN4uRkaIwtaPjuCk5z7kPgm+l
 LLBilg1xMS35569J/aN1WKu4hp0uDqB9zMO5oxIaT6Fgce6WQ76zPbfIeOhw4YtwDwyy0ykn0rV
 DpkbnoC1vEZmV0ha08lSl7d2bZT5nhIYB5ss6ePrE1pS2bwDD5N4T9lSK1TWDUkjuwoyKKwfgRw
 aNPbzcFsHR8/CpW3U0moz37aazv0xbp126evxG6+zSO5zooaYX4szf1BIPaT47wrIPEi2g3ejXc
 yDi6pqw6u2OypqOT41N1laZIh7XsmNfjij7BEdXd8gGoCbRFk3X1yOlb7A5ngE1SSBrmHwx9yHp
 4HYCxL4N9tf62NOCxuwXxWmVlJUJ2INwCle+49Vp1B4AGKvO/ZqcvozgkhPUf3imFqEZhWv19Dk
 6swVwKFxfuBa0/Gj9Kw==
X-Proofpoint-GUID: le_2jUoMy2CyN58fYRgPOmTGn2H7PRIB
X-Authority-Analysis: v=2.4 cv=asknmiZV c=1 sm=1 tr=0 ts=6ac9e927 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=PBtlRvXRUDiLbXfjrAwA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100029

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Add the Adreno GPU SMMMUs (MMU-500) for both GPU instances.

Wire up the gpucc clock and power domain on both adreno SMMU nodes in
nord-embedded.dtsi for embedded Nord variants where gpucc is available.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes for v3:
- Wire up clocks and power-domains in nord-embedded.dtsi
- Rebase on next-20261009 where binding dependency is cleared
- Link to v2: https://lore.kernel.org/all/20260924084805.1021758-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Fix adreno_smmu_0 interrupts, 673 -> 674 (Thanks Konrad!)
- Link to v1: https://lore.kernel.org/all/20260922111354.533902-1-shengchao.guo@oss.qualcomm.com/

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 13 ++++
 arch/arm64/boot/dts/qcom/nord.dtsi          | 74 +++++++++++++++++++++
 2 files changed, 87 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 1ab7d9bc3cfe..867037e1a2b9 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/qcom,nord-dispcc.h>
 #include <dt-bindings/clock/qcom,nord-gcc.h>
 #include <dt-bindings/clock/qcom,nord-gpucc.h>
+#include <dt-bindings/clock/qcom,nord-gpu2cc.h>
 #include <dt-bindings/clock/qcom,nord-negcc.h>
 #include <dt-bindings/clock/qcom,nord-nwgcc.h>
 #include <dt-bindings/clock/qcom,nord-segcc.h>
@@ -34,6 +35,18 @@ mc_virt: interconnect-mc-virt {
 	};
 };
 
+&adreno_smmu_0 {
+	clocks = <&gpucc GPU_CC_GPU_SMMU_VOTE_CLK>;
+	clock-names = "hlos";
+	power-domains = <&gpucc GPU_CC_CX_GDSC>;
+};
+
+&adreno_smmu_1 {
+	clocks = <&gpu2cc GPU_2_CC_GPU_SMMU_VOTE_CLK>;
+	clock-names = "hlos";
+	power-domains = <&gpu2cc GPU_2_CC_CX_GDSC>;
+};
+
 &crypto {
 	interconnects = <&aggre1_noc_tile MASTER_CRYPTO_CORE0 QCOM_ICC_TAG_ALWAYS
 			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index fdbe290350dd..147d8e595a3a 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1523,6 +1523,80 @@ tcsr: syscon@1f60000 {
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
+		adreno_smmu_1: iommu@98a0000 {
+			compatible = "qcom,nord-smmu-500",
+				     "qcom,adreno-smmu",
+				     "qcom,smmu-500",
+				     "arm,mmu-500";
+			reg = <0x0 0x098a0000 0x0 0x40000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			interrupts = <GIC_SPI 932 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 936 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 937 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 938 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 939 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 940 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 941 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 942 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 924 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 925 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 926 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 927 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 928 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 929 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 920 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 921 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 922 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 851 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 852 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 853 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 854 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 855 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 856 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 857 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 858 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 859 IRQ_TYPE_LEVEL_HIGH>;
+			dma-coherent;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,nord-pdc",
 				     "qcom,pdc";
-- 
2.43.0

