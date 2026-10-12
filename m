Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DED43DA53
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791787537; cv=none; b=m1B0AuSr/8yzuHUMno9ptZnmGGDeHvjm343bsk3W6C+kvCAZbfiq15nd4y/jjmJunsPUl4YEgH87eABEIJes4P7LVO/Ns9nWon79drLz5mFhmRr3TRB0yVvueUemUHimPXIAGgbehenc5YJTeUXQ6N1TXXCxDJTbRxmpKnI8jD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791787537; c=relaxed/simple;
	bh=NORLgpnQkBmH9YIsIxH+loCGmEq+ih/mS1MHTJtXE2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iy3KP7KVHRAsFttrdgExF/ZRMVPZLZ1ZAUXrqpPvKmySIt4xG1bs5SvpM0Jm0UcrTraMHbfx7eyZxIf4FoxV2Fvd5GyNDx9WbFVLeyt2fPmeWExFRTDP6+x7xgarZiXf7hrBZIoGdi/vHJoVsVtbvhHTxVjzx7NxlRW1TFDVToQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VJMxGqPQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LsWVlDaY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VJMxGqPQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LsWVlDaY"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C56FQL752219
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:45:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RXUsa80x/1w7XU09zAB/IA5nFL6Qb4lFQWBwrWEvNZo=; b=VJMxGqPQL3IttEW5
	XI0RDFQPEOoUU71wmv1IMV159kSFJvBoeKUJ3+Pj6lQ/VzNkb8NjK5YZ+di5GI/U
	pFSzYric7y41ITHWWUkvL5tSuQkcfsp+o9OT1EnnpRpTZ68E+B3g3992mHjZfHse
	gNW/ibhYpk87iKDm8WqdpJJY4XP+u5Yicf6KvAy3QBkDIOcBs1NxQObo5MnAy1qA
	50b1KW5K7we80rdhpvOVTxsDcj0kTAbR1EP55xdMeaQgpy2Kzs3ClE3+h6EDBAIy
	k8BHo8y8GU7/pft+l5nvUTZ14e878XnDRMr/wiJxVRhBkq/DwctdjEcCxFwLvHeS
	x2pIUA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7e4ed2k6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:45:33 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86261e66700so1110264b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 23:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791787533; x=1792392333; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RXUsa80x/1w7XU09zAB/IA5nFL6Qb4lFQWBwrWEvNZo=;
        b=LsWVlDaYcqKdAVrhr52upEAh79/w+g4Djxw54YMEt9/xK29IX8FQGfQ6bYHphgsGa6
         JQAP/mZldYaPD8Pvbg4YLTmxXzY+7ZvrHc4TIrAE2pR5mwosj9HNZsUklOTxeZCgBMrV
         c5mWkkJ4STtDpMxbOmLSqEkLZnI9QtelwPryTnO3i5kQLNScthFyJ3gpj+bmCwrrnldu
         1Pm3fxZYYVG5CPlk2k2OcswHWxaYEaujJlhJIwOUlcw35hUfRGHXIwv3eQp1/zgmS4Sy
         vRksTtoG/Dj+sdGhTenKf54iW30Y4ZNfqW6+tsLiTJPvijP9DiDEt9dvGrAKSaD0T61e
         uIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791787533; x=1792392333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RXUsa80x/1w7XU09zAB/IA5nFL6Qb4lFQWBwrWEvNZo=;
        b=bwvAPZ99MpX9f0W+7HH5CYZn7rEPsGy0lRnVnuFghIf+C8S5AuvJUAqx/LYsvu0FEh
         98DKiHGqFHRPN2mNsG7x4tMpH0naA1v4QbdqSctOkjAS8aF8Tw8J0MoBUCDlBeNbwIrt
         JWT6S/uMtbNi7uU4fJtwI4zvOGe1kWtK69wuQk80DRJTxudsHim6as+bvl6rjfsdeZp6
         O+IeJGBCgkSCUHOeVn3FlJFWTZG3IN2J7sRKQe966rTJB2KvuHFiwPzsnNV7ssbLXDkB
         YJj82+o0wwhHZRg+lYNj+IYCyfd/wyiGlHqbtMuQiWy33N4WvJZ1MZnggfkaPAaxXfL2
         S6rw==
X-Forwarded-Encrypted: i=1; AKwUvByFpUAm/px7sZkwVz75lkapY+bx9m+nmLAgrQ7Uy3EHWKi4ZXDx60IUoag8UWznT9EafvE1JWezm+utJJw3@vger.kernel.org
X-Gm-Message-State: AFq9FYLlJdR7WHG8kAxTFspvfZkVljR6i7U7sQoCGWyVplFJ/2NeeZjQ
	qTMfYbB1gKP84+R9au5A+t23vaVz1UjKmuCQMFSQxXZ1nHMS4Twl/VsLUgott6Ky/vpvaPZjRwH
	6+DVN9Kuc44d7m4g0s9k9MEE1ApGzqK5eHIHcJr4Go0FVHZadutPCaP4Wl2SJ7N0GZh3N
