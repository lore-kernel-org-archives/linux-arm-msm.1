Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445D942123E
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572569; cv=none; b=OmsF5tXSv/x0vfntIgaRdfcJuLQo67ds23OQacuUzbN0gZYcR3qV1Gvpks1imq7X9x6lZomk7wWJUY4Ew0tdD2OnJfP+CRLG6Yoq5CJUvi1yddjghF1S+fDtMLbXjySW3E9bgwZbRc/nubu0Rj/HEUTl53psM7SMk1OVAir/YEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572569; c=relaxed/simple;
	bh=IIxFBk6ES86W5Uht2UYsLFSa4TN4Ihn/e3MF0K6mvIQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TVYFtL1w8IVB0mW0XpQaszASJBHtn8k2iuHDYOj/qB2A+L2051hC7ZE+3QfYzmOPMW1GaiYTCZ4HSqMmHymYKRDgpLnCJjbUVspvmWoK1ntbP1GgZJnh/V+mAW4IeqpMw5M5blSo0ZKZIHtGOHc/TR2RRyN1/7IjPRCO3tbc2tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HL4+lyLc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QN9sr45W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HL4+lyLc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QN9sr45W"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMgKE2864710
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9nqBy9mt3WozQnJzEmjl70tlvtPCUDEatMHcNTSyXQ8=; b=HL4+lyLcqcjxaZw1
	Q+8cofAPuonCdfCoO4ghl2j2X3sBIWGNcNEU0nU1Z2eE2exavoGht3qf/tHDc3xP
	t+DSaEbK1BwebhT91IFj8XDHI6aAKsBwGelx972kn/ArCfN4zqJXSvpkuDHMrgF0
	nkmcIJ7tUYaSF17UE8Negky8bjOhJ4nn2W1d6BiY4DhRH7vPdRBISpGda4AjD8bQ
	hcciJlKSzLyNQTh/Ty9IFKf6TFho02bbKPkUJ1uXReBTs3PmJ71whOAbtmZeDCM3
	N4p8QWBEQzvlgnO1qo0872lT9XVKqgpKOZAt5ul1cRD4ZSm1xyN+wMaymQuvoBV6
	eJQugg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8bdr29t2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:56:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52d7b3adda4so35335591cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 04:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572566; x=1788177366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9nqBy9mt3WozQnJzEmjl70tlvtPCUDEatMHcNTSyXQ8=;
        b=QN9sr45W8HdDbq5sJGqDAlb80YNShPJ4FakNDXTss06IqD2BN9SiJAm5/XUgAK99pz
         02g6rY8PNG2xlVi28p9OArpYtZbHI9RO8TLcorO7szjkqxcsP49OZKg4GWg0ceimNg9n
         pm8WqdeS5HwohM6X93tTJ11CUlsVsNGIsmQxCOteXb4FvvK9H2DcHSChpVEfDJUve8ku
         Lz6G25X+UCY22mE7o1S4JkOfKh0AYj1AgG6qVG65U7JQIiM+wd07RS2jmYGAc2f4/mf9
         YpnLqPvX5deoVyzlxsXg+T+AzqgzxytHFWg5tixpodg4+apFleLVFPSYAjlB7aZfEUd6
         oIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572566; x=1788177366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9nqBy9mt3WozQnJzEmjl70tlvtPCUDEatMHcNTSyXQ8=;
        b=oezkLut3YjGtgqp3QiBU5WgqR3vcBoSGC9unBAOgQTr/Kgo7uEPLShS/PE3Ynjm39G
         ZejwgAESIbjtc8W4O9xwz5XnClss+xpQzABeHGxk9NvIV0e0lbIpb/XOmKGi/9Jq+sxG
         HP/Xdq4UgUX8xhrc3ehM3EZQz7XajvKAphHeWdzQ0oWdzZsfVXgqUxsKaw2BVWMtGGBG
         PLqRjrdhQCbcI52KxETFhDTsxjVe4GWiaxq1GynkzWk4jfHPRiRQ1T1iWsA27m7ldSUa
         O+FUkGxK7C5UTstZ5boramUGPvUHqYblAQqV/76auS4dSCYIWjZKx1Fj/tSAXhZoOKo7
         n9dg==
X-Gm-Message-State: AFuF++nrLteHcDAnARH0x5g0ZK+Y6iqkqUeYMQNB3TklL8Xb8IH4mH23
	7oVN6zWwvNOPHS7zUax/XsnMQ6V0xMU/OES2VcFAHBuK+i6EvDxQk1Va5UNa+/zlpn7tex/G+P3
	6sszKxHqIA11IMCrVl7ANGfJUzSGXpjZ9YUQyGm+1laE1UPapCJWkxwvTucTILfcA4P8s
X-Gm-Gg: AR+sD10ekppqljC8tM5BKMNXzxZN3FOdroM6XckR7BVNodJvJwwLTnd2zN/TP98lYq4
	3vbVKLwpnmWBzDeYlRwJMb73a4T3rxFIZ5pdxb8RPhOzKRNqA3wjKC8erEbAXXxhVfJXlcnyd1O
	zW6fSarTh6A2siQpQjaFKebRPuxlpWmg6leNcjkcn03SlSBhUrM3gkc0oljBmU1dRUtlFTmwbrw
	5e66yIF5lrS91YqsUB37uCN98kOAt4ciq3jPNLKXxQOPqa4AceicsHHqnNwXcXr5If1y6EFu95K
	0Y97vGJJNGha6nUYVfKah0g5jf590wTVoUMAnR+jhquEGjU5JrqSnzHUxgW5Pa0jO0ukHqi9g4h
	DXpjcqmCc
