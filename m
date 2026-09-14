Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37985421233
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 10:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380761; cv=none; b=L73fhlOr+PgR1Ggam5TQ8PESisc8tv/DqL+SrGQsUbHn6i3kxmmQ8du+WrCIU1wlnr4442nYA3BQ57t0t/5jELfG7MEyEVHm6ZYmDaF2XtB+TNM3IpRoKMek6CNRpUFp8crezM3FJmkjvEVInw9t2eTPS/dQOYWzsf+BD0AA/NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380761; c=relaxed/simple;
	bh=c+bDrUjR7XrNZ3W/kXnSRtL90dVSEWiEQOH1Fd0Ys6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i+rGFVT3QcLYmLIlZJ/dT3/ATs8DQJ7UoXACkMBBpIoM9wsoZWwv8TRXzJ4V7JN0dsAoZEfvjgP6wDvY+PxQHDvEFsc3Pd35pF5ZM58KaFV2gV2/1ErT9+1DENxfel637mK/bCMgjz8LM6i9eV6x3nNbV6UkuWLWLQzOl8wlWy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WLnBEhwS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=awrl48FG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WLnBEhwS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="awrl48FG"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9nQVA773129
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 10:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LHey87IrhGZ
	jBwBUxxFV3scRWIGW6S8Y7iaki1Gs/AQ=; b=WLnBEhwSof77oAM5WpmV5o5ixJR
	zQpYcVwFHQs0P/wGYRXo7cUHmee9vJ73d2t022G4qEL00QT4H77ZLhsM/tiDN8Cb
	jQaUX2f4OR4Ck40Nb5HjE5cHCcCFvA1uaaAqzdH6MVYxt0DpMs3i/XRCp0rnRybY
	nx9pWHV7F7Qu7hWBIeEp4yxaW8/HIr6xZqqOQcTuR9AK/LAFCACIh61khvqFS4GB
	wOY9Yw4pUA418ciopp5zEd+UrgPuvYeHfXca9IO9LSRrngNj7yB+TazRPQ+4XcKN
	qou5zgEPOPQZOZzlrcZXYThf4Nn/dQ7lbS1ow2UbagERbigqkMarN218Eug==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevrb4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 10:12:38 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b1b27d7ab2so3497876eaf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 03:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789380758; x=1789985558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LHey87IrhGZjBwBUxxFV3scRWIGW6S8Y7iaki1Gs/AQ=;
        b=awrl48FGnckMgBL5FCQ0s7yNJ2r1O7Cz5MDnOQPxMJf4QU0MC5MmwAVydfQ83prw1z
         BkdFn5zIRnPFl6oOF6BCmxLlVzgvULgU31L3hjSwJ09I7tbSwBJ5uKxRuSWYQVXzDTLl
         AZNBnNpxFiZqsuFUrGvFBihtX/b2zB04lB8o2lP4cWEm7crd5wZmaxWsBFIel985C9+g
         s9js1el3fESqVRKACYRVdaYYehm0AtLWx3XVXb+EdbSm3mbRcb0jON1LhjctrWbzh2vi
         nUIGTBNZbJOq0wVwmluumFy9XeGhjeyPJ+ZGQ5ppkiYEMYpaYfDb0LYUrr0fdFRn6oaE
         ht4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789380758; x=1789985558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LHey87IrhGZjBwBUxxFV3scRWIGW6S8Y7iaki1Gs/AQ=;
        b=czMPSwx7Cqb4i0aRoBDifB5oyHKXRCvOQ4n+uq2zn8R6ku2OL4FWQm7Y94w1N4jJnn
         cd0yWgfCIEhVWmJDOCN6O9GsDVtp3IFOEMDIRwMu9r9cIkiJgP0/BtytXsk7iOLdxeOf
         Xc9+IN9PKgD3WF4uW4EEjNHXWdDLqr7uSe/dnqmLNUYXV/m0ZyVX/6Hua1XXPbWVg2qG
         UiL+NLPbMAlp4jsYVjPKeqZnMT/VB9XG3rB9RAVauUe4Sv5+5oSb0EoRqGssyfzIzwyN
         3piEpRB+9AhRamGcagVUz4ch7gw0J92AYVtIhVBT/v5C7WlsSPBhsRxWBsp6aG003Xwn
         h8Dw==
