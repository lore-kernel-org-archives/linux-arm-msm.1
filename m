Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C74369D6D
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784376396; cv=none; b=or29HpjypLJQj/xG1SmkdSdNY9KqA1n4crVOu8QqmhrPIEiP2ZnE3cO41opbAu/7RfVVYGcC9R2YsqXzHLgavICEvGQrsK+HLNg7neN9Hwp0e2mYVFixY7lL5ipXk6JOJqj/riPnYnVmvo2rMtEAD641jhCVTDNoaYpWHsbA9Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784376396; c=relaxed/simple;
	bh=TzedKeXLAra0qSDuAmNNbQ8B9mFMFD7tPwtLylk0Zr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nUyfdbRiZ2jOXu9iOIZVtZlQaU5LIvHaY/6+3vEgaCNVwxIj2uC3Rf2jvuXCSi1kdQxqBVzqr4ZkOyH1Y/4Nrata1nZS7p7ZUkN4gF1H6WHHMVv/X+qU6injeQV0j/QsmUsVDSPHc5RnEr3tIi9uuAC+Az0Mc5VI2ErYB5TNiuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aMo2/q2k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JcMfzMNZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aMo2/q2k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JcMfzMNZ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAHI45178664
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:06:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0YOdxBIZwoWE6E4CSFecEE4QoWdP1KZFLggfwv4koXU=; b=aMo2/q2k0gcq9olC
	+RqAgM7mIzd3E5nWEnLTUmzw4wW+o0wOs2o4j3Gw13PEcpM6ipwmfoa2vPShixwr
	MpnAOjsDZ36umqjDYkUd6bcfPDIupIbpOo29keMQv298TpylBQDSyXO5oZCYNlRl
	wIzqUrbH+MFv9USVo1+jQXDq3QRkGwWcStYH4TO2lpGIM7Q/jdRXOFyZa1QcNWu7
	hZVpDpyAFMxGpsGatR8jhFjN68dCLr/jZ9WXp/eo09Ggm9y4XQJWvBTEmSB3Hcpl
	+47rOHYkwrAeg/LMzc/L4Vy5nC/pz/ucSBnFArluy37wyii0rhHPKIPNKE4lnxAg
	7d5Www==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2s7rmtt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:06:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccb6823efcso78399415ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 05:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784376388; x=1784981188; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0YOdxBIZwoWE6E4CSFecEE4QoWdP1KZFLggfwv4koXU=;
        b=JcMfzMNZi3CkHv6IAHKiD5u21GrV10F50c0E/qQUXG2XNbaU3X0tZQqMrZYO9VtPPe
         nRNXty38WVEz9GWUnX0PsQyJPhHPvNlBoprfoyjPEPBfzSAoZnLy0AjB1hcu/KcZWjem
         Ojwkt8j1eq0+gVX5Xanf1FQeJkKXidssoXjxaXiSrXrD3YjZEkNysCcr3Rv3XbJuSQtA
         z9iLwvIMVwZjWJm/z3JezKV8Vr7CA4wH+xpkOr/cNa4ssQfGun5ERY//qg6kIzckpBis
         p5eSXXDoBocQn0Rlt5GfAapPiERSkzi2Q/+Tb0IJMuBeOX28CmbiihD/dA+z+A657pGh
         OlGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784376388; x=1784981188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0YOdxBIZwoWE6E4CSFecEE4QoWdP1KZFLggfwv4koXU=;
        b=Ju1kODaa9ceQt1Pl15Et51qqrzcV7s6fmStTbF1VrFljEpxBHf98pOqSX1P+sdjvY0
         ZVvLHMEFpXjbycoYsZQ1HYd4KtGpbavoGz8Q7jfPsRgc1djuheRFxvDMDWMTWdSk2Vtd
         Ez8nGeN2tAgxoC4+cHeH3YhXkYouhJwIDUe4txIRNEyvqT5eqnKbNZ/+y2Ew6IYAWLHT
         bWXlXsJ61NY/VCyvg6G36DcT/XRKv4CeXVSOxp5Y8Q7mk70baelr6azBI7HmCnDi4g0L
         OIKkQlOFT68fxJtcxzsjdBKa6YuwsGvxbvi+XYfWno+ZSbs/iYy66sikHNf6DW1YhBNA
         aYrA==
X-Forwarded-Encrypted: i=1; AHgh+RoM7oU08rQhsN4KPsyJzDNccRJq0irh1uOrJ2WI/x2EZWkf8xC1jWKIOJDWbFFnbJwDX3irOF1FmP9t6CdS@vger.kernel.org
X-Gm-Message-State: AOJu0YyCe2sYCvGJoC8/BJjZ42GDnkxJhMPriz6l3tyYFqjhwyoLXO7/
	8C2rWlVIRmT4yNo9mdvE6duSXb8cqq19rku+F4lXFZhVXa2iqfhBMiH4tLQr45TfZ4MPPwNI5ya
	iHQO9E/zXI7uSuLmn6u4sJuZFZ2KZmwFC3JLP8sWri/Vc/bq4yN0HWuWTcQeujsQ9OZMG
X-Gm-Gg: AfdE7cl+IoSOKS2R2F0IFVk04gxjUQPzaoZLAtltjWnQf+kIYjispeXyIT5snJ/Nd/p
	GSugwSkUIUS/gQ4TMMOIZ9urqpPyfJJJms2LY3WKoOYtoPY3bQ9yXDvIxd/UA1wuIMriMvTGKyl
	Y9OAeDluVa2d5ROAvne9Gir0KDUQMQMAze3D4AkVZEt8Jk9JQQsS0Y1o8knAv12kuM8HVhpyVWh
	66l6i1VjbZyoHwBXrgmhsVW5BsPeI1cejUlljVm1uYDyg3Sm7YtJzJzKD5ikEaR2kaoG6U5kRm1
	9BDUvky9RPhMxUsU4Jq94noJRLrF1Y0oDw1EVEvmy3MBPly8HxOwh3Ej+c/WQLn66PEolaemjMG
	utehT0srRJ+tOcwRX/IDOwowO1tzkRW428Fx/8Hx3d9pNzi1WcQDv5n+sxi8ymFbi
