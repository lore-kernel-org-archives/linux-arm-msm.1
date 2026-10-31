Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793453028;
	b=ynywL3LdT/hbg6w0+HQDZYNQwsB43hSPfzgDyxbUCc4Raw+Dt/8X3XVSu9rRckMs60Xs
	 4A4kjYFNsSbzyRsWxnXMtTXPqAg5lO1UgMtE+rcdX0rPspk3J3FigPkuSjvRfsoZpBIDg
	 1CTWzHfESX4r5MOHZSAE6ajGc/SXEQKGzcUxOWYSJY72wV0R8EqWrduEP/SreztMej1YK
	 eaEdZ4Gk/DdhriBS4yZJ6AiRfNT+O0TL/b/ldbPBmPCOnpiq7EoV+c+lBC3h3X104wDHm
	 dlnh8lq+tgCCp/qcrdvQCd2PYyDD3Vzdl3Fy3VeolOw4JbnJTCFQpEFl6DCZrM9IUhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793453028;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QK/sB9dSAJ/2G2Zrti3sXc4ovzV/2wnifjT8fx0zQuk=;
	b=Esb1gNiSeq8AQKpNqekJVTcICbhjP4IJk4DJukRzV0sjrI9HuJVGDp73yzrqXBCnPwGa
	 yLUgBja7/5qfNrhzx5CavwbJw05pCE0o6wQ4UnPzD70XLMaG6RyJGOU4FP3YKn8yQVPpR
	 PIGDqTGVQrKrBaCMLnJChB9ADK1CNP1Hdol7wLDQf6Z+aOPsNL0hO2oQy8cyjWdjuQKIm
	 0W16Kq3dtQZEmfwrlfBNiSAP1slsoxtHA93tdMdyDCx5ejVIB5UiaVQgRjHIl3Zx2CY+j
	 XHJTE7t0GeQcWkTx3bkfUdYrxTIFKpZqZvl2+BBSHHI2W3vPz6WiXfsE2nT8oQDTLSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DAiH6qaW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K94VOunY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99995606A321
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 13:23:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99995606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DAiH6qaW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K94VOunY
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD0AAu590603
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 13:23:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QK/sB9dSAJ/2G2Zrti3sXc4ovzV/2wnifjT8fx0zQuk=; b=DAiH6qaWy3OIoFXK
	tjVtIZQJMMM3ei6OwfCf4EAUNyUcswW+pMQ3QXnvzl1y5jRjxg6miU3yhBdJmScY
	rrMXoPwcY1JjK2a8MYTqaFyDTT0hkRw1fCHbd2GdHhV/czB0pv/xe09CfqLlJsuD
	ltQNEB2UxIUMrvzhbMH7MRZxEXUwIwHxxUgyDLeeofAim6FIXgP1GtnWvGros8QJ
	V9Hoesmrozfe8mQgLlEu+TX7RZQ4LfsVSmU8YOIRuq5Oa6oHvSh5hAsYPbRSZJKm
	H/cHbzGwZCzDjDJW+6Z14zy+je+E85A4ZZfJxmDlpUoeQpYKUKJc92s6jo/Et4oA
	I6zwSw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9gk10cr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 13:23:46 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a26fe9521so2511549eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 06:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793453026; x=1794057826; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QK/sB9dSAJ/2G2Zrti3sXc4ovzV/2wnifjT8fx0zQuk=;
        b=K94VOunYFCTJucjPgXdzzsE1i6nKnoHTpICFaG0+o72a3j+IdhQ8ITjJiKoZ3JLCCU
         c0Nbd7b60tGtkGbZXWS4nREbu3TnddXR72zquVuHjB8I53KPsqHPXp0geLVAiy6RnCmQ
         tZl8kQ9c/zXejB4hPsikFgemTX8y38DeV/oIxieEV0UVAftf7swrfdnEuh8VkaeahYY0
         D1e7QlNXKxJk6nZ2cZBg242thMw/rKeHdW/96aSHNSRQfyrFqBSmpdU3VgRaERX7+X/L
         UZSuvwLtt1lbNdLhgy0x32FFptYcze7FZ7bZ7Cos95kjdAWJSC/5jHqj7TFYeEkzLV0p
         blJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793453026; x=1794057826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QK/sB9dSAJ/2G2Zrti3sXc4ovzV/2wnifjT8fx0zQuk=;
        b=GPjv/P/YuB6CSuZtxgPmsROi8C9hf2+Wdr1a6a339+C/4Vg5xb+wpyXqAQ+uK6T7NO
         V3nVpAY6nyzuH6BHj8YM7g2YP+/nrHuWw+BFeowNH/7AeqIoPzBkT7afT7Vo5E7fJjgO
         2vx/pSmFzA0E6ddhkmmTWbMuOMyDHWBJjmkd2qiQXxDvoDkYsIoUVshsvg85YjmtGdf8
         gi5tB3XShp8cQ0YjuzYP5quAVNt8+ZxQxr3Vs8Dn0H9ILIlQf5OqNkkECr+6XwhepJna
         B52vvBh2jHzvuiZmAcRY+vCrZfTi5QikWg/whKFmCf/t5kmyuEe3phEMrvIw3oe9eTl/
         j9gw==
