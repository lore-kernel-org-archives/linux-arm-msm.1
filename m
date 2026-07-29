Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7250A38399E
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 02:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785292539; cv=none; b=IP/HnzVAd50UoA3LK0cr5ZcEH7O3YZmX98I1vcTIUmty22FUJzGZPjFuWR7qOLuDu4o6PZDH1vjRPz7GBtjXxz1XeZFqpZ3qXZqKPQ9qGPE0e3TUVZOpQPQ5deWWTdRWBGfVMHzGOrXvaBOTw36WsWP6rol76S+sbvJ0UfewGLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785292539; c=relaxed/simple;
	bh=8u1GSbsfaYTfNXrdQItHPwzfti1zilXJrY1mH0HuC3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FumDFGBmfR3Qdt3yT9or59LTguCYpTrOsFWX5IGuOLAmHNY8Fn7eM8hCGKUb4TjiZF/nmSngQRKUirEE0tHefFjdWjjbHjOpWmnHYfBY7ZMQlayCZH0SdTkH6s9GaF1ZQt8sTdookUErJcWHpBv7KNJfIouJeQXJOQgZnZYW1HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ooiBeaac; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YM68xKse; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ooiBeaac";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YM68xKse"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T1Gx1A481790
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 02:35:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HZtb75BVxHc
	RQYXShTKNR4AwOf5NsXa9HffCC+I+pg4=; b=ooiBeaacZz8oLWTpSwOpjbAabAj
	L3dxqlR3Y3UQqUFqVMFNo3QeJtGW/WsQAQBVnV04/MSRihEw/dlo4FV+PEHyXg2x
	O/I9XOCUzmQ1aMNd1dHihISF9ByrD4sO+2RAaNrpCec754XO1SVouFHV2qjo8P/y
	+vjavzOzShMsiBZk3PErWsf+CtW/VyRXLTXOtGh7ESq/he5RSqUQ0FaSc9ryAvqL
	4Cus49Cmod8VWWI61kj3tHRvy3bO4/V5YkpnnBczaMTfAngaqqqbTbSfdZLIHcnN
	2kUydWajY3jtUg5LoXGOictqJhyTt4vfxuyLz6GFV0eO6wP9ktrR8uTSpdg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq0q6stgy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 02:35:36 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb835525b13so582223a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 19:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785292536; x=1785897336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HZtb75BVxHcRQYXShTKNR4AwOf5NsXa9HffCC+I+pg4=;
        b=YM68xKseBCofzx9vlNo9cuE//LlUZc7U0iiO8EYM+BEY+dPqcyXji7EuGglxZGCLlO
         JHt3oD98CYqO8O0M3htN49k7ar+zO9UKuk8Wp7SJj9auwZTCRAnsn7oSx0Ha8M72omgY
         1PjuktT7tg/+kNLHXb8DBpYBs2/ouNjK5W5tMuLYuHJZTSw7DqO9rSz5ogk62EpMDyue
         m2ngUuDflJ5qcw5XVC3P641zxRcfg+gzjtI2BF55Lu86Q3KFUKP/TID+tDCqTzD/OOjr
         i1cahxKL9xjuqDuhxFyUO/pOZ2/DEkgbDiBkTZiR5enFB1QdgtsI28Vhm73gBJ0FvBWU
         FSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785292536; x=1785897336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HZtb75BVxHcRQYXShTKNR4AwOf5NsXa9HffCC+I+pg4=;
        b=nZBFYRZvjeD5/ue69R59GsC56lBUcnNtf8zLZyxguj5QOey65MgSlbXjr7Rfit9dLR
         +WlcbfLtYEGupduuQpYeuw4+q+QynYAaZSGx02TQK5BUFOs/NESvaYwGSzvF8r9Lhsjo
         +Tm6srLghPdLAN3W5I0lXF1rgJIMMYmSjl4BAOCgG2tkUQzrODCYRMsvQulHlmpBnMAE
         lyFcO5OzBpq2Sb4AhJfrpKw/4XfOPEDbcZXLsmDZlGYLgPQVoCAWEFIirUpW1+9jOk0G
         uN2ngKlENrh9ORONFFUW0jQiGqm1yChMjkHK0k/e3pzAa8yhwF4noW9L6A290b0AVM8B
         2ZQg==
X-Forwarded-Encrypted: i=1; AHgh+Ro2BN4S0ZThAb5MQc8pUB9yrK9ABBGvSpr2NEAUF5mwRD3unqzV8MgD+dzVyJVRsjpfKr0mIl89iqGP72X5@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvdx7T0JIqlSIYqlSyj4ACZxPqnp2OrD99MK3nxtsN6zYa+m0a
	Sq6cw+Lh/fFSh05pCm9toTDNC+CNki/M+fhL77L+RpQOGXzd3lMpaZq1ghGJkUMg/1ebaT4066y
	cvoeh49HrfiCc3PnK/ea5JN3tK09N2ALCxmcj4QD1AHknc4VTX15UNr/NxlNGrK9KfCgb
