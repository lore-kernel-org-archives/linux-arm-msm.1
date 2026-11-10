Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328771;
	b=341wO5Oa4tdIJJPUIwT7TINE1eX128sccOjKVJ6QMOU9r6E/cWpDkLlHREuCVc7gUvNp
	 9YzermGGU0eox2ODD6zT4tCp42TdoEMbGxWGph6+InL01hkjfoSBNqhd04IsAPxVzfRB4
	 XtEeIX6b2ttR4pqChTXrxD60btI0pVfZONQkwng98EK7HjGfX0ccZm/kmAHtRiYBLvsiI
	 qQDX0VPe9cYDosq30J42yh+1aqbOlQ/vm+hjazxX44wl4czMjWckxQXW2VEmdtGFZr3WA
	 no8a+i48Qx3VCzjSNCZ8JYmagAq6UkMk+zmIlCh8f55JDQpviG4EEFEQhxTW7VwerZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328771;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uMoLa5nXrmE5D5TkslCS164rpHjf2daSrR+xEZtKhIE=;
	b=0aTIkqn7D061NZdphEM1Zp/r7srXRrnbVhtOKuCi2AloT0AHZsFUVmUpi5cfNC7Sk1/e
	 rtXh/Z+UawLTctNnTZbHJx/TVQs9tVv51Mp1fEhHZ4u7CrUHd+5NS0o4VXxrs3vp3aF4s
	 rhp/RAmk6I9nNGyK+tlB21qf6XnYZM09pDvq+xiixNYR/zOy5YC86AIH6zFxA5Dqgmf5v
	 GvbUSYjA4O9T7X86jcBsIDACoAzRNOiykSK0H9cso5JygcNBsdWDqdfB/UxEIP7QHBO40
	 iPCcpPUKIF1lYj7sYZZdzPDUDL0geqN81H49cQbIWF9rqrjykEh0HuQVfnnW9seiCrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=id5ECjwM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bz+erQGD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BD960A2611
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 16:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92BD960A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=id5ECjwM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bz+erQGD
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF0Ftm151587
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 16:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uMoLa5nXrmE
	5D5TkslCS164rpHjf2daSrR+xEZtKhIE=; b=id5ECjwMpiTWb/JDscdsOoA2vaN
	HeC0nXtSXiQDTgP4eQ43lawRshbOlMOCRKUAmSTEdERULG3KTa4xmz3qLUPbhSUv
	Q/GdT0HTdaeNLosqL/byjhGAaxUflp/sw8/68ocVBB+Rs5kBGqlQV5JZsXTAUewd
	eIDe5F4/079MWMaLTQeaaJtNI09g/2IF8ahfB6zcLgB2aRjWiI7149Js9e2Hm+Lk
	FJcPc+N2Lyb1U6CGudHOWtWUYF/zCdoqEX8F4qbNA9sAY9qjq4I1jyn3QDqhnMtr
	nXBv2H8okQcSgjUOhxTYpcRS7T13uS03ivwl63r546QTuBSrMAiIVyAR9Bg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv4pv8nrr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 16:39:29 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99b8fbf29a9so846904241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 08:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794328769; x=1794933569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uMoLa5nXrmE5D5TkslCS164rpHjf2daSrR+xEZtKhIE=;
        b=bz+erQGDnO27HjArIQT8sH/5xBXf3wYQMnnsGkjPPzD6LyWnNVwArYFaTOYsg9ps5f
         gPtdWPAhkXxXdVUsKqC7LhZZfxgk/+2UIuNgRt7vRHy1H7Et0aUOv21GHG9xem0JaMXX
         BdrtYJPJCRbCU8C+Evk7GEzH0KKrlfM9s7eezdAoHsaLm1FeYCOGfrZJgr8uyWqOVulP
         VxVuqNWMAdFeSggqoMhsDfH25aMGb/S5j6HfXsVK0saAKjn9HAQz9sHVh7jyb46ZeojF
         PT0jKDKmcD+Cmi1CbPYtHbdNL2hYmRn2/s7xLdRYEQ78U2b9RC70IwiVvNE/34XTxP8B
         cVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328769; x=1794933569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uMoLa5nXrmE5D5TkslCS164rpHjf2daSrR+xEZtKhIE=;
        b=0u4J8IzQ2PtLBtqfVw4fzpKJSBCZe3Qmlef8QjOaTCT8ppf2vr7rvUFyq+d1ww7mp+
         Q7B0GA2S8vQmqGQbQKvj2dztTpHZsQ3Z7qk6Sily0i/X8vxumKP2qEFz9TprLn7GDk39
         gSNr7BoL7LMvfIXOd+MQBi9tWnfjF+VGUX7XiB0+bxUK4+F4Imhq4t9vcOyXTTM3oXwg
         +Ak+CjUvcP536cpyGUVqw0O8Qb7xQCxnUk5ZsLvaqtbTn52XEMMjs9fxTT52q2caUfV4
         rCGoe2W0QS0HpgkV0YGHH7EHPfEUnCa816b9P4VTBenpMKkpa/ybJ8AMu1SqnjqdTQy+
         XK3w==
X-Forwarded-Encrypted: i=1; AL+hErHAA/Cdfqza2x00QXXLKEtqOH4Cx+j25D9WzAs1KSS8+q7uG034Cil+Wr7sIGFIms1qXrZzr0jIojDX7/Uq@vger.kernel.org
X-Gm-Message-State: APuU4Z9L83sDDRxKeXcEs7jGN4qYeBFLBIE8iPd9LCeidbDWLV7aatdt
	Zng5AmKSgiTzwSSoHVfEEUvemsupKKZmHkcJRTMXmLEo7GH6haF3be9Zi8q6aNuxrzVuUvIcP7i
	dJpmmCMIxCcc3auJaQwnPzMFtaECKwUT2V3kPOkUGMh1FTKWHNSDD3dKMb0EgZbsK9kp+
