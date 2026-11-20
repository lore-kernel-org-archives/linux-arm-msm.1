Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180911;
	b=FOoEGke2cJ31mM3QJZqJJ1hAtL3EiL8rAc3lf3y59nIRmOuTujgZz4zaXVBT2fhavFym
	 K565ZLtMxJU8hLW0BNZkpW0YVj8efcVr2ebeustfgVMGTb6643ruO8KSXxioRvAMUbr9T
	 iR+4DGesPgEnHQBZdrDZNLsnVuqbwncMWOEMKyu8NMRb+98wEcvQfp7DLKLhayAsAsxEE
	 a85BKxxdl3wlkBHkecTzXLXbtE4RSqWsiPW5lTCTS6C9ewgzTMbPslDIq+d3Fhwjs33Ux
	 Ma+s8mg9kqd7yIs0aORSd53mzlhKajOWqOCegdoT+oO1H9pkFCPBqZR5QtHr/zPSxWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180911;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JQeOTVAdS0cwN7wsmKAUzStegHqUQGaGh+TgPqKNIFY=;
	b=FloOcLykN0a9GS48RxNMAKSBeNszEL85iqRXDy5tpGoA6WmQcNub5ZUxdpAE1KcReE0R
	 +Dhe+6RVEsFOS3NGdO5RUIa466dWFz0BN/pquy/yDRz1YkZ5ouhHm9paomuwAHyAifrN+
	 S4iiGhN5wk2k0apFbAXSbzpbdSIUpwhzA1xgh+tz9qcgwY20DHbwBhlJU9Wje8Sr+5kpE
	 A3LA7ALugmuW+xL+Kcb7XWSTc9aPw2lJ2rX2zngD+y/cVNNr3IGdqv4Rexp0Q+n2RN+Bj
	 6+wxSOF0GJGQdkPBr8PGfzndzJ1FRQH4N+IKcsnA6Myp4kSSJNkEF+xRI/K2rTU185g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tpenmtvr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="IS/Jj14F";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F04B606A325
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:21:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F04B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tpenmtvr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IS/Jj14F
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjsME1681939
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JQeOTVAdS0cwN7wsmKAUzStegHqUQGaGh+TgPqKNIFY=; b=TpenmtvrGgKTrKdO
	0BK646rB4jxas3Vp1MA8uNNAWtIiNoe9/Fjx34nTCqQFrFsAFvvHWGkHdy5NDx4d
	vQ8xKQywj00sRXqZpcNZnFx3JbWZMW3aeGjLvw+JOHCf3+VVEltgm4r12DpPW6ml
	ZeZ9P2C+b3KCR4mJmRUCC1OADdKBBYZk6KUzqvEivktVlpISQmhSwGDKy13k+UZG
	XD9/K4iifWNBKK09nkI7j5VtTLGSoHm09MhVp84BDIYcFPxLP7ATD366I8GWdnUK
	hiF3JlrSMJD4j7Y+/YAsqwPVw5IUo49dearOmjrIw9z4GyU4wowbbaouQYi6JkSM
	ttO9dA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1tn5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:21:49 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b3b5b49cabso905957c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 05:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795180909; x=1795785709; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JQeOTVAdS0cwN7wsmKAUzStegHqUQGaGh+TgPqKNIFY=;
        b=IS/Jj14FqDzseEfPP4vIziDsmEpRHowUY6BCMbJ/Lmjow9WN/4wEaMHQUoBGVh1blz
         8IX1kYGLxBpfC/qWE9FPvJqh5W6MngJCLbEpm2YSLxZjWkdxV+YG0aRxcvsmkhSSKOY1
         rO0M9U5LEm3fVlIjpWOUs1NzxBlQybjUwb+haxwBY3Du4MP3j/wdjYC1YqCYdCbftS+h
         JnQyxs6zx1cIvehCrwzdM0NmMo/kZQkPNgDzlbfDD67vogs9Drb2g4riJCd5j8D3ZaMO
         2h/FBBAUyxrLlQ7/HWd/aR3OQZ1J2I8LmyMmnRSWEHyIXZw3N9M2hIUzlpFSm2caJ5+n
         bbgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180909; x=1795785709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JQeOTVAdS0cwN7wsmKAUzStegHqUQGaGh+TgPqKNIFY=;
        b=aXsB5C1JvunkQWRmhZ4OvIN9NzEB7At9OkUfrPKSbgYOTKbC3W8v/Nmioq8M2uPqqR
         PkZUj/ZqU8uzR3uqnsk3nrwUojwEvo1IBTszMXv0L5LfhnW8ngDCm7axuke2JK+bauYQ
         9SXC5tfDMKNMUpBq9ffc6EY3CbMKcC9vH5+E1d0+jJJz/3qJ1fMpAWuRJ12j3TnZyVXa
         XoYqUnfrEYcf/O7/QKHz4fl7nOppw9rPZbKSokLfHxyGVMtIEOsiKBFnNS8ImG4sCy/k
         DVcvHujK/FaQuw+9v+I11IMx1dzMfsBASLUxbcxZjrW6rEZKaY/EQvBoQzWp0b2esZVs
         +/1Q==
