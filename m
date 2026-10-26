Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021865;
	b=bLh5xEtP/rbX1WCSGSJuG612EgAYg2yUZs+Q/ONDcmjJPqSlPP1GmOMFyY99xiN+n/3o
	 GpwgUzGHs7gZu/hdtbQDkzKM/cVnzQAiIR72hYoUkb05NV54N13mC8NY3uHNtITiRkg3b
	 F+/Tm2lnqIsh0XhKIBiRY4aiDw7BN6FHCDvEjK9aZE7LXxB6obG3F14jTgV6Cg6RgJDyL
	 8L4dEg/UlltpCn5kwEdsWwvfa9Ra6HCEpNEOqNFGwFn8JPD5NLtfX/eDmSU+t3WYq/Yr5
	 BAJhpNUmqRLxX22taG+MuewU69bZNeaQMgqI5l7h/9U5rCjD9T6v/erNza/lccPsBtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021865;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8NVtysIHAb2aw6KysRyb98OnPA6mo3D+Nkw0IkOczVk=;
	b=exBcyjYwkLlXlrCj+DP8a68f7/S17UtBCWqg57HbNAYfbDs82iBjevUMe0wQO/TlZ4I0
	 iZAQpL8udIBnwIeUuMfEba+fFvPR9t/UWuTrgFLiqCOVHwqJv8SIgjPII8FdoWB1wFt2D
	 M3PvtPfqtgM7ttnf37dC4EUVuAY64gJ/GQUEZi2yFVvkhYLqQ7GkltGzJqM+nsOAO+Hxb
	 XSOsE5sw7Euk5cP5CbtN+rYAx53mtL4IhJRs71E7boJ/WZEdg/0HPF/wrj8mK1vqzYFSM
	 dM1yYp8dNnTeuOvdsOoHBa7mt3xC0Ie6jkTJ3umByVQjOj4qBU5dbbBG6/HL/7hnxOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=To+5xErF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bSAnt6cM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F24760A6F70
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 13:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F24760A6F70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=To+5xErF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bSAnt6cM
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAsm4R2168521
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 13:37:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8NVtysIHAb2
	aw6KysRyb98OnPA6mo3D+Nkw0IkOczVk=; b=To+5xErFOlemyI2j53B+tCU3jyT
	Xq1t0PR/Ydkznmzbri8snC6h7Kr/QRuHhjjSs+9ZRutlIzgDtjgqW/wPDNDEZUz9
	Xey+tQQIRvNgbenmUND4vvLkRj3H8rIFKpN5w5bje3xZkE4bP4DXl51iokpcwGZE
	WS7os9MM7kn0pjoELYs5DKmc/mkR4oRqppe7pIG72cxHsT2GHwCN7x+yXyJ3fvxp
	X1HmZrKEG1tnpEbU6gVY39YngJcI9R0P6nUDmh1JGxmdAcI6i22fPFVALTqAchhc
	ARQDsv9a+jyunGkiAMWGgAgonoTRz8K80UeuYv6JoSCeuzVH5YvtDCcQ7dw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u610fm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 13:37:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ca9b53afaso482987085a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 06:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793021863; x=1793626663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8NVtysIHAb2aw6KysRyb98OnPA6mo3D+Nkw0IkOczVk=;
        b=bSAnt6cMZW7KcRLSIeJAzPv2oCaHlcXgaQgkn0WN2UemwkTlyQ+vXzlPr25Wq6GryN
         ZJyuQX8mTu0Aq9zAR48+56nweMAdOqPpyPK0dmcLJMpaeFem6NYOn71uMeVKvHenXais
         yPAnlHFBrPILCKf4FnzJy+xdy/aQtt3s/wKlLiZ/5akqMF+PZeIv1NdsY5LdEMIflC9T
         HgM4R/TP6q4G4lmOHOUfLIDRlY2G5TKMjJqkjOmD+FY3RX+H5NNnYOA6VjgNFOHrC9oR
         qpZ7BT2vfI3yo4l3/0eN2fdh3NAe4uxXpYZyrmWL4XunPpPrLQEdEfJon+Wl/g59o2//
         IK1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021863; x=1793626663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8NVtysIHAb2aw6KysRyb98OnPA6mo3D+Nkw0IkOczVk=;
        b=idBy19WhTqiZZwRzMXWUeaiGvnjEwB64JAjFeHe4zUT5YB3eSb2OT61bi5zgbF/CVC
         1bSPESd2NzVsjo8HJOK/StqHSQFxmlgbOtYzPNUg+qt9YjUYYSG8R/2D6ojdZyhetdzG
         Hcf8+9LilTONdxhd02YdSvt1DlYQAfm58FDAgzsmZqXVJqsO3YB/cB+OwqIoHZ4Df/rf
         jsCkA/gvlaOq3zmaG0j6qQdq0KlAPXvCQbU+RaWKPVne+IhxEXzRtnGDHYqdxAXbxxgo
         ScF0SfZOuRU7103/UhA5/pSMsURlTTJnIspQYorqT9g3t5b2nk8htelOmX7VO8fsSn+R
         1MOg==
