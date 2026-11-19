Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088660;
	b=gKmFpppsXBxvN1dG8nsAiMKXL7Hm8/7+YmgC0LxyyxECH4To+4M2GGeRmq0XfvC5O65+
	 TmWZq92qX4vr7kfuHFxf6kq1fkIvrVXGFMlh86wXc0nV2GCfKjk26wUmv4dyQbxE7lvg1
	 RCLw6bkJfOOxGrdhjTxbkeLTEeBDqFXdaJzUxP3HF2SQfrwxrYzhPKcqLcnglfUFu+Fk8
	 e7e7X5Ms2XpA+FmdhCe6k/V6VmzQVOHVf6v4we7GoC7zf5rBb+6mVy2GWG1VWDES+o6Nv
	 1dC2FvG1V5t04x6wCoxRT7XRnsr63exwCMOT65A4oQ0ddjW7h/B8kaKCoomTmGtHC4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088660;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=m1eQxsHFa699Ua/aFuaIkpdVXk9LDUVO6F+1+W291SE=;
	b=pjYl5lQdQlzTjW9VScc53cx4yNWCjyGkKCqatSYIZ3AOmaHQEAwzCJQSajiBYVCPH3Qu
	 8GBth4YkC8OizJ46xc5t+v6MSOPyeWs99JCVusX1yP6nV/+x8eRc/+Ya61W5G8AMrgfPB
	 aHLHGk0ZbPueXkKV+vaDQgO3msqUZsfiTpWeijIlii3Kk/wN94ahqVqNVGWkr4vC2SN2K
	 wYIt47n/NROaUT300fWF8u6xoazzhpMN0ZS2JuaK3blOrY8sq55LufSaReFJ+iwwGZb9/
	 Wqi+K5iJiWLmzUpzuqMMmcmU5R+5DBfPM3k89nH7ca0wJAW9PIzKxWGLO8d8hz2MuFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H4fyOGoD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YfKVOHje;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C646606A330
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 11:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C646606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H4fyOGoD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YfKVOHje
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJAuRVQ598431
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 11:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m1eQxsHFa699Ua/aFuaIkpdVXk9LDUVO6F+1+W291SE=; b=H4fyOGoD3FTNWzU4
	QomiTbFfKGSBwsc9F4fyRREu1WisN2Ej9m2JEwA6J3ip4MBR1Ndyp0FRKFG/Bull
	Lm0qjuB0sRJDayLv4JWG1/vWP3+DLEBX8j4A+0SZ8LbbFGQkTLINAN+4EASbhqyv
	BJukAsR4JtzQQ4+tNSWYidCTiHaAKr+aJGqg3rklBJck+w7f4qI4iRPvtcuP6k6I
	huqVyS9oFa1kry0484xIW+Hn0CjpgqaWU21y5hAYzpTaKfMWfS1gNVk7eK+yKVc8
	s9HCW94nAb2IxBBJwj185z7OAcH/2Kp8R7Baj61++R683Bg9BJMZEKOZKlNdqDP8
	rqgbww==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1x708mwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 11:44:18 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd66551e02cso2462838a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 03:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795088657; x=1795693457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m1eQxsHFa699Ua/aFuaIkpdVXk9LDUVO6F+1+W291SE=;
        b=YfKVOHjeYKRVMka9xYP0lA1t5WRc6ZRdGh/2hHBSe7XiT4172nAXTG/B1nPmVlTnsO
         oE73CqqpHTr1mVlPnU9afQm51ujbEj9gqvP76UsD9Gi6h9/dKnj+L4Hzvi+YsHOcsvuj
         /dvDG/Khg9pQ+IyNJfMAHagooSJrmCfRRXHKiYKXVPNP6cj3mrhdpZVbHZMi1tj7o26h
         KHbaupvSG2yDedoNKdyl9t/rbCyX5ZqbizATuriRfi19YIB5uoykvahn7I/8zR2ANzMy
         wkanx/Zid9DjntuBzCeWQW+m+fxuLSq1aQJfJ6PLndQvMOH/je9HqlLlBbCH0tgi3QSX
         P6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795088657; x=1795693457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m1eQxsHFa699Ua/aFuaIkpdVXk9LDUVO6F+1+W291SE=;
        b=CtPRZ2Du6Nipw2DeVnEB1Vs2BqTkpNoxd31s42UK50kV3QGbgDwrD8+3BZ6zzw5MI2
         96ZxHolUjeZWe7G8OhbYaSXoTLBDgz1x78l2MiBzqbgAi1MluyPDCu0WcdDPnk1tuyLI
         Z5jnDFlEdalk/i4ejGVCyUUnKDK9jTm2ZqBLEKJNgpOzDTqdZek+52O/TcWwrAmp2Emf
         ygPbUp5Vn6Zy6eInPEO2Vucm3AVFJRb/bmPfMIXtmuqySaEgN2XDs4lsXEbSiQ77s2TK
         LhWZur9eHd2c7Vb62LoFuYUwXoWhPGE6g5O4M6fzJDBQMbtlpY6ZQBhksEbLR8dxiKex
         zMgA==
