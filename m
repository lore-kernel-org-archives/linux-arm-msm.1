Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467334;
	b=Cj2CO/Yw9b4NHgsJDYgJX2MQU7D/vnpVJmJ3KrvawD3DDWmwucC53eCll85ot2iMMsrN
	 d9HM8eS5kP30dohMqgJJlN9vKPGmBoNgCJ5nZqzC1eFTjseKDnojmMXXdYfaEIEQfXQjB
	 K7ucAWqPDZ8Ixm6mgbekS4B/2LZRAxoz4HXpIE8FGKJC9m4ZO8NgUVpwU4n7W1jSEpgdQ
	 89RWzo45E5ac5SLmElE+SZJ3O+/gJF8f/kpr78VB36d7V/i3siRM64wnmAZe2K1LoJyER
	 Bpco+FA4/JHzJ3nevYbtY8FnwO+xMbN0qeMxuO8uaRELy2ly/+Okuo1hD6vQYRDP9LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467334;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FO787i0Up1CrINCS8JgLRJq4h0SoHPvJ6lnWJKpDTG4=;
	b=IkEIYquo1USRbb+ZmeV4SplB8aE0/QklSsSnLJCvjA0IE8DAtTwUK8ztylIYuGB+a9eR
	 BYoPpPqdSxPynzC9sA9In6xG4IwZQl4zcNLnqG2urffNwWKwFgJAPwUcSIt+QoApDKnEF
	 GdrtFvVs6cVYOwU44OC7C3oCXPfhCgN2i3VEZ4KNaL3mVDhDPqUYVo8ge+wEu2zSYFLqU
	 8yoJXSSOne8tB7Caph/GRobgjKYPDB1iF5SqFwSHb4At/Frj4JxUrQtgVC2jNPdHHb5Uu
	 luRPn2O79HQsW6Q/m7JHQmKpXhopzNObHElFQldmHgTQVvOu5tOKG988mt1ouS0M4Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mXyHqxhy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e9oX+f0K;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEE2606A32D
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 20:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADEE2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mXyHqxhy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e9oX+f0K
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuRia720763
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 20:55:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FO787i0Up1CrINCS8JgLRJq4h0SoHPvJ6lnWJKpDTG4=; b=mXyHqxhykrXmbbOB
	c+/PPeNUMQG2nQEliqU0Pnu5RqWuUV94jqtt3QfWwnKXO/dpntDJd7krxOIRl6Nh
	z9qYu1Zxp0ywgewuQIWQA5F0C6c9D/aBiXmCU8u3QvR/8tXJaS00lJuMcuFarAw4
	kKv068ordsY4dJRw3ydqEUoYP9O0JhINf2dFmLwJ4DL/TCztXZsfknmW3zRM7ohY
	hfLxi19sVWdTbAiLkXDLvcgrvbQcHxlJVxgCJxIXLaZJ7cAF/rVc1f5Kc0F/s8qT
	zj2Qd9keuj4zjF7jmthhhtVeQLLLhFGE3srkWF1jVwidaw9DOgoMnoq9PQzUx3d/
	WAYhTw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqgahk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 20:55:32 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386b8624cf7so2116618eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 12:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467331; x=1796072131; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FO787i0Up1CrINCS8JgLRJq4h0SoHPvJ6lnWJKpDTG4=;
        b=e9oX+f0K6GARL+y/KJUJ7t0atx3e5EJzbfrPbcOmE16DCKEsrRnBGEjeBP6eQVyyFc
         6H1QMLDxiK1m4Xu6CqI4tucUteyCeKn4Liy/vWeDc1Ec4rd1hMBHfQFpA7EqDAIe7dRT
         XJZY3/Ixqb6d9xnZcdtz9ZVaM3OlNS1POL+Oq9EHsdOBHhBRnIWUH6pAhzigKJ41XzUz
         9o9OvtijVUtFSVK9zA6S3iOnreTlIy8tS8nnGSRsVrlrZ0B6f4fXrOysyDyJn6P23jue
         lBGGEdMCCWNZ7gzBShTLwsjRme5opVzEJGOFdxsR2vNGC42txhY8bGsXbTPUy36jBsiu
         gd9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467331; x=1796072131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FO787i0Up1CrINCS8JgLRJq4h0SoHPvJ6lnWJKpDTG4=;
        b=Sa5tPLD7OeEny4fD1260d3pojsBRFjB6acSUwqhbdXyZK5g3c+SM57+1BWTF9DodMy
         elhYbXJBM9uWV6Yd1nY0HJKjsDXtuRjo1iFCBgzsxpNOOpMoEjRfjixRPNSLQ9rFY36a
         ix+1yFR/EEUQNiLit/SgWTQVNewru4bRhADRZZDqzM6OX82i82QWOD7ezOLpmKi3bCdo
         gxoStTp4ull02o8qw+GQiK9m2PiSaP8AB4+jKwGyekU11t66saaYH3O3CAZVzWTs5uwJ
         Mw7G1c6LmR3X6B7Icd4AV7k7K2H5BojIsgvND9dRR2/yPcPCrNRKJ80AsNJPOhzD8evE
         /V+w==
