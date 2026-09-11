Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9561735BDCE
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 14:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789136484; cv=none; b=IAkXkx7qwXnT6IUh22zP2Y8wPPBbPE4febIc1B9eOk6RFLnW6XMZQMStdYXV8z3JwbWG7RQEfKGkBjeWsRw7dP4+JTTauXJr/5K0y+A8jS1Fv9+QPa8LFK8nitkQncljlu5rylHA6vPqwOYpRaEf5JErlovMVg5BOuJCI/lBivs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789136484; c=relaxed/simple;
	bh=4iB00XReuLnB3DSzBzmLmMm1xtb9aMhDFtmG4fH4Oe4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mh+wcIruKgE3blAwrwDc///fvMwSfhJ0yz93SHT1bV3yYPYOFzRMw3cFANBYqQq68jpLlgcLQHdbbv3zN6HFYr0uV8M496keC+JIz+RwmM5ZKm9J5COZUoS8gFkD5d38zQrN1oKsyGXw5HNiDNyglBImE1GqBlzH0L2x+/eP9p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mtue+7dm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RMS+STr5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mtue+7dm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RMS+STr5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCjZdg524795
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 14:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aEhl6AYIdHg
	VeBs4gNtYKGtpAcq8BZExAV6p0pMg9lU=; b=Mtue+7dmzIJPKHOzY6hNmW3nfK1
	lSg6OQVQVFsgmsYyPNazvfD+2NKtJOG45F2G7V/CaZZOmENdo3on50g9F6B85ouN
	lmAKS2aUgMFE8wwWVHZUxCvihE7SGIGZIPHXseqsOB8wUvoWYCmVX2gfMXRV0lrC
	fu/qhas/+jWoPKmKjEzFvoNeS9ESHN1oWvfCJCQyRVr5FNyUFDnbwL7eFuilSEYz
	EmLE9XR0aCk+aZpq6CGaZEp9TK4TufZAmZBwus6emxgz85D5F5e+SJllPpJviz/e
	l0IZ6I35qsyAv1sa2HZF1fRRnDztdR5+rd2lTWnZWe2OKTV8SqBaIYZbj1Q==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm2q13xwq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 14:21:21 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-836c9f68dcbso14337037b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 07:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789136480; x=1789741280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aEhl6AYIdHgVeBs4gNtYKGtpAcq8BZExAV6p0pMg9lU=;
        b=RMS+STr5c9iWRAENEWcH8twgMAOv5f6kjNP5OHXFdV+wpNVKA5zxDtK8nP85KlzF9g
         3USeuPOumhP6C//0UBWtkiyGM7p3xeY733YHD21E9GU47B5SAlSCIoxkWiqrhZiqW4Mj
         ABkxUTU6AA7ahVbB4ClCKV0C881SjuPAvtKhfo/uLsQUVPqAtgrctnLLtQrQye76bVCQ
         +wzD2t2KI7zCX8izSiKHaWlZ1MXlVLeeYV4aS/75T3kcSNjzOfB6+utcp73eUB+2PhnK
         LFmuUiFw0GtsNbxZiJdZ2T+RtU8Pch4KHAU2KlS/FqCzo1eyDToA0MDhndQYYaXBMFKr
         p9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136480; x=1789741280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aEhl6AYIdHgVeBs4gNtYKGtpAcq8BZExAV6p0pMg9lU=;
        b=XL3a8UCbGQdECxVbvm28GzBmWIvmfdBctevyM5AtFmCqfuKBZAkuY1BIhqkRHreAvA
         H4Vaw3OLqZ47ATksznkte86utx/XWmKCaIyUs2Ph/cAsTsDL9iZWHHv+oB/jc+x3Qdlo
         91eAQdgTr/AqH31dMa5kg0bhsU/QBCtHGthSAYHcM3qrnpwetjtHKSfn8/1d4N0WUpH/
         F5fooD0cq0Y9l5Z0ZtG6soM44MvTlmLXFi/T87/0242++B+C6e8BLFYxPiULclKP9ys9
         tFE9G8TRCRgRH1qspjBtFtePyV+UHSo93M+DK0qgCFibX4x7rrAv6SMoqYIQGI2VMNoQ
         VH8g==
