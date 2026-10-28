Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197045;
	b=cxtx6hp60Up78n/y6b7lAgrcw8sKhi2eRViU/o2Or5eucDugD5eQe1jPfIVSn3zCkNkf
	 EqGrohZNZenYGXcgRzIcVWXQvokCHa6LHOW5asTfXI9CwJS54kJQjW6QbnGzjfu6ina55
	 wjoL30n6j0hYxIzM8dqbrX3fJm8lPeSIKeQ/uwDLPKrRAr5tJaSZq7UihK+FXVbjP2+/q
	 m3H8O9E1zwnp/bVMcHTSG0wPq+n2Mwm2W1fBYZOjMQGQNkD0qRw0mgzYa12gpL4g1K5Ac
	 2AylyMvgtXXQs6DwFZkGgUSvjEan7WPIz2y9t32CUrxNCDJrf79LvzTRtjzTNT63pzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197045;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hmWM5fppsSHiHGHFwZ1uLxSBn/TikX6J7OE7IaENfqw=;
	b=1HbQy0tMPkYsNxUBFAd0m+vZEnzeaKaorRx7VOp/k89ILk4GdGtUWjGAUAvCNZpRcP2c
	 KKKqdyyDFlve5Ldp2mvavLXeuYJyCAwB/dVmCkGwfJLbXNlTO7oQyCIy825R9SYE9rpWh
	 VWrk1DRwqiF1AmaspcfNFkQJpa6jmCZ3MNqJSmXihV4NTHuo5l/qD2q3rdR+WCY1cKptM
	 vHSFTy30XkqJsvLdI/8kOg/mmUjeeVm2I7DGFQ2EQKQDsIWNU3I6mDLAdVqeoJXU+LIqJ
	 CwCQCMC50yUcZ8K+Xk+Ck3j2yc9qooPxDNKOwqm7yz+e2jlnBz+WrMoJqKgR3mEqfFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="W+YPHLl/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RvZOYyO7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A78606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:17:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24A78606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W+YPHLl/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RvZOYyO7
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBdqTn137457
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hmWM5fppsSHiHGHFwZ1uLx
	SBn/TikX6J7OE7IaENfqw=; b=W+YPHLl/muJ3BCv6DK0hnAHAg0DwB6fW8Q4wf2
	PyGsNHLIlMON8/3r0J9Td3Jw5gErxlHnjt9aLKFquO6SbrWiisBEAJ9IJRqPjmxY
	0ei40YcAALd+MVAuQVRSfwqMkzTAWezL2kzL8yH0pwlwU8RVTrdc/wGc4RFJUfEu
	ElApk8umxbtmllxGZFV5bBQkQJlqn6HtT2bFBWWCzeOxh0C5y4k34ohQ3mCc0uI9
	Pai2dm2bvKFiWhAvNIBaBlNWhz2BRtANRwOwdcKrDWXtiEJmDElXx8yxpPG+7/0i
	ft8MGYG4iVDXZoEifdtLNGN3GCGS30erDnJPsXKGoqWkOg6g==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6f92u6a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:17:23 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-988bc0ef0easo234965241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 07:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793197042; x=1793801842; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hmWM5fppsSHiHGHFwZ1uLxSBn/TikX6J7OE7IaENfqw=;
        b=RvZOYyO7MW6X4B51RJXEWO5WEQj/TcXWJWNGRY7QLzlAYOlYptf7h08aNXVQk3qdLV
         Pkfmu/Zb7hnUEyzrkcmvnAeCWjxAGUtDQS5gxcors908WjXO7G3gOf1egelFMN6K8S/I
         qe4xQ4PAwJL2oZJU1QrloSDBLLhHKqssX7ppE20apNApx7kbCK1bzuHWtJxw0HiZP8LO
         YuzT8GbeCsynYZzYyMYbmIf7Gq4QAUzRm1MKs3PGMm4CweKBCcIsIYuKmmDl4DA1zo+U
         zyCZHegB3kay+0ZOSyrtwXk9uF88QFJyFY0KfqYX5miUXeUYPJQKv5aJfQceBkuU5NDe
         1Blg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197042; x=1793801842;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hmWM5fppsSHiHGHFwZ1uLxSBn/TikX6J7OE7IaENfqw=;
        b=kfCdDdc9pnYG0DhrbxCTcmaH/OhvhKfI3/AJVbKXEBoK0KX0+YXWfpGvG1GRFwheSZ
         5lHCdhA2y4zCGGa2/sZXrxPARLaI6zE6MzAvIYSOLyaZkNz4bTyUXiIEi9zBMnPOwzMf
         s1tEH+sAfMkKYmUSfVWhCrYm/L+t0IJXd++3gJ24ft8SCbatearv+y2HOtp8nzWJmKAQ
         x0H35otRY+TikUfcWeUyZVDKxWb5ieZz8ulQjL5F/3ELYnN+5KhtnU0TmqaS2oRNUtan
         3CEuViVuiGseTkb0BzbiVqM/XYHrw0s8gjgC1ldS6nbbI+4JHwgErGuYN3c3K16mK+Ph
         jINQ==
