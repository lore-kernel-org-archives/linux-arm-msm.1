Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794663220;
	b=dStoDf7gX6JcvDQc+MHYC3P+XaqeZ7f816RvpEjoOpcn5LWhfmjIt6KAEMkIbkS9e2NV
	 7QG4NJZgcydmxB0y8VM/xFji4G+M/j4PtHsNg8YrB0WVBnUkBUZVsRaHWY9273r7hJBK1
	 MXEAz7shWE7VRa2sNYQ4JZRNgbuAGHWR3WFiKkQEPoYwm4FScAJK4o5CmoS01OOuwMYWB
	 CbDLPdLznlgSib7K97vBN85/jU/g6ajofCvyZcvdl+WLXSQ2l4RjnCzqLvfhvWpOsMZYI
	 ng6++Z2FkgTNzjWXK9zzDaQHJgORLxmgq8h/lByGqpwrysp70T0RpB2J5CZkXkKMEgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794663220;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NUZ1WVR0lUUU/sgz51lkZn9LFadklqZ6tAy41kZyrkg=;
	b=YaAJoC9q+Rprs0+MlIQh2yXbRteLF628CHUDDI4Pobk2Wq+KjLJ014COnpKnoMseICMU
	 B8f41rOxaUDWsQZmUlq3XCLeF3dx7GpXZDPTzuATxRLMWwXgcmmCJ1VR9+7P9iOqzYCIl
	 547SrDyjZWH5VYoOT3Jk65qpiIK7UHznr6hVnvbjT59Wdydi5Hqi8IrNEZv50ekwPgpF3
	 vmri+MnwZl3UV79a8y1Mf/okO9ITtUxANG2Eh3FZU7Zd3EAopyl43LELPPG10RXGmhUXY
	 rbo6UFqNdbWK8QNCagv/eQp8nBFXQPY4pG3BWNX6/cc5fk+tTlK0XT52Praia9EjWpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E57rxJzc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RPLcLM87;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45300606A89A
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 13:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45300606A89A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E57rxJzc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RPLcLM87
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9xico3719433
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 13:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NUZ1WVR0lUU
	U/sgz51lkZn9LFadklqZ6tAy41kZyrkg=; b=E57rxJzcWbMfxwa/w6RQtiAFL1Y
	fgfg4I6+ekZjXaBONjBGxqb6gHVcyEyYhM/iPVU0jdvw1q/ONWaC0kO7N4Kq2ZhS
	s2IDvktIHUZb+NzH7vzRTlt4a8YL+MpIIv80+UgfxXNko4hIRUP+EHNA7u1jC9Z8
	0+T9svKKuPAyBDAxpGRzCynlBoDIjYM2HewMOvlR6lWgRQRwq8HjGIhqDqZhTeV9
	Ksd+j+Jr7PL20QFezmNxQQdFI0lVjjSG0plNas5p4yrfhZJUleFf+eigZdJlhp9o
	V2H6GBeR9aL9gmO6X4F97uVyapk/tdl4w44BJ6xflbSUkgTS22O7VL0vJug==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhk20u9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 13:33:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e95f8543c9so24605435ad.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 05:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794663218; x=1795268018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NUZ1WVR0lUUU/sgz51lkZn9LFadklqZ6tAy41kZyrkg=;
        b=RPLcLM87BXv845Oynl+SJayiyNu+wioRBXyTMXCRgFNitO1big/3nl03RfF8stSrGs
         Ykutw8jLXNN9OINyOABVtEFlljfOttDntXsOgnrFhz35VkO4GyyjUagCVnddjlNh3Ljr
         5V5qaBBdzlsweGttzPxWkSB25RphmA2f4prsBANnUGn/v3NyySGJ/GXV4SAKjv/AxX/F
         zS/y49JRSFLa0jdos1oZf9zGRnoovWdu6yutIrgh7xnHsZehazF9KSAQ46/sGrEGWisS
         /SnfpiFC4TDeyOPs520kP6+KGYOucPEdv91biZAxor/Z3e1j/1r2FQdJYBuHyzXwvyzI
         YyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794663218; x=1795268018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NUZ1WVR0lUUU/sgz51lkZn9LFadklqZ6tAy41kZyrkg=;
        b=BElaD56Q1jlAfWfo2rPvktzSOo5zKTQUfFOTZ0YGDgnK5YM8uGUlLqJyGN8BaRUCXG
         SFuB9sxxPbtYJUe3v2E03fvCcYt1yFZ/eh1VGS+2tq9X73Fj3rxjfq1wgWuXbDHg+msG
         AKDxaftJLqB7oxoWLC9ZH5UdENancJ+5Vj1G7vGhl03jl5FSmm8bnrchXxjdQXqMLjkm
         w4IhRbf73qBc8/XeoNhb1yVIRpeCK2i0xNb/BUSGDU8V2UGtsPq1S2vttWRiwDvhUpVw
         nnwtzPkvdXgURgwfEZqx7OGnQhoyu5OtCgjdv6l/xS6esUq/VX46X0L7aPcUnieN57LS
         Us9Q==
X-Forwarded-Encrypted: i=1; AL+hErFYsbspRnNxgzdUATJb03jLgZ4rK3VWD3C6tVb7DZ4MTpnvdA4h9htPU+J70SRk40rY9ONHfpMWk/25uSjv@vger.kernel.org
X-Gm-Message-State: APuU4Z80rSxpHWzYs8KeQ720ikBKlFLbHoCAzgSDVXziaOXyr61T/UWF
	7nLPhCcz7DecgNjxuTKEBgKGe9R02Pqk4olQ7KQzU3XnfsRG6M7mf4L5/99jxA/PszO1CgTFspV
	osQUtrQBAs5zT5hf/5k2RhfZX4TVkorjehYVdElQXcbyCOjX7RP2KTWrGyr6GIdD2M6d0
