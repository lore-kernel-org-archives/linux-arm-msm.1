Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF2B259C82
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 07:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791185113; cv=none; b=A0JySBdd6gqYZLt2DdptYsrjtBImpddNACgAWaaQjms9bRqzCUsk+pWHqnTlwR2g6filllKhaxYCKjmuiU4hn/XOZk1aJZYdzsATGnw1COx8ScjXnReAoXyxIatXrrdV4LWdNxzojOTsiZKAzVWykfaUKaZ7kcPi2GvfajZGQZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791185113; c=relaxed/simple;
	bh=KE5lnf3g0TLSQwmbAHHp1Q6HH2MqV/4eigAvw1yDbiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lU96KP0OeRCUmA4kqOePW4UPqxWt2kZUGFBSql0mJf27Hin7fmos8e99hIwuYkU3i5UaGmyw14PkDxIEf7QprvuFTcRIi7mLs3TSPxWCfzF+cum5d73XqV79vzLaHtGXk8DfN5laVCEGKe8BfB/jfKehH/GClnaegDWUbzNJvrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ee5kYlp+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fF0faBeI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ee5kYlp+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fF0faBeI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69510ZJU094008
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 07:25:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/24GXEjVyFJfwdd4HTQn7zAyjrmcG6cdruCMH8XBiVo=; b=Ee5kYlp+n6owqe9k
	jdlV79cvLqzu9NGkdwR1YutTxNk63cB9nH68ng7wKa77jcUH6bKSaQDECNOY6OMO
	uW+DExtUiE1iXCSC6WiXKnXd5WZbx8j5DvEuFYntLmkqo2s55VHGOYi+QhLayFRR
	PFKGIBXdn4pvTcMFGGY7lMMWr1+seJ+YUk00oi1PdpfrNRRBy5zvK3/vOi/EEuie
	2LERWJKXjD6+INB2HQg+M0t9lzZTCCsFdHw2bf1hC8Q0K20gz31Mwb5GOINl26cw
	x5tMfCMvlFNTYfIUwd0rBwopHurwchw02gZUS+tS+n3ff2dhBnYR2Pq4IwuZLONI
	e5z8Qw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssu4vb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 07:25:10 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-385d2703b64so1216547a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 00:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791185109; x=1791789909; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/24GXEjVyFJfwdd4HTQn7zAyjrmcG6cdruCMH8XBiVo=;
        b=fF0faBeITUE3zMIBUbJSWgRE9cjKw31n/yGRKnw7yb+4cKD1f0rWeIkelq13iJSn3N
         1JYW8SexUrV7l66pzB567AQ/BAzGFUSonD6SdeE3euXhQT3E9yi16qyZOnjfEVHT+t+A
         H8qqQ33plQBoDuGNvWrTMMSJvVlGuv268julaaI7aDJZ8HHJ+TTIPKb97Xey89Bzbl2b
         BY1cks6Fhp1GFjhbsdbl32FBJMzC/qmN5osQ42XQbOhAXDgpN8Cn4CVYa3hNVMDQ5Ss0
         QwAQuQY3H2/LSA8XVreEzw30Msrt+yfduS03Db4tymr7vVT4gZNc/OxFA9WEYCUZMkwD
         92GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791185109; x=1791789909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/24GXEjVyFJfwdd4HTQn7zAyjrmcG6cdruCMH8XBiVo=;
        b=njBbCvQuzpoNc6ipVSWmpPqMZ2JZwamIDkUgsq/BxTgzTX1l+meUQuhDgDmTYeXzIo
         E9K35gpyKXM+kyhrnxKeDRu/hytzJDkp38a+7gwUIK2wBob5hAbGoOJ2waASmGyS+Csc
         MfbgV6rfwBB4DLj+aeGsD2F8nQRAJT8V/9QeGWU5WVie2JfAtlbwJP7eIUcuN36nyeib
         RYSNjhkp6hGLVr8/RDKphFwLVWi5zhjftpiwGLVoBNJaRiVA49wybFoI3uQksPeATcmq
         Y9NSRUiiP6h+vF/uDDBtca4dIiQpbePlTA/pc78qwzmV40diop0l+75+rDps/87DhNco
         24vQ==
