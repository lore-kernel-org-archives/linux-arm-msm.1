Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792834860;
	b=LDxBisdCQe1sy/8MP/+K1x3gZBIRNXxU6OL4cP6v9O8N/Cgin+RZ6Hko4sJpfhku67fN
	 fAjP9DDGP4IsrqOr8MOvNigYOPcoCWTNw1kTNvJPiFTWz5SA9vzCEOHHG2uTer0rUpXqh
	 pGlzNxoPu8/GULID6zny27UBL1EAGJ8cl/RaznstssOGK7GTev2qtjsc8zMyHUhrlcA0K
	 yBbnAZQPCpWdsHchqDKpN8s+gcecCA1f4bgZeDEaXzOgxidkcXk2eiE0t/TECiWca2gm6
	 +iZmP0AGYPz8oJ+vSx8ky3rVgH7yStSQ6kZ6PC5eV/9LRTIN35I/DVzFLgkM/brSEmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792834860;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jgkKAewrB4ulG7W0OsxbbjajcwrjHSByS/uUqiEtUBA=;
	b=zl7gPPJ7A92kFbboeMIrDg5A9rMwEonvSWrsKHqOASYZlnBC1CqfQs80Y2DAm9xRGXkv
	 F0RTng9Wwb1XVSWZgj0vqK9JKrRulUDeeRgQluO6JELxdDtVYHDC4MDxwCiS7+W3t7TJc
	 HbLRPAEgxGM7C60TZ8nFmQ/06iqrCMbp0bIz0SudyWVSWIU3KkfVjWOmDawoyUEHxaFZg
	 SqrID4Qj0LzdYIZYPGlzATYB/ONG9VaeFwBwn4w/wwAH6fjkuz8w04OWlhAw06yXphuUC
	 pJU9Y4hT1F8EEKAITxq1RRMU4BHKYkrAEJjsqRckBPSdDA9UL48WeWVd16tjQODMdLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bV2dsHZy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DxlxblOh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B459606A334
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 09:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B459606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bV2dsHZy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DxlxblOh
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O8oDUa1707947
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 09:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jgkKAewrB4u
	lG7W0OsxbbjajcwrjHSByS/uUqiEtUBA=; b=bV2dsHZyZzUoDGgwcjLHfW8u83D
	2dlCetRtENgZEMXvNJJC1quy/HlLmoU+U/b2KD/jkLs1wScM8yymKNnqmfJNfIaN
	nI9uc/9lHloewTlXfxdGZ9FcD3ade2GUb7tATr0H8qa1P/4DaJrqamMp7kwfbQHw
	okVr6LK5c7ZmdqNPe0gIzhJCc75p4FTlbY+EGPveP5Oc1YZ8VNNRUap7xV40y21I
	ejTNbNt2jI0WW+nqdcG8rGxmdIYYFJAq2c/D9UqS56jDsw8KyzlfgLAC9dcAGKO+
	SflHWKCuFoFPIp7kNYGy7rzyOJYq464ewewWjdKMgYYU+ZkogHs4GfWR0Cw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm8xgq6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 09:40:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f37c94ceeso550005785a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 02:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792834848; x=1793439648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jgkKAewrB4ulG7W0OsxbbjajcwrjHSByS/uUqiEtUBA=;
        b=DxlxblOhLHvp4MaG161aY4QO6x5YZw99Va7zhiIX8TfLZGWg23aecNLwBO6Y0SGy41
         ZiPVeGXncpi+rAYP2AYgx53PBfZ1v88anUzWGDvLMmdH2IlLZqXgzQ1C5q31Y8UKrTvm
         snoDXUNkatne8txlJZI3gf42A3Jt2yNqHCbLJdG5UzKj4KDzjMu6uFfj8eq0B/zKYeJr
         rpwtrShBPSv3HCP+PO6OPSghEWWGUEQapSoMTaEL/1M6nOq12csZBRbqJPPamm1khV6m
         i2PZcXXWke+1dLXXH0IlWdR1ZGJQu6FDrra7E2K1vFomNFd+e8y74ghn7Y9AX5tK8qvT
         L7rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792834848; x=1793439648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jgkKAewrB4ulG7W0OsxbbjajcwrjHSByS/uUqiEtUBA=;
        b=pN2UmzX8QsGGlBJdXinpfOEy1yPub18cFzhwYmi8wFVmDI1VqQqX+xKN6irUCcEKCH
         V5BiT3WyxwEbTl/GExyUb5p6bpPA1p9RhNF89ayoQJkv0gbCl4s9xm5MEGINT4UK+KK8
         azLa6oQ0FjFfxTKQfARiUKHfov6z+WNPBdXYqBSIsq7Q/sSTySm3OhvavI/3dfKreJuU
         66gVv9Q0jywqSynzMWq+SUutRykzWaQlxVNtoMt6xJf0FpK6p5WARsvA++PwLxmlP1Ez
         qs15acRK3pc7CPlb3BJzqou7HbRkilof+U/uxS48qXqDtoIkPOxjvNVlP8IE8ftAPpjl
         ZwXA==
