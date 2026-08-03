Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A5937F33E
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 11:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785758163; cv=none; b=N7V2iVMeALKnJFGQZ6442TF2Jp24M9H8hHW6SpFwvnCeeeuVwfNw0dRD0Vp0dxpiSyBpEiAVbxj5hKfSAiMlv+5l9APo4uIeuZXsA4oFkknuRpy0y0oRmIABloyir1CHlsXYsl6yvJMUtr/aojSCYWjtsxi1/OPjB8Crg6m4y6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785758163; c=relaxed/simple;
	bh=bRrLTMffcvoYHBgHrJtYZhy0j2dedZjfoX1PcIWNlr0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fuhdzI0Vf5uRBppzY8v7eZ2j4s4b8toFzAOJrkqojHlTyR6z4stEXls36hHt9EEQBTU58l5W2RbioMyN3Xw4VV8OH438m54TrSEPLlekCBhmEXencL4CXM7tVXL96pM2hP1vS+Zu5i0Hp9Khqu5fSEF0JsqJ9ZgWnGw+151kuQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iSfvaq9a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J5FlP99c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iSfvaq9a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J5FlP99c"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673B8wxn4123759
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 11:56:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=C7zsaqbLAQClWrl6NyZtJ4
	+4d798DT3UraoO8skV1l4=; b=iSfvaq9asaIMeKaCKoPg4s8KNhj4i974k51/Ja
	Td5rXBSbBdXeGOEycco0eSV4OZOlFAVW+aRInTjE5dHFo4EN6t+NIXHf0SloSMXn
	TKTjc7/mnS2+4lTWqHJqdOZ35MHsVYNGirxcpZpu5cWIXAE1X9gzH22/FlHV8S4J
	gFemS2mYZcbjp/gjRjdKr07NCep9Ueh4o8vkGXK6gDoeiY2SpVQVeGU7fLIqVf1j
	S76LbZAC73EQeo6qlWrKEZszRyUjBZOKQwx0NBcDa0K4IdsJMMw3dsNaihUBqMGO
	7Iw18S65DMvofbUYo+qaeHXET1cS/cv5i7YyDzODM9FcEupA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftp1698pd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 11:56:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-522de3c645dso66360301cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 04:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785758160; x=1786362960; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C7zsaqbLAQClWrl6NyZtJ4+4d798DT3UraoO8skV1l4=;
        b=J5FlP99cz0r0hYwRPre4dNaorRfKOBoZ0eU/9pbDCB2rScVoCDQRCi5qiLpDkmQ4ag
         SqvR9664bIyi1Qk9X3KCC+CJ7VHipsvquBnmYdabqptPTjGklLLxGt5ttTQozMnXRyGX
         BVB3OL5nvV2sA+Zx4TKAP6iPX9bPtrKTDU9kyyMF33mJSj+wdgtp7hMQ0iiIP/O09agW
         2Wt9T/OKN+ynoNiqVvchzkfGQmxsxjppmmwfMYl5EFHxQ11PlG99/Tf+okiyF8Apbd5w
         Jl+bnnHCQ/vfGY6BptNOxXlkZhfL158iFpBuhU8NCj77Wis7Z6zwyfkQ1jeCWcjMbKbk
         ODDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785758160; x=1786362960;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=C7zsaqbLAQClWrl6NyZtJ4+4d798DT3UraoO8skV1l4=;
        b=CCtU/jYBupmuQ44EwyyYDP6WtHw+PmgdNEV9TVNe0eCyWGItVgeGhvJrVqN0ZdmnpF
         BIfn1jolB1U8C1pNaq5663MyXOhDR9f/gQCEE6SadAq72QU4N3Uk+quRqz4cSz86X9is
         6/ziNju5gUvhjXIj8yDZThVh+On//CZDP8sz5+2UPbLf1HbS15vuS94QTDtaJa3/lU+r
         3azaY1jtc/4c9ygYpUXqcbg/0FYEhj0+EiIaGRnp+wZ36Vs/BNkK3T4CU5MsqZ/iWAIy
         WessL5XLllPN92ZsDPocvkDnfQRHnCruOaZPRz78hZwgH7LgmAPc/oGFlXNjlAgviUi3
         6kTg==
