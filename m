Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FC4448BA4
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 07:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788938310; cv=none; b=PaTI0geeQyRyZWGCC89sIVLe1vKGGEaK1dU4ZeB63yk4aOe9u2glCXsaJgCkmPqXr236kTf3FI7WoeN55dbiSUUX9tUbVvE7lp8OnqeMQ3Vb8qRRVO6VuW6Wcyp/Q3V08/EhA1hTcUDUvPjarViDQefb/h62QjX4PItjGBRMYgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788938310; c=relaxed/simple;
	bh=yGpQHIlUGSLcMehqlSh+rkLZhK1DkUEjuhpBxSQMd/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UZAFHBtqTy/gcycqaS5fxxvxd2gHHbWuCJq0DL7IJTbjeBU0t1R94J9wKVNKXSd2VvAofriaV7uT/Vyp8u8iO131m026XAgF75R2uvlAavqxVTahyu99Vi0qEG6I/CbYbPfpf9ULo58V0OXa3KE8/d2APfsYQtnDIkMOIT5raeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qc1t8k4v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UUxTglV8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qc1t8k4v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UUxTglV8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896FmKH045565
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 07:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ipjpKoUaN2VNuCCh+tY6wwmbEor/xFlrcnQp2tSQKcw=; b=Qc1t8k4vjHMNcYHq
	rFbvk8kq06npBv0yyr5zkGJJ9ZB75IPhCtT8VILqxYa+J+WAumYgaSjiGCN8woMy
	Cyv/yEzOzM6gR8uXO/4QiUExWQnd4hsrEKFkGrLQOyjUy9FVPSnGfV88kPaKoapK
	mdZ8OXnsl8rP6hvfcOI+Q8kYmSTAKxQqN+7qh7ySJg0jHPARxiGn1S+ta/vYexA2
	y0MbYYGM6aJfZt1OKpYB7H+F/yEeioJBbI9XGxx/dCSOvLkt+8iM6N7lG+5PxWEe
	UgZIcC/2xk3VN3sRUFI+CPZNAFDoIMiRJ+MVpdG1pxCm6O70g6ID9476rvlRxn+X
	wlfQsg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqewjq1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 07:18:27 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc435388657so3862675a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 00:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788938306; x=1789543106; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ipjpKoUaN2VNuCCh+tY6wwmbEor/xFlrcnQp2tSQKcw=;
        b=UUxTglV8TerKyOAOOAv+7pR/vDJwb5M5yY7wOP7RKvdEfpwmORnlktxrU9H5UCaN0d
         bx+5Ot/W1ZLH79PyEMtBOJQK5bcm6L2aK6X8YwXJwD9g6xk/BeOkyF5K50OlFw/9B4yM
         hi8IaM7cx0ks6UGDTykcWFpWQM2hDQREBURwf61PK8zBSvM3VlgOLwgTzYLvpI0vBBNw
         65v+uIHxDNZQmHKUdqyqIB2l6JDigFRl15+VwQghAquOVasLicHGNmFyy1ukvTn4+iE6
         h5F0WXqwnxszmsSnDjWQ9ZJbRakOiY2DBaIVE6+wyfjuNqWrJgyXvJwmG55cokPhFdPq
         u3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788938306; x=1789543106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ipjpKoUaN2VNuCCh+tY6wwmbEor/xFlrcnQp2tSQKcw=;
        b=HGxYnfMKj8lmdYgU3oLJ/S7cNEFgC7psxwK4DBwlYLyYEtqS2TV0FYdGYFgRAEvQhq
         ucSx8eYSVpmSDrZ8BTqsaheVpxnjdLVSxWx5o7E4lPqzNZJoJ1X5yOnej/G3T9wwGCHw
         XsDLdm0UXeRdThg68yGlM0eJtnIPlxBiV2IEy4vtyDn+c5TCMtq4FNPt6aU9mvdxvGeE
         Se5EJ95/44TilwJbJKi/QdhMwR6t4flq7Seb+DwxjXb6CTJB6t36CMTNMxXmQD/UqL6q
         tgtuKpZmo0y7a813gjP90kI7S9k/E5aqZwVPt1e/BqiNOjn8UW5INhdi6UO3VzO9BDKT
         blZg==
X-Forwarded-Encrypted: i=1; AKwUvByl5AmeyMVKbqYjV3IdPxC3ww0UBfRnx+w9hhKFOBqix8/AUYgENIQrEeMVtbUwDf2hsTtAK8K9qNorEn6U@vger.kernel.org
X-Gm-Message-State: AFuF++lf7sMm3tvpOVnlg+vo5yN2Wab3qoz9UrlLuBJ4pLHr69G5oxY2
	DQgXbcqA7GqnBixFQTqFBZFgu4O6yd2I6+kR9fIBtWryQVhr/PzYMUpD+0QwlK+F1YCit/Y+YRo
	iqIOpkmpYaz7fgDkx17yefGwMdjEc/XYaIRlxyIzcb5UoOUBg9yUE91K25/926ByQMBLS