X-Forwarded-Encrypted: i=1; AKwUvByFvYEwnIVm/mFM3mVcJP5we+UiBsIDx4WDN4EeHKCgH5fkmuZxszd6bkIefGcfg2ugBoNEiBmOk2WPX3bh@vger.kernel.org
X-Gm-Message-State: AFq9FYKcry52wbyVh2biFtUznZklKy3sMMCqQhu+gRtRXPhl26PzmjyA
	hU97MOGTs7XzPYRmRzHIqP18d9x9UHCHOqVTdgyk49gswuhwB/Lvjo0ZX3iOFpV8b12a8tacpFA
	1GX79gH9SLVnjTOUxKzayHrbug6dQeKGL5x0dgSQ23dvlDDOTOBsc1UST98Fi37PWVsRH
X-Gm-Gg: AYBFou3Xr5XXgGqknLK0PjDp1I6U5RJwovyAVB4uHJNuE/B8G4aY7JflKgJzSZbJ2VU
	J117LiMfX5NoiLqsBwmfPi5zqZyjIYYWzOo8YUJyYpvAFS0zem5m2bdt7BQQ1HWj8mRGc+PQZM+
	TfX0P8dhldoa+wh7n0ZAA6KW95GXyXcjVujVVftDhgOOW2qodf8MF5AEzugWI/qCqtVJcokxk+9
	W0MfgvMkAH3Vh0jgB2d3evJQcV2PtRZI4xt4tO50kl+apW42MdZcQS19SwQ1HCD+96dsHtii4db
	PTfHnFUAtQv7Of1axokj/df+hcfdAv5J+Pa/Sd3qeAbwS9PJ+v1tL2lMi99rhmrwWMOJQhuIgpC
	LFmbUjro2RsFGyIyMN/MyKKcy
X-Received: by 2002:a05:620a:401:b0:93f:4a02:ed99 with SMTP id af79cd13be357-940ef956f57mr143095685a.20.1792834847701;
        Sat, 24 Oct 2026 02:40:47 -0700 (PDT)
X-Received: by 2002:a05:620a:401:b0:93f:4a02:ed99 with SMTP id af79cd13be357-940ef956f57mr143094685a.20.1792834847230;
        Sat, 24 Oct 2026 02:40:47 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3bcdsm2857166f8f.13.2026.10.24.02.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 02:40:46 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] media: qcom: camss: sm8250: set the camera NoC AXI rate from the VFE
Date: Sat, 24 Oct 2026 12:40:27 +0300
Message-Id: <20261024094027.3095475-7-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com>
References: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-GUID: IePEg_AO7HmNGDDgM4BEJgTv4K1gfbiM
X-Authority-Analysis: v=2.4 cv=Ra0FmFtv c=1 sm=1 tr=0 ts=6adc7d20 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=FiRPRoyJa4ALD98OXUAA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAzOCBTYWx0ZWRfX5OR8II1EelbF
 4UEITbsf0KUEFj793FzsCd0fDEnZZ9PV78Fe97Yd+QR6l428/hDs/eCf7Xicf28AiAI6/JKCmjd
 Ix+5yJmvzX3Ue1o0LY07bEH5zihcj5U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAzOCBTYWx0ZWRfX7T17101Jia+M
 oVa32R3eSMS/NO1L4NLhyomQQmND+Qzww/rgVhlufsufBLP1KKPfUfD+IFcKHaiNJxUNLk1NinN
 fKwK1bfLDyvS9cBqGu5zbGEvIiE259Db7WpBce0TqMDTfMMRRnqxRUOCsXNOlG240fGiASanKDL
 GXXRXGCELguShiTDpA/lAcefrsMOSsMXwd43U+1X/MDSMJufddDIARpBeSOii7C0++iNGVtCFo4
 3ZYGysR1xpcQ/WZw0PczaRrlXQnziY2EeZe4tK41RKQ5bv3+jdQ7+p4vp9TJBGLe9dCc2jrIyJ2
 H8zJMlNSFAT3a3HUTQ6NWshUcUHiLDtMP+TxKZotXSjC+j4qY5qIssUaE4TFK4uRHnunt5s4mYh
 viCfLX13pzKMmQT7xVBux2qHoRt5seMHMKw/zAldN2Ntldgl7vp6pf82cEs4AajENR6CHYdkuMJ
 BWHqR1ypsZDhKQWINvw==
