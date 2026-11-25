Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593630;
	b=JknM2XMTcBMg6CiSKWe9rCuH9f3UMF3q7/LTNi76v2bq3RdIbjQSGLS/l8u2jF4kxgKc
	 oflxEdVdkr5MSiwG/2Ectrc5P25lij+CQipq/rdPTqLhYiSCpDshOTfmjf6q1vr5vF6RU
	 DNI1Z8FIfC2VNe4xS/R8PInzMAK0piGnb25dAFmWOD3LdMBAVx8pD0e3lwQRmuf6xdGe2
	 bcCIKk0kaHnEkKFSTsS25JN9imGtIYWDcqov0emAxBIXVVMmnMzEWLeXLiR2dzMgapZJR
	 VAzNyLYilJ5aiAM1tTTSwJeng7zZkGDCAEvktUHq+7pSZPz8VnDoJfvLwbC3jIli+qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593630;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=roKxUa4JIcTuifH94iqMJAT/BBOaH7ODw0ht5sDegWg=;
	b=n11Zql8ndcH8Xcfl86DBjxFe0Mu7WBLw9+LzZ5VPFpweAgef691K82rMkRaHnG55U0xZ
	 aderGVzLxWhh0jZgqDGCsr8pGvY4DhoMO4V7RDTrzsAztmAOqGjkJqxefREN5xKxB9wxn
	 iNxi7yOQcWQ8mFBaUUE2CsZtyS7LpO3Tt6f49+3JNGSyha7EsTDCkPA800Fjvu1W8Unlp
	 Jv+jKpsYYHCS4vY/BJoFw5zG9LPaRtFv8QDPTyffm9ORONF+dzu9fTYBMdvndGoHa2p61
	 snKQgzOtR/wgTdA8fexs+N3pANopRut6+57In+jzk6cNcndhSl/6cjw9HmSaudqSQkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=fail reason="signature verification failed" header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k41zDtuP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C362D606A32E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:00:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C362D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k41zDtuP
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP698rr3114990
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:00:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=roKxUa4JIcT
	uifH94iqMJAT/BBOaH7ODw0ht5sDegWg=; b=k41zDtuPpn7zGE/GWiYmqan+VOk
	kn7JnGcP6AtnIX2ksXuwgxMya9IWF7YhgSZAzMVWiUBYSBtzRtrQwUOnJdMQKZ5k
	J6ujSsL2SSd2wUGOxrT46v7QCD9Eou0hk3cMJd3v+F23e+IjpSigb4pepgVy+1G7
	Cjdt9clWYmJ0ih8Tvt9QuQ5HBvEgqgf0UQHudOVc25mPdfBRsvVi++gA3EfgrUHo
	MvfJBuLRbAicHbO6h5xd6dIBMhr7y5bASCo09mDVdvwBAdxD3xwZ/zRomWTajUXZ
	lgK7+1pdiKFnz3M0Iq8BpLZITW7y60vIi1uEXuJXGjNfCpzfjPwc/bKrF4A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnsadkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:00:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-949b0d322fbso783648785a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 00:00:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593628; x=1796198428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=roKxUa4JIcTuifH94iqMJAT/BBOaH7ODw0ht5sDegWg=;
        b=vasXjfKxRHrwNOBMHtoE9K9pubih/EfFmSCLvOu2nD7tyAdAfLrs3WGbWA55XaAyZt
         5yftMr5Xgi41VquJw8UCyogk6XXCzFSraz4Bhx/YBBmGr9uiuYEkbQPwZza6eNR4mYaW
         Zg8zj2f5QyDQ+ZKby0LfK/y7nE5Z9CnHhf0g6ZqJ3WTPOO57CkAk/IR3Ca06UBxhmhke
         NM3Te1z4ay0Caf4flmTkrnz0aNCMeHPtFM6kGWjtC++0YpTdZouqlzRjry4KUNlS/seG
         UhjdEYTBZV596CCsTYoEPKmCeMETw+qGn37jehxzPcqh1mZBWpGsiQwVZAXPcbpuWQHZ
         xU4A==
X-Forwarded-Encrypted: i=1; AL+hErEkaGktPeV8GUzlG/DsmABXYuZI2cqM57IYlLB02kErSABwrC0pHPKjCDyFMp62n1qtcDQS/7W9yc3Cpk34@vger.kernel.org
X-Gm-Message-State: APuU4Z8uvsIf97xVShXUdE1Z2RLPJ+Oo2fbd3nZz+5OfBnSg3vOgbDxs
	FTN0l6z7ad/fSJG88Dks6u6LtEqc7oB3fE3TcsQY8Is5JaWELgXzKT7mbp5DkWn/m2NuCQpu88r
	mUtsx8wUAGYb8MgFSbBe/2jDsBprl2pB6Vm5pZS5txZqC2UhW+oRtbNhBqJq3lgX6HDAr
