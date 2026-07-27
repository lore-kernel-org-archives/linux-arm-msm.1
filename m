Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D472B3E49E7
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138407; cv=none; b=SYHgpV8PGyxRNA2V2hQKT+pEvhFNY3iDctXOyTANqjBeLqS2mt0NSgNz+dSw6fsWyS6uEst2fYQtJAM03T1uc2pmg/euSzxI8J3+miZlVYtR0eEFMVQezHvIP3zuAI3MOsGIBAlx4PSFBE5CengUujWUgcq4kYD1WmuUauSMW6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138407; c=relaxed/simple;
	bh=0YzZDwNOI/onVZdiLZlMM47FfMeGDrDDZthxQwRvTgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DDtBFL9kto5hg2P9j3NYaMfLARXXuDTA19adyy2B+2N+uXBa053Bf8buXOQ4TgroWTfyBk7QIGlWhleokDiCiXaWaWUuPM33QOkUm2D38FZDNH3PkYj/DcCKq2dch2gm/1lSHl6yZpdbkc+6QfxQY788dMVzvxZdFrkhmJeds50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uwvqjd+0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QwXyKHQ2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uwvqjd+0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QwXyKHQ2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R7RbqQ4161925
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:46:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N4TIXsfQ0zT
	s/aF6LfD8y7lVY1UMz6f8WLChqvUOxFA=; b=Uwvqjd+0jF7e9DZS2pp1i2AlZeU
	JT62nSC0nlXEQPgM1dE6NTdJrvRr+O4kpW7Gp93uee7LKH0IIJ9Zl3vEm4y/ZNBj
	lPFFOyWHyEeWvt0MWL+7nLfm44flIhk3D/taSAvkRXk9XROMtL0XJiInAH0sGs86
	lHgVp+gBgqva/d7w4d9qEwh6lRBDZZAfhtR0PfJE/+kCUDMdi1oLfAT00gNl5YLI
	mfQjSkpUZrsMWUT5MIdPY/YbxHGBdlO6VEjPuYRZAcjZBHdo4HoNklPrAENJWI41
	MoUH07Hr+A+OxCgJeYKRl6e2wfIRzi+/5xhTBCCMmXSBhJFvVLpZHNnW8XA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fny9wgs6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:46:45 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84857446424so4584009b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 00:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785138404; x=1785743204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N4TIXsfQ0zTs/aF6LfD8y7lVY1UMz6f8WLChqvUOxFA=;
        b=QwXyKHQ2MYI4Li8f79v7jov7Nd0BXqMr34jkVxzuo0/4HGHEC+4+De/+VCmh8/6YEC
         VRuchA7WwSqPWdrcGe2tX5wTNaAelYfh4v98G5BVUiL7luKIlLTUcGkZIJKrVprVKoXq
         Mj1HQec8zK4qDcz7Bw15NDqyCZB3Tr/cNJ0hbOmEeo84aYyuCuh0MeHR06WcawpNsKQe
         TEsWmxgEFb114z0gUPl7Wyh76PN4OQyxd6E/UfnSCctSyphDnnpQ+vH7khzRSiRvIV0o
         3fBo4/ySNSmCrO5bzgWxCEunztGKhxonGC7Z4GTkl+Zy0qwVlJOYa8HfjXTLI9aVacqZ
         k3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785138404; x=1785743204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N4TIXsfQ0zTs/aF6LfD8y7lVY1UMz6f8WLChqvUOxFA=;
        b=FhR723tsQ6/RU7Fv72Tv3ZYLVVfJfOb3KmaZ8o7azXsABr8OGujYAvGRyAh/deUnZk
         wxBDvzQq+lKjPFp9lKy5gOccgcmay+yL2/884sIl2nHjcWT94bPGO5wt3ptjWdfb6Vvq
         utL13VhIVAUG+nxmGhIyfo1V5yJb7gL/ZaWwFLbPOsAQ9SDQn90IK9DE95gqvKRi7GkD
         BexR6P1XpFdC9NslIeboTydC7ZV8oOcBhFg0+tLTpuVVn0m7O+OTpoSTpPY7Xf51QLt6
         ftleV57Xx+jY8TdH2FQA7JJezKKetOPDPUuf4iVxHP4KMz/7su5NngtDAZG3Ehvr5kvT
         AfTQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr4d/Qm8/Ipj8XAEl2B0KTQKOGxmZYXB4UdU5jgnElAwxJx4XVFghb1Fd7h1pL2kRQaWONzssaTM73ACn/m@vger.kernel.org
