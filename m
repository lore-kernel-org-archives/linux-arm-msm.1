Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794484840;
	b=K+TZgPWQvJKCXj0H4HHT83FokdMoT0vmTi3EJVZRxC06PTvb6su6xFEDgSV46l2+lmdS
	 PSBa4tKWAZDk72wwnsPmUjdbOWHBUIM9dN9PjMfRrAW/a7TFc/LapTrEekxVHjfHt4Q0v
	 8XAC84FGtaktGWbXhnsR/CeUmQ6xNMA/6P57nqV7hngyvqNzvqLDv4HamQhYYNyWFWHNB
	 MjRw1kCdtb2Mn4Dfex2+pfkcV05KGUeiKGgnyQ8Aj4+Najyd0x+NNo0jCScynbI1CYPTs
	 aoUEoJSoyW4OnhM3CfkPd1V3Tq9R0GHq0JQKHyT7/WIabbrDhL/4rNHCZTSIup1TgMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484840;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vfcUvvZkx9v8w0lzqLbCBLBuOKdNBnroc0QPMFVOYVc=;
	b=5dEv3pUCTdtx1mZw+Jofy7fpdP0rXNVGoXF3BBf72NgUERhFYHgAcGtyT8qRB83xNLuE
	 ZisqfL6gPCP75G/FjH3KPcF/Cf3U2rFp0RJ9ix4kIIcsKXyX9IlpGcENAloAJHn1t3jNq
	 sDC7KiZiUFPfeYbMxr0A/4hRDsoem/DApwvtb/xxmje0vczsr5jyF7cBDhGiPUQkpLO26
	 tmO284VQry5WOhMBzrnjlqOeGyVKWBht1xMcDHC36tASwsctnppyZnR0qNWMxNTJWD0He
	 CH5KMkM2HKr7H4VMg/wibBvaeBw4w1ZLsRICOvorRIUL6JvE6LV8EhiRGGUf1kCalNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iblHBCxN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DcvOy1vF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBA8606A331
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 12:00:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EBA8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iblHBCxN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DcvOy1vF
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACAfJxC1953697
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 12:00:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vfcUvvZkx9v8w0lzqLbCBLBuOKdNBnroc0Q
	PMFVOYVc=; b=iblHBCxN1q+nX8Q5rEl+KY0CkQSEziVPM2bZed6qkxrOeBvszvy
	LG1CBO3zE+hhU2S4PEP03iGIoGzUT0UO1mXTUoSyFynBLhwEKrkZhIhZ43HqfzXW
	Qez030EgIwwW2FOZ6PZg36CGJIsZmzPdIW6pmadO9aOvld/pE7ymQ9D5OGsNKEF+
	PZ1xxSRVKByTYDNwzCHH5UvQLHBiba6obAKK/1QzFDXuahQFfKWoK+n6J7QLG9u4
	9PJ8zkhs06piHeHTdhpPMu3BL0PgB4G5FCYKpEfYiXtgbKqyZlrSYAkRWb8HDYhC
	WJVsIgU2BG64TbljHpqkwogiLcNvNfMDVnw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx308ha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 12:00:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2373e9b4so515973285a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794484838; x=1795089638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vfcUvvZkx9v8w0lzqLbCBLBuOKdNBnroc0QPMFVOYVc=;
        b=DcvOy1vFx1CyZ9YcJav58N2cptC8nGuhYD1mmapKjHzJ8/MnXLQrz8bZOMGle8qgot
         HMwUFKsYwQ2KheOWUDX65BRC23Tp6hv9RvFiY0YuhHhgVL6XJK0B3n27uSzOnsKEIxMp
         5eObOXqlb6nxF+8QD0Dek4B9NESogjppOV1aAvee2IxRr12vS5QN3xc2TlyDLOHA5dXr
         lNy3uAoJ89fZBYp0PdLyMfZ6JyXttS7qb6eLSgu1OD+9YDcFRYCijVobYIdSw88rRhCw
         RSkcUNgVwtWclEmwFSMxiqJAq98JsraRLpYWYCM1IcF3tiPC6UdUEQ2dd9Ds4qoXfM/z
         Bb+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794484838; x=1795089638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vfcUvvZkx9v8w0lzqLbCBLBuOKdNBnroc0QPMFVOYVc=;
        b=SemVHh/D++IgYKCCCOwYy29o+F/wMxxASCbX9siQ2LMJsNbwzMZueR6EAEVggA83yf
         1Cp6hZIi76VqIHBEEOOnARO8aNKen5PXcb7gP1gvkFSL5XE2ap9gDgNtdNArhBOSsP29
         TPk5sJ+Dq0TxizXP3x39kcG4hwBHzlF0fi0qG93O7rQpcMloQTSkHnekRWwztq/S8ljl
         gjExr0chO4WfjS7jIhcBQnp4fQaSqbgo+QZJqg2FIOtyAF+hdbiCN5FTjuzR3NA+n3l7
         e6xscaETlSx9Ruj4sywGiwYhttuMQNkSmdaLMoRMyr1PpRV/mfUZYbOBXZIAEDM7psrb
         Agag==
