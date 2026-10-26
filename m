Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021862;
	b=3iPWKQOKIx9uttvqmpXRdmOnbTBuZ5XfC90aI+uQbQDhdsHd6qW58S12JDrwUXpoI3at
	 VwD4O77oYARr8segR9JvVlWbhSxuHb26E2/D7ELqaYF6SO9kN//DWYENhJuRmBHRxMWBj
	 01Ft/wwpnXgW0UkvvjTzIv1a8foK1/vohE0EenDVIdhJYVxVhpcqHXWD4W3TTjw7GHj/Z
	 fvAP0zQxkJqFJ00UHkbehJ2c+Nxc6m5z2BN6hhR1K1hoy5gVtoxqLhGoHq2mtHTZQkwqw
	 0qHc24HNiJzqw3hyiO1ZzrnZCWo0Dsz6neuqHwY9yuCzFOEIWp6OHAVPD+WYxm+4tBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021862;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lqqwgC5/0KhExGOAHtY1KTfOuh5wGUdsX0Lp3kmGb0s=;
	b=123y4OBdgXGbBeOzJ+RCK5NX6d0jw6mfxIRBeRW5PYsoaJ/mTWVNT8RZ20pYycz2BX3b
	 auyKsY+uQENkHa79sZCUHODrH9cBux4ojJN+JUIxlJeFEx3cfoMxTMfqZvo21i7JHCyAb
	 s14+QswtDChfLSy1fTntMOYL7t9lP4OFIeP6v/i4WEDDgOJyNzrBo4aMFxGfIKORcqs5k
	 5Ow9YCPAxLCiY6xov2Gf4p1kIs8Z3s7CuFH/xv+1f/4NrV3jLgMctCo4gZaL6Qe2+yPh+
	 KxuoQVyCyAFLV7653l4wtTCLP4YbwFRkXmyhI16VYsxdgjawZ2B4J/Frzsg1pH7OnHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Td0jXBRR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=By5Qbp60;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872D460A6F70
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 13:37:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 872D460A6F70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Td0jXBRR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=By5Qbp60
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt9NU3049902
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 13:37:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lqqwgC5/0Kh
	ExGOAHtY1KTfOuh5wGUdsX0Lp3kmGb0s=; b=Td0jXBRRjKe7S/xNOMQUUgsQaGl
	D8UgnqBwonpHZoea/NgZqIdrx8U3oZrHgpXaGklk/AIGcYbsCXC6c+px0R9FtVaU
	L0oeNdVdqLTZCGRxApMMfS9q02vYGOsLzQzZlQARkv1MwWsv0SxB7jGiDbOEf3M0
	RvMZfI318wRPWPWTcdEmMd/zA09lxPF5+MYM0MgfqHkQ3IHr7WKckrq0q0Jj5nlq
	fX9VKQzV54bkXYiraPTcXp0iORfBTvzYB1HaV7BBFTpvoy1dPLIummA1ANsyAnIv
	RI7WfakZ/ef1Hawn4q4/QeMHxrgEbR6aF/1zGooiCkDcPGThSsAs6zeFZjA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvddacby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 13:37:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so683163985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 06:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793021860; x=1793626660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lqqwgC5/0KhExGOAHtY1KTfOuh5wGUdsX0Lp3kmGb0s=;
        b=By5Qbp60j1ELgcHC8UnlOOAAZgMi/xpiw8AukN+4OrDdntPftHEzOpxuUVWE+bl8Nh
         otgFbAngZvE11ElXcNomkuTPVhe0OrIhLd8pWZLzARB+IzqZyXmxYZ1QgOmZEYtTnTbg
         9P+JofF95BtaEpO4Jc4C8Tlw9JRFaY6Tsn/O56xRxco+Qb/ltVlTLtqgYfOvMj/DqqnL
         ekRMsZrZooQ/CHB8IcKFxFteXwdsM01VyJWaZIEOlIGpBp3Im42UpZb3FDpgQqE+MqOZ
         3wKjeF3rY0OyLh2KhWQCsfZiPAAP+tnVN3mlzhzBWbojvneVy5SoEZgZdIxS6w7YMnt6
         qpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021860; x=1793626660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lqqwgC5/0KhExGOAHtY1KTfOuh5wGUdsX0Lp3kmGb0s=;
        b=GjPAbUCKWJaHhb7rUuizy10xP4UHksZQonZG326KY1crkDmEc2zJNmehkUVmct1+RD
         c7ZzYm+5eX0n5QR75Ucr6HDBtX6MuhLsi1flEvcXYCBohLULeeoG3n6UNbEnYe2Gy83n
         WBGOdVZ08PMiMhKfumv7dTEtOSMzn3GEb0b06mtE21cVXraZNsLaPgjJ0hTTtp1ct2pK
         ANOCq8hBk1s5WUqXLJiwfeggs+aR8Lw27+I3Y99NW6OQqF9rsQAUnxbWbxRFdi9TMG5Z
         ZdI694CJ55Cov0t6qGwJP5RZ6lso93HPe9+I0FZZY85ysZdPEqBbC7kKknD3MyVI5mdZ
         HWMQ==
