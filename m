Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193855;
	b=ihKIEWsu2xHM8GS5miW84/bDKDLF5Nrd0kAKmgGtUKNKIg5F249B0+VtBhbyv5Nv4zPL
	 80qgkYbdTbsFuZXBJD3lodBwuiTf16m6IHRtHBNtpcSBS+W/hNZKETDyghjz6Muemwd2K
	 HSPz2nzeOHASs7w1400I+fzy2E+pRG9GUTtxIxuw+wrTj5Ze3dRoE8uat/HST4MlmhWX+
	 U6SqcAN0EvM5GCAvQ7vDPrNGIGiTVWXW1Mxg+aQc8Thh/wztCOskUF9WbdDRwj2YJONn0
	 kSStNJRMG50PA/bfWfo/QcapdV5HgO9jE2UojRkycjmv6HCoSjoRFI/FZ7rZtI0B0TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193855;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lqqwgC5/0KhExGOAHtY1KTfOuh5wGUdsX0Lp3kmGb0s=;
	b=ZRVc3HMyJZVHFCsH5ruJlLM2S1cNcOdXO5GeNkngjxb2QszxHv+ZPJr81VEIZPAQx2md
	 bkf3oORX8r0mTN2c9Qz5QEI6gihStdW8f8cy+MnrE1gPAoacVCoel3osrRi58gETbrzH2
	 doCaENE8K/UgnQxtTCC9eZda41EKI9+Gx2q3kuFlvctUEGL/y6bisNWcg+gfoGO0YsqH8
	 6lRj6lPmrzjB8TxtR85dvV28mbf5LulZ5oX4CSRh9omTK4mRZB44sGJfiLTaPi+rbqVGE
	 mA4syDJ3eGMoT9R5EMDU7qODd6AY/R6zK31XdBZHNckqkxJ1oua5lJSdIBkBVxpVaQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IW73soAF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="kO95/ZO3";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DE2606A31F
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8DE2606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IW73soAF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kO95/ZO3
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe2PV1538941
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lqqwgC5/0Kh
	ExGOAHtY1KTfOuh5wGUdsX0Lp3kmGb0s=; b=IW73soAFUpAnN/CSPcKsM70fmxf
	lGA4SMy0oQDD4qy7Of1DN01miTzw3Ljr5Lq2HW+QxA2IevRCSQ7T9CC9w84wX2DW
	Jt20DxrtbrpdAs23FjS+MPgQyviPlDEiDCLLBP7oE0Qhhb+4SkbCUzpVw/aleB0+
	qLslwunjknDCSE0zGETNdtpIZF00K8JB6/DwiUFoHxMfwO95a2ztERHWSTUzyNWR
	K69yfyVi7SSX03VeHzxQrZsrMHgs2ef0xZ7iqV2Ih+kap0wQlY5OKtaQkkYBOf54
	JYv/JAzOMSD+yZglSymMvItzoEj2GbyRaz+w+eU0uMGqWV0S0tAD+9Qwltw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7s36q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:24:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9441113670dso27470885a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 06:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793193853; x=1793798653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lqqwgC5/0KhExGOAHtY1KTfOuh5wGUdsX0Lp3kmGb0s=;
        b=kO95/ZO3Zz7h17nx2F3f9rKsFE/MQSpIYnIg7vNuKVwe2oZLKpKy997NNE5PNm9RyM
         bi17QBMfdbDpM6gPHA/CD7lrBtdM7J+A8yK/jNyzBRRAs113cdG6p6U+pPte+trB2zvd
         Q/pdxjbD8NZoGDZn1ll+WCq6TENjzCMhC6e/lrZpTBatUs+K5PNtiUcqKGgE4ta3jK0q
         xB0vvxrNjoBfGmir50aPG7AjWUI+kY4xutUmc9LxWPQ9egdjYIhzbFvXojqXBIDdjVVh
         xijVDi47AUUVxqWJRq9tZDsh5bPq3Iub64LJJimAVzpUKmepwHuUbeatWDJU6KgnD4FM
         CbYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193853; x=1793798653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lqqwgC5/0KhExGOAHtY1KTfOuh5wGUdsX0Lp3kmGb0s=;
        b=GNbxLVqos713FR3Bqvogda4AYFWSzbjUiz5uWdDL6mNsYOuk7J3j8C5Qpn4MKfeMC5
         LzNM9DsNHspKT1g7VqmaYQ4xqyj+bDYL3M/W8GM5WBzuM7BKnLJcWd2IOV2n6d9DWtgM
         T+dg+tq85tuW01VLemiyOpV+ewZhzJUim/BUKd3iTwXRHwi0fbnTiPhbvwJjBqjrC/L9
         6f8Ivv7yKFQZxOcKuZKO1Pe6t89o+ppiacnsaqUjdPYSHO3lnuDb1YJyF8oU+GK4+4Jm
         HDOWkP6YJgXsqgzO+OCBMny0SS21OZDnYPbxhW735jdbQU2TsqFttnWiJZaEzYTewYLE
         6evQ==
X-Forwarded-Encrypted: i=1; AKwUvBxclMqnnmXTkP/D59oOpQMWPBDWnwdBEuW3o+YDpwVQx3sgLQXaAnhK7K5VJ82+31iXmWxtwbYL4KDFCs4v@vger.kernel.org
X-Gm-Message-State: AFq9FYKj6OMyOK6l1jGQ/2GNmSPMjAdoaJu44TY9sxwAIQ3pdjCEzUGx
	sPMGoUfR1MMn0ff0Yfal0NGkhZxjLsNgmm1pKjSX0/Pni128bAtAP8tjsTx0WmUT3xdNbDw+ouR
	rO32Gz/RexZz5xbmFfcmj6CctFlGRZxiZMmyN1JiiiI2YTKUWsQws+eT6fXqVQmOtfne/
