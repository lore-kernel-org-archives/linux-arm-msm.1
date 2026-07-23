Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F181847A889
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 15:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784821578; cv=none; b=mG1+gF/VaoQ1pCWJ/X7z4O/uw+Yv2DXxrniVSnUVSxAwvRmPLVfCKC3nbicXtKa2yQntuoW6ByQzboJJzAgF66DYOSp166v46v2WNfFknqG4sTRv2rN3/sbqRc5ZCAkqZvV1NWh90GVqD/JakEFiGW6681AYwBZ1ZCufdBy6lHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784821578; c=relaxed/simple;
	bh=3usl21QCEfGlb15Z/9fJV1UfOjLgGDOlhTwfEYuJuKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aJx1n1imvcNo4f6rtEWDn4UWfwx83OM5gtq2nPdVAxkLr2g/YioTOUcSEC0fhayb6pPN3/tWWtMye14Q11fxp0oHFuo+tTctqVU0yt0zZfRj9tPoumAmozo74K2NqMvYM3WZa0EWISBBNk9dnNKtOkXX5SZ3tX2ebM0O6YnFubU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WaTfCP0m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bPAQ5gcV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WaTfCP0m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bPAQ5gcV"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvUxC4078292
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 15:46:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XPkP9ov5gTe+4QVoOYuE3l/K6+RH8/0uUYtuaI2zhTs=; b=WaTfCP0md1kDMiHb
	pGCB+1D2vZOLaLf7GOfqLiEBaJqjD7HG3HyqUdYIh2i7M/l+wFYcLe4SRBgrvRKu
	89VOb/MKvaRkSrFRreuQmNGjQ29IOw94pEQNZG9OsZbPtImJBfQwLRn+1wG8VoBl
	K2nC+UqzvzlxOSIFANquPKPYeMxoaxrWZ7GL6yi5B1GyO9ZI5lxGeHxJIWdAM75k
	b9QZPiZBwnvZN/36xEgKjsmr99mfxsrTFFX+/31T8LL8fUbwtS4D8yaTMIL7KB7C
	R6+CBKDYMzN06brRCihmlSJGKwwZkelSLVJEoxnDf2/TSkebUlOXPbZ/8eCI1783
	IPTrjQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkg521p8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 15:46:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso12730625ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 08:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784821572; x=1785426372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XPkP9ov5gTe+4QVoOYuE3l/K6+RH8/0uUYtuaI2zhTs=;
        b=bPAQ5gcVzZODHX3n54+SnWRjDPQ0xQGEsPw/gkpfCRtD4b6mVm/LyTOrQusI6ahW0s
         K/NPXlbhQQZyIEbiVem6VPQEqv7dp/Zm92WmVspFXljt7lSOE6VlfQm0nhaQSamRSoKn
         MGr2udkAA3QyJJwKMKcuTCu4Y7ZUe8f960vbG2R9a0c2ypWmYKHfIBdcnWMUqZSSM9wd
         IHW1Sg0SteDhdmrOFFkfm55wbwLmaAXz80+nW3/xw0xw0PxHD+bK11xtmXlNFaoVDoIB
         knROwF4bli3bWVBAl9Tiq/1yTBW8YZ5zY7YIulnF6J4XvkXoSvEpxO7arozPj4TPZlRu
         6OaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784821572; x=1785426372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XPkP9ov5gTe+4QVoOYuE3l/K6+RH8/0uUYtuaI2zhTs=;
        b=TbGbao7es8gcko5sJJLm3YltS3QbrONMSpATbf+jpWdvAfNlugSCc5cIO2+KcLacz6
         w2Wu5hRqH83H0oA1r4CYpm4x/VoMMMQOTnWc7/5hPnPGfwdTfBK3S4O6I5UldMDJJD6F
         39+4O3PpEkW8IFrxnhSiSHptNi/MPsDWB6xCTTiV1lWMYjeuDOlfPdbIE12mB8Y9FCjH
         ZxSGho6xJ8Q6Nacux9TM5wygwuqirvvuwpAYlgh+Wgn+5J7nYQpyy45hbmOrqf2HrNhO
         RE0EUxiN4j+EoZP5gRLPsRz4iu9C3jhcWkNmi3khEgbwyhSdyIf3/xafiYiN3pvi2+Ty
         rccA==
X-Forwarded-Encrypted: i=1; AHgh+RolqL8Mm5q4XOeo+GWA/g1jkUMbQs/YxZXRSLeTQ8nXsFuviY1iLnnevU+LAJYaTcfWb1cZlzMC/YlpqNo4@vger.kernel.org
X-Gm-Message-State: AOJu0YyETu2wbYwPkTubOePFab85hNKVVR1byBRKnxmZsylD0P6aRGOc
	jC1A8kDu1t8c78Sl8n3W5FSoxNE+4GyZTFrwGchVSf8vsTXX92hls/0Ui8c5aAmQWUEXcg6ky0E
	yZEFbZq6Kea1BZu+sdwdlJg+TpU4YvO0rVKn7fmtR/UG7bzLp5yHs4igMesRoeZGcUomF