X-Gm-Message-State: APuU4Z/N4OGNBWuq7/rV9nMTxupCQqie4onDQ/sTBPLFNGSFhuWs1Wun
	gJEjt4l25qpGBCSDvBiNQCh5mZH9543u9/sTi27uxgfjh6KGv4/PaAsLZK90zdjHsI55HfmdYv4
	hHV9fDbRkdl3NAM7KUwvKf1V0yDq5s4yj7+FF1cmgrTcPcnie4tlpZBkio7zI89T+2Zjz
X-Gm-Gg: AYBFou3DLKPshWkn+hbH9nrfw0qJyDL5GWtoJHLLqPJb8UESuts7DKxout2s6NEYsYk
	/YK5WTsyFOSbjkWavSZ/prYz5v6SpuZVEUVdJAYONnSmgnIQargLYtjFipaAkKXVvwCeDtKuGqY
	DGRzkdDaRkhfGk7bOP2JSaa+nkcD2HHn0bVQ1FdZE9c6nyXkRh2hIRXuuC3fBGhlY7PaLCOUR9/
	6MjTTpqvSg5O9y6DVlWQyKHcUeZ+Sq0zkw97Al+zwJ78XtHR17som18ZocP9/togvEKu3SjW60L
	x82ZPkeMXL0Mocx8v6lh01+7OTg8dDe+EGFQhMjRpInylmG6TPd/XpEJYaUzpZBp/gd5YcolIm5
	wCiDD5fZ6Wcg4NGWHMf45spEHEsEjZBogxCoIAXMi5Wxt+6f7bkcX8PiBWjufjHe1
X-Received: by 2002:a05:6a20:6a26:b0:3e1:8890:8400 with SMTP id adf61e73a8af0-3fe892fd632mr6601961637.15.1795088657292;
        Thu, 19 Nov 2026 03:44:17 -0800 (PST)
X-Received: by 2002:a05:6a20:6a26:b0:3e1:8890:8400 with SMTP id adf61e73a8af0-3fe892fd632mr6601929637.15.1795088656809;
        Thu, 19 Nov 2026 03:44:16 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde534854b1sm1613960a12.12.2026.11.19.03.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:44:16 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 17:13:47 +0530
