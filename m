Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB58360EE8
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640080; cv=none; b=nwu+1SJ5XsRMWGjTaKCHc4zG/kGnNQsoEEyniFUNoOetunGlZ2IJvbXNbRVOwveOpufJZBtW5AOfA3/Egv0Fc1P5PUrfFMeG0tYiTOXPZBd6PjSDEKc7G/5l+r+aJnzHRxTJR7O0gsz4IvHkAYO1JWL6iPtAZklYZnU2Qng0NLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640080; c=relaxed/simple;
	bh=zZ37TWSmwG1/lzRCMjeybh+YUmab0aHUrm4xknMXWtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bW79RLlzyEBkkO3VyHGbXDLSNYZyXhbgcUZy5gGXLbHNbP+2hmhyC2z7dI8mtI3YQnLX4N73A0Tq8ZuAMPSzmLBaUHEggrptmSsZCvqZB+4hpgvfFkzGHwnp23ogcEnyI4NZ5wGVwucjB+YIbD43PTK0uTTFfPorvCO0M28O84w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SJBOX36u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hRtYkz78; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SJBOX36u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hRtYkz78"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LD5iHH1853453
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pzm0TOt37Nn9UAlWvpmSRCC3YSQDv8P/PcvNVlb0Ee4=; b=SJBOX36unOsx2TQT
	Ephsjf+VP0JrrtPwpl2AUHQ5P1QHNnIx1stDh60m6Vymayp7B7NKU/Hs1X0qpfIG
	NlKa1rGeUqmKmwiuwefVo+wgvGC79aACy5wATvI7rwta151WkRQV70z9Mb/XHqXh
	hi3XnqJTUSz4fWr+ki0T/tnt8Tve+rKMTlrquR8tKTXOplYMNI08AjWNiyEMmzct
	AdKveLMRx37iYYRI4c5+dHrD+WKaMMObVsShHNjkcMUf85h+CZpKfcc+W5rYuUzH
	hfhTMYGchJdLRz4/vhg5Xu3QMb216eiL6U5c6sPBveFqLz2Anaji6IJwE6Mk6LUO
	VYsjhA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9bs825v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:21:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a23afcbso98994391cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 06:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640077; x=1785244877; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pzm0TOt37Nn9UAlWvpmSRCC3YSQDv8P/PcvNVlb0Ee4=;
        b=hRtYkz788qfZDuM8DyUllJ9bP/QQUEnUF3maauAObYIWxpBgaMTQPIjLwq00xfP8NH
         nFSJx3qux2v8rofNlnvGQ9nBerlWNPvCtZj+8SpBOtCGRBM5DHm+V0XAN2wY0OS87mD4
         FGX6aR+BwAuI4A8vVWjx/HPxzbZANrbUpsgN596v5MOn9YRI7n/clykXOyjjRNk6elCb
         qDKkIAuaPlpsR8iDMACjA5I5fblCS13l4XYizh6uGByWgInCpPlvalMx/t8NM3sxu/U4
         MBs7Tm6cTLB27t8P/xCHvHiYzQquGe3L4TAZWu25lrBO4dmDnbGWatdaLzx+6Mm4sLVu
         Xsog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640077; x=1785244877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pzm0TOt37Nn9UAlWvpmSRCC3YSQDv8P/PcvNVlb0Ee4=;
        b=pRXy/8WZQmxgJUhPjaipMrLyDu/8hIUPem5cSwWZ4mTB4XA9VCo3r1ab/03WtJhwj8
         p/tvpbSVLq/P3e36t+OxZxXoCVDWsBAT9HaGogYTBjNy/fL8quzuED0r515KbrmTej/b
         FcgjSNuwjMU6ZEcVuVFJhOm6xajFejBuBw9uq1MjyvKR4VulGe8b4nFXFuCwCCLacBcB
         4HeoW4nx3rJSk1rrCpA3ZSPdsBzIHmxJc4m1udPhH5oxkT78sXJj5k+E8+nJXqIF2N9V
         AbrQIi8IAKV0XXbVd3bJyD/Z8EZVJE/YVhn9VK8GlkVyu1OsUdQvKx3pipQFkKGKE0ph
         XKlg==
X-Forwarded-Encrypted: i=1; AHgh+RpG4KHh4Mz6rH1htV5ysG+Mh5F7xpD2mEGB7TD6/p28hN1vIqUQBTaH/kqiAiHLuvrQiFqrdL+wKnsGGIsC@vger.kernel.org
X-Gm-Message-State: AOJu0YwsrENe4XOF41y/RPvN3dKTYo58f1NEcbAQVj1RXzLOAKeABA/n
	3IclTgSlvHJ0+3DWO4fBKEhOaI3TNRPO3IORG2ycHqwvWLeVsR6VnJLfNY+4w4TxDe6gqTo0LwU
	e+Cuw/VY9twi9/q6MW6uj/BnQk8nNwMYzcwm6chTN0Zp0ANVWSUj6XJ9ueNnuJ3nAZTM1CdGY/5
	md