X-Gm-Message-State: AFq9FYIj7iLcWjpuS0ovxKzYA8drSr1IXBA1nKuLyd/4vOnYV7Sc6J/Y
	DT/63HhCxWKwEVVuFPWiNw1af3Jky4qg0n2SNv6GaG/r+1M/3et9EgVSBTfzILxdo/jAvFZsQZo
	7Ra02R+HnR7RWo0ZG+ltxbRiO4ul3Z6MX0FieEdMQKcvAA8IEhlh9S1wyByuNJKEDarjA
X-Gm-Gg: AYBFou3nsPx4iSSAfqSMK9mkwNlG2T5KGQVfAcQUpcUMvyTbN7V6an1U0dE5vhayE1A
	nrCtma+uqJzVASITR5MdQLq+EEJSgJ6Dj4/gU+Y352u8lfSKtB/6fptuHJhZrwZEqeWSR+2WASj
	eoxlLbFACSW0Wsg5l13hTo9lqcqJJlTMXCzipi0W41xWCyQpveISPDlhGWVFCZQ1AN1c9r69Rxt
	kVOION21OhtuRlLoY5dt/SORqnGaJJ4cd3l+ydFX4ideZKr0HKJMzMVBfWKlvFADt3xoAqAevpP
	9mo6Wi+wUBpqyu53gAGk/PpwcLBBMwS+weBrnGtAIuDGDlyv3kKDdflnp0MZQgLUn2Dwb6oYfQ3
	RsYSpvvPIl5htJzRWNqMvHDGxb3hVxY/qoRU=
X-Received: by 2002:a17:90b:1c02:b0:39e:6c68:fd91 with SMTP id 98e67ed59e1d1-3a6cec820dcmr5703730a91.38.1791185109436;
        Mon, 05 Oct 2026 00:25:09 -0700 (PDT)
X-Received: by 2002:a17:90b:1c02:b0:39e:6c68:fd91 with SMTP id 98e67ed59e1d1-3a6cec820dcmr5703702a91.38.1791185108930;
        Mon, 05 Oct 2026 00:25:08 -0700 (PDT)
Received: from hu-bkalkond-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4f3911sm9901421a91.15.2026.10.05.00.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:25:08 -0700 (PDT)
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 12:54:29 +0530
Subject: [PATCH 4/5] arm64: dts: qcom: kaanapali-mtp: Enable USB headset
 and Type-C accessory mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-kaanapali_dp-v1-4-6faeac3a6d59@oss.qualcomm.com>
References: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
In-Reply-To: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791185070; l=2189;
 i=balaji.kalkonda@oss.qualcomm.com; s=20261001; h=from:subject:message-id;
 bh=KE5lnf3g0TLSQwmbAHHp1Q6HH2MqV/4eigAvw1yDbiI=;
 b=WDezgMdLntdbfUe61kUs+X9rKFpWGi9ZUEXyrWzpbOs/TElgATyTbxOCeb1XOwJ2aXO+7gJHL
 jqCBuZoHCf9D1TYqRVSNTMbjYgeiWFX0EwK6oNCH6NopAss9yMF5hC+
