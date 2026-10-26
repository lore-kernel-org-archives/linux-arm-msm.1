Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015100;
	b=IuHSPAsSGq9a1V67kWmZu5DV4sqq9vvTltBu1xqemvDFdk6e23qJkJqLpHmhQRDXTj1a
	 iaIky3xbnqp3jSYfaHXfhm7xCphfjSk5AWMDbhXFXmoc/e7PKxl9S3fcNaphUqua7W02p
	 ODACVnrDbjg9vKzNF0hFmXH/ejIzdW3NvWGTUrMMvKqv4VaXajn5xnAjCxOn91QQYJ7Mk
	 thh5J5DI+mLKDPboEvSSE5VwlBZ7WVfEwkAfAKT+pRxjdbfWjY3qE7v4DfRvBcVDvM/Xr
	 8IbZ9C6YSMnzDt5EiYN38NzpDeUARNBeAUon0nwnFyeNkN/vXXEQELUENI0htOu+Bzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015100;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QlyTpgFrVOZZnRgk+A8NVn0ALQickdp+7r51UmOrO00=;
	b=DyTmd66TF68fK6WvY5Caka1AjNeYe66NmmNcSOF0pIoagW2YFekiSMsUKKcSDGPAHHga
	 2vG2Zx0f2ul6kGzzOlBYWNJjoCZZshV0QnPRSBgxEeTsGTCdtkbiTFj+y+oTdd6lhgz4Q
	 8KoxaU268dMGYJMm8mAC23oUVZKX7M/RfJULxmiOMrZyVYaLGYOqaGWwhzObgZsf/denP
	 1/vkU/VyhKBSz4GnD6YHn5UoJP004QVZopJQPjyjU5cY5SF1VyUW9z0+HUICQ5W5ZlStx
	 N+GoRWJ59lr6kpfmOWEHD2r65oaa2gSXUOihQGAgGXmjDigAEgXtTEe7b0aPPnhOhdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OrvAbcWI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Au0oSZBP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3BC606A335
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A3BC606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OrvAbcWI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Au0oSZBP
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt7db4126426
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QlyTpgFrVOZZnRgk+A8NVn0ALQickdp+7r51UmOrO00=; b=OrvAbcWIZD++luuz
	3iRakyb/8mf7mKFyODaugSqxIsXTykbPjLPP6qSBYUaNX2UHX/APDni5anu1MMjL
	w2PWkMZjpk7xgXedRX/YsqG/Jz6ulDOjD5FPeJzkzVdGpnpAVYR8zpdHoA5bwDtK
	MmuwICPgaDZK6eulmlUcfsIcdUINuMAA22fjeySrdFrjxl/g7pAzU8kAyaES9hbD
	/h1XtgjFSV/0n7t7/JlnBF2Icf83QLOnVj1HUCEBbGvsOnrbIS71gsac5Y5CeR3H
	cbhyacm2zSZv02CbTZOr5gKuS50rOXI6+iFYcuJ+hOP861SKbUhwt4BtOmGXoCW+
	GYF14Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhshpt7bg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:44:58 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdacb64970bso75898a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 04:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793015098; x=1793619898; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QlyTpgFrVOZZnRgk+A8NVn0ALQickdp+7r51UmOrO00=;
        b=Au0oSZBPNqIGm0Yj359iSUcy+MIWLuasw+Z5ymT2ASGwGD+M9J51m+juA5X/1I0ElZ
         pg5G52sNIiFARRBoPLhxp6mDjIjaJCB5THugjAsB2MxNg59ouk6P1R6canBAVh2PaQlJ
         Juo9YoD6lsCc4QnyZtnpGu/pktilJpqPrq3LK3NJMkdLHMFV2vmvFNNkOQqQHyK/5v5r
         h/h5ev1S3rkEmUaCUKJ7u6SsT54+S9+KgZ6RKMJrBDzAqIJdlAGgJIezDxvoDz3i4gwg
         DWQiyznoI3WEaJWipEzX6XeFAGJqo3R62DvrqFEce+ZLaYPdGGT3IOK6xnL+lWPIBbeY
         +ABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793015098; x=1793619898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QlyTpgFrVOZZnRgk+A8NVn0ALQickdp+7r51UmOrO00=;
        b=Y9HlfZZ9Gitb4tFzALNwrydvd0Dcis3tVSD4BU8kZrxQdw7AI70IinG3fJyU9M/5CB
         nBcaPAyYnJT33/+ZekIOIBmYKMpqP12m2M+PTYuwOryImnJAVDseQN+O4CWO614HGJSL
         x86YQEfEejCuGU/ZiXmrNurVyCNrPgTLjWYWi5Mt9irkIpWjaSvsM48MSSzODEIyvAg9
         NEK3XE1xj7joNnTKvHXjfklURspDmwUhWCudgxtGhad6d6xVcO6oYjvA6vjDWuCOVczk
         409LXQSxAbYTHKTf8Slt6XwNt3FMylYJpdnsV6Cz4L7s1reVYWhxzE8p4xRq/af5jtqM
         l3iA==
