Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794956465;
	b=YbeM9mf/HDixdgbVW9KLQOp1drpVSd55jympjrUhBJne68BzUawiaxPRvxhlj4/L01oG
	 QVzpWHiX8gu4Djzyjoz7SxJeoZL6ifRboqu0IBqgdiB4XicMlsuMD8z+KaqQrY7JOYpCn
	 fv0FxPViFBdIM7c/N51BbEUpUBhKvgqKXtvt/t8MZhoKJvDv2xsWjwRFzWpaHSFuw2/pt
	 VG0qgzR3tuDyA4FFAgcs6dNDtINk3jBSoa6QxjQVFsCAtUoLM8DHISjUpDiL4eh2SOXkH
	 v0wu9uOp7c+0fdn8lO/BbW4ujD+OUpx/Zae+3HqKp9jecMCjrauJvf1zsiTucEqG2yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794956465;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=siz/zSKEacfVeoRztgux2I0ev5lyV0Ru2o9fuzMDieo=;
	b=xbkdeYe9T3ZhPAQbbzGa91UgJsB3Bk9jr9vLN2eUsDIBbBpiskrki3LTYOhqRWqVb+xX
	 6hKFcr25RN0vT0cnRNfaEz3kjtNsX13B59Y8T61o7woPEpJ1Yd/+IfwrtRFKUIiNMBT2M
	 nauOiEbrtJDrHQIVeROawKI5K+GWyMcvvn0Ts5PJNoN3uPJ9dQQa6gniCh/hAAOv5QFvh
	 TLhbjZGCF7qsldVUMb3r1HFLY8f9O1agIDez4v2lkz/NB6b0S2kEXjH1E6ffDSriCnkaQ
	 5okLBG5EjwB4Ifv0UHJtmKd6azexiYiEblSJnChHOh+/OblgZ5ilEHOQDva4kioO5QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JHFa49HF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AmJW8Lqr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD670606A334
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 23:01:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD670606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JHFa49HF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AmJW8Lqr
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHMfJqe1614176
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 23:01:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	siz/zSKEacfVeoRztgux2I0ev5lyV0Ru2o9fuzMDieo=; b=JHFa49HFZi8l5tFy
	CmopKikXqk5rsjW2LuUpa5eAhXUaRGQY7SB1ehOAcnWzUw6S0llL36a+Yl0O3Mva
	axzMeC7RtNGLZRC7FH+QnvPU9rQd8zQXVAKs9CP3jlb3mxkIp9eB2C+Td38Z/U5P
	CcO3Y8/4H7RLK66FBdhgYfLtXVp5pQdmkC2gXwuZdQ6/EN5c9mhA3F0hl2tgGHsu
	2+HTUs6OJxq77CNYeQR54DZDcVln573O06G5YC2IkcOD6xiLxs/V65VwZIo7hmDY
	wfsLTrDkoPNEmOZhVzfB4tG3L2vjy1/dlffUeBJvkSs/RvKL6I21wHkeAugC/bR/
	aZI9Hg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8r2pk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 23:01:03 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a5005fd0f8so693942c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 15:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794956463; x=1795561263; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=siz/zSKEacfVeoRztgux2I0ev5lyV0Ru2o9fuzMDieo=;
        b=AmJW8LqrZir3ZFqrW+Up5hyd0IeC+h54gE1iztPZz9jsdHEAQoZFpc+g4OGCsnX9x8
         Kckehi+A0ppDWgyoVSXkjOaiDEHslIehqKIU5H4AzSwjiURYx4NOopqNVd4OS5jMlk7z
         3L51qp324cNWZP2c5vYJiDCvKbQKCjflwIJXUn/L4kwpn4i57ho12/DwjF9obSvE/J09
         NN4s1XIEW+2xTrcXQ7AUvBfS0J5QTOYHUfK8NlXZXDStWvM5tNroweW9/HjIHu/u+K57
         gJ0GxRdfbJ6PX/jAsppEAzZ8TjLTYHqo0408QGxJJ/wWiaTPTWFPOJCJAczFF+A+BmgU
         gZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794956463; x=1795561263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=siz/zSKEacfVeoRztgux2I0ev5lyV0Ru2o9fuzMDieo=;
        b=VGdGsBsH+f+EZfhPPVDvqRCncsznnNg1Odf4R8+tgUpagTBpb0VLH2lYfaTfuVhMq3
         em0IUeqL6hcD9hzONeDbBb3SjEmnejNVdwZ3eZaZ9F0aHT8B6xUMVOSsBr+NMpGNpuIW
         n4TPIdWlYT8hUwuTGv6g5t7GZaW/2QIdrUigl4ZVulu1RRJns1tXJpdzzDF0hsb3S7IE
         W8HT3qdLdlbJVbYbHlUblunv1QgDljbvjKeUyeqxXc3h/dgXf4bFMZNzDy9P7K8mDer8
         uvDXbDS4W0X9y+eyoCCgBCCBv3vTQnR7TFnhC7l5L+pSng27xbk5GIOghyB6HuJkZLCr
         nf1A==
