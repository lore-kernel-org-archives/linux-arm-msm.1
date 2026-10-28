Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193864;
	b=H5mp0mmgVbL523IE/jn0aFi9Y1zQBODST3/kK9pXegZL81mNcDkefH1K/7O7wNjDpcZs
	 BN64aLJnv4sq7AgnlF0HAmH+YXe4ZqlqBHRa8Fx31wS+EBY8nrim+hYl2pigAt+Fbgats
	 hqaUz1GWm0Ol9Fpxb6Ei9x//yGCyiZ9CIg2QR37pHyKdHcmNtS1XCQPeGED63ZCsHG/zg
	 XMzRvCoDoU4h+KmhOPeY4uNX3IZnV7RkuSVTiZRypO3YjRoPWTzWP5XPwFfyAdoGcJkb/
	 35H6PpKzgAWGFJVbxrNTAhng22aoqfIsX9X5faUEZxSYUNAIr8SMInyPkqjx2xTt/5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193864;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wAC/SldCPnNA+WsUjU6cUfaa8rufpG8GWvTQo1tuJ2E=;
	b=m7UaCoajcz03ekUbbYcw7WCH3mtJD0+hSh3GH5vrFEjn7lXNtEoGWfubV/MTsiTx3A/m
	 rcJ4+nSVVYBO6JtSMXPExv7nCKpYLkEnbDkYAvlP4MmGPFhD+xTsz+HdZQCKmlrXQWquS
	 lUpu2YPlDRmW0t796OcAhSLxyijYKiff0PwbzTEbjzrnejmMEQlfS0LiKxwJmAqCqFZAJ
	 CFX3BJMW+NnuIQUKdJ/79XAuMHPNN4u/gLo+FFSr+VzChkzSfzwy283rbnuWPZB+Z5Gq9
	 HzPMkZWHZJ7+rnfqpyCARVZVvOMcmTosVIvu7Azk8RDMTbNNmE3BPh5KYzT4Ci81HTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=As0sDMqr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TR7Iqgp7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2643F606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2643F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=As0sDMqr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TR7Iqgp7
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe94i692131
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wAC/SldCPnN
	A+WsUjU6cUfaa8rufpG8GWvTQo1tuJ2E=; b=As0sDMqrMpPuemuxopQxV3UW89f
	APjAaziJ4+j8BNg/TnCqXxpDC/YF+GPKIW94EXkSIcEBqI4NgA2Yll0ds2R3NAEZ
	rB/ju/RqbhvbcQ+7Iu9DGtHpzWyXNVAVfG0l0vOpAzrJFP3d2YkWBEFZ0edGWNVI
	3WsRWXi+GsYa9h11zcOnE1XrKfyeSLTWnNxVcE1X1BvoPffiv1hLdR6UM6tVJc2x
	klDtqlAbKGmOhGDT3k8EZOuizt1p0Bq+t6sWm50eAtyqv+S+LAetNdKr8r8eOfUy
	oLGdPS/NCL4pD70GWAha8ij/lGFJcI9gIAzpmvBTj87uCekruCG966dZoMA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be2mau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:24:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93909014c85so189538085a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 06:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793193862; x=1793798662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wAC/SldCPnNA+WsUjU6cUfaa8rufpG8GWvTQo1tuJ2E=;
        b=TR7Iqgp7v6xWr/Q8KltPZLbqGj8ILcXO9F7aXmVk8Fl5PwjjtmfSX+oKVh3Cv7R0og
         W730CltPQ/CX4nopnw1kTOmqIDRh3Xqa9KnFqvtWtN1XVVruaMvP7GRZaEqRuRRA6vss
         6dPtm9BNr26MUKKxYxQ1gqBetVnl4aD/D1qK7fu9PvevOBH+a7ldtpfwgondcyBvcLmf
         S9oLxJfb9zRM/qnb/R4X3ddzqCz4o7M6oZjBI18kQ927taT2OrNIuvKTTrVuPwH+4aw6
         ogsbyiJncfqgMdPnMDrnZw+PFGwuf78q0Q3icftGK0xI2p2hmAITV3dGZ6EKii1xYOyb
         Izkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193862; x=1793798662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wAC/SldCPnNA+WsUjU6cUfaa8rufpG8GWvTQo1tuJ2E=;
        b=YfIHb9KNw/wnr/Z439v8fgKIfBoMiYgAuIcV1bI/cLHIIOzKkgCuo6CpsBiH5juRzX
         UXN/kQ2swMMNRL7bXvLeSOM4FYj3Jk8mEK67UcPyYZu01NfsT0sOmAQlCvoE4UCwXLvC
         pmEwwq1y6Tg+XSekxgw0ZRYCm58TOyCoFzbvQPLXidoP+C41Ums0J0/nZwHsu0eYR4BX
         eM8mV8GlvVKgfXRSzWRDLVu/QFgchzshyXILJvSxpWBoMX7dHPj9/McicxDxRV9lDZYN
         GRxkgoKkM04kERI3mJ7/7ONPOhj6GHWFBmBdj1JoOGHahvkAaznzHeCNDERhQTNBUhV1
         o4QQ==
