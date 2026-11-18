Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794972853;
	b=LV7DhDn3Xa8p1o+ImtjRaPcOMjW4TEG1fiDQ1cS2nuzlxz2lv2veAewUFq56W1Nv2xKL
	 +CUhvOeiKzksqRFkIjqr/NCvJFnxohZIZF7K07zkcYgXlqrnTrhaA+f1deFHYzsRBnwoC
	 5wlhRAZku2o9KUq7n8cgoEm3AiBLg9ed6F4My3JJM4ZM7GM4WYwXIv9onjR8a8pXYCBQW
	 LiC3YLbwN4OZBMQuGwV7ZrbnqRq5lcXPfAzJwTPuNAUviJnRl/GaAjjb6xkW7CXxlFiJ7
	 9UAfzS6ivdR2J96mft8JZcAOuIH2obkdz0sEOn6AneUl1sE0KXyRXrr3RcEw6Zap8Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794972853;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Y5zd7borrxrnuo7aPTvNtZsQhCDXC6ETrT7Dn6psmaQ=;
	b=WL2Aei6BfVHY0DMM8PcFU38p/pFVCF8FShnNe/BbXgrRC9mXzrKXMSyO5WNNzksoagAf
	 pOK+tLjGJjEil7jOmSBIETo0zVgutLGv6UGLI7s+Zi4hgBH599Bhw6YgkEBAJmlZ3p2C1
	 /3px6DrRDgYRazx4osOAk8gGWbT01E149URWnO9Uj+ch1keTACJqDNXcIYKZopaBPwZBG
	 8WOSFPcZ2xj8DcNYR2SxsN7pB8iQ/HJb2UMMOPOmX308Rwbr6L3tEYiTXysoTQf5/w+ly
	 Jx5BBldEBlyjmod47zGZp8qKdJA8sZP08XlIgHWFfLj0d0cdpDVHIV3ckEkY5noh6/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QzFDB7V3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ke0st6+t;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305D5606A32A
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 03:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 305D5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QzFDB7V3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ke0st6+t
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UuGi472513
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 03:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y5zd7borrxrnuo7aPTvNtZsQhCDXC6ETrT7Dn6psmaQ=; b=QzFDB7V3eUCyQF6Y
	jTWUHL4Frb8aL5dBQbjwFfFzlmiFo4PLVfmxw7QcWAWnaGBNtsXC6ZlTUDVPTcaG
	rbfiD/FiMOD/ORWE5A+5+POuHDVaBzCOf5rsBRYl0nXTVrCTRUrETogIM7JbSnB2
	GpshTeTcj5zDkgxRHmgApvDQN/tndT2kMW/uBgWZJE5BbK51qgrhtv4r5i0ZudWz
	xB7eW+ZeNiU/QoIHgrSs+J4j5/e2v89rUpQkHiupaCPz2n+C40a04xakdk1VmuwG
	KMuKe6AwCxY3e1aGWLNZUxdAKY9sLszvA2fqxSDIBGApAXaSCeO8YDo6Wx880nDF
	J5fuDA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv88ycw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 03:34:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b691cf0eeaso778416b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 19:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794972851; x=1795577651; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y5zd7borrxrnuo7aPTvNtZsQhCDXC6ETrT7Dn6psmaQ=;
        b=ke0st6+tfJkP0uDSPVKInBc+s8bJolH1AXIJYPzjG5VCWPIwwcMTeMkf/Dc8asQCOF
         MlFLY/CNSRTLxtry3i1D5LUsUCi7XMv0z2sZ1pp9+zISubCFsRZDEPBrQ+Km9jT5DuVt
         NoCF+Y5ztyzhH6bRUbmXhez0OD8ou3mYuuqKPTdFE5d8xeamc/8oQX+IBW7HOPu4z3K9
         lgqdbR5MdhNMKemQlwAzcHtBPdagLHnvaeXQfieBJx8DF46TTFtlN/6eG8tGVma0bXT+
         qaxOEYf2ZDLHfUCFmHe/soznY0kzt+u82aPk9NGdMfeIAGIEShDZhfPDlvq9Mh+93uxO
         h8sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794972851; x=1795577651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y5zd7borrxrnuo7aPTvNtZsQhCDXC6ETrT7Dn6psmaQ=;
        b=HlyI8eAdmciJQrUIJcG4k19HAtSrebP3jGfQ0NX5iDDIN4eYb2MK1VZtFG8MdNa9Fy
         XhH5GIA8eToym68ooyKsCLRD7N5Luegwlf26qrpXmdl2lgQjYtvjr+4qL53ntHa40ZVX
         kRZsbkOv2Fr/SSph6yDhTVrZ5mr1kghD2zq4aHT0oUrTZqla9wKjQGeFAxstQ4dl1hm+
         ZNbpXsU9jGcIOSr68ukatHDtD5rA6TwSbNhFoSSHo/twRO0FF1pp0qylFTVFPYjlUy58
         8QoIiptGkUjZ1vPRTWuY5fkmUCVB8zAVHjgZvkEKzByx8D+MFimPpfyiK/IE/HWyEpGs
         UyXw==
