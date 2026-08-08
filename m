Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA533246ED
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Aug 2026 20:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786220635; cv=none; b=dVvbl3Yr7+d4tBIkylNVb69TuJpD5+tgbSiSiDyhV7o5IcYKuHPTiDQvhWM/ScBIE35Q/UFhssI/YPZF0cJvZoDSXm/wclrKexUZ27SftWa3Ps/3yu+CTQWum1PD3kSq6wB+5CJMH9GKw9rX67fZ0ZrhHJwoNkYqEStHs/wGMoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786220635; c=relaxed/simple;
	bh=SgipMJRfONn7KX5eH+p1p0ISAiTB9/l8rjMypc0i4uA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=igCh8KPcKS7v/m9kWm8nQPXijNa7U/HdhNFYET8+xXO5iSjuuUnWxzddqGDSRgZjktKODLOnyvVxaCQvGyEu6dIfIzTQz+AsxNW+Ir7/a8122uHn0sZ578eoyVDoqFXsbuLzuVIJIMDkwF07sSga5gC8CFY0sNL/lBFCbV3yoV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MTMN9XIB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ArhJAdEz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MTMN9XIB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ArhJAdEz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 678JvYIc1053076
	for <linux-arm-msm@vger.kernel.org>; Sat, 8 Aug 2026 20:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TkIUMGU2hl2GkeTmHQvIMOaKv+sTC+mIBj5UNEuGbwo=; b=MTMN9XIBu58E7OxB
	hJZ5p+ZWrKYN15QwdAmdVYkT/hYVE7E2y1+0FCbTK+iGj3xBjyEgChiSQYjsYxra
	YKATdodERT/bcMKlovTu2BX/ks/ni4QKsO9SOKf/BcuNs9dGb5v40NFDTQ/mkyUa
	eE9efPe/2Ons8NrjP+TBV2hjeF8dgU91P3a2SSGqCWXRGNAvgSTUts45LlXY92KE
	n+RUAHd7p4v3sZw385W+Z3X30gJBXxZRgsKCpkOEc9nFIQcq4t5VmO9CzZVRf/Iv
	Fhp8wQrfv2uscDH/5FM19N2+nfZ4dpONn6qUfUcAyFo8jSvhZ/1P61xpatVBSuHf
	UZUKpw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwuf79rx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 08 Aug 2026 20:23:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb5bdd8450dso472119a12.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Aug 2026 13:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786220632; x=1786825432; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TkIUMGU2hl2GkeTmHQvIMOaKv+sTC+mIBj5UNEuGbwo=;
        b=ArhJAdEzo8caeZlaD7PBKbQWKrtmzBCfavUqBrIsH5BE26v+G83qheYEyZd1anoOVO
         AQH+eJfrjdcrhMFvURIpObGOr0s5AjITwQ/BbnXxMvSTo3KQu9xEC29XiFAiRIaHW3SJ
         RN/H54vf0PEHMn6SiApjm3LG7+gV++NZdPqkxkK0vO+vPj7jC3JrMCdk9PfuRWHW3VqJ
         Ptn7Pk9OsFcEQghazf/AqiAfCGjgQFQZtEC8wYEQTMiNmSt/aUZ6/wMKr2l/kRy6Lf8z
         /sHCv6K0vTAkXGV82P6LYhBwzJGXn9B90i8Ct7eKaqrIYhPKDLpcOn3KsB+r60Q7GPir
         eQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786220632; x=1786825432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TkIUMGU2hl2GkeTmHQvIMOaKv+sTC+mIBj5UNEuGbwo=;
        b=g6gVfxt7HAjQsLTmKYFg++e2OcwRL8MzeJBXpF9cekW5EyTXh0sZQvPPR7O6H5UxmH
         peoDGJQ3a1U3GzSVezKezc5PGUfABVY8ZhAtddUt79jVFxJYn3JUWW1OsYw4YkjeZPGx
         m3bWHvMqaHSZW0YlaeHjSLL0IsRTk9mBCY9rsZ0WHrhMZ4i8N/QyY7Sbjhs6IfF5X7Rk
         q/ifY8gGkh4j9+GFea5D85PwSO0jCdQ/9LzxT8Z33sr5PzfuRladyrYvk/UyVTqn1h1D
         SHHqDOHgwG2gPk+gOndk4tAsiMdI771S1vu7vJQxADALgPPw4+E0B94XpW9QfNWjw/eI
         KKOg==
