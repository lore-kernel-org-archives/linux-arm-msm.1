Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425013BD657
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784622227; cv=none; b=XEYg3576n1k+9/mB8bczIeOov5QCRK5SejDlOHAL367vQtVhFMLciGjcnwh4t5kP7L+N7PBvMhJMuYrwIorJf6ga4PfTZCd+ziPRDMPNXh1gY0ayBs7gxK5QcWy5Rk1fr1QerkfMLZv1GkDPC9cVuo4ntI8xeDAlydyvws8/T8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784622227; c=relaxed/simple;
	bh=wGSZ1WFBCgglA8Tat+ZxlrpGgLQ01a0Za7YsMfdV3XQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XJJqJhbn6XGBG4pWDuQ6teaM4zS+T7S5jBFxy6CP7KxfN9fJIvjHwzoqgSxcmhSnYF30yCXpZG+0ntkzW18LyB9Ez8EtwO+sIIjTHXa/6d76voNsvqc8dLLIngbkMkKCYakDaybgyQ2L9O0g2Xc1n68xbKS+dmGMbGoFPzZMoJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o4E0x9MI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IIh90iUc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o4E0x9MI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IIh90iUc"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6IfN9934742
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PpeXjtCOffT6aT7diDbXW+/jlOZNYXt6w72O1CCdTK0=; b=o4E0x9MIkFZWDjtl
	WCLPQW4YiSIZO0Px41erUtL8r/A69HXcH15arxy3GHULCkgy+chhPpn1CtA6pauP
	+V/f5TFV/Wy3sATamSghw8tRMUEUcFhzZNLh0pQM815yZ0FdxouVUruKV71lYOZH
	57XT3c68fyX2DAPOlYYYrD5GaMmRSXHW1uQuLZH0q6f4hPgbMBCUvDYea96mqWCU
	pthTncgfitZub97xDVz6+ooqBL/DGVEz27sUDyI/rCG8VZmXzDxHkjf537SNYNe9
	6M3Zh24dRFK2To3T8vTgUhSbvrDwmBDwR0d4DVuTgw3vhWPcQhjznQJNnQfMeHGO
	RKi0uw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv5u6xn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:23:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0e702df8so161106141cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 01:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784622224; x=1785227024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PpeXjtCOffT6aT7diDbXW+/jlOZNYXt6w72O1CCdTK0=;
        b=IIh90iUc98zZ0j6cT6xhEu1G+ujBt/8jU06IH5NkI3B8x3wH2jYCrTXAMU07n7jgf9
         qf76PdGe1eQ17GzgH1IpE5tcN+T19NTAwAvLPJw7oY3WujAzFG8yQDUoq5V8Iuz5VRU5
         OdySIn1Iw/DRmifGKXOReBcXsy+OeqwraW6LO9w5ye8vevgzt/LUoijic/c5OegNeO/Y
         pCSbA815N75vMOXtCG7V+L9XAoR9PEg7s7lhWhu3OGqVz4gtd6cJH7WQlhCmZkAVM3HK
         xrhG3Vv9F/XqvOzo4FuaTfpA4jH2eI5KiGzkm/iRqTPWwKWyYXRWLLEjE0ZM1plCNhWx
         ctBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784622224; x=1785227024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PpeXjtCOffT6aT7diDbXW+/jlOZNYXt6w72O1CCdTK0=;
        b=T8j6jlYu8d9aNLk5G4Y5FaHs0uhZHLiuwcuFwMPvTkki8k2nQCkOkMq6F+053TsBDl
         yd3MhNgjF6NyAtnsdVPZzxaECjRz58TOc4mdDNuSBN4itoW7kje6GQcD6Z3dgzHUivmo
         nRPGWbmJpIUNyW27EDWxBE549gsW3Wur0R9kax6evTy8bT85SIfArjI85kr7tHptWf1M
         yVaXCSxb28+9E9uDdp48BxrC41LDumx5GLRURvdfHuUO0LQGYj5uOf9ucKZiRMLiIixi
         4eCxPC6GnhrTH4D110Cn4xMqt+LI03+ihqOOyGvWFlwJxMqkU1RXB+4YGJt2BxNVPDk0
         j7NQ==
X-Gm-Message-State: AOJu0YzEiuIynI0ihfqffNW6zogipxgkHzTRuonbDzcgCelXuOmL7NZ1
	4fy6JaK+rjbJBu5uSTCXV2IK98r6vAnv8CKYsQktmqwmRNElVtEQrCyQRHd2zes5/xw8klPcy4g
	NGktiOYUc2M51TTgDmCv+LdeJWWh9bS4N7GiarKf3DdUduPMftUJs2uI4x4EcH5JjWnM8
X-Gm-Gg: AfdE7cnfpvDol5T5mHZ4bjoXXXcYq9W2IF+QLXJDZYfTHkR7885UYRc3ILbxzsdvDwq
	XkrcPneixF31u9uTJzkfxHsWXTewQvdHWkl5Vh9jdRzyiIhfv17bnvcvDPRQN3FkcW454vFDANF
	P0FpPKrLwjYyFPwaDJNtw3GOyMqDxA6CXs8Zc5A1dMRwX9TdjsSYYpVJHxXNNNiwcMRhzEW+WpJ
	WQsqxVjQ6j3MDb8EvJK2mM+A/7bCFjt9Q+MdoJl0uo6htful8Gh7Fn02kkwvEzZg8cpjqlAvSeh
	QKVCrlashGhfAexzf+pEab5S57365YfE43kLwgRut4WmA01dxLnPiDUq7bDsPZDK+b3cYhU2CxC
	vZTGi2hms
