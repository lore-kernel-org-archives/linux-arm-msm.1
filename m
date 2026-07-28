Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FCF2D7DDB
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785232349; cv=none; b=D48rh3W7amlswQl8QUCXFd9qLT3PrNIvvpf+gTgcDHH3A8wJgfWFuBjHR3zY9cmAZGUm3RcExoHB0IQrwpLyxGPIEVsLw6lAvKEnkKUrQWYm4CPQDQUDSFv5wOoL40S61FRqKrgW1z99G/J8ngNCzaStC5J1gATQ+0lrqjjalNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785232349; c=relaxed/simple;
	bh=UJU2ZDbkX49+K1JD3vC7z+7ButorY7WdOnucAWNvk/k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=udxT9TnyqxtYsTeIDknEbniCJab1+OPHH5HjgF1JyFlsmZnkVD73dMLlH9PjvPrb0X3E8NcAvPOQej9TDHGfLlkyLjXJVC5VhsulHX4qjRE9RFbcnQvMI/Kp+sVaPjJSNRtKGvBI6eagJshg3R8qWHD1LVrSusdfOpE7U8ExH+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OJQmNFEy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T6ccoYCt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OJQmNFEy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T6ccoYCt"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82IKp2128925
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BP0V8kFPT3jGnLyBW/Bk64
	UF3dzRtm26DUzk2zuHaxU=; b=OJQmNFEyHwV7jwKnYEQOiFE+v4ZA++D3lMBTca
	ZTQekEvuzQo9o/t+3zZAg7N2iBJLBm90tl/syBuaMnl0BDvZl/V9aesxdwaL/bVc
	do451FAiuHbuKaYi7qLLtfDB8uO41gEJMZGsKlCrvjC8T09nwx8ykKOQc87vyxAe
	y+tZ1hb4VoPykmxqnwI68WxiSWSLXnFSMfnVYes9Dg48dk7HnCh7a7e4EBGI+UUJ
	Pf0tvWRPdDE1/piip5nR/i9dvlBRu9AKtezaOA9FysRiDfG7Wu1sgjBRbxmGjIAW
	XzQSIVH/E51Uwz12nGN6rRc2hFhflVm3FQ2EYceOIG25x5XQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbn8bjt2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:52:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cacd6d37edso53425385ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 02:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785232346; x=1785837146; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BP0V8kFPT3jGnLyBW/Bk64UF3dzRtm26DUzk2zuHaxU=;
        b=T6ccoYCt/xYNg1kqUK3ehHcnQ2YALSMIfHvSISlGMnR2TqKVY1bTKuphVvcZzSgjZQ
         Nr3wWeEN3EPJ7VVQqA0NocPPioiNqq5DUksb8QF8pjK+2VOYZOLtW8EEK4yFODmAFD6d
         L5YTNaGB/+jTRg9swBBMsCWlSrqDHlyNhPKKbeR9KDWGj2RvTrdtlivS0iK9WaFEPBE4
         r4T6K8iFBkqAoCn+rfNlotQjGRPUp3uYYYqGJDPy4+dsM11K6H4IcSBK1btrGHMeilzR
         2IYH5eAmbrayb6+Rb1OPxTjXoeHlqTE0BijB0GjJ5u/FAW6p3bHZHW4cthJHTUNhuheo
         auBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785232346; x=1785837146;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BP0V8kFPT3jGnLyBW/Bk64UF3dzRtm26DUzk2zuHaxU=;
        b=fxoanvOkeMasv1lScf1eXsvx0wy9PDYoK1dLvIHGsvNUoPU9h2o0CtcMhaeDtmyToK
         nAazkQpqkLfyo37CtW9wJ6PIFmIus8zcIoT77ySXrDpVu5QexH0BsWmxTQdMUu/qrAgN
         HXFZFH/XK2IwZa58XWTLV8PGhBbUOaE2wLqJtV0BlRcXJXuMQ91FRN9IHnoUVlnVLnPZ
         4j4hoFM0ixPDqkd+IeF7LMRW+SI4jf/npdjhAzsg9fzA6kEiEulEuI4kMb1VzYOHk49R
         P45cvTWauhAe6Gx4mZxEAFqjfUVDbrUCbjLdFfP+M1U01rEDqrh988ZhdFnPSETOZAWa
         PUKw==
X-Gm-Message-State: AOJu0Yx3SCsktyd1tvvFbcwd0PkEOiCm3dADzJGAaH+f3wzhXAR1fdoA
	SDCEEe4lFTiH4AGO3+/xHKZuOFr//x3ItYeaLmKfplONE6mcEaUw1Ghg1keElf66NM+oVBVktr6
	rcAgmAdz5yAMA6BwrZOwCxMFaTHVvv4OQxGxU3bg4E8oSYRbc4H9KSOvyYIwWcHkEoo2lenUxfR
	RqbLI=
