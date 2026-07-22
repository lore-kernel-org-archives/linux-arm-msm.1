Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F07492532
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 10:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784717765; cv=none; b=pPNJSrSucFJLiaNxQwpOjsuc5K8tBdKq9ymJMWxGnfQydCFLmoYapW8Z7gLxmD/0xZrtJDB+xa0hToekhfqrBk22AG4p11AdT5NjNrIFtjq+G071CEcEhThUMSvTRb7Bii1kpX9Qzw7ddhDqc2DlbHkGWkXp8nxKsE6cdtiPEXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784717765; c=relaxed/simple;
	bh=xKkW8JkAQ1Vhl3TZIzNa8+ozFoj7WCUtudLFKvNQfj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tsNYAzWsKXIrEOXj+g+8gmDcwmCUl4/yn/dbuUJVb9gwuDhUTtyMs/GhxFO8vwGfqj63GnvHmz67XZUr3Ok2er3a/m4crlVDpm48G4BwlMKxsRngBHsapqU2iILrxGxof1nWBKekOYekkf7/rEFl5uL1vJ3ozutSEjSbzpnal7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kbSjwyyH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cr79AmqO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kbSjwyyH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cr79AmqO"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8x4jT524026
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 10:56:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ht5fvyfbePHEIlm/98arjAMGkHBafuoSDc2M14Bf44I=; b=kbSjwyyHATSAD5pl
	8lxuce43STguwUSf4Y4zF8piQwAaaXTLe62FWt2KbOtFgOhs5dOBXihuFnC01D61
	5dab2R+/UjPSSTEodwlrF2y1RfjdDSVVgYzO9ksKA67/nfEkBlAvYCcrmL/9nBE1
	sv1GxXO0yTGaqeHUGkup8COAfvTs/ASyDdpHzPe06EHOefeo/qphy7OBjn1dUFec
	r47J6luztCPWg2mmWu9fCn5/3C3zvyjAEe24KllKjj5HF+bp0+VmRNFqCQ30+rDN
	NRBAoYAhE7T1Tjbk6JQGV2PUdslJtw6rs2psLTioX22XXoYW/S3gu1B1BqJJnMgO
	iqwKRw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjrtt119m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 10:56:03 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so4046512a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 03:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784717762; x=1785322562; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ht5fvyfbePHEIlm/98arjAMGkHBafuoSDc2M14Bf44I=;
        b=cr79AmqOzFlbaU2oB9WrASQj2RDKivnl6HsuVwTCJBLRE7uSqfIcGHbnNjNW9sf87o
         dyuOK0ZbTPSy8AI+7z2hkqT0vFQo8Eca7vBhtGwEds58f3pvHKxtzPZJs3Zhx/5s1iVd
         ID8hHNW8CCpg5BG3uo2nIxCc5BWvmDIdo19spYw64MSRTmtEIFjGjQFHtpVIWgSPFrrD
         E0ii2PMT8hF6Nd4kKa2DN0qDwRs3cRtWH0I0DLaTrZ+qOCRp5+XXWI/m4K4+AZYp/hbR
         i2wkEN/w6usrLGmcea1d7v2Myj3hl8/eruH/EN5dTY2pEga2SpL6nJO0Pil35mvJY123
         Yt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784717762; x=1785322562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ht5fvyfbePHEIlm/98arjAMGkHBafuoSDc2M14Bf44I=;
        b=DKG1LR4g/dTlpOT+VHtq+ujcZCKaRsd+U6F95jWlWh7N5lwsw3mIqnrbxs7g24moiV
         a4qFYwUN4k+g4blTseX62CuLjfXrNYWFTdP3q/Ma/WOeardhEWRXzyk6fPW6RIK84s7G
         blMIx2YLLEpq0xcsUNn+24kG/2l0bcSUkz39SS1qfi45d5fp/QZX04uBS3/g2NfQ4RQ8
         dWAHdXJ32NUo2WG2JrVDTg+DmEqo1c3rjyGVBA8EL1btjtWKBw5+/q9NDEPBnd6EhPLL
         W7LxdjGJLvWbnbBbPx/MKi2DkD8xqrZfuUab99wTBqENW7TaSJGUsVvO0o5PW3FPqw9N
         +jZg==
X-Forwarded-Encrypted: i=1; AHgh+RqHwzabWe/OZlFxtXar2I79JjFVbciTflOqUofV8s4Jvr8WJ6A+0XZ57o6z8cZoeuHCyHg9Nfhu3ucpP3uT@vger.kernel.org
X-Gm-Message-State: AOJu0YxqxLdo8oZPsyfhEiqBGACtSZqToSEwLvLYHbD1QAkARXsdrH1Z
	+iFW4QiUFArus45tmXNzPr+DvfgGjIT4iVQcQ2czLNuJPwxUoyG7GmkFb0EfrqoypNLRV7XrXf/
	5MuLlu9IY6UxepLvNn4E3E47WgsHNR/yX1b6cnA4tCUyheZT9kAxNTX94XCiuBtgrQmLQ