X-Gm-Message-State: AOJu0YzecSD0oIN6ajKGm36+qbK6PpBUetc/PJ3Qcj8x8UnrzDcI4gTo
	U8dOjWWUIUdU4QKOiQzMjwlF5LhzsekC2z6EapQFzslYGehIXGs6rL3VkwgsnaX4nzA4DKknkP1
	ToURQA3oZXp98Svq+8Slk53AcoWPvqMqHF542yEStC0HH3tBuwpjPVVpOddbbEUiIlnUa
X-Gm-Gg: AR+sD12BvM0idsmLPBVXEvQSvAkkkWGlawXC75d8Stg1hMs9G4FvWZMdnz6w8qXRx8Y
	1zHiRMEn6Gpns5lDyunNkTOnNPdlDjKEMaUFvYZMwL78LdbG+c1CdMx9aQKVNIj7yMAmYnU4nU7
	TKNjkfGUSXZsf7lBbqIpR9n54n+5y0toIAYEda+xaCteCoaX9kURHB4ymY3w+omWrB1ngXImUrB
	YYlRSFGYcSkGePiU6DBbZJ45niy9M5+C6nEz09H+gsQYpwKYjVY5W9HQQgyW1NbfWbnOP4HSeZJ
	pQOBnMV71NCrlIO8AlAHC9glhf+G462WmUCIz1R+QdcCPw0EoAzsZAX/xtm4hhp1Gu7pz69TFGU
	qdw5RlRepXqJVLQrJV61TW8ysW8/JZxH00p3aTxMiPATeAXK4Efsgzg+w9nhK
X-Received: by 2002:a05:6a00:9507:b0:837:f79d:909 with SMTP id d2e1a72fcca58-84e59544ea7mr6009415b3a.39.1785138404563;
        Mon, 27 Jul 2026 00:46:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:9507:b0:837:f79d:909 with SMTP id d2e1a72fcca58-84e59544ea7mr6009393b3a.39.1785138404084;
        Mon, 27 Jul 2026 00:46:44 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5342471dsm2590150b3a.47.2026.07.27.00.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 00:46:43 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 3/3] remoteproc: qcom: pas: Add Nord ADSP and CDSP support
Date: Mon, 27 Jul 2026 15:46:21 +0800
Message-ID: <20260727074621.561661-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727074621.561661-1-shengchao.guo@oss.qualcomm.com>
References: <20260727074621.561661-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA3NiBTYWx0ZWRfX4fMO/rsf+bvp
 LlpM/LfoxL+hGVAvagEMGizGHEjMipei88+g9u298NqWwzv3007+wR8FqkT9MmNpZHIxwpU4YQn
 vHBrHZSHpcqhHEjg208R00Z8GHEc6k+PBWkaeGm7uID4x2FilmlhC0fOcpcP0kMyxrS9qD549dv
 kOJlqyuJ8ft9jJqhRCHfsqdYADYqCtLVzNNdxARVoOcRc6jzMLTSujPT8gimW1QlTP45QL4TP0q
 erzLPrh/q9M8kjgNE4XhHXJ9HWoIhNMsGAH6bvJYAGg4pw6ldoz9i8OFlGqoMXtiWTW8/Zc/cE/
 ll0K1Hqgld74j9z4KyUjziSeBXlWM0nofckpaWrhBJ0aNAbohEqf90gIMMRRVnqUNn8SGdXSjLf
 Ys374BZVnPJDURoBBk9cJUYwwgxeHm0bhRDai8bHR3rVHPg2or6sBM/XshUxJmhC16wuNGo7nLf
 Tnu4g9ynbW4GOWC9fQA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA3NiBTYWx0ZWRfX9lWjAo5TomW4
 hgEALFr+1+YhBXMoP9Vu7VlFWzRPC2nVxcp/M+0WKm4O4ZzTjPbhkUzCFiwDREf7IYzZyvgklEe
 brTR8ItZX5nOharC82cx+mRbNamBNlI=
X-Proofpoint-ORIG-GUID: A_luhctU03N19XFfL9OPSghuMNoaLMCr
X-Authority-Analysis: v=2.4 cv=E4b9Y6dl c=1 sm=1 tr=0 ts=6a670ce5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=wKDsrv0q4RgBVPAhY5MA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: A_luhctU03N19XFfL9OPSghuMNoaLMCr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270076