X-Gm-Gg: AYBFou1Frg9/72qZI8jffNTlQoIPT+bM3dBnE8rRWDS6FX2kXsEq2HSLTfNTFDSpi6t
	cH3F0fmA2UNzm8hf3tUkaJrbeNEghfQOtxuBjNOsw0iFkqfJJoaB+MnEG/osbttz5Wugq40F5ei
	m5/yn9fxhM0GNcMivGrbqzdOJE8wiO41xtl+uxhsNH4c3T8txwgQdscd5P+MzSKZIDDqq91O7yg
	wHVmjVhtKQs2IEHUegIPl+78TzA/JIv/Iaf2ogBXvXUuenLsGmRWNdW31TO0/pjO0/3tkmh0oxe
	o7s0jlxlM7NhBtMbZKb/MxJc7pPBLdReP1UCkskmF/WpDvQYr0iVvXHtsTOtvrOGlW9e46h2ve1
	6KySFBvnYXdzum8stjubrU8CEIR2lDKYEmt7+F1mYAd8g4B2URLZkTlynQLCLEXy0SnCCSYoqUg
	==
X-Received: by 2002:a05:6102:579b:b0:7a7:196a:84ea with SMTP id ada2fe7eead31-7d301c16e28mr1097968137.34.1794328768976;
        Tue, 10 Nov 2026 08:39:28 -0800 (PST)
X-Received: by 2002:a05:6102:579b:b0:7a7:196a:84ea with SMTP id ada2fe7eead31-7d301c16e28mr1097951137.34.1794328768520;
        Tue, 10 Nov 2026 08:39:28 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01ff3428sm85130395e9.15.2026.11.10.08.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:39:27 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v8 7/8] arm64: dts: qcom: kodiak: Add JPEG encoder node
Date: Tue, 10 Nov 2026 18:39:08 +0200
Message-Id: <20261110163909.78085-8-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=XqZvqlF9 c=1 sm=1 tr=0 ts=6af348c1 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=iVVtd_vrlZ2ormJ2GbwA:9 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: WmO13ED7FgBHtq6EPrE5XmpEmY_-SbQf
X-Proofpoint-GUID: WmO13ED7FgBHtq6EPrE5XmpEmY_-SbQf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX+Zb+FCEfaapN
 myCoP6eWjYuxYyF8PdHjUEbdWClhA+/2aGlnmJkyKVsofOJWynIUv9GUmXRfKshZHKVAVZqaQkf
 ybwN+hidgc0oxe8QyDVqJPTZ6Ar0feE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX0QeDSb/z99FC
 XfjpioS72eTkZr4b5cjANp6ZPF9hdBjtFCtfNHj73t2QND1mFFcdJB8fz/PYTzHnGPvIFZfij6c
 MvxxDrf1Y8I6bZ+2r+90lU96iLfJVsKujEZRQ/ocPqq1BmWdlBIZPBzHXLo3G0PwAA0cxSgPG1C
 iGEXPIBYTcyVXfQL1tMVd+AcuMzLUxyTsY0rbF5SuKdCdT+r6f/wMAHGtiHqv/YmJoBXp0VB3wO
 PFJc8OB9itq6wREhYqlcYAfCB1NHNWyzjZzSmWvmHzbsJHMDzFEYiy04lqhPrSXMOupm868smAs
 i28xz4mHmyJoEztCBykaq0urdZe1AAyDyLufCwOGCEXcqu7PvjgMjxqg1X+N/5iaKmvYDnJ8nHg
 PCiu3lJ2iPjOy8j0WQqODqN1cLjJIkq6ea/1spny/jplY4pjkQNvXw+mkIKpgt4OiJRwfripp9L
 Z11I+NFlahSXeDLWWkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100066

Add the JPEG encoder hardware node to the SC7280 (Kodiak) device tree
so the qcom-jpeg V4L2 encoder driver can bind and operate on this
platform. The node is disabled by default.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 67 ++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 8c7523602d271..b46fbf5ebbeed 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -5164,6 +5164,73 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		jpeg_enc: jpeg-encoder@ac4e000 {
+			compatible = "qcom,sc7280-jpeg-enc";
+			status = "disabled";
+
+			reg = <0x0 0x0ac4e000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+					<&rpmhpd SC7280_CX>;
+			power-domain-names = "titan_top", "cx";
+
+			clocks = <&camcc CAM_CC_JPEG_CLK>,
+				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK>;
+
+			clock-names = "core",
+				      "bus",
+				      "config",
+				      "cpas",
+				      "camnoc_axi";
+
+			interconnects = <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "camnoc";
+
+			iommus = <&apps_smmu 0x20c0 0x20>;
+
+			operating-points-v2 = <&jpeg_opp_table>;
+
+			jpeg_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					opp-peak-kBps = <258480>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					opp-peak-kBps = <531480>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-400000000 {
+					opp-hz = /bits/ 64 <400000000>;
+					opp-peak-kBps = <1006560>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-480000000 {
+					opp-hz = /bits/ 64 <480000000>;
+					opp-peak-kBps = <1084440>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-600000000 {
+					opp-hz = /bits/ 64 <600000000>;
+					opp-peak-kBps = <1084440>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
+		};
+
 		camss: isp@acb3000 {
 			compatible = "qcom,sc7280-camss";
 
-- 
2.34.1

