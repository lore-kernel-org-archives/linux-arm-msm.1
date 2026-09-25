Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21C1411A12
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 05:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790315362; cv=none; b=elnlCDrEUXvvNKv25HLjmMQFX6ZtvDvg0UtEJBcOUSugXoDfKchLkAQIaUw2KQ0L/TPwtBjFpmXBEyOT2GSvbA3uuHMX4RZMO9PvtQsbbUea+6KbF0lnzy8UZW0IonTTe7SY7kCI3mayCGeyzkVk4e8hiT2gcbDdpH20h5vp//4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790315362; c=relaxed/simple;
	bh=QLwU7fKegSZgo7lckFiKBtN1ZL2aPp2XYB5oMQOrME8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ewV+FO+mK8INg0ZKrqjHEkuDATt7hJqlfS9bhIF7oxpEC90lj/KJrl96yCB5V+E9Bs85yGNAPly57TDr4qfrnDE0lE7qIbQDDIp7dHIGg/HNEf3azt8iAnT3ZIk7ILdHcVk5lBxvdYudBEiJzuPMOEzj8CKHTfhXPhLdlvBS/u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eGTfyAbE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gC7eu1Mj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eGTfyAbE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gC7eu1Mj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YMiT1055331
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 05:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oss9++ljyuGbbaBIi8aA3J+tr+vbQN/DpaXOHs8TZi8=; b=eGTfyAbELFWnKAfB
	xt+GAruKXEPtJTQFZX/PIVtmQgtWvq3H3twCVe7TRXsKkZ7OEssHRWR7Fpr0454B
	OCpfsfIF8WS+HXgHanD+P/V+sQYlZlv2lft7d3kloC9jV8koQJTTKLmMFunDm+ur
	ehLDFd8YdAq7FSjJ3KuCUK4GyfNBySPaJhJPYEv7ewuu6d4anJqKPnlbuZgZC1lW
	AnLoj75lg9KwkmzSUtvYjzsc5r8mez0NsaJkwy2Ab6DiEUNCUWaAt09avcXUMyaN
	ihJX/yNEFryAZd6+FPipPbkKOt/PsxfmyAWwHjXZkhThGePcRz82UBXJJRUscZk7
	HAbx1w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwce795ap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 05:49:19 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-331b2ec616fso2008216eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 22:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790315359; x=1790920159; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oss9++ljyuGbbaBIi8aA3J+tr+vbQN/DpaXOHs8TZi8=;
        b=gC7eu1Mjw149zKF8u5DALqP0RuZCgOyonugIeX+CsIvSCodV8drv4wdks07CBXzm4g
         6qKmTDnHsve4gNpDKDvmE0fVqhgHdOS4aGwXg2NspU9cXOdu57keDjkBvEGJ+s0Ma8LG
         4i1HsKvMjwEQlHqsDaZXB6NKEo2UkmMj+8QvTFn82GRNcV6OZjKEcFV8SMgYwHA9AjrS
         wXA8tSVRKgWXC2KLC+6BrZM05NLsbaukQu62xjjN6Zoqm+UkcIHrsOlWuJNEqHLE6dys
         FOau1P5OVs7QYn2d5w6J6cZ+47+BkD0ALuWwGL/UymfHYOZc5hBhpT4MmttzoWbAHCsW
         ZQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790315359; x=1790920159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oss9++ljyuGbbaBIi8aA3J+tr+vbQN/DpaXOHs8TZi8=;
        b=oyXpVn6Ztq+Xb7kFLx+cWao4DkiE5TrtFpYnYebrmvFf7pvc5cCiLNEFxVDjJzASF3
         xjNAnWo1kUqOAbLldcSV2+vLDNE61SHM0kvCxdoIVOpSxbQ+BZ6XpZ22G7RBeac2l5vx
         YHVDPlGTeu3s2NsQY1mfWq9s3/hK77IcBYjgmpkszb3otH8m4mkVjJIjZ1PI4y4WVfD4
         MIlUttiFijSQsGczGMLJWviheNOplJhDIw+pyuRYBtZ/6418lBqqFQQ120nM2NEv7kNY
         FcLlIQRm+Jk8I7b1WvcKS6tIZZk5SA68gq1EdAjIGecoWHKeOCHkfPRpcPAFJDk+1OiG
         e/Wg==
X-Gm-Message-State: AFuF++n7MkfHDqnd+VstBJQmZAlmqgGcUoA2R7rZFjLTF4R3wiawHTV+
	YpWWtW72vPdEiNyKD0s+s3mW+xyMYVYMihfuUWpZSLqkKtVIwoCeuCxVIiDcIbzJciio24oPIZG
	zHDkWGv4sfRgnyANrlvKpN4ZVqZYGztYQjpkQpDfP/QaklIPIr49rnDXwhJO8QhyXiVcE
