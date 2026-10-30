Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793363643;
	b=UCwALZTOD7htOxgDIVyB+/xu4GLy/oETfcyb8iuphvMnTSbcjKu+IiEs7uQ+WSCCp8im
	 MtArvAgtX7c9pF0WztBpp2UtrHk2BVwmb/VRAOJF4rpQvCxRNqdxxHZUk+84+3jHIqMlR
	 f0kxbGWdy8GYNNJDhvIeWgo5M9+4dHYjAm5INAoZRrSESR6k+GPvfHU2Iuz/WDkRWw3tm
	 b07YOhUsy6qEBbAc8YpLX6TqXoQbt3g0ZNrd0fLBhqYkn0R3hsdVTxSj7iIfVUtcK0Clk
	 zJFakX1T/73WtttwoyTHroDA6cqRkzub68/2J+LIS5TbhdfLja+xR1JtHBgDBbFb73g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793363643;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:To:Cc:
	 X-Mailer:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=a5MSYJ1rGcM1c1mD8vQqR9kzodi2jfXNa+CuopkJDgQ=;
	b=LEt4zDlLLF+Yae7VDYrC0oHsFKrpSBPmp8FETk1nT5ArV19NpDr0ZnNagbgmoaqDmGrR
	 qzKoLgIamIjcYU68bm9k137d+f0gImCYfyUnxdc0tP6JDzZ1L2JvKDJTmIo6jJXSvBux4
	 fM5TXr4q0p7JdFPsJe3iupualnMYPk4VXdxhI6SPsx0d4oA1CkPNh1Zya44GbMkrdIkVi
	 3v8iecnWyiyT828QwWS22h9KShq0jMbach+2ozbtJr9ZWc7PQzkaKQeo3YkNrY+kjJNn3
	 gkuLPObD6iqdqUVK9uswY39X9p46KZXrP24hOLeeYTwv9i81bcu7Kzw+EVv8f6VhfdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JG0Shqgz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZzNsTBWm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADFF606A320
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ADFF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JG0Shqgz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZzNsTBWm
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBGIEH3719856
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:34:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=a5MSYJ1rGcM1c1mD8vQqR9
	kzodi2jfXNa+CuopkJDgQ=; b=JG0Shqgzz87tgU/teD+t9DdrX/PY5OniKw1eTE
	oIroYBEmVWyQDHXYXvnLAsVLlE/jl4lyhIk1wDjjIALbbLdA4cTi0zKuvMk5pWM7
	DSnlPBmwnZCpSY2tHEs2sQ2r5Bp0HTJpTOcBjpD81hZ3sNNkvBIg/BQapHv1+Iua
	iSmUgRHyTLeCgJ8ewTZpB3/0wOI6p0SiDkGfanVWuurg47Yu1YoFyea+a2eDrPK+
	YlyyTrvGNWfBjcKXmwWAuux5u6hJyuHWpZP15B0bWA3Q7ZHDHyrjRsvoE5YIajJ1
	bgBP8vEaE+jxKnCtHGj/RPxIEcI4FAl4JrSuTTCCICrYMkiQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qu0da-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:34:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3aca98f01c1so692629a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 05:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793363641; x=1793968441; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a5MSYJ1rGcM1c1mD8vQqR9kzodi2jfXNa+CuopkJDgQ=;
        b=ZzNsTBWmTLsIvSxwGLXt0HdQPhZR9q6W2EID2u2P+LkyVBeOrJYczDFuMyGuI6Q3Hy
         YFzV8t/AYmApU1TT/jwlKgwVyxXRlF1Tykzs+R2B8CaWGt+h/GBJM1woEzCM4qatCBP6
         mBMLA1Mv+pDuoz5xCmZ+cQNtwH5Z1xbXpD/5+PhmCRTPi7hGeLcjp1S9jypDsnsHkSd2
         Sb1zK2ypRPbitIduPa5BZofkG68RUcJj3r3NJEeCijSnoSthR3OAGNg9hDfXBQMI9Bv9
         ZkQtJcvGD0xOBO9mVNh7iGItK51d+wf8KawFojnzBKTiIbMTwpcnmMpoEubr6zXq4k4Y
         NLZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793363641; x=1793968441;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=a5MSYJ1rGcM1c1mD8vQqR9kzodi2jfXNa+CuopkJDgQ=;
        b=vJugsUAH+ikaEl0+pv9CB9YNSUizv5b503vDLUTwGGUQAbWwtj/YiaJGi9APlVa6U/
         t0ln3mtGUlYCvW5Mo3MEB0hjjvw3cN+zAiLRIOvej75q57cPb1uVQIkSx3pSDiXTlONF
         eMJe8q62zKQFPA0O9btux7UZnk/bJ22/2LD6tYF1aj7xvRU/iLC2iBt2jr0a5/uiKA6d
         h55UhtwnGVXP3QH6LcHpSqrC4+W0/KcibpjQ3y3okOfLpo+HrOOdqAVDBxW5tn9vD+hF
         yO348acKZuaLYISGgEgMBBtMV3fcG7X1+/auxYn4pA2z2mXvyPL8aS2LfUbkGdXesIpf
         /KyA==
