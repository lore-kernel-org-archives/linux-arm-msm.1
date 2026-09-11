Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4C035BDCE
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 14:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789136474; cv=none; b=Gdrz8lvIUVB1/BWn8p/mSsHw5uoVF3zbj2WWHrLXfBqC7z2kxzKCSdeKzmSpnTzlF9WSIbk6FaYwpzYBmMvCQAa6MrtT1eoHRcVUP/fKCX8Qw5HgNhubpNrpttF+82UGHNkyawaT8bK9HGFVxNp3Up3VdBPnzr3y+O5boGpeCbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789136474; c=relaxed/simple;
	bh=wiTMkmPaCULWmwNg/rKN+QwuIz71J90CtZyjasdgS+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nSwFkmckAA9qYHZFVCrwKYaLlME0HT7+vX1OYbxkSYHl7Jlke8YJVUKCxwLqdwqYCDHPKap+AYYIUG7GqPPtg2n86RoBNoEwfWi2YNDzmAAJQZEDysszs3Ga3Tdlw5cF72Y5UlV0KSAt3MsYkhGenxpzQr0aTO72gVYITS4LqxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ESS8W6sO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LeP8Ubap; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ESS8W6sO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LeP8Ubap"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCifgs3505531
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 14:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=C7wGC0NXm6S
	yYMaUcruGTajxYAGjQBVauuMw3W0AOrE=; b=ESS8W6sOTh0mQZXXJQ7xhAOHrde
	zICuQ+zF7xA8m4JSK3JvNFuJo6KcpOYP9w3wC0mtw3UchZ3lgvBCNHOSlbQtUPhx
	JrjgDb7a5im2G/TqXOS1zhPidyh5p3UoUCI1C2YNKY4LaYymAneBgDkejD+JctVj
	/dePCd6ntCnj1NLXq7NRJnMiNqrpKW+mWyHK4rKke5wLeMfpGGxQDwEU6wBagusT
	ExxfYJoue+Wp2M3JdIjL7075ZIyKgQ1N/if0o51QdKX8DH2jKlNRSbmMPU0TbhLZ
	7QX2+wSwznOiDSmRuTQTT5ha+4VuH9IaGXi8S7brsvI8kcSmfSv4n1WEEFA==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmcgfhvm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 14:21:11 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8546e211940so11431797b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 07:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789136471; x=1789741271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C7wGC0NXm6SyYMaUcruGTajxYAGjQBVauuMw3W0AOrE=;
        b=LeP8UbapejkVQ88hvhjX2/8KxZWhXr/LmWkXVsXnPN6jqNeeYovUUqWAqxQPJ4vVo6
         TkaZ0l7bX/ObMYt7eYMGxlqOX2DUr+NE0FJZ+AFxYaMWCFzItEivFFfi3T8HNLj0m6qK
         2aSU69xDMhUWI+MfgEIk8L8vziQ9PwxxRVtLfnRf8pace7CHNNo3otUaLfZ+0juUMFPQ
         TGwdKiFGKycufEUuYYIfELiccgCi459ncT9o5T0laNG7BSbB4Pr0DQ+yNdv8Zn7B4LAj
         VH1CK4tjTXhkthwvvRmlDHYfJOb5K1QyFvC27S7MDFPjROofr/S0rEugkG4kUgtresNb
         XH/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136471; x=1789741271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C7wGC0NXm6SyYMaUcruGTajxYAGjQBVauuMw3W0AOrE=;
        b=Uhk5ByIFUmXdfZYQhduSRUCnn9EQo3qt+Yim+lAJoZ0XACRP4MSvX8piLfKGGkCb0p
         nHJrNDPVyea/O6ZB+8zcr/86lQJMNyEfHvg53tPChNRnfCXYsrv6uG+G+WWxmeDydd3i
         kahH31/MAUyKCewaRYOWL2nMd4b35LO0A86hZ+/En7mdDPhGKJFAl6MCUbUnPebJL7I6
         iX9s0GF25QdcqHK+UiitV7zd3/LKtRJABcZX2aeflmrmg9Pw9aDHlDYKFM66ifZjApA9
         RweBAamgWK/KDH0Riz3iUMJDtYWkucvlfDaOn41K/wNdeUnbpnzfaliUUgwrRlfKmz1s
         ZGpA==
X-Forwarded-Encrypted: i=1; AKwUvBwguQITuVR9GD4lhtMADW1V8tBESNtEuIKiJWAS1nx2qMnaMvOvBnasoL9MkKEYq+WvhonyHZVREvqNWt8V@vger.kernel.org
X-Gm-Message-State: AFuF++mMT1ftJ8GMDwV8+iY+EGCUZ/0/Z/Uc0vWOfaEd4174OUIxptcl
	kpp6E5VM71F2gMxYw3AJMhfZowol70737HLZ9uwShG8kdLSRzShnlSC4j/53f6zeKDrcV0lfQAB
	R9u7T4ez2FAYdkhaze72KRUXdLeXL+ITJqo2SneCi3qgbH1ouhUFNxo2jjOurcFcnZm75xjaFZd
	S8bhQ=
