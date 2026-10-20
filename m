Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515314;
	b=NwXX9Jd4Fs1isDiZVB71AWP5Fm/FZRBnJre+Uis9gOP0yVfSRwvwbtnf8gWKXY7BKgNz
	 QntjpAZrqzR+t5VCY57kH/RFC5gK6ljwaZ5t1Wl1n7hd4MoLD9GwYFW1voUSNxttAI/n5
	 as6O+jajiFQpR3GkSDGbiMKRj+8jL8C6UZtYV+0SEct2uJGWkZeubhlEY5MhIU+o9bkU1
	 nYuGVgRf1mTenKlbTWqqmGxzLKVVe7p0RJPgXgTRPpc6/qWwek0kg8b9YjlVGoEnIhUjt
	 eNB3A000IfymOq1gGTSMHU48RtxHZmS0aRv4s4/swBhsV+4DWiNCHXwkwgv3us0m4ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515314;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7HIv8+3wjV2z6c3n/IpnC/FTiMl437KJCskzpMB6Smo=;
	b=RcSQ4/KDhDikc8ILUbB8hbPgeTv539D7sNLssb4aV84bq6AfKK/Zra3abG+VZLzU2wec
	 eBmyFnFj0QiphPG9MLJzXMjqspdXlevTl+u49u08PdR9PtW2CS4NwJpKkUPhkO7RaryCT
	 bCKaIfqQPuYvMsGawOL8/OH0r89qQbSsT/aARRKS2+jqrIvW2y+a9op3TbczHOTm2y2qZ
	 SuO47NrTcFUjFe7OmlgDjHi4akL8GOTpbEhtUCjPNEfSAI3fLiUqEtnUu2ZzzGqWsYnLr
	 E6wTqLjW58cRLdVM+uzrllIVFSK0cN3ICU7n4RBHWUXgHTTx+olVHon5lc8kPeXC+tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A5CYILyG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bqzm9wuT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D77F606A321
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 16:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D77F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A5CYILyG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bqzm9wuT
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDA3D11782246
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 16:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7HIv8+3wjV2z6c3n/IpnC/FTiMl437KJCskzpMB6Smo=; b=A5CYILyGc/SqwuqX
	9EzQlhlw6F0UH8BIy7VfFnn7UgvDBkuhqu5EqBnKUhpp1Nna/+JleYLy9LEOx8ON
	f4HZ7jiW1WW0GTqfd+V+T3zdIv+BFkoicQb+/ivvz5gmgy+Sk1o36hZ+L4A72GBf
	2EvdocoDmLeVdAID26Z/jRa01YcoLlqObrr3P6zhbg9xKmmJz5M2MGLmfxPstcgY
	W5kNzB1YObizVngp1pTa9socuuASdJnaKe/lHIG7h3oTHNq3GgUSjPJ/WnXmICcG
	pQyGWENZpzPe7iYqUGqGn8x4Ywue1Sr2n9DvdS08FXMi6mWEm51mPBDHTjWjL3Mq
	NW3YfQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h2982w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 16:55:13 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3662e7a9299so3844489eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 09:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792515311; x=1793120111; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7HIv8+3wjV2z6c3n/IpnC/FTiMl437KJCskzpMB6Smo=;
        b=Bqzm9wuTEvK6o3PJ6MjOfItmnOzRsPQQrKUj6+V3x26NBaBNqlWufnpk8PV38zeQbC
         Ngu0o7SxP+PqJ27ynilQu3OpFUHAh68Uz4ESFdNTZmQXaJp4cLHl5fJCPZZsUFPZWKjJ
         mnNgXjK7UhL3XAMyWGJrX6llXD0oHFldIgfwyPW8004p+cg3vy7Z0LJkmmDKcv4e4pD0
         Vw7QSn5miGvVLZLTU8pvQhwsiO+VWfww2L7MiRA6xUdZ/IH+EHoNifdD2FRM489MR591
         F7fAzaJRRmrqNHCGr3cbz7LdBYrqqo+SpyoDDbfZYZmsZi1aLI4zM4PCmk44mDF4X9b9
         lhaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792515311; x=1793120111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7HIv8+3wjV2z6c3n/IpnC/FTiMl437KJCskzpMB6Smo=;
        b=Tlbp5zhvQ9fLwq4Oh8UhdhyL7l7SeLDKAL8L/soG/v64SDSYPvPGUwIcPtEXDUKeN5
         fj+BAoHVoAP79dO2ZNGG1wX9HUzBnvJlWeuKcwwoNU6QaqoulGR1OMtL+9h0QNrCASTh
         E1JL079O6U5zbWYenAz4hyX7dNA4/XMys0oBCEeMrz6W1ks72prKIsOMVWQOd4tLNGiM
         mPVlGNcja+Aq5wuOeDGCtAc2Jy7DluSqoQQwFMSWy+o5N1y4Y/hIPDcIw5iStWIKksy0
         o53WYxidy3TFIrsyL14s6aTaQzDXqRhbqONqE7fe3H4NMVbfqqx9peWuj2XEfpHIQwM9
         ZTMA==
