Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C736498933
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046994; cv=none; b=OsmeFvnO9vvzz68CIt3W0Vqs9IA/lIkXYzoZP31w25fYayBQTM+7NIlWau8UUqJR//r50ZfUWMVWc10IwIh1vX80Igtr73efFsAAJSUyhKvEV+uxX5BZqDnypb+pY3kYlWlAKB2s3BgIyfHwoa5EvJg9gQjU3juvGyqfDH8LVDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046994; c=relaxed/simple;
	bh=ng6TQ1j7rHwm4b9vMxs2nVTuvSLo2hIPKE6L/BFFWyU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FVgpr7Sxh93xKaZZoxcszibLkpIJh0fM3TAo0r8Mr1riF+NTBRvAnP4AmxaCF8tHK+4Gt2nzOkWyn6lNAo04tD5xHaaXNormPqsT9Fbt7xZ+l2r//qPGwRxrw0ERvLQcQdX/himYKqxuX4UQDOIk/Lar9c7LQPr2TSyOVGLO4ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hM2GHJJ7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hmwlf++k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hM2GHJJ7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hmwlf++k"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7jRY383777
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7YvPDjrE0Zw919WO4u8p1i0IUcn9rnKEqMngr+HAO6U=; b=hM2GHJJ7m2zXjgET
	lJ8/Wjgi3xwiE6lm9LYvk4ifITlzfnqWykzDIiABteRF6tbNEWFKzGx61bl1wDcL
	1ntp2O1aiKFFKt3xv2OmDHHgbTKf3w3Qxh/HHPhq1QypWIyy8rM9ZopsKcMtTxzn
	iOXR3KNnmKncBjQPi+fxQqzEk4JTVQzi5/5zczCEjnxhUi92fOYblaaPEcrrmM/6
	PGVYJW/z9W5fyWbKIlw7mW3OU3SgB9Pys6nZs/cm1nj2jcaMteJWLS24iCTxVe3v
	lGV/ou+04v9QEyOrpl/omJirvQ6bB/P4Ln32z1KmZ/05TPGCNBhpx0BNVVbkiBsS
	M1Cwig==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydv02k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:29:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39512608fb1so15069151a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 06:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789046992; x=1789651792; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7YvPDjrE0Zw919WO4u8p1i0IUcn9rnKEqMngr+HAO6U=;
        b=Hmwlf++kd7dKUdvPmXcbmy4OnEyGA1xzHCNpgy/6qlN+Wjq+s5WcHyqGVWTjjXLKMm
         ACOGsEFmog0rYnhC9VvBPEUfpSSt5LD4yxfEFJL5l+nHrEIZW+ZuBz/ngydc3ZgNN6SJ
         FvqIYo89+ZbGalBdEb3xHsLEW+LPj/x6yA4S1l0ntcDYoNOk3VT2HGx2vlOsWItjJ2hL
         xdO9RGF8JxNazZgez6sM97yHYSM6PftTrhUWakosDQOY0HbtshdYhUAgKx1usMau86l3
         q/nRiUjRz//8LLW/4BwijRLA9oUuvT7XH1f9hPVL2FKZcMts9HAZ7s2hXDDnGl2waYrk
         AglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789046992; x=1789651792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7YvPDjrE0Zw919WO4u8p1i0IUcn9rnKEqMngr+HAO6U=;
        b=WWiK+Sk3ekHwGMaPaDZSWYwJOLGSOtTvybKk/25q26m9UtsgOyArwTyPKIluZrFmb2
         nhtjGJXO6EVE2xkFPQzlvx3py+CqoAAMYneWSBczcO9bpK2omAGeuP1un8bBZiGjjQGT
         +dLjKPz0+9Pv2Y/8nI2jKP0A2+c1krYQCIAAAr/1cJBU9qmqqgVnjb/GCvymx2bHFEda
         NHp/x8UbcU3eLZ4k2/dKYSic4fN3HOmOMo8VgZTEvHxuOaVCHz5NcCEpLcVJzdTNGLzX
         D/thuw77M3HM18dyDu4ib6ExI4RWwa7bkrmsB52V/hqi8r7Ozx605TM/Yu36YeUBOrMi
         sPjg==
X-Forwarded-Encrypted: i=1; AKwUvBydKV9VV7U5+q1BvznfbhJfoPcVfExT9sC9o/AlCJXoMg09Ubmo6TT8RvrLaWnwjnE5O03aHT4THADoo1ho@vger.kernel.org
X-Gm-Message-State: AFuF++mSAaOZNaL45DPGEmLpOpcb5U4/xZL+eSEVEONgdoOznWfDZDv4
	nhhE0+Opst2OEith8n8bnUW3wvPjEpnVXGSXcno5LMuop/q6Q3KxrPjYpkHbOpkr4mnn9/8Fpwa
	Z+0RtXmhNFTOSdeZXgH7k1GaAVv46219pst1IVwmaiWmO22N5U1XQfB1Bi+lnj+sXhoy5RMKCh4
	JM
