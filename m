Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950853876A0
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784379424; cv=none; b=M4FffEPSz+4NGuYruUZPwCVO9XDB7tmFAwzbGJ0dMwgCxGAGSkvRv7/VWE99Rl+RAHs/7f3t8IlkZJG9sNTHRnYwMnE0x/fqaTcPj51BEUZVhq1ZlIXj+yQyzVCxjNf3hyqW6nVz4Q9W6dUa/2KzxScS+wPyWvG4AOxU+YjojKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784379424; c=relaxed/simple;
	bh=JEaURC2GAdKCpgplPXU3Ks3O5o4wm8ukuVJ+QKcFKVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jBJiGODVe3RtZIeHTIX8x5QsN5/0rZDZwerPiShDGWcee36zQgT2Hkjo1HX9kzvM8+uqRiJjKvaUahQxT3hwAhJU+fklquhMsuuaqnHuLQH6tObVuF8S4P5e5mIfVFuIic1P8RWh/YwnQoNpogFkGV7d9ZgcwpN5jqsKn4oLOXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TI3SbZ+m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WM4SkcG0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TI3SbZ+m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WM4SkcG0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAHGje026833
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:57:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lZ1Uf6e+y02mf+hZKy5MRhfEq5rAXBY053fgenngL8Y=; b=TI3SbZ+mmehC4mLi
	ti6yNHOFTHhL6kaRaxMmK7rwgGdWz/AciVvrur7MqlwOUd2sGh+6SziOOx4ffyHe
	PlCCxxT93iOHIDm4vi+gTVp046GvZEKG7xCOeRKsVLltqh6FEU/Cmj0KaOyBYDUH
	cS7SY/Gr7C3fcrdU0On0ZzWLzwpMPkEzSmCtT4kcfP0dKydbrHkReGbcTsy+N6pE
	gxeXXctb+G5V+u2Ek3ROigKo50ZsCUNNtGycntzTNYIzwq4qvkNrHSHbGpWeagpD
	sOPRqT3MAwkfIkt82vBNp+DMPv4fNqbfg3+CgI+32bvB6g+cmfDv23h/nChp9jZn
	kgmIwQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2nhgqrp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:57:01 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38827cee19eso9321925a91.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 05:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784379421; x=1784984221; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lZ1Uf6e+y02mf+hZKy5MRhfEq5rAXBY053fgenngL8Y=;
        b=WM4SkcG0weEwkGHA7cBNdw1ABExgjcRdkVK6BGlzzeFaxPxFJUkDaTeq53CAwUF7v6
         SzW/qUMiLbbaaukt3MLQwBj8lwv9ZgkS7JVPz9w5SzYmE0KLLUfnn6yCx31vxUpWt5lS
         G/Mz1nIr65CWspeHz6p/Hc5xPJzAM1PHVn++KcXQaWQfbZ06lWdxcLnhzm5lMhpyQcve
         D5ci/sesEKeZYCsRekpVZrfE1TqiDSPvqHBA5sj97dQV6VKRWD+MR243u9DU0Hxw3407
         LlWA3kONQ1BiS38ig0V/cb9tBUAsb+T7ATr4OBD1EZtuqbkgMtZsym3z4mWQ4Qhx6Qmj
         wZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784379421; x=1784984221;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lZ1Uf6e+y02mf+hZKy5MRhfEq5rAXBY053fgenngL8Y=;
        b=Gl+ea3WDPSNHc9lZ/lEm1FVFyzC2u+aocXMB4uT5AaJ9Jz5ucNm8Tu1+7uef5XlMtC
         YXDv1XlicTrlCiuhqXRa/yoEmKtwdDNOQ6wbm+VSAl/K9U6YcFEF54ZPOFm5Ddx1Pmko
         EaJu5QmzYEMvsGf6toRYF7Rzm3AUYAJNu7PRD8TYXuULYpjPHd2ph/BfJsJ6OgY8koVQ
         0YcS6vgf3xedcabtEPkshFUIyglScu3xpPy8YL1PfRLzEDYSsnqPoWlxhl9qG6UMYMF5
         rqxdL6N2Yo6WMuxY8h9jqa70PtUC8QzEAXsgjUdTq8uFT9m/7YWcCfUSjMYaLquGYKlS
         tnlw==
X-Forwarded-Encrypted: i=1; AHgh+Rq06b4DcoDTDHIIo4h4hefrgdSv0TX8KlRxsRDa9/1xxHv5/H38wAg8XGOdhrWXj5jWKgfIqwBT91QGL/se@vger.kernel.org
X-Gm-Message-State: AOJu0YyxKdU2JJFTRuFnzHmy1B9ajjpHfbhmJEqzYrIoPGvwSa7A+9DN
	DuFsjFtX/MzY4Y0q7TotgvhmS3L6N0vOcr8ENTTf1MyFHMFXYizkwsg76/DMS2aClZZjJEjZ6NA
	ruuq6fsAm/p37STBUsJcDHWxsIv+OwHEWY41tzG5WSWyMsw3ka1rYG1PcPllPW3WdvmBT