X-Forwarded-Encrypted: i=1; AKwUvBzF1TrhYasP9U6Mg9ewGrhrpzAalej3ASpBOpi0azolZ07rnPtdvD0LwvSTFWicP/XvjloRIcVVi+wJTjyx@vger.kernel.org
X-Gm-Message-State: AFq9FYJbLxX5QLMl6+8eQKv6zpYcPM3lomuQE0EMYt0K85AOD/MQwxF/
	rKQkfouThxxeCyJZ/c24pL3tJYN7YoZ0Pq8chy+3rOsS2C/DKQkei10PCyrQoMQQDNCiwWYiJJ+
	ZPclRpMWPLo9i+LHjTo9Yv+my5LxJ33CqDMo5wG6fi9qm8XGvQ5wa8QUNMdslXdbA8XnO
X-Gm-Gg: AYBFou10CpMNdQ9a/4emLc6e7zKT7eGDDrlRhEenpOCOv05C5FK7HquhSF2SYZc/R0a
	CT6TOSqapG0pVntCmzqKA3+kaQ9mW/XWJCRw35lHENOl3jS+zcslDUOlbC9RQRXKkbQdgnWg3oO
	TObpAbsjHuppX6d2aVIa5VZ+GELowMoX1n3A/KwEmLS9dphP0s7MJS1mrwQEsi5Yu074jIt1A7J
	ly7pKrWF7BfpY9RhkRKvuPDp+AbOw69+4htggVa1qjkYSOXJzFm/LOExPtejBx7Tf78l30+5izB
	gp18/bmuXLg8vQE3SmiFm+wUohuM2MulFRZ1jxVvLRezgWW/CUC/c2noAKOpepcRk20R+vRwdya
	G1MUocoBp6kxrU8t1RoDJm5s4gzpLGvx9IN8=
X-Received: by 2002:a17:90b:280c:b0:3ad:53e2:78c1 with SMTP id 98e67ed59e1d1-3adeae6d8b3mr5124875a91.10.1793015098181;
        Mon, 26 Oct 2026 04:44:58 -0700 (PDT)
X-Received: by 2002:a17:90b:280c:b0:3ad:53e2:78c1 with SMTP id 98e67ed59e1d1-3adeae6d8b3mr5124857a91.10.1793015097731;
        Mon, 26 Oct 2026 04:44:57 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebbb1a13sm7909588a91.2.2026.10.26.04.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:44:57 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 17:14:30 +0530
Subject: [PATCH v4 v4 2/7] arm64: dts: qcom: shikra: Add gpr node
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
Message-Id: <20261026-shikra_audio_dts-v4-v4-2-cfebe0809467@oss.qualcomm.com>
References: <20261026-shikra_audio_dts-v4-v4-0-cfebe0809467@oss.qualcomm.com>
In-Reply-To: <20261026-shikra_audio_dts-v4-v4-0-cfebe0809467@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793015085; l=3445;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=SNM/ebsvGy/rVTH6+fVaD4xggluPR2pQDAQVhPkQ7bw=;
 b=v4If8yVP9t9yrciCpkUv+s0ahq3YzY5rUAsGkdJvykQFGxZzXtGDPLCyko2EjxooQINqupn9f
 a346XzFWBBHC3NjsMs/oYVQFIPuHt9hbTUHEk7HsikLBZGRNhKSL7E+
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NiBTYWx0ZWRfX+e4sd/sZi0Sz
 INWT+Rn9oKMy+EqpUQcM+4bMpO/4nJxDsSUohi48Eb/VUmsTOMniSGTOWricLpa1XxM9MWwEA8G
 IrmMRONEVbmsE0krXQijoZehvqaOlpg=