X-Gm-Message-State: APuU4Z80qwj1GT2nmk8hCBPMJRm1CFWWvQkXCvV17iaob5V8piDMs+7v
	8QSvgng/5nVIYBOP5Q00s1tbWJP+dk3dnZUMRpcDQKRMUXJOpM9+i9i1CRNCH4Fbi35zQcEO8Fn
	IzTlEUdLUjwxoeWOnlgUssHi+wi9vymO9Dd6/lvBJ2SHGCwzaPpiWeaqhT/17Vo3dZtdX
X-Gm-Gg: AYBFou0X3PnQMXg97/DMil/fJl20cHgR0v8J9mrfTfj7VCMx+cA8mnjeysR7BG1VnHM
	B1zmGf8W22terlMIqipXcwo4tUuK5m5rZBLT1VpFK6vXaLLj13kXecSX61F06E9oNjIKU+biXdn
	DzbKKbH1h6pvd8X4x3v85sxbrSVgMexm8RoInKT/WvlC8EHiZo1yZdiLOuWdl0XAOHd+exSw4uR
	Ko9TYweQv7oa8V7Q4BimY/FFym15DWFk16wQrIsg5C9I98plAGk/UrF6bsitG7UXuCWGvXo8WfJ
	mA6y3/QeUa3fuaw51QNY0hZYDTz1MRBZlwShbbWRLPYZ9GpNeCU4hoj//bG90gQCcIISsYiyomH
	Wt1hMiDHzpMNlgkPIruulHhG/r1fyKIbqeUitvX6J23Sbfnduv0mk1cQRyTg8DllU
X-Received: by 2002:a05:701b:4306:20b0:1b2:4c54:d976 with SMTP id a92af1059eb24-1b55ff0e104mr162820c88.31.1795180909199;
        Fri, 20 Nov 2026 05:21:49 -0800 (PST)
X-Received: by 2002:a05:701b:4306:20b0:1b2:4c54:d976 with SMTP id a92af1059eb24-1b55ff0e104mr162793c88.31.1795180908694;
        Fri, 20 Nov 2026 05:21:48 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm6929628c88.10.2026.11.20.05.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:21:48 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 18:50:52 +0530
Subject: [PATCH v7 4/5] arm64: dts: qcom: shikra: Add EL2 overlay for EVK
 variants
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
Message-Id: <20261120-shikra-el2-v7-4-9d9000eb50d4@oss.qualcomm.com>
References: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
In-Reply-To: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795180879; l=3007;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=wMDgrEXxSXNOS9rF/E0sT36fDr9Hy7ug2HlQioZib4w=;
 b=6bYOugmXBi1VmFTINGl7isGG6urs9SWfwFWuMmrbEdlG34HuzQVoH2iWbSuZTO+Y4V6Kn6anG
 z/WQQ7I5y6qCr0KOD7/cb8+DjkNOOkMY740adPwz5w/guzVz9uK9svh
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b00496d cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=HO6vDeO3Qxi33uTxly0A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: zQrW514PStHclBFwQgc4j07UqMk5sTkj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfXxXFnsheQwVb+
 gk294KqgqLwBIAABv+2I4CSSY99w0YO46lUOOWPWlBw9V5N+Gkc4uFgTeVbR2pQW2ucUrXXxVuG
 QL+wZ2TLUUliKdNu2EG/UvzT0oDH3919aG+4ChSlOK1a6/REm48zrwLAjMS3VpH5MpvSSTeonCf
 XQLlGp45P51DDIJdA0H2U6mvq+puw1NP77oVX09JzqWUkVzH6ZzODBrsvns/BIAg8yIFzEKj/CI
 eg8uEmcKpkXuUOKQwRYqYQ1TE1jkw71kcps+QbWXqiceR10az95CZC+FAzW479KzdJd4asfalCq
 7tY0cjJAD4jrijPAP5HOJitsF3p6EWYUsNoG9cNw4kE/F8WpyDbs+rfPuxGS99ZRSncyE3A3duP
 nL+X+w1KbyvhGCOsV1zR2PCVk53+LSu80YG9kw/rgh182gF82bxVLcMXvy+cRbm8APEfKtC2HvL
 ieXbo2rqyTbJKoeCL8A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfX+S9GaMBOusTg
 bvBPxMDwfAHx7DFTPCmzD8J45xx3hfevvXn9IOW23PVYBShGsWVjS3QXY4BVtjERkd65JZhuoAJ
 Vhm5fptXYu/IB7KB4NJnZbZpocHZgDY=
X-Proofpoint-ORIG-GUID: zQrW514PStHclBFwQgc4j07UqMk5sTkj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200053

All existing Shikra board variants boot Linux under the Gunyah
hypervisor, with Linux running at EL1. Linux can also be booted
directly at EL2 on these devices.

For EL2 boot, describe the IOMMU streams used by the remote
processor firmware in the DeviceTree consumed by Linux. Also
disable GPU zap shader and Iris video codec.

Add an EL2-specific DT overlay and apply it to the Shikra CQM, CQS and
IQS EVK variants to produce -el2.dtb artifacts alongside the standard
DTBs.

Co-developed-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        | 11 +++++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso | 33 ++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

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
index 000000000000..547db48da476
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-el2.dtso
@@ -0,0 +1,33 @@
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