X-Gm-Gg: AYBFou0lKW7udf5f73NjmxgjqzCkS3nglAWjNRyfmX+ZC70jNR6DjwsEcyeYLKdbWGg
	FFYzA3wMjXbrghZtS8zl7NFDDHglcJSV+qG21HXavzbWGOgzXmyOlevdiv5oM7OSLjGci4gtOF4
	nQo+9qVWDiWhwGRuJCOSK9EgxueMZUZ4ueHHSw9d9OBG4onJ5nN9dB+tHAghfKwvONEqbDIT+QW
	zjI1Q/hpNREqHuxdCZTRWpCTJiu3Bz5dv2LvzkOJEeQGTJfGP5TUV9dKFj2vHdNq2nGY/3U7wNT
	lHwcrhlZ90Q9ORvO1+4PJqA1TLDPymoeFcvlrnGCzvXfokQ1zOuiOSiaEpTP0hBhsebUL/tLHrA
	3gxbBrYInl2b8T+g1Kv2hctttzDG0ibvQKhCNjJCczdZkCQ30Rxzc/m9039qG+gHSVLsyjaSnDA
	==
X-Received: by 2002:a05:620a:1a1b:b0:93f:2f48:c9e5 with SMTP id af79cd13be357-94408d3d2ebmr305277085a.34.1793193853164;
        Wed, 28 Oct 2026 06:24:13 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1b:b0:93f:2f48:c9e5 with SMTP id af79cd13be357-94408d3d2ebmr305272785a.34.1793193852723;
        Wed, 28 Oct 2026 06:24:12 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b496435c7esm1457824a12.29.2026.10.28.06.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:24:11 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/6] media: qcom: camss: sm8250: do not set VFE core clock rates from CSID
Date: Wed, 28 Oct 2026 15:24:00 +0200
Message-Id: <20261028132403.3505037-4-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com>
References: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae1f77d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=rPRfP_fVeLzQRQyiyREA:9 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ajXS7XYvMNxBkaXbgvuNUAh-TsHdiwjz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfX0oTHaAZMsl5A
 1GXjU7qPfoQVDMCfIsXqs3Gsv93mkGBE+HFaDlTIUfAJd9SIxaGi1C5xsVJ5wIuLeHVd1luToW9
 thJu9nVQZEcZFxr1neamjGUJZaIkT94=
X-Proofpoint-ORIG-GUID: ajXS7XYvMNxBkaXbgvuNUAh-TsHdiwjz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfX9Ge7eURe24Fc
 3jJyye87GajFOpQA0o8m2F0O3WzBSwvp3qJroHp3EZx5Z5eTplpWxH/dtTLSBNcLD5zeQMdOJhG
 XnlWQ+wHb33sdES2jF1r60AkM+eRLuLWfSNYUqE8yCSy25HjneF1LK6Vh/24f4S98XLmFj85Tbj
 /Ut83e+OxGYa2nvSSzViftZqjB6bSXlGEYYhaaixZHvtDUUotZ21uW6af3Bh8zPSapo1dRK+tft
 e8i9qU3Mzc/TMKbXgBFMrOUKE7GyoP4x7GvUDDODWzqSV0tys1r9gtYYS/ckfkcXjRmXEVlhyhq
 UKUJF6HDjh6KPbvS/FQTXRO35WozrbkdAJDGurwGPvi+Y8AC+FZlmfCQoEV0tJbdwXmd7jr+h72
 hhRkzvscwkg04JX3qNzrj8kT9tX5e0Fr7sSm+Apacjr45SNu5j0QiQjCyTQB/T0ulzXVdyDJVOI
 5Vo4oywm9RPj9gRpAVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280053

The SM8250 CSID resources list clock levels for the VFE core clocks and
for the shared VFE Lite core clock. CSID power on runs after the VFE is
powered on and sets these clocks to their lowest level, overriding the
rate selected by the VFE from the pixel rate and lowering the shared
VFE Lite clock under a running VFE Lite.

The VFE core clocks are set by the VFE. Drop their levels from the CSID
resources so that CSID only enables them.

Fixes: b4436a18eedb ("media: camss: add support for SM8250 camss")
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c54185c93a8a..7fe12049b78a 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2052,7 +2052,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock = { "vfe0_csid", "vfe0_cphy_rx", "vfe0", "vfe0_areg", "vfe0_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
-				{ 350000000, 475000000, 576000000, 720000000 },
+				{ 0 },
 				{ 100000000, 200000000, 300000000, 400000000 },
 				{ 0 } },
 		.reg = { "csid0" },
@@ -2069,7 +2069,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock = { "vfe1_csid", "vfe1_cphy_rx", "vfe1", "vfe1_areg", "vfe1_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
-				{ 350000000, 475000000, 576000000, 720000000 },
+				{ 0 },
 				{ 100000000, 200000000, 300000000, 400000000 },
 				{ 0 } },
 		.reg = { "csid1" },
@@ -2086,7 +2086,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite",  "vfe_lite_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
-				{ 400000000, 480000000 },
+				{ 0 },
 				{ 0 } },
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
@@ -2103,7 +2103,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite",  "vfe_lite_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
-				{ 400000000, 480000000 },
+				{ 0 },
 				{ 0 } },
 		.reg = { "csid3" },
 		.interrupt = { "csid3" },
-- 
2.34.1