X-Gm-Message-State: AOJu0YyHiyzKUmALhQOpXGcYhvRF054H+QwKkxtkm1cLJrDcDv5VLUov
	+KbBhPd9P+tX/YIfQ1xrbASpcDJgqGvzA0NgJ+zTM/+gUf0JG6c8TsPDz8JMDrpBBWfaxGhNKlq
	7XRjCnKfcOLFhYYoeda8nec4cBfwVBNvC97ft1yDnZ+1CZ0uyE12iZLrSiR97Qc8G++AQP+870X
	oB
X-Gm-Gg: AR+sD13sUL+QevsjYESHCRzfHqdSgxIdidApt7XD41wRvTbQ4qIElkibWiT628pGwby
	0CyPNEblG3n6V5skaqES/rgl12lTN503A8RgAcbNUTHg9FfWk6dU2cpIHKx9d9SBjzKwF+5eVk+
	vk/zV+k0YXVcpqsxcDMyqGWhT5JJrZAMAq8LpnMivWxPfCZuSzr+0oYe9hQADwGhmiKgzoZ11tk
	mLduKZgwM4++CPE85o9D/Dfyzi4yG+Kzs2dLrtDYH4CGeOwD51ziotFis1NZag+njUGWZMOo5bP
	fTCEB8T5NORk/CWQe8akut+MdYN8GII5xlFE4tA3lwdQ/51G+ByuUs78N6m9XPt97Il+eRu6INb
	MfxeHPi3XTXTL21mYvgMpWsYGAd1vQOUXQuPE0J1feUxjVVCbkFQWihayCnxolXm3OIEDE+WbaZ
	G5h2DNRzry9s7lqNm2Osxr9JE8fWBAwhJQx2YrO6/OZyTCmkJt3a/HC5ZZiqkEsJLVMZVw8QNDx
	b9lKO9oD8Z8tN/Z
X-Received: by 2002:a05:622a:412:b0:51c:a8e2:57a3 with SMTP id d75a77b69052e-52b5674b4ddmr183497121cf.28.1785758160132;
        Mon, 03 Aug 2026 04:56:00 -0700 (PDT)
