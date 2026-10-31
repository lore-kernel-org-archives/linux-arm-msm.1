Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793452255;
	b=YTyRt1nZAu7jnbw6HYLUPcixvQOw86manxKE1drX05Rk0Z3pM3gjdvYTpfDNjtWKjPjP
	 FGVayZDEdUV0hISe6rymHJxBGCGyLukP8ddUf42YqvB/vhRGgHpmLW5Km9A8tum6oCCN1
	 /LboT0ofynMblWOSwED+b634VGaxbIP9OZesVdxzQzSGRUXlkPgkdb79D1XpWUEt2a5+U
	 1cg7+JulSJE3Hmcvlsbwt8HGMOmIIbRfmL8mnca25TStoCikAgU+019wyS56cqTIaBDhR
	 RuLktGL3uZOgDhS1UlnhKmXkCnTEF6k8Jg6MDH1B0b5NUZZluR2FyaplSPgPRxmyqOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793452255;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9plYplCg+Zpar9zdm7dgG/Bqo3Nf+7WuF43gMc92jn4=;
	b=LiG+BLXljoBdHgM3rsQnfcvc3B/aDQsCCYDv/lqxHeNauGspLKFe8ClBJRVWgC4iBZ8J
	 imzim2BjnG4yNlZWFXyEGqPc0bm1Yi/E/A5eziFJXLIO6CnEya2cfxG2B0FkgQb0pC/k2
	 B7XMWE2D7MQUqLYLyy6aUnVYKMQT+aRMEr8IQ1lKDhb2CXd9mjRDR+tZHp2MECnnVdybf
	 OFA6oiaset4UHC/JMKcXaLorxCxaMKry7Q4yAEN8+HNjgENoP0xH94nF8UlaB6GbdTdX3
	 0wuRDVOqCIfv1b8RkcfEZDmHRtQNJmyEKaHkzABNfsqxNtYjjdN8yCIbuTJgTfLP9RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aKOljNQ2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="XzlS/wF9";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0380F606A31F
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 13:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0380F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aKOljNQ2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XzlS/wF9
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD0384590508
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 13:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9plYplCg+Zp
	ar9zdm7dgG/Bqo3Nf+7WuF43gMc92jn4=; b=aKOljNQ22x0O9QQY1lMM3nMFPpx
	kg9uOzvtYtjhpu5fKZws7vF+0AlmvqMyqMeW9wTHjtRDbpgCKGOxoSbY1lWvRyOx
	Td+s1mONSn0xySqERBXMFrRLVhwCzbx+F933hXfxT+1Q9LEwUjf16X18yYzB4O5Q
	TE9IDB5VWUTDYYouZKWPPiW4h7uBlYz9wUeNjPgAcWjMvzDQkACCN4fRIC2hnjml
	DdBlhuNGydzENvla9ZLYcJAnbOaLX7TqnQJh1BGYFogjlZS4HC+2VYJylUcnkZJ8
	0kb65MHXBnVrY63lwUzM6jp6W64xRnuo5j/Fx7FSi+DKdDGWPkgwiuBFKEA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9gk0ygv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 13:10:54 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36637676140so2323760eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 06:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793452254; x=1794057054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9plYplCg+Zpar9zdm7dgG/Bqo3Nf+7WuF43gMc92jn4=;
        b=XzlS/wF9Wl5Rv+/c2jytnzE366iKeIsQJKtZPEfKNLdCPi9qYGWIdgqR4Ni43nzxSm
         U/t8CXqjbNhuFtij2nU/0LpdNlvGa8kQLxfO/xf3pNw6By1x4mtUgjY6KUEyu+YjagHU
         EcWd0t6yII+8d64eUghHGjSDvt6gUy4HfqRYfTlf8RPH5jUWFIqjPUaQvgIV4YroqlRn
         C5s9rhf0yug6P3zWIJQ1k1T6rH+WZCej9xxe5FB6NCTH76fFlY3OGM9aa/MvmUUiU+3j
         Qm6wxmXsIthwwitr5zZG1ezSJlGoIMOd8GVr1nq3oId7FiyCoUCcZni2jQEaBSbTF75Z
         6U8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793452254; x=1794057054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9plYplCg+Zpar9zdm7dgG/Bqo3Nf+7WuF43gMc92jn4=;
        b=MTfEbEe2DVaYL9LsQm6YK75Q+J10mLT2eza0Dwpg/YMaLFfFhEWEfF5HDOqaKTgSK1
         w2WEkamXj3EoOIuu9H24jeb+Wuxp/Oz7jlscii3w5P9gSH2S5x4YkNLeC+czrBhihVj0
         Ay/cp6QbTwlSUPeNBYUOSs0R48RHHcsvI2OFxveb7m3Tdpatyjnr458bDipqjpX4EogH
         lm7Ck04PrRpXR4jcyDOMn4+ncstEWgtAnYh3N/Nr3S0JJPm7Jii6mU3Q7RIWXhNCbUtP
         AkVWyxV/PIBSIYuN7NH69oRxmcZPRTKZ8zHwoKib45yswVcKVSdjhCyKZ/8vQvfq4Ady
         TJow==