X-Forwarded-Encrypted: i=1; AKwUvBw+nB4SsK5DQ918Z34MPL17ykFeX24Lf9swMDZLuD/wt4Qo5Qy4uh8SMU5ww/T5VUvcg1fUVSNoAf8w5AOE@vger.kernel.org
X-Gm-Message-State: AFq9FYJz3HutJfyL6hnN5YHmCUHm5SADtC5wxzQ6k7Pb4S/V3iG2GOyI
	tIWUPqZQO8U9b5BLcxEc7IBBpKmVNluseybF4e+oscT6ZXLGF44wUrJGm6MfoRH4rhcxo351jhV
	djf5IxvI2tMp2W2aYdZfTpwAO6cqVRb8G5lH5iRb7oCNoE41mDPvsF564/r3AZ3FVZ4Sz
X-Gm-Gg: AYBFou2FH0SIeSIRLPy54XafhX7SaODu1DTMRbM9MFDFuvwg3JClCCnGuO9zjXmwVFL
	w45iAEm6UMHCF3QPNRgb0qkPgJt3Xm4VFTRi0ZNfn3JRCi+MmgJuKHA1+eeoL49Z/ZktTe684qY
	v5mF5qcPK3AmASGiYTgDbRlIf7XJbDpAf2Abn3761BaPrTH5eAC3mRVYT1aDuqCWdpKS0dq1Cl5
	oItGW+sDeMnhZALaDnIOkoNNaCk34SG9Vw9WByIioXfh0ezv6T4/VyYm5eZp3mYpKPDFQvSjfVf
	dHlWniWNep90EoaCmLCVzlEcHPT0wM0QtOSK3Mp0okAKI5XWgKmxVpxiv9Az31QX3aucoulWl6S
	2nywgnq4TW3Gldh/SCi+SdfX+1crtYf5s/LBr0vVpi9sQADPXpweiJoXZaCMUET3UhOM42cjpnl
	DdgPQ=
X-Received: by 2002:a05:7022:619b:b0:144:eb3f:563a with SMTP id a92af1059eb24-1a9497b9d52mr16175360c88.15.1793453025802;
        Sat, 31 Oct 2026 06:23:45 -0700 (PDT)
X-Received: by 2002:a05:7022:619b:b0:144:eb3f:563a with SMTP id a92af1059eb24-1a9497b9d52mr16175303c88.15.1793453025137;
        Sat, 31 Oct 2026 06:23:45 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm18234699c88.11.2026.10.31.06.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 06:23:44 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 18:52:51 +0530
Subject: [PATCH v2 5/6] arm64: dts: qcom: kodiak: use thermal hw-bin trips
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261031-thermal_bin-v2-5-d76fd073ae98@oss.qualcomm.com>
References: <20261031-thermal_bin-v2-0-d76fd073ae98@oss.qualcomm.com>
In-Reply-To: <20261031-thermal_bin-v2-0-d76fd073ae98@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793452983; l=6059;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=zx/+KrnPBXqW3IXQIcYA1/rGyuK8dpGWYkITAXNPsCY=;
 b=landNCcP2nN/nDJm9jEwbRau0/QrQklY7co+ps2J8y2O/5eYr/NHeZXlWxOMXFTITaO7Ec188
 lgLUtKStI5oCbtZuCH6veO9WX5jrTp459fVs3SQ3tsKgkFER7dO397L
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-GUID: ZsduNKCRJ0QqrSTeXASlI_LFvbOOAAl3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1MyBTYWx0ZWRfX12hMhnqRkber
 a3x63BYdyvbwG8bawBvkWinY+cjZKjRrnym53I+U3Hd9rZtjsDczBCg26KFINvhZtCn51pjkkCZ
 pE/gcc1EpsRwJiMWzUgY7jzDuQ1tEpFRoD/sP4kDZw1+PyDwb2VBc1f+aw9DTOUords4zR8Y6CE
 e0DmnRCj6rMqKfQuiMgKaIPo2sm2qqGXqJ/ogic8XwF2xZW+fwD7gkoOXMICijpXPq38E2hlSTA
 G2gNyTU2GNEgPsY0q+FPyLcWL20olgrME2GuM0wDR2HrffhyoHnzuPqo2/UzypjbtIM79b5Ny+N
 lhdB9HErZEQi9ekVO74pLrn8Nt/L+B8EsUwq9a8mIeFwG1O2psaWnIvbcxCGV44i6lo0bmDRNnA
 9qrruPLHwJ0Ic7F3Zo31nCeqV00nRypqdg6yqIZTuMTEWzm8J2YHqVvewZIAGaKl+GN2sFMRSXf
 81qH4w+RFRTyJYOaBrw==