X-Gm-Gg: AYBFou06BYGnWfRfKMrzLdQU9OGxh6o24iNWj0X6zFcwo7ATXwS/i+dLJqX616d/mkj
	Br0aw2RPVxv7xqGym76IPgTS5v77b88WkcQNC5rFixW1h9s/0wWml+nPy9F1Zxke0rLbqjARF8Q
	r4YdY8mEIMT0TU9Xan4IYJcVzSk8zhwCNIC0M8DrWKWYbPKLsYO+HUAT4J+IQV84Xo5HaOgBDDp
	09MWOa1HaDbKbyYDTbVUGgxy5U70PGGdOyxW3MDDoPP249NssBy/jQmqGvfQB6gDuk+Hj//fupw
	3nc4bTczrQb4BXx+wJ+7ZZlqf4GtJMNZiMIEmJRdxcMXmqogTLjb/8c2jweXRWxYma5Ec5CcGE/
	x/A3DAR/To+ZdhEDqqn9yvn9YlUF//Ec=
X-Received: by 2002:a05:7300:8427:b0:334:2f5c:7c71 with SMTP id 5a478bee46e88-34003ea90bdmr4212604eec.33.1790315359112;
        Thu, 24 Sep 2026 22:49:19 -0700 (PDT)
X-Received: by 2002:a05:7300:8427:b0:334:2f5c:7c71 with SMTP id 5a478bee46e88-34003ea90bdmr4212565eec.33.1790315358318;
        Thu, 24 Sep 2026 22:49:18 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144757747sm4033640eec.13.2026.09.24.22.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 22:49:18 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 11:18:47 +0530
Subject: [PATCH v4 3/3] media: qcom: camss: Add Glymur compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-glymur_camss-v4-3-d7c2983d6d7b@oss.qualcomm.com>
References: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
In-Reply-To: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790315331; l=1214;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=QLwU7fKegSZgo7lckFiKBtN1ZL2aPp2XYB5oMQOrME8=;
 b=GmEpPaANJX5Rbq9h6qVoKL1Y9Z5DqvP0yTw3ry0S3pNLIgkkBoGmp1DvnWKweEA8hq9eRoF4i
 MGN5D6ID16RAFcN7R0Nuax6bTwsuplBO+rOdSFi/QbrQDiRqc+R6FbV
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: 8EKt0yDF5GT6XPir7gUVPT3Zw5lCBwiD
X-Proofpoint-ORIG-GUID: 8EKt0yDF5GT6XPir7gUVPT3Zw5lCBwiD
X-Authority-Analysis: v=2.4 cv=NJFAaE6g c=1 sm=1 tr=0 ts=6ab60b60 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=xYyVevvQUQiUFKtwU9sA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAyMyBTYWx0ZWRfX864oIea++QEM
 VuHavoC13HEZrLw8zc8LIkZdYju6l7XTJNTTxjTxKHkHoaI5a9FbDXnABBImO5uAcnXvAs4Dghz
 d0kELtQtDdHBF/py8l+GJMPE4sqYR+SCbZGEn0WKVQ3tKoxKXWTANAdNp0WCe3ooxIU5xy6UhWO
 KJh2V1n7/AwOUvhaVbCxP7iWEV10ZcY/Aw5hi+sg/57hg8QqCMtx0COrtD1yTnnE5RDrANdBZsZ
 chD6xM64CCJWFk5Ar6o+Z9hzicq+IJk1G/utg87weP2okLxIGBCDsV5HW0qgJDSLdOTwGxosk44
 CXD984iYS37VQh25XvAIYw8abLsN9Ilkw1CD8D28P5s4QGYJYta3vccMZF0B21zE3QtngdwIvnn
 jzzssT4LQ+LMRy7UFzyb2CxwfNQtSJmB1Eufwb5fC45kIGM5Dggj8oHV6qZTfSOhK4kh1DWJDYa
 NqwQfCuYyisTb4r5MRQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAyMyBTYWx0ZWRfXyBOA+YhtS082
 lMwMhSWIWLomt9FLScyg2Jt8E9xFnaI19YdrRLPS6H1jkjpYwIxB08nxSBN6Kl2z53pDciM1ru3
 VSdDnO3EO7qiFKpGZmrlZPmk8ighbsI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250023

Glymur's camera subsystem hardware is a functional subset of X1E80100.
TPG, CSID, VFE, CSID wrapper and ICC resources are shared; Glymur has
three CSIPHY instances versus X1E80100's four.

qcom,x1e80100-camss is not used as a fallback compatible since it is
already claimed by its own binding schema, causing a duplicate
compatible warning in the DT schema checker.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 23f3cc30a15a5e098162bea98ba69fa636abdefb..9954a99981004590d34c722337bb6510fe759699 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5751,6 +5751,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
+	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
 	{ }
 };
 

-- 
2.34.1

