Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475E039D6DD
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784643628; cv=none; b=XJXu9mobr14/C2TG1S0rB82MEm9/IQWyxzGVn68kwJOHcsnky6yuy2pqkUZtKHr97lcdpSTjj6O/I/UY+WVPX1U0CUyCwo5YcUDOZgzCYf4rj9DdjNqrMCu6sse+5hSs14NhUkCBL59s7/Fgg7mI0BVW4uDFNG5xpmOBZ5EnTpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784643628; c=relaxed/simple;
	bh=wGSZ1WFBCgglA8Tat+ZxlrpGgLQ01a0Za7YsMfdV3XQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VmiNiV2x04sVThIMfIznZeOOXbSqniQWiCODXFB10NX4K3KtBmW5ZCRjOOdZcjDqMT5VwQpJZqKWFR/2DiSvlCorLaMHkBE9LrC9Wf4V6TVribgTNyoD7EYdC2xABUHGujCYSKvEVJcT/JO93CTUuBnbZoTSGowGjZC+WZapAE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iYLwkYLd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lg8B7CfR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iYLwkYLd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lg8B7CfR"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg31W2071817
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PpeXjtCOffT6aT7diDbXW+/jlOZNYXt6w72O1CCdTK0=; b=iYLwkYLd/zRfawg5
	tCOYSyhQLNjyBzXo+6EQVobAfIPV9/P7W0oxy97dOIFoLLIyIyfPN6HPmKHUW7oq
	mrS/fSHtr9/xHm+l8o/nB1gEKtKssPGWhRJgjzVPuPZ0LvQpEEzWM47pMnJDaHQv
	uDaPzVxUpmw8j6bK1WzD1iwn/yWtPh426I8xqPdpcWnmu9NAhN+mWgkDSak5KmLc
	EPz2rILIXqAsUVD6lqrPLrcAYpwr7+eO650TuRrHXNR+zyp5XlZeyzYc9V2bfF/l
	q7/W/yELeqlmFchDDuKxHP0yWIJkIISi1Aylf28q/w9ADovmAciNORYgRUAmdfEF
	Zvoi1w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6r3h59s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:20:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0f0a0760so273647281cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784643625; x=1785248425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PpeXjtCOffT6aT7diDbXW+/jlOZNYXt6w72O1CCdTK0=;
        b=Lg8B7CfRKiMV9S0NvdrYPnVbQRU4HXm7n55KHuletwHPNhcNLPlkU2vtrJAw/I1x75
         9lZgokqkHCuXq48fZ5YGRIgCR0wRt30Cv4ZADXOZ6E+XVfXp0T1tTVq7DouAtesubYc8
         0nv1tGXIWtx4xTJZ6llcd3okTYnIoNmmQbTa421Piq0O/IA76Uxu2YAoX0/namJCyge0
         9DQzeyhlex++DONkBo9ceVAwN5Likg3I7F393MEDuO3NgNakNn941LKRnlaACnC+XfUR
         Z3q24/KwIGShKK03Nl5MgNGrYK0k0oQxirjtSObwx7OpI39q+0tcHaoOA2UscT8vyD1a
         amXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784643625; x=1785248425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PpeXjtCOffT6aT7diDbXW+/jlOZNYXt6w72O1CCdTK0=;
        b=YbMHVT3/KGfKMIcoizWyzmJv9Aw7cZCy4R/+cttfjWPr57j86H2efzgQKBq8YRtvXr
         +mXu4LmFqU8xGtnXPigzC2KCD080MCKO1t6cbkDj5Q9OLyG1PMbZnaUenZV9Kh2RDjna
         8vvnhArL7lBqA0/l5kzA0ONPeoeiaHIGg78Tw72jNCEyyB8AhFsoOwds4TtzlP84rfKW
         493M77Gm4+CRDe9w9PU+Xe4/d7LsAD9X8WiSM1UISvGA3QmFlK8ml9velaxMj+9huidT
         zsWBpQqYxzwLsSW+vZ8Alval7/sE0TaVlWfD8Tgh4h6gbAk91ElUo2WwH6vzENSbDkVN
         9PPQ==