X-Gm-Message-State: APuU4Z9UDlVfuXM1FzPfadBMhlZK7oCSJyOinWyBsME+vI1GHyIQi+By
	eu0OwVWME3kTsLEbcMnSNHkt0JH7EBcB068OBABvpvg1346Nkxv7tik1ak1Rti8WwzTcHdIUz/q
	Fne5QFBFve2Vn5+REpla3GZlvmWWkOA8qfSwVxIv6QHPtwa6ujDtVghbPngCI9GC8Byj3
X-Gm-Gg: AYBFou1G4tAv2Hi8yNxuIrfSJx3C/Adga+AH1tRxRmjcVbaBV16MYAWYK8jncwUEWeb
	pwQYevXERn7tu6unkWYCvRJ1Z7qDMcOVSqejIBeemVO4aCU5g49B1ZHId9Yl21RcQsbAFQQVZVt
	jrh5APwXn0tsm5oIKNYsUqFOOeva/RQdDZYijNVoGEMtjU7V/ioTCVIj2xOkurEJvZz++kutYgS
	P+yA8qDFRvRrJO+Sc7QylQwAl8dIrneSOiMpTraIoa3XgvU6o+E5nG3XYlhrhd6Gy40Qz4/horT
	UJY4/nrZtEjbNaFfqfJODv6rq3KJ2ODKpLyWgAWOnDAP8XM7VsTGZu8R8G/RzXtn6GZDao6xDV4
	Y5DnsuuEzRq/fva+p8IoEAiXCVWiH4L8daNPUc4qfwB77shehas4W+O1D8/sqomJ4CEn1fisxcg
	==
X-Received: by 2002:a05:7022:ea8a:b0:1ac:f84d:403b with SMTP id a92af1059eb24-1b543be9b4dmr878909c88.8.1794956462184;
        Tue, 17 Nov 2026 15:01:02 -0800 (PST)
X-Received: by 2002:a05:7022:ea8a:b0:1ac:f84d:403b with SMTP id a92af1059eb24-1b543be9b4dmr878831c88.8.1794956460143;
        Tue, 17 Nov 2026 15:01:00 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5445eb29esm1380839c88.0.2026.11.17.15.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 15:00:59 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 04:30:07 +0530
Subject: [PATCH v2 4/5] arm64: dts: qcom: nord: Add GPU cooling
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261118-nord-gpu1-v2-4-8d6d9908b7c5@oss.qualcomm.com>
References: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
In-Reply-To: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794956423; l=10612;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=SuG138OamWOX42yW+EJ2Z/O+U9rntMPqKUFY3iKGNrY=;
 b=IWOVDh/BxIsSuEDWbRaV1jLdO9mUdeWdFqlP5EyPPH/OCtQnoJ5r9pBX8iFHDYz43A1hIniNc
 DMzA4zRdUDYAsnNYgo+7Qh90qLXtk2k6UN4AyXElrDkHo4zYbg5K34O
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: MdeK5PuTfz4NbnfEuNHzxMeBGaj1TV2d
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA5MSBTYWx0ZWRfX5jX122BefQuJ
 BQwas8Px+EAi/orpFWUg7DZKrDz0rC8a8DvRfnjEQForBc+nSFIt7IUXTVLIxgVApG71sb2Yt9i
 lW+U5gyi1kb3DSEgWhIrWIUbbzmUS6s=
X-Proofpoint-GUID: MdeK5PuTfz4NbnfEuNHzxMeBGaj1TV2d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA5MSBTYWx0ZWRfXyebgkYVESTeA
 EJWA4M99KSaA8DDMmxcLk5VaejCS6X5GbYUL1BD3/U3leSHdEERD4U5aOEnEm7qq16twwPXw8vr
 U1o/pKmOPjeZOXGXy9jCpIO1sGccjOuXkJa36U91mlJWGwsuwPxNJeMyNHmo8LFhcYFtgD1GQU0
 J7uJr75Vo9Z/rQ3SF41Gz+VNKpr26GQC9T4fiaq/TGH4Sr4KLvehu9P0rL3JudsUYvubK7RG578
 b6Y5BCVz/Xm1SN3Vpmz6D1E14dq3wGxl8xbhZ9j5+QyGi7tAPOLbd6pi0TgCzBWNWUv3XSbT6rq
 98dfxjN5WTCivLMyqZIu6ejxa87rnvehTM+3I7em2eghPOkJOIpMddRRyPkqpox1Sdc5H7qtYTf
 CXPBdTfVc+QMKohTiyb/HPMj/FlX9rtSZSXWujYObJ+UtiHn0b9lPRohhbJMpVfCrLhulexSncR
 RYfVApCnUKYoO4Bh+Fg==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afcdcaf cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=yCG-QwAGxuN6-aCC_u4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170091

