Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981849;
	b=B9mCxu5PwbaIsKNhdlT4UtcaR0fJNRnE4lCiDIQDBer7YkIFNdQx3aMcR0n5DUROgsAO
	 gsraQt8QpeTmsq6RwKHKmN+s5pR2kT/tYoYqAcysMgMvbwpMQ1BTjchcA9GX/CSFQbMy3
	 c2a3moaXLNXxloUA+DNsGiRZPX0a38x4CJWwaKpwNd74q5Y0Opql6bkKSniuGbVYvq3Cv
	 L8hwtdhIIDs5BnB/E/JdI9VimjLMc6ZH6TopddWXuXc/tA9GQADrzVcIcYY8ecUF7Fxf6
	 wxJbkMcX+oeNBIZSyratdMLLzhcdsXOjJHAV3UO2d2YxlBznvRGZDYOLoGoVNZaj5Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981849;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hBqe0P3QwrEaZmx4ReI2ythx1m3sFfwGsp/92Gq3trs=;
	b=imN6bwBxUsesSCyOUb3FOoFdfE3txyIHBIUoU3OQVurfUoXRrgxfq3wEdvJnN+b9SnKx
	 4T0zoo4eVE11o2tGquPmKr3WSLR9gmRPd+IuBTn1gFmEMTV3GGrzgPoFGlfc9Dj+meBDH
	 kMdIUxcwJgp3qaFmK/gTlj6Xuy/cNzzFMEwSDnkmVgfGLY3/uS2lXZvJWMs9IQDjKmzo0
	 MPoPp2geMcTg6URDx/zZlLzabYc2aiHFMwATx6gwi9w5kma8bxoIQkftG7r2ZfHWeQg2w
	 d67cMN1s2nE42FhzmHQEt7bymaIw/KFOS8IBJACWsK61pTBOdx7AxjEtcVB5Qt2gkbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eV2sutkW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ku61ZCG2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51914606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51914606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eV2sutkW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ku61ZCG2
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V3sx764130
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:04:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hBqe0P3QwrEaZmx4ReI2ythx1m3sFfwGsp/92Gq3trs=; b=eV2sutkWNhNbZsQ5
	PoSXyR6mwybyCNybowgcnSafH3YUSmf2l9K/Y17xXAmAtw2PUc35h2fQAAOZuv7f
	8CRgkASe5yArEZgdy7CUuDj4miGuZJW4uAcszLAh2F74RvKw6IRjlV4abAvaFrwH
	GNaScSI0ZSNk9KBTxiJ339YiHe+ktxFUDoVTuYQZUNeZ1H+GMYztJDHozm8Cr7CL
	lvi7mTeEzG6zxnW4XoqOho8za+YkJjPqAqx6ctA9e15NRwNXdK+xNlyCXP7qkJXB
	us1KoGDTtZ+EQwoh1P05QfTDkCpYedDdpxs6INXjxHguynugZorKDwdarHwEAJYP
	o/kzPw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvb9f19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:04:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e95f8543c9so9684435ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 22:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981848; x=1795586648; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hBqe0P3QwrEaZmx4ReI2ythx1m3sFfwGsp/92Gq3trs=;
        b=Ku61ZCG2UTBxOjwbSUebyqAV1CxJtr/RTitusCptQNItM0eB4FhHmeyrG2piDO+qMF
         TivF6bW5GmMAccU7GV8mc6PbXq5H9O16+dX0sSanuruvfIsZZPyoiJJi7L4qnxSsfgi2
         27OeeI9aRhDw8efaFFh+sawuET5WK7R3dENj+XGUXrh4t8qDohAPJ3EPoclplFdJlFvi
         L3hTBFm09v7iu8FKT60uTYlheDZkoMRWvvnlFVs+YLnN7ef/JCBMFXH0kF10kRS6/y23
         eHQtxm4rwCuzEgnm6VTvSGzzZpR45HHCINxD7JsN5YF7Bzv49azsH4yCR/ProrAM3uCI
         sz9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981848; x=1795586648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hBqe0P3QwrEaZmx4ReI2ythx1m3sFfwGsp/92Gq3trs=;
        b=AHGY7YorG6uUIhB0HFl53YjJEGRUAIC17LynqBHvX1DzpFk//q+D//6t0Lmfck0Loz
         LBpzvhCOQ6WQizr1njS9hWEbc9NaaZfndmR54K0Ml018XVvkGtlG1GBJ7f3/7yZtNzjo
         Zu5OQ6jGCtIbeXlmuZonSeZVYkn213YmpxDk4hIPpTxC4Qj9jmavzUiU9O20S6CflBsi
         +gSiQlUfNPe7e1P5AuNqYKH6uaqRaPqn1VWLa+nTOf2VHihdbfFOl5SikASa4S1Uwznc
         6u7TWHL5fqavSSpT603jgB7DHOMyGIx8YwNGssFZXzLpez9aDjETVHdA7GudRYRVT1BK
         bC2Q==