X-Gm-Message-State: AOJu0YxveK69zUD+s2bsvVe7WPENGHguW2eR7igOk0a2cwOxspLo95G+
	vg8CP0lFwcPIC7HNBRMDBegG+WU9Fw9HQ/gKxhtsKYIRRJFB36su2/5g02yPEnJwID7nIT7Eb/z
	lBlswqVoMUZ15yiJlN5hAJDF+U+JW58JZ8/hC9pSaUH3LHP0qp3jMsD1yhnObnWLajyti
X-Gm-Gg: AR+sD13k49SUeIQcjF4n/JCuvqTnJVhDjD+NAO/chyQDryAOrqIZBFfAg1uYaqUwwAg
	AtYX27p//WG3yIXCUOnkcgVFgLE1mKBtDGJB8nQHDdZeu/1vNAH6xHX8w+yy34gt4rIMY7atxBE
	zvBMOrYOdApJ2czRsglVShOIUQXGlPBAYJNI7pac/vag7ah/4G3bMqd9uCrqNsN8x4R14H407VN
	631hMcFU9CkbwFbapUjpqkz1qR+2MahY6Dih5mO3LUFSJMwpvCDb1io1rJvQlhfaK/c95kxWlAX
	IR3MColAn/tUOqwUnGa/DQ1CcWfEHm1eRz6U8YC8pFUkM6bfrPallqPPRucNrQtpTQIxOx2l7pn
	vd4pcsozPg/VoY8w9oZt+rgeM
X-Received: by 2002:a05:6a21:6daa:b0:3c4:3672:ba6 with SMTP id adf61e73a8af0-3cbadc15329mr20294293637.22.1786220631910;
        Sat, 08 Aug 2026 13:23:51 -0700 (PDT)
X-Received: by 2002:a05:6a21:6daa:b0:3c4:3672:ba6 with SMTP id adf61e73a8af0-3cbadc15329mr20294244637.22.1786220631485;
        Sat, 08 Aug 2026 13:23:51 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86e917sm26357417eec.5.2026.08.08.13.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 13:23:51 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 01:53:11 +0530
Subject: [PATCH 4/6] arm64: dts: qcom: sm8750: Add GPU cooling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260809-pakala-gpu-v1-4-207ad1fac1c7@oss.qualcomm.com>
References: <20260809-pakala-gpu-v1-0-207ad1fac1c7@oss.qualcomm.com>
In-Reply-To: <20260809-pakala-gpu-v1-0-207ad1fac1c7@oss.qualcomm.com>
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
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786220595; l=5104;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ofQkUSc5NcG+CZ9WpupzhlkIDMlUKVF08kmMsHHefpQ=;
 b=FAhfbxRny0gdKk74rvaZBrgOH7vQrV8K6SRdFTO43x9yOxJzV5D9Um5USeg8MueC5B3S8ooHM
 Vd9X4VVxmlkCurIrh++Nb8zwYLZwiTww9UTu6FvgnvpGDhsFjpMX7rV
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA4MDE3NiBTYWx0ZWRfXx6ABA3KoRy3B
 wqj1HxbKBm35x8/OMFJ1pNyvl7ESq+eEIZSf4RiCR16Qj41PHqzJapJ5ooxBizIb4HzCtaMBL3d
 JIZyg5stKYQnAeSD/P3lk1Macd5NAXo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA4MDE3NiBTYWx0ZWRfX8ubksJb0T1d4
 JnynzGR8541+RtzE+jjln2qiqXRs9ZSi0g/8Ea21FPDRZupB/jUyE21g670+ju6chaGPS8ZlfUt
 42fKERKPH8JgSw48QTmmSlf3O6K21Tm7DABi2NZLZmpNQxw0oAfM6kJLhbsIEwBbVgJS4xFTUks
 0m/G1spmS36AeJ0l5nFnCjROcfsldgll9C5NVnVN0KttRDdtusIe95YmME9N2Lwo/p3/3zwWlnT
 Tfs0iTC5WX0Ql1xesVRNSwl8dhS7q9X4b5Dlc9NQaGQAIUmmgCLGxF6aH8gVWAbDu1AuoUrXRzg
 1kSTwzjILH96/TPcBM5DzrqjEZ7b1NQKDQnDCB5rCv9I+8QJ1mCfnCr7D7G39fGMajtomymIOhb
 DHQPiU9lOiEy1ehquY1rCYQXb68QlZRj/OGkXCCKVuG6FKOgQUVJ1znOqC2j4eHWB6OMifRHxjd
 7IH6Xo6KxBJX5qntugA==