X-Gm-Gg: AYBFou1lRpBqXhjMp9FbpHiyw3tjvo9Ui0iaLE2eIqIJQyhS+65E9ShdP49lFm58Vtb
	QL799Qh785tlzOwvxKPfEYVhSgVSWdAlqsx7hTJUtBcwlLy8KjsNJ2MOw2QPfKKHa4JNcBmnL3u
	T6p8k3wQAJFhXDeWT9+J/S/VM1eGTYzjwXjyAuaamEoPPigx+WN3Ec1fGjSTVnZFizDk1/osVEw
	Wh8q2A3Ni4jLQxtFaarNm6Qc5TrShHHlsBPSMuz21Zy1Uyyi6CImE/5obB//80xxbSosKQ2xin6
	QmkQJh8so+fCzWlY3Lo0K7gY3TCtsdEIEfvbF7LKHziKTZnzvw1WXDMQ1vG3n33F3m7GyKuxSKf
	gx/Lch8SEs65GAHaMYRnQr+NqEvv9IVZwmzqEE5KPXIkud8yF2DHFpzvD11gT
X-Received: by 2002:a05:690c:e3e1:b0:87c:349d:b755 with SMTP id 00721157ae682-884b2bcf7bcmr15906497b3.39.1789136470521;
        Fri, 11 Sep 2026 07:21:10 -0700 (PDT)
X-Received: by 2002:a05:690c:e3e1:b0:87c:349d:b755 with SMTP id 00721157ae682-884b2bcf7bcmr15906197b3.39.1789136469956;
        Fri, 11 Sep 2026 07:21:09 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-884895001fasm10483237b3.45.2026.09.11.07.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:21:09 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/5] arm64: dts: qcom: nord: Add the USB controller nodes
Date: Fri, 11 Sep 2026 22:20:37 +0800
Message-ID: <20260911142040.100263-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
References: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIwMCBTYWx0ZWRfX1LfHFnLfrauQ
 7kAMEEFiAFsZEG1zX5D1VUos4jEI09C4cE3IOHPF4cVM+UZobSjXUi7TPZQk45yUzl30muLyLs1
 B9fxoMhv++jRpfVCL6a58klm1YuQyBUzrowP1kH3Iwx8wdsr27p48U2bxRCABtlXHxIK6roIeTf
 IXNPADvTB7Jsl5/rTmxY0RWsT3GMjELU6rsDUG87bZtxu/zsI+pFyVCvaMbOSgunv+tJNcQDFZq
 dBXK4L3O0L5FB8g8QBXuICHL/mRVHBomdklT55wCYiOgzM4JoJ9UKZxvPRFWeZg1Ih3zVHajwXF
 jj48EqgVlgMfOzM81PSbIgyIOfTi3a3LY4nkfqw36YHEnT2Bzd3RAmQfJ1wjs5+PPW/QBAz1761
 DcWtpkfXKTfDSGjKK3qn6eS762jWJbgR/Bbb6KkNIyCoJeCP2qgnWcTUmMlwvvGLTxAvJOMDk1J
 YCjQQgGVUHTOhHTlL4w==
X-Proofpoint-GUID: mcO7m2pomWJqoFAtj50oBNtRQ5xQNOkm
X-Proofpoint-ORIG-GUID: mcO7m2pomWJqoFAtj50oBNtRQ5xQNOkm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIwMCBTYWx0ZWRfX5fb8aDdCbKBX
 H0bTkWpx8JoUGRR5Nogq398w/LcgrTRMUSRJ/MF4kzII0mIlgKZ/Flvs6XNl9QTOc54I1oqexG1
 UQJmUE+U4fiumGN34aBiDSjJX8GOBdY=
X-Authority-Analysis: v=2.4 cv=ULtIjyfy c=1 sm=1 tr=0 ts=6aa40e57 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=OACZVaEhdQEOGtIDsFAA:9 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110200

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Add the base nodes for the three DWC3 USB controllers. These carry only
the SoC-invariant properties and are disabled by default. The extension
for the embedded Nord variant and relevant board files will add the
platform resources and enable them.

USB_2 has no SuperSpeed PHY and no 'ss_phy_irq' on this SoC, so it is
capped to high-speed and told to use UTMI as its pipe clock.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 83 ++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 83760341456b..98967478fc3a 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1736,6 +1736,89 @@ ipcc0: mailbox@9007000 {
 			#mbox-cells = <2>;
 		};
 
+		usb_2: usb@a200000 {
+			compatible = "qcom,nord-dwc3",
+				     "qcom,snps-dwc3";
+			reg = <0x0 0x0a200000 0x0 0xfc100>;
+
+			interrupts-extended = <&intc GIC_SPI 910 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 907 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 8 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 7 IRQ_TYPE_EDGE_BOTH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq";
+
+			iommus = <&apps_smmu_0 0x14e0 0x0>;
+
+			dma-coherent;
+			wakeup-source;
+
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+
+			maximum-speed = "high-speed";
+
+			qcom,select-utmi-as-pipe-clk;
+
+			status = "disabled";
+		};
+
+		usb_1: usb@a400000 {
+			compatible = "qcom,nord-dwc3",
+				     "qcom,snps-dwc3";
+			reg = <0x0 0x0a400000 0x0 0xfc100>;
+
+			interrupts-extended = <&intc GIC_SPI 917 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 918 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 13 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 12 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 41 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+
+			iommus = <&apps_smmu_0 0x15c0 0x0>;
+
+			dma-coherent;
+			wakeup-source;
+
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+
+			status = "disabled";
+		};
+
+		usb_0: usb@a600000 {
+			compatible = "qcom,nord-dwc3",
+				     "qcom,snps-dwc3";
+			reg = <0x0 0x0a600000 0x0 0xfc100>;
+
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+
+			iommus = <&apps_smmu_0 0x1500 0x0>;
+
+			dma-coherent;
+			wakeup-source;
+
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+
+			status = "disabled";
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,nord-pdc",
 				     "qcom,pdc";
-- 
2.43.0