X-Forwarded-Encrypted: i=1; AL+hErFuq12jrWuEI4ehUB6nIMC0FSAQ0HPYNWbmLOK5IrIsbrymOPagPfW2Ef2khIVixTuF4vwK5WXpqOgZ+iye@vger.kernel.org
X-Gm-Message-State: APuU4Z/239HJpo43rVhd5ctBV8fZwW49GYb6adRxx3RhP/KqLQB2ohdL
	LHYo4Y7sg7p6/LRcwWtizXMO5m8mz5Z7za21rrAMLOfBauAjeac2M9l7e7FPGEnDSsUEZ5oox5n
	BnhJLkQcUgFYj1J9TOJDuWXN39acvZkWl9Q5s3D7Ay6gEIC49dkNiZyZi3wMufgPfN96B
X-Gm-Gg: AZFdTZcAPvRGfGx8u7/3wB0KbX/CpPEueLWEehZRCv3KgfOnlFI76Xa9Zcg+NuKS8tt
	86IC/BTsks9oQhQCRFgx7QLR486+GORoCw57YCqUcuucm5ECkYh/k9b5NJurv2sYnpGkf/bwGFV
	aQGZT9jr8U89tQAUU0Ln/AxGsA+HMpEk6dBIdu2fNqOEdwaQ6ap1k4nob8FGI1HAlW6brKeAboT
	7uMao5Ue1Mpja+uLSvntjHRKCO+lDkPMBXDAWuxlvJEqJaODhKK5dIKMdnn3nfNaZBu1rGlSY6X
	6jEfy8J4zZ4jE5nY1fyazF9TAwKskv35rHKpyrxE38GtvWStO/hG+7ANldOTkIsmpJfmILfOIwD
	IxdBka9YI9tM5J5D4DxkXjyKgKpV7EHen3uMy2+29jLzy5hRDMGd+BdotJiVQN2gE39yK0RHY1A
	==
X-Received: by 2002:a17:902:dace:b0:2ef:de6e:9877 with SMTP id d9443c01a7336-2eff7566db7mr16316635ad.57.1794981848129;
        Tue, 17 Nov 2026 22:04:08 -0800 (PST)
X-Received: by 2002:a17:902:dace:b0:2ef:de6e:9877 with SMTP id d9443c01a7336-2eff7566db7mr16316465ad.57.1794981847679;
        Tue, 17 Nov 2026 22:04:07 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:04:07 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:45 +0530