X-Forwarded-Encrypted: i=1; AKwUvBzbtlO8x8zKvBSiSdF7PRlycCSjpu0RH86LNaHA6K0F/VQ1yb8rZlj1JG3Zdm4EavBrR3f+7q8Qgg3dHcul@vger.kernel.org
X-Gm-Message-State: AFuF++nVkA7y1g0Z1RIjMA2eJp2e9T8CWiXhbUo2y4ar7qboDs7IBW0n
	4WGB1+NgcXpt2HYB9Qk2eyign5YAOTp8QI0vxBPKq1vP/cmxsGMToKXfk2BqAQYWy2G0JSN/+4e
	3EnlB4UPp62X5d3k+r95HX+hKN6tc8rHQwxKPKoe+H4r49EhffvFBi5zhVZAIrcbYfrX5
X-Gm-Gg: AYBFou0u1r9UssNOha5G0a2Gr5mlaXg7ln188bBadFMu3RGcdcCbV/WBGvGjwbuNxTl
	T9JFCEhRL7KxPuXUDcH8yVvvK4RGyf3l+dJIAnljv21O/7zkASCGB/STexOjFGj0tQbq0e28laZ
	BRXHC4UEE8DMWzI1FyA3949G0/qCw2fvAskQyBVp1JOlaWy3GgBqa5QdwsDwE3dv2ag933O2Xcs
	+UqhI7XueZlbcROl2LkWXOQGUe5LLrNObOeKlrg7wqFqzz14eMri+U7rcmcOYbbD+WeA4Fu49AK
	KdqlfRZDBJX7roURqHiUxeIjTZoowr26dpDkpW4a84eFDgZ2YrIoG5bIFOlSEnvvLINfqTm43RK
	OKP5ducMoEocu2WWu249hbJ7ujEpZfcHO0iyggln8CyHTBVSqCJf8shbrPx5a
X-Received: by 2002:a05:690c:10d:b0:886:7c01:7e75 with SMTP id 00721157ae682-8867c0181afmr4191117b3.34.1789136475566;
        Fri, 11 Sep 2026 07:21:15 -0700 (PDT)
X-Received: by 2002:a05:690c:10d:b0:886:7c01:7e75 with SMTP id 00721157ae682-8867c0181afmr4190697b3.34.1789136474917;
        Fri, 11 Sep 2026 07:21:14 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-884895001fasm10483237b3.45.2026.09.11.07.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:21:14 -0700 (PDT)
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
Subject: [PATCH 3/5] arm64: dts: qcom: nord-embedded: Add USB resources and PHYs
Date: Fri, 11 Sep 2026 22:20:38 +0800
Message-ID: <20260911142040.100263-4-shengchao.guo@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=d6lgWhjE c=1 sm=1 tr=0 ts=6aa40e61 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=NOSK86ayaCRT3GQFxdkA:9 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIwMSBTYWx0ZWRfXzmMiHpZw+/wr
 ABNOU+hshhZENVHMdczXOo33aJoztq6RSZO9o3OvYvMymL3kuXVffl00LbFgbVxx/8mxxtMaYEA
 wrGge1E6gvIEgnrChFYQCi5W6/80HR5Ee+pRwWySeEz88Q27fWyogJOMFh7x7H1aWcbRqi3+g19
 8TJlSJyduQzOXh1JRRqQPYKnP5thTtRTYH+lfdR9APZAJFeNHYPwsua1H085IJzBXWRFrEHpeuZ
 D67SpVpZydsrIhWYid/uZvjaNnDNaqWGyh7SFA+111f8gjuPtqGzudqglvCPHYYsrmSBcBh6yz9
 NSAPHbCvK5MspnHirHCHrsg+LVxVTVJ2GTkay6bwYJCX8x3aaNonnGzFSy11+tCLGnQw6jbdzvR
 Rg3X0s9K/PWy61v88SjSnSFb70UM7XT913BmxUVowKpYsVbhM+ZNPnsOJ6gg9Hg7WkaZ0OHDA6y
 sGIlYyrj3Jk7vKxtxmQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIwMSBTYWx0ZWRfX3TRnd5sp0mNZ
 swYsNnfxmcEgUguLvAIsXt+DjZi2fPS35N13IK1cWzbw0ldf5eXG/ujqFzLf7hKmSwXwJGy1ZiH
 sACyzx3hCC2OLOiZqbrBEYHQ7F0pVoU=