X-Gm-Gg: AfdE7clBb41LKiuu0ypd2Y/TkAte0/DCGnhVdH3Iyf/Sog4N+07MqBQ0F0HWVyH4YBC
	2xrLBj4KnvWuc+vetrnNhXCKqtzPGvoo3+BfG9GlpxOwnjRLnRPaxlIiOoUtodnc1OWsVme84yc
	atCmEL6NGjNlk9NLBkvMW4wvI6QnB+lyGTnpYQ6tjKY3060cVSzXzCcP9hTvBdR1z0bI0pxqflJ
	BB3/ID8TPN+u2Go4ZtEUVOCXjC935VyYZ9rfnLuZ6KuePMHi1Fg8HMACQgee+urA18AIvhDggJ5
	qa5bOmUC13GLY1bfAZ+hwYBbyBCq0PGeDebQXoGMNPjSq+ONIlB7Jh8LUxHpmHZpXvpoVcJP5H3
	vt55ZDRo4/fCDQGzKnfIw6nIoG0TnY6jdR1e6gMBifNK0IU1Sth/XHNEeqxN/C7pR18dxSYyn9f
	O2PQ1uqEQajwNuPZHILiv097MHpa4ie+fTSf0FdRPQXXia2A9l75A=
X-Received: by 2002:ac8:59cb:0:b0:51c:12bf:d4a6 with SMTP id d75a77b69052e-5213e48ba27mr170446641cf.48.1784640076567;
        Tue, 21 Jul 2026 06:21:16 -0700 (PDT)
X-Received: by 2002:ac8:59cb:0:b0:51c:12bf:d4a6 with SMTP id d75a77b69052e-5213e48ba27mr170446071cf.48.1784640076018;
        Tue, 21 Jul 2026 06:21:16 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a5f8c5sm598326066b.34.2026.07.21.06.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:21:15 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:21:10 +0200
Subject: [PATCH v2 3/4] media: qcom: camss: Drop top_ahb/ahb/axi from
 QCM2290 subdevice clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-camss-version-v2-3-b2440d99085a@oss.qualcomm.com>
References: <20260721-camss-version-v2-0-b2440d99085a@oss.qualcomm.com>
In-Reply-To: <20260721-camss-version-v2-0-b2440d99085a@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: YjS89mO5dWUR3CsoRsboC8w4zn2dYx8U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0MSBTYWx0ZWRfXxWMEMEN0t5o9
 e70/4D+cuIsHEHBggrIptJNAKgOXmrlToKLKLqXGM+UR/oAX8PpedpcmfpHxoIOGsgkNxxGJBt7
 LW4i4NvIHrj6dJjLgo7cPySKGF7NZ22yUH6zGn041MjsZu3nBgdtsJqVGcTwKR5KnahSBoaL8Kv
 yABVVb0e3xU65vINMNuWExZ6q5Jmnj6KurBIrUGnSjVPOmBlahDfjzPPON+KczUyHdUABxmW67c
 YQCC35Gloxvf7/HkHj8x+1Wwl3FMIkvdGiwaapCe6B7g5nHgJ/qDVmQMJNsHM4OR87hr7kSNXqV
 aYXZx7EW2DONRroOdObubm77CMBoDPWv0Hb82vJzjzb7TRmsKN1o/LqR22Cv1RHRrkW941sIZve
 tgyKM8TsdUVSUwujXprCbhDPQxOX2Vn/ijM+SI2a9QFb5uxbiv7Z+99DMknWZq0QrNoGxh2ujKT
 qWC4c74ees+Y0tAhLJQ==
X-Proofpoint-GUID: YjS89mO5dWUR3CsoRsboC8w4zn2dYx8U
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0MSBTYWx0ZWRfX9EjJaI4L6oNk
 yOdsHAKQThmCPak1BHPGa+vx259KUJ12DOtzNo3G5fkWXQ9V7iQOQRiCcyOkwaEPKzMoux9kvGa
 WVuohVjBUO5Qw/uBBj10da3jc63EGWI=
X-Authority-Analysis: v=2.4 cv=QK1YgALL c=1 sm=1 tr=0 ts=6a5f724d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=jcYsRx50IvbP8YDAZZQA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210141

