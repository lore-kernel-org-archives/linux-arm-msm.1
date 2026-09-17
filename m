Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519AA4DD3A2
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647979; cv=none; b=ny0mtDeweX3VDVCM+rVBXIS7iMrur5EHk+zdiRR28raZUTZNTy9aQjCntWTD39pnihM6DL/ifD89k+KNSvUqKrecPCnYjoWUpkyXg7pGeJMlQeoQuIJZj/vXlm6f7FKMKLOutptHYYFQcpRzPeldF65ftJh/iqYuqdyX+MkjDjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647979; c=relaxed/simple;
	bh=Ca988WmreFIQ+CqlrxTIVsMaOAwrubZQAJBmTnsMT8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tKiI4PLmhZDJ6Y4NHTT7fg7Eb0QRKDkDYoQir7RYw8DTJ9PqqEwNIjvTquFlYJFvKX5iWulIdQW9beFuBwJWOeLtZ7IflzaVbHVfpP47xxBjb8lAic5BRihxClOE1ILIDP8C0FRIkENr1WKimF3b4YTFkt1gYqtBix/qfroUvhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=afH5Bqte; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D3TXHrIe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="afH5Bqte";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D3TXHrIe"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZxXK1863582
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:25:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E4fGn29DtsARSFj9vVs2hWrMiIN1TDkxTUOtMZ6Ig4c=; b=afH5Bqte2WpoKdIC
	a6xCtg6u5tPqfRHO3LnylqtJz7fzZz91AQzlGqmPBDAi0zHfmhbCumyDubyW3Dc1
	0qkgbKYPnwjfAL0iuTD0fRdtq6HY4ZwAhsGbzlcdn18+9k0FFBmJi4yBiPfcw212
	GCDh+/xV0BOOVM2XMfkcs232je6MsTGyW8nMf+kSCkc8tjRS9dH4ZUY3kd6DPUXk
	S39bLncigl5PcPpGjI0l9DNV3O2ZtRKO4HJmgv2bpFLhJT728DPfHD3pRh3zDFRT
	9JZKehcBBGyY4OQMSm7yMS4t6wvOwqqbgVQfhQyqXJDnJSvPeLldFmjtV3jdiqRe
	K3bvNA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy6av66u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:25:54 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39d865b11b4so1102381a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 05:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789647954; x=1790252754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E4fGn29DtsARSFj9vVs2hWrMiIN1TDkxTUOtMZ6Ig4c=;
        b=D3TXHrIeHe7eE8aW+HKAkB7z/gJjiwtnXFP0t9jQvuuE6g07hE66XCEPoCYJDR53oN
         YnQ9OrvragpCtE4ug92cOh33JtOriHTLMQr7qykaf8a2fM/10tzALsB0hL+aDToBYLmc
         mkf4Akg5mufeIMTGohApHBUdx7iA2vSGfICoV8QVvw9325n1OIYWSKGTiO9Xj1N5uGPl
         YJOiNrAUqm2LpYU0+kusrd8A5Ohr62/cfrRDL87l5+3i1JH3VthvR298x+FtXgsaB6Ex
         2XfhyqCD+mJQGbiZbPJemBvarBvXLUcez71AnDDY01tyTcgRFGOz8Jp3EBa8fTLkz4ne
         hjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647954; x=1790252754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E4fGn29DtsARSFj9vVs2hWrMiIN1TDkxTUOtMZ6Ig4c=;
        b=Sk6E1Z2gdTz2cjX2uAM2/XAmzIG7N5s9iNCJUo3O0LwI/eRUksbal1HVIOsEEkrPZw
         P3DyxbIEkxoN4tAPTKSUZpufYj0M0Qge8cpd3ZwVVtHi9kJnxhkEVOegsPMIo/2J2BEk
         2AJsTNdLEfa6IY65dOyGu5gGElkhCp5lkBalQ8gqRVxCGDyGGSU/u2ksKpOVbCIHRlbW
         6XdTeuTr/zDO09RduOHYtmI5wQNA7E4am7ceNewN9K7ZTVkgbx2RqHGn7fjT0ETvEBGw
         b1bl8HnS2t8SenCpldWqAbYpdGjFUJ7Yvw59rKX26den/20qonuOcYM3n/XXObJj7OzE
         WlhA==
X-Gm-Message-State: AFuF++k8v4XlwDXXoNQzxDJCR7WzDBhxTK122aOMQ5ZAZ0olfgP7fL+O
	iWvFGY2crXUP0E19i659JHdag6CSF//fNu3P6RPCOSaNeMyqQIaD5xNQmlwPJnb5EdWRJc90lII
	sVJ7gR0pYL7bbLcMEFPPvmW3DyH6Jg1GW/Bc3NbbfgYd/JOzLyHA8K6gPk4Wn5F5/bvQa
X-Gm-Gg: AYBFou2s9jEWGo52QF4DyVbhoR/b/HZGR8Oxzc9F+amGLU7CB8irTqkWvAVFJUhgiCl
	fo4YCMAmfAeIhNEFyflwMAhvA3WmUJk75fYgMGwZSQUgYQ6K6NJxL2S++rlUjbeDjon5VlTp0pP
	3Qe2t06Hrl0Xk3lutuFt+5rhC6S0DFL2PpsUiTGTr7Pkj8981E431OyyASF9/UjNnqF8M8RuJjh
	aj4jL+WYhK8wdX4U7k5Hl3IEuajHa/onBThEZLyLDurp50UqYAvHWft3tvd1JNtN0gzuhXerAIP
	jUn7+FsVQ9SEgaEpiCiLTlOzojNuw6O3QXZfbAs/iWw+IJdf92DvlsS6boCzm32eXezFNKPXwGd
	/OO2y+DuWKjtGwkw04yNRRaRfZScDF4B4/fo=