Add support for ADSP (HPASS DSP) and 4 CDSPs found on Nord SoC. The ADSP
is pre-booted by XBL before Linux starts, so set early_boot flag for
attach path rather than a cold boot sequence.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 110 +++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 25599d728208..6f3850a3fa9e 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1434,6 +1434,111 @@ static const struct qcom_pas_data milos_cdsp_resource = {
 	.smem_host_id = 5,
 };
 
+static const struct qcom_pas_data nord_adsp_resource = {
+	.crash_reason_smem = 423,
+	.firmware_name = "adsp.mdt",
+	.dtb_firmware_name = "adsp_dtb.mbn",
+	.pas_id = 1,
+	.dtb_pas_id = 36,
+	.minidump_id = 5,
+	.auto_boot = true,
+	.early_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.load_state = "adsp",
+	.ssr_name = "lpass",
+	.sysmon_name = "adsp",
+	.ssctl_id = 0x14,
+	.smem_host_id = 2,
+};
+
+static const struct qcom_pas_data nord_cdsp0_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mdt",
+	.dtb_firmware_name = "cdsp_dtb.mbn",
+	.pas_id = 18,
+	.dtb_pas_id = 37,
+	.minidump_id = 7,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		"nsp",
+		NULL
+	},
+	.load_state = "cdsp",
+	.ssr_name = "cdsp0",
+	.sysmon_name = "cdsp0",
+	.ssctl_id = 0x17,
+	.smem_host_id = 5,
+};
+
+static const struct qcom_pas_data nord_cdsp1_resource = {
+	.crash_reason_smem = 633,
+	.firmware_name = "cdsp1.mdt",
+	.dtb_firmware_name = "cdsp1_dtb.mbn",
+	.pas_id = 30,
+	.dtb_pas_id = 59,
+	.minidump_id = 20,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		"nsp",
+		NULL
+	},
+	.load_state = "cdsp1",
+	.ssr_name = "cdsp1",
+	.sysmon_name = "cdsp1",
+	.ssctl_id = 0x20,
+	.smem_host_id = 69,
+};
+
+static const struct qcom_pas_data nord_cdsp2_resource = {
+	.crash_reason_smem = 665,
+	.firmware_name = "cdsp2.mdt",
+	.dtb_firmware_name = "cdsp2_dtb.mbn",
+	.pas_id = 57,
+	.dtb_pas_id = 60,
+	.minidump_id = 29,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		"nsp",
+		NULL
+	},
+	.load_state = "cdsp2",
+	.ssr_name = "cdsp2",
+	.sysmon_name = "cdsp2",
+	.ssctl_id = 0x1f,
+	.smem_host_id = 133,
+};
+
+static const struct qcom_pas_data nord_cdsp3_resource = {
+	.crash_reason_smem = 666,
+	.firmware_name = "cdsp3.mdt",
+	.dtb_firmware_name = "cdsp3_dtb.mbn",
+	.pas_id = 58,
+	.dtb_pas_id = 61,
+	.minidump_id = 30,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		"nsp",
+		NULL
+	},
+	.load_state = "cdsp3",
+	.ssr_name = "cdsp3",
+	.sysmon_name = "cdsp3",
+	.ssctl_id = 0x1a,
+	.smem_host_id = 197,
+};
+
 static const struct qcom_pas_data sm8450_mpss_resource = {
 	.crash_reason_smem = 421,
 	.firmware_name = "modem.mdt",
@@ -1695,6 +1800,11 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource },
 	{ .compatible = "qcom,milos-mpss-pas", .data = &sm8450_mpss_resource },
 	{ .compatible = "qcom,milos-wpss-pas", .data = &sc7280_wpss_resource },
+	{ .compatible = "qcom,nord-adsp-pas", .data = &nord_adsp_resource },
+	{ .compatible = "qcom,nord-cdsp0-pas", .data = &nord_cdsp0_resource },
+	{ .compatible = "qcom,nord-cdsp1-pas", .data = &nord_cdsp1_resource },
+	{ .compatible = "qcom,nord-cdsp2-pas", .data = &nord_cdsp2_resource },
+	{ .compatible = "qcom,nord-cdsp3-pas", .data = &nord_cdsp3_resource },
 	{ .compatible = "qcom,msm8226-adsp-pil", .data = &msm8996_adsp_resource },
 	{ .compatible = "qcom,msm8953-adsp-pil", .data = &msm8996_adsp_resource },
 	{ .compatible = "qcom,msm8974-adsp-pil", .data = &msm8996_adsp_resource },
-- 
2.43.0

