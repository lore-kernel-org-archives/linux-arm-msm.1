Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792568239;
	b=eVyQeBnuqdusbYPGj01Iy7npfZSKRKFTgUkmB+fGkmbelOgT99Ydp3Fde/xLz5zQHOrZ
	 EryP9K/04vwfraprihsp1V5LhM6QPxgLFD9B6VZrVZ9PrYeH6YYh+wGubrG/6Vc5oYeyP
	 OgAcFeV6w4yKXKvGkLMd7tYWaSyR4P2dfvDwqVgu40KFWQxVFxdxt0a788dP56f3wCdCp
	 WC/YsV/2vzwbvo6xHJRby97revjht7KUKjIPLhLMskn8mseOQIkqB0ghyGq7Kyd5CQO5W
	 Vdu5hty2Z6iNMH47v654cWU6frRcgWH1ZeeY9FbZQqqSgk2UxVkZ29dPHhaqjOMWl9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792568239;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uwH2pVPBDysEODZXow5z4uFxGrDDzR8wurpmj2XayHo=;
	b=gId4oee+pNRGe9pBqmvfjv0fuIRJfFrxYRLT01YjKxaaL0+O4RsnS8OgvKrgAzIfHpHz
	 QiZOfyX/kF7IIhgTxRsacLsYxDJYu16vYrMzXOBHsYHrJAPJvrTXDH+Q7KKtTaaxVqTap
	 dVyTVA9My6A+IsttGuNkzJDjRl70gbzNiTek7ylrZmIUeLIrXogFfppwI87oe9ZY+QKqk
	 FywhhxgNOmIbvR1PEuG8d9pl4ISlJ+lKJI8iuMX6P20Zi5sgYOQbLx/hEgiW6hX7ric24
	 LULEN5+fXVMGRJ2HegkKfkaqCB9QXnfsIjSUDcsuUQmwj3ffwTy6B+GWzX/owRZDEcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PxD1DPhM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ANW6tXRo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F90460A2601
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:37:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F90460A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PxD1DPhM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ANW6tXRo
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L7IkP7458611
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:37:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uwH2pVPBDys
	EODZXow5z4uFxGrDDzR8wurpmj2XayHo=; b=PxD1DPhMSeiJAPGYbEbT3oOM6fF
	wtUZNwJ/19Qtu8x3dczF8f+rWvX0WYywyQPhILSR1vfG7Ei8svcK+HYSylq2fJ83
	g1ZUk1H36qgEM9qRv8w+e293rM+6HbZVNEQTLbcR5cOivC6JC8Vq2ZIGVODlICEp
	Qax+69nYliEqEwR7D2k7UAFEuVm93WbShzZfBK4gJcvyIck87VjzAtXskrauKHrE
	6zd5hwDjH3GUxDKl4TJV/FmdBApH7KYV9RpUqfON3d+n/PprL1ts7KryqScAXlid
	CswFdN16/cpH0Q145jj1APJHiTPWdtO50P9egBMSUyzR3V/jgCiuSpsxfqw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajjkeu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:37:17 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so1113436eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 00:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792568237; x=1793173037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uwH2pVPBDysEODZXow5z4uFxGrDDzR8wurpmj2XayHo=;
        b=ANW6tXRozraCJt0XY8SZtRoBrKUvoFtcwlk4qWHXyTf3u47eyIwDVoldg3Ueegzglp
         ZOHmLVpIx3F6sB9YvMfiSfg4BhTAezSwdHakKHaDcrjQQPu7UTLkiqGGZ0frCV6gJPq6
         TRih2BmXeXSme+5t/t8LcN5w+GxRUThJb2DnlHVG4ZFC+tT+BKsOpFJGZknTuVhq7kE0
         C76CgltP25LhNvp8/S+nkMQFNGw4pp8i3bw33tzeq7EXkA6h/oRAkGqe4QF1Joo9l9pj
         ftGn6wpASMDp1RF5aup80wwC5AfXSw3bJEZvose13qOS2YXnCqNRzEdaMjsOBXHIfjS1
         cNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792568237; x=1793173037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uwH2pVPBDysEODZXow5z4uFxGrDDzR8wurpmj2XayHo=;
        b=Goa0n9pahkOOzpIBYQiqm3OWd1dtX0Sf/VwDgOUbaVVFMayOAv+8C245VzipDSnI4K
         Z2X1l4KgQWvxrB4UR1AEYn09DJ52hZsgDpOzYNTY0Aryno5UIm2EakN6EfaVNT49gJNZ
         O8uW3AQZLdLmHv7HBexA41CzHLO1WdfdqCQcRp9CE8aNkec/CkirvASjmN19N1+K32D8
         GLeVBVRb9ImpmnNR0QEhIYxW4jdgVbDlUZOhuD3IBv1vyuYfvQhHdUof6nl6PNHP8Nka
         iBMpPCf/mbrXq4dZ8QEUsYXmNGtG3kxpiefKjWClBfqXUcC8h7Xx8dROotMOR3SYUb2/
         8wCA==
X-Forwarded-Encrypted: i=1; AKwUvByyyiVACzZ6EA3791jseBaU/R0yYecsyra7kGhihTZkABG/k1BzAKTt91AzbcVZpn8KHMlcZ0tKxvN1SIXL@vger.kernel.org
X-Gm-Message-State: AFq9FYLXxP/weqBdoeA9/zIO+mRAJUwcPSMHE37JPgeuU8zcKsh+hYNU
	C8dEdbssMIfiErxnZD4b00WHAKWXs+mkyhYTJvEMvEM4XxJIQB0qFAdCNHhIhWp3D1r2QNKD6IW
	qKgUbd0P9V1b+OkjqGR8llMmfmVXpc2gSCIXs2lMlpSFLFt2Zk/pqEpppLej1Kas59iuN
