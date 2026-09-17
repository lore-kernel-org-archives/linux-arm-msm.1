Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813734E06EB
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647953; cv=none; b=WMb+KYIX9BrbeSJ/Q00hsps66IHHlcvk90CHit8Nmh3Z/y+cwx4vAxERE+7LfDAm/oZpbFS3PnDls/SXXXBnJGFHtCQdErZRsd1jXGNTeLtwqr6p7yjBQR9uh+eMAwVViSeHcnwym9BccnJWCEMe17+8JqqCYTPlNBNj3m2ezvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647953; c=relaxed/simple;
	bh=YFChqT0446tORb/T6erXbuqGyCEGrzvzDf5PT7XJgFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WdRQwYJN8Pe1JcPs47s1QsYAl369Ejz/sggQavWTQ/3pqQwrm//SWsODkLzCjlDANWeB6nvPe7epyeBrxHNtNFmK5B29t6duLTCnRqIFtdLiVPd1BJB2PKTLaLPSWHbbZ6gJNUNbglzFz1t0NnIIO0Q0WD9Uvwi32B5gyfJh2iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D8Sfuy5l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kS308RGD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D8Sfuy5l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kS308RGD"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zdiv2410556
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UZi9vGdmEO23EVhCMp1C1PN6BGWSn+y+i7SV8wWmXOs=; b=D8Sfuy5lCcg2ICvw
	0PMhnVaxutHfi0TemvXhFjlzKBIRcwGNZ5248xxmQt/+a5VWF7YPxpClGCW2JfOn
	+HCLgFXBmmOxp3XXBhmoxmgeo2WVUEs5DyafmooEqLVgnjSNoFjkecXWl9YkC4cW
	vPlPhHDeep0+bmQoMv8FS7MBFtUEhyKOhzaMlxo3vwLLfsmOoXj6EbYNplPmUFlS
	FBIIoaEJ9HoZLm3/RO+27P/IabwlqXFITv+0WV1n8b4CampciWUHTLZ9TQvD8cxv
	aY02uI2QOHEQ7kK1VXHgcEyt80M/9dpRt/mgcUdcjl0rxnr2Uw0+2jGtLfysrGAX
	QiKe5g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdd6gqs9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:25:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so1270873a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 05:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789647946; x=1790252746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UZi9vGdmEO23EVhCMp1C1PN6BGWSn+y+i7SV8wWmXOs=;
        b=kS308RGDbUiahvgtRetb7QLWPrCEKIlATSk/3qC/1peEvHwIy6WfpVTLUqqc4Sg3Dp
         V3YMKRerNPEqwWeM0bc2wTfj7+yoRjYVSLzbd5SY7iw9sy6tAFR6lAOjz5wcJ9Vkpnfu
         y1bNcRki+cBOX9HIIbKwRRwnL2JzUV1NYknSqvmVhxQoeJ1qxXNOba3oWp1WEQco5r4m
         gnDK39WcDJlwTzvVcebZpQUcgjWmSwCbfrxYcKpB+uzLunX+lvikZaYfvmL0M5UcAwfC
         keNssIibNW8FJljoUtRA1ov0yg8OYXbw2ag4z8TvF9OCXb7qy6kMC3l0XkAkd+a/xhS0
         4gOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647946; x=1790252746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UZi9vGdmEO23EVhCMp1C1PN6BGWSn+y+i7SV8wWmXOs=;
        b=B7ikVwg8des6ze/PcWZ8P0ojNHLz42+O6GTu+vhpVYKCrpGY3sDHJT0JuYUZGvtm6R
         zvxR6HCn8nmHF4Z3MR4jvvpT7889Qn4f4xv7mCMLAtyIuBaedjB7aYpgxPwRZtx3+QTw
         GbTlYVRv+UnWSZ3EPlqBbhsZPCz62oXhPqf1cw0Pbf6Z73bhUjG3819/aHi13ICNIA41
         IzW2lXRxvXzviEcIn7jTWP8vnjwddKvWud/8kBpLSSl3NZLKjNAk7tpAtZL7u6jG8fui
         4xJUxlZN6PPonmvG22jcJdwbT8OGt7OGCiTLLUnu8WJg/tdok8ucXO30hF4JqPCH9yP9
         NKOg==
X-Gm-Message-State: AFuF++kKl1nYS75VJvKRWLO35erYDKpWddc17URdccKS3W6LiKqryq1J
	VVHjHLZ4CuklikD1JGVvXuzvip1Ka1458dkM3kBdYReZWIqDRwBMt9W+i5WrfXtIruAvAIDy5/I
	c0+R1odc+8D4weNVzBw0DOZHC89mlTrp3gCSyEbONpxRsxOa+g5nykeJGzz7WRqiqjeuy