X-Gm-Gg: AfdE7ckbfB6mdGl12DIM079BgirBmDC1n1RAw8icuo0Rp9VdLHGMoQnDdh2MIC5c7t1
	MTyc3rf9vW5b+mexCaWoMcZbQsQeRyz8FlREA06fHPyY4NdjBifdc02k9oocXCsgLve4LKFJ4Kt
	FYep01EK37ne4hXSyyqwwofbAiSJWdLQ62o9IaddH/OfC5wAgaeU+hP1bivn9YiNMJlaj11ZF/j
	Py2wa/bhxrAnbW8YUEsk+UYgK/iZKpTFTfcw3UWQO/AfzBPW/UPx5Pp3qoljXvcNfr07fBCcP6+
	lBpT5m8qCRP1XxcAT9Vu4QcpKrXhLF5SUTY4FkbwPwEJMLGRLrVUAGGUgCZ83Y87ufUoi3kGFc7
	4GPrqddZr3AhLuhn+MiFuTWAuQ4sJZo4=
X-Received: by 2002:a17:90b:5543:b0:382:1aaf:4bab with SMTP id 98e67ed59e1d1-38e4b516631mr6802380a91.27.1784379420904;
        Sat, 18 Jul 2026 05:57:00 -0700 (PDT)
X-Received: by 2002:a17:90b:5543:b0:382:1aaf:4bab with SMTP id 98e67ed59e1d1-38e4b516631mr6802336a91.27.1784379420459;
        Sat, 18 Jul 2026 05:57:00 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm14238910c88.8.2026.07.18.05.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:57:00 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 18:26:13 +0530
Subject: [PATCH v6 06/16] clk: qcom: qcm2290: Add RETAIN_FF_ENABLE flag for
 DISPCC and GPUCC GDSCs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-shikra-dispcc-gpucc-v6-6-62703e05ef0f@oss.qualcomm.com>
References: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
In-Reply-To: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Le0MLDfi c=1 sm=1 tr=0 ts=6a5b781d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=GcpOkd73Y67OKsgM6LgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 9kLL9AWHD3nNqEs5yDUUPaYOKmfElOdY
X-Proofpoint-ORIG-GUID: 9kLL9AWHD3nNqEs5yDUUPaYOKmfElOdY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX9p/OMDZNVw3Y
 wYESRxKtl0e5OJbILsPul/KNmdiRN9CFV8Bi/Ds1xQdCDkD0m+VBuTDTRXqmC0/2J3GT4Z1TmXo
 eY+Je6i/uzXq+NVda/9mWlBJxKfMzQc1GJ1UnF5CGObwK2NRTIAb11RZrMq/TYBhWOb+DJaRRA6
 QLVinzfs4/BF0Pt2QoHrZqUWJ+a1otLFbJhS8Xg/wKCP4ZNKxab4wsLxyIX9DjbgWeJEznVPl/H
 P+I5/VrwcnM5aisRbKoOJep8ZV4OH6/u+djpIEVBtE9Fb7Cz3+G2UvNK5kbfRYjuLizNWkcB4pf
 yDFhxw+i/6JQ2YxD+igNqTPmXDuMCfDEFHzY8ZvTgMMToZB+1PYYBnYc3cgc52DxRP9mDBjd7un
 vftnMbwgjRpH+yiU+Ap2IqBKePoMExJD3tUCWoz43e36BM8SZlb2unBL4Tft+gw7kXUF0ilM8NQ
 Z6EiXMOcqdDvr7CtZVg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX8vvuLJvYTbn0
 Oyk0a/LCC/oZR1FAg37/P67GbjLGORCKlcgWJ2iCYZfU+mGZySPNzH3tcNVBz5bM7b+kTVqQ2ga
 2s4CK8dRgJ5J2dG54h0kf32mjtQg3vc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180133

Add RETAIN_FF_ENABLE flag for DISPCC and GPUCC GDSCs on QCM2290 to retain
the register context across GDSC power collapse.

Fixes: cc517ea3333f ("clk: qcom: Add display clock controller driver for QCM2290")
Fixes: 8cab033628b1 ("clk: qcom: Add QCM2290 GPU clock controller driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 2 +-
 drivers/clk/qcom/gpucc-qcm2290.c  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index 5f5bc5b1e09e2207466d2972ded91140ce8a6ecf..1b796698dff5abf50e57d90b92a6a429ee078e2a 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -455,7 +455,7 @@ static struct gdsc mdss_gdsc = {
 		.name = "mdss_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = HW_CTRL | POLL_CFG_GDSCR,
+	.flags = HW_CTRL | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
 static struct gdsc *disp_cc_qcm2290_gdscs[] = {
diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index 3b130f69bb93898ce49654f2366851a7c1c94524..8d397cadc86aaa1666e27c8c4185b9b3de13cf94 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -300,7 +300,7 @@ static struct gdsc gpu_cx_gdsc = {
 		.name = "gpu_cx_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE,
+	.flags = RETAIN_FF_ENABLE | VOTABLE,
 };
 
 static struct gdsc gpu_gx_gdsc = {
@@ -313,7 +313,7 @@ static struct gdsc gpu_gx_gdsc = {
 	},
 	.parent = &gpu_cx_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = POLL_CFG_GDSCR | CLAMP_IO | AON_RESET | SW_RESET,
+	.flags = RETAIN_FF_ENABLE | POLL_CFG_GDSCR | CLAMP_IO | AON_RESET | SW_RESET,
 };
 
 static struct clk_regmap *gpu_cc_qcm2290_clocks[] = {

-- 
2.34.1

