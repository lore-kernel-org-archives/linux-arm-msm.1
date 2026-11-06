Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953544;
	b=x/qkGVkFVGVI6lRgh6AGGvyGGMt65TstuwK50G1HeDzcRoFrfzT2UskGK8n5t9FMicTM
	 zJB9ir7t2s6Dqfhwp+dh/i5q1/fQmHuK5Aq1eP26SY31Hw47ejxKCydPEu7QWavl5hDl/
	 6s3DR/AElAHHkHCfoYgHnrxosUy3heHR8mfO9pJSr0DXbwuWx7OLQw+Q0ooKCYmJKjSvV
	 1ajUKcHufFuqsiTn8tdbNP5F2qWntoM0ipDxut2NPi4QZ/wB7DAZ7HvAhnQP/lc5N9aXW
	 sXHfFkHRFhkhdm5vk1PPrWIVi4LVWFQ64k8KJU0G8K8Go4JOqSWH2XL6KNAfSzr99fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953544;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kE5+p5P65VPjFBQS2QIkASIL3ETgZUjcBDE965AYSOM=;
	b=HkZ07MHIg2uoKiKD2Gb+D0hr8vozLi6klwWxnUyffQ5T+D6ZkqydO4dW/txwbcoK1l8v
	 j/Q7Nmd9ly0WUedE6SRjvkJqbM9C5SQ9vD8CoKQ+VC4StzCMnN/Lw/8aspc9SsbXs8YOV
	 +dk77EmJC9yQVzJFBAqaj7pQHNYSjAVByTxFkY6D/hsrl+NmaO57SXklLQYFbYlrzOWgg
	 pYIxNSRmbXS5h8qZhQSTwrDYVnsNCkuPg65XpaafjHnIRfPOvaOXtwbzH++YA73pBuCvj
	 pbGsREfTu9n2ViVzsmOUdUfi88LpDh1hfnrSEQG1FD85vz3HAU/gRegdJD0B44GP38A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P0zg83WE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tk7B1nch;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20CF606A32E
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 08:25:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A20CF606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P0zg83WE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tk7B1nch
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RkxU3883418
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 08:25:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kE5+p5P65VP
	jFBQS2QIkASIL3ETgZUjcBDE965AYSOM=; b=P0zg83WEuMkifmeeV8xUqbW45X7
	0rC+m7lJ/m3JQCTqKQpEzDLE9tJUSHsNi84J18L9PsE1ChkZ7ftnuk9Z/Onge8UH
	6B1phgqmiiTIBSGouPh7CVimEBWr1MIvBVf+2DTarC3krZ07HQY86PYT9g8aGKi3
	Y+j4RJs86Wy9UDl6z+3c1k1nNpqVi4+apVRh21rhzFKRMKcJB+ZX1zGBrGCfMo5z
	JDKjX17td+FjrMlZoxP6JQ7AFcnYWKgtN/l6sH6dIGCSkznPfTFL3EKJ8uOyyRuO
	V4jzWAKBODoHP3jzdPVvxHaDd9n4BUaV1LYzwcUVQ+D4KTZ7Fj6HA3bm0Uw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pb1uq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 08:25:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844e383so78905385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 00:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793953542; x=1794558342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kE5+p5P65VPjFBQS2QIkASIL3ETgZUjcBDE965AYSOM=;
        b=Tk7B1nchFGiqZDNgi2rPFihSgE9VZxtvO6r1BCwYtXE8YnfKQvLXHety9yj59iRhGC
         zg/LILCn2M2I47HNzw0eranHHv9OlslaZnS97rOmbcYa9g4E+NsizCXDSl2Ta/wYcLra
         amiPrJYB0VG8xzbDXxi59ki1h8g36wjJSON0eLMlSDyw7MjdFmV3wPaRDeSne0S4mT18
         TL7D/VyHa5CTGu8q44Smp6/zd9tAwOEIGOCSxcJpKncRxLBZ0oQfVYZa9IIGwwy6owie
         GCmDta9WZ3ERMpRR7K/zXHdnsceu/AkCLTp/9RdVz9QL88J39nagKheLEq6wBoOm2tf+
         3haQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953542; x=1794558342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kE5+p5P65VPjFBQS2QIkASIL3ETgZUjcBDE965AYSOM=;
        b=pZ7n0e5w8IlHiCpTg0OvBWYI5gdc+XKwvMOa8FHiHmcSvTzAq+YFRZ7+uNHDMl1IuT
         qGxdPLzXXHAtgDaKObADAE20bmGbkGDw0aPU7merlvP78n7zNF1lLnyJ8HtuLAi707ng
         YmbwEAQi5HqeS7tJejC620meB1Fovy0uNnrnCQUHKFKgsEJSevN580ehEd7xHDnmdx/2
         rZVsDp7juV8pw7ZqakWU9VYd2aMnZUE5AqC2eKhGcQW0yASxAGZvL5e8iipfjIxy4rYF
         Aiv2+sPyoUt3pTpJPO9Dk11ech/lAVLtYaJeNRG77lP5UyonPcFHueUuQEDP5sBOdXc7
         vE0A==
