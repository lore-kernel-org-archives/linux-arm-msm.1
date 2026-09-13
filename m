Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E06374721
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 14:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789308893; cv=none; b=fWXY9QTnly+vtdKH61TspDmA3NeyVKJqtQ1j20AwQ2EmXhO4lu+JasBLzVsJ22Q+WZb3omj9uD8tJgRQa5xi3T8FVLZGW+D0dFhb4Exfy+93ROaDh6l8aEM5E8Wf/6MGEUrbMgqo/VV8S+ME8ipOURh3kAq8wCx6DXlF0TOWDOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789308893; c=relaxed/simple;
	bh=4K4J93pgjU29ndT2pO7eB0/fX0aJsfLjMkJogz8j4ks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QHZZ1qvpgyQxhk89mAQG7yCeiG6eJtj3hr/n0d75WRm1noq3QKv9Ks/aPwX4B29/ZuKC8Dn8bRsg12HSikYl2SyPiekINVEGRjw20yuWKl+XmEP8cOC7hc3vdmpkqHUNeq+SHYJGwzEbx2iUDxVwmAwndoJLNquvrsidRjjE1+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XheeCp6Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a6v30ekB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XheeCp6Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a6v30ekB"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DE02VJ2786661
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 14:14:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XqjI25mMzf9Ds1zvuwZQE2UD6QaoVFtaiOH
	lyAJ+WxA=; b=XheeCp6ZA3AA52we9mXCN1pp4qi0hDhqhuCktarUebKeZxuWUcf
	dhCPtgzfdn/Cb+AbqcwXJGy/C644xNwn9YgfkF4xd8dAZepXl3xCsKHdQrvC3CJ1
	UWJAyDlR0eTKha4aUKl8+oy/ooMVGvAI+kA+V4VnVyrldCCt3gY9PrZNHMH1C0ce
	uGWaJeBaZnzCV6GsACawDcU3hhRIbYTFOM2S0TcY+4ZHJzINosc7E6Ja6Rfs8dFb
	12AS/pXDY+ZdaoSVmV2HGOCq6wdpc53yKVHqbYTWSQ31lXxk9RAVePulOKFGUmWk
	KogIVtev1UkwfpHcvy6+eThEz3gbdCNdQgg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cbf91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 14:14:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9390a2c895bso584709085a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 07:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789308887; x=1789913687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XqjI25mMzf9Ds1zvuwZQE2UD6QaoVFtaiOHlyAJ+WxA=;
        b=a6v30ekBafhbQjTk8m/PmTgiY4BX69Rd0odAHzkqmlYJ0/drKjfMJhff63QgugEqma
         xv7ktVGE/wbQ36VGkgrcNWYax8/lPnMzfw02rn21STD2v9uGK3G0Vz8iduzudls8QGh1
         esDvRPTz/oohmwyl3kvYkpLQQFm12/NqDv9XXvONrXcc0HF33bnAwD5QcM4CFoBuiE05
         7wq9I4CPRkzCnJqIZ0KZIQvtUKpKZxAWZql44SkX7RMZ6SpwpeFx6nPeyTeSPzpLb5HH
         c4SJm/r9DYsubCjpFEzronxzQRgAuS3HzdLArBwQ870pOFwR9wmtCluBqeFTU+Qoafb7
         b1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789308887; x=1789913687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XqjI25mMzf9Ds1zvuwZQE2UD6QaoVFtaiOHlyAJ+WxA=;
        b=ZjH3hEZmyKSLIxMMakXxoje+No/9SuT/nVbz/IGQOO4pb6rr+p7rkPn12EPJODKtJa
         +NB4WVvJWuu9b9bC8X7J/+lx1Vw2mg/8RftUasxDj0Y7YHzn8ssukz2Jn/hre9/215Ht
         qOTCQYSwpy5uv1kGlgcQ6aPJ5cmIxhtPshuDitHNM2ukmokfZ4e6BewxV0GJ7rs0qGUL
         eXuac39S4/VstaI1G+Ye90KzgK+HnQQM5ekt8tJsiq5p4SLlQBTwOyCERodZlOnfC8Lj
         TAEWgIOmQDhfnGCinUAUukX4wPwnU4ulG8M185P922U3RPXvqaKNJsjFGPbFaD9vOQTc
         W/gA==