X-Forwarded-Encrypted: i=1; AKwUvBzpf6AwkbS6+FogLPGdZwVQgEr0JSUS0dnHlqS9t7LrAmkcE1SxUhIR+e+cR9frmDcM4HawV43Tf2+xoz+x@vger.kernel.org
X-Gm-Message-State: AFuF++ldLU+ul3oZEmdAWXa6cnzsOvp52Kdi/qFbDTVB/zF5kUuURMmn
	NmnkaWnsvwVYK7Ut74nS+mkH8rbn1Sd0b3rcIIYYrEpo+ScNONc8BybIHYovhCnb5E6F2dxNEBW
	GWlyfs2r4DC+BP3C7SpPzwKJaAAfVGuKZam3Q5KgEoRuXWzYSgUCLZ31Ixhrpdwg/sqOu
X-Gm-Gg: AYBFou1ouZSzGL8eanT791enlVyebLQ9GkzPeZw734GiqMlnh/9OEAeAzagDnY+MuE6
	+TLZpiOrdAWQPtHkFo6kfKpQ3PDkZ8krR2th2r+LgzUyYOyFOeE/Bo2WBnMpiFHkIhGIXGMtAfp
	e9MiSY2H79pEoD9emVwZWxisuJy5Am6m7S3WVJwaZFKXjT44K9TEih9rIyuD3Ee3nzYWo99VRaq
	1EorQqWU7P5bLxS8xmHfpIFtHIf8PCelr9KWVZiwwEogdwPy6doq8Psn9dRsWn0K7mhB9Dq3F3P
	sW6Xn/VXsVBndJ+J+r1MMd5dZP1fvRSvz++JwEVxKfs4WkB2r/fQEJ0IIBZ5SeZyVnfE+tr3Fz9
	OtvV3eHotrQrZEpuC2GSG4kto57hGtYirTsWSkyMFD42DDA==
X-Received: by 2002:a05:6820:198b:b0:6b4:3a06:c251 with SMTP id 006d021491bc7-6c540188d6fmr908383eaf.29.1789380757941;
        Mon, 14 Sep 2026 03:12:37 -0700 (PDT)
X-Received: by 2002:a05:6820:198b:b0:6b4:3a06:c251 with SMTP id 006d021491bc7-6c540188d6fmr908359eaf.29.1789380757533;
        Mon, 14 Sep 2026 03:12:37 -0700 (PDT)
Received: from hu-liuxin-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed64fcsm29020697eec.16.2026.09.14.03.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:12:36 -0700 (PDT)
From: Xin Liu <xin.liu@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        xin.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com, guodong.xu@oss.qualcomm.com
Subject: [PATCH v3 1/3] arm64: dts: qcom: purwa-iot-evk: use on-board crystal for PS8830 retimers
Date: Mon, 14 Sep 2026 03:12:28 -0700
Message-ID: <20260914101233.981643-2-xin.liu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914101233.981643-1-xin.liu@oss.qualcomm.com>
References: <20260914101233.981643-1-xin.liu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ueo0kF7Ws6EFjfXCKKak66Lws75guXRb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE0NSBTYWx0ZWRfX3fSuUtR5XV1W
 CEnhmbWnKW5plG1KzG5z2bD8smD+HU8Pfj8bEjmQ462S/Oz80+S5otVVA3dd+/toDPJNnHKo86Y
 6FToATiurhP510cwL0awUFaioAWVaYs=
