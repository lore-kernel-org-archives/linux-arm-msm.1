Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793456720;
	b=ZkyhGAPrm+PJ3gV1/QJuJdDZj8ZSw4RIh59OX3i8B1SKzXfNLK8di8REcmFXteY5D1p8
	 UT3nn8RmGptv4rozq7Shr1GWncx3COfce9VdHq2uRYmNKFI/M9/vnQcQjXNI3ccGegL8Q
	 jwGrCkAAGsDC43zn46wdS5jD+eDwoLd4uT0Lq2732bDgU+QnPL9TuUHcGR6A7dlJPKspA
	 DsdWS+SLZ4f5cm0IuCHvKIBP4Vhc05esKGX8GNV+gLlBD1CjF1148W5R5RtCtOzouhW20
	 zo4uew/Qznk3EPCnKkVvgdE0C92WH5n1R1izrbxg1dtLcEXeZPe30UeWTFYQX3Kg0Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793456720;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MTyYKP8mHadFxUXAd7WDw023+DtOM+dMa5aDUPeX23w=;
	b=qiTd69OF63Wv+VZCtMQNKiZUGA7xEI35/3ArzfJWc+IqtkcoFmtSNT+KUY8S63KNRvpz
	 BtmFpNn9YMUs/fACUtodJrqG0hdmVD4jyAyMeezbLe+GCyx/UtDBY4oi2tJavzkiS4aYg
	 STrRUCcI9gpo7GU8VYCYJy5qfoYhz+c3GwkTiORnbPENXR+VK8j95OtxKR0HFr/uZ1vN2
	 3G+Yw2kHZHjSk5iXMFX0olcDkAvXMFFXl7xK51Q9U6s2DpAEt2uBCaxPW1tLUTiDT6eT+
	 JG5T2mgNdxermjBnJYG56W33M8/eX6m+KvOpA68RGpF2SG316eNjZLRKjPqPr+RMPmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cQctlWWM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I7rf7ITD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8CB606A32A
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 14:25:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE8CB606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cQctlWWM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I7rf7ITD
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD0Dev2162364
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 14:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MTyYKP8mHad
	FxUXAd7WDw023+DtOM+dMa5aDUPeX23w=; b=cQctlWWM+R0ZNR8c30zj3PtiggE
	LRH/8C6QkvJC381qRWRhVzuwnTEB9TC4pM+7eUHBJiMxIbaYJCmFo3ZVhRlQH28f
	BWcW+QLFxxSeLkU0DBkHP0TFXWawYWlBYW3adl6zfYMHTLr7p/VP3IclJv4vq/11
	YFZMve1XBx8/l9or/V6Sbv/gCs2AuTPx8/pkCOO7Dq07xH7+ZEYzv9/kiTtGiNko
	/mRMh+UB709DXMudDfEJjv9k+BxDoruxfME9tuCk6IRFeia1+AQiqf7s8ONjue40
	RuDb4hRUEGWwHqwsq6SK2zqNpMpSBXRUt2ObPpSP/jYWNRCQwpMie2vnctw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8j2sa84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 14:25:18 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3552883bd19so7057093eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 07:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793456718; x=1794061518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MTyYKP8mHadFxUXAd7WDw023+DtOM+dMa5aDUPeX23w=;
        b=I7rf7ITDC2rWfESHASUOQMFZIpCJ2g1khqyhhVNDE8PgcyAEDyRFQrdrAQxiQKDCE8
         /ZBxsb7hhDE5cwYzDmFiEPBdRrQ/oaSyJ2pFgC4D4qRz/IxxLbK/z13zaykuISTffXSE
         sh7LtiCPDVarxWlTkvPRrSpC4t+Z7OkF2YbTP24i1iGhrN6X1C9+LmEVDZbFG427xbqA
         /iUUxPuBH+BZp4YF8le+npwFJXqm/BoeQPvNzgc4fqRkmbAyhWdMrizcbLYLiKtmJOgp
         r6MNR9XWJVOpWEU2+odQ571wKXH2oICfScvTK0vAlcKm7XQZmPB3VClH3WOrj0s9lcPW
         SCMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793456718; x=1794061518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MTyYKP8mHadFxUXAd7WDw023+DtOM+dMa5aDUPeX23w=;
        b=mzSono9GBvu5/6U0x5GepFWL1PyZOozFRb4XI6zRSyJpzmATPivnIW0bCZxtRtzNya
         dO6Ikr0xrX5kVpGa1rBTsvGdpKQASCl5geu/kF+/gYWTK28ORmMCxUE6uKl6so/+fUXv
         8RL1UTK41MXt8UpOlSEhbfOxrXRUgxE0C/JLOGSDBzWwRXj3ZR0bMnebfaoPqegg2TSv
         UCdXy1DoyyIWSJSVSEkYs0PSQ0v40XPtfchV4FayuDyUipgIaKPEgM0kSxsgL79KaT78
         qnQi8We4aDMYK2L5jh/0YaZ+KUaVl8q1hizoM1ateIntmwQwDhI8zmicQm44DJWn5oJI
         n7Eg==
X-Forwarded-Encrypted: i=1; AKwUvBxphDfu+xtPNE5ypsdLbNs7O/NMQ4iXuBoJcPqX9Pp0qQecPLPrmq4xjHIh8a4UyTIe84iqk9ntKeR0Pa4i@vger.kernel.org
X-Gm-Message-State: AFq9FYKgl8eMTbCWavwePeseoUQOKb0YmzgB4tpPdp52oe/pj2pQ9Ycq
	+vDgqojBJ2htQnPYqO0rGT5Y3T9iVJYnHDUeNLUrDRJcZ9+0dc7OgQIdpWHBh6YmeAJMnXKKnQj
	o18vKoWCFePFf6U8ybhQOZCdn+Lo0bUE3G0IuJC01wCoeVdG3N6oAsJHbh9TtSD8X6pR+