X-Proofpoint-GUID: pVwKHpCKyGQgrp41r873erVbsBM8gVG-
X-Proofpoint-ORIG-GUID: pVwKHpCKyGQgrp41r873erVbsBM8gVG-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110201

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Add the platform resources for the three USB controllers on the embedded
Nord variant: clocks, resets, power domains and interconnect paths.

Add the eUSB2 PHY for each of the three controllers, plus the QMP combo
PHYs for USB_0 and USB_1, and feed the two QMP USB3 pipe clocks back
into negcc, which so far carried placeholder zeros in their place.

The eUSB2 PHY of instance 2 gets no 'resets': the SoC provides only two
QUSB2PHY block resets, belonging to instances 0 and 1. Instance 2 comes
out of reset with the rest of the USB20 tile, driven by the controller.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 307 +++++++++++++++++++-
 1 file changed, 305 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index c7ac2e66632e..84ce57a07361 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,nord-rpmh.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
@@ -842,6 +843,162 @@ hpass_ag_noc: interconnect@5fc0000 {
 		qcom,bcm-voters = <&apps_bcm_voter>;
 	};
 
+	usb_2_hsphy: phy@88e0000 {
+		compatible = "qcom,nord-snps-eusb2-phy",
+			     "qcom,sm8550-snps-eusb2-phy";
+		reg = <0x0 0x088e0000 0x0 0x154>;
+
+		clocks = <&tcsrcc TCSR_USB2_2_CLKREF_EN>;
+		clock-names = "ref";
+
+		/*
+		 * The SoC has three eUSB2 PHYs but only two QUSB2PHY block
+		 * resets, which belong to instances 0 and 1 (usb_0 and usb_1).
+		 * This PHY, instance 2, has none of its own: it is taken out of
+		 * reset together with the rest of the USB20 tile by
+		 * NE_GCC_USB20_PRIM_BCR, which the controller owns and pulses
+		 * before touching any register. So no 'resets' here - both
+		 * consumers would need that single reset exclusively.
+		 */
+
+		#phy-cells = <0>;
+
+		status = "disabled";
+	};
+
+	usb_0_qmpphy: phy@88e1000 {
+		compatible = "qcom,nord-qmp-usb3-dp-phy";
+		reg = <0x0 0x088e1000 0x0 0x3000>;
+
+		clocks = <&negcc NE_GCC_USB3_PRIM_PHY_AUX_CLK>,
+			 <&tcsrcc TCSR_USB3_0_CLKREF_EN>,
+			 <&negcc NE_GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
+			 <&negcc NE_GCC_USB3_PRIM_PHY_PIPE_CLK>;
+		clock-names = "aux",
+			      "ref",
+			      "com_aux",
+			      "usb3_pipe";
+
+		power-domains = <&negcc NE_GCC_USB3_PHY_GDSC>;
+
+		resets = <&negcc NE_GCC_USB3_PHY_PRIM_BCR>,
+			 <&negcc NE_GCC_USB3_DP_PHY_PRIM_BCR>;
+		reset-names = "phy",
+			      "common";
+
+		#clock-cells = <1>;
+		#phy-cells = <1>;
+
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				usb_0_qmpphy_usb_ss_out: endpoint@1 {
+					reg = <1>;
+					data-lanes = <1 0>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				usb_0_qmpphy_usb_ss_in: endpoint {
+					remote-endpoint = <&usb_0_dwc3_ss>;
+				};
+			};
+		};
+	};
+
+	usb_1_qmpphy: phy@88e4000 {
+		compatible = "qcom,nord-qmp-usb3-dp-phy";
+		reg = <0x0 0x088e4000 0x0 0x3000>;
+
+		clocks = <&negcc NE_GCC_USB3_SEC_PHY_AUX_CLK>,
+			 <&tcsrcc TCSR_USB3_1_CLKREF_EN>,
+			 <&negcc NE_GCC_USB3_SEC_PHY_COM_AUX_CLK>,
+			 <&negcc NE_GCC_USB3_SEC_PHY_PIPE_CLK>;
+		clock-names = "aux",
+			      "ref",
+			      "com_aux",
+			      "usb3_pipe";
+
+		power-domains = <&negcc NE_GCC_USB3_SEC_PHY_GDSC>;
+
+		resets = <&negcc NE_GCC_USB3_PHY_SEC_BCR>,
+			 <&negcc NE_GCC_USB3_DP_PHY_SEC_BCR>;
+		reset-names = "phy",
+			      "common";
+
+		#clock-cells = <1>;
+		#phy-cells = <1>;
+
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				/* Same as usb_0_qmpphy above. */
+				usb_1_qmpphy_usb_ss_out: endpoint@1 {
+					reg = <1>;
+					data-lanes = <1 0>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				usb_1_qmpphy_usb_ss_in: endpoint {
+					remote-endpoint = <&usb_1_dwc3_ss>;
+				};
+			};
+		};
+	};
+
+	usb_0_hsphy: phy@88ea000 {
+		compatible = "qcom,nord-snps-eusb2-phy",
+			     "qcom,sm8550-snps-eusb2-phy";
+		reg = <0x0 0x088ea000 0x0 0x154>;
+
+		clocks = <&tcsrcc TCSR_USB2_0_CLKREF_EN>;
+		clock-names = "ref";
+
+		resets = <&negcc NE_GCC_QUSB2PHY_PRIM_BCR>;
+
+		#phy-cells = <0>;
+
+		status = "disabled";
+	};
+
+	usb_1_hsphy: phy@88eb000 {
+		compatible = "qcom,nord-snps-eusb2-phy",
+			     "qcom,sm8550-snps-eusb2-phy";
+		reg = <0x0 0x088eb000 0x0 0x154>;
+
+		clocks = <&tcsrcc TCSR_USB2_1_CLKREF_EN>;
+		clock-names = "ref";
+
+		resets = <&negcc NE_GCC_QUSB2PHY_SEC_BCR>;
+
+		#phy-cells = <0>;
+
+		status = "disabled";
+	};
+
 	negcc: clock-controller@8900000 {
 		compatible = "qcom,nord-negcc";
 		reg = <0x0 0x08900000 0x0 0xf4200>;
@@ -850,8 +1007,8 @@ negcc: clock-controller@8900000 {
 			 <0>,
 			 <0>,
 			 <0>,
-			 <0>,
-			 <0>;
+			 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
+			 <&usb_0_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
 		#power-domain-cells = <1>;
@@ -1881,3 +2038,149 @@ opp-403000000 {
 		};
 	};
 };
