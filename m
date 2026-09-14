Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F330A3ACA43
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370404; cv=none; b=i7QCLxjY3K9C93job13mwWZq4p969hsCM8O8Ej4HXj+EN+52RkCXN91G6cRy70dpFtxyfogMwqYQt2LS13JNfpP9OY/OFa62PdLL7rTXvNOP+z3jPse4794XR7ETmlSh5fdoQN1gUtSwGs4ogSFkrI3DjOtb76OK0ANnlULX9qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370404; c=relaxed/simple;
	bh=xBXaXKswi0tOC49YSVUC+rFixivgxv9Vy7GoDmsFlRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o2EkqHcgx8MNH+L6huubZPrb0k341aOLYvhauwhJQoRGTn312VmoQtl1fxb8SmYcAG5DojGwbkOctcNhH1uubNSCKKZnh8ZTTpil+CI/ajf7RjL5QjxnAFHDrKeEUBUm56tkveGLlgPS9bhBZPlU+DUtDIw5+/J5hBrus/CBv5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Um9FAkeq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LS+QY3I9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Um9FAkeq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LS+QY3I9"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5iZ2s3127227
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:20:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xHnl5jCulcF
	OEFeHoTchr2pssjCFz8/VrrGjsXLHwQY=; b=Um9FAkeqi4WCS/9rTMM6tw/HDCz
	uxaCIX0DKK1mO8t85fbpHQ4RlUx4gEFQDm7mHEUZHkofILdVDZpJSd78fXZ6C+1D
	MFuNFNU6zK3R/+gbJb6mcom01qefm5L4HZkHiTZbZCf8rsdxvLuH6OYeTTqyMiEd
	8Rzgx1Zai5Wrwndk6TDqZobYQ9REVGqEkkzYD4CEdBFJXHpBcOzRxSll3px0ay0C
	XatEck3CGdZ5MlQ3m5L25Pt73E+JTM/uYBrHi/wm+9aDFEJL+qURRhF5OqZjNhfx
	EIfWGMSBlksacutctQFGVSiPgl+cy7xedllyFdagXLfJ6lmPlyySltNBffg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gn018nbfj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:20:02 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so3740242a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789370401; x=1789975201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xHnl5jCulcFOEFeHoTchr2pssjCFz8/VrrGjsXLHwQY=;
        b=LS+QY3I9OHmxLw5Ae7if7k6CCSFNd0dm6g64gu6EcvC5eSvH3jKXWsGFE1c2nuPAky
         7+M/2QhZUlawpGw0dzFw0rGcPwG75I6V+g97ZBp65kgcRmJjOf4saykiNMJ/nwMPDbW4
         BO9m9SZUyzeh21Cv8XYusz1A3vaypv75xESE5RAruY12P008Y+mgjS6VEIyRGDvuVWkH
         ++1ttuQKjTNZNemx6+LAMHJU/8OIo+p3vPF2iFtbdj/KYqiQ1qrvZrTAp0BG29KucQWa
         1Imwly+0Cb7XV4oYIcsi7YAgjMEMa8l2/YAbqr3XXw9Sa8bU4TH/3KXSodVbrP+9Q4f3
         qS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370401; x=1789975201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xHnl5jCulcFOEFeHoTchr2pssjCFz8/VrrGjsXLHwQY=;
        b=eXZl/8ekCGPLvW++GGKJufrw83JQ5pi2IXwTc6ntAYJFdz8WWPcymDVvbT3ewWv6lh
         AhFtGbKBs24c0/CyKAWWSDwciXbJ014jfMLlLucVZ6P/LFApxlY0TwoAr6lBGPETR7Gw
         luNou2fO1kqPtJwxSHoN5c+MWpgWIwA+wdThk7LqWtxotabRJUL6uqSxTiTbJ71bCw8s
         upSItCNBZ/ntjCsMQ8NA5DVSDkTgNbTMrNNCDz4YjSDOgy4UjT0TIfzbynLB+8kdbJan
         +NQxVNBuzFfyZaTEmK7qmChZvZ/QKtLIh0pXZoZjWUJPJpEy2C+FhV8TRdDRW3EtFm9P
         xeKA==
X-Forwarded-Encrypted: i=1; AKwUvBwzxcblQO4J03LXz3+FzuT6R/78tiZRQUsnsNnTZ/C0xN4hpwbCUgsZ2KGku9L0oCe2E4tc3J73oItSKKJ9@vger.kernel.org
X-Gm-Message-State: AFuF++kKLDNmdk84jQppxmfsGZijlHOav6RNEV7ZJn+KqdPA6I/pKgdL
	Eru+qF6JCIgpfu/DgshFP2s/BoOEtGjj1zzn4/1b4ku9Xtb6Ldvgf+Clp/r+uHTaDTbmgnpZrSP
	MeqlQK02mBf6fpOfR08j4lVsih2uSR4J/uRxqJZVCRaW8PvQ/MqCg92x7V9IXp+zYHWad
