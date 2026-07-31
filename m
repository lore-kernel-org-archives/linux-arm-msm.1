Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1941368D46
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785478497; cv=none; b=GTa07e+jdmdjwcpLWjQcUXt4b5wsGDI0uYDul4FVBT0js59K73msvBaMY9u5EH1LWYYEqWkchup6K19HNhnfZ0vGn6jlPcoPoZqYb1kSOYz1aycmXdF7+5juu7kUVbWcgFFEskY6N28wlDG1Y5pFQiU2V3qwZg1rFs0IGe69brE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785478497; c=relaxed/simple;
	bh=NkU3dFvQLNuVr0IO6l1ErGb6cSn9Tsn8pb/Xe/a6SHA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ubk2+yy1FecjIp/GvAR44h+BQvUIDR/rO7SYhCKP+9lrP25Xwb1snEpmiKHdWLwZhON+7V+1mae5JsjBII3B7JE/tiHqIxwQ6y7Lv2MiJ+8ndy6Xd7nEvf5OXBjhIysacU9mx/kHI8A8T2D6jFjj5N7aXiw/KSWQKChB5ltPo0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l8441yUZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g5aRSbID; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l8441yUZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g5aRSbID"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V69LZq3161926
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Qg4B4kRpc3PdcTpbqk6OqYURbQCiNDEzYTh3Ho14v4=; b=l8441yUZHxUNXRgA
	sFmG6LIFea8E8u4M58JuaORVZ9SSk/01eEVRURjQ9Te2ubqoVut54+xIYGED3S3R
	JCsndjtzIR3VRffwCUhKdw98eZ65XSwerHXCg6ORnkt3kuSyr5QhsbysXJObC6TU
	Wf3Za3wGCGUmDaEcvfc6f9eFfsy/jI8UaVFgY88IBhS6CeVItWXi00HEfTSSC0lf
	oyrV5VYDhCmTrmmzU3cIlZfYaKZ8/MQ3yrGqq0kxMkN1xDEnY3yAHgWN/xgtG9oa
	R05WGW1wkMSFA6pX+55gwd6wGMCjvpKjZoMue6ziKE0Jxl7DK5CnZey77x5HkKxh
	t7ocXw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frp6k80jx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:14:54 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb48f41343aso1205381a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785478493; x=1786083293; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Qg4B4kRpc3PdcTpbqk6OqYURbQCiNDEzYTh3Ho14v4=;
        b=g5aRSbIDD9Hc+W4a1eejkcV2iFK9flPOJHjjKweONO/mGPvOzAKbsNQ3zG8jLMnt3F
         kclLLtdl6f5fYddTNVxgtn4ohzP4hVUybpb8X1M/yBUUGcmb45N0v9utYbnw0/9sGvj+
         he0ha9XqNs/793p7jZesrHOOLpHQsjG9c5NAXDParPt70DFXqnvU1TzouPwRb7WKZHoJ
         WM5Hrh1UAStCO68PcPgE1nx5fDUsJ+iCAA6mKXDZRnyOebOPvXjOVvKl5+99tZoDhjAU
         Si3r3f7HnCqbAzcKlLXrGpk2PzjDoWz6tyGdqkGLc3/oNSJck6yUP6vO19y/1iuAqlUf
         Z2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785478493; x=1786083293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Qg4B4kRpc3PdcTpbqk6OqYURbQCiNDEzYTh3Ho14v4=;
        b=iPloZs2z1HTSw8JAoxqJ4v4/FtxwtYW9AylhSjbVQ/AFhFweo+eargsKOtUtQ2o7yw
         oC3fFdY8dWOSZtNLEHQPtlG7FWcYf8QGaOvDZZwNRnIVCO+F1FXnWZCTcXBdwAiZQ6qC
         B4N4kY5qCFdd4rtmonYS5SemUpEqqmpJ9auMMBGF8TYWzaPIpRLb0pnCDgYWxYuOiYYy
         P+ixANrIjQTId6pLMkPg3eJGnOvYcM/IlocYRBXCYkUikGyrNZabc1zh8qSO4hyPHNW7
         CjM4h2UF7KAj+zYoA8L3oV2gl+ZuaHLGYhfkCoUpf5t7QCO7gUVKNR9H34U2fFVbP5Ke
         jREA==
X-Forwarded-Encrypted: i=1; AHgh+Rov3aAhhRYrJoXAOw3y2qrcbQ3Vl9ctK+XuN1vZviKTTENp+zB+HlJAOaP9dmHTFC/IiuzUzMaiC2cL8INo@vger.kernel.org
X-Gm-Message-State: AOJu0YxuYioatdw6hfz6Nqcr+2uABx+flzg4bb2p4iMjdv06/EwAvD5r
	Qa0k5/uzfwI5sTndci5wpPeQKsYLFVnukXzxI2CASplsKslUzbzjl5HagRuDogJtNP2dwA3aNTW
	c53MZCN0hKjjIIFiLN4fdMilNXQixBAvbcJIN9zCkiVGaO8RGc85FR+79TsbdAp69PSws