X-Forwarded-Encrypted: i=1; AKwUvBwNh6kwTMNtZYu3hNL1pIJViB5AmP3Nbw5DDjyiTSxumru9VBDg6vrWe5sHyPuE9bCseqrvPpxbvjoTUqxu@vger.kernel.org
X-Gm-Message-State: APuU4Z9NDaMBGk/IAZ3dYJGptkt7f58Pv4Dshpw0m2Id0seCYvPGLZOh
	zcBkDbLPoq/sz2m6Rx7bQS6QT+4V/gZ5MtSPQBCSpB4G2KTKRMIA713KiG8DnIuRo1AGlOxZiP9
	c6B/38TX30cuRRyZCGzzgN3L+p5rSP3bH5ld9Qi2d7b7z+OE2cZo9ynjfctxj/XTgY27W
X-Gm-Gg: AYBFou3+AuXumAurCJPOyWk2qnalRHTVt6FNNBaMM40DlzIqcLiMRWk/lVrS+DWHL+J
	Z7iHIvDOPsxTiJ4G1UX75A7JCkUzQRsuiUuwEOO1AhHNZB3aXzwprNWTa9kMuCdKgwzjS5YrZkM
	DZGLORYK76QM5sKNHQSmhizTn36oXz9+O1Em1xPXyCYH62qhzVqriVS/Rfb90v8CUgYGvYLLvGS
	VR109QDNP8RqVaryNU2OD3K0Ci8FfoZIpLJTM20Jq7/nk2XALjPlzFUkPqhpb9c+/zxjfuj5/Vn
	tzZZcaEyA2hYilWD6Gx2cfEP+6pUkBZ8y8jsGO0KG4b8QduopE08Cu/9RMO7aL+2H/cbMDQmkZc
	aFDbQUTeci1+AXzXyyz7/2+uuGkk6MagehB40Nk0PpMgDEOxo2abP8YHH90jF3NzSBlT7pLU6ag
	==
X-Received: by 2002:a05:620a:4405:b0:93e:8614:bbe7 with SMTP id af79cd13be357-945f32a3d98mr255538285a.12.1793953542027;
        Fri, 06 Nov 2026 00:25:42 -0800 (PST)
X-Received: by 2002:a05:620a:4405:b0:93e:8614:bbe7 with SMTP id af79cd13be357-945f32a3d98mr255535485a.12.1793953541605;
        Fri, 06 Nov 2026 00:25:41 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ba6bc36sm130723255e9.0.2026.11.06.00.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:25:40 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v7 7/8] arm64: dts: qcom: kodiak: Add JPEG encoder node
Date: Fri,  6 Nov 2026 10:25:21 +0200
Message-Id: <20261106082522.1448390-8-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
References: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-GUID: ywb4uaYoqSRcvfzXm0zsHlADTTMRk_XK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX/2qhDAXaHKQD
 IGQFQ/8oYSISRTyRmHhdwBtvpBAO1RWGY8FU8SbHMuHwTh1TlyF8wTzuY0QZqRwMj9T6U2y260t
 cAFeyJ7/iU7/hRBbgANx++aqLJz7Tkw=
X-Authority-Analysis: v=2.4 cv=LIrz05W9 c=1 sm=1 tr=0 ts=6aed8f06 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=iVVtd_vrlZ2ormJ2GbwA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: ywb4uaYoqSRcvfzXm0zsHlADTTMRk_XK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX5oyH1bPetAvl
 zXR4VQlfKjEWjTBB6wH0kaLOlwXjlZyT2bHyr4I9IjgLjkXwLHMYK0UolnkOAZFrn8Ft1/n1Oxw
 Ymi6VqLxUiPQafJqL+IHtGmGxIKAJ0r+N71QvIYab88t6A/TajNvj+AlJPeEuCndQKOpl/3INjT
 rwuSd9kJXrTcT/2qFw9CSPb2C30z+WA4UtHqt8qXTeYBM9Y+s0c+Vnhxv5ToNh/02S2yLQvacis
 gMr+A6uFD7F2p9kSRCxo94r0v+Ciq5xSUPTxA2sIJ+1yqVaQmmRYxdvEFsmRzdX1JjTJh6pBMbG
 8u+2DMCcSEuhr2+VtK4gOp7S43OaWk9moR8zvbEFvev6HywWOR75qcwZtO/2WJoH7Ek78Cfe3on
 X0FS80vcCq/Ka+7z26NelOk7RYNgcAAEELabZE6uOrjmjw1uURAXII3tMNEjrR88DgnC5hEFAv3
 RpoI2VyTJaqUkEEODTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060033

Add the JPEG encoder hardware node to the SC7280 (Kodiak) device tree
so the qcom-jpeg V4L2 encoder driver can bind and operate on this
platform. The node is disabled by default.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 69 ++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 8c7523602d271..463ca9a654365 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -5164,6 +5164,75 @@ cci1_i2c1: i2c-bus@1 {
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
+			clocks = <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK_SRC>,
+				 <&camcc CAM_CC_JPEG_CLK>;
+
+			clock-names = "bus",
+				      "config",
+				      "cpas",
+				      "camnoc_axi",
+				      "camnoc_axi_src",
+				      "core";
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

