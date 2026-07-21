Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FDC27A476
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 12:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784637982; cv=none; b=p3y+N0UT5sh+8HsZOcI18jHb6HztbzGdh5IutWmDLjehSfe8Ho3694Ml54Eo3AtlNiQD6x4CkqOINP/+gokazYAnIS3aSRMrScsZRXjngbZAiiMiGATPspvPqsP94dmhPXjp0zMnz/YUXbBfAXijMRHCvgCc8jud1Ijbu2Q2PB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784637982; c=relaxed/simple;
	bh=cg1vi6KWVkG6GZJE0XhJtMpY/+6iYLqwwxaoepuP3Xg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=siPnXm+Y+GRffAVoGXHNnYHF4QxNxn9liMw1jojFyqmgXdCuCuY3YEa/Gszi12FqJCmriGcm2ab3O6xhHtiLoaYkbAOfsScZVDXaA2tXpHXVU5v5uIFf9o964HRPj++AyupYNoRXuYlIH+y0k6dJI8RHqBKbxoyCoZj5DmYeDZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=joHNbvWp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S+RJ4jx+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="joHNbvWp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S+RJ4jx+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LARSOX1455582
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 12:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GJWsAzgKII8p+ebiGVgj84eQD0PZ9q+ncDdlyoBkrqg=; b=joHNbvWpvazuf0ak
	9pMDtR32ZrjP3fi3s1PyOqfd+7R2Uol/qE4sNc3BwxBFH09aHuYZ5IUWpqGwfFUR
	oTkLsBX6VbXYo2GKLz0RVbjiu0lnmRyeuIT8CP8XLkRlJFHKhmq5WScTFdfRyh1/
	1rxhqaXqwUCeybwg0lZ3TjzMf6OJqKyJ9OaS7vp4zJucWfXtKTovdiY7GHLtdcJ9
	CIpZWI0MpggmnerD80aNLVNLC0oJKcW6QiHB316ZouG5GSWRWGXvbtWC7Lb2yQEy
	jrMyHa8EeT0uvo1O8H8tN3OqOE4fZSZzIL+hQwtQmpVKMN0LN3lKFZKkBGBjxjAQ
	RRBT3w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1dujc4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 12:46:19 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca860baea9fso19347699a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 05:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784637979; x=1785242779; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJWsAzgKII8p+ebiGVgj84eQD0PZ9q+ncDdlyoBkrqg=;
        b=S+RJ4jx+Nl5pZnr9ntEqhWgxTdOr/SLpWZE/ELzWJIA7J7E14KUO2xu4XmCPzwDE4s
         4vaY2BrRxeRrvyjAF7FnHUa3jjl37ydDy/nDgSraeQlfnzHzdWUT8dWpcg4DMfPNpTQI
         sZ1C8px8nCUlR5vFYWYKIY2UKl++/qQOu4wU0b4Uw2+Mxpa+n9zYtsiPByO0J0w7iUp8
         SXBV9XCAMbg+YcCrldgQfuQcV7DlpFvWpDCvuN+KtMpFhlORJuE8izv6H4F8IB+3d87W
         69FVY5TAERbyZJJlCqdCSVoCfBrKGuz4wpeL3SQbkaSk25Jz2lsrvqk2PwLST5uwMMCj
         3HFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784637979; x=1785242779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GJWsAzgKII8p+ebiGVgj84eQD0PZ9q+ncDdlyoBkrqg=;
        b=W/PM7+/o4BWU0uf6TY0cOnbxYFBGT9SKHsbEhDbWS+fbOUApJ5oAIYwH+UgZOff4uU
         YWR/y3Nz/P+lEOkd9IZ+okFR0nnFmGn6r/iy/hSWVDuEFyJnXB2S76WENUSzwC3zYd26
         wC1EPPAZwCI3ToaqAbjQeK8GeaVE7+8nsIdBJ2IkiyctoA7x24YrbWNOgv9Ca3kUBkYK
         RFnUNJ0TyYVFM6WpmdkRja+MXCoXQIACf5gCcR1SlPwm7L7/GjyG4ib26iHQABfPWdAb
         2jYhSnvnlUWDnxcbmzjKN0h5a7VqSrLiza1Kedu/5FijdRI895WZrbqU+b5jG3l7ohDq
         IzRg==
X-Forwarded-Encrypted: i=1; AHgh+Rowy2cK0m8y85bnLGAPE12DdM9rtbtQ0O+0VAlxpJVzD/RjZMRVYF2DbmqgbA10C1ZRStT07y6uEj2r4xYQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc6xkDa3piG3KeHDe5fP9vjVCNL+8ky5CzGcWPvSrL0xCCg/R/
	GX5u+0hYyLPbWTY7PeIpbgYVbXa5w6QbvmikYhplwWMcCSxWEnvgZFpoDY9s9E1URSTOVJkqmWE
	S60OBwwIGjWOlt3bWGY+bhQj2tZ2x/DJu88yeGCScB8VbRsdyOq7xbjUfAWhGuKm+Rs0z