X-Gm-Message-State: AFq9FYKtDMxN9bnpNJNPPCW8JKptQ+/AuZh/rdVkKFkBR0ljKYKJR0xI
	0rFGoGMRAJI5AZlWR4FhBDRX/31xScdM7ILnMzUxka7SMTaRpc8pXMjv9/Dx2CD1y4yZUifd+Ab
	uG7vTAHd5JMA+0QIi/7UW6MR0FAfGCMSSrYdK4zRjFjv7foW5butPp3XdRFKu21h/cY8i
X-Gm-Gg: AYBFou12lmQz2WpLhoFMwnMEgcAP+fI716s5k33wyRBDMX3q2UKDiIrdPLGsdPu+4AY
	ltoeLn1Dfo1XdYjD4y3WqmMfR0ULYhPoJ4i47YsC53LLFBpcSiBtP2/zzjUM26eAeNgIPPuY738
	sWVSPVA3to+pPGGcZodtUYZdXq/S14A4Si7/w/q8iG7hSZufRrD49HGTEQJT8jAHfHEMwHDOUfR
	InHSIQKU8yVl+zmDbyNRP61vLECNbb0tpiO5igQ7qErWWk+Oa19cNHkSqZDCYxrCfWVPsTks2TU
	0VBIS3a3gPtCCk5awp7TmjnBgc6p7illOWYulfoV0sIWCeFFy9wGjZDk/aySFf9Fuc3XbQpsR8c
	24PaCzxgQauB9kWSM882MQdlgmkhUDGIkkT9zA7yrO10Vyn+wCsd0rzazObnCM951NDDbQ6inzh
	B6zYiYpSmP7LXNF84dGv27CAaz2iJctJT8TNFLdciJgDc1dVO74f5woIRdymHK3XW2PQBZoFX1M
	kseFf+p18stnTdea1grIINX0kau
X-Received: by 2002:a05:6122:1c03:b0:5ea:d14a:ef8f with SMTP id 71dfb90a1353d-5ec4cc14f21mr1095741e0c.4.1793197041977;
        Wed, 28 Oct 2026 07:17:21 -0700 (PDT)
X-Received: by 2002:a05:6122:1c03:b0:5ea:d14a:ef8f with SMTP id 71dfb90a1353d-5ec4cc14f21mr1095688e0c.4.1793197041412;
        Wed, 28 Oct 2026 07:17:21 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:9d77:8e43:b62f:d85d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8dcfsm28463589f8f.50.2026.10.28.07.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:17:20 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:17:18 +0100