X-Forwarded-Encrypted: i=1; AKwUvByD35AREM3+LUKN9TpWr1FWlQGKN1KICuiJLgnrpDNzg7q7heGI55smY2YL6uYPmeDLzG0uAfOa+WDGWn+m@vger.kernel.org
X-Gm-Message-State: AFq9FYLfKqPC+YmI1DTXhAvxo/D4+88nHqNzLE3gIwz2GePW/po4Ij+s
	KokNtN727a9CRWKlP7I/O5a6SY/kdsIaamAYfE1UM6D1KjUxNkKyVY/wWgxpdcEmSd1ftJ6iNvL
	ph+yrsz4ZXKafn+QtDjMOgS7dsRelhh2Wr9BLvyAGr2KtTlJIlulNTAM9soZmuBe1i2wG
X-Gm-Gg: AYBFou39irhfKYDNdX1qVoZtx4WA3KvMc01owaHucu8EGz/pu/EyvAZBKyikueTaXVw
	a9lYyWZ1rxjf+i2ER2F0wu2GKGFu7pzISLZVv+uBALqUSpxaTXfYPTGPlla3FnhUnOb8kLVXgy1
	X+GY7QUEyChTdGA/pD1g8/IKnazeJx3h12w1ct/IWY7eaDlveG1YeH2Z/I5XuerCtK7o+VGHtDe
	PVyx8NqF2ybWTes0TH17gbhMriVVk/AuCEPAa/ykX6vI+rJt3JzlyYqYvpfmfGmZhXhm8xJ7+w+
	XnWzgLg4UbmFpnSPGJonvpHlDIjqf0UNmi4yJTBfyYTBOU1ICBOts8mSfPy90ylRI7DiBmIvvGd
	zQ5cwGY1u+rYhMg9t12iPf/kI
X-Received: by 2002:a05:620a:4725:b0:93f:31f0:6a77 with SMTP id af79cd13be357-940ef91b688mr907174685a.11.1793021859841;
        Mon, 26 Oct 2026 06:37:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4725:b0:93f:31f0:6a77 with SMTP id af79cd13be357-940ef91b688mr907145585a.11.1793021856525;
        Mon, 26 Oct 2026 06:37:36 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f305sm15376512f8f.3.2026.10.26.06.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:37:35 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/6] media: qcom: camss: sm8250: do not set VFE core clock rates from CSID
Date: Mon, 26 Oct 2026 15:37:23 +0200
Message-Id: <20261026133726.3249235-4-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: eU6uRzQcuQsjTzxbzVl_qPWCJAzU7HO7
X-Proofpoint-GUID: eU6uRzQcuQsjTzxbzVl_qPWCJAzU7HO7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NCBTYWx0ZWRfX47+fNUwSsrHd
 MdsnMOhttYc9I2tB7Wpu/jBSHSuyZ2DoCbJl2uuUDWwz3UTYikTEIm/djEfwE8K3zGhmr6A73o5
 e+vZ2CYLWbokSwMPs67sKn6g6GN0KHh0+RMj3mGfLtcm5mH2npT7pWHijsrGtnqWxkpE/eNMC9Z
 Pm6/X6FKimivZlOLQTUkixer+ZsFWrDYJkKha00hNAXll3167qqMlj7RzON+fnfJd46N1Y0fqlL
 /7PWwghMVV50vszFA8053n3t5gRfyrxjL2JFjGcQbng7/7Eoi0AMNQcSpUOLhyKZt9V6uvvp5gf
 ilgyxWCqc/SkqSg3/f1EPp0i09exlqso9a+jaICKaw5AJYf8shkRMRXQwHWQ/mRJu+TL01dho8x
 83RmpZacUuvKIr6D8kz0QW24K4VrUf8thkQbMbq/TGW4cr1kUc1UofGjVLuzgkz3uFszLCEQjKr
 LIHObcC/WPk95Vn7hLg==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf57a4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=rPRfP_fVeLzQRQyiyREA:9 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NCBTYWx0ZWRfXzpGpfP99kvJA
 XQ4s4HLD0PhFoU82asze+m5MxYPKdxpKt+qKSq5D1UovzpQFKY2Pwsp1PFaq2yWwpGZthIsD+Ri
 3kIjO/JBnFc7fgWtGePwgkUiuEIKyPM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260054

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