X-Gm-Gg: AYBFou2T38DZljrEKKPq8UOqGxaripTNVwhCKuJDCLS36dxUhIZVY19VuH9y7cesYXR
	d/PecqbKYPcdFhbr8/UdtxXjWpLj+ACAz24Jc3FkPM7nguKA2yRDYZUSFR6IqiObNmCYDy7BdHu
	5/56CDmXjX1TjJtSrWCveE2k9UgrXwGnW2XcBkh0/W2nkW7vco4eFCZvC35BbqAf+nJ5UQpw6Bz
	8NxOpmORzhT1kDdGDI99CDQmcY+MGpMM1zlJ5JOIJo2G+dDIwjZO7WIjurgN4JeuTVLOlh3gzDH
	kGRZW+IY1G9rkqk74LJmFwW9pGBNoPAJRdHfeV8fN6r3lTy9qeZPo9WP0j5gcdIzDInV6Dj9MPW
	bw896a4gQCNVEbf90hvaFhDdd3klQjDq8H5k+eLt5XY1bXSrN8lbXXRVa7R0LZy4n9ATqipfqZv
	7HQBOVSce0oA==
X-Received: by 2002:a05:6a00:9504:b0:878:6ee:671c with SMTP id d2e1a72fcca58-897c700e769mr7277389b3a.30.1791787533080;
        Sun, 11 Oct 2026 23:45:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:9504:b0:878:6ee:671c with SMTP id d2e1a72fcca58-897c700e769mr7277364b3a.30.1791787532600;
        Sun, 11 Oct 2026 23:45:32 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3dc6c93sm3534420b3a.33.2026.10.11.23.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:45:32 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sun, 11 Oct 2026 23:45:08 -0700
Subject: [PATCH v21 06/14] media: qcom: camss: Add Kaanapali compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-kaanapali-camss-v21-6-04fd28d815c6@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
In-Reply-To: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfXxIfJS9WUqFQb
 f4726/jdcmoxKIEkRU3kE73N3noy3JvyhT2YswNM+JIpSur3tCCFGL98dgIZnJO5bgPCKf6fYi1
 /zb+nk29b1YkrQM8P6sYpbuX7GCqbV72XbbI2+ygMAofbCkT5igTHYqlYjCRM0SEv7piD2Xo8bW
 sWMjXOcB6ErhNZaXt/oqt4IWPfJUCz0GrfxDs+htvjrMAZWdSfgHyNyp0UN+j6as7laDGwC1z1N
 ZJsp4od8/X89LmsqpD0pAvXzSQGKu23EtFgdLKMctlXPMTdj+tfAXJgbTc2HW23oBp9Tc4K8UMq
 E4/9MsnibZp+8vZqDUsA0VIWqUhwyVvC4HtSJHVxmM9RJl2NwBz7xH7fCdyEypmsuSgPs3QHEP+
 N67DBy8TFbQEaHslXccIpqgdoEf33KeNMFEV9g/ocI0B/+Fe/eZtRT/7hDWtIQlH/hEPZ83Bd+/
 Fh8H+1CN3sIiViis1Dg==
X-Proofpoint-ORIG-GUID: 2-S98cjUoaqe6lHDqAUjGqujlK1o7_Qu
X-Proofpoint-GUID: 2-S98cjUoaqe6lHDqAUjGqujlK1o7_Qu
X-Authority-Analysis: v=2.4 cv=W5utxhWk c=1 sm=1 tr=0 ts=6acc820d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX1HVnVwCSP7S2
 nZV0KR21D5RDJ1q9B+JVq9XzNgPwVU7dcTpFpL+nSsahGXSfFlTdoil/VwWHOiZbvMxd9mZ5O64
 3PvLuWxfmph64uk6kgiUA6k0elBfDN4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120026

Add CAMSS_KAANAPALI enum, Kaanapali compatible and Kaanapali CAMSS driver
private data. The private data currently includes only basic information.
Later changes will add CSIPHY, TPG, CSID and VFE resources.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c54185c93a8a..fca3de214a92 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -38,6 +38,20 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct resources_icc icc_res_kaanapali[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 471860,
+		.icc_bw_tbl.peak = 925857,
+	}
+};
+
 static const struct camss_subdev_resources csiphy_res_8x16[] = {
 	/* CSIPHY0 */
 	{
@@ -5576,6 +5590,13 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources kaanapali_resources = {
+	.version = CAMSS_KAANAPALI,
+	.pd_name = "top",
+	.icc_res = icc_res_kaanapali,
+	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.csiphy_res = csiphy_res_8x16,
@@ -5810,6 +5831,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 7dc2fd9f03e0..0551211f7948 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -96,6 +96,7 @@ enum camss_version {
 	CAMSS_8550,
 	CAMSS_8650,
 	CAMSS_8775P,
+	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,
 };
 

-- 
2.34.1