X-Authority-Analysis: v=2.4 cv=HNBWhYtv c=1 sm=1 tr=0 ts=6ae5ebe2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=PCFpqnHMHODqJTmB6Q0A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1MyBTYWx0ZWRfX7fVW3JTGMmVa
 g/tl/5HilQCSQOoRKZqOKE3IXjIXRITDANicFdLpGBXtpR/iubSr3jOoY7uhSLwtlqhBut00aJ1
 XZG+cZZlS5PeBdKesnO68GAGDEr5qXc=
X-Proofpoint-ORIG-GUID: ZsduNKCRJ0QqrSTeXASlI_LFvbOOAAl3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310053

From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>

kodiak-based SoCs are binned at manufacturing time, with the bin
computed from the jtag-id and feat-id qfprom fuses.  The tsens driver
now reads these and feeds the resulting bin to the thermal core, which
selects per-bin trip temperatures.

Add the jtag-id and feat-id nvmem cells to the tsens nodes and convert
the passive mitigation trip points from a fixed 95C to per-bin values
(95C for bin 0x1, 105C for bin 0x2) using the new
temperature-bin/thermal-hw-bin properties.

Signed-off-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 58 +++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 347815e5983e..b984cf47b70e 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -1019,6 +1019,18 @@ gpu_speed_bin: gpu-speed-bin@1e9 {
 				reg = <0x1e9 0x2>;
 				bits = <5 8>;
 			};
+
+			jtag_id: jtag-id@180 {
+				reg = <0x180 0x4>;
+				/* bits = <offset width>: 20 bits at offset 0 */
+				bits = <0 20>;
+			};
+
+			feat_id: feat-id@180 {
+				reg = <0x180 0x4>;
+				/* bits = <offset width>: 8 bits at offset 20 */
+				bits = <20 8>;
+			};
 		};
 
 		sdhc_1: mmc@7c4000 {
@@ -5782,6 +5794,8 @@ tsens0: thermal-sensor@c263000 {
 			compatible = "qcom,sc7280-tsens","qcom,tsens-v2";
 			reg = <0 0x0c263000 0 0x1ff>, /* TM */
 				<0 0x0c222000 0 0x1ff>; /* SROT */
+			nvmem-cells = <&jtag_id>, <&feat_id>;
+			nvmem-cell-names = "jtag-id", "feat-id";
 			#qcom,sensors = <15>;
 			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>;
@@ -5793,6 +5807,8 @@ tsens1: thermal-sensor@c265000 {
 			compatible = "qcom,sc7280-tsens","qcom,tsens-v2";
 			reg = <0 0x0c265000 0 0x1ff>, /* TM */
 				<0 0x0c223000 0 0x1ff>; /* SROT */
+			nvmem-cells = <&jtag_id>, <&feat_id>;
+			nvmem-cell-names = "jtag-id", "feat-id";
 			#qcom,sensors = <12>;
 			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>;
@@ -7136,7 +7152,8 @@ cpu0_alert0: trip-point0 {
 				};
 
 				cpu0_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7179,7 +7196,8 @@ cpu1_alert0: trip-point0 {
 				};
 
 				cpu1_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7222,7 +7240,8 @@ cpu2_alert0: trip-point0 {
 				};
 
 				cpu2_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7265,7 +7284,8 @@ cpu3_alert0: trip-point0 {
 				};
 
 				cpu3_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7308,7 +7328,8 @@ cpu4_alert0: trip-point0 {
 				};
 
 				cpu4_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7351,7 +7372,8 @@ cpu5_alert0: trip-point0 {
 				};
 
 				cpu5_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7394,7 +7416,8 @@ cpu6_alert0: trip-point0 {
 				};
 
 				cpu6_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7437,7 +7460,8 @@ cpu7_alert0: trip-point0 {
 				};
 
 				cpu7_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7480,7 +7504,8 @@ cpu8_alert0: trip-point0 {
 				};
 
 				cpu8_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7523,7 +7548,8 @@ cpu9_alert0: trip-point0 {
 				};
 
 				cpu9_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7566,7 +7592,8 @@ cpu10_alert0: trip-point0 {
 				};
 
 				cpu10_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7609,7 +7636,8 @@ cpu11_alert0: trip-point0 {
 				};
 
 				cpu11_alert1: trip-point1 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7724,7 +7752,8 @@ gpuss0-thermal {
 
 			trips {
 				gpuss0_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
@@ -7751,7 +7780,8 @@ gpuss1-thermal {
 
 			trips {
 				gpuss1_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <2000>;
 					type = "passive";
 				};

-- 
2.34.1

