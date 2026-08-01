Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633A34334BF
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Aug 2026 10:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785578430; cv=none; b=QNZpNa1yY6V61i9JxrprVI5BroCDHe9WoOt4Gac9HP8e810TaNW01vBK8IMq3KNx16vnYGopEWDnLGre2yW0IvTwiM/wtX95IoqMFg0jMH3dStHtfLOY/5M6dUCH6LzTK2E4yGwaqdli2MLNHLjA6lAwzrj2Vw0dbAoO5KwcVQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785578430; c=relaxed/simple;
	bh=xKkW8JkAQ1Vhl3TZIzNa8+ozFoj7WCUtudLFKvNQfj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wy7lnaoYsyLLhVtU2hYrH1oLInevycsoHiJOEFJ7QcjiMsEOuOhKewYfcUkUN6lgALPa1AyYeglxY6N1lXKELPZyLInz1mw+i6cCfhhlez1I9RhVKtVae6KVBNlp42Y+Otjj0kuDPoCSJ0mLrLhkOLsCzEM4vBdVwXrh13UtZfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YwnhMIF8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=feRn/nJw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YwnhMIF8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="feRn/nJw"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6713DP3Z2065103
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Aug 2026 10:00:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ht5fvyfbePHEIlm/98arjAMGkHBafuoSDc2M14Bf44I=; b=YwnhMIF8ALzOuskg
	JVJ1sxD7dloeSnINtrTiABVITFNZHBdRx6DEzmmYAKH6g+JNNPdYs1berSUQBjeF
	h7oT9BJ333Hca8RP9KIUjR2OGoU71W2D2Em01C/3KeH5Dymvx2QR9FiJ2qVAIbnh
	Lh9qDlYGfu8Nw4KqLq8yzdXzT4UQGyy5xgCFef/enzmOrOOR4SVeeI3gSBrbZgRw
	RUDPNZY34M4N27raPQ1gol8AX0BCtdBxSMv5WgBdZEIgDrkK26d5Df+pnbNkmS5/
	svkL6cb5+sG67ZeOC7RqFvuu4yibbPyr09i/KhaHXR9F9B7mqvtycsMlag10lGoG
	GXl0sw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8q50pu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 10:00:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38edd45cbc4so1971555a91.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 03:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785578426; x=1786183226; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ht5fvyfbePHEIlm/98arjAMGkHBafuoSDc2M14Bf44I=;
        b=feRn/nJwsepKS3FJpUfHyzSdBl1KtissoCbcEwknbyi6y3ZfpA4pPNC2lhgLGSnRzp
         gPbxxiSyp7JhG4aUax905uElWNDMrA0hWlSFz7bxLJ8gY+eis3JPk8XVwb7tlVtN0v/H
         kWjp1rTXPIbfkkMO7GhybcAa8JAfqjroUe2+dQyzQmwBormjEFCmrDxT2urMzHCWy5Zm
         3QlFBOW4go+BWvl60ZbHDFFwRZ7DYhNmjLIJFaVztXF32I4Kl1pe3rxINnoRSzD7XNyY
         oUoHV/1/Y2WiYMw237Nu9IjlIfB6LSUJx5OmapxrCVoq22hqQM24f6VAS2l2ja5rGG/2
         jstw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785578426; x=1786183226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ht5fvyfbePHEIlm/98arjAMGkHBafuoSDc2M14Bf44I=;
        b=fKij9ra81aMWofIdmOUGkK5u9J/RKO++w8h5kTz/LrTQ5aEzca4uv4UqGo4+fR5O9N
         KI7oflZ+1LmDA9bECp9WtwiQlU/69sb4NB9r6zGKmRyrPZq2TxFKhSRpkiqjCuOeW/55
         z0yKosrRbawccBCYey1/QGTugShegd6zVkuyaE+c8GbUgxHs+/Oy9nSw0HBFPA9S5dPK
         QDHeIGZmwg5JOQ3Nu+CmQwvQe48Yvv978qE4j7bAmyrrsdP+Il0jM/7i4+fGNQ3pgH5f
         qx1j1UwgTfSavBteKhe/bZtVSaYFFJv2dPvSA648HK0P0JNh61rASvF7nD4jU85oDgxT
         jxRw==
X-Forwarded-Encrypted: i=1; AHgh+RrXqIryJIAUmVcg1M2NNrOo8hJQuH3ZB7D84EFeTmGdCsQeDisZMh3HfuJVXEHgRk+6riW4Nr7PvwmpSouB@vger.kernel.org
X-Gm-Message-State: AOJu0YygjrLbdADODq3cajHmQkVbtYelSooXBHJNVC6T9c1rcJRXGnwl
	1QU9A11926G3V3dHUXRJo4l88/5GS1RXA7s3ZGGaTlDsuFQOZAnNgf2pWG9T7yHgttm/nioz5F5
	Rxze2UEdjREhzRrNRaGwlM177lxVHRwHnF1O/StVhVLkpdl8kab0JkyxrlONn+XIhDnpt