X-Gm-Gg: AYBFou05yUMw49Rp/d0TbSNzsIM6xbC2cpYgR+C5v20B8CbPLJp7HudPZjuyNF299M5
	d9UIEDP+oGU77pQWWDTHW668OvdnTQV+o43QwjzIvoNbvgAaOk6tPaYV+IreMp1Z/tXB3MnXlz1
	tTm13C/roE8yTuC3aIQgewx0gTdCvp47g8uopRkM2tAtJyHfuz/uQXgtIeN7ETsKiQz93JhHNbU
	/evax8PC9UhEu+tFDsIWPC7JEs6EYeUq4HeU1bd6U84+DmV7HmcuYSNKkN2Af0aVSNraAdWzVMi
	o+hwdw5OJJIaz6yr2WZXPKc/lP1cbn2AmcIkwX9OxWSymE+MxThPCZHWi+VZiSwpDStEMzzfNX1
	TpsQxIUVbYrO8+HXJKIdI6x/Qm0b7e6E1E8ZSlI79NTHAKita4iK75KlfXnQqKC0vbGT6pvrLI/
	BxiiEjomMvZUXu1f2VEiBKSt3LE2FJsWHWRWTR
X-Received: by 2002:a17:902:f545:b0:2e9:9522:ed3a with SMTP id d9443c01a7336-2ee0de4bfacmr53340985ad.22.1794663218183;
        Sat, 14 Nov 2026 05:33:38 -0800 (PST)
X-Received: by 2002:a17:902:f545:b0:2e9:9522:ed3a with SMTP id d9443c01a7336-2ee0de4bfacmr53340785ad.22.1794663217742;
        Sat, 14 Nov 2026 05:33:37 -0800 (PST)
Received: from ap-kernel-sh04-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8eb275sm20266965ad.64.2026.11.14.05.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:33:37 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/4] soc: qcom: socinfo: Correct SoC ID for Nord SA8797P
Date: Sat, 14 Nov 2026 21:33:02 +0800
Message-ID: <20261114133304.989635-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114133304.989635-1-shengchao.guo@oss.qualcomm.com>
References: <20261114133304.989635-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: n1gBa5xtLsY4JrZrQXoloS2u7NTR2zf2
X-Authority-Analysis: v=2.4 cv=QanzLcbv c=1 sm=1 tr=0 ts=6af86333 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=CRdk7aJQni9bi6iwJNIA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA1MyBTYWx0ZWRfX7yX6XRZPCV2O
 xXtKor8YF/ZPcjp22OqnXAgWh9xNI6lf73lPx0TvILJfZtkYaTdEmYkF/4qXijAxMifZIcW/Iuu
 FPp5ZjOHTpZCOyv6W4AhzdSjWHjrsoBtFd8PNobBLrc2xMzIKTuWwo3wLdqhxyBdu30ywSqW3fA
 ZC0AHfKXuU0iCGFlpCrvsjfHr0/meFAWr6D6HowrgKrBMIqXHhoYXH2arkZUPuPBkp6dL0nAkgw
 93GOrLMMCnkDa0ij7LHLY1shGEGsitlZYMd8wg9RrqWdSaWivSaDRMC92To57q/OcR+jpCkBdMr
 k34mdoZQP/6hhFnUCRxvz+CbTTIIFMPDbAQl8O3WsUBiCZiM/TXf9eSWf8Op9QUEW7eiW8/t3s8
 iTNPxovrimYR/tbaWgnZexrcNxYJW+Ue7z9X35eBlydIRpmXt4JBxktQtMjodz9b3PlAmLCU/ZL
 qPy4Ghmc15QU41MV+2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA1MyBTYWx0ZWRfX24lp/10riiyp
 91Vi94kxvaOHLQuF6rEZ1wE3LAx5mP04LfSohsFm965o9z6MEqJp548QIIHX3MVtlWFb7ULL7SK
 KpTw8bLuIBAN/ZdTAweAg7tsG6I4rlo=
X-Proofpoint-GUID: n1gBa5xtLsY4JrZrQXoloS2u7NTR2zf2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140053

SoC ID 690 is QAM8797P/QAM8397P rather than SA8797P, which is 648.
Update the soc_id table to follow the corrected dt-bindings, so that
boards with these modules no longer report "SA8797P" as machine.

As ID 690 is shared by both QAM8797P and QAM8397P, name it "QAM8x97P"
to cover both.

Fixes: b0bc160c311a ("soc: qcom: socinfo: Add SoC ID for Nord SA8797P")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 68148defb508..ecb4369fd309 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -529,6 +529,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(SM7635) },
 	{ qcom_board_id(SM6650) },
 	{ qcom_board_id(SM6650P) },
+	{ qcom_board_id(SA8797P) },
 	{ qcom_board_id(IPQ5321) },
 	{ qcom_board_id(IPQ5424) },
 	{ qcom_board_id(QCM6690) },
@@ -541,7 +542,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QCS8275) },
 	{ qcom_board_id(QCS9075) },
 	{ qcom_board_id(QCS615) },
-	{ qcom_board_id(SA8797P) },
+	{ qcom_board_id_named(QAM8797P, "QAM8x97P") },
 	{ qcom_board_id(SM8975) },
 	{ qcom_board_id(CQ7790M) },
 	{ qcom_board_id(CQ7790S) },
-- 
2.43.0