X-Developer-Key: i=balaji.kalkonda@oss.qualcomm.com; a=ed25519;
 pk=U+unGox551qPLS2mzIlN+b5cHksxTMGPnDwePd6KEnI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX2jKN55inVb4S
 DRv5Ha7yiijAGf5SlOePQaHS7LcFKaNX8Hr4S7YYfyA1DW5WzprLnt4cDtcR+Xnr9dHl6V8vt+5
 0Rl9TDnHMWtWe8dK3CU5WlUNaw474sHaJPCSeBGlX9MqrtbIJfu6WCg1cNaBq2NIiiXyOsfyCcX
 tswvFKuGDFMEZVe/hM0EOCwuK64NayxIBEPF7BtWZJoXmOFkR0tuhO+epQWuXZY06/pKouvJqYk
 puYq6mkhCBaeK4KRf+aHvaRJxVAITBJbwWp2QiFtuWVdTacB2PmQ11if9jSPl/ZXANKqou2t7Ne
 jpKfMm3a53sMsH4rOgqLxw2yc+iQnIvPjFFzSDosIX34UoO5omcN/rbOYhlR0roN6Lho1Fxl/wY
 9nN35v/CVggEJ9GaSpc5b55dqVoAXs93rTp0Y7HM9Df4PoJ54VPBzkuXmjy+6Op+tlKS0ZEsHrH
 0bCX7bFGvAM09kLehKg==
X-Proofpoint-ORIG-GUID: NZCk80tsviaK5kzU4dt_OtTCM5xHBnZb
X-Proofpoint-GUID: NZCk80tsviaK5kzU4dt_OtTCM5xHBnZb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX/3J6XqQP/Wfn
 LQUHpFhZAHQW5eDcJSCis3wXVHI+FTzCEXM00fE/ew+fqtU5BVbH6oSaMglH9v0npP5ntJMMoMI
 0ofYsOhYvv78uxIUteCyA7m9dHM1dUU=
X-Authority-Analysis: v=2.4 cv=XPSl2ghE c=1 sm=1 tr=0 ts=6ac350d6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=XqinFhvkQ7oosSToCroA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050028

MTP does not have audio jack connected and relies on USB mux (WCD9395).
Add necessary nodes for proper audio headset support along with USB
Type-C accessory mode and orientation.

Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 51 ++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 9eb02fd09dab..16f4dd041649 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -200,6 +200,7 @@ port@2 {
 					reg = <2>;
 
 					pmic_glink_sbu: endpoint {
+						remote-endpoint = <&wcd_usbss_sbu_mux>;
 					};
 				};
 			};
@@ -232,6 +233,15 @@ wcd939x: audio-codec {
 		vdd-px-supply = <&vreg_l1g_1p2>;
 
 		#sound-dai-cells = <1>;
+
+		mode-switch;
+		orientation-switch;
+
+		port {
+			wcd_codec_headset_in: endpoint {
+				remote-endpoint = <&wcd_usbss_headset_out>;
+			};
+		};
 	};
 
 	wcn7850-pmu {
@@ -916,6 +926,42 @@ &gpu_zap_shader {
 	firmware-name = "qcom/kaanapali/gen80200_zap.mbn";
 };
 
+&i2c3 {
+	status = "okay";
+
+	wcd_usbss: typec-mux@e {
+		compatible = "qcom,wcd9395-usbss", "qcom,wcd9390-usbss";
+		reg = <0xe>;
+
+		vdd-supply = <&vreg_l15b_1p8>;
+		reset-gpios = <&tlmm 162 GPIO_ACTIVE_HIGH>;
+
+		mode-switch;
+		orientation-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				wcd_usbss_sbu_mux: endpoint {
+					remote-endpoint = <&pmic_glink_sbu>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				wcd_usbss_headset_out: endpoint {
+					remote-endpoint = <&wcd_codec_headset_in>;
+				};
+			};
+		};
+	};
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
 	pinctrl-names = "default";
@@ -1113,6 +1159,11 @@ &pon_resin {
 	status = "okay";
 };
 
+&qup_i2c3_data_clk {
+	/* Use internal I2C pull-up */
+	bias-pull-up = <2200>;
+};
+
 &remoteproc_adsp {
 	firmware-name = "qcom/kaanapali/adsp.mbn",
 			"qcom/kaanapali/adsp_dtb.mbn";

-- 
2.34.1