X-Gm-Gg: AYBFou3LCqshBudS2ZQl17gl3fnYvkbcb6b66ppM1orDv2byzLE+89A/clEE3AqmJxO
	IhmqSiWprArMr0qdD4PDHnGX67Qwt8Ihjy+f+jgm8qDoaBiWsON4McThhz89b0Q3p4y8FTGd4f0
	c3Hf2idVtNr7Gtulm7dDSOMmyh1LnztI8+/U1+rCE7EsipKiEwzhxVjdidcJLAXXfmdFy9ma7je
	UDGHFfP4CziXec0svaTBjPTnUmio5ZhWBKFh6x/ALN3Inxgko2xOfrsppGOE3GbUvulyV+M1ujE
	lFDG0D/mR+vIrCJ9OAY35FB8ttpbgSrA2sVeswlxRDw8vbcmNZMOIigbR7uehzZ+unmxlP9FElF
	YZmPfLiv/p9tnEhp3l2qlR0ozyHMECNVVep8pD5BnTgwYkqfz97LljUdpKBr9lML3FmnbgSikeR
	ugDfS/jNPUirIz7Z/u8GLKx9ff6YAd1ZUF
X-Received: by 2002:a05:693c:41dc:10b0:351:2958:1740 with SMTP id 5a478bee46e88-36a42445a8amr7876842eec.37.1793456718128;
        Sat, 31 Oct 2026 07:25:18 -0700 (PDT)
X-Received: by 2002:a05:693c:41dc:10b0:351:2958:1740 with SMTP id 5a478bee46e88-36a42445a8amr7876797eec.37.1793456717409;
        Sat, 31 Oct 2026 07:25:17 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm24968586eec.16.2026.10.31.07.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 07:25:17 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v4 5/7] arm64: dts: qcom: nord-ride-embedded: Add WCN7850 Bluetooth support
Date: Sat, 31 Oct 2026 22:24:31 +0800
Message-ID: <20261031142433.1212809-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com>
References: <20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-GUID: VVchK_MT_k54W_aoHDCQKnRSkRs767_m
X-Proofpoint-ORIG-GUID: VVchK_MT_k54W_aoHDCQKnRSkRs767_m
X-Authority-Analysis: v=2.4 cv=S5RMU4sP c=1 sm=1 tr=0 ts=6ae5fa4e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=zbc3kRkrEr7k9oJ_x3gA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1NyBTYWx0ZWRfX3p/RjBvrOX/X
 fgZc2jPcJ7cn3cDy8KbR2hdRJ+PQPqpuFi5tLG8IDi2mRshKmCdVeqm5Wc6oYpKjIgmpZbxH/gY
 8rvNeHNNoxgeMHCcSOrARFq4H8FbLys=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1NyBTYWx0ZWRfX0vYxJLm/xnkP
 3su5/AP/oC4YLrGlu0seW2SD81n8HWZCRMLoKIl1FFFNtcvdpi1QdacNKE30co/JIVEOzYiCNz9
 l8qtH6p12RoF5V2r1fX8P4U7xqEnukQMk576ZADOf04DDuRmUmXKjMACctz+Jne0GTjc8R7MKPH
 a4N6Z8LXaDoLlwWJudc+K+5t9O4AokrRjH+2h9LZheOTZrG1AGguqfSNqvnN/xhc4fMFVdOgOhm
 Zcinq9Wrj0yF7OYQICZCo8r5buhvi+KzHJXCdTr2lKyWYHEUuBnf1AHwaTrR9EaMgBS2oTEUzyp
 ryWJY92rkpqnrpE3iINce2h+1eBTtS58CCKyCM6uBxNydpYWWMtnadZ7ESAMJylbs6/BtUccEjs
 JJNzQX6SucJjHuFBv7ErMxre3TWTIW3LX1y+PVmkPdFdIXAbpfQ/zlYJzGh8xQsjlNZwGFwfomT
 PqZZdJ58LFuJSQ5CYgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310057

From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>

The WCN7850 module on the connectivity adapter card exposes its HCI
interface on UART17, and BT_EN is routed to pmau0102_e GPIO9.

Hook that GPIO up to the WCN7850 PMU, enable uart17 as serial1, and
describe the Bluetooth controller consuming the PMU outputs.

Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../boot/dts/qcom/nord-ride-embedded.dts      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index a9adbbd75878..3f764069bf1b 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -18,6 +18,7 @@ / {
 
 	aliases {
 		serial0 = &uart15;
+		serial1 = &uart17;
 	};
 
 	chosen {
@@ -102,6 +103,7 @@ vreg_wcn_core_vh_1p95: regulator-wcn-core-vh-1p95 {
 	wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
+		bt-enable-gpios = <&pmau0102_e_gpios 9 GPIO_ACTIVE_HIGH>;
 		wlan-enable-gpios = <&pmau0102_e_gpios 10 GPIO_ACTIVE_HIGH>;
 
 		vdd-supply = <&vreg_wcn_3p3>;
@@ -583,6 +585,23 @@ &uart15 {
 	status = "okay";
 };
 
+&uart17 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn7850-bt";
+		max-speed = <3200000>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+	};
+};
+
 &ufs_mem_hc {
 	reset-gpios = <&tlmm 181 GPIO_ACTIVE_LOW>;
 
-- 
2.43.0