X-Gm-Message-State: AOJu0YwurV/31OCP4Gv+eJqialE/DrNQlWZlJnAVdN4lCzyjYX8kjGV5
	s9/6pNr2pxcM5yqTDPsJ3jDQTbShhN0b25LD5VfjnFNgqQo7uN9YL46ofyY3qSyFIwD3ACT1a6w
	fZtLVe8BFHYj2K7e5Kp2ISjIIMH+8M52zjRt8QGM/ZLrLs/5LN+ydlHWN5c+UprFrtRGOIJBcrr
	0Q
X-Gm-Gg: AfdE7clbxQ3o+gAq+sZw9gwqLROaFgcgl+U+7T4O8rfaiPH8SZp3PrwZAZCUhT2nN3b
	tZp/w5sUbNcwCj431nmii5V5q76K4pMhkDHxv1B8EEGcHAosM2Fg1wpJN1c7hVa5gUUTIrbXC4k
	x97llE+LTb1JlSbCWNiv9vrTKt6iH1kwJ/pNXscVNP+BSxaIXlr2VyhHOnFO7pgoiBFWSTtSKei
	8Z+i2UdJQTlh3P7rtneDkEH5BhcthDBVux+vGXjGbYnhF8jJohHkX33tcZD8P0Rqx3vrnZtkTCC
	wqwWzFoTBuzEKParavagu8aogI8BSD2m2TUO/8tsQ8ZqS4c/pUvFICr+qy1RFNjfrLhHSBryt8k
	u5YaAB4WE
X-Received: by 2002:a05:622a:13cd:b0:51c:7b11:41a9 with SMTP id d75a77b69052e-5213f959cc5mr175277281cf.86.1784643624910;
        Tue, 21 Jul 2026 07:20:24 -0700 (PDT)
X-Received: by 2002:a05:622a:13cd:b0:51c:7b11:41a9 with SMTP id d75a77b69052e-5213f959cc5mr175275161cf.86.1784643622840;
        Tue, 21 Jul 2026 07:20:22 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653687b2sm84762025e9.1.2026.07.21.07.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 07:20:21 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 17:19:58 +0300