X-Gm-Gg: AR+sD10NJhzqpBVvyQHMfF9uv28f1Js53CeBm2Jgp9ktE7bG3N5+FAranZw1gPKapnB
	hS4mJRQiXGWZodEnAI+bDtuNmJVHZNfCEIV7sNB962TP/hzuhY4v9yo9bJWJoTeNBVl3b7GXtob
	4l9A9dSv6uLWLQtb1tokzT5q7Zp5EmmiiDnmkMnozREGaDLIhugN+VybplblubFPNfdIRrV9n1f
	xdaoYzGxDPTU83zA1i9bNm7mb5o8Vc2S/GqPTOqTLiKPS6i9QfUkD4Pa09uSj3GFXqDR3O/j/3C
	Z6DjXlNRm1PlL4EjYWVPmLqqUvrVmb8Q4JxN/84anMEj2iKwhhTEfXxWulEc6EIU41bheWgOB66
	F0eu2nidLFQXLDBSHZLH2MTcyW7z0W/o8Cfz47nU02jLafcrOzqvM+Tc+8y6EHzaE
X-Received: by 2002:a17:90b:394a:b0:37f:f8c5:93c2 with SMTP id 98e67ed59e1d1-38fbc51a356mr2690771a91.21.1785578425675;
        Sat, 01 Aug 2026 03:00:25 -0700 (PDT)
X-Received: by 2002:a17:90b:394a:b0:37f:f8c5:93c2 with SMTP id 98e67ed59e1d1-38fbc51a356mr2690677a91.21.1785578424622;
        Sat, 01 Aug 2026 03:00:24 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e04506csm16290600eec.17.2026.08.01.03.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 03:00:24 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 03:00:20 -0700
Subject: [PATCH v5 5/5] soc: qcom: ubwc: Add Kalambo UBWC config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-b4-kalambo-crd-v5-5-22160abacf3d@oss.qualcomm.com>
References: <20260801-b4-kalambo-crd-v5-0-22160abacf3d@oss.qualcomm.com>
In-Reply-To: <20260801-b4-kalambo-crd-v5-0-22160abacf3d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785578419; l=1205;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=xKkW8JkAQ1Vhl3TZIzNa8+ozFoj7WCUtudLFKvNQfj0=;
 b=AnESG/HcyDhetBpeOfjWCmIboN1k6CfDvIHPoFLeba9qB9etEL2IuxGeF4b6mFLcmTHc7bChi
 fr8hV6tsUpEA5oSFaPNKsiImA/LbMrihxABR/cyyg16YvcHYcmY+vqq
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDA3NSBTYWx0ZWRfX6tqci9RsfqiW
 9O1RXpY2IBUxp1/vMXWGm0zTMiEtRN+N0R/FK+73rJeNjfbhjKJXvZX6+NqxcG6vBRqdfcR+7Ng
 kaLe7583MEPGvbE85uaSlcoIq/oFBAk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDA3NSBTYWx0ZWRfXzWMUk4yMwUug
 S1uvcAknf1UUxtweE5DEIdet2JTfpa12wixT2vxLwpsr6MJ+/JuOvy72/zyD2kptsrGSlkiq+L1
 IHxXwcQ2pfD/0pooJoEvDJgDdUVwH0xFze6lVLAxFza7k0yTLi8fHodOIv3CZsZF523YMCWFSnZ
 wBDLIza66I1X9qJzClpQNh4zPQnm+IdyO5YbWNEBCiVOV6O9UguUKgR+YKkO6uv8fCaNT9wJFyj
 QsDeI6juqKbfWvu+zEYbYeHDvwxvtJDUPVUHik57zfQgCDKPrTAPoK/hI8YMZRnmiWGqf4AnDtv
 yQwSsAOLq+2vuw23depkhNajVxifckTbcQwOrHUx7nk0nM6geSH5Q06fDGBtUbqZ9+Qohv8WNUp
 dNXpKzozCvIQv4RLSgtsCfgnQ//7jcLW5CqEOH+xcR6P77JUghCqcLOcm398xG7vznV/UvdSIT6
 UCCWnd1ZB3WFmv+AQDA==
X-Proofpoint-GUID: gGid899L_b95z1MKnAZ6MGKbIRFwZnr1
X-Authority-Analysis: v=2.4 cv=IYC3n2qa c=1 sm=1 tr=0 ts=6a6dc3bb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=vwhQhcXuLYmSI6hVBhoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: gGid899L_b95z1MKnAZ6MGKbIRFwZnr1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010075

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