X-Proofpoint-ORIG-GUID: IePEg_AO7HmNGDDgM4BEJgTv4K1gfbiM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240038

The SM8250 VFE resources list both the camera NoC AXI RCG,
camnoc_axi_src, and its camnoc_axi branch. The camnoc_axi_src levels
are never applied, since vfe_match_clock_names() does not match that
name, and they list 480 MHz, which the RCG does not support. The
camnoc_axi branch has no rates, so the camera NoC runs from XO and two
concurrent streams stall.

Drop camnoc_axi_src, as the camnoc_axi branch keeps it enabled through
its parent, and list the 300 and 400 MHz camera NoC AXI rates for the
camnoc_axi branch, whose rate the VFE sets through the parent. The four
VFEs share its source through a clock domain, so it runs at the highest
rate requested by the running VFEs.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 28 ++++++++++-------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 100612d97fa7..9bfb634ee9f7 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2120,13 +2120,12 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 	/* VFE0 */
 	{
 		.regulators = {},
-		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
+		.clock = { "slow_ahb_src", "cpas_ahb",
 			   "camnoc_axi", "vfe0_ahb", "vfe0_areg", "vfe0",
 			   "vfe0_axi", "cam_hf_axi" },
-		.clock_rate = { { 19200000, 300000000, 400000000, 480000000 },
-				{ 19200000, 80000000 },
+		.clock_rate = { { 19200000, 80000000 },
 				{ 19200000 },
-				{ 0 },
+				{ 300000000, 400000000 },
 				{ 0 },
 				{ 100000000, 200000000, 300000000, 400000000 },
 				{ 350000000, 475000000, 576000000, 720000000 },
@@ -2146,13 +2145,12 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 	/* VFE1 */
 	{
 		.regulators = {},
-		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
+		.clock = { "slow_ahb_src", "cpas_ahb",
 			   "camnoc_axi", "vfe1_ahb", "vfe1_areg", "vfe1",
 			   "vfe1_axi", "cam_hf_axi" },
-		.clock_rate = { { 19200000, 300000000, 400000000, 480000000 },
-				{ 19200000, 80000000 },
+		.clock_rate = { { 19200000, 80000000 },
 				{ 19200000 },
-				{ 0 },
+				{ 300000000, 400000000 },
 				{ 0 },
 				{ 100000000, 200000000, 300000000, 400000000 },
 				{ 350000000, 475000000, 576000000, 720000000 },
@@ -2172,13 +2170,12 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 	/* VFE2 (lite) */
 	{
 		.regulators = {},
-		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
+		.clock = { "slow_ahb_src", "cpas_ahb",
 			   "camnoc_axi", "vfe_lite_ahb", "vfe_lite_axi",
 			   "vfe_lite", "cam_hf_axi" },
-		.clock_rate = { { 19200000, 300000000, 400000000, 480000000 },
-				{ 19200000, 80000000 },
+		.clock_rate = { { 19200000, 80000000 },
 				{ 19200000 },
-				{ 0 },
+				{ 300000000, 400000000 },
 				{ 0 },
 				{ 0 },
 				{ 400000000, 480000000 },
@@ -2196,13 +2193,12 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 	/* VFE3 (lite) */
 	{
 		.regulators = {},
-		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
+		.clock = { "slow_ahb_src", "cpas_ahb",
 			   "camnoc_axi", "vfe_lite_ahb", "vfe_lite_axi",
 			   "vfe_lite", "cam_hf_axi" },
-		.clock_rate = { { 19200000, 300000000, 400000000, 480000000 },
-				{ 19200000, 80000000 },
+		.clock_rate = { { 19200000, 80000000 },
 				{ 19200000 },
-				{ 0 },
+				{ 300000000, 400000000 },
 				{ 0 },
 				{ 0 },
 				{ 400000000, 480000000 },
-- 
2.34.1