X-Forwarded-Encrypted: i=1; AKwUvBx7A2Rs9qRUVtqmW6d3Y2F9qWQ6GdMyZ1llZlkvcUtkVRkuoT7IJ7iHe5C4wDQYAzGWn8T7pKoLWjRXci4b@vger.kernel.org
X-Gm-Message-State: AFuF++n1HiDuRDMoLLlfvFoLvOSy0pjFLUTHpJF0y7RIlrvLKX5Tn9AR
	DVLc0Ra701l+IR0U1VyiEpKIA6R8UlkBB28ywSWlK2GTHp/po8LcNBYhagmcoxKfEmm6HdX9Cd1
	+u6CiBj0lBPZy4FQX+njpcJEXobqheBHWaEiF3qKG4BKcclliwl8dd5D9KBxvSY5f6uW+
X-Gm-Gg: AYBFou0rkPEM2wMFVcj+HeAYG9E5bRM5HZlr3v+acegMYdI1NOfXlzt3T27sQ8JrYqP
	KdMOiDTLezjo/ey2HIefhkMoSR5E0IJYOYjd52+o5/WBMCnf4dKU7+UGAJwmlAZkQqxPXhCCoEh
	ed1tKeIHCaD0WMx/4Lu4fBov12q9WnxQyhAWWVLe422cijS4P2ZpJnulvoMm5k0CqtOGeBARuZF
	1o8ztZFxQYX984QKf18fxVw8n0uV/00ZdPzOt9TZXzkr/svoHbyHkvg0JzqcQrrK+7dIUO0i0iB
	f7s2sHw0z2R3+gOIV/GsMYDswjtGpOMfVEIetV3qRDSKM1NrQ2CGAUpAGrnSc7omS/a5O7ogLO+
	kSzS0/f/2vj0D73s=
X-Received: by 2002:a05:620a:25c7:b0:939:d675:f166 with SMTP id af79cd13be357-93a038b522bmr979731485a.48.1789308887260;
        Sun, 13 Sep 2026 07:14:47 -0700 (PDT)
X-Received: by 2002:a05:620a:25c7:b0:939:d675:f166 with SMTP id af79cd13be357-93a038b522bmr979723585a.48.1789308886417;
        Sun, 13 Sep 2026 07:14:46 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ebe4sm16693948f8f.14.2026.09.13.07.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:14:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: Correct inconsistent indentation
Date: Sun, 13 Sep 2026 16:14:41 +0200
Message-ID: <20260913141440.177169-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=14384; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=4K4J93pgjU29ndT2pO7eB0/fX0aJsfLjMkJogz8j4ks=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqpq/QETT2S+PHwGmh/v1sULymlBIKL4C6vkzs4
 7921v93EgWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqav0AAKCRDBN2bmhouD
 1xElD/4yZhl4R4nzcxPQPM4hCrEkKBPN7/zq9uwL4YXiCjQWMFq4RQ8z5xshoTyHNGGWfeUWf8H
 cj8RFwVcTGVFxCzbS9qwEQYSR8+usTU4Y/AU6/OSXmCtgirLIWyj7eHXKYBCDoCpq1934NKVKhZ
 MW5mcDAFT8+yjH1ftyM/sIzZA8Oh9InwJhUtz+MpitkmRPMndHE6PRZVfGebt7KGZ3v70kUeZQF
 HEkS8qz/1A8qaj2s+RWwpIXk2O7vjYTIAmv9xCkj4cYBsJnGOYdYXY7hIW5rUgFN+bqX7xVIu8K
 o0C6aUk4U11hjUQAHe/TLQh6tekXVFxnvqY/1SXrm3oFo6aUFQPeJVkFBLzUcNqQEOxuZnxkrBc
 78J+oZsvY/fnIHMecuXCyuftPNpljYYPPHTOh6nWuuDwhkR/7ffOhzDONerkLiGeV6Wn7+iplHo
 lXJnA1HnFOWdiHndqkRye4gXXkjpkFllRZ/E5djKbBUQ8YBkKo0mItAQBRz1vEhsrcGaF41qMe8
 VgSxDEfWXKWpJ6WHPQLdRRt1TOHlPKnLbfCNR2rOTYI80mZ+09A2moA3c9VkndQ4pzNF/JyW7s5
 3zYlYrEKNFWvcvJmpcIIAStJRS+TS1jqMerwwNd90UI8cGhlTj6LHDkhMXrHaeBSN/Mw2C8Q615 iY+brgGIBCFSGXQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDIwNCBTYWx0ZWRfX1L62lcFXCJ77
 FZB/30q8GHnh3+fRZr+6uhY8Xppt7JW+vtLpcBhiM3Hs7c2eWdJiYMSK81Z3Ck3Q+RQADCgnY0u
 SpiMToOxyqRJQQmnrq6BYM9fJq2HcdE=