X-Received: by 2002:a17:90b:2496:b0:38e:6497:ca45 with SMTP id 98e67ed59e1d1-38e6497d57cmr1034248a91.39.1784376387912;
        Sat, 18 Jul 2026 05:06:27 -0700 (PDT)
X-Received: by 2002:a17:90b:2496:b0:38e:6497:ca45 with SMTP id 98e67ed59e1d1-38e6497d57cmr1034218a91.39.1784376387314;
        Sat, 18 Jul 2026 05:06:27 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429cf22b3sm17666314eec.0.2026.07.18.05.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:06:26 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 05:06:22 -0700
Subject: [PATCH 2/5] arm64: dts: qcom: Add Kalambo SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-b4-kalambo-crd-v1-2-a1069b5a2757@oss.qualcomm.com>
References: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
In-Reply-To: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784376384; l=1899;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=TzedKeXLAra0qSDuAmNNbQ8B9mFMFD7tPwtLylk0Zr8=;
 b=oDb6ubnUbGZfNlz77xf3rrOOEG3fNj+RNlaP7aXCLvqvG4Kkzv6VLVg0LFlgHjW4WoXIWtDJJ
 9TpRInqWyaRDFFCPboSM2rNBsboiPDE9wd18xN8gV69uxXxW1FoNeSu
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEyMiBTYWx0ZWRfX0ld0+JurAUDN
 kCMFwXhmRt6hp+ekptNTtrVlN9Ne8Y23OCQPHfurSU/8WuXfAL+oA4byd1N+xrad+KAw5+C9Myd
 62AEDJZJezbIJ+DFzdKLTiXsdGPsuY8Ng9+KV2E/tlJAGyL5qKlcAQVVWT9zqgrXqX9L34g0GJW
 n9No6IwRbNIugf+TYMP5ekXVHrdh3kUD9k/sCJ4oDSPeaESYa6yNDchfoBa+TwoOOVeBFyxsykH
 4CtUHri04lCpEBWYTh4p75DVkwqTFL6xpJ6ro7Ccxy97GNpk2ocApDuR9gcfDl6eqzpQbumAHXi
 RlUKT04QWoE6pw42UoeVmI+lD3FwvkT6AUrBC8PBTO+iQnxZA13MMcoBjLIHnuq/Z+ar0MHX1Q0
 /g49EBfJA+Vdf7rvPR/+w1+I9oAHlrI2507v+eTXJ3jk0Mn0LeXP6iDQbnZwYqQbKOlgLxsQnmr
 OpcO3qmooWEpDp9lwGQ==
X-Authority-Analysis: v=2.4 cv=eKsjSnp1 c=1 sm=1 tr=0 ts=6a5b6c44 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=CupqGq-JItAhHe7bgGQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: hDjiQAGCR5w-j3PXxzxsPcAwSSiQHO6P
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEyMiBTYWx0ZWRfX/ay1Ab+ia5cM
 fv95ZRSig3EpgNpz75vJqj7OwNO5KaaTZLBe6TkKEUohjo+a8gA90btSBpBB+frhZiRpvYp0UOl
 Ro0DNdPmZE8PcFW1fw1QObssvpSWY+k=
X-Proofpoint-GUID: hDjiQAGCR5w-j3PXxzxsPcAwSSiQHO6P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180122

Introduce support for the Qualcomm Kalambo SoC. It is derived from Mahua
with CPU cluster 0 removed, leaving it with just cluster 1. As a result,
the PDP mailbox and SCP low-priority register windows are updated to
match the reduced CPU complex. Everything else should work as-is.

Add a label to the Glymur cluster0 cpu-map node to allow its removal on
derived SoCs.

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi  |  2 +-
 arch/arm64/boot/dts/qcom/kalambo.dtsi | 29 +++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 55d91c696a3a..f2feef362be5 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -275,7 +275,7 @@ cpu17: cpu@20500 {
 		};
 
 		cpu-map {
-			cluster0 {
+			cpu_map_cluster0: cluster0 {
 				core0 {
 					cpu = <&cpu0>;
 				};
diff --git a/arch/arm64/boot/dts/qcom/kalambo.dtsi b/arch/arm64/boot/dts/qcom/kalambo.dtsi
new file mode 100644
index 000000000000..a56ff68b57b4
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kalambo.dtsi
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "mahua.dtsi"
+
+/delete-node/ &cluster0_pd;
+/delete-node/ &cpu_map_cluster0;
+/delete-node/ &cpu0;
+/delete-node/ &cpu1;
+/delete-node/ &cpu2;
+/delete-node/ &cpu3;
+/delete-node/ &cpu4;
+/delete-node/ &cpu5;
+/delete-node/ &cpu_pd0;
+/delete-node/ &cpu_pd1;
+/delete-node/ &cpu_pd2;
+/delete-node/ &cpu_pd3;
+/delete-node/ &cpu_pd4;
+/delete-node/ &cpu_pd5;
+
+&pdp0_mbox {
+	reg = <0 0x17610000 0 0x8000>, <0 0x1a980000 0 0x8000>;
+};
+
+&cpu_scp_lpri1 {
+	reg = <0x180 0x60>;
+};

-- 
2.34.1