X-Gm-Message-State: AFq9FYI4IFXPCJIdSO2lR1V0Gmh39aS4X2vFif1mN547OmNUEJ+oR6y/
	+nkLmWhEuKq4rPP79VIiIX2Y6CcSHOEooGHIZYgtmAgroxZPAGUzJPJ/7j7ZHXWLJ0CjYciJ2L/
	9ZZ1rzs3PGctsQ8bDGBq5MQyruGKACV+2BmGzBvxizkz3siS9OPkcjpOPE0G0z55uxOn8
X-Gm-Gg: AYBFou2ES9rYDtc8PGnGYDBO4GvQi/xnM2Qt7DQH384GzJs2Wh0997nZv+uFwXMyEqg
	+av1zBh591iEYqRzPXo4p7f0ju2DDWHWG84uvb7RROU05/jIXIjTGYlWFkSUUSCpnWKtKuGB8qs
	YBUxriglc6EvXVZysmH/NZLbDCUuwfVQnAph9PoWyQBKgHC0ZkZ8ZMHdAxbKUaKRuxrCaGNJCcL
	eLaKe8MrkstT1NBWc3KPd4lWWtovPrB5nxyxovX5tAyjtfdZEpvP3lAOj7djLB+jM1dkq9Tq6fJ
	IxnfI97oIrv6hRjCqjOycVueAWzgcPbZiY3d9ak+Rh+cPKx2IvsWLNvWrkLVMSCg6Vg0imCz3St
	A/z+uGO3fIH5m5ox5A8mGp0KDEk5jsCwxx+6NEcblOdLd3EljejuVYJwCC2WyBB5Gv1KlScWqa+
	XzTmFf0fGld8aEk6G7VPhiohO7+84Z64QlhA==
X-Received: by 2002:a05:7301:6447:b0:358:eccb:af7c with SMTP id 5a478bee46e88-361a312cb5emr21821623eec.33.1792515311288;
        Tue, 20 Oct 2026 09:55:11 -0700 (PDT)
X-Received: by 2002:a05:7301:6447:b0:358:eccb:af7c with SMTP id 5a478bee46e88-361a312cb5emr21821571eec.33.1792515310651;
        Tue, 20 Oct 2026 09:55:10 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608297f4f7sm43204868eec.23.2026.10.20.09.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:55:10 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 22:24:51 +0530
Subject: [PATCH 2/2] soc: qcom: llcc-qcom: Fix whitespace in slice config
 arrays
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
Message-Id: <20261020-lower_case_hex-v1-2-bfac89824646@oss.qualcomm.com>
References: <20261020-lower_case_hex-v1-0-bfac89824646@oss.qualcomm.com>
In-Reply-To: <20261020-lower_case_hex-v1-0-bfac89824646@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: 7OGUyd-pJ7Js4n2LsWidmpizZEfQegbq
X-Proofpoint-ORIG-GUID: 7OGUyd-pJ7Js4n2LsWidmpizZEfQegbq
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad79cf1 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=jZBCRU2YODfr08C3DaYA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA2NyBTYWx0ZWRfX5uhhwhoVDhkI
 8mx/bNalrhBsF9JnW0v50Bdlevbn+WOnnM7PS1CubeNt7JYnuuKC7rrnPsIJ5MLnOOeb2Fi3vF7
 leg05Tb85C2hPDg7//46ctuzC24muao=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA2NyBTYWx0ZWRfX8iwFOp8UV6wh
 6XZ/YH7udLorUzY8ggByK8Onqod2pYQ+sEvckcrypeOpiBWroF5jnDC5eNH83iNaMwBSuKItq1+
 nrrrrbCPZCvsi1fGle3a3zuBZEmALIn731GRMq4+4FbpFVdDe9+0l0oYgPAy/kPvlYNRouOe+ng
 5TvvlIsTuEuvSgQoVFhL2GIWaGK3aET6UB/e33ilmCgTa63JcTs1et3LT+s2b4UpMELAi30Ngod
 Vq23TNawGgnadpuAWweP/mGouTLFZYYL5ia+YnHJPkLvvGHj6ZpbTiD0dDX9PhjqtzAtbV1606i
 E+fV1dReZhSr1CrZePbLGVse5XZ9BfaHH/UskYSzSjRVutJpnHGkcztOXm5PVt6El1qGuhGH57p
 j9yXyUjlnxm5uGn6S4TkLr8UFRyT5qcZGdSii5kywpB3kfvV/8uXeCdFjjXKAJuVgtReJSts0EK
 t5NAB7xctjzPUa3v1wA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200067