Subject: [PATCH v3 2/2] remoteproc: qcom: pas: Add Eliza CDSP support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-remoteproc-eliza-cdsp-v3-2-557b5d02fdd9@oss.qualcomm.com>
References: <20260721-remoteproc-eliza-cdsp-v3-0-557b5d02fdd9@oss.qualcomm.com>
In-Reply-To: <20260721-remoteproc-eliza-cdsp-v3-0-557b5d02fdd9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1794;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=wGSZ1WFBCgglA8Tat+ZxlrpGgLQ01a0Za7YsMfdV3XQ=;
 b=owEBbAKT/ZANAwAKARtfRMkAlRVWAcsmYgBqX4AY4a2V5yZC38XsdlfyDwSXmOz9wrRRsQyQ+
 0s2Sxl9RCqJAjIEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCal+AGAAKCRAbX0TJAJUV
 Vu6FD/i7KTv+ZNkQNQogpuSPC4E9k4iKNx3wCZbiykRxr4jH/AQOuc2O0f6FZ5xrrZRLOP9lC9G
 4m+MVgMwX/nnmoPZjdFKfDtCxbtR/DFKRCUXEv5mAqjF7jIJG3SGqBdc4JYnPoPdfQ2u1lEMUGF
 //7/CkZ28QvN1NzuRaQWzc0t6ljUZFFKRdt10Kii84iSROSm33SVTFz0NBYCORzOUiHg9WsGC7i
 AxjrVJIVzQbe2x8zPaMllBMJi8Pw7T7VU4IX3eCHbDALbYKQC84Ia4S2jDXOs5Ic2uGDotitlGz
 tNoZ+LU5i8dhpmAE0T2CKFoyfB7fAA0P2BP1EnhrjG2ruoC6zSEZi1XNduLgwWDrpbaDvGsS0QV
 cnGNPen8WLHhfue/nuFejeqPYquTWA4vaedFg4sc/4xdmZsQP2euuA7I3Zt4QlFixkgauu94AO4
 ab7YtUOqpE5P2t5ZcIAoJ7ZABCeAw84HxiYkvH88r0IrtuL0JBYcTkRWtSkFcp0uIm+NPLX5U9r
 nOD+Sg88OgDnMT7RQel+bqZ7sIoPHkwzNDSKuhOmGkSqtZwceWlWUrScAq0d7om7VNvEUV2O9d9
 PaDI9f2UE69punqTI0qqStw9FFAsmt2BKKb4z6EiX32XVSJ0BbdnBpqYsWlwSr8YhfL+9nxUuf6
 lLUftiziV8oCc
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE1MSBTYWx0ZWRfX3moMCv9A3SNz
 iszodGF2OAg55mSx0FFEnohPt13pJHvB4pmFdj5AL1c1hlBm2fpfdzkSpVn5yn9W782ZoU94vW4
 RlBVQrP4oMkg+Thx/kwrPFUnyepBjsE12B1Htvkont0bC3Jgx7hE5Nj7f3uGFdxnscrng05SGal
 GS3AI5Dzq7Ec90wu2lj4l5Hf3Icr/funNqPuiSUN4Ev69eTPednJMl5aHYj6d/+iAyILdP6lY6o
 kqaoK0D6n2iBA2OKGT1ij0ZmzsQaugXpNzwfeW8UxS7MfCqj2OnwEFkr+S5ZA4BYwThR+cgIJZT
 buv6WH19fGq/yYlAmQVImrULIHSuKejaZH2eCBtfIeOmPjXZOQGXkedV4Bwsj88Y5Lpp20P3fZe
 HPJlU6x9ACTMXvTIchMAxiJgRLdwFnMfZqRTdir0OH1/juqRgv3MetDMpwhZiDmJZ6bE5Dtpt+R
 IVfq3G+nV43KK8cl7cA==
X-Proofpoint-ORIG-GUID: TdDC4dwwoGLD4CQxZdPHbZ602gQzUfiW
X-Proofpoint-GUID: TdDC4dwwoGLD4CQxZdPHbZ602gQzUfiW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE1MSBTYWx0ZWRfX0n059fMZ02Ck
 mdN1tqBawWlh8Vy3oxhCD1JvaOC/tRcX04ol6+e0sLjqssfSULZadjjVqjSEH957E3Ss1JTX4fc
 aetosFOpQKgL1rFqfp7NKOm7oeFkcdE=
X-Authority-Analysis: v=2.4 cv=SIRykuvH c=1 sm=1 tr=0 ts=6a5f802a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=yW1A7ns81NOMPIjzjlIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210151

Add dedicated driver data for the Eliza CDSP remote processor. It looks
almost the same as for Milos, except Eliza needs region assign.
Tie the new driver data to the Eliza specific compatible.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 25599d728208..c8313c61da94 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1687,8 +1687,34 @@ static const struct qcom_pas_data glymur_soccp_resource = {
 	.needs_tzmem = true,
 };
 
+static const struct qcom_pas_data eliza_cdsp_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mbn",
+	.dtb_firmware_name = "cdsp_dtb.mbn",
+	.pas_id = 18,
+	.dtb_pas_id = 0x25,
+	.minidump_id = 7,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		"nsp",
+		NULL
+	},
+	.load_state = "cdsp",
+	.ssr_name = "cdsp",
+	.sysmon_name = "cdsp",
+	.ssctl_id = 0x17,
+	.smem_host_id = 5,
+	.region_assign_idx = 2,
+	.region_assign_count = 1,
+	.region_assign_shared = true,
+	.region_assign_vmid = QCOM_SCM_VMID_CDSP,
+};
+
 static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
+	{ .compatible = "qcom,eliza-cdsp-pas", .data = &eliza_cdsp_resource },
 	{ .compatible = "qcom,glymur-soccp-pas", .data = &glymur_soccp_resource },
 	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },
 	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },

-- 
2.54.0