X-Gm-Gg: AR+sD12bgVqQsnRFI0Yp7CgmrMabYY4oMpL48CR3s8RM8MJUJdjcN69FEf5qeRBkQ1R
	RA6Dhw6nfBe/HusBbAowH4Q78ZbMohH5/ByY90A1/7grvWVlHezwtv+IZRDPUK5pVrEXwD3+A4k
	896G5GNLsyq8pWzLAPb54+Yppfpg//Xk351/kBq4Q1oG1eDOYzzROXbJRjiepNQT9kyJosQdDQX
	STroldSJhsVX+kgQkqY76VgITSqE3tBuKwNqSVRtKlK2SlJo5DqxlUuMjpst1YezXy+hdeYSs63
	AjPK31H4JCSel5OlILnqxGvv7P7VHwXSO7IPieQHP9g5xjy6g/VGg3BBuU6XIdqSdxw+v4qJsk2
	QWvqJEMu2hV+8i1AhCpzAuYsT+ijflQTifg23/h1KNP38kmUO2oFShB4xZZyQfFkk
X-Received: by 2002:a17:90b:248e:b0:38e:6f72:9be4 with SMTP id 98e67ed59e1d1-38e6f729cb7mr9642124a91.3.1784717762578;
        Wed, 22 Jul 2026 03:56:02 -0700 (PDT)
X-Received: by 2002:a17:90b:248e:b0:38e:6f72:9be4 with SMTP id 98e67ed59e1d1-38e6f729cb7mr9642101a91.3.1784717762129;
        Wed, 22 Jul 2026 03:56:02 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d1302659fsm5809160c88.8.2026.07.22.03.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 03:56:01 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 03:55:36 -0700
Subject: [PATCH v2 5/5] soc: qcom: ubwc: Add Kalambo UBWC config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-b4-kalambo-crd-v2-5-32d4addc1ac9@oss.qualcomm.com>
References: <20260722-b4-kalambo-crd-v2-0-32d4addc1ac9@oss.qualcomm.com>
In-Reply-To: <20260722-b4-kalambo-crd-v2-0-32d4addc1ac9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784717756; l=1205;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=xKkW8JkAQ1Vhl3TZIzNa8+ozFoj7WCUtudLFKvNQfj0=;
 b=7xjm8rvol/LWDQGie5TTWYF/nNVO1ILkyGA4icryN3d2W8WRsrOko3p/RVx/9fSTCND6nK1OE
 zTNFmbua0DGAzsccItgbF/kRkgJZz2+KPZoClJmiYPxIqXNnt7FKPQ/
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-ORIG-GUID: JYygCZ5sY-8_PC8M1kzX9_O6fmPvgoGg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwNSBTYWx0ZWRfX9f0C996tzqWG
 kyudyYlOOPghKW/XWDc59yGe3/EiDtlPQf7eZbhr/gkvMa15pCBpuJecV5Imp3cGr7xRE5JNoZY
 /jlYee4ITux34B7LCSW1wEnLm8KqiwS3ewxQ8LQ8L79kWzL8Ye3pDPH7CWQMBoyYWFqtHPapapT
 AWgUXMYA+VrG/jGIN5FEwgFuI+c07kzhkjj8zLGLx+W2puVliHsfen5XXhMKmRsnTfQx+2x0VS8
 qoqlmcs7JKxklalZSb9CaN6BOIZT3hZbA5GtPpAcIQ5p8ppc2M0snECypb47IheUCuypsVlQZX/
 Mk3WPM7WMh1EYivQhpZbdyj6LqFlaVrqveXBLRdcewVmiAtO8qw4HPU/td53oL18mMNPRv5EgVt
 0Crx+nyMw6daP6YyXSmzLQGW7gyBl5psmRaRzkiFK2nSccXl/xqfy24Vh1vOi7cBns1lVRZHr9A
 G1zs1rAq7CoagoLtbSA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwNSBTYWx0ZWRfXzQZcgG5dEEKE
 05iLQqdBJoIJUIGsHLhwpvlQdU+LoNelhILrKvFGxN/fIjLGRaLPUKD9ybGnBxi59QVKkZNWW6f
 +WYn5I1cy6VMEdlPZ3gro2YYv6ngVkg=
X-Proofpoint-GUID: JYygCZ5sY-8_PC8M1kzX9_O6fmPvgoGg
X-Authority-Analysis: v=2.4 cv=V8lNF+ni c=1 sm=1 tr=0 ts=6a60a1c3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=vwhQhcXuLYmSI6hVBhoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220105

Qualcomm Kalambo is a derivative of the Mahua SoC and shares the same
Universal Bandwidth Compression (UBWC) configuration. Add the Kalambo
compatible to the UBWC configuration table to enable support.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 0209a02c390f..c5f79210ad52 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -112,6 +112,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,eliza", .data = &ubwc_5_0_hbb15 },
 	{ .compatible = "qcom,glymur", .data = &glymur_data},
 	{ .compatible = "qcom,kaanapali", .data = &ubwc_6_0_hbb16 },
+	{ .compatible = "qcom,kalambo", .data = &glymur_data },
 	{ .compatible = "qcom,mahua", .data = &glymur_data },
 	{ .compatible = "qcom,milos", .data = &milos_data },
 	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },

-- 
2.34.1