X-Gm-Message-State: APuU4Z/q3e904FDEPf3WZPL3sEQp1Qysnuq8n/Z7fPtY3hrwLwe1btJ+
	hTkcV2rKRirqhIaaL3lXtnjcNvuUZQXMXRXAPU8KLCp0O2HdggnH8D+P5bkVNAA/Aex2xG6XQBX
	XSFmpO2NzsP2wq60f1VzVEw5j6K//bBTDF+s+H1ABNGKMS0rrmx1jD9ptg/FRinUdTTYg
X-Gm-Gg: AYBFou3oI4bHtCi8mg7sYmIkWwqYXWoSWAhGJTGJd2n/qtiMTszNc8nLn98Bpe2cLHt
	Cpa8ibHymrf0FUWzd39gU/7hvBKW3Jj6XhaknI7UWh3aEjczVRirjWvpJYf531tG87y5FeQzrzd
	Uj4VmSVKqEJgLJRndOJ7KUCosTLRc6JvBh7UxWKGY6yB37KgvsPyvhu2rvS5t8dRIiwc9E7uYsO
	twFVQlG0gOIZztdf7onbp4SOYyLZbo5A0UTAD68i8oy7ZYkG8Tu7qRdx9QiQQoA2hdXwA6wb+yz
	vwJsqek/hEI4ox69EXILqRdEJ08wkvc7JlNzO8+OvH4D/CMxeGNQt3umiIWKzAiwboCTGAdQa1b
	YkYeOhLsE9qR8E/mYckPGKuY5G7ibrx+/mOqepa9f+VR4g0Tcj6Ed7NTlQtcFlNbFJTfwRwshHT
	7vDPFKlNZm5a/iQqv/9ZVQ/9SNUqlpUUgf5CTgACaglw==
X-Received: by 2002:a05:6a00:13a6:b0:881:4b47:f305 with SMTP id d2e1a72fcca58-8c5d101dcdemr1132156b3a.5.1794972850998;
        Tue, 17 Nov 2026 19:34:10 -0800 (PST)
X-Received: by 2002:a05:6a00:13a6:b0:881:4b47:f305 with SMTP id d2e1a72fcca58-8c5d101dcdemr1132129b3a.5.1794972850507;
        Tue, 17 Nov 2026 19:34:10 -0800 (PST)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5c5327088sm431644b3a.0.2026.11.17.19.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 19:34:09 -0800 (PST)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:33:14 +0800