X-Forwarded-Encrypted: i=1; AL+hErEg9UwfxGJU7jnF7Yltm+bgL2XJx4KyDCGBwjPoz0cfXpnqlJ+DzwuHY/uJ18EwhHrIXiGV6Z4gtDp3MaWg@vger.kernel.org
X-Gm-Message-State: APuU4Z+jFW1kSuREZfRfEMOPI/KKf33LeblFeu25baQ8hYOUOmxEvbn8
	ghsFzhsQzy3U+LP44qCoWhklnCz81ktNkm3sozfRVZ9/lE2tBp5XdsxzLc96osNTZd1yvczMr9P
	sxkL6pgFPQEyiQdFLJ6+G7QlknwOfcOumViXYLwRrFEGeAtsOyJzzmQ/UUK4ki/GTGAZy
X-Gm-Gg: AYBFou2mVfm46KeU/Tthn4oUkp0yT70lRFDYkj5L89IfUq3K/7oUozyWW1DtS9jjZfi
	wAcLe1RJHqxbTqrQlwFxwMNc244163TKatXEkerxZwGe7ExHNNnjzEdFWFqHIEK/6zkL2UYPvLL
	KdbFS1zoeYL/GgY8KS4WnYN/AWPuMavJtTnklfG2VqrWzYph9AZ0koxa5VIcRbyjKDv+7Ig0W/0
	1qS6sK2Bq/MTVm1bfb6qxs0PH8+BirN/NOo2QuL3w9vqlOb4t2OsZHGqwtBaDBs29FQY/BDsf3R
	5CxgABbv7H5pm2pDVSCBzUk8+K3/1iWOrqglS2dsXvqOqmBWJ3fkp/cPp3sACG+InTcGpM+KjVS
	8x4Ko0pDjFI6lLG+/pcW4kFixbhxWvJ6el5yWLjDraA9HsJTzS6uRFrtDOvof+w==
X-Received: by 2002:a05:620a:6cc1:b0:93f:ca9:3ee7 with SMTP id af79cd13be357-947b0003c1dmr923370285a.57.1794484837738;
        Thu, 12 Nov 2026 04:00:37 -0800 (PST)
X-Received: by 2002:a05:620a:6cc1:b0:93f:ca9:3ee7 with SMTP id af79cd13be357-947b0003c1dmr923358185a.57.1794484836804;
        Thu, 12 Nov 2026 04:00:36 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585c4fdsm16682052f8f.10.2026.11.12.04.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:00:35 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Dang Huynh <danct12@riseup.net>,
        =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: [PATCH v2 1/2] arm64: dts: qcom: msm8937: Fix CPU4 thermal trip point type