X-Gm-Gg: AR+sD120HX81SMDgDuBbtkAW+ksxGlaolZoO4d055yUjY4fuq4aAEy9ka8CzY1V4yas
	+huDWRvcaGkqfeNYqpW+Np3VtF8hZHn/5iZL26disSWvQFoJvo0AcJUWLrKsiWLiUC1NbODYt9u
	QRcK9pUIZd6o6LJb2LUYRq3sjx1D+qGDtY6w8l+gTdHP06Vj8L+8z/kRhQMpTsrA8cSj4At4cXT
	7/Zy9wreMeGam+UYH/l7ETQ649rIbMMIF2SQayTN+H9fcP++8BHbnzG+MyY64ppqKS+EOiEKgOS
	m2HwkO7uiP6ZMVfNp9YnDby3Oi7bU4Wn0lfetIafdpktyA0pmETfJSqls5jQw75ENcjHi4u+pj2
	T2FT1hRaX/Kdv9OHLb8B746kAxh6sEU8=
X-Received: by 2002:a17:902:7c03:b0:2cf:4339:aaa with SMTP id d9443c01a7336-2cfa7435a2bmr33100515ad.12.1784821572127;
        Thu, 23 Jul 2026 08:46:12 -0700 (PDT)
X-Received: by 2002:a17:902:7c03:b0:2cf:4339:aaa with SMTP id d9443c01a7336-2cfa7435a2bmr33100095ad.12.1784821571557;
        Thu, 23 Jul 2026 08:46:11 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd7157sm36242625ad.18.2026.07.23.08.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:46:11 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 21:15:50 +0530
Subject: [PATCH v3 1/4] clk: qcom: common: Register reset controller only
 when resets are present
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-shikra-audiocorecc-v3-1-90b878ae0d4e@oss.qualcomm.com>
References: <20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com>
In-Reply-To: <20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=DtZmPm/+ c=1 sm=1 tr=0 ts=6a623745 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE1NSBTYWx0ZWRfX9irvGzO5z+8m
 v8dIsfLOFEeSvGpkvsaZXG1mdKrM5ipT+M1UawxIpfXs307l0XVfBxHUGg8Wry5Qg/i+TENJsQT
 2P+HKLNaMHTxQAteGDAgjQj2JDlpEYg=
X-Proofpoint-GUID: WYy8Xby6HDn7xtdFxDirHhcLJi1AWeLg
X-Proofpoint-ORIG-GUID: WYy8Xby6HDn7xtdFxDirHhcLJi1AWeLg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE1NSBTYWx0ZWRfXyKPNHf9oIhe7
 WF35/yegdD7rshcyUsF3LG/3QH3LM0kXvunX/ioaZ6MzL22cOJn33P02cutbhHjwRyNvdBbtnM7
 GtaBoOlHS3KfadVSlD9zu7Mf/Kx4K1Scgq7AYxkTRkwh3UpCTR/OYBr3McurdwmkEJ6za4zxuJk
 M9NgMjGU3EjBfJ/4lr9DAVgPDBXJ0bJ9nugCFnsxFqGltnM62sjBb+sHMKdXI8FNpeoE8GvB68H
 seIDtDSOozNu4/+IAVYTYvPbqcaZk/E9apBOydgddG5D5BezEDFXTataAimCWnSK9B5VB5GhGnE
 Ho4LE3F+xXs9ebgiuaRCnIJpdl1naoF5g4Jt77q2hRHLermZWVaFE2Zwqo5ExKy4RlcuZJmM1OU
 ICI5FghJid8y1SN5RlqlQF0vBR9Gjvpe1ILIzXOpRiR8Hyl9HEBpMbUz0eJkc5+M3S6ln0p8Zll
 Zks342jBH0x/0m4ZmXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230155

Some clock controller descriptors do not define resets. Avoid registering
a reset controller in such cases by checking desc->num_resets.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/common.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 2c09abaf1d2a15b7fbbbfeb67c03075381185a00..d6ff83045da8f308dcb9c5836af48090323248de 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -359,17 +359,19 @@ int qcom_cc_really_probe(struct device *dev,
 		qcom_cc_clk_regs_configure(dev, desc->driver_data, regmap);
 	}
 
-	reset = &cc->reset;
-	reset->rcdev.of_node = dev->of_node;
-	reset->rcdev.ops = &qcom_reset_ops;
-	reset->rcdev.owner = dev->driver->owner;
-	reset->rcdev.nr_resets = desc->num_resets;
-	reset->regmap = regmap;
-	reset->reset_map = desc->resets;
-
-	ret = devm_reset_controller_register(dev, &reset->rcdev);
-	if (ret)
-		goto put_rpm;
+	if (desc->num_resets) {
+		reset = &cc->reset;
+		reset->rcdev.of_node = dev->of_node;
+		reset->rcdev.ops = &qcom_reset_ops;
+		reset->rcdev.owner = dev->driver->owner;
+		reset->rcdev.nr_resets = desc->num_resets;
+		reset->regmap = regmap;
+		reset->reset_map = desc->resets;
+
+		ret = devm_reset_controller_register(dev, &reset->rcdev);
+		if (ret)
+			goto put_rpm;
+	}
 
 	if (desc->gdscs && desc->num_gdscs) {
 		scd = devm_kzalloc(dev, sizeof(*scd), GFP_KERNEL);

-- 
2.34.1

