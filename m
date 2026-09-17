Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A151175A64
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646184; cv=none; b=Fg6k0o0Yukf4ztRTvl9qWiUzqknZbGGcIt1cKCqADN+A0t5FBBBoN7XZtG4JjMDQgjaYYc65QwLUIgLapcVeGl5eWCnOR+PdLR1+movIV2+NVhbBevQ2l2PYxG2KWNL9GqdU8y20cvfwpgP2GXhLsnfPLxDw9HuX4N0FSY0qDBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646184; c=relaxed/simple;
	bh=P/DAkwH5XdgfbdOhKaaM0ORG6Eeibg281YpoKLP8FLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ijcWu4D93FcPVFXqH3F5Jhr8CwjPZ1cpo/srvCK1tvJTqUJLXaeRcWKs/MBsvWnZ9+yPO9D0EKXidlZ+BqB9V+Ata6He7Nperrhoc0jp3GXFcXR3l/AIKaN+eHdsU1+hpnvFQlO09xkDKBqhSALXf5JHiSPP2PE2Xh1KcdKZLFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KXcP0hIf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hkcI8ciY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KXcP0hIf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hkcI8ciY"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zasx1149965
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:55:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XQnry4ftxbsH325hKafakPNI67Z8V3Z1CQli6UgBJXQ=; b=KXcP0hIfmk/nCgjJ
	RCdk02kFprYFn0BxAktA6qWvVjjs+DMCYSgZBXV9hIiPeXlffKBs+dFZ5QO3ESgn
	gwvsjRugWO9z0Ds8Fq7YhW0xqjD1jlEPwhMjJw6iy5UW/G8w3QZFfoYO0K6xd5HR
	ZICApc+24SRyi93oNA/+8zN/HJC77gbN3ii6OYv7ZvmLy2uv2Ry4RJA5qYl71Zae
	xt/+SlSXlEPJVhRm7RZ0NnRTzvZBI5qSDVksFErzS7/1LZfgIuuqMxecyoKjyIIr
	hAC1o4JBjnXC7MTmZuRtMsjN9iAtm0bENI4iatzvAH91SdgsZtgPtNTy28Qu9WaN
	mlw0FQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grc9w8wsc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:55:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dd667770efso8285335ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 04:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646148; x=1790250948; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XQnry4ftxbsH325hKafakPNI67Z8V3Z1CQli6UgBJXQ=;
        b=hkcI8ciYVibf2DL5OpujhAM92KNnB4YR6IjxeufaPIay/QhPO95XlPv2UjnUmUSiCI
         pbapLCYDiJ6Ej5foUkqHX1kV9D4Oscddi1sQ5xzA/SUp6nTXJWuT6wHCF9DhvpTNEtg/
         gj/WaZ1qLXJD6czaGnG6xocb+ysIz6k6GyG+L01E4MfJ6Ee95e1a4UyXChDgp19fV0rs
         5FtCOp6GiA3aLR0XWyq3aZh+qZ7lcjYBgtqrn9n38EL7XTRLz0qFbQoqqmefTaSWWHqC
         UGPBcVFMh3YiOOnwQRRJ2+NqCKdshVtMX8QY7cfPK5spr7e2zfFJWZQ3OYqpvQIWqxgA
         wBsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646148; x=1790250948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XQnry4ftxbsH325hKafakPNI67Z8V3Z1CQli6UgBJXQ=;
        b=FKPlN2/wGDEr8obVuSThd1prv8cx22bZMbf55vIOygzq8PUA4hhjgRB+hDCOgLT9o6
         sABO7d9Zvbfn4Ajk6Q/I5MJGDkK9aGMbPZDATkiWE/ACgGIgLujApySAy+9isbFDvsGU
         n95gw2+V2Fn7FJm2YWOitO9z4JdwKa0j8laZCsDr2x0y8gX6Kt6N+1Q6tquMRrbjbkOc
         JnDrQT+w/hvpfj7a+ow458glHAukpQRFgiPHeEebCTu2NCF/+sFKd2mFDB3LMm21/BvJ
         7/DaNzW96SKN/N7PWmvkYEBLLykA4f3Kv4Pk7NoDTuS0WZRGc4dpkpb+A1kyoWPUveDt
         n7gg==
X-Forwarded-Encrypted: i=1; AKwUvBwjgywieSjJlyawNe2WljSbbdLnSFtJjOdVT+RIYeAnvgr9R5/Z6iJ1QQGRrYQqJIdSd2wnY0uXK/Ao7gEE@vger.kernel.org
X-Gm-Message-State: AFuF++l6s/UqN2VzgYPXjIc33Ff2W7poTsap1+o5mpzsZlM2xFRfixql
	/1ZypcK0P+5KQqYR0cRtq3gq3HLWnD/3A8qV6B6V3mYYDAHQZerbZlezuqC2AmZuQCPUSJUvxft
	xbvIJdSJpFeks2dFfHPfVhAoNZwQeIqMtvGyRLlweT2WyB3fihfihWcmpyWgNVIcGL+dW
X-Gm-Gg: AYBFou0h/9+WOHpjK5Ki4xus586nU0T6RRCzXn5CkBHgRCABSEUx/F/8MH1vYRkUbWw
	x93tsNhOSnko5Kgsz0pxFPjw9cI9DWaDPI1kXsEXVWOmDKsTZ54sGAaKT1xVKSbblkNQymiool8
	8wqG7eVl2o9+0Y4IIOZOMIPo2rqNVjY9iYOlLlZZicYtEc5W0+ODSG8yzwwaSj+bfqrArwrwAc0
	3uW9M9lwsB7jKA3iPxFafZXO+4CS66iza6f57/082DqxsekxK8Ij/q6GtAbHmFQ0EUCgPn40EL/
	bWmKflRpILqXOnv3r0mo9nhRf1J6pdxRi2mUiggM4XYmkoDxt/Ne1n9G6irKBzCSuYH0qxJEB5n
	Rzhn0ir0fceXe2evLpRX2K26eRSnDgTgYXQ==