Subject: [PATCH v6 4/5] arm64: dts: qcom: shikra: Add EL2 overlay for
 remoteproc SMMU mappings
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
Message-Id: <20261119-shikra-el2-v6-4-0e91a1467e79@oss.qualcomm.com>
References: <20261119-shikra-el2-v6-0-0e91a1467e79@oss.qualcomm.com>
In-Reply-To: <20261119-shikra-el2-v6-0-0e91a1467e79@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795088627; l=3032;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=jeuAGuJGjEHWmNk486jltyoZtfg/HSQjsJbCk2VSQ8U=;
 b=khI25LKwln4o6xiqJfXSdA0+b1yStMxCm3lUDbl4//WeF6QeYGQVDO+UUw4k5yW20s1TDNllA
 6ewCBIKS2HnDZhMIocMtri6uO4RCy4qxOYro0l1nX2HEpxlTkcxN9cl
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: eS_ScWCjiiLZsVYNCRCJqhxqygJgvqUo
X-Authority-Analysis: v=2.4 cv=RdgFmFtv c=1 sm=1 tr=0 ts=6afee112 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=HO6vDeO3Qxi33uTxly0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfXwwifxiJmjU1t
 3410ZZbRmIUbymZfxF9S5XrCGXwfgi/yVYbz83kvapGs2z+yqdIe9iG4zOdO1ewzU8K0XAl29p4
 u2DydhAPYQe252oWSemwIPQVesWlreA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX7GBfNFhjYPv9
 8CMedlvj8YdqsNgFLHPwbsDEhpCkB6vjKn0IXDYeRVUP5UKBm9+bsc5BX3vN///PP5guDlem2dz
 gA7I1LqAnB+Gc52ZSi3qJDaO7hXs2Wk4Zsn8F9deXyjrwh+EfEyycbVNJyPuUM5cJ6R6jHGC1bT
 0q0fsIRlYflvBOtN2MgxtyCcj0ht0qh2Ikd66JhMaIl9UfXh7cQFpH4tyQDkraOAPLaWsBtcYgG
 OLSGAkvsvn4nnlD3FxVmcxQ8KZ4BvyGRTULdA/J8Ul1TNVsXxYB0ICQ79DhzBAUk/0/Q3aC3eYY
 22ZrAqvheBwg1cx3lJzIKPetodrgInp1EOSVJhljIIdLzWqv5UJAQCh8oAHKTm/Bhc12caYxmWe
 4PktLSndwfpTMpLgrIF0shFdXtq3FYpU0PsYDUtaNkiB6/6JOxrU8O6yHQW/2d6U5hf60DjqAk2
 Xc+q/zUZEsXiqr8LkHQ==
X-Proofpoint-GUID: eS_ScWCjiiLZsVYNCRCJqhxqygJgvqUo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190046

All existing Shikra board variants boot Linux under the Gunyah
hypervisor, with Linux running at EL1. Linux can also be booted
directly at EL2 on these devices.

For EL2 boot, describe the IOMMU streams used by the remote
processor firmware in the DeviceTree consumed by Linux.

Add an EL2-specific DT overlay and apply it to the Shikra IoT
variants to produce -el2.dtb artifacts alongside the standard
DTBs.

Co-developed-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        | 11 +++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso | 38 ++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 19310879349d..5c8d179f2792 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -416,9 +416,20 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-samsung-w737.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
+
+shikra-cqm-evk-el2-dtbs	:= shikra-cqm-evk.dtb shikra-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-el2.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
+
+shikra-cqs-evk-el2-dtbs	:= shikra-cqs-evk.dtb shikra-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-el2.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
 
+shikra-iqs-evk-el2-dtbs	:= shikra-iqs-evk.dtb shikra-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-el2.dtb
+
 shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
 shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
 shikra-iqs-evk-imx577-camera-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-imx577-camera.dtbo
diff --git a/arch/arm64/boot/dts/qcom/shikra-el2.dtso b/arch/arm64/boot/dts/qcom/shikra-el2.dtso
new file mode 100644
index 000000000000..89997ed7699e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-el2.dtso
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Shikra specific modifications required to boot in EL2.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&gpu_zap_shader {
+	status = "disabled";
+};
+
+&iris {
+	status = "disabled";
+};
+
+&q6apmdai {
+	/delete-property/ memory-region;
+	iommus = <&apps_smmu 0x01cc 0x3>;
+};
+
+&remoteproc_cdsp {
+	iommus = <&apps_smmu 0x0200 0x0>;
+};
+
+&remoteproc_lpaicp {
+	iommus = <&apps_smmu 0x0360 0x0005>,
+		 <&apps_smmu 0x0366 0x0000>,
+		 <&apps_smmu 0x00e7 0x0000>;
+};
+
+&wifi {
+	wifi-firmware {
+		iommus = <&apps_smmu 0x01a2 0x0001>;
+	};
+};

-- 
2.34.1