X-Forwarded-Encrypted: i=1; AKwUvBzkLgQVFNmqHqql54PgM6HNVQ+Sj2r8ylOwtdN3+1Cj+9x6133dWR6NGrAoiDiMApRmsmhfVFX0Yzi+PFi3@vger.kernel.org
X-Gm-Message-State: AFq9FYKx3G2D7fRDOWb6TFCoXYvUZch7NQhAGgu3kG2MFSZv50rhPRIr
	jadTf9eFjPJHjp86Sn9fxRzs6hxGBLSIN6sxIgw8SJ8LYN4jf2UIyuxCC5yK5VppqrRzu7jBtoV
	kRZ6Jt8/lxRNZb/Tb8nlF1xBRP8UVXQPIxrakCntqYSwz1S8JGR5RgS5I/WmnX4rI6o/9
X-Gm-Gg: AYBFou3R0uOGp6LHtpmzZwaHOXgsmwRt9OCY8GOEbXpV9HG1yuBd9JM49Tac3vQrRko
	+I6WfzIBAblQUP9Ru7bphTu+pKPJK4dfcjxv43wstlwL1SeONtzqVYRliapk2Juv22tTPRCeQ4D
	uBBE9lNSOMN7u/Gd1MvXqwnKBzpLdOeNjVpd2iNlNftoRExbshsEcNnol6AFXQ3XcacQhm6H8WR
	PyP/usOax/c5jLE9CQBNWZcaS0u246tatRCe+TFudwinN6RQ5bgSszW/neDAE8yaJOWL6Lr9USE
	bgOgZXuNhQhWZNmR1rvPWQOuMSAdIQoaq7bOm7sM8eVHfw2XKpOUelwXgoPD2uPNDBy0sFnI25+
	+HET13pK/+vjagmyzYhIuyBRC
X-Received: by 2002:a05:620a:294a:b0:93e:c12c:f13d with SMTP id af79cd13be357-940ef93d216mr1021019885a.71.1793021862826;
        Mon, 26 Oct 2026 06:37:42 -0700 (PDT)
X-Received: by 2002:a05:620a:294a:b0:93e:c12c:f13d with SMTP id af79cd13be357-940ef93d216mr1021014585a.71.1793021862215;
        Mon, 26 Oct 2026 06:37:42 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f305sm15376512f8f.3.2026.10.26.06.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:37:41 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/6] media: qcom: camss: sm8250: set the camera NoC AXI rate from the VFE
Date: Mon, 26 Oct 2026 15:37:26 +0200
Message-Id: <20261026133726.3249235-7-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com>
References: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-GUID: 9FGuhZTmuuzp2Ftu27fQ6izIWc6faVQf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NCBTYWx0ZWRfXz3pnI+j0yDi3
 PUHSXHHVHlo3MyhiH1FwjMn6KC6ZittgVl9lVjG4pYyL6be+ygYZrmtrxgxDY49peYJTwqbCQD+
 MUNkq8RIqmRupCQvH5A/jGlE01vmKGje5Y6FEiIBXJYyi7DQfWGrtbsjuYWdRmJ77wHVkNL7AIn
 dIIRIvP/IT2xoe1rLFMNdZIXn6bj+55MkgSO9HWlFUwvZMXimT42R3x+99/gyl9p8zftqT31RYU
 A39A4/IF2EHyMN7FCgbvazWYhDB9/4Xf58aL0YPP0zd3K8wG5TNRHoOZvUXhXbt7zi8/xzAuVp4
 bYMgtpLVPzyN5Ollbyo6t4jHX0ei5uqaKqOYR4P4Ck0NUqmnWigdHaP2Ia8IRqV45Pdgzd3Vz5n
 cUpJ5CgvlxPhZXk1Ovtyu4N/TGbmSt+S5RvZXzB3hXAiVZIH3Mk3h+1UWe17rCM8gViHngUZ0BY
 b8q6mJuP3y7aBK6oACA==
X-Proofpoint-ORIG-GUID: 9FGuhZTmuuzp2Ftu27fQ6izIWc6faVQf
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6adf57a7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=FiRPRoyJa4ALD98OXUAA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NCBTYWx0ZWRfX+SvmUA/X5VFc
 kPqbSOpFcj68GWybfoCV8XhST69S51WKn0capuhlhqC0CyWKi/M9eg/BdxQ9jp2zvlxbCFHd21K
 7CkUi9PEYJcmU7flAatXEIJpez9AEjA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260054

The SM8250 VFE resources list both the camera NoC AXI RCG,
camnoc_axi_src, and its camnoc_axi branch. The camnoc_axi_src levels
are never applied, since vfe_match_clock_names() does not match that
name, and they list 480 MHz, which the RCG does not support. The
camnoc_axi branch has no rates, so the camera NoC runs from XO and two
concurrent streams stall.

Drop camnoc_axi_src, as the camnoc_axi branch keeps it enabled through
its parent, and list the 300 and 400 MHz camera NoC AXI rates for the
camnoc_axi branch, whose rate the VFE sets through the parent. The four
VFEs share the camnoc_axi clock, so it runs at the highest rate
requested by the running VFEs.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 28 ++++++++++-------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 911ceb7202ab..8ffe02d97dbb 100644
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
 				{ 400000000 },
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
 				{ 400000000 },
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