X-Gm-Message-State: AFq9FYIn44LeQTWK49bAcibN9YPKRgv0YYG8jQd51ahHSImFsNEmYSoO
	svsZe2yoydAdMGGpNhFIhO/uBksm9KLdiYHhjC5By7dMHWXst3ELqxg5lBUe+NWLTDDwnOmJ5HI
	vJQ9LhP3QTksZS2tPatjgG9q9k9a/wlM8ke0JIeO5mjS7lHTPLp6d1SPR+j4bfwkff7Wt
X-Gm-Gg: AYBFou1jHVZpkPgxjZ9ThQMmffrGvG+aU8EMc44N/t0ZCevj3F8aiakwr2ed3TkNVG7
	GMMtrzg3I28Uv1EnIclaDMyz1cf5wlNArRzWtZBMrhzjzfJ96HN7xTfiZBd/QHQ4k3pq/v6ZR8i
	wIfmDnIjACqoLluFleDnq6FSXIZlI7yo5FefPcANMMQIC96+ft1LYtZOW6jCXFYwfQe9qL0q9jk
	705Q2mtDNXY44JL1YVKBE6G9yTB8HEgLqzYtNCZyRUVei81cV5yv5OI1apxC6OgflivLOr0coFN
	krAZPO+nThHdrp6Bb5ZT7KJ0Xf3qp0AhBFnPZyGjkJWCLgwRbeDM7yjt6FYje2UfnE06woS9nPI
	aTKExKFVs8rAezvNySvUmW4YB7zjvTE6BJ7ICSWb7PqE6k8wVWDtYjZufqkHREtwij6OKw8PYNJ
	FF/eOj/IvO
X-Received: by 2002:a17:90b:44:b0:3a4:acde:1e3b with SMTP id 98e67ed59e1d1-3ae896f8546mr1840014a91.13.1793363640913;
        Fri, 30 Oct 2026 05:34:00 -0700 (PDT)
X-Received: by 2002:a17:90b:44:b0:3a4:acde:1e3b with SMTP id 98e67ed59e1d1-3ae896f8546mr1839998a91.13.1793363640429;
        Fri, 30 Oct 2026 05:34:00 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e944ba9sm8548468a91.8.2026.10.30.05.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:34:00 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 18:03:56 +0530
Subject: [PATCH v2] soc: qcom: pd-mapper: Add support for the Qualcomm
 Shikra SoC
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-shikra_pd-v2-1-09bd0394629b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALOO5GoC/03MQQrCMBCF4auUWTslTUlaXXkPkTKtUxs0TZxoE
 UrvbnAhbh588PhXSCyOExyKFYQXl1yYM/SugGGi+croLtmglbaV0i2myd2EunhBY9t+39dGGcu
 Q/1F4dO9v63TOHiV4fE7C9Cuo5r/QeYqRBZcKKyRjGs0Dacv1MaRUPl50H4L3ZR7Ytg9vIpHHq
 gAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: FRzuhEGAA3fzXS2HIXGmlvExVY55FKJr