X-Gm-Gg: AYBFou21LRITaRTOpogM7qodzW8jAyLmyeJcSROvgLglChBO0EYBzS9+kd2h1DciTjC
	vDJvOhMPg/uhgo/Cbkb2JHM1w3A7K7l1uaXw4KQzhpyPwRqjuWFqIGSBSaIdE2xERhUbbiJ/xpO
	Gbv4JW0FZ7m9tIY2kNVineEQuyPBOZYeeaTGi4QowpdENblxookaHQBFS+mMfL1UYqm13yjge7g
	KAOIHn0E+QQlArMY8XuZWyHfCGLGnujUbKWBf5MmdULpwZYb1udLhzs2JU2suJjMHZDDzYM5E5U
	bLcM5vp3PJSikr0aL+2m+QDPDG4mvyTtJ6oUvJs1/Z2ohGZ4ef1JwAtKU8y0dgM2Q2qstO1Sx+N
	8mM8ymPDecGvMXHZhqq5tZBhKtatPGgFxfcAj3DrW63T5hMMI8nFJtvuHv7RL
X-Received: by 2002:a05:6a20:7492:b0:3d1:e510:905f with SMTP id adf61e73a8af0-3db4039f84bmr2768759637.1.1789370401415;
        Mon, 14 Sep 2026 00:20:01 -0700 (PDT)
X-Received: by 2002:a05:6a20:7492:b0:3d1:e510:905f with SMTP id adf61e73a8af0-3db4039f84bmr2768694637.1.1789370401004;
        Mon, 14 Sep 2026 00:20:01 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bc03778c7sm14782238eec.9.2026.09.14.00.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:20:00 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/5] arm64: dts: qcom: nord-rrd: Enable PCIe controllers and PHY
Date: Mon, 14 Sep 2026 15:19:41 +0800
Message-ID: <20260914071944.164217-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914071944.164217-1-shengchao.guo@oss.qualcomm.com>
References: <20260914071944.164217-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c4g+0h9l c=1 sm=1 tr=0 ts=6aa7a022 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=f6-OUQb2phOXiqkgZ7QA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwMyBTYWx0ZWRfX5Sc36f5AaMj4
 HsENStmyyRst01WtsjAqkZ1s3HIsAILOR4gti6xjqqyM24pfETuVDb9XoPlfjlSV2U7mESZ7Ke+
 7cejXGaoU1DQxu4qzvB0HIXz9a2JoI0=
X-Proofpoint-GUID: sywm4rIqfpgRMJWojYZSVktxECbmcT3M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwMyBTYWx0ZWRfX/cP1HjC0cytP
 kmB+UYylnopbYpoviB2ynyrDxKuZnIAEI/azWW8ENAelfw2S59qTj7caroYkUaV21PoQSJOrtbl
 xoOBw77WR7mRImJjHiilr32lkMC7AQpTddaRio9IVjA5tUj4P8hOa5EjdsUAHeKHZpgkb45P8h0
 FUS4wxtuecKn/eCxjGe9J8wZL4wh10OL+62wAjL/iADJx2KE3P53OOG/yyEfjl/odrAPpur0BZ0
 oc/pcTvuD9vFES1M4A1ptu6mjmn3zl3Faz776+bnNTD+45RwaWj/jz2od+2nggvLaWyuLv3DRjy
 /xkDa5SfcV9nO/8uFvfF816Rexr5I2SxBY9s5W1ZTrfREueVMot1AZ0fWfViYMRtV2aPR8dXg+w
 LRQAPo+tYPQ3svdCrio8/ZmNSu3c5MlHNM87TvcOkyphQ8bg6xsnPQqqJnYSDt6jVtTeA1w2zsm
 S52B/U5jOTwaXG8t+mA==
X-Proofpoint-ORIG-GUID: sywm4rIqfpgRMJWojYZSVktxECbmcT3M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140103

From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

The Nord Robotics Reference Design board routes all four PCIe links, so
enable pcie0-pcie3 and the QMP PHY, supply the per-port PHY and PLL
rails, and describe the PERST# and WAKE# lines of each root port.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 49 +++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index c547963371b4..4c4d54d7aa90 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -377,6 +377,55 @@ rtc@32 {
 	};
 };
 
+&pcie_phy {
+	vdda-phy-a-supply = <&vreg_l6a_1p2>;
+	vdda-phy-b-supply = <&vreg_l4a_1p2>;
+	vdda-phy-c-supply = <&vreg_l4a_1p2>;
+	vdda-phy-d-supply = <&vreg_l4a_1p2>;
+	vdda-pll-a-supply = <&vreg_l1e_0p9>;
+	vdda-pll-b-supply = <&vreg_l1e_0p9>;
+	vdda-pll-c-supply = <&vreg_l1e_0p9>;
+	vdda-pll-d-supply = <&vreg_l1e_0p9>;
+
+	status = "okay";
+};
+
+&pcie0 {
+	status = "okay";
+};
+
+&pcie0_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
+};
+
+&pcie1 {
+	status = "okay";
+};
+
+&pcie1_port0 {
+	reset-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+};
+
+&pcie2 {
+	status = "okay";
+};
+
+&pcie2_port0 {
+	reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+};
+
+&pcie3 {
+	status = "okay";
+};
+
+&pcie3_port0 {
+	reset-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0