X-Gm-Gg: AR+sD10HuBQK8ZddFckUQGItperaxEeADaUeB5ydtfLY0kg9psEW3YtSvKoSyggBpJB
	D1+AEto2ODHTW2tovhzGwcr0/E7JA1cSLQJVkomaMciAUfVAEuTf2EnwGw627DX/Xi9OZ2FU84o
	h9OzTSna5guYuBFJIQlkX5wLcjXz2X03cfEKFOm5OPmIy1XrF1dSdBZjX5Ao/S5lCh1LF/7wDaD
	+rBjDbzUvPsqpC332+wEe8y9JIaDRzYpzn8OQTE8vrxP/kpnwMZ9iIkz+Znw34hns/r4az+v/A6
	wHcePZ/B2lHlDaNBFIRc+T03ZwQ+tal9ASx2jO/6obLhkmDix69dc1kAgPwFwN/WM1ATlFFL7iR
	rmwKNvp9LdGl6OxtWCkkQWp/nRiey73PvfBihs92xufW2q9bCqRtCHQfHrA+Au6aw
X-Received: by 2002:a17:903:1448:b0:2c9:d56d:afa3 with SMTP id d9443c01a7336-2d047e395e6mr5992625ad.15.1785478493183;
        Thu, 30 Jul 2026 23:14:53 -0700 (PDT)
X-Received: by 2002:a17:903:1448:b0:2c9:d56d:afa3 with SMTP id d9443c01a7336-2d047e395e6mr5992365ad.15.1785478492749;
        Thu, 30 Jul 2026 23:14:52 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b15d26esm719635ad.76.2026.07.30.23.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 23:14:52 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 23:14:38 -0700
Subject: [PATCH v4 2/5] arm64: dts: qcom: Add Kalambo SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-b4-kalambo-crd-v4-2-e458f8b08114@oss.qualcomm.com>
References: <20260730-b4-kalambo-crd-v4-0-e458f8b08114@oss.qualcomm.com>
In-Reply-To: <20260730-b4-kalambo-crd-v4-0-e458f8b08114@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785478489; l=4284;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=NkU3dFvQLNuVr0IO6l1ErGb6cSn9Tsn8pb/Xe/a6SHA=;
 b=wbmwo6Ii8Ofp0ydWufnhJs3SKIzU+S++IHsHEaUEQ8/xn8D8XhPGw46eKH+6g7c3nS/uqL4Y5
 ZSNFGg/hBvKBHt2f19AXB2/d0GZt7J6hct4StYCuKYYlByssi7NYOU7
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=H/nrBeYi c=1 sm=1 tr=0 ts=6a6c3d5e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=0meGOa8vbbZiQTQppSIA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: gqdOGBuWhvnH_bWWO-g9TVNGAp5unLDW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0MCBTYWx0ZWRfX+6thyoGsrqmA
 1tfQzOUoVUHIXkp2HEA3f6IRAeLj0KoTuke6Fq93Bh4jqnP4MlXm1oKL+DEIR0Gbxs97PNsnJve
 IiNnefyGOvhavlgQPfbaF1o3h+dd6Br87rFe9HnqzcBvIJB6WTCmDhgixBS1T5PBUaX0x0cBdgO
 41ruHS5JWRxfHTloF1oKx4h/U3sbjtVPdQO/WlcUf3S18Pm2ZzlWr0/uE+b/4KP3Jyaq001wt40
 q6gPvwIXRF26C6dPGM6ZEKo0vH9qGFJEAFciYgAafN01DAlh9WdGOK9CE7kg99BxL9JSBiY9yAj
 uaqS1Wz0X385hjBusS/DF537ldm7nKSV/FyJe8/4fTSmPrbA9grxoIFMNSUrW2JQ/27vK6wi6iH
 OqoLl0VTXxM1PSKVdFcB2NuCy8EwUP8I8QZXFe7WpG6CE7grJoI3g+eCCxsQXY13UGVGnv/8VB9
 kGi+dDtnkui5CBacm2w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0MCBTYWx0ZWRfX6/agB6BJsxrE
 QNPkiDM0HKSCKZh+k0eno2jIGIejjdStWOo1KUzz1fjhUiGfRAhTQMqKTk0mcuyXa3ooplbwjBS
 YgR4Hj3vmtAvsQfByMmj/ihYh17jVbI=
X-Proofpoint-ORIG-GUID: gqdOGBuWhvnH_bWWO-g9TVNGAp5unLDW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310040

Introduce support for the Qualcomm Kalambo SoC. It is derived from Mahua
with CPU cluster 0 removed, leaving it with just cluster 1 (cpu6-cpu11).