X-Proofpoint-GUID: ueo0kF7Ws6EFjfXCKKak66Lws75guXRb
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa7c896 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=dZtJYaTC1RL3iSm7oLcA:9 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE0NSBTYWx0ZWRfXyhSe9wbnRywz
 nLQzVc4DV3LqKPwIbZD/ALMJUqa0tVAHPZH4/vH5dMdQ9tNkK+8nk5mEzER/IQg0/vLIj04CV2q
 N0e+FpQk6yWktgCRmaGWXa15GwwndOJjE4+BYyor4KPnmD/+TNaXGou4Z1BCh/QvNhiDuVFtErt
 KIWVh6+V1Lu2JWm76iYF9Jen9AW8gwnf9pWcOyj5VIX0unk4rLyxDx3v68f4YSGl2Y8oMmLmHg0
 vklfUn2mOBj/YOyDSF+lOXflzL+5MHo0LfB/jMmPh+1pMvCdw6Dfs/DfglHEcvgFKIBAcm39NSf
 dtVc+k2ZLg//H0VGNLbNuvMh0kdqha6XdgdPBVTHDQGoBF+NQGEm5eT1WRlL40yUDmq1YdsPq+H
 9fmKBvw/UA8knUBSI2ZqYWgyHNRy7rAWVdGFTOW9qdbIQpNzSO+j9QxWPTQDF1wXAeo1/YHihoX
 fqK4uu9aaEKnlrV4FlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140145

On the Purwa IoT EVK, each PS8830 retimer has its own 25 MHz crystal
wired to the retimer's XI/XO pins. The reference clock does not come
from the PMIC, so the RPMH_RF_CLK4/5 references in the retimer nodes
are wrong: they keep those RF clocks enabled for nothing and describe a
connection that does not exist on the board.

Remove the stale "Left unused" annotation from the vreg_rtmr0 regulators
as the retimer is actively used.

Fixes: 9ed20e877239 ("arm64: dts: qcom: Add base PURWA-IOT-EVK board")
Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
---
v3: New patch.
---
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 27 ++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
index 6fc6fe7c0899..4380a46b33b2 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
@@ -60,6 +60,26 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	clocks {
+		clk_rtmr0_xo: clock-rtmr0-xo {
+			compatible = "fixed-clock";
+			clock-frequency = <25000000>;
+			#clock-cells = <0>;
+		};
+
+		clk_rtmr1_xo: clock-rtmr1-xo {
+			compatible = "fixed-clock";
+			clock-frequency = <25000000>;
+			#clock-cells = <0>;
+		};
+
+		clk_rtmr2_xo: clock-rtmr2-xo {
+			compatible = "fixed-clock";
+			clock-frequency = <25000000>;
+			#clock-cells = <0>;
+		};
+	};
+
 	connector3 {
 		compatible = "usb-a-connector";
 		label = "USB-3-Type-A";
@@ -295,7 +315,6 @@ vreg_pcie_3v3_aux: regulator-pcie-3v3-aux {
 		pinctrl-names = "default";
 	};
 
-	/* Left unused as the retimer is not used on this board. */
 	vreg_rtmr0_1p15: regulator-rtmr0-1p15 {
 		compatible = "regulator-fixed";
 
@@ -639,7 +658,7 @@ typec-mux@8 {
 		compatible = "parade,ps8830";
 		reg = <0x08>;
 
-		clocks = <&rpmhcc RPMH_RF_CLK5>;
+		clocks = <&clk_rtmr2_xo>;
 
 		vdd-supply = <&vreg_rtmr2_1p15>;
 		vdd33-supply = <&vreg_rtmr2_3p3>;
@@ -696,7 +715,7 @@ typec-mux@8 {
 		compatible = "parade,ps8830";
 		reg = <0x8>;
 
-		clocks = <&rpmhcc RPMH_RF_CLK4>;
+		clocks = <&clk_rtmr0_xo>;
 
 		vdd-supply = <&vreg_rtmr0_1p15>;
 		vdd33-supply = <&vreg_rtmr0_3p3>;
@@ -801,7 +820,7 @@ typec-mux@8 {
 		compatible = "parade,ps8830";
 		reg = <0x8>;
 
-		clocks = <&rpmhcc RPMH_RF_CLK4>;
+		clocks = <&clk_rtmr1_xo>;
 
 		vdd-supply = <&vreg_rtmr1_1p15>;
 		vdd33-supply = <&vreg_rtmr1_3p3>;
-- 
2.43.0