X-Received: by 2002:a05:622a:1a84:b0:51c:1967:5091 with SMTP id d75a77b69052e-52df5bb188amr233708691cf.41.1787572565634;
        Mon, 24 Aug 2026 04:56:05 -0700 (PDT)
X-Received: by 2002:a05:622a:1a84:b0:51c:1967:5091 with SMTP id d75a77b69052e-52df5bb188amr233708231cf.41.1787572565084;
        Mon, 24 Aug 2026 04:56:05 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:56:04 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:14 +0300
Subject: [PATCH v3 27/47] clk: qcom: gcc-sm8450: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-27-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=794;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=IIxFBk6ES86W5Uht2UYsLFSa4TN4Ihn/e3MF0K6mvIQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDv1V5Ivi5Z2KJAdZiGa2l7TJkKi5AxcX7Ye
 agzexaVtGaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww7wAKCRAbX0TJAJUV
 VvQND/wIzRRtFggyCxCkwF+PHSVCPVc6x8xhWMitauR1FU3B2oe6xgMOlpUB0PvCCR250VOiUQE
 Yti7Xq4JKg8oy0sKmRFAWFwzAfzaC+LEJLyGqK/JCvJdLhx0aCAGyaFhUqFlnKClbgMdJf6F8Vr
 Og4BtpMqrYD+bBISRmy+3HtaoqAgNkp0QOJcI8S/mnr8+N8EVLNkQP+oDI8eoWIeqp1q3cVgPBI
 ImYgwhzNKiKXQwhZUfLb+FJEl1QubjNZ5oykFWPDzy4sSKmVK4rZ9fvEESZIUX9Tx3BuJ/xQxd5
 cRlyweXccgy+IkGGkDjSHGCJTGwL8ZyRHbECGfs3fbvQEKHrQt7tceXCW1hBgvyCG5WN2bLttup
 n3GwEm+TNOPQHdqwLd/d8m8aAzuWSUKo1dPOKvaqlSJjSIlE+zON49g2VMspLF06reFm+WQbxcy
 RHRq2aIGoz6KUSibfIBeRm4hewawcssYoFbaIO1haoloUu+XhpyeanmR91kZRoi9oMj5IQ0pHdO
 gEmNumOyPjFFB0oulaSA/zMzJDRPYP6YqKaiQpgBdk69qUmA3rU2x9cvUEMRxAZW94Nfw+VMDtr
 ZLkn55HRoQOmAGZk88eLD0UqFwbXmabC5zkRHXoT2CuFDkJXz53Aa6Dqa/ERMHJtqfJtwNvHStw
 DkmsH2SRhEb1xaQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX/CNlJ+ZG8XVI
 SHny8+tYs/mp048OvAAmU6gjiSr+28vCpulRepJunaLkmAOG8W3om0tniVWXWkcJ27jFBfWGW5W
 kM9deWzM8dOPIET+Uozg4oBs3FlLTblMieZUUvggqCvy1Ok0HN/R14N0q7Amr/P5/e2XFflttjk
 dcyUsLcqm0AbmNYcPq5+ycUrAkz0yK/tUmWBrqr/3uRsHrFAuyV2BIqvaj4Btt6oxF5JxYuIgMO
 38VCUUgz2xeBSko+qxgTNPgaBZazYCSvS9yw7uGgm5+jqdIWEcpyKyz734mw5e+WJWeQuZ7wjDX
 6qdSe65c/vz9xcH247U/v1RuhxI4UI6WAMI415+5sT05SnQg3j1Q2tRyd66ofRMOg2VNSfKVZdZ
 HTLBJs9h3iImAqc/h866rzy3Lm+VbuHcSTC0/5dGpm+eFSamp8mwMD/DU5N1OxvTRbuIdyGP3Rs
 Kj+yFYRfTkmup+wROzA==
X-Proofpoint-GUID: tjuxv3e9PKcbu8sFQjY8lpU6w5KZyNUC
X-Proofpoint-ORIG-GUID: tjuxv3e9PKcbu8sFQjY8lpU6w5KZyNUC
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfXyh1coE+/SqpZ
 xeVwh6Zf3l+D13KV12fkNLlw05siysUr9PSlxMEF3jviZx1fcY1dUTuB5STL1fISfy7J4kiU30k
 qPlrX2Ct3YEs2NxfT1Z6nUEMXXjflow=
X-Authority-Analysis: v=2.4 cv=W8cIkxWk c=1 sm=1 tr=0 ts=6a8c3156 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ESHVkgNwe3RMy11JppAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240099

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8450.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index b18bb34889ab..b3ab458048dc 100644
--- a/drivers/clk/qcom/gcc-sm8450.c
+++ b/drivers/clk/qcom/gcc-sm8450.c
@@ -3399,6 +3399,7 @@ static const struct qcom_cc_desc gcc_sm8450_desc = {
 	.resets = gcc_sm8450_resets,
 	.num_resets = ARRAY_SIZE(gcc_sm8450_resets),
 	.gdscs = gcc_sm8450_gdscs,
+	.use_rpm = true,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8450_gdscs),
 };
 

-- 
2.54.0

