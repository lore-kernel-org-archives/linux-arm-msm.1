Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29C2217F27
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790253207; cv=none; b=uNpmdzm/s0dnWPKhn3O70eBMG0WEmvtcRHcfQhk9pJtLX4TXV8vy1JI5TMysG+A5Ya9ZyihP8XlIYhx6CAtrfOl8egqrXcG9UJi5fRIOD16a8wkM0fclM/f48+nnybL7QOXE1uKHs/M690/osN7yAogNfZQnRvtnqa927h0w4qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790253207; c=relaxed/simple;
	bh=BAn5aAgxV8jkvZUUVJzIoWcDo2Jh/DvgwG+zj1G9UHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DZ3me+/W2suLmg0FtzvVJC/VLuG0uJDXywWKpQPR4t39rCUE5BIKFMJCD/HJY35M4Fc/uQ8a/WfXKkYwE2PBtIvgUchCaqWg2TNtxOlBnqyjzDdO+GHXpvkniUeOiWuj9C+edTDJdL3YnhWc3nIH9H27xXfVVJoRcFhog1+0Jj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=las+aDOs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O7P8ACDA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="las+aDOs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O7P8ACDA"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC53252002556
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=j1JhjxYMfO7BOGaU49ffGn
	g16NJOkOo+MKEHoAorM98=; b=las+aDOsuQhh9IozvnoicSZFgQ9M+0at4qgXtI
	RpDDpLkb/SMQWMxI14iRTVChMu9zSu5Fu+gRqQ/l9orFlQWCkvv6e02q1MA7bfbT
	kEN4ant2pFZtreB98f/UU9BXTKWUfxfMWymAXg26N9oy2k3EfAInq/uCjNk1OERv
	23nLpVDopiscrroKnxUsjDHOgH3hj7d3mRf3yr+vAwpVfE9CU16C6+FmdvkbI8Pc
	GnGuqxzN3XC64uULEx7ZASnDHJYicfRe11IXMxMVsFqPkWzufJ9U+7bDHfmJSDcB
	1IN+aofu+mmDvUpimcNqWCFSiXQpPSQMbo0wd68diM7Rzcng==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvmrrbh85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:33:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2db8c152622so13275695ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 05:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790253203; x=1790858003; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=j1JhjxYMfO7BOGaU49ffGng16NJOkOo+MKEHoAorM98=;
        b=O7P8ACDAxEijSuWDo7pssFc3mRcx9lOS8t0pwQD5Fr0CrZ7iQbF49gAcCp+duPj20F
         y7SeWgj/rk0kdlsh/ww7Bdd3f6J3K+Ydeu6WVXuZsa0Q94WNbZigEYMc0m3ftERvMQe3
         TMuX9pXZHcTEyAz9xBWHS9ECBhTQmysD4nCQw8HX9XD8qW/JQXptOmve1Ajpc3BMS5RR
         vdBqZI7Z9BHwNN/S3B2gcCLWriVeoKVnGgtfIJ3eNRGpLe5sRykRKMAox5QKetmXA8jN
         h/QzpnUeGCN4TW5pntDjBwv2VKwf06cVGNbmVBR65GuGVaHznsEmcNwA/aOZ+ruir44D
         10LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790253203; x=1790858003;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=j1JhjxYMfO7BOGaU49ffGng16NJOkOo+MKEHoAorM98=;
        b=BjsanQfTGjHJOfRnXyKTMGoHc10U578Pe330TaXhwfdNOTleAld7HcILx2VtmtDx5u
         x9VfBF4Q6cqUSd3hdZZRtXFdiKfSekE0jO2NYLhkhohQgCbA+3Us7c5EqpCIvz/FjGXJ
         P8Cg3F6arL9JVgpZ6FOqysfbmJVcYnRHXi5WtXCGBjmYZz7ydAqvrWj7mzGPyqb0fBjI
         ktLT2q8Zsp5sbTIR9fRH4Ofgo9gCKEgiwYB45m4SsQY8DPDwpB98YDYR18g19WbNvJXz
         Rv5oL/dpBM6si8T0j7YUMAxLDDOUzJ14v8Zt/yFMvqZo+Fs7xfiMh1iCYoln+oIvoZ6e
         7Nlg==
X-Gm-Message-State: AFuF++m04aHznqdluKicoP49Dc5i4NwVTBF1QPQs3bF+YLfacmyu6Ztn
	zgRoCi31rBP1rtYwh/AN6HGOXNKo4iK0D+Eu5EYPbIvTHkunbkDkKt8aiTX+4+t2pvBz50QODFc
	o61GuDmvnzQNVlF+9yWYMd2C9+HlsVhqnLrTwCHskY5xXMiiDLxPMHsjtv5scD+2JGk0K