X-Proofpoint-ORIG-GUID: FRzuhEGAA3fzXS2HIXGmlvExVY55FKJr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0OSBTYWx0ZWRfX3OQdqOqjrSJB
 S10XbFYQJ9luIRMy8vBClIv4znceoAnKzr7rDfZDjyfQ+i9BW4GSHWf3bxtZJJHTIEBLt89czKk
 JI9O+tv8+xPVgT0mrqkn/bRylNGdhhUDPKT+lr940JX45NNpQlIgM0mgQ65Bcb49mMoRBGvqlJ6
 Yyujj9loVkf8BAeu30nWv9h3mVqwzOI7cIkAaPYDRFfJ1oSOBBxOJJUwMSj2BmcB9m4cQhpuwO+
 7SF4gAsC3rI0+JW9WTbBII5ID8eV/FJ3bG5XJ8n9rA4alYXqCC7a2prPvr4AEYfrrEKYwasx1EQ
 XXYdsYn51qDcokoirYWHP8sYswahn5JFS5QfknrzAdtfLR5y7/LmP8S795FmZTyalPfA444j7E4
 j6eEZpzpp4S93GruicviI2aRAHsU1nPzOIx/br7NJadAtl+XW7XhZYiw+Rw9aEVL9jKSHWV1nmP
 UK1Qb087yHwPTBtuf8w==
X-Authority-Analysis: v=2.4 cv=dPgzC+Zb c=1 sm=1 tr=0 ts=6ae48eb9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=7krsQZ0Oat1KQVfDmrEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0OSBTYWx0ZWRfX5HC28+pexpkS
 uA6x9NrBLN7yLkKvnWfEW7dqADQNfXiFfCqtg3AduzsWQ1smQZe33ZIQJgHdM1rdGKERZM2RWm5
 m8LHpPs7w+wBUJJrb31xmUWhKNqAn+Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300049

Add support for the Qualcomm Shikra SoC to the protection domain mapper.

All Shikra SoC variants (CQM, CQS, IQS) share the same protection
domain requirements: cdsp_root_pd, mpss_root_pd, mpss_wlan_pd.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
Add support for the Qualcomm Shikra SoC to the protection domain mapper.

All Shikra SoC variants (CQM, CQS, IQS) share the same protection
domain requirements: cdsp_root_pd, mpss_root_pd, mpss_wlan_pd.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Changes in v2:
- Adding mpss_root_pd and cdsp_root_pd for all shikra domains. (Konrad)
- Updated cover letter and commit body for all three protection domains.
---
 drivers/soc/qcom/qcom_pd_mapper.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index 64ca99d7fad9..9e456ead9eb3 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -498,6 +498,13 @@ static const struct qcom_pdm_domain_data *sc8280xp_domains[] = {
 	NULL,
 };
 
+static const struct qcom_pdm_domain_data *shikra_domains[] = {
+	&cdsp_root_pd,
+	&mpss_root_pd,
+	&mpss_wlan_pd,
+	NULL,
+};
+
 /* Unlike SDM660, SDM630/636 lack CDSP */
 static const struct qcom_pdm_domain_data *sdm630_domains[] = {
 	&adsp_audio_pd,
@@ -644,6 +651,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,sc7280", .data = sc7280_domains, },
 	{ .compatible = "qcom,sc8180x", .data = sc8180x_domains, },
 	{ .compatible = "qcom,sc8280xp", .data = sc8280xp_domains, },
+	{ .compatible = "qcom,shikra", .data = shikra_domains, },
 	{ .compatible = "qcom,sdm630", .data = sdm630_domains, },
 	{ .compatible = "qcom,sdm636", .data = sdm630_domains, },
 	{ .compatible = "qcom,sda660", .data = sdm660_domains, },

---
base-commit: a39c950806213f6861d00f90729acaaa21f2d95a
change-id: 20261028-shikra_pd-568b9b35056e

Best regards,
-- 
Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

