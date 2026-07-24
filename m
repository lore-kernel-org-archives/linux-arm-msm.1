Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F40A41DEDC
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784889583; cv=none; b=oo3pNatCvAXr2h1TZoHR7wKanS55dWtzsIhMIVdo7zya9hr3DCHeMHI7deU6l24N0ah9wqk1pxNvB8MJ+wYx3vaPeOYA8ogHSOllNDRKqMzgrcIkcYr97JEUwzdsD4VKQl/CQAeHZxHWiEfQimfU5q/obtKfL3ABdy3qIsReTUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784889583; c=relaxed/simple;
	bh=0YzZDwNOI/onVZdiLZlMM47FfMeGDrDDZthxQwRvTgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BQpFDKYaJgd6MJP1/Rq+ml5/IjM22O9DPNFJWaTqETsjuafRB4v6cof9mvCrmexBkELc4XzN9t/H73ELLPm4ESv6bJfWEarDuHThpEPHGSRLLPd059V7jLWO0jFW9Y8lQUAgJEffSxTz1aAxc9uqeYnRFgTMQma5bhlcKDTqrAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dAQdFop8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BLuw9vcg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dAQdFop8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BLuw9vcg"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OAE0hv2917075
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N4TIXsfQ0zT
	s/aF6LfD8y7lVY1UMz6f8WLChqvUOxFA=; b=dAQdFop86ntSkWlsPIDiLmlm/SA
	wE9nm9pxDjBFAeFnyYb2tPDNAkvZaFOpLYafoXnK2BlOeTBtrylI+zgH6rcLdzE1
	fBG6/NYL4OEbAHUw2WmPUCT/eV+SI3Uif4uIA3nrByTOse2sC+9Rwdi2U/anGYcX
	XSGA2bSQaahuVH2yK7MeqquSEtQM14sKnR1CInavKssKpdAYYwgurBM7m4ls568K
	8ke/QSYNkdNvFHTuGYt2clw/TQHyztfOj4jIyzDve7UluoOU5PFIlnIjyXwjukns
	DiHOKju3L5g7iJb2+ZuanyeKP5YLOUU7GXqEtN2extMVQYv8YOPasO8CxAA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkp5vkseh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:39:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso296476a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 03:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784889576; x=1785494376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N4TIXsfQ0zTs/aF6LfD8y7lVY1UMz6f8WLChqvUOxFA=;
        b=BLuw9vcgWWcV1DZTKBEhqKwB+oBzzXUkUTTJtWXs0r8SnUW1ZsXUknu5AIUK6hUDJM
         mhwZ+PGLnD3Mpe8gLCSQ2gUkT+lCORuqDDbJBMjbaubcrK3biSSwSLtjm1dP5EXIxdr9
         79SRFU9URlICJZV0XJgCfNNomrcdIhmS8GvJQO8DjnFpIFi6H3YrMLwQgeBxUfcrH6lN
         Tmexhu2qUL2sd6OVEuGvdz27OUBZmFFVf7LosR7dYIhlAhKNJKB+j2xyHBKP7wigqef1
         WIfccHHgCIkVO39oa03HNn40O0ozr3zo/kAazhO1ZNtK+FgZVsFlFc9z/NaA35JzA2U1
         cIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784889576; x=1785494376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N4TIXsfQ0zTs/aF6LfD8y7lVY1UMz6f8WLChqvUOxFA=;
        b=Flp0bqNmEQxYn94+4SaCZbQwVpoLPabNcvnITLYKv6QkTyr3KWnuvTTHABYlgyOsS1
         FG8m77igCoNWsPlLCjTLmiUYBNKccgGfl9yQPN+amC0y8T25Kl4oyRDpVnHxeCbD+Br3
         1nYBKZ/RVYIxDPGbtMwfpm+2Qrvy3cAmkt0j1vum8cIT3v5vmeMkpieyoUHFLoo+Pa/w
         oCcnJsIOeMfeTHzrW9rgB+rWdXlvDpLgVw5uDgOt599CP+rj3/GEtNV2bzWFRw3n190/
         6a9R9CBo9/MxgA1guN/fs+R7s7X4jc5X4fi3RxW0e7MOvD0efl60qpkfonRPAs2/wFXN
         14CA==