Date: Thu, 12 Nov 2026 13:00:31 +0100
Message-ID: <20261112120030.99510-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1236; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=cWi/sRCq4/psEC0lzvEToo4ZOL2Ky8kWa/kBXNHZ8aA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq9apeCZUMPp9KYItNyPqEg4img3WYZELzqxUP4
 mos81WLoI2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavWqXgAKCRDBN2bmhouD
 10FsD/91XeAAZdi+maVqqS1kOkQpZLVYrCPv1cUXxg1W6knma0UjDS6y3iZlAl5qWuoCH2LzHFK
 IimlGhq8qw8RuPJHZhuRR6N+qo4oHn9zN3TcxvS6JqSkVgQDguXW0PGsSsm2YYaChNdX0UZQMBG
 S9RiOoaxFuauq2Rzy7F8EPw0ANrLOGZvnOyQPdB0c0mmU3D7XvR3tvJLFljRL0PXXHTfeZt6hxL
 AwDJsVQR59rbSVpZTGynJNLOzCn6xIFVJ0sQwF1yr4KEBOqrYlnGas9mzrJazkCuhq4F09mUFfp
 uaSOEQSBZU1y4iy6NtCGdjV0W1tozo2fTz2RjGfsJicd5BNAaERT8LgKlp3giAUfZqKXe9xDj1Z
 hb0sOLBKBKCX7Es+nfqGPtmJBSv+sWaIyAKhLQd0dDJlOtHr0Km3p4SAirk9aSQD5bZkfF9h9Hl
 vOPCM70ZmwfAlNXQ+I4j7WzQtMBokLvgzMLS0c0zAXSdoTEIjE4Ctq5/Mhv/Dt1hAGwIt0MFk+g
 mzYBHLgop1WBVOu6sAyB10MGZ9jFXAeohuGRhtjRWQWl4GG+ujVH4ax0LnU700tlukV6tu4RqlZ
 9U4kDgqiHj/XB92/0bZgrB9KH2xKCLfscR+nOzPLJMMSoKbi+zFGe2J90tVWnkHNUfQS1v3nHgB nOO/frJtkHF2kNw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af5aa67 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=uPNVP4c7M2W6CD1-7SQA:9
 a=NFOGd7dJGGMPyQGDc5-O:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NyBTYWx0ZWRfX/dtBHxJjANyd
 WhnHeJBV8CXSEKukY0nL5Y9EjwcnZNezTakTRrwcTf8pZVG0Zxxmnx8VEE/X5PAffjcbzFGBFU9
 hdBzWRgaMXUzqolG6+WDvq+8ChWSK9Fiee2kJjSzuowYTxp/8XSacmbY2ikpAEMSJswn4gjMMtd
 P42HbQiAZh+Yu1x5CqBbWgmPTxOMYHaJR7QlSWZQHw0aobipc2hOJBKP33gRfXbMoIszQ+VeXTW
 YqwtVutQuJeqhT2vGpOkETsv/CMbddpfDx/mDIdQk3L/uKhtTGzm52bwy/xp+sNDyrqQp03MnUK
 4IN+vP6ZurbnpUXDJUjH6GAhM9n6XFi7MnT2ZH2cyEw7JmMxitPTn1NoQR3FJt3XbfB82oQhFo/
 25i8RKBaQLWbqHfECkPq/ssdmM9D4wkTQHehPOjTKt0bTRSoEzEdBzgUntCu6rvXcFm3N++Vyh/
 7nVxZdh4zzYs2+/YL4Q==
X-Proofpoint-ORIG-GUID: rFNE_YaM_bdfuiD9jbBahkb8DA0jcPSS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NyBTYWx0ZWRfXzQoULNQtxQm4
 NATUKG1XK8ncc3PYEge2oCaprKMqRD15dvWjl8y7Gvlmz5bkZrPYd1zhF1vGqQsDmi415xfkD3R
 jvc3xbteh2GeaINuZK4fq0w0JgzcHwU=
X-Proofpoint-GUID: rFNE_YaM_bdfuiD9jbBahkb8DA0jcPSS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120047

CPU4 thermal zone, unlike the rest CPU5-7, has reversed types for
75 and 85 *C trips: the "passive", not "hot" should be used for alert
triggering cooling device.  Wrong types could cause missing thermal
throttling of CPU4.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-3ae74c01-648b-445f-9a65-114b2d3b2ac6
Fixes: a829f6f2e8a7 ("arm64: dts: qcom: Add initial support for MSM8937")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8937.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8937.dtsi b/arch/arm64/boot/dts/qcom/msm8937.dtsi
index 7de6447de48f..6729b39c3f2e 100644
--- a/arch/arm64/boot/dts/qcom/msm8937.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8937.dtsi
@@ -1942,13 +1942,13 @@ trips {
 				cpu4_alert0: trip-point0 {
 					temperature = <75000>;
 					hysteresis = <2000>;
-					type = "passive";
+					type = "hot";
 				};
 
 				cpu4_alert1: trip-point1 {
 					temperature = <85000>;
 					hysteresis = <2000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				cpu4_crit: cpu-crit {
-- 
2.53.0