X-Received: by 2002:a05:622a:412:b0:51c:a8e2:57a3 with SMTP id d75a77b69052e-52b5674b4ddmr183496861cf.28.1785758159633;
        Mon, 03 Aug 2026 04:55:59 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (246-12-141-79.reverse.alphalink.fr. [79.141.12.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd3c5ae9fsm544778766b.7.2026.08.03.04.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 04:55:58 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 13:55:57 +0200
Subject: [PATCH v2] arm64: dts: qcom: monaco-arduino-monza: Rework fan
 cooling map
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-fix-fan-monza-v2-1-c10af16c552c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMyBcGoC/12MwQrCMBBEf6Xs2S3NNhrqyf+QHmK6sQGTaKJFL
 f13Y8GLl4E3zLwZMifHGfbVDIknl10MBWhTgRl1ODO6oTBQQ7tGEaF1T7Q6oI/hrVEZUrKRlhW
 3UD7XxGWw+o594dHle0yvVT+Jb/szyT/TJFDgIMz2xJ1ULXWHmHN9e+iLid7XJaBfluUD6pHKX
 bEAAAA=
X-Change-ID: 20260722-fix-fan-monza-7c27404fe7e3
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDEwNiBTYWx0ZWRfX222vnGmAOGe5
 YueeZjpDGB+bjmukoWr1FWjp3isva6pZmeoSQ81dN5W5XickKBwNRQcvvxQQuEmhz0buKCqdQsv
 ZssFPx8gI9vdVSHnGcM+VobXMmGAev5XDTq4P8C8D/QiLuWrshfZHGlAXRIMOuDrdvYhrJgES3H
 CrXTi0fOvjuiKX2zQZooQbJQnK+77ilVAPUxiABbIzILBIEk/JLmRC/h/pv4aoNauanFeLJ6l5b
 XAUpjYzIADEESO7hayhnY/0gZ1+ad4rH5l6YiCwNzs2zFcBIWYdLB7Hd1K3ngIiquaPE3+Tq4gN
 BpxNnQGqqNDmCI3CdZnsQPJC2Ycnq1qm69B5jJj1wPNDiYpMuSwYuorycikrrcqbySdyyGZxhT/
 uo+OCacku4An/XpkOXnTI5rI4EHTx+070jAw9tVt4GZu1Bc14SZVALX5sMbTz1DJcRdcNgaDLFk
 91ML3nyFshQKRb1iMhA==
X-Authority-Analysis: v=2.4 cv=Wpob99fv c=1 sm=1 tr=0 ts=6a7081d1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=pYL1VdZWigrwMn98IZiABg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JAcnC0gH-uw2M1I5ggsA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDEwNiBTYWx0ZWRfX0Yx1bAhBxWQS
 HfKjpyCTR4nhhWX43Agr9pnnm9NOVe531S/i5aE28ivI261WS+TlSj4VnQRdmM9qd7COGvW/3eu
 YND/3zY8aMHr4FtV3y6cN/qmhAt/JAI=
X-Proofpoint-ORIG-GUID: GwGGroIdgHs1b0-bvurdsJZj60NJuLI5
X-Proofpoint-GUID: GwGGroIdgHs1b0-bvurdsJZj60NJuLI5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030106

The fan thermal zone previously had a single "active" trip at 32C mapped
to the fan over the full cooling range (<&fan 0 THERMAL_NO_LIMIT>). With
the default step_wise governor this only ramps the fan one step per poll
according to the thermal trend, so the fan speed tracked whether the
temperature was rising or falling rather than the temperature itself.

A visible consequence is at boot/reboot: if the board comes up already
hot but thermally stable (temperature above the trip but not rising),
step_wise sees no upward trend and leaves the fan at a low or zero
cooling state, so the fan stays slow despite the high temperature.

Replace it with a ladder of active trips that each pin the fan to a fixed
cooling state (lower == upper in the cooling-maps), turning the fan speed
into a function of the actual temperature band. The multiple trips also
give the tsens hardware several thresholds to raise an interrupt on, so
the fan is re-evaluated whenever the temperature crosses a band boundary
instead of only when leaving the single operating point. The zone is now
purely interrupt driven, so the polling-delay is dropped.

This also shifts fan enablement to a higher starting point: the fan now
first engages at 50C rather than 32C as the fan was spinning almost all
the time at such low threshold. The values are picked based on empirical
board testing.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v2:
- Use THERMAL_NO_LIMIT as terminator for the latest operating point
  (Konrad)
- Link to v1: https://lore.kernel.org/r/20260724-fix-fan-monza-v1-1-d1c5be947329@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 47 +++++++++++++++++++----
 1 file changed, 39 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index d1346ca5dd4ef75072b09afd78e914e3f6b12534..4179c6088494b8d4fafd97cb9623fdf1bb9a4309 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -452,20 +452,51 @@ &pcieport1 {
 
 &thermal_zones {
 	cpuss-0-0-thermal {
-		polling-delay = <2000>;
-
 		trips {
-			cpuss0_active: cpuss-active {
-				temperature = <32000>;
-				hysteresis = <2000>;
+			cpuss0_active0: cpuss-active0 {
+				temperature = <50000>;
+				hysteresis = <4000>;
+				type = "active";
+			};
+
+			cpuss0_active1: cpuss-active1 {
+				temperature = <60000>;
+				hysteresis = <4000>;
+				type = "active";
+			};
+
+			cpuss0_active2: cpuss-active2 {
+				temperature = <70000>;
+				hysteresis = <4000>;
+				type = "active";
+			};
+
+			cpuss0_active3: cpuss-active3 {
+				temperature = <80000>;
+				hysteresis = <4000>;
 				type = "active";
 			};
 		};
 
 		cooling-maps {
-			map-active {
-				trip = <&cpuss0_active>;
-				cooling-device = <&fan 0 THERMAL_NO_LIMIT>;
+			map-active0 {
+				trip = <&cpuss0_active0>;
+				cooling-device = <&fan 4 4>;
+			};
+
+			map-active1 {
+				trip = <&cpuss0_active1>;
+				cooling-device = <&fan 6 6>;
+			};
+
+			map-active2 {
+				trip = <&cpuss0_active2>;
+				cooling-device = <&fan 8 8>;
+			};
+
+			map-active3 {
+				trip = <&cpuss0_active3>;
+				cooling-device = <&fan 10 THERMAL_NO_LIMIT>;
 			};
 		};
 	};

---
base-commit: 2edbea82d8edbddb2a235b8f988f17b86f075476
change-id: 20260722-fix-fan-monza-7c27404fe7e3

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