X-Gm-Gg: AR+sD10aaQcwEbVxitVU3rCEhMtWWOsXKBYl7YS+lBKfVzS3r+YO3OVzm1wH/jsulpf
	0KSoWTtfK6Rp4liAc4LT1rYAcVoDv7Vw3Da/vEN/QOAgxpwyv8nRKWrBj/uuSISfEUt0zCG4xrC
	Dd7JDGjY47r+Mq7rwT+fe5tTngFjFIlzdO1X3BwyWVfX86cith8yUX3ig+4cakkv/tciMXSMjwU
	jKTbq/lgiCMY+c4K5R/Q6oWlK5GgDw8/324MojGqzGCoPY300KXh1LCOG6CAn47AIwhAA3oMMvL
	o/dEGk39F0swNhz0kLcF3HiVyfs1HuwAD0JYjrIo41doYqRn+NX7c5ijbIJCcn9AdYOE18+RG5W
	kssWlHJeJC0dQVRZTR0n38j9tPjroEERov6a/v5OTcwxMgHykyR5bY0yaNJdR
X-Received: by 2002:a05:6a20:9f09:b0:3c3:a490:9674 with SMTP id adf61e73a8af0-3c8ba627b2emr5922375637.64.1785292536025;
        Tue, 28 Jul 2026 19:35:36 -0700 (PDT)
X-Received: by 2002:a05:6a20:9f09:b0:3c3:a490:9674 with SMTP id adf61e73a8af0-3c8ba627b2emr5922348637.64.1785292535614;
        Tue, 28 Jul 2026 19:35:35 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7265be48sm3899837c88.8.2026.07.28.19.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 19:35:35 -0700 (PDT)
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
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v5 3/3] remoteproc: qcom: pas: Add Nord ADSP and CDSP support
Date: Wed, 29 Jul 2026 10:35:08 +0800
Message-ID: <20260729023508.879752-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729023508.879752-1-shengchao.guo@oss.qualcomm.com>
References: <20260729023508.879752-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uiLjXlY8V1fwFc-MHLly1yDSz0G6rHnB
X-Authority-Analysis: v=2.4 cv=DqpmPm/+ c=1 sm=1 tr=0 ts=6a6966f8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=wKDsrv0q4RgBVPAhY5MA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: uiLjXlY8V1fwFc-MHLly1yDSz0G6rHnB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAxOCBTYWx0ZWRfX7idpA8Cstsoe
 /bMaJPuJtD5moYnWl3W8jOxQzcEJvXPV8kGcdmgFH0aD6hIAoWiOSeLudNtU/WA7BPGvE+VczcR
 98qNYb6Ub9jVzxv6J+e3QeEYlgsCpHg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAxOCBTYWx0ZWRfXwMM/NnGhA7PC
 S0FaAaxsVBGFDIDHK9u1cFcYGITXBtBDs7EtvUqWWP/L4Z31FpV/nLSSF1kjnc1Jx1zwEqgaBQu
 uKRkjSWyizb9R+PKSB0MFcI0Q/iSAmDhUS7xiOZc4zySwIweoiXgTbGV1d4hKpXR9hnMiF+GeyU
 Jxohy8/UaUH2xFLCmYabTTlmrx1ttVxm4TvF1cWQX4IF/LUoIpBjk2jYFqU1x6/QZMsTyB0LRKA
 wPBCedJluDSXUGuMbwhreNC+g+mWQIlLQemd0r0T4+m8PHFbZeXjOsFUPQ8MQJmFMuylOuZNHYU
 GfG8K6SXSzl/SQFr+TCf4i0m8Pxn7afGGmVDCobZ/GlEFquLmbHPJBfMtq24dRkvpN375SGb805
 Hz+OLviSVdCZy/EojLB26e12tQbtbtSdUukT+rUSvlXLf5sNh0AOm5XnlmhrcGG2PfNG5pnjg5d
 T3qQMKPz7ojAkPEA8cQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_01,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290018

Add support for ADSP (HPASS DSP) and 4 CDSPs found on Nord SoC. The ADSP
is pre-booted by XBL before Linux starts, so set early_boot flag for
attach path rather than a cold boot sequence.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 110 +++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 25599d728208..a4b233d92efb 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1434,6 +1434,111 @@ static const struct qcom_pas_data milos_cdsp_resource = {
 	.smem_host_id = 5,
 };
 
+static const struct qcom_pas_data nord_adsp_resource = {
+	.crash_reason_smem = 423,
+	.firmware_name = "adsp.mbn",
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
+	.firmware_name = "cdsp.mbn",
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
+	.firmware_name = "cdsp1.mbn",
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
+	.firmware_name = "cdsp2.mbn",
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
+	.firmware_name = "cdsp3.mbn",
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
@@ -1702,6 +1807,11 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,msm8996-slpi-pil", .data = &msm8996_slpi_resource_init },
 	{ .compatible = "qcom,msm8998-adsp-pas", .data = &msm8996_adsp_resource },
 	{ .compatible = "qcom,msm8998-slpi-pas", .data = &msm8996_slpi_resource_init },
+	{ .compatible = "qcom,nord-adsp-pas", .data = &nord_adsp_resource },
+	{ .compatible = "qcom,nord-cdsp0-pas", .data = &nord_cdsp0_resource },
+	{ .compatible = "qcom,nord-cdsp1-pas", .data = &nord_cdsp1_resource },
+	{ .compatible = "qcom,nord-cdsp2-pas", .data = &nord_cdsp2_resource },
+	{ .compatible = "qcom,nord-cdsp3-pas", .data = &nord_cdsp3_resource },
 	{ .compatible = "qcom,qcs404-adsp-pas", .data = &adsp_resource_init },
 	{ .compatible = "qcom,qcs404-cdsp-pas", .data = &cdsp_resource_init },
 	{ .compatible = "qcom,qcs404-wcss-pas", .data = &wcss_resource_init },
-- 
2.43.0