X-Authority-Analysis: v=2.4 cv=ecENubEH c=1 sm=1 tr=0 ts=6a779059 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ZNpuPEAtJ79wbY5eItgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: GdF7FYXMTg1iiVRhqUr3_IoNPreOlqXF
X-Proofpoint-GUID: GdF7FYXMTg1iiVRhqUr3_IoNPreOlqXF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-08_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608080176

From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

Unlike the CPU, the GPU does not throttle its speed automatically
when it reaches high temperatures.

Set up GPU cooling by throttling the GPU speed
when reaching 105°C.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 104 +++++++++++++++++++++++++++--------
 1 file changed, 80 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 6ddc8d3fdada..1a960ff855d7 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -6946,10 +6946,10 @@ gpuss0-thermal {
 			thermal-sensors = <&tsens2 1>;
 
 			trips {
-				trip-point0 {
-					temperature = <120000>;
+				gpuss0_alert0: gpuss0-alert0 {
+					temperature = <105000>;
 					hysteresis = <5000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				gpuss0-critical {
@@ -6958,16 +6958,23 @@ gpuss0-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss0_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss1-thermal {
 			thermal-sensors = <&tsens2 2>;
 
 			trips {
-				trip-point0 {
-					temperature = <120000>;
+				gpuss1_alert0: gpuss1-alert0 {
+					temperature = <105000>;
 					hysteresis = <5000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				gpuss1-critical {
@@ -6976,16 +6983,23 @@ gpuss1-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss1_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss2-thermal {
 			thermal-sensors = <&tsens2 3>;
 
 			trips {
-				trip-point0 {
-					temperature = <120000>;
+				gpuss2_alert0: gpuss2-alert0 {
+					temperature = <105000>;
 					hysteresis = <5000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				gpuss2-critical {
@@ -6994,16 +7008,23 @@ gpuss2-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss2_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss3-thermal {
 			thermal-sensors = <&tsens2 4>;
 
 			trips {
-				trip-point0 {
-					temperature = <120000>;
+				gpuss3_alert0: gpuss3-alert0 {
+					temperature = <105000>;
 					hysteresis = <5000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				gpuss3-critical {
@@ -7012,16 +7033,23 @@ gpuss3-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss3_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss4-thermal {
 			thermal-sensors = <&tsens2 5>;
 
 			trips {
-				trip-point0 {
-					temperature = <120000>;
+				gpuss4_alert0: gpuss4-alert0 {
+					temperature = <105000>;
 					hysteresis = <5000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				gpuss4-critical {
@@ -7030,16 +7058,23 @@ gpuss4-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss4_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss5-thermal {
 			thermal-sensors = <&tsens2 6>;
 
 			trips {
-				trip-point0 {
-					temperature = <120000>;
+				gpuss5_alert0: gpuss5-alert0 {
+					temperature = <105000>;
 					hysteresis = <5000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				gpuss5-critical {
@@ -7048,16 +7083,23 @@ gpuss5-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss5_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss6-thermal {
 			thermal-sensors = <&tsens2 7>;
 
 			trips {
-				trip-point0 {
-					temperature = <120000>;
+				gpuss6_alert0: gpuss6-alert0 {
+					temperature = <105000>;
 					hysteresis = <5000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				gpuss6-critical {
@@ -7066,16 +7108,23 @@ gpuss6-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss6_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss7-thermal {
 			thermal-sensors = <&tsens2 8>;
 
 			trips {
-				trip-point0 {
-					temperature = <120000>;
+				gpuss7_alert0: gpuss7-alert0 {
+					temperature = <105000>;
 					hysteresis = <5000>;
-					type = "hot";
+					type = "passive";
 				};
 
 				gpuss7-critical {
@@ -7084,6 +7133,13 @@ gpuss7-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss7_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		modem0-thermal {

-- 
2.54.0