+
+&usb_0 {
+	clocks = <&negcc NE_GCC_CNOC_USB3_PRIM_AXI_CLK>,
+		 <&negcc NE_GCC_USB31_PRIM_MASTER_CLK>,
+		 <&negcc NE_GCC_AGGRE_NOC_USB3_PRIM_AXI_CLK>,
+		 <&negcc NE_GCC_USB31_PRIM_SLEEP_CLK>,
+		 <&negcc NE_GCC_USB31_PRIM_MOCK_UTMI_CLK>,
+		 <&tcsrcc TCSR_USB3_0_CLKREF_EN>;
+	clock-names = "cfg_noc",
+		      "core",
+		      "iface",
+		      "sleep",
+		      "mock_utmi",
+		      "xo";
+
+	assigned-clocks = <&negcc NE_GCC_USB31_PRIM_MOCK_UTMI_CLK>,
+			  <&negcc NE_GCC_USB31_PRIM_MASTER_CLK>;
+	assigned-clock-rates = <19200000>, <200000000>;
+
+	power-domains = <&negcc NE_GCC_USB31_PRIM_GDSC>;
+	required-opps = <&rpmhpd_opp_nom>;
+
+	resets = <&negcc NE_GCC_USB31_PRIM_BCR>;
+
+	interconnects = <&aggre1_noc_tile MASTER_USB3_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_USB3_0 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "usb-ddr",
+			     "apps-usb";
+
+	phys = <&usb_0_hsphy>,
+	       <&usb_0_qmpphy QMP_USB43DP_USB3_PHY>;
+	phy-names = "usb2-phy",
+		    "usb3-phy";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			usb_0_dwc3_hs: endpoint {
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			usb_0_dwc3_ss: endpoint {
+				remote-endpoint = <&usb_0_qmpphy_usb_ss_in>;
+			};
+		};
+	};
+};
+
+&usb_1 {
+	clocks = <&negcc NE_GCC_CNOC_USB3_SEC_AXI_CLK>,
+		 <&negcc NE_GCC_USB31_SEC_MASTER_CLK>,
+		 <&negcc NE_GCC_AGGRE_NOC_USB3_SEC_AXI_CLK>,
+		 <&negcc NE_GCC_USB31_SEC_SLEEP_CLK>,
+		 <&negcc NE_GCC_USB31_SEC_MOCK_UTMI_CLK>,
+		 <&tcsrcc TCSR_USB3_1_CLKREF_EN>;
+	clock-names = "cfg_noc",
+		      "core",
+		      "iface",
+		      "sleep",
+		      "mock_utmi",
+		      "xo";
+
+	assigned-clocks = <&negcc NE_GCC_USB31_SEC_MOCK_UTMI_CLK>,
+			  <&negcc NE_GCC_USB31_SEC_MASTER_CLK>;
+	assigned-clock-rates = <19200000>, <200000000>;
+
+	power-domains = <&negcc NE_GCC_USB31_SEC_GDSC>;
+	required-opps = <&rpmhpd_opp_nom>;
+
+	resets = <&negcc NE_GCC_USB31_SEC_BCR>;
+
+	interconnects = <&aggre1_noc_tile MASTER_USB3_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_USB3_1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "usb-ddr",
+			     "apps-usb";
+
+	phys = <&usb_1_hsphy>,
+	       <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+	phy-names = "usb2-phy",
+		    "usb3-phy";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			usb_1_dwc3_hs: endpoint {
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			usb_1_dwc3_ss: endpoint {
+				remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;
+			};
+		};
+	};
+};
+
+&usb_2 {
+	clocks = <&negcc NE_GCC_CNOC_USB2_AXI_CLK>,
+		 <&negcc NE_GCC_USB20_MASTER_CLK>,
+		 <&negcc NE_GCC_AGGRE_NOC_USB2_AXI_CLK>,
+		 <&negcc NE_GCC_USB20_SLEEP_CLK>,
+		 <&negcc NE_GCC_USB20_MOCK_UTMI_CLK>,
+		 <&tcsrcc TCSR_USB2_2_CLKREF_EN>;
+	clock-names = "cfg_noc",
+		      "core",
+		      "iface",
+		      "sleep",
+		      "mock_utmi",
+		      "xo";
+
+	assigned-clocks = <&negcc NE_GCC_USB20_MOCK_UTMI_CLK>,
+			  <&negcc NE_GCC_USB20_MASTER_CLK>;
+	assigned-clock-rates = <19200000>, <120000000>;
+
+	power-domains = <&negcc NE_GCC_USB20_PRIM_GDSC>;
+	required-opps = <&rpmhpd_opp_nom>;
+
+	resets = <&negcc NE_GCC_USB20_PRIM_BCR>;
+
+	interconnects = <&aggre1_noc_tile MASTER_USB2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_USB2 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "usb-ddr",
+			     "apps-usb";
+
+	phys = <&usb_2_hsphy>;
+	phy-names = "usb2-phy";
+};
-- 
2.43.0