X-Gm-Gg: AYBFou2BAoDlCWXTwP81Z8F/CiqLPM+bt8OgwKZojrwlM1k2iBGxXUaModgErzCTH6N
	m32/G/E1Tp3PkxKjzN0s3JJqwkInePkfI4/ZEVUMDPk81Tj550GtYro6GxSKeOX8MWnJbM6q5Dj
	X+/0vgfvsKwce/IWllEbydDuSgRaK1FhhLbKhSp7ieYfO2nkhVaSFs3fKOp+JKwCbzq9dEQgJWT
	dt3Em6Z0CRAdl5cNoTfRiuj4kDTukurw0pOR/Goo0lRWYHd8jGEN/cnVAQDdJ11bM8sj2cmECo+
	9izWFQ4KdxmX/DAV+ToMbS5UAKOnP8XpmaUsj2HopGOgkrZ65PLdr8Kn6ySYgbqXSkvh43xbwUs
	AXd0nNO/JLW61FFaQeitxkvR8X/dwQGdI2dvqnyeSAXHiR2BGR1auyClFCoI=
X-Received: by 2002:a05:7022:6294:b0:144:f096:4dda with SMTP id a92af1059eb24-190a83cdc35mr2475310c88.43.1792568236518;
        Wed, 21 Oct 2026 00:37:16 -0700 (PDT)
X-Received: by 2002:a05:7022:6294:b0:144:f096:4dda with SMTP id a92af1059eb24-190a83cdc35mr2475263c88.43.1792568235923;
        Wed, 21 Oct 2026 00:37:15 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d0a1sm4042471c88.14.2026.10.21.00.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 00:37:15 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v2 2/5] arm64: dts: qcom: nord: Add gpr node
Date: Wed, 21 Oct 2026 15:36:30 +0800
Message-ID: <20261021073633.2163128-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
References: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfX3Z3r6h2wcQKu
 8NE+09HEzn/9fPR+09DAwHyO7YhrrmwfFLhhSo+kPhRwQpACIY0nPWhiayJsDH9B/UE+nPBb/V3
 7VUnkFdMykVYTNT2SBP0kwlkXm+m46oR2rIHZSXn68O3/3PAFztP4y0/NkT0DFMSN8LjwlYPG6I
 PuXUHy4U+9kYiq52O/CPvQS2wUOycz0SZFYVTxAululBz2jgX0SoH3JClnJolfUrYYFsPbbz0BK
 fCWgOIbZxekwU4hYlX6Xf80KKRQFad7tognNSmRYA+nue2nCIoETZjyPogx1dw9c4xajwG7s/bl
 qIgTMrjuEQaTgOFSojnfoqHLNoEFL53EC66ovDReiKuwq7pyH6/7XLiM4FyXA7cYZTy+zR4ftJG
 lhH975vuMkryBgblP13fPkigCc2bIU/mBvYVX22p8RtZ8iwPa32ZGctaQOZyTcmhxwq6pT/rXKV
 T66eoLIfjw6qUD+mTKg==
X-Proofpoint-GUID: fpY9HLDASFlz8ka0i7N7qloXcVfs1MMP
X-Proofpoint-ORIG-GUID: fpY9HLDASFlz8ka0i7N7qloXcVfs1MMP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfX3b2ohHJG5980
 1HvN1T0saEpDZ2sCeYl1QtvWkSqp8ErV8fqy1KtNVifWlGyO/9yjWBAuYQWOp1onrHhQ297slQr
 Ze/aeNULsnlh6XJhwg9innSYoGx6X0c=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad86bad cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=LQeRsTducJ9VbTWhBPQA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210030

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Add the GPR (Generic Packet Router) node to the nord SoC DTSI along
with the APM (Audio Process Manager) and PRM (Proxy Resource Manager)
audio services. These nodes are required by the Q6APM audio stack to
route audio packets between the application processor and the DSP.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 40 ++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index dfbbaf94a7ae..b54789f91265 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 
 #include "nord-ipcc.h"
 
@@ -1732,6 +1733,45 @@ compute-cb@6 {
 						dma-coherent;
 					};
 				};
+
+				gpr {
+					compatible = "qcom,gpr";
+					qcom,glink-channels = "adsp_apps";
+					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+					qcom,intents = <512 20>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					q6apm: service@1 {
+						compatible = "qcom,q6apm";
+						reg = <GPR_APM_MODULE_IID>;
+						#sound-dai-cells = <0>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6apmbedai: bedais {
+							compatible = "qcom,q6apm-lpass-dais";
+							#sound-dai-cells = <1>;
+						};
+
+						q6apmdai: dais {
+							compatible = "qcom,q6apm-dais";
+							iommus = <&apps_smmu_0 0x09e1 0x0400>;
+						};
+					};
+
+					q6prm: service@2 {
+						compatible = "qcom,q6prm";
+						reg = <GPR_PRM_MODULE_IID>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6prmcc: clock-controller {
+							compatible = "qcom,q6prm-lpass-clocks";
+							#clock-cells = <2>;
+						};
+					};
+				};
 			};
 		};
 
-- 
2.43.0