X-Gm-Gg: AYBFou258q9f/kmb+5Fsb/yR2izTJmS26cVu1O8HQDOB3NR7EqVPCZpbNpaAJGPfuAa
	G8SYVtgpAaIt2qZIdvOmrko6gccwYH3Gu1z3f9xCLyUG7meYuG43kR2rand3hwPjWRu8VajUsbN
	yUw33ZC0fhJwhZSAbQUIjpsloiMpjWEEAOIesOvAEl8dZC9HeCzaNuN5rrB31B+HXokmyZ1ESZv
	lbnqHXai/g8uCHmfqjd8AUwFruZR9NMLq7b4sg6hD/KE404LNxZaq+yQyrfjQUDyTWVJESWFfDX
	AcQ6Yata2TKFvgsaIFNq+f4qFGhHFwK6meHpYWSOvcRCZpKd7qY5570qmjM1ofc8zN41Pj3ITAf
	w4UBXB9cgidkWWw==
X-Received: by 2002:a17:903:1a24:b0:2da:ef81:37e7 with SMTP id d9443c01a7336-2df7de905damr19626615ad.21.1790253198390;
        Thu, 24 Sep 2026 05:33:18 -0700 (PDT)
X-Received: by 2002:a17:903:1a24:b0:2da:ef81:37e7 with SMTP id d9443c01a7336-2df7de905damr19624505ad.21.1790253193100;
        Thu, 24 Sep 2026 05:33:13 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5164c0sm26298365ad.6.2026.09.24.05.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:33:12 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 18:03:02 +0530
Subject: [PATCH] arm64: dts: qcom: shikra-evk: Add GPIO expanders
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-shikra-gpio-expander-v1-1-71929498ea44@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAH0YtWoC/x3MMQqAMAxA0atIZgMaqqhXEYeiaQ1CLSmIUHp3i
 +Mb/s+QWIUTLE0G5UeS3KGibxvYTxs8oxzVQB2N3UwG0ymXWvRRbuQ32nCwIg3OGUvzPpkJahq
 Vnbz/dt1K+QCK7gmcZgAAAA==
X-Change-ID: 20260924-shikra-gpio-expander-25ff4a29c848
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790253188; l=1433;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=BAn5aAgxV8jkvZUUVJzIoWcDo2Jh/DvgwG+zj1G9UHQ=;
 b=R6GAmqVgeX0epgeuCzE+91Oh6SxFUp6mRCOFLzKb9fMJuxMtjjZfFnpEIfLE6wpNywnt7KsJr
 ZLS64eUrRi0BaETNOW8AJcm3IGIOOzoTavVjlWLWzBAdNYQRZMdBa0C
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MSBTYWx0ZWRfX9uz1JxWFtp+J
 ajl3tHCqCibaWn9WIBFietKVGZiHNkwLUbIJh+jW1VftZxaXZDWg4IG+ll19ynYDps/aGS9sidZ
 PoqWyEw/F+Irh1b0Kts1LxTfQShs7Wlyg86RUbv2yiY7GqXvRvdKx7PZeuHn0pEyIUOEv7mDrjm
 aW3Nlx7jsBK7nBAWVjj6oSbKtlgKFzzL9NYYs8pY5diCjoh8hOtEttUlETYMcPZiWaVWLogkTPN
 a+cqWPj4bxNXvlWGtFY0n7WvVyR4kmI+LmcM4Ql8xg8tXAyNrwyvATvAQrTw3FSJWHzlMCFAdDB
 p1/laiqrteTy4Dg9Gcjxlju2oWPwhsOwYmpkJd2K849CG7cOiYmhO0fQdL6qX6i0WsnWfe7a2Za
 aUmw5vI5MDsTYQTBFQb8S/YKO4pBlrERbVpM7nWfqgCj7RVvllNLcSPYxtATiFmmvjGLjNjm9lh
 7Zx1veq5ZFFsdVLPbgw==
X-Authority-Analysis: v=2.4 cv=TYwDJhQh c=1 sm=1 tr=0 ts=6ab51894 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=vI5slWehT91-5SZ2dYMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MSBTYWx0ZWRfX4Bogj4rI5c+t
 QD+J87LTKO6crdosYyLOkth8UPX2YSUY+dhAY8In9gkFfv+8nPvupPoUWJwopBeyOomEE4N9kD7
 BY9Rct0GqWJXX0DjIJdJPnAB0V7NJHA=
X-Proofpoint-GUID: U40X788MkV_zeKkLeUfTT-Mozo0sJX-D
X-Proofpoint-ORIG-GUID: U40X788MkV_zeKkLeUfTT-Mozo0sJX-D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240051

Add the EVK GPIO expander definitions on the I2C3 bus. Describe the
TCA9538 and TCA9539 expanders used by EVK boards.

Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
index 0115fc9095b3..04faf09b21ae 100644
--- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -29,4 +29,32 @@ tpm@0 {
 
 &uart0 {
 	status = "okay";
+
+	expander0: pca953x@38 {
+		compatible = "ti,tca9538";
+		reg = <0x38>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander1: pca953x@3c {
+		compatible = "ti,tca9538";
+		reg = <0x3c>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander2: pca953x@20 {
+		compatible = "ti,tca9539";
+		reg = <0x20>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander3: pca953x@21 {
+		compatible = "ti,tca9539";
+		reg = <0x21>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
 };

---
base-commit: 3d7783543c2646af69ad65825e810060494bea21
change-id: 20260924-shikra-gpio-expander-25ff4a29c848

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