Some slice configuration arrays use two spaces before the opening brace.
Also, sdm845_data has the first element's opening brace on the same line
as the array declaration.

Use a single space before the opening brace and move the first element's
opening brace to a new line to match the rest of the driver.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/soc/qcom/llcc-qcom.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 2edc5ec31249..aaebe71e2b01 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -624,7 +624,7 @@ static const struct llcc_slice_config glymur_data[] = {
 	}
 };
 
-static const struct llcc_slice_config ipq5424_data[] =  {
+static const struct llcc_slice_config ipq5424_data[] = {
 	{
 		.usecase_id = LLCC_PPE_RXDESC,
 		.slice_id = 1,
@@ -1176,7 +1176,7 @@ static const struct llcc_slice_config nord_data[] = {
 	},
 };
 
-static const struct llcc_slice_config sa8775p_data[] =  {
+static const struct llcc_slice_config sa8775p_data[] = {
 	{
 		.usecase_id = LLCC_CPUSS,
 		.slice_id = 1,
@@ -1724,7 +1724,7 @@ static const struct llcc_slice_config sar2130p_data[] = {
 	},
 };
 
-static const struct llcc_slice_config sc7180_data[] =  {
+static const struct llcc_slice_config sc7180_data[] = {
 	{
 		.usecase_id = LLCC_CPUSS,
 		.slice_id = 1,
@@ -1761,7 +1761,7 @@ static const struct llcc_slice_config sc7180_data[] =  {
 	},
 };
 
-static const struct llcc_slice_config sc7280_data[] =  {
+static const struct llcc_slice_config sc7280_data[] = {
 	{
 		.usecase_id = LLCC_CPUSS,
 		.slice_id = 1,
@@ -2283,7 +2283,8 @@ static const struct llcc_slice_config sdm670_data[] = {
 	},
 };
 
-static const struct llcc_slice_config sdm845_data[] =  {{
+static const struct llcc_slice_config sdm845_data[] = {
+	{
 		.usecase_id = LLCC_CPUSS,
 		.slice_id = 1,
 		.max_cap = 2816,
@@ -2481,7 +2482,7 @@ static const struct llcc_slice_config shikra_data[] = {
 	},
 };
 
-static const struct llcc_slice_config sm6350_data[] =  {
+static const struct llcc_slice_config sm6350_data[] = {
 	{
 		.usecase_id = LLCC_CPUSS,
 		.slice_id = 1,
@@ -2544,7 +2545,7 @@ static const struct llcc_slice_config sm6350_data[] =  {
 	},
 };
 
-static const struct llcc_slice_config sm7150_data[] =  {
+static const struct llcc_slice_config sm7150_data[] = {
 	{
 		.usecase_id = LLCC_CPUSS,
 		.slice_id = 1,
@@ -2591,7 +2592,7 @@ static const struct llcc_slice_config sm7150_data[] =  {
 	},
 };
 
-static const struct llcc_slice_config sm8150_data[] =  {
+static const struct llcc_slice_config sm8150_data[] = {
 	{
 		.usecase_id = LLCC_CPUSS,
 		.slice_id = 1,
@@ -2784,7 +2785,7 @@ static const struct llcc_slice_config sm8150_data[] =  {
 	},
 };
 
-static const struct llcc_slice_config sm8250_data[] =  {
+static const struct llcc_slice_config sm8250_data[] = {
 	{
 		.usecase_id = LLCC_CPUSS,
 		.slice_id = 1,
@@ -2925,7 +2926,7 @@ static const struct llcc_slice_config sm8250_data[] =  {
 	},
 };
 
-static const struct llcc_slice_config sm8350_data[] =  {
+static const struct llcc_slice_config sm8350_data[] = {
 	{
 		.usecase_id = LLCC_CPUSS,
 		.slice_id = 1,
@@ -3098,7 +3099,7 @@ static const struct llcc_slice_config sm8350_data[] =  {
 	},
 };
 
-static const struct llcc_slice_config sm8450_data[] =  {
+static const struct llcc_slice_config sm8450_data[] = {
 	{
 		.usecase_id = LLCC_CPUSS,
 		.slice_id = 1,
@@ -3307,7 +3308,7 @@ static const struct llcc_slice_config sm8450_data[] =  {
 	},
 };
 
-static const struct llcc_slice_config sm8550_data[] =  {
+static const struct llcc_slice_config sm8550_data[] = {
 	{
 		.usecase_id = LLCC_CPUSS,
 		.slice_id = 1,

-- 
2.34.1