X-Gm-Gg: AfdE7cm53u46ke7utzNOgN8JJFrGS44YAMKUDSLHMMVIRtD8+FCRad2ISUOdB77wslN
	BDG/NM1e0xAxJKVnIue7l5xWHplMlavALmqnP12WK+9hJ00jb6w/9D5x99bcLrCxx9gsi8w1532
	Q+WE1zUfeQEGNj0pPfnKUhVimeZXhCksqjyD8RiG5Ae2DbTwH7BwmEAUNOyNdnZsMsj1JsWsEGs
	z6K6S9fVvuRFIcvvAg8k98g0Wruv1NnAnnRw2IJKK1cd+SZMO1QpJBQPNgjuBT9WwlZQg1mLeUk
	Onln8P4cAa1dHlX8FRv8aurbimggCg4O0YW/rtC4FP0ttgzfEUKgjnd+Z9AmayAQmwA1HcDGMMw
	4l+8lpYruL+DGNZBcAjNx+r/HOFTfejnKpfqReEvbp5mcu1ox6eMdwjU=
X-Received: by 2002:a05:6a20:1446:b0:3b2:a809:ffe with SMTP id adf61e73a8af0-3c3ad5ff392mr19996976637.14.1784637978458;
        Tue, 21 Jul 2026 05:46:18 -0700 (PDT)
X-Received: by 2002:a05:6a20:1446:b0:3b2:a809:ffe with SMTP id adf61e73a8af0-3c3ad5ff392mr19996937637.14.1784637977913;
        Tue, 21 Jul 2026 05:46:17 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9bb62sm45258359eec.2.2026.07.21.05.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 05:46:17 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 05:46:02 -0700
Subject: [PATCH v6 3/7] media: qcom: camss: Add SM8750 compatible camss
 driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-add-support-for-camss-on-sm8750-v6-3-a5f841061d18@oss.qualcomm.com>
References: <20260721-add-support-for-camss-on-sm8750-v6-0-a5f841061d18@oss.qualcomm.com>
In-Reply-To: <20260721-add-support-for-camss-on-sm8750-v6-0-a5f841061d18@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <quic_vtumati@quicinc.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: MPH-d_qRzXIERqOj_pDHyrKH0y03Gzj3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEzNCBTYWx0ZWRfXz0OycWEswjKo
 ndaPVxUEiwmi7/Jy9d+IHIaUEarCT53gv6JcCYjLUUKkAC/fWdxe0Z8aFUAjqzbvaPKjJFWJK5x
 WwhkOWkTEWW3te6AvLnBc7LvDc4uUYjtuphXjiti3Wx0rUtNitIb42R/sOfHeAsH6Hz9HlihHMp
 lpJFtNXHHAszgz+9/PVcd7vxAPaTwy8HGFKxDqsvrYXkWahcSRIF/jVj0/f6uaXtr9AQU7P/UUq
 oEuSEp1q47wstxFDNFRzsGHh/phRDfnkUonOoCdJsuEADiFkyl1lHC+Ph+Uc7+vRHAqWNOAOUS2
 aE3q9hTgIw5Cr1mknoNYAQZsWDx5dQ8We6bWFdD1yUeAzrjfhbrDlOXh+Kby6749Jrvw+0h4v2v
 PC97Rcqf+l2q3L1r/QBJSqGSY+y0J9Ct/ON8NM96iXl7wwRcwKEnFQEHzS6xDve8Y0g473M13z6
 ylEtRF/MiFzEHR9RWow==
X-Authority-Analysis: v=2.4 cv=I9JVgtgg c=1 sm=1 tr=0 ts=6a5f6a1b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gE60Ov1lhapgyOv8Ur0A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: MPH-d_qRzXIERqOj_pDHyrKH0y03Gzj3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEzNCBTYWx0ZWRfX+Ndr7i9AOLOK
 O6BMDOxGZy1eBfplUJ29fy8AVqxi1lfVX7OOEu3XXoS+W4WXfR93G+xaThDS/3rhWcZpC4NKzdb
 ehWJOmIqLhgR9SOHNCEouzb7gXoFgMs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210134

Add support for SM8750 in the camss driver. Add high level resource
information along with the bus bandwidth votes. Module level detailed
resource information will be enumerated in the following patches of the
series.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 252dc2fe4207..9982174ed1ad 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4477,6 +4477,20 @@ static const struct resources_icc icc_res_sa8775p[] = {
 	},
 };
 
+static const struct resources_icc icc_res_sm8750[] = {
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
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	/* CSIPHY0 */
 	{
@@ -6068,6 +6082,13 @@ static const struct camss_resources sm8650_resources = {
 	.vfe_num = ARRAY_SIZE(vfe_res_sm8650),
 };
 
+static const struct camss_resources sm8750_resources = {
+	.version = CAMSS_8750,
+	.pd_name = "top",
+	.icc_res = icc_res_sm8750,
+	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
+};
+
 static const struct camss_resources x1e80100_resources = {
 	.version = CAMSS_X1E80100,
 	.pd_name = "top",
@@ -6103,6 +6124,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
+	{ .compatible = "qcom,sm8750-camss", .data = &sm8750_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
 	{ }
 };
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index cea213dc36eb..7f525ac37cbb 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -95,6 +95,7 @@ enum camss_version {
 	CAMSS_845,
 	CAMSS_8550,
 	CAMSS_8650,
+	CAMSS_8750,
 	CAMSS_8775P,
 	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,

-- 
2.34.1