X-Forwarded-Encrypted: i=1; AL+hErGcUxUPVCjc4+5EFuW4IwMMFQnWsbxC2czFyXZjBpGL+iZJTsepKrMnUI4X5ep+CVgQ1UBHlx5FntVoX0wM@vger.kernel.org
X-Gm-Message-State: APuU4Z/1mDT+8CtiMRbpsQbqIQVrR4T1Ve6n+9XNFx8MocoDKAMjggbm
	5VOBR918+DknLfYv/hfNwA6zLQWF2GTkCA3t+C+y2tl3boTUbUSslOd3BlpMZ0qGbSMzstKQtaN
	vdMzHD7MFQ87F9FV2cxwQ/yPCRqG6jR7KfNbe28zcrNPDUiGRhOWMGY5Bl1A7Tdq4MN6t
X-Gm-Gg: AZFdTZevPyf0zusJi36YCAnbIZz+UIT8qqs5dWMWQ4746YfwFW6imCEselOuvlRnL5D
	vLiAY/292uszH4YrzGCyNuyEXin8/l7cUEhb+HxamIcYN84V8Ujaf7zTI7V0esRNRVuwng/QfR9
	Hj//Q8MrU0O2225ID2kXNHwUOKbljmW9uBHB00ZBE63rk2r8QF8KWKFC60ALOqFxsx0MVYgFPrM
	Qp6fz3WNba2HPYxu8K4kfMEo3X22iekgzzKkzsfdow3PS7D1HucNTiAQlshnVMiriR9VM6ITjvQ
	gwo2a5W0pYTgyPUCn5A5MaKaSoHZebCg/HgGLwTxDWL3lf9eyp5XD61wq7fcL04F+CU9cTNNh90
	erVW6wCt89gBkxT+ZbA9uPWYcDgrOO9r6CxX3jCbiC08VyhZX0icNK7IPBzWNofgtZSpY+CddEE
	kIzUGEYDZG
X-Received: by 2002:a05:693c:894c:20b0:386:b566:85e with SMTP id 5a478bee46e88-386b5660d73mr3295203eec.16.1795467331482;
        Mon, 23 Nov 2026 12:55:31 -0800 (PST)
X-Received: by 2002:a05:693c:894c:20b0:386:b566:85e with SMTP id 5a478bee46e88-386b5660d73mr3295136eec.16.1795467330810;
        Mon, 23 Nov 2026 12:55:30 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:55:30 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:44 +0530
Subject: [PATCH v5 04/12] arm64: dts: qcom: pm7250b: Enable BCL sensor node
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-4-747d5383d538@oss.qualcomm.com>
References: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, linux-doc@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1257;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=4feVVnMM5ALc3+0FOkCxSTWjH8p033HoHYKJfJ9BPqE=;
 b=U4gJSJ7RC2dXsz6wOxP8adtXjI+Uqf0pB3DmbJF/K6HNUSlGrMCcyr1V+JIqX1azpuLpHkx59
 yfo5aLfJyi4D0Y66+UF37R5KpgJJGDmdkn41LputUlQxvgdm38TPc3X
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b04a844 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=8YuGtcdev8JQwI9EQfsA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX9lZpi+tVR/Gp
 jyGOQfhqMdkgnPhsIG1tLhJ77SZCX4uHO2R6OG5h4DbokWD1j8SjokabIolHGm+G0gVHa3xoowB
 /CNDQt1aye9MfRFhaaBQNiTEJWDmTbDp2ijMlKmtlzIP11ibCxh50vqZkQSzj8C81ggD+K4VDIf
 eTxphVB7oZ4wprBb7l207NiS2ixoMjgEIY8WivKvpD3t6/+Ig5zXO/Imnfim27Ja8+GCDcE5tGS
 Zs4PcQAvAydHsg663Lp7fHF1SBnRpAVsleBPt4eU/Ly6W83fYChV1hnsj/T7L+/BVS6g92v6KLT
 XANWYvA7R7GcvKqTyC0d+xTcV6bfgXHBxeBH5G4gAuuPcoWmiBGC12QqlVQDZSgDG+TeziFNnVR
 QFb+wJr3HYJxhWeGU4nOnpzxFsq+taLhRlHGDRvXqBvmhVbnYuGbM8jZS01kuGYpbLvdOJGaB9C
 Y/GwQ3DH4eQ390DesUQ==
X-Proofpoint-GUID: LaaQadjzqPDAuHOTTc7c3332voNUu9Va
X-Proofpoint-ORIG-GUID: LaaQadjzqPDAuHOTTc7c3332voNUu9Va
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX0tdnFAYI88gN
 JYWXNeXCed3WXRVks2O6dKRCfTspPpAKP+LPt7gIkJER1YwRJ8Xe3gQ6AA2o9XY3VqcfxC5kaM+
 4X59sCjmEEvjduqdD+XjGSpEv4h7Lhg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for pm7250b
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm7250b.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
index 43cab07126c5..76d0481914e4 100644
--- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
@@ -89,6 +89,17 @@ pm7250b_typec: typec@1500 {
 			status = "disabled";
 		};
 
+		sensor@1d00 {
+			compatible = "qcom,pm7250b-bcl";
+			reg = <0x1d00>;
+			interrupts = <PM7250B_SID 0x1d 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x1d 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x1d 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm7250b_temp: temp-alarm@2400 {
 			compatible = "qcom,spmi-temp-alarm";
 			reg = <0x2400>;

-- 
2.43.0