X-Gm-Gg: AYBFou3nEV0IkP2jJYugOdo1JhqF8L0UzcjE7WU/ISmWEIizxfl46WBy3YWo0AmVEjo
	8D18g34zkVUY2RavEGyYZ1LKDmmvxaVeo4H8aU5Ktq2G9cIOFhJkoYpw4ljZZUXMSq2H5sFmnzk
	LR9J+Dg60kvojBcM/zoPs0G78ekZDvci+bDfYZmi1RAI28PBcqg/v4KSW5Cg8oLAP4TIkn2r4Yt
	riJKbZqpOANiSdvEnSkh9dgiiq0ueqvbM7V9kGFu8iOJr7g7BLFZ8lxCapLnXhohdvrd/82LMTs
	SzXNmdjp6PrlnC+g0ABOy4Xs/5ySvVkFdUaAOaQ7rZCh85kzGlmr30lpqIKbSWzdpl9NNfo/He+
	C7XniJuhNfL0rZ3dfr3AY7uB8bS5DOkj+97c=
X-Received: by 2002:a17:90a:6d89:b0:39e:231d:1e89 with SMTP id 98e67ed59e1d1-39e231d20d6mr14655383a91.19.1789647946036;
        Thu, 17 Sep 2026 05:25:46 -0700 (PDT)
X-Received: by 2002:a17:90a:6d89:b0:39e:231d:1e89 with SMTP id 98e67ed59e1d1-39e231d20d6mr14655320a91.19.1789647945403;
        Thu, 17 Sep 2026 05:25:45 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a175sm16380968eec.9.2026.09.17.05.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:25:45 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:55:17 +0530
Subject: [PATCH v2 03/15] arm64: dts: qcom: qcs404: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port_v2-v2-3-6272b7caae9a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789647930; l=2004;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=YFChqT0446tORb/T6erXbuqGyCEGrzvzDf5PT7XJgFg=;
 b=quMBjQKcL+u5qCbbBE7cuiQ2yAYDJgyd5XJ51Ig7TQEsBBx7LmGnGHfxi95c0aJXN6czFX9HM
 nmkCGxN3TY+CjxsnzQcn5/gInD13mjsVbdflDt2zaSNgwhhHndr8h0i
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: 1tggovwEirl6sPuLWIZtb41JFMwr20-c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX5Ks0bt3+5PO6
 68HIQKW7tqHuAczGUAj8hMp2Np95ms7JY4y70fxT8Yb72D1WJRxNc/e7eSrJZr3TIHZxPibRs2O
 FtYJTO7wOW2zY7oIgZo98Cr4b04WxxbjoIgZO+sFZmLCk4ns0XuvXrSIvb3H107xlPYq3xvRg7U
 3UVQyQAkCyu9GL0Pa/tZm3T12+aiIK4n7l9ZWNvaYQkPU7gOwchREp6g0CYkYvM7GCD0Kpn1ltM
 fMPh/KkDP4Qg85+RfW0dy2zAhCkB75xFXpdNFd28q4IT2S/szOsCyvGmDHf0j16n48+CpYhwJTk
 3UlUAYhRUjXr32AnxEeioSEiKNnGwZfAoP4Ttx+ZmvA+Yy74aNad38ptKOi3X0BKZQHqLI73kKo
 D5nbO/fYNn7ta19NsATra5/tWiy/1s3KY7Bpd0rIEnH3De79UCRURti8yRc33j8MEwLVjXvSj7m
 /oueUENeLO3t392gxOA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfXxqgNfIWDRCFO
 vKQBCWvUyt3DeKPGfSujYCRYdEhrTFYzHXoT3h6hy4o8Gowf6ruZ1q4bLHTQmYwY2thTISPyKgd
 470aeLybHdQCFUKwQHkoEC4hFXnZ3gM=
X-Authority-Analysis: v=2.4 cv=GeOCDgXL c=1 sm=1 tr=0 ts=6aabdc4a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 1tggovwEirl6sPuLWIZtb41JFMwr20-c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170174

The PCIe phy reference and the perst GPIO property are per root port
and belong in the root port node (pcie@0), not in the RC controller
node. Move phys and phy-names from the controller to pcie0_port0,
adding a label to this node to allow board-level overrides. Move
perst-gpios from the &pcie controller override to &pcie0_port0 in
the board file, renaming perst-gpios to reset-gpios to match the
binding used in the root port context.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 6 ++++--
 arch/arm64/boot/dts/qcom/qcs404.dtsi     | 7 +++----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index a22b4501ce1e..55bd53f8c159 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -101,8 +101,6 @@ pms405_s3: s3 {
 &pcie {
 	status = "okay";
 
-	perst-gpios = <&tlmm 43 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&perst_state>;
 };
@@ -114,6 +112,10 @@ &pcie_phy {
 	vdda-vph-supply = <&vreg_l5_1p8>;
 };
 
+&pcie_port0 {
+	reset-gpios = <&tlmm 43 GPIO_ACTIVE_LOW>;
+};
+
 &remoteproc_adsp {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 736accfc34f9..7b622660c327 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -1517,16 +1517,15 @@ pcie: pcie@10000000 {
 				      "pwr",
 				      "ahb";
 
-			phys = <&pcie_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
-			pcie@0 {
+			pcie_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