X-Gm-Gg: AR+sD120wGWYLYQXV16bIGxYiXf+D9XWlcDefabq8jvB6zY90HcR+CfqlG+RZRDH2ef
	3pTizKQgNIM8SsCnN62gFxg66wo5qnGryfeySfeF560SNPCc8L+hTiu5H32qyRGN4kMJLzYItYV
	sEkDcKQw5cb4ZOmbFiH+t5kpzzzhwbiOOEbRu2RQIpXfMd5Tumnh0T4pun7ThJkLSTMTfu+kccz
	sEe0tmRDR4GeOLs79LYb/uThL6g09q9Kbi1S9mIOYwF7ninTuqy4U5Mz+0eLaDV4V3Vqae8ftjp
	okde5UfeoETuATzjlfsBlDGN7eSAL3HOrtGwAqL/OcUzYTM5jxDPybllJtG8VC1duzAHVrvQWlO
	65TwZ2+/Os2ESE0WhcteEaPOIhUjVvVm/asJm
X-Received: by 2002:a17:902:ce8f:b0:2cc:84e7:73bc with SMTP id d9443c01a7336-2d015d83dc9mr21140875ad.32.1785232346244;
        Tue, 28 Jul 2026 02:52:26 -0700 (PDT)
X-Received: by 2002:a17:902:ce8f:b0:2cc:84e7:73bc with SMTP id d9443c01a7336-2d015d83dc9mr21140595ad.32.1785232345835;
        Tue, 28 Jul 2026 02:52:25 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5e26e9sm50236505ad.23.2026.07.28.02.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:52:25 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 15:22:22 +0530
Subject: [PATCH] soc: qcom: pd-mapper: Add support for the Qualcomm Shikra
 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-shikra_pd_mapper-v1-1-a5572eca26e3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANV7aGoC/x3MQQqAIBBA0avErBNSUKGrRITpmENUMkIE0t2Tl
 m/xf4WCTFhg7Cow3lToOhtk34FP7txQUGgGNSgzWKlFSbSzW3JYDpczskBtvLZBKh1XaFlmjPT
 8y2l+3w+/znCcYgAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4NiBTYWx0ZWRfX38b4SC6egq7w
 jZ9SORoqJ6/Fvse4tJAdvVIkK3/+ye7rHztX+zX+mKkrukIFa9YJN2Ykbba31uo8jP8GQfqq81k
 ffRROFDMH1YCxiDDjMIF0tDhhdRilUQQkUQE2t6ZnblR5Vd5ki3t+rMZRhelVSU4Yk6WFmyL9oX
 HT51pbPZeNOSRYSezyUMbcpTPG5o1fedfyfnnc4C5MoyorfLQMhlDsAaeiqkTTfwN4WW05nl7XE
 jwkQsbWzNoOQwgGoOmwTf/noXWHJFjG1LQZQz+7ph2FWOXIXTFYtrEncG+PA1Og2TU9eNWZ1l6n
 badTFdfNDmHH/Jy9Yy4cw35zPsvOkDhYrT+TRULU3MqG4KxagbGsnFFBfbZN0Eb45pOjjuMKatT
 eKKXCJZnISn8MIhxfwJITB1Zj3tk53mmiuCdC9Z4wG8AXKE1vvKypQi0z7ZqJuhrj8ZQ4aYY1b2
 OcaPPImylDJxDGLwNQA==
X-Authority-Analysis: v=2.4 cv=RO+D2Yi+ c=1 sm=1 tr=0 ts=6a687bdb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=rL0W11-duJyS4a9qZ2EA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 7gweZJOz7eLMW8P9Kkb0zvXUKrsJWjB_
X-Proofpoint-GUID: 7gweZJOz7eLMW8P9Kkb0zvXUKrsJWjB_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4NiBTYWx0ZWRfX/w/+JuSFPkC6
 G0nsmOIYtR+ep0bL17UT0fY4mADoUOlGLtlhtfam27Lsdjh4aNJH4f+Pt2kWCovKjWJbBLva0sS
 ac09CCgaoQ6ie3URrkNRgTEhik+kk48=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1011 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280086

Add support for the Qualcomm Shikra SoC to the protection domain mapper.

All Shikra SoC variants (CQM, CQS, IQS) share the same protection
domain requirements: mpss_wlan_pd.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_pd_mapper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index 64ca99d7fad9..9eb50e566659 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -498,6 +498,11 @@ static const struct qcom_pdm_domain_data *sc8280xp_domains[] = {
 	NULL,
 };
 
+static const struct qcom_pdm_domain_data *shikra_domains[] = {
+	&mpss_wlan_pd,
+	NULL,
+};
+
 /* Unlike SDM660, SDM630/636 lack CDSP */
 static const struct qcom_pdm_domain_data *sdm630_domains[] = {
 	&adsp_audio_pd,
@@ -644,6 +649,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,sc7280", .data = sc7280_domains, },
 	{ .compatible = "qcom,sc8180x", .data = sc8180x_domains, },
 	{ .compatible = "qcom,sc8280xp", .data = sc8280xp_domains, },
+	{ .compatible = "qcom,shikra", .data = shikra_domains, },
 	{ .compatible = "qcom,sdm630", .data = sdm630_domains, },
 	{ .compatible = "qcom,sdm636", .data = sdm630_domains, },
 	{ .compatible = "qcom,sda660", .data = sdm660_domains, },

---
base-commit: 138cfcd84a8943897bdb2ad1fff9ca47672baa3c
change-id: 20260715-shikra_pd_mapper-e56c57d125fb

Best regards,
-- 
Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