X-Received: by 2002:a17:902:db0f:b0:2bd:2c3a:2a36 with SMTP id d9443c01a7336-2dd9c5e9b98mr46131005ad.0.1789646147955;
        Thu, 17 Sep 2026 04:55:47 -0700 (PDT)
X-Received: by 2002:a17:902:db0f:b0:2bd:2c3a:2a36 with SMTP id d9443c01a7336-2dd9c5e9b98mr46130705ad.0.1789646147497;
        Thu, 17 Sep 2026 04:55:47 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm18249500eec.1.2026.09.17.04.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:55:47 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:24:26 +0530
Subject: [PATCH v2 18/18] arm64: dts: qcom: kodiak: Fix PCIe WAKE# GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port-v2-18-0d627d0856d5@oss.qualcomm.com>
References: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
In-Reply-To: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646072; l=4282;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=P/DAkwH5XdgfbdOhKaaM0ORG6Eeibg281YpoKLP8FLY=;
 b=GD5voIDd/gtGha1unHG0TKPDruVGi5AehDw6Agy0raEqDw3beA79ijbajTjed4lpfcT9qhUJU
 bj/OTyOzjpMCt/xpSG7zbzrsPkn9nEAL6edvMGOCM1IC5m5WZ7dJmCt
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX4sER+3t/wgNA
 pXNNFU9tDW6+hfegFo5+jMWWxH+dFMRTMrZTVvDQFufsNyz7Gco4/KJ6pFmSEQEOtkqfYTvD9Ms
 WileWbElpJ81o6zdH+NANzZXqa0tgm7QbsEKtDmJH2X1s2CkMDuWtPiBuTF55H2d8kU7wEl1Rms
 VmoILD9FAv4nm8cAUSd6i6JVF/Vg9EK+cf4ruhBJW1mwmua0afRNZKneOsXH6ufyGBBeQcHALsE
 V+LHikjwJ92biLJiMhm0DwmWb8tr32NldNWwPrJaOTJQ+H4bP7zJDFoi44y21HzGxGvr2SfVXDs
 ZIl1oDE49v3t/MW65VBJgcAbxW7hyU5+GSQ1Gmj9H+AM0L/AdOB564ctI5v3UOziDs9q6PxxmbN
 2B9TC/AYzh5Ni1CjuIULfEOirQsCMioIK0LRZwbN10ifocYHTcsEeWejl3p0i254xAJhL5UsNKZ
 LiqR8HybN6iu/npUIBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX5ifADM1ocT+i
 grGdiNjzjTWS/iyotLzekAof5i3uIB6Ph9Jk3df7OtVnZOkcuqsJ0xq5zL+MaCJg+aY8cKuE0G7
 J2rRDd49xnG+82n0T2Rk9HMZggd3baA=
X-Proofpoint-GUID: jkFpUlZfhozspajagHGFyUa41Tj6x5tK
X-Proofpoint-ORIG-GUID: jkFpUlZfhozspajagHGFyUa41Tj6x5tK
X-Authority-Analysis: v=2.4 cv=EsZHPicA c=1 sm=1 tr=0 ts=6aabd545 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=xTuWgevKKEmUOcCBws0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170166

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts         | 3 ++-
 arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts         | 4 ++--
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts | 4 ++--
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts     | 2 +-
 arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts       | 4 ++--
 5 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
index 5bb33a8a9830..509fc4941a02 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
@@ -558,7 +558,7 @@ &pcie0_phy {
 
 &pcie0_port {
 	reset-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
 };
 
 &pcie1 {
@@ -579,6 +579,7 @@ &pcie1_phy {
 
 &pcie1_port0 {
 	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
 };
 
 &pmk8350_adc_tm {
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
index 41d60c87f5bd..ed0b81710b9a 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
@@ -541,7 +541,7 @@ &pcie0_phy {
 
 &pcie0_port {
 	reset-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
 };
 
 &pcie1 {
@@ -571,7 +571,7 @@ &pcie1_phy {
 
 &pcie1_port0 {
 	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
 };
 
 &pm7325_gpios {
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
index 31bafa2cf51d..6527cf815b85 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
@@ -705,7 +705,7 @@ &pcie0_phy {
 
 &pcie0_port {
 	reset-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
 };
 
 &pcie1 {
@@ -736,7 +736,7 @@ &pcie1_phy {
 
 &pcie1_port0 {
 	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
 
 	pcie@0,0 {
 		compatible = "pci1179,0623";
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
index 13e8e62f6205..4ac2998a0a6a 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
@@ -833,7 +833,7 @@ &pcie0_phy {
 
 &pcie0_port {
 	reset-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
 };
 
 &pcie1 {
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts b/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts
index 4f2e0109f49b..141d263e6566 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts
@@ -653,7 +653,7 @@ &ice {
 
 &pcie0 {
 	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_clkreq_n>, <&pcie0_reset_n>, <&pcie0_wake_n>;
 	pinctrl-names = "default";
@@ -670,7 +670,7 @@ &pcie0_phy {
 
 &pcie1 {
 	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_reset_n>, <&pcie1_wake_n>, <&pcie1_clkreq_n>;
 	pinctrl-names = "default";

-- 
2.34.1