X-Forwarded-Encrypted: i=1; AKwUvBxX0bjKnSPIwQoq6UoQWdqpC9DyGARjbFCb4T42t4mq9xF+ufVRqLI10v9gfsiG09KXUn4jbiVsh2b+uEcz@vger.kernel.org
X-Gm-Message-State: AFq9FYIuw58M/s0e2McBW4tvtSjmh+zPVX6L+8GZVk5c/C2qZz4OmBHq
	U1ZJ4vd/NbIrPCqXShrz87WTZi260fZzgEZlWRuWAA9EJZXJm1CG7Vc2gI28Qn+1ZtlfrrJC0Zg
	nUFkN/DHOOgCRr7kqEdw5QJ2WfjVfLzwSw6kpHLHv0m3WHrgEy7oVae4cptm7yss1Pq712K6tu9
	lvhm4=
X-Gm-Gg: AYBFou1/5y01e4w/MiSx8QtVOk+ZGlD288L+TOxw6MvpHgHPqIs1T1uVbWygloo+kYa
	zxh5H1BcA0hHnpqSom6oZCiWH+jlCDb/NIZBlvXjxn9lvZH3eTnFvAYkzpFHt60Yl0ucOwaQOUP
	teytS4P2K/jEFjf0X4r2kJyvBhdHyqsbIS79Ql/CIQdQaeb8Vi+9A1Hm9MNvDSkiysQxrOisxTp
	02HsQ8HNVkh32lFJeGYZ0fxXRqYsiZi5skhi/i0j8qxNfHHfXuAXnAy++oqs9iC0ZbVIVGnY8W+
	Ox1Mi7GsAd51p3Et8zJzQ5saB7tlHniVEfZf/a6/wVp/yWWdbSoWs1L4Oq40Gvxa2qV3ywNJHJ+
	wj3trRV5g7lRclc0OJ485gJG61lS4eXv6DZeU7pbhYknAEW0u4269WBkI7LfyvTnfkgo8OWY+Wg
	==
X-Received: by 2002:a05:620a:2849:b0:93e:5821:2c5c with SMTP id af79cd13be357-94408cf1bf6mr305856285a.60.1793193862396;
        Wed, 28 Oct 2026 06:24:22 -0700 (PDT)
X-Received: by 2002:a05:620a:2849:b0:93e:5821:2c5c with SMTP id af79cd13be357-94408cf1bf6mr305851185a.60.1793193861731;
        Wed, 28 Oct 2026 06:24:21 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b496435c7esm1457824a12.29.2026.10.28.06.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:24:20 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/6] media: qcom: camss: sm8250: set the camera NoC AXI rate from the VFE
Date: Wed, 28 Oct 2026 15:24:03 +0200
Message-Id: <20261028132403.3505037-7-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: UMVUZ5ijFlhaZ8_YtxU6FOBHnSPpH3e0
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae1f787 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=FiRPRoyJa4ALD98OXUAA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfXzyQsIF7d7ita
 ZmymQNCilygf4SZle5knoqMTCasffHGFOCc3dC/kdV83xM+Cnvpn/q6xqUyGU8gtcIkCOVf7zmF
 nLW0ayAAWjChUlyPWGHeMrl5UEO5uMY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfX1cB6HtbSKVu+
 iHBQ+EJ+oazmLyGOOMDU+kLyvAbbPGNWOMcgJFIsghE5jhYomva3/Jn+caf0JUfxHVFbt9bdbM6
 7hEfOG6nIEQLcMgddx5YyDqnt1WA85IYHkQ8ATWWThkY3ltHUlQo5Wf775pegLoSWKbLQW2MI6O
 3cIUG6dpXDbpwSR6rGO6yMJsMD6BqvrxA6xSpZkANbKjJY7vN/WlLkRYUzotkp9z9VmSSFL1FFL
 SCFm9QP8PNStNaRniIX/PbT8NOncszUS+dbGQtXOOgojBZ2SabFzcJ8F7jOjGTpsRnxrXtd2xyk
 ct/6mjFdVmDOXgANVTlyU9msn5sygN9vAVsFUJcta6/RAv8Fh53Nhoi5JBCxZhuULaMM2l/JEHT
 CYahOv8fBZ5RGE+KGneclW+OBFypmsEa1McGV0jSpYxWuqv6LL/vPRWW9AfyiEpqY6fud5q8JBt
 boYo9yWJWrHYME+CeeQ==
X-Proofpoint-GUID: UMVUZ5ijFlhaZ8_YtxU6FOBHnSPpH3e0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280053

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
index 9e29b713288f..6c3e00e043eb 100644
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