X-Forwarded-Encrypted: i=1; AKwUvByTwZjVHEvd4ecapj989jg4vLU49YBg3ULc1gELfNM3rkTM8llToFXwkXCsW2StGSZJt3yCVfbE1L6P8ojy@vger.kernel.org
X-Gm-Message-State: AFq9FYIoRMrJJfKqXURGgpP1BCfxRYoh0gVzKSSH48hbuQGkS1zFe1VK
	OmBjoY7rnKLTctYE9Zs4xwwrLNf/j0iW8u7vb36LGb4nme5aB2WseNfmWVk2FFXQhJVram9Tzx1
	W74a24U46WzxlnN+4B14tdUPMfhJWu8LcuuqKXyd0FThOmSvw0ue6NMB3xf4yJwlZ47oK
X-Gm-Gg: AYBFou3QVJEnfX+vS6gR/iWGQSwcUCJuykRkyVeqsvLjfzoM/7clhd1i0HPN8VWYnU3
	hys5LymdyywTHUmjnZko+uZ3m186g9VwlRrovHTe9pyHdMgXDQsdBcCshbaMoPx9kBl6R6tvuxa
	xH2tDznQioJLOtfxDhaF7KIt03Y4e87p2+TFzVXoC7BbyvhAo6YN/ZkxOrWss8aeHyZufORniQb
	EAauouTzBilp+ugr5C2QBEc/BboCwkTCf4s9iwm2/505aJBJqssPdbFk9E3B/Pz2j9gEq0PVt57
	W1BRguThCvJuwrRjH+opTD2RMTx5/MjBREgrl8bhOjQlRAmOUc3LZLJ0GNdMp9y6V7AaAgJE7tI
	0kVndEo+VPOc1521se24nK6fBgbDXhOiloBFWqkMKol1+micHOL/lGIXtEKaEGZTEL6Bwe1pzoK
	B8V6VYSAoYwY5VQCn/5/PGSmm0EfKBpE2u
X-Received: by 2002:a05:7022:1112:b0:190:596:4071 with SMTP id a92af1059eb24-1ac5cb1c1ebmr7854184c88.11.1793452253437;
        Sat, 31 Oct 2026 06:10:53 -0700 (PDT)
X-Received: by 2002:a05:7022:1112:b0:190:596:4071 with SMTP id a92af1059eb24-1ac5cb1c1ebmr7854147c88.11.1793452252732;
        Sat, 31 Oct 2026 06:10:52 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1845817csm15717872c88.5.2026.10.31.06.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 06:10:52 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 1/6] arm64: dts: qcom: Introduce lemans-embedded.dtsi as a placeholder