X-Gm-Gg: AYBFou26V7fc74VTZllLo2OXkPIB21Dig3MRWNbevTbD7/56lreJJzA9vrGdG0Iv8yQ
	rYYNcAOKZocvlZVIe4NYtybznsveB3ZQCFvcYnkI5IcqU0zFLAQwtbGufjMDZwG0/rip0QC0grK
	0eAkMuICeD+dhPgZGJOvKmVItxmVTuGLp3tBQ2E6gmRmoI/IsAA1PZBEq6cWdWTq4kuyrQlRNV4
	g2VTgO3/918gdpO76Jqh+yZHP9Ds9HOguDsqHoZgs/liicw+RGRwBTxKG9k/2vHrGf8vRkCxhaC
	EqEoIXipnPqt9OkY31COGcgJR56TMIwmk/rRh8H38rnCQK4YXks/2l+kHm0CJSlVdNsIzrnUgkq
	mlkbGpLtoW2E+4VXvc5octWINZxVWw6gH3iiou4CrV0m/RgH+Bgh/dE8/jsk5ADfU
X-Received: by 2002:a05:6a21:78b:b0:3da:bd6d:bef4 with SMTP id adf61e73a8af0-3dabd6dc136mr5155786637.13.1788938306357;
        Wed, 09 Sep 2026 00:18:26 -0700 (PDT)
X-Received: by 2002:a05:6a21:78b:b0:3da:bd6d:bef4 with SMTP id adf61e73a8af0-3dabd6dc136mr5155610637.13.1788938304905;
        Wed, 09 Sep 2026 00:18:24 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm48308536eec.7.2026.09.09.00.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:18:24 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 00:18:17 -0700
Subject: [PATCH v7 4/5] firmware: qcom: scm: Allow QSEECOM on Kalambo CRD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-b4-kalambo-crd-v7-4-f5685804478a@oss.qualcomm.com>
References: <20260909-b4-kalambo-crd-v7-0-f5685804478a@oss.qualcomm.com>
In-Reply-To: <20260909-b4-kalambo-crd-v7-0-f5685804478a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788938297; l=984;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=yGpQHIlUGSLcMehqlSh+rkLZhK1DkUEjuhpBxSQMd/8=;
 b=xucd5UNB8nwUt1Q7XFsh9HO+xqloZCrJ+Q7PIHX1iTnHfhmC+8polPnwLWvhxXXN2o5VItZSc
 kD8wCbuvqfNB+AIEzDN2qzlksaP/aeqwEGGnIEM2QfOFq/yzeO26/lu
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=cpirVV4i c=1 sm=1 tr=0 ts=6aa10843 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=sPeBD9Pss2NjrgU8DtoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: DIjqftmpRUFffg0sBLtHnTzuQNNtY11S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA4MSBTYWx0ZWRfX1sAEowS/WJ8v
 VjyoErEbkVV59eu8aM2P+dJxlPgX9r1HdfIndwG7gRc3JFyeZTul1Itgh9l2QgxW8Ww8+6U0H6z
 ErIfqalZFgjjmO+S/K+yvdi1++JyiKztYU83hjA+7wtzdKLJ/lvegh74QE0sYkaN95Eox4SLTot
 B2emJ3V02xnuA93NkXlbyDqz7LdzSIr1G0QJ3zUDBhvFoaQaBB3A//tYOcmtGDyRchZrhMvAlP3
 p4cw8/WlvBL6Cylm/oqu95c2cZonGAoJfeeEKY0J71LSfb8ULjuWdutYrPsaTV8CqFmnESJxZJS
 wJtSMm6kYXu+lXv1VoWlYowhK2A6kBTaduogjgHXOZLLHY5E7bLddPIJBN3mKln65IrkUw10IAy
 0XEN5BT+AnvfJZW+yhmRHRen0qHRzueiU53B7UhAEFVAieHco5C70q5mOwa2N4v6tR0zLrXVNDC
 +aqlH9u5SCU6zHPvrMw==
X-Proofpoint-ORIG-GUID: DIjqftmpRUFffg0sBLtHnTzuQNNtY11S
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA4MSBTYWx0ZWRfX934kJAd4wurL
 I1BDWwmi+a130idlYloFcGArKE4ijxXbeL9049eayp+h+fWdFYn0hqzgXGT1FTtFaMshYQBT0jn
 LKbGlmIuy1F2CPDV/xGXmZGr+/zjjuk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090081

Add Kalambo CRD board to the QSEECOM allowlist for enabling access to
efivars.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 882d1865f3a4..98693295961b 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2244,6 +2244,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,romulus15", },
 	{ .compatible = "qcom,glymur-crd" },
 	{ .compatible = "qcom,hamoa-iot-evk" },
+	{ .compatible = "qcom,kalambo-crd" },
 	{ .compatible = "qcom,mahua-crd" },
 	{ .compatible = "qcom,purwa-iot-evk" },
 	{ .compatible = "qcom,sc8180x-primus" },

-- 
2.34.1