Subject: [PATCH] arm64: dts: qcom: monaco-monza-som: Add ADC thermal
 channels
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
Message-Id: <20261028-monza-therm-v1-1-dfe4759c15bd@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAO0D4moC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyML3dz8vKpE3ZKM1KJcXROTtKTUNBOjNAvLJCWgjoKi1LTMCrBp0bG
 1tQDPM7VuXQAAAA==
X-Change-ID: 20261028-monza-therm-44fbef42f89b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=frhJ914f c=1 sm=1 tr=0 ts=6ae203f3 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=gjCkitBQ8UzLeNF7HDgA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1NiBTYWx0ZWRfXxXydsNfFmpKT
 tls+q1KuSCW8XsgNNMBSdaEI4ns0uZM3rQC9XFjjRuI2opo/axXyiUcMCRHAHq8AYXY25KeaSfz
 iiTjPXDZmYU5oPA2gyuw2aiH/POujAs=
X-Proofpoint-GUID: 6j_NbFITp0cFQ1kKg2bbmyKtpWKnsEBc
X-Proofpoint-ORIG-GUID: 6j_NbFITp0cFQ1kKg2bbmyKtpWKnsEBc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1NiBTYWx0ZWRfX+yiw347NhFnC
 NC1I/tU/8x8Ihhg1rTzljHnt7lYRtmE6PY+9AXY7wTRRGvAGhFddKgva/JDfMCpNeUOqgSFwH57
 sGdyop0ml1gPExjWZk1+Dg3uXrooWZIT41EVnujO9B451ncBJjZdLG/HB/nf5O/l77y8vlCiewV
 1RbrnhpzlBJRrS2vMDJnNGvfQQ6jh3WYw7P9kpdBohAXBgKM/s3HFx3iWs4ChmnoMeEdglzVB+1
 cwbARJnuW0Pk7jf2/mPqG0X1dpsBZKiaIfRZpvDppjM0d3LF+Ig44p0/it4l+FOhWDEuTV72jGe
 r3qZ7oxExkAqrZR24AdihWthFYU2P1ZPJNR1fBnftMDALoog9FFAHoekaX64rm+AmP06CV/Nq8e
 0wzacZQCiocwkt+57awqQyIcWOd4Pj/bBzsrFY/s+y+uJBEnLmYV9/WAVlm3sdd9tqSrqRA6+KN
 j5s6nvskYQvNps1ckNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280056

Add ADC5 GEN3 thermistor channels to pmm8620au_0 and pmm8650au_1 ADC
nodes for thermal monitoring on the Monaco Monza SoM:

- pmm8620au_0: XO, UFS/eMMC, and SoC thermistors (AMUX1, AMUX5, AMUX6)
- pmm8650au_1: SDRAM thermistor (AMUX6)

All channels use 100K pull-up.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi | 40 ++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
index 36af1ad2105d5b3e5674fa59f5648c77ccfe7d11..dc2ef7e5b061354eca4e4fee90906e205ccac1a4 100644
--- a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
@@ -227,6 +227,46 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&pmm8620au_0_adc {
+	channel@44 {
+		reg = <ADC5_GEN3_AMUX1_THM_100K_PU(0)>;
+		label = "pmm8620au_0_xo_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	channel@48 {
+		reg = <ADC5_GEN3_AMUX5_THM_100K_PU(0)>;
+		label = "pmm8620au_0_ufs_emmc_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	channel@49 {
+		reg = <ADC5_GEN3_AMUX6_THM_100K_PU(0)>;
+		label = "pmm8620au_0_soc_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+};
+
+&pmm8650au_1_adc {
+	channel@249 {
+		reg = <ADC5_GEN3_AMUX6_THM_100K_PU(2)>;
+		label = "pmm8620au_1_sdram_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+};
+
 &qupv3_id_0 {
 	firmware-name = "qcom/qcs8300/qupv3fw.elf";
 

---
base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
change-id: 20261028-monza-therm-44fbef42f89b

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