Date: Sat, 31 Oct 2026 21:10:37 +0800
Message-ID: <20261031131042.1200862-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031131042.1200862-1-shengchao.guo@oss.qualcomm.com>
References: <20261031131042.1200862-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2zl-iBwEGpRN0umKsRCHNz8ZFCnvDhTj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1MiBTYWx0ZWRfX/8w9Kk6HqTlY
 FNCibvNHALkCIEe9Z9KnxDejJB/iMWzWekrnay6b6Bl1HkoALLVSID0NYEF3BRBXDsvtj/hWpdb
 vOZ0pGNZ6FMGXIo8ozOpSmYIipyzGPwteO8BD0vn7rg83CDfuUV6N/cMexvjkVShP6obOu3DIsu
 qBr+r23wVH/Xhedp9raMg3kE5fcMeBOsDQ3xqLIUV/L/a+jdQ69qgJ1dfMFXgAfzz40Son6Z0T5
 AaGo9OW5asQAm0UBms+5XZ84XdchUByIjHitg7U1/brNNVA/+SezLiyaMarIPmqfU9gQULzrQtG
 XzZcYgT3qB4zFWql/Q7aPwlEFjpBIfPnnAQO0vEaIpgQOQ5cZZ/Cdj2UW55nxrnFzruWt8bpy7S
 pOrb+nEeFhrXGg+ulF8GBMMo5YbeV1eztHPrGkKlvW5Z9kmplSDuvh6WhgzQZl9JPFXtvQES0u9
 rQl/XrCqMWFZlcsw49g==
X-Authority-Analysis: v=2.4 cv=HNBWhYtv c=1 sm=1 tr=0 ts=6ae5e8de cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=5r3D8o42p4VsMVMPxZsA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1MiBTYWx0ZWRfX22W0Vb9xstwp
 n140IXXtOnBhWHNxU62aMfPjJoAu4QpCccfEoLVgf0qsZhZe2oKniyjOBjIJ7ZQDlps4DecMmQx
 j82za0qkBwSg9+gOLZG+G9zwbSGPTqM=
X-Proofpoint-ORIG-GUID: 2zl-iBwEGpRN0umKsRCHNz8ZFCnvDhTj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310052

Lemans is a Qualcomm SoC family that includes not only the Embedded
variant (IQ9/SA8775P) where platform resources are managed by HLOS, but
also the GearVM variant (SA8255P) where resources are managed by a VM
as SCMI server. The current lemans.dtsi covers the former variant only.
Introduce lemans-embedded.dtsi as a placeholder for now, while later
changes will move Embedded variant settings in there and introduce
GearVM variant support.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi | 6 ++++++
 arch/arm64/boot/dts/qcom/lemans-evk.dts       | 2 +-
 arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts  | 2 +-
 arch/arm64/boot/dts/qcom/qcs9100-ride.dts     | 2 +-
 4 files changed, 9 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi

diff --git a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
new file mode 100644
index 000000000000..80d8c75e4895
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "lemans.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 23cf20f9a178..603a3fa18994 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -10,7 +10,7 @@
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
-#include "lemans.dtsi"
+#include "lemans-embedded.dtsi"
 #include "lemans-pmics.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts b/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
index 7fc2de0d3d5e..a2c70018e571 100644
--- a/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
@@ -4,7 +4,7 @@
  */
 /dts-v1/;
 
-#include "lemans.dtsi"
+#include "lemans-embedded.dtsi"
 #include "lemans-pmics.dtsi"
 
 #include "lemans-ride-common.dtsi"
diff --git a/arch/arm64/boot/dts/qcom/qcs9100-ride.dts b/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
index b0c5fdde56ae..7597b4f27e78 100644
--- a/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
@@ -4,7 +4,7 @@
  */
 /dts-v1/;
 
-#include "lemans.dtsi"
+#include "lemans-embedded.dtsi"
 #include "lemans-pmics.dtsi"
 
 #include "lemans-ride-common.dtsi"
-- 
2.43.0