X-Received: by 2002:a17:90b:274a:b0:39e:131d:4510 with SMTP id 98e67ed59e1d1-39e1e484999mr15110733a91.13.1789647953570;
        Thu, 17 Sep 2026 05:25:53 -0700 (PDT)
X-Received: by 2002:a17:90b:274a:b0:39e:131d:4510 with SMTP id 98e67ed59e1d1-39e1e484999mr15110669a91.13.1789647953053;
        Thu, 17 Sep 2026 05:25:53 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a175sm16380968eec.9.2026.09.17.05.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:25:52 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:55:19 +0530
Subject: [PATCH v2 05/15] arm64: dts: qcom: sc8180x: Move PCIe phy and
 GPIOs to root port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port_v2-v2-5-6272b7caae9a@oss.qualcomm.com>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789647930; l=4620;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Ca988WmreFIQ+CqlrxTIVsMaOAwrubZQAJBmTnsMT8Y=;
 b=7PmqhieudTFk4Q/xPklem2xAqI3hLfvCN++0G++bDxVMmf7xOWQhs4xDRQ5yxErJ1djDLtU7A
 wft4qpxQoeYDqIJF9+suraOIsejaP39broejbnqHk/+YS40OAnevfU+
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: ROPT-a8KKtp5JFP8TwFXd0sTjkIBPYhT
X-Proofpoint-ORIG-GUID: ROPT-a8KKtp5JFP8TwFXd0sTjkIBPYhT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfXylmqGN1IIaB2
 QaT7REwjaIw64/73Y/Cd+A/PcH4t6cGujh72lfkPpMWp0aS+4zQytCM24bhq6TvcjLL0k36kq9B
 4wgM8CVHrj76hS9H02eq967WcLUHd912Qg7z75FadeJSkMQtigWHrR+GBn2pu7SrwGeaPIRXArf
 QOSLD+JXZlmB9DPJTDEjE6mQPsMcnkPQ8pE+A81icqTH76FxpxNPTmLNXLhSgLhiLRneAU/jXLm
 4JN+lgogYksGFlvAMxoBOATuUQ0ejap9YGivnqtQDg9OoUNFrxm3D29+qTu4vlkOpVOccDpzUsm
 cjJazOfAhCrfpUA25CO7O/uGBJkH3KQuTxNR4K6xNqKcoNEXkbhwlKYLjdeY8fWzhh/9kshjDtD
 n6+UDmG9aI+Re/z0JXeih/djNbGZ8RyBcJ3fjZiplUtR/wpBMrH3CwkuDgRWnPekPgUtTlG7VP1
 V8U2ixvMqoFg8ijuUog==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX3dM85I4RsHy5
 rbVl7egjrrzyTmvajHJfVzMmY5A3BnemAmejXpFX8xaJfRpMu/4fu9O0oS9gWqrQ82qftGqDQri
 eUX0sb2nLZ/omOjsw21HgKPhBNGCB5k=
X-Authority-Analysis: v=2.4 cv=VIRIDNPX c=1 sm=1 tr=0 ts=6aabdc52 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=-yNNrFuiOvHClSI-D14A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170174

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys and phy-names from the controller to
pcie0_port0, pcie1_port0, pcie2_port0, and pcie3_port0, adding
labels to these nodes to allow board-level overrides. Move
perst-gpios/wake-gpios from the controller overrides to the
respective port nodes in the board files, renaming perst-gpios to
reset-gpios to match the binding used in the root port context.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts |  7 +++++--
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts        |  7 +++++--
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              | 24 +++++++++++-----------
 3 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
index e6ab523d249e..aa634a070283 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
@@ -491,8 +491,6 @@ &mdss_edp_out {
 };
 
 &pcie3 {
-	perst-gpios = <&tlmm 178 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 180 GPIO_ACTIVE_LOW>;
 	pinctrl-0 = <&pcie3_default_state>;
 	pinctrl-names = "default";
 
@@ -506,6 +504,11 @@ &pcie3_phy {
 	status = "okay";
 };
 
+&pcie3_port0 {
+	reset-gpios = <&tlmm 178 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 180 GPIO_ACTIVE_LOW>;
+};
+
 &pmc8180_2_gpios {
 	bl_pwr_en: bl-pwr-en-state {
 		pins = "gpio1";
diff --git a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
index 327dba55a5ec..2311c5fb44e4 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
@@ -592,8 +592,6 @@ &mdss_edp_out {
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 177 GPIO_ACTIVE_LOW>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie2_default_state>;
 
@@ -607,6 +605,11 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 177 GPIO_ACTIVE_LOW>;
+};
+
 &pmc8180_pwrkey {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index de1b72b64d96..a85e3211958d 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -1779,17 +1779,17 @@ pcie0: pcie@1c00000 {
 					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_PCIE_0 0>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
 			dma-coherent;
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie0_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -1898,17 +1898,17 @@ pcie3: pcie@1c08000 {
 					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_PCIE_3 0>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
-			phys = <&pcie3_phy>;
-			phy-names = "pciephy";
 			dma-coherent;
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie3_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie3_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -2018,17 +2018,17 @@ pcie1: pcie@1c10000 {
 					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_PCIE_1 0>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
 			dma-coherent;
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie1_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -2138,17 +2138,17 @@ pcie2: pcie@1c18000 {
 					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_PCIE_2 0>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
-			phys = <&pcie2_phy>;
-			phy-names = "pciephy";
 			dma-coherent;
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie2_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie2_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