From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>

Unlike the CPU, the GPU does not throttle its speed automatically when
it reaches high temperatures.

Set up GPU cooling on Nord by throttling the Adreno 753 GPU when it
reaches 105°C. Label the passive trip points of the GPU thermal zones,
map them to the GPU as a cooling device, and add a passive polling
delay so the thermal framework can monitor the zones while throttling.

The thermal zones and the GPU node are both described in nord.dtsi, so
do it there. On the GearVM variant the GPU node stays disabled, no
cooling device gets registered for it, and the maps are simply left
unbound.

Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 177 ++++++++++++++++++++++++++++++-------
 1 file changed, 145 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 36a422db8ea6..3e29c43ca9ad 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/thermal/thermal.h>
 
 #include "nord-ipcc.h"
 
@@ -5122,12 +5123,12 @@ trip-point1 {
 		};
 
 		gpuss-0-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <10>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens6 1>;
 
 			trips {
-				trip-point0 {
+				gpuss0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -5139,15 +5140,22 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss0_alert0>;
+					cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-1-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <10>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens6 2>;
 
 			trips {
-				trip-point0 {
+				gpuss1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -5159,15 +5167,22 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss1_alert0>;
+					cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-2-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <10>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens6 3>;
 
 			trips {
-				trip-point0 {
+				gpuss2_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -5179,15 +5194,22 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss2_alert0>;
+					cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpu-0-0-0-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <10>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens6 4>;
 
 			trips {
-				trip-point0 {
+				gpu_0_0_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -5199,6 +5221,13 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpu_0_0_0_alert0>;
+					cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-1-0-thermal {
@@ -5342,12 +5371,12 @@ trip-point1 {
 		};
 
 		gpuss-0-1-1-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <10>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens6 12>;
 
 			trips {
-				trip-point0 {
+				gpuss_0_1_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -5359,15 +5388,22 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_0_1_1_alert0>;
+					cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-1-1-1-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <10>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens6 13>;
 
 			trips {
-				trip-point0 {
+				gpuss_1_1_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -5379,15 +5415,22 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_1_1_1_alert0>;
+					cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-2-1-1-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <10>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens6 14>;
 
 			trips {
-				trip-point0 {
+				gpuss_2_1_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -5399,15 +5442,22 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_2_1_1_alert0>;
+					cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpu-0-1-1-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <10>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens6 15>;
 
 			trips {
-				trip-point0 {
+				gpu_0_1_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -5419,6 +5469,13 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpu_0_1_1_alert0>;
+					cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		amux-7-thermal {
@@ -5442,12 +5499,12 @@ trip-point1 {
 		};
 
 		gpuss-0-1-0-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <10>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens7 1>;
 
 			trips {
-				trip-point0 {
+				gpuss_0_1_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -5459,15 +5516,22 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_0_1_0_alert0>;
+					cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-1-1-0-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <10>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens7 2>;
 
 			trips {
-				trip-point0 {
+				gpuss_1_1_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -5479,15 +5543,22 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_1_1_0_alert0>;
+					cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-2-1-0-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <10>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens7 3>;
 
 			trips {
-				trip-point0 {
+				gpuss_2_1_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -5499,15 +5570,22 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_2_1_0_alert0>;
+					cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpu-0-1-0-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <10>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens7 4>;
 
 			trips {
-				trip-point0 {
+				gpu_0_1_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -5519,6 +5597,13 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpu_0_1_0_alert0>;
+					cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-1-2-thermal {
@@ -5662,12 +5747,12 @@ trip-point1 {
 		};
 
 		gpuss-0-1-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <10>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens7 12>;
 
 			trips {
-				trip-point0 {
+				gpuss_0_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -5679,15 +5764,22 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_0_1_alert0>;
+					cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-1-0-1-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <10>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens7 13>;
 
 			trips {
-				trip-point0 {
+				gpuss_1_0_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -5699,15 +5791,22 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_1_0_1_alert0>;
+					cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-2-0-1-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <10>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens7 14>;
 
 			trips {
-				trip-point0 {
+				gpuss_2_0_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -5719,15 +5818,22 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_2_0_1_alert0>;
+					cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpu-0-0-1-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <10>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsens7 15>;
 
 			trips {
-				trip-point0 {
+				gpu_0_0_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <10000>;
 					type = "passive";
@@ -5739,6 +5845,13 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpu_0_0_1_alert0>;
+					cooling-device = <&gpu_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 	};
 };

-- 
2.55.0