X-Proofpoint-GUID: iiDI7fI8GVxb4YNRmL8WgrKNU-Ry_KAW
X-Authority-Analysis: v=2.4 cv=BdZNQbt2 c=1 sm=1 tr=0 ts=6aa6afd8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=tVI0ZWmoAAAA:8 a=jP-IZvqGofB6M-FGhCQA:9 a=PEH46H7Ffwr30OY-TuGO:22
 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-ORIG-GUID: iiDI7fI8GVxb4YNRmL8WgrKNU-Ry_KAW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDIwNCBTYWx0ZWRfX4dQeSk4RzRBq
 87+222+5ZbfXBb9Yu/py6gnvtW7HMVR3Yv1Ctrpoo60O5UkDO5THdrWbhWNKNtSs/Tx5QJU9Rbh
 LAU2sB07U97mRV2DJ0PQ/qOuA0zu6iQmPWj7bwTCifzqz907QMhp1m8sJ1XQ4RyOspPC1VoPg+D
 iB3nYqduBZ0pFF3sPY9biiS6GHSTCbhrHH7FN0x37iDlIJi2R3I3n88yELW5bUC/kofxBlFc/O8
 WjwORLjpSZEtQ0iNKGz7BOQpXv0ja2de6FfNm+D1JPzkd+FidkXDGwzkRMTfHQVpR29usvnRvCI
 KcB8ALnER1o7zmthXKUeWE6fUS5um783sc6KbbA0lIowv2T5lnJH51ULjOE+uSFS8JMvM8OF55u
 vzLNct5JqEii1O1/Bss002ZMxf8mHd8dpsDJ9hVkiKoYZ1qbts3/8/WgW4hWtVe0d6abxV80/LI
 SQ4Sf7jf3da7uttsQXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130204

Fixup mis-indentation, e.g. spaces or tabs mixed with spaces, to fix
dt-check-style warnings like:

  talos-evk.dts:39: [indent-consistent] indent mismatch (expected depth 4 * '\t')