X-Gm-Gg: AYBFou1cYx0y29XL5dieB+n1MLe+lSpRcUWfTl7pinBVDm4RX0MEXgYH1W434que9a/
	Qfk7VGOTI2+24jo/Oe5pbnkS8wE+c8jnzIwOCwsLm0xEL5MvC3+RYIBIE3Yy3kVm+vKMLlcudm2
	4h++Im6S1Is7MuHdVA1oMt9hUo+ZmNzYpNpsUu3zZ1SpXyA2Wg56qKd3f9iUiOhn6ewg7b6/7uO
	vTke2p4mzZOCch3Z+KLAlyMtY4xGk9igVwJtU25qKrrYJfdTuKxFwhZtzeRRD1VKkfDgTDibddG
	+RjRa7byL6IJ4dm1Cou4Oxn5Q7frCqVeDK2c7sC3iC1SDOzj3xW797Vf99jgPb83/jeyH5vcxbn
	T7NLfzxmRHoecTf35Z1i9f9uA8z2CYoOL1LQ=
X-Received: by 2002:a17:90b:570b:b0:398:deed:6e1d with SMTP id 98e67ed59e1d1-39b260de5bbmr64257554a91.5.1789046991971;
        Thu, 10 Sep 2026 06:29:51 -0700 (PDT)
X-Received: by 2002:a17:90b:570b:b0:398:deed:6e1d with SMTP id 98e67ed59e1d1-39b260de5bbmr64257487a91.5.1789046991413;
        Thu, 10 Sep 2026 06:29:51 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:29:51 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:58:59 +0530
Subject: [PATCH 10/34] arm64: dts: qcom: qcs8550-rb5gen2: Move PCIe phy and
 GPIOs to root port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-10-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=1740;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=ng6TQ1j7rHwm4b9vMxs2nVTuvSLo2hIPKE6L/BFFWyU=;
 b=vvvuJBJw2XVJcpjO+JG0qLAn4bWDQHHusZOl0uck3t28eDShAxTXWXxXI+eL+xRacXL6+kBDy
 u7W6aCf6DWoCYoYEbjvJtPPzVKs9lYbx/GoYNtxO3GTXH027GbF12Zu
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=IfsSymqa c=1 sm=1 tr=0 ts=6aa2b0d0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: tSie4mbV4dw-huayx9JHRaTAtyeyvved
X-Proofpoint-ORIG-GUID: tSie4mbV4dw-huayx9JHRaTAtyeyvved
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfXzX8NSqAsBNMV
 mg9ac4TfMA9PYUOed8NtlMf8UkdO0xsDf8x1/uqNlsdYy6BxxxKBZUtGCjzvR+IWxShqHw/eA3L
 sajbbzKgZcpc1/WE38YH9z9LUkMny7k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX5I8fOgCmTxgM
 HowxGm7pnDNTp+YKcoMij74mMHK7Lt6fLnizL8f+FKBwOGsXSyXRQ+X/SMPcWANIZIqWsUfzvhU
 SkoxJD73c6DOZXRAzEqxOH8gNTM9el6wX9Vh8MUKGL+DfhmE2HKtDveb88xAtr9PwkUJ8xrx/Jm
 EHPbhZLt3aOdMHLgrstL5w7QGIM0PkrxjQxR2WxQnQDRn8PW+Ph6bllmz88aV4aN9giZgD8LBRz
 WwMbWBiqCP/rVHlIixPWP4tCVpQXUQraqRmgYrEgh1UuqyVjrEVenFg3X9JnogmHp9XXAJYOx1f
 fcwYPf1UAH2zRPgzxo2nALL49UjtgV+efOlHjFbss4+h435lJSAzEcj0t9rGj/O76FUBaybcgN1
 wGhGlHjQPNnzaonjP++oe2yGMEOoHxWRPKxT+ZWWTvIB33mCL//sQz8RehyGEsFcdSk0bYpJhGy
 CtWxcwjgwj4pK5nbAig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100161

The perst/wake GPIO properties are per root port and belong in the
root port node, not in the RC controller node. Move perst-gpios/
wake-gpios from the &pcie0/&pcie1 controller overrides to the
respective &pcie0_port0/&pcie1_port0 nodes, renaming perst-gpios to
reset-gpios to match the binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts b/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts
index 41b09ab43d0c..42e3e862e6f4 100644
--- a/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts
@@ -1045,9 +1045,6 @@ &mdss_dp0 {
 &pcie0 {
 	vddpe-3v3-supply = <&pcie_upd_3p3>;
 
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -1074,6 +1071,9 @@ &pcie0_phy {
 };
 
 &pcie0_port0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+
 	pcie@0,0 {
 		compatible = "pci1179,0623";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
@@ -1146,9 +1146,6 @@ pci@0,1 {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
 
@@ -1176,6 +1173,9 @@ &pcie1_phy {
 };
 
 &pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+
 	pcie@0,0 {
 		compatible = "pci1179,0623";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;

-- 
2.34.1