Subject: [PATCH 2/2] arm64: dts: qcom: maili-mtp: Add WCN7850 Bluetooth
 support
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
Message-Id: <20261118-wlan-bt-v1-2-18bb1b059a17@oss.qualcomm.com>
References: <20261118-wlan-bt-v1-0-18bb1b059a17@oss.qualcomm.com>
In-Reply-To: <20261118-wlan-bt-v1-0-18bb1b059a17@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794972840; l=2058;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=Cv/gIda4Fl9M2sm39HQXP0VgMs/shsqTRt4j3BjUb2E=;
 b=7QBahbqjxRvz4Iy1cJSQK7td0NKbK8eJVLO2p5e98lvNGFXlfpKBmRpwUhLjZwx5i4V5Ns35x
 J7GdGtTZ/onAUdxDLeQpcg1f/kdzIbDN7+Q31t/UK/gT/CewjdTM5MP
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-ORIG-GUID: pZN8_szMnUKEExny4dxNR8xSF4PQy3ne
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afd1cb3 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=R0MM0Ny8nPPmWmS7J_kA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxMyBTYWx0ZWRfX3DXUyHiDhC0m
 hpkhAiOJk0nl/6ZViLQpAf+AfzyTDcR6+JlMsvwKtxj8MHsHC6vIfo5ifHjqwqDh9OzIr+Kv/yc
 HqSzVV4KV40oe0NMUo/5yO3FbEBhuOPCA//uFqVj9PmG4SNldi8VAKs/0jgWhNbmc5XIGbf11Gm
 JLcNEz+SxW81yxty2Fhq2oQi6twwhScUTnZi+si3jBer626Wy7t21CcxpUCGipQZCsRroeSM7Kr
 eJwyEMj+f83YdbFhFA9Mt2ApWG9lzH0I/dCEUagCcfjY8/Lx0sOx1QPZwwiHJ1wyc1BnhXGrVTh
 olypP1h2QG/rV7uQ8b2e+V0TB4kz5FMWFd/NoOQFgk+IPawyayXMnMYHo4KJEhFLFND+bnt7wn1
 gtAf/hiyu047vPRP6DqftK/8s7sF6H4FW5Mn6RDTgvDOt4t9yU2Tgj9Gt3ekajbT8C6SmsXorWH
 oWl2yPQcN4PPpQYskqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxMyBTYWx0ZWRfX1jrrg99KcOua
 hK4DC4H5PccEdPuhWcc69PEToUZ411BK3U1QJpA65pI/ZeVoOFIduJVXirqsKrCOJUe1LG3DxfV
 1UJy5aZOyYv3cczCjqO134okyIv37ns=
X-Proofpoint-GUID: pZN8_szMnUKEExny4dxNR8xSF4PQy3ne
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180013

Enable WCN785x Bluetooth on Maili MTP board.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/maili-mtp.dts | 35 +++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/maili-mtp.dts b/arch/arm64/boot/dts/qcom/maili-mtp.dts
index a3c2016eb9053..49fccc43c9828 100644
--- a/arch/arm64/boot/dts/qcom/maili-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/maili-mtp.dts
@@ -146,9 +146,10 @@ sdcard_vdd_3p0: sdcard-vdd-3p0 {
 	wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
-		pinctrl-0 = <&wlan_en>, <&sw_ctrl_default>;
+		pinctrl-0 = <&bt_default>, <&wlan_en>, <&sw_ctrl_default>;
 		pinctrl-names = "default";
 
+		bt-enable-gpios = <&pmh0104_c_e0_gpios 6 GPIO_ACTIVE_HIGH>;
 		wlan-enable-gpios = <&pmh0104_c_e0_gpios 7 GPIO_ACTIVE_HIGH>;
 
 		vdd-supply = <&vreg_s1j_0p8>;
@@ -178,6 +179,10 @@ vreg_pmu_wlmx_0p85: ldo3 {
 				regulator-name = "vreg_pmu_wlmx_0p85";
 			};
 
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
 			vreg_pmu_rfa_0p8: ldo5 {
 				regulator-name = "vreg_pmu_rfa_0p8";
 			};
@@ -872,6 +877,16 @@ led-1 {
 };
 
 &pmh0104_c_e0_gpios {
+	bt_default: bt-default-state {
+		pins = "gpio6";
+		function = "normal";
+		input-disable;
+		output-enable;
+		output-low;
+		bias-disable;
+		power-source = <1>;
+	};
+
 	wlan_en: wlan-en-state {
 		pins = "gpio7";
 		function = "normal";
@@ -996,6 +1011,24 @@ sw_ctrl_default: sw-ctrl-default-state {
 	};
 };
 
+&uart18 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn7850-bt";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+
+		max-speed = <3200000>;
+	};
+};
+
 &uart7 {
 	status = "okay";
 };

-- 
2.34.1