X-Received: by 2002:ac8:5e49:0:b0:51c:7b12:5fe4 with SMTP id d75a77b69052e-5213f373c5cmr168270811cf.80.1784622224389;
        Tue, 21 Jul 2026 01:23:44 -0700 (PDT)
X-Received: by 2002:ac8:5e49:0:b0:51c:7b12:5fe4 with SMTP id d75a77b69052e-5213f373c5cmr168270601cf.80.1784622223949;
        Tue, 21 Jul 2026 01:23:43 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ec7ea1sm38202194f8f.24.2026.07.21.01.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 01:23:43 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 11:23:30 +0300
Subject: [PATCH v2 2/2] remoteproc: qcom: pas: Add Eliza CDSP support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-remoteproc-eliza-cdsp-v2-2-f3345405e4da@oss.qualcomm.com>
References: <20260721-remoteproc-eliza-cdsp-v2-0-f3345405e4da@oss.qualcomm.com>
In-Reply-To: <20260721-remoteproc-eliza-cdsp-v2-0-f3345405e4da@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqXyyIIOXe94NlcyPwQTkZkGoOTX8Z6WK7M5TV0
 QP9xGPNLGOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCal8siAAKCRAbX0TJAJUV
 VoBoEACz2Nv1zIaOKpZ6ygLwj7g5UyqUVMqJ8LZsgDRPZRCbl8plWUd5aDpNzbmhATMTcqbx01h
 muuzLEUqMPeOChkDhVRKahivUGZ7s2tCOt9SjCDosC/X1vG1a9ywlp0rToXSqjQ8ENp5IomXycc
 77AL1qXoMPD7KIeFLsuv2dJQulQFclxaUAademze+2My6y1WiikNhQumX27MryDfxbrqIcBB+y9
 mWZLZHDl2PDQcRPO2Rx3je1gk/zDZT9vpqWWe8/P9VZtQ6M7G8A9euabo/ooYyrz1NeFGj9G/a/
 rtGycd842xSjhkuANB0FIkl5IvylPhQ3KDUVwd4CgrZuMYUBUN3cNTzJ/QhYOpKKedlVGORvsW7
 nVgWEZLJaMTzoNS6nsbXLNThbLZdHwxYxwu8FUFtrV2qMRLR2kZpYIimZfSvox96sbCeCjgx2dG
 Tpr4xyFj+BbnlC63msQ1/ZPWdYyBYIALfNGnesQkmnmwJszme4NBPxirXodFk4Y6zb8GGWyiLKd
 vgYSNW8x7r/8Mh0UBx4jCNoUEREa/SsDIkQTfkcuEt36+nLGbe0j++q02CESc/0Huf6fnpLn7Af
 lfkLnBrS2hOp7OYtc/ZZ6KtD2CCMJ4MdOYO1QeYqdgvz/br/vAzvck3ST11P1Lghn+dVnKK8zKy
 zXyw2SMc132Tlfw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: vRQy5LrHQ61mguxR5sGmKJZ_XwBxv-qq
X-Proofpoint-ORIG-GUID: vRQy5LrHQ61mguxR5sGmKJZ_XwBxv-qq
X-Authority-Analysis: v=2.4 cv=e+U2j6p/ c=1 sm=1 tr=0 ts=6a5f2c91 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=yW1A7ns81NOMPIjzjlIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA4NyBTYWx0ZWRfX06sdTJngfad8
 XJUqoaQkSuKLq1sPR6UytdhOiH3ZeT9Wuh/wdLHDbUsTL7mlAviwxp+MQZ3Pu/MYCzP2YdzSEjB
 p5NQp064YZkfkrtppDMJ7pOdNlC5umU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA4NyBTYWx0ZWRfX3Mp4rcq72B3r
 L2Im3rdPqFB3qZp1jvphvHyNpkJZWxz1BbzcQoKtkEsliORT1qBZX3FJmTwn9G/H4qGL8pyQyY2
 KIPQZa3SiU0VHM7+PMjFb7qTCjbea1bcZ1x2g634fAejN/6SDdUnLrkaZYGHJv9eax/aBdDJKnq
 xGEN6e6psZit/J8BQAng71NwG3ad5m1dJ+f1CN7wufQJrLCv8Y+k3vlWQ8wL54Gjqsr/8zPy7hB
 IeYHUF/IpEjbdVjUmo6QRVkfFkBn6Q2zf4yswB86Mlyn3m2pZYF7nIDDe+GVRwjJ2EAS/zLigX8
 I9PhsmI7iCpSJ/a4zSLuC3vIRQjEg9wJHMvY0zQ84jIj+SlRQKn4oUdff1m5sqOsVgdzjGWpUp3
 2y4WTmLyUthya5AIpY8Vq16gql/fWWMq3EpNHDIgZkuI31r6HH6Kq8QvC6jKPaOXRNE7rQaVFdU
 o/q2aMeupQvqUTLJTHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210087

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