X-Gm-Gg: AZFdTZcjKJeArJABSZm670VUfsdAAG4H+izdpnXRDwYm/qQirMKAlLKn2EkChVi67Nw
	6yUAE21cn7mwiPFrRqbLlSAA/yErctC4sd0+nUCsJEGFofH5UmfdkqqiWsDxcRzndt7oxs2Yq+R
	HeyDxuJjiC5ntt0Lpkjdmd4k6pNW4v52R93rk5e5ZJxYoOsbnELw78pRp/5gS3lj18qaorg8Nah
	R8LcOjrOliHG/BBhxRaVfFn3kTY7x6VKtbp/8Z+U57DwUH9Hp+hhQ3FQOpFH40saAmaKmJTS+7p
	YtSvwGX9rJEmIO8iwoatSJv4y4hUB/SKABgYGuGd23awF1knM8tvDuwMQD6N9PH5BIMDuGP2ACT
	CZvhCl6f2Sz49rZ25XbdEB8PT1qvo5wbr
X-Received: by 2002:a05:620a:5386:10b0:949:bed0:b895 with SMTP id af79cd13be357-949bed0b9a7mr2140964185a.72.1795593627843;
        Wed, 25 Nov 2026 00:00:27 -0800 (PST)
X-Received: by 2002:a05:620a:5386:10b0:949:bed0:b895 with SMTP id af79cd13be357-949bed0b9a7mr2140957585a.72.1795593627354;
        Wed, 25 Nov 2026 00:00:27 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm585912015e9.11.2026.11.25.00.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:00:26 -0800 (PST)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH v2 12/12] media: qcom: camss: Enable streams API on SC7280
Date: Wed, 25 Nov 2026 10:00:01 +0200
Message-Id: <20261125080001.2540101-13-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-GUID: n3F7UM_8dVPwV8mjEkJWTILyDGA5K5FH
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b06959d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=ZovgdgjKAAAA:8 a=EUspDBNiAAAA:8
 a=nrc8VjnkgqnvnCm6B8AA:9 a=PEH46H7Ffwr30OY-TuGO:22 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfX7WtBMVWJMaUw
 2wmRjDs6JpB5JiMhPjEy9TrDu3EJhCbeghhTU8GZP6ovdXFU/sAvG75FOJs18YcIOGnCkE/NDLJ
 mpyvIm73IwXLFyFWOHP1IZk9CiIy5YE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfX71x9fiV9NRnA
 R3FWJ/PoahsNOsDkOpwuPhaM9R/wpOlmH6HHNWOrGJmxBhsZYg1e68hzqT95QGIBsrwFv4URLGT
 A7DO6Rcw59JDNkkDUWnk2vHB46pabFsqpyjFWV6wAj9XMH0ntBP1OzhnEF2vibkPtICK/gG9fAz
 HyMnMOhMADyYJPIsATHgwvAet4hjCpCyqKQ/bOLIH3I18xuvrKg+LRWK8nmlzmBjxt/7eIw6JaD
 DfBlumBWkW5+hK2QhPfwPrzPIp/0fL+sccXMw3OJIxvGL4C6v7wb7Gzab4S2BG6JEJTBNZj1R8X
 pA8EChMBtYzQhrWawmW6tD8IU1rEDi++a/YLs3+E0GY6peLovEkcyKdzgKW5A1S059LkCgVlRsG
 QuWeTctOFXSgoS5fw48Eu0BTc1d3m3xGlb9qR7uw8C5bKwpzZvufuKN5tOxlX4zokR2tB3ft6l9
 QLAQEIKmwgPUZDoRMow==
X-Proofpoint-ORIG-GUID: n3F7UM_8dVPwV8mjEkJWTILyDGA5K5FH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250031

From: Hitesh Patel <hitesh@ebytelogic.com>

Tested on RB3 Gen2 (QCS6490) with two GMSL cameras behind a MAX9296A
deserializer, one camera per CSI-2 port, so two independent pipelines
share the deserializer subdev: both cameras stream concurrently, and
each can be started and stopped repeatedly while the other keeps
streaming, without the WARN in call_s_stream() and without the second
pipeline tearing the first one down that the legacy s_stream path
produces. The CSID test pattern generator keeps working.

SC7280 has no camss child node named "phy", so camss_detect_legacy_phy()
puts it in legacy PHY mode; the streams path dispatches the lane
enable/disable accordingly.

Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index e444c29fe847..60d3d21f6548 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5819,6 +5819,7 @@ static const struct camss_resources sc7280_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_7280),
 	.csid_num = ARRAY_SIZE(csid_res_7280),
 	.vfe_num = ARRAY_SIZE(vfe_res_7280),
+	.streams_enable = true,
 };
 
 static const struct camss_resources sm8550_resources = {
-- 
2.34.1