X-Forwarded-Encrypted: i=1; AHgh+RpQZ55woBzlS2yHRFmGWJd7/tGAOl86l4S1JyEFngWWx/FcPMb7cF0KkKZEQrU8oDqZymq97y7aagAhNc0G@vger.kernel.org
X-Gm-Message-State: AOJu0YxVfQ0pLWTzbc8UWZ3z3xcC5DJRSP5kDf0nCzNoUNC/3wwZ+zks
	HfVxavkI861nJ6Bx/gdZCIzhDX/bw5sze4Hx49Q+4Tcc5wtSeUvFLI5AANrAYWmY5TpSmzg9v7t
	GeTInWj+aEnF/k0RCajgutaZvopBXKJ++lZG7Z9sQyIdiN7DkGNLXj8UGwkJhnpVPsQVl
X-Gm-Gg: AR+sD103aeLOCwoY8vXINepoJaXo+whDFgqLD+wsXUqPe9IUQ9mPjJ61MljYTljVb8T
	E/X+bs+/uoXAzUxAsvl8sK8EW/ssCRMwwd6plqi3ez11KM/FxnEICiUc747rxYQ2L3uzPVfVq5m
	D5dGTXhS00b2oNJoicuS4jqXB9Lcop+VAL5rzNdtjN1tX6VwJDj7ddn9is3n4FOn0YTxdZa/gcJ
	wx8SoW04PYU89xnah8Yl8WuGh26TwXT40x/8vZplrfGf6pFNKj4FjsJ+eFzaEroePDkhItf7bWs
	B3If5uMTlvMCe5EOG1wQbNSeOwFrl8sVBK6ahYeME902Uc6EbpDOV/zW3J3uxjz904PnIITuRUw
	HEADOPrMF+1CJ1mIwBCKIUe8QhPGnRqnSnW/OpZE5b3xHPcRSGAbLzEurX/u1
X-Received: by 2002:a17:90b:1d52:b0:38e:75f3:ad4d with SMTP id 98e67ed59e1d1-38ec69575acmr7158880a91.7.1784889575797;
        Fri, 24 Jul 2026 03:39:35 -0700 (PDT)
X-Received: by 2002:a17:90b:1d52:b0:38e:75f3:ad4d with SMTP id 98e67ed59e1d1-38ec69575acmr7158841a91.7.1784889575244;
        Fri, 24 Jul 2026 03:39:35 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130262d2sm22495290c88.7.2026.07.24.03.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:39:34 -0700 (PDT)
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
Subject: [PATCH v2 3/3] remoteproc: qcom: pas: Add Nord ADSP and CDSP support
Date: Fri, 24 Jul 2026 18:38:48 +0800
Message-ID: <20260724103848.233804-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724103848.233804-1-shengchao.guo@oss.qualcomm.com>
References: <20260724103848.233804-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5NiBTYWx0ZWRfXz8GSY10yQ3UA
 NIvbNyLC51HheN+JzrGuoa1n2DGLZpp293x1WrBbkZPdeculoUnW2bkRNpEnGAxWMWytjfSpZVS
 rc7EPUp8ippiGJSgz1pGy07OwWAkzio=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5NiBTYWx0ZWRfX9Y5HIDD+udwp
 w1LUshVA3DuH9ETJaQJY085wTuRVKnJfuaCynATTe445VOcOSX+642DzKXPWy0foxOWKbE8G+q6
 Z5yff4RyHK13LxMwtp+wXHW6llH21+HOWnTG9Zc9lPGNHVb6xwKQbWElEZqIXgqgLrKRNR/r3rP
 K8oiJNGAmstjnyjIys7mxKIWBIZmV+arelTKJMXPg+2w4Gg/+hJevM0zcdQunvMPg3+CcGWm8Gd
 EiwJv44jORNLtdTzYuOuBljE3yMtsukpJte7sxDtM/BJSLNh+daoOMOdyxuyLAmBsBeN63TKI5y
 ubmHdqistiQ3FdKLKkSdlg3PNadswbov/6wkYbWNwMiPM/sDY2k+3GVwo/3f9JoDOQalY+H/1X+
 6LNV4KrPyU7ZFIWncUr8U4K9thPqaK0h0BWH6ICctdp9qILfcH1IYU1tyqC5Gd2u1KlxNKZzOT3
 dEKosvSr5Eqy+0q0F6g==
X-Authority-Analysis: v=2.4 cv=Z9Dc2nRA c=1 sm=1 tr=0 ts=6a6340e8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=wKDsrv0q4RgBVPAhY5MA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: _eLhxcAVRyQdm7thL7C8pY5m1WVbaM8c
X-Proofpoint-ORIG-GUID: _eLhxcAVRyQdm7thL7C8pY5m1WVbaM8c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240096

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