Remove the top_ahb, ahb and axi clocks from QCM2290 subdevice clock
lists. These clocks are now handled centrally as global CAMSS PM clocks
and are automatically enabled when CAMSS is runtime resumed.

This avoids redundant clock references in individual subdevices and
ensures consistent clock management across the CAMSS pipeline.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 38 ++++++++++---------------------
 1 file changed, 12 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index a87161f3d5524a6e40a7281e28787538613dd9cd..1f691b8940a9b3d8a9c03cb3159ed711d0d18e77 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -688,10 +688,8 @@ static const struct camss_subdev_resources csiphy_res_2290[] = {
 			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 26700 },
 			{ .supply = "vdd-csiphy-1p8", .init_load_uA = 2600 }
 		},
-		.clock = { "top_ahb", "ahb", "csiphy0", "csiphy0_timer" },
-		.clock_rate = { { 0 },
-				{ 0 },
-				{ 240000000, 341330000, 384000000 },
+		.clock = { "csiphy0", "csiphy0_timer" },
+		.clock_rate = { { 240000000, 341330000, 384000000 },
 				{ 100000000, 200000000, 268800000 }  },
 		.reg = { "csiphy0" },
 		.interrupt = { "csiphy0" },
@@ -708,10 +706,8 @@ static const struct camss_subdev_resources csiphy_res_2290[] = {
 			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 26700 },
 			{ .supply = "vdd-csiphy-1p8", .init_load_uA = 2600 }
 		},
-		.clock = { "top_ahb", "ahb", "csiphy1", "csiphy1_timer" },
-		.clock_rate = { { 0 },
-				{ 0 },
-				{ 240000000, 341330000, 384000000 },
+		.clock = { "csiphy1", "csiphy1_timer" },
+		.clock_rate = { { 240000000, 341330000, 384000000 },
 				{ 100000000, 200000000, 268800000 }  },
 		.reg = { "csiphy1" },
 		.interrupt = { "csiphy1" },
@@ -727,10 +723,8 @@ static const struct camss_subdev_resources csid_res_2290[] = {
 	/* CSID0 */
 	{
 		.regulators = {},
-		.clock = { "top_ahb", "ahb", "csi0", "vfe0_cphy_rx", "vfe0" },
-		.clock_rate = { { 0 },
-				{ 0 },
-				{ 192000000, 240000000, 384000000, 426400000 },
+		.clock = { "csi0", "vfe0_cphy_rx", "vfe0" },
+		.clock_rate = { { 192000000, 240000000, 384000000, 426400000 },
 				{ 0 },
 				{ 0 } },
 		.reg = { "csid0" },
@@ -745,10 +739,8 @@ static const struct camss_subdev_resources csid_res_2290[] = {
 	/* CSID1 */
 	{
 		.regulators = {},
-		.clock = { "top_ahb", "ahb", "csi1", "vfe1_cphy_rx", "vfe1" },
-		.clock_rate = { { 0 },
-				{ 0 },
-				{ 192000000, 240000000, 384000000, 426400000 },
+		.clock = { "csi1", "vfe1_cphy_rx", "vfe1" },
+		.clock_rate = { { 192000000, 240000000, 384000000, 426400000 },
 				{ 0 },
 				{ 0 } },
 		.reg = { "csid1" },
@@ -765,11 +757,8 @@ static const struct camss_subdev_resources vfe_res_2290[] = {
 	/* VFE0 */
 	{
 		.regulators = {},
-		.clock = { "top_ahb", "ahb", "axi", "vfe0", "camnoc_rt_axi", "camnoc_nrt_axi" },
-		.clock_rate = { { 0 },
-				{ 0 },
-				{ 0 },
-				{ 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
+		.clock = { "vfe0", "camnoc_rt_axi", "camnoc_nrt_axi" },
+		.clock_rate = { { 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
 				{ 0 },
 				{ 0 }, },
 		.reg = { "vfe0" },
@@ -785,11 +774,8 @@ static const struct camss_subdev_resources vfe_res_2290[] = {
 	/* VFE1 */
 	{
 		.regulators = {},
-		.clock = { "top_ahb", "ahb", "axi", "vfe1", "camnoc_rt_axi", "camnoc_nrt_axi" },
-		.clock_rate = { { 0 },
-				{ 0 },
-				{ 0 },
-				{ 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
+		.clock = { "vfe1", "camnoc_rt_axi", "camnoc_nrt_axi" },
+		.clock_rate = { { 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
 				{ 0 },
 				{ 0 }, },
 		.reg = { "vfe1" },

-- 
2.34.1