No functional change.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi        | 10 +++++-----
 arch/arm64/boot/dts/qcom/lemans-el2.dtso       |  4 ++--
 arch/arm64/boot/dts/qcom/pmi8996.dtsi          | 12 ++++++------
 .../qcs6490-rb3gen2-industrial-mezzanine.dtso  |  4 ++--
 .../sc7180-trogdor-lazor-limozeen-nots-r4.dts  |  2 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts  |  4 ++--
 .../boot/dts/qcom/sc7180-trogdor-pompom-r1.dts |  4 ++--
 arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts |  4 ++--
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts  | 10 +++++-----
 .../dts/qcom/sc8280xp-microsoft-arcata.dts     |  2 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi           | 14 +++++++-------
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi   |  2 +-
 arch/arm64/boot/dts/qcom/sm6115.dtsi           |  2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi           | 18 +++++++++---------
 arch/arm64/boot/dts/qcom/sm8450.dtsi           |  2 +-
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts        |  8 ++++----
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts        |  8 ++++----
 arch/arm64/boot/dts/qcom/talos-evk.dts         |  2 +-
 18 files changed, 56 insertions(+), 56 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 0c5657eb0d30..02d3d26fec6d 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -4360,11 +4360,11 @@ qup_spi21_data_clk: qup-spi21-data-clk-state {
 			};
 
 			qup_uart7_default: qup-uart7-state {
-				 /* TX, RX */
-				 pins = "gpio62", "gpio63";
-				 function = "qup1_se7";
-				 drive-strength = <2>;
-				 bias-disable;
+				/* TX, RX */
+				pins = "gpio62", "gpio63";
+				function = "qup1_se7";
+				drive-strength = <2>;
+				bias-disable;
 			};
 
 			qup_uart18_default: qup-uart18-default-state {
diff --git a/arch/arm64/boot/dts/qcom/lemans-el2.dtso b/arch/arm64/boot/dts/qcom/lemans-el2.dtso
index 621ad930cf54..ceaab5f55fa2 100644
--- a/arch/arm64/boot/dts/qcom/lemans-el2.dtso
+++ b/arch/arm64/boot/dts/qcom/lemans-el2.dtso
@@ -31,9 +31,9 @@ &remoteproc_cdsp1 {
 };
 
 &remoteproc_gpdsp0 {
-       iommus = <&apps_smmu 0x38a0 0x0>;
+	iommus = <&apps_smmu 0x38a0 0x0>;
 };
 
 &remoteproc_gpdsp1 {
-       iommus = <&apps_smmu 0x38c0 0x0>;
+	iommus = <&apps_smmu 0x38c0 0x0>;
 };
diff --git a/arch/arm64/boot/dts/qcom/pmi8996.dtsi b/arch/arm64/boot/dts/qcom/pmi8996.dtsi
index 31b47209e261..711a01c7e624 100644
--- a/arch/arm64/boot/dts/qcom/pmi8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8996.dtsi
@@ -3,12 +3,12 @@
  * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
  */
 
- /*
-  * PMI8996 is a slight modification of PMI8994 with
-  * some notable changes, like being the first PMIC
-  * whose the bootloader has to check to continue booting
-  * and a change to a LABIBB parameter.
-  */
+/*
+ * PMI8996 is a slight modification of PMI8994 with
+ * some notable changes, like being the first PMIC
+ * whose the bootloader has to check to continue booting
+ * and a change to a LABIBB parameter.
+ */
 
 / {
 	qcom,pmic-id = <0x20009 0x10013 0 0>;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
index 5259f4f4f857..8b5ef889733f 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
@@ -33,7 +33,7 @@ vreg_1p8: regulator-1v8 {
 };
 
 &remoteproc_wpss {
-       status = "disabled";
+	status = "disabled";
 };
 
 &spi11 {
@@ -270,5 +270,5 @@ pcie1_tc9563_resx_n: pcie1-tc9563-resx-state {
 };
 
 &wifi {
-       status = "disabled";
+	status = "disabled";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dts
index 70d5a7aa8873..3390fd0aabce 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dts
@@ -17,7 +17,7 @@ / {
  */
 /delete-node/&trackpad;
 &ap_tp_i2c {
-	 trackpad: trackpad@2c {
+	trackpad: trackpad@2c {
 		compatible = "hid-over-i2c";
 		reg = <0x2c>;
 		pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
index b60060a38426..c70ad0398d89 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
@@ -19,9 +19,9 @@ / {
 
 
 &usb_hub_2_x {
-	 vdd-supply = <&pp3300_l7c>;
+	vdd-supply = <&pp3300_l7c>;
 };
 
 &usb_hub_3_x {
-	 vdd-supply = <&pp3300_l7c>;
+	vdd-supply = <&pp3300_l7c>;
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dts
index ba222a60c4c6..9eea257197f8 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dts
@@ -35,9 +35,9 @@ &pm6150_adc_tm {
 };
 
 &usb_hub_2_x {
-	 vdd-supply = <&pp3300_l7c>;
+	vdd-supply = <&pp3300_l7c>;
 };
 
 &usb_hub_3_x {
-	 vdd-supply = <&pp3300_l7c>;
+	vdd-supply = <&pp3300_l7c>;
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
index d393a2712ce6..1d9f3dbd9735 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts
@@ -53,11 +53,11 @@ &trackpad {
 };
 
 &usb_hub_2_x {
-	 vdd-supply = <&pp3300_l7c>;
+	vdd-supply = <&pp3300_l7c>;
 };
 
 &usb_hub_3_x {
-	 vdd-supply = <&pp3300_l7c>;
+	vdd-supply = <&pp3300_l7c>;
 };
 
 /* PINCTRL - modifications to sc7180-trogdor.dtsi */
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
index da82b51cbf40..43bd2e09119e 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
@@ -1366,11 +1366,11 @@ perst-n-pins {
 		};
 
 		wake-n-pins {
-		       pins = "gpio145";
-		       function = "gpio";
-		       drive-strength = <2>;
-		       bias-pull-up;
-	       };
+			pins = "gpio145";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
 	};
 
 	pcie4_default: pcie4-default-state {
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
index 765b029f8412..cc50805b43bc 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
@@ -1117,7 +1117,7 @@ wake-n-pins {
 			function = "gpio";
 			drive-strength = <2>;
 			bias-pull-up;
-	       };
+		};
 	};
 
 	pcie3a_default: pcie3a-default-state {
diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index e785854e2e83..3a1014804fb0 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1423,26 +1423,26 @@ sdhc_2: mmc@c084000 {
 			status = "disabled";
 
 			sdhc2_opp_table: opp-table {
-				 compatible = "operating-points-v2";
+				compatible = "operating-points-v2";
 
-				 opp-50000000 {
+				opp-50000000 {
 					opp-hz = /bits/ 64 <50000000>;
 					required-opps = <&rpmpd_opp_low_svs>;
 					opp-peak-kBps = <200000 140000>;
 					opp-avg-kBps = <130718 133320>;
-				 };
-				 opp-100000000 {
+				};
+				opp-100000000 {
 					opp-hz = /bits/ 64 <100000000>;
 					required-opps = <&rpmpd_opp_svs>;
 					opp-peak-kBps = <250000 160000>;
 					opp-avg-kBps = <196078 150000>;
-				 };
-				 opp-200000000 {
+				};
+				opp-200000000 {
 					opp-hz = /bits/ 64 <200000000>;
 					required-opps = <&rpmpd_opp_nom>;
 					opp-peak-kBps = <4096000 4096000>;
 					opp-avg-kBps = <1338562 1338562>;
-				 };
+				};
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
index e119ace54e58..8a60f304eaa4 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -218,7 +218,7 @@ pm8150_l18: l18 {
 };
 
 &tlmm {
-	 gpio-reserved-ranges = <6 4>, /* Fingerprint SPI */
+	gpio-reserved-ranges = <6 4>, /* Fingerprint SPI */
 			       <30 2>, /* NFC SPI */
 			       <138 1>, /* NFC Secure IO */
 			       <155 11>; /* eMMC Boot */
diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 3520802d1fed..0f2af8abacc3 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -1665,7 +1665,7 @@ usb: usb@4ef8800 {
 
 			resets = <&gcc GCC_USB30_PRIM_BCR>;
 			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
-			 /* TODO: USB<->IPA path */
+			/* TODO: USB<->IPA path */
 			interconnects = <&system_noc MASTER_USB3 RPM_ALWAYS_TAG
 					 &bimc SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
 					<&bimc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 90f8b091634e..7ebd53ebb58e 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3290,7 +3290,7 @@ in-ports {
 				port@4 {
 					reg = <4>;
 					funnel_in1_in_funnel_apss_merg: endpoint {
-					remote-endpoint = <&funnel_apss_merg_out_funnel_in1>;
+						remote-endpoint = <&funnel_apss_merg_out_funnel_in1>;
 					};
 				};
 			};
@@ -3306,7 +3306,7 @@ funnel@6045000 {
 			out-ports {
 				port {
 					funnel_merg_out_funnel_swao: endpoint {
-					remote-endpoint = <&funnel_swao_in_funnel_merg>;
+						remote-endpoint = <&funnel_swao_in_funnel_merg>;
 					};
 				};
 			};
@@ -3318,14 +3318,14 @@ in-ports {
 				port@0 {
 					reg = <0>;
 					funnel_merg_in_funnel_in0: endpoint {
-					remote-endpoint = <&funnel_in0_out_funnel_merg>;
+						remote-endpoint = <&funnel_in0_out_funnel_merg>;
 					};
 				};
 
 				port@1 {
 					reg = <1>;
 					funnel_merg_in_funnel_in1: endpoint {
-					remote-endpoint = <&funnel_in1_out_funnel_merg>;
+						remote-endpoint = <&funnel_in1_out_funnel_merg>;
 					};
 				};
 			};
@@ -3493,7 +3493,7 @@ funnel@6c0b000 {
 			out-ports {
 				port {
 					funnel_dl_mm_out_funnel_dl_center: endpoint {
-					remote-endpoint = <&funnel_dl_center_in_funnel_dl_mm>;
+						remote-endpoint = <&funnel_dl_center_in_funnel_dl_mm>;
 					};
 				};
 			};
@@ -3533,7 +3533,7 @@ in-ports {
 				port@2 {
 					reg = <2>;
 					funnel_dl_center_in_funnel_dl_mm: endpoint {
-					remote-endpoint = <&funnel_dl_mm_out_funnel_dl_center>;
+						remote-endpoint = <&funnel_dl_mm_out_funnel_dl_center>;
 					};
 				};
 			};
@@ -3701,7 +3701,7 @@ funnel@7800000 {
 			out-ports {
 				port {
 					funnel_apss_out_funnel_apss_merg: endpoint {
-					remote-endpoint = <&funnel_apss_merg_in_funnel_apss>;
+						remote-endpoint = <&funnel_apss_merg_in_funnel_apss>;
 					};
 				};
 			};
@@ -3778,7 +3778,7 @@ funnel@7810000 {
 			out-ports {
 				port {
 					funnel_apss_merg_out_funnel_in1: endpoint {
-					remote-endpoint = <&funnel_in1_in_funnel_apss_merg>;
+						remote-endpoint = <&funnel_in1_in_funnel_apss_merg>;
 					};
 				};
 			};
@@ -3786,7 +3786,7 @@ funnel_apss_merg_out_funnel_in1: endpoint {
 			in-ports {
 				port {
 					funnel_apss_merg_in_funnel_apss: endpoint {
-					remote-endpoint = <&funnel_apss_out_funnel_apss_merg>;
+						remote-endpoint = <&funnel_apss_out_funnel_apss_merg>;
 					};
 				};
 			};
diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index b8793482b181..ee19680acb81 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -3489,7 +3489,7 @@ port@1 {
 						mdss_dp0_out: endpoint {
 							remote-endpoint = <&usb_1_qmpphy_dp_in>;
 						};
-		};
+					};
 				};
 
 				dp_opp_table: opp-table {
diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index 41d0c7edc433..97dc524373d4 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -125,7 +125,7 @@ port@2 {
 
 					pmic_glink_sbu: endpoint {
 						remote-endpoint = <&wcd_usbss_sbu_mux>;
-				    };
+					};
 				};
 			};
 		};
@@ -905,9 +905,9 @@ &gpi_dma1 {
 };
 
 &i2c3 {
-       status = "okay";
+	status = "okay";
 
-       wcd_usbss: typec-mux@e {
+	wcd_usbss: typec-mux@e {
 		compatible = "qcom,wcd9395-usbss", "qcom,wcd9390-usbss";
 		reg = <0xe>;
 
@@ -929,7 +929,7 @@ wcd_usbss_sbu_mux: endpoint {
 				};
 			};
 		};
-       };
+	};
 };
 
 &i2c6 {
diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index 1fb78588a504..e851114f1155 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -86,7 +86,7 @@ port@2 {
 
 					pmic_glink_sbu: endpoint {
 						remote-endpoint = <&wcd_usbss_sbu_mux>;
-				    };
+					};
 				};
 			};
 		};
@@ -875,9 +875,9 @@ &gpi_dma1 {
 };
 
 &i2c3 {
-       status = "okay";
+	status = "okay";
 
-       wcd_usbss: typec-mux@e {
+	wcd_usbss: typec-mux@e {
 		compatible = "qcom,wcd9395-usbss", "qcom,wcd9390-usbss";
 		reg = <0xe>;
 
@@ -907,7 +907,7 @@ wcd_usbss_headset_out: endpoint {
 				};
 			};
 		};
-       };
+	};
 };
 
 &i2c6 {
diff --git a/arch/arm64/boot/dts/qcom/talos-evk.dts b/arch/arm64/boot/dts/qcom/talos-evk.dts
index b7f514fbc7b2..2ec3710a227a 100644
--- a/arch/arm64/boot/dts/qcom/talos-evk.dts
+++ b/arch/arm64/boot/dts/qcom/talos-evk.dts
@@ -36,7 +36,7 @@ hdmi_connector: hdmi-out {
 
 		port {
 			hdmi_con_out: endpoint {
-			remote-endpoint = <&adv7535_out>;
+				remote-endpoint = <&adv7535_out>;
 			};
 		};
 	};
-- 
2.53.0