The surviving cluster is re-added to the cpu-map as cluster0, since the
kernel stops scanning at the first missing clusterN index. cpu6-cpu11
are reassigned to SCMI performance domain 0, as domain 1 is no longer
present.

Kalambo uses PDP1 whose tx shmem (lpri1) sits at offset 0x200 within
imem, vs 0x180 on Glymur (PDP0). This pushes the tx region end to
0x380, requiring an imem size override. The rx shmem (lpri0) stays at
offset 0x0. The PDP mailbox addresses are overridden to match the
Kalambo SCP firmware.

PDC pins 109 and 110 carry the tsens6 and tsens7 upper/lower interrupts,
which are unconnected on Kalambo since both sensors are absent. Split the
range starting at pin 108 to skip them.

Add labels to the cpus and cpu-map nodes in Glymur to allow derived
SoCs to delete and redefine the cpu-map entirely.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi  |   4 +-
 arch/arm64/boot/dts/qcom/kalambo.dtsi | 112 ++++++++++++++++++++++++++++++++++
 2 files changed, 114 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 4be7edf894b5..3f1fd0973717 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -36,7 +36,7 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	cpus {
+	cpus: cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
 
@@ -274,7 +274,7 @@ cpu17: cpu@20500 {
 			#cooling-cells = <2>;
 		};
 
-		cpu-map {
+		cpu_map: cpu-map {
 			cluster0 {
 				core0 {
 					cpu = <&cpu0>;
diff --git a/arch/arm64/boot/dts/qcom/kalambo.dtsi b/arch/arm64/boot/dts/qcom/kalambo.dtsi
new file mode 100644
index 000000000000..fb5d68bd69d7
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kalambo.dtsi
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "mahua.dtsi"
+
+/delete-node/ &cluster0_pd;
+/delete-node/ &cpu_map;
+/delete-node/ &cpu0;
+/delete-node/ &cpu1;
+/delete-node/ &cpu2;
+/delete-node/ &cpu3;
+/delete-node/ &cpu4;
+/delete-node/ &cpu5;
+/delete-node/ &cpu_pd0;
+/delete-node/ &cpu_pd1;
+/delete-node/ &cpu_pd2;
+/delete-node/ &cpu_pd3;
+/delete-node/ &cpu_pd4;
+/delete-node/ &cpu_pd5;
+/delete-node/ &cpu_scp_lpri1;
+
+&cpu6 {
+	power-domains = <&cpu_pd6>, <&scmi_perf 0>;
+	power-domain-names = "psci", "perf";
+};
+
+&cpu7 {
+	power-domains = <&cpu_pd7>, <&scmi_perf 0>;
+	power-domain-names = "psci", "perf";
+};
+
+&cpu8 {
+	power-domains = <&cpu_pd8>, <&scmi_perf 0>;
+	power-domain-names = "psci", "perf";
+};
+
+&cpu9 {
+	power-domains = <&cpu_pd9>, <&scmi_perf 0>;
+	power-domain-names = "psci", "perf";
+};
+
+&cpu10 {
+	power-domains = <&cpu_pd10>, <&scmi_perf 0>;
+	power-domain-names = "psci", "perf";
+};
+
+&cpu11 {
+	power-domains = <&cpu_pd11>, <&scmi_perf 0>;
+	power-domain-names = "psci", "perf";
+};
+
+&cpus {
+	cpu-map {
+		cluster0 {
+			core0 {
+				cpu = <&cpu6>;
+			};
+
+			core1 {
+				cpu = <&cpu7>;
+			};
+
+			core2 {
+				cpu = <&cpu8>;
+			};
+
+			core3 {
+				cpu = <&cpu9>;
+			};
+
+			core4 {
+				cpu = <&cpu10>;
+			};
+
+			core5 {
+				cpu = <&cpu11>;
+			};
+		};
+	};
+};
+
+&imem {
+	reg = <0x0 0x81e08600 0x0 0x380>;
+	ranges = <0x0 0x0 0x81e08600 0x380>;
+
+	cpu_scp_lpri1: scp-sram-section@200 {
+		compatible = "arm,scmi-shmem";
+		reg = <0x200 0x180>;
+	};
+};
+
+&pdc {
+	qcom,pdc-ranges = <0 745 38>,
+			  <40 785 11>,
+			  <51 527 4>,
+			  <57 533 10>,
+			  <70 546 4>,
+			  <75 551 18>,
+			  <108 619 1>,
+			  <111 622 19>,
+			  <130 717 12>,
+			  <142 251 5>,
+			  <147 796 16>,
+			  <171 4104 36>;
+};
+
+&pdp0_mbox {
+	reg = <0x0 0x17610000 0x0 0x8000>,
+	      <0x0 0x1a980000 0x0 0x8000>;
+};

-- 
2.34.1