X-Proofpoint-GUID: jd29Bysf3Z7lft-qfRVF0nN5-ULP-F8X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NiBTYWx0ZWRfXyw6Iym3urdwP
 VmjWKEhcIhLrTxBO+C737ZSjlgmLn2vJtE8t1/LK7tBdSC9FOClrfG9fXZ9Or0U4qVzyBDFXQVn
 bH6xg0yMbo5HPdJQ4CwciX5couNwOetRIF6MmlHnyYSASv+bdCOoc4jCaG90f2kRqggaTPqv42v
 QLFsOMTKn1ibGck6vEpzsPe1YGJ01risolgBomIOv47hvED3YDQewEvXJLGN7V3XXE6AjZWUvlg
 6RMlCHU+DAyj6f/27Ynmu8B4GCqZl4Q6yJ/lJ6S/6fYBLj915ahzmR5Quqze6aHNMENZBDFoCLX
 e4oVHULvQxttsibLB3zaz3nIFwWn3aW2mpCinyWbfvxZ+RDHgF0SCnFLfKpV6rVgcq2mRIclpMD
 jMElvS0J2nkQmrKBdxdnqv5CZrrEyqBMoOP+LKfyqWHcRPPcU1Y3D//vryS/+NYXGG0pwJ3JkC5
 W4Z63f3UUXggnL3iZGQ==
X-Authority-Analysis: v=2.4 cv=HZWB3SE8 c=1 sm=1 tr=0 ts=6adf3d3a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=T3D8ljLgrI678HBggIwA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: jd29Bysf3Z7lft-qfRVF0nN5-ULP-F8X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260046

Add GPR (Generic Packet Router) node along with APM (Audio Process
Manager) and PRM (Proxy Resource Manager) audio services.

Add a dedicated MDSP carveout memory region for audio usecases on
Shikra and mark both existing audio heap and MDSP carveout regions
as shared DMA pools.

Update the Q6 APM DAI node to reference multiple memory regions,
where index 0 is used for control path buffers and index 1 is used
for MDSP data path buffers. This separation ensures proper memory
allocation and access for APM communication between APSS and MDSP.

Also add shared-dma-pool compatibility to the existing audio heap
region to align with upstream DMA pool usage.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 49 +++++++++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index c010dd7b92cf..67ad6c3e34db 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/clock/qcom,shikra-audiocorecc.h>
 #include <dt-bindings/clock/qcom,shikra-gcc.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/dma/qcom-gpi.h>
@@ -16,6 +17,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include <dt-bindings/thermal/thermal.h>
 
@@ -476,7 +478,14 @@ smem_mem: smem@86000000 {
 		};
 
 		audio_heap_mem: audio-heap@86200000 {
-			reg = <0x0 0x86200000 0x0 0x100000>;
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x86200000 0x0 0x40000>;
+			no-map;
+		};
+
+		audio_mdsp_carveout_mem: audio-mdsp-carveout@86240000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x86240000 0x0 0x100000>;
 			no-map;
 		};
 
@@ -2395,6 +2404,44 @@ glink-edge {
 				mboxes = <&apcs_glb 12>;
 				qcom,remote-pid = <1>;
 				label = "mpss";
+
+				gpr: gpr {
+					compatible = "qcom,gpr";
+					qcom,glink-channels = "modem_apps";
+					qcom,domain = <GPR_DOMAIN_ID_MODEM>;
+					qcom,intents = <200 20>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					status = "disabled";
+
+					q6apm: service@1 {
+						compatible = "qcom,q6apm";
+						reg = <GPR_APM_MODULE_IID>;
+						#sound-dai-cells = <0>;
+
+						q6apmbedai: bedais {
+							compatible = "qcom,q6apm-lpass-dais";
+							#sound-dai-cells = <1>;
+						};
+
+						q6apmdai: dais {
+							compatible = "qcom,q6apm-dais";
+							memory-region = <&audio_heap_mem
+									 &audio_mdsp_carveout_mem>;
+						};
+					};
+
+					q6prm: service@2 {
+						compatible = "qcom,q6prm";
+						reg = <GPR_PRM_MODULE_IID>;
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
2.34.1