Subject: [PATCH 14/18] pinctrl: qcom: glymur: Add gp_mn mux function
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-14-703f7badd194@oss.qualcomm.com>
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Lijuan Gao <quic_lijuang@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: lSMgbSsShTnXCDdHXVppspnfnZavyePq
X-Proofpoint-ORIG-GUID: lSMgbSsShTnXCDdHXVppspnfnZavyePq
X-Authority-Analysis: v=2.4 cv=YfgodARf c=1 sm=1 tr=0 ts=6afd3fd8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=lqpqssICSlazahQHq3gA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfXyw9VXMbvHgUi
 43tPouZzBMF9jUq0hZ55o47SETk+Rjsy6iUOnt7GpgPsI+yi9wpiA5tPP0xYsjlUMnZEDbkFQ5j
 JFI2XpFymDSwwfX3ekYxTjl6fdV3QhQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfXzyS/qEHoRCCi
 ckNaR5VSv7ZtMCaCbJHICUgun/NrHUcoib48eAtuTtVZnLH5PrNukVAcXKX26U+PmcokJ3VdtlQ
 bsMtjPYr61lHUuZi5nTSVigu6kAeDIzq2l8qjlBgbKk5qKdc7DOPZb1Fhhtw7Z1wsxuaQWMoXu+
 ODVYBdVso0KRPDEa7BfaQKMqy8UGlR3Y1NP4LFtc0mYG5xfLKtnenUKgWjcYj7vRPHI6N6rBrDS
 We/dqCWS1ZOKnTL1n11rmbYdr3DTj/FAzXHC//Ep9zz9QKtRYBghxjVkPay0hOcnhUwlO1WWtvn
 PMF5KGeAy4EWuOtYadQjJHg+lZ7nLQNbzkzlSm3qGbP+7oQ0UtUZsYNYd5TagF7CNJenf0kuLKy
 6BIqNQFbMxVDx7WQLWu3BgfPfr4tJ17D+GrcQdNIFP3QCzGQBXSC5q+5ErPOHAd3S7Q0NaU9Vsu
 gQuFTMIRibtZLslDjjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function on gpio53 of Glymur. This exposes the
GP M/N divider clock output on the dedicated GPIO pin.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-glymur.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-glymur.c b/drivers/pinctrl/qcom/pinctrl-glymur.c
index 20f076e59375628102324cb791dd7b269dc10fa1..38cef09659965485b3fe8827b91b561ea8c9a2ba 100644
--- a/drivers/pinctrl/qcom/pinctrl-glymur.c
+++ b/drivers/pinctrl/qcom/pinctrl-glymur.c
@@ -645,6 +645,7 @@ enum glymur_functions {
 	msm_mux_gcc_gp1,
 	msm_mux_gcc_gp2,
 	msm_mux_gcc_gp3,
+	msm_mux_gp_mn,
 	msm_mux_host2wlan_sol,
 	msm_mux_i2c0_s_scl,
 	msm_mux_i2c0_s_sda,
@@ -931,6 +932,10 @@ static const char *const gcc_gp3_groups[] = {
 	"gpio82",
 };
 
+static const char *const gp_mn_groups[] = {
+	"gpio53",
+};
+
 static const char *const host2wlan_sol_groups[] = {
 	"gpio118",
 };
@@ -1344,6 +1349,7 @@ static const struct pinfunction glymur_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),
+	MSM_PIN_FUNCTION(gp_mn),
 	MSM_PIN_FUNCTION(host2wlan_sol),
 	MSM_PIN_FUNCTION(i2c0_s_scl),
 	MSM_PIN_FUNCTION(i2c0_s_sda),
@@ -1494,7 +1500,7 @@ static const struct msm_pingroup glymur_groups[] = {
 			ddr_pxi, _, _, _, _, _),
 	[52] = PINGROUP(52, qup1_se5, qup1_se7, jitter_bist, atest_usb, ddr_pxi, _, _, _,
 			_, _, _),
-	[53] = PINGROUP(53, qup1_se5, qup1_se7, _, atest_usb, ddr_pxi, _, _, _, _, _, _),
+	[53] = PINGROUP(53, qup1_se5, qup1_se7, gp_mn, atest_usb, ddr_pxi, _, _, _, _, _, _),
 	[54] = PINGROUP(54, qup1_se5, qup1_se7, ddr_bist_start, atest_usb, ddr_pxi, _, _,
 			_, _, _, _),
 	[55] = PINGROUP(55, qup1_se5, qup1_se7, ddr_bist_stop, atest_usb, ddr_pxi, _, _,

-- 
2.34.1

