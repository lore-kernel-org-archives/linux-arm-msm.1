Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793397922;
	b=3ebqVe/QO9eDxUkMSoUVwuqsWgf+xji9g+LX4zGqTFDP+r6dosxpJ53Drd1lIBEsfHop
	 KvI2l281teJQkc1r+PCb3AoyxnBCoDAnlVtQaHHC8XQ4i7AuFZuxRpYLBXMa+3e5Q0ywT
	 6I7aGaMSrPfRwDrFR7naD0K7+pF1ocOXMSfAwGOj50Lg0pJkHnu0hgY3fGOmTe/k8Etac
	 CtGSqXUTMjR6211Cbgu5iOlwEviH/8lJkp23MUMEyRoifIdA1YrE4vUZ2akW9mAtyNNF+
	 5m6R7JaefnzUOZf6qrJ7+nxpDZajD6ydqlXd9KhdCN7iu9gmNB/EJQns6PoGvGpDbGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793397922;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ldJHLqNPYA21kCRrsUkyNCbzh8KMiC3m/wDt/0CLW4U=;
	b=RDs3QA9VM4dM4gEhH92Shkzctx+gRNxPpdqm9ANjNvnaCPWba7VP7PG3RREdkpoxnXtb
	 UomiI4VdAkTzFKhz/3t7dwrk4hbYMuYvKHBIXu63Z2Riu/RkABNckoRG/fk80+SH5NHDp
	 +uoVpPs+rWTFhcQoAl7nJWUjSxTk4wWWlkezP7u7/BERHqdOFHpwwzcRFLJYWpQYultMN
	 13azAd/8OL89gr/Wm33KScJ9Py6Qrg2e8jEw14OKoBfLvkvJ1IctBIdL0/ctJJ9RosFcb
	 LhgM4+1R2GBeB6N6RSz29v45xqRBdmQ65XJWHOn3Uokh2Tr4r+eUPYONzInfA3LRQHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BxWAEqB6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QdA9dro1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620F3606A322
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 22:05:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 620F3606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BxWAEqB6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QdA9dro1
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULtQTq349469
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 22:05:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ldJHLqNPYA21kCRrsUkyNCbzh8KMiC3m/wDt/0CLW4U=; b=BxWAEqB6WtHoP7jf
	2dDMxfDD61mBAnDl2X9HO8BQDcjwwbqYm2ImVArwCd+yQQMel+luu6COS87efL/l
	oZPWKgiMorDUdGPDxFPD4YwvfacTEWleJTz7zl6iD6kJvH2jQtXsCNPqyZu60sWT
	ox0C4nNPLlxLe73MdDNQwYi6jLTqm0Y/omxqp9rz5/vL1gF46A3pnXshKmomkvwD
	xekR2kkG83T3nx31G16mPrWH+WOr3fhvjOtK1ppJnQfxzPr4t9ZxFWRHusowgH2V
	3RdE7K2VEQQBmiZj8AGt2wzJlIEKcWDUhBc/iOS20ygg5mWAklgPxlb5KrYNGIdT
	rdJx6g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x0g8me-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 22:05:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f32050e72so301367885a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 15:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793397920; x=1794002720; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ldJHLqNPYA21kCRrsUkyNCbzh8KMiC3m/wDt/0CLW4U=;
        b=QdA9dro1ipbGq16qNkpoL4dzixd9qHGvq9lRoxtEpcu8eZRneH2qEkqH7Bj0Ok4J9P
         CWzEEIgip9Byvi5FrzN8h5DBbUPVHtINRGWhjefvxI/0HgsamnazYpMLiAvs5nRmrWfi
         CFVVxAsYMsqjuvLDsjzfNzPwSthUuK9ma/42hCrlRgdbXtd6+vhaG2FVG6q6H7lHHXcP
         QFmha3S81rCBg3A93ZanZTBVDUWqB5FdsmU9IcgoO2az2nUOcESvdsClhgWYcyq4f8NA
         yWW7flDl7fAcNYhGQcJweF2uSNszusBg87NUkkGYN5X04zJWzHQ7gQj4wn9ybgV0Z9AT
         5UAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793397920; x=1794002720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ldJHLqNPYA21kCRrsUkyNCbzh8KMiC3m/wDt/0CLW4U=;
        b=WzjF2ZUH1ZqyYmoyY40e88TTalbPhbUQ1XGM/k2nxWmtbsHhtTY9PoL0uAeGLiWT0T
         Llmk/IoUj90xNR7nQQZs0tCvi4vySNvo2v+Nof1WDJcNkLlOrI/GuHhw1uWnEv6/epwa
         gg8/9Zr/UIj8erhAb2LZ1ksSYhE2zPxblwKgbsAOGHqK+AMR/R6wmaCXbtn9jSO1RJd3
         ouQ1wIQ8PWfem7Yy/WxFvDSEwKhvo+Znx1vvah+WfYqGSV6ZoNsqtX/pbdk3Bdxkg+Vq
         awPBpcFDBQ8bS0bTtNzJvBH4/79nlc2lyA3j7vidjPkA6PYuhDyalDfAjzi3dDz+0lyY
         XCfg==
X-Forwarded-Encrypted: i=1; AKwUvBwwbBhokPEq/rxLiERX1ylmY4HSHWEKA4ZY/DMGd5sH6CdFuQgeT79WmL292cwnyWdMZqGyLQj+9ey1CHox@vger.kernel.org
X-Gm-Message-State: AFq9FYLRgqgfdE3RSpcD5Kf+4Bq/HyFYA0c2JZ/nmKxE6Q8ZLOXryK+H
	THiC4LdhOvmbtJpwDMdXjN/ajV8CX2rk9INxzBi/D66lj/v/fsx8fNi3Wvs69xT2O2xCXS+7mds
	P00GWx384M9VsKaV0pOkJKGWeIY9dXMoMR/rarUoDQt30shpXv0X4JX9/FcOWwNln46GP
X-Gm-Gg: AYBFou0v2ZpC+OdqVZG3Z8mGOOUfPYH8kD+9/VihQfL2gkLbyrHNe9+te8hJ2l36Vbc
	fcq3bxYa6R/Tzz1RnqHTmypctIRx8xFOks4+bKbrgGl/V9GvOp3CGTTHQxKyIV8QC9o8aLLdifn
	C61xyhL9N2Tl1POwfzcMIBb5P9JBdhLbCJbJoPKbKTa/Y0n7jx+HhXWEGh6kSCb35Uk3SOnR56Y
	53fsFnL6Dphk3I/b4bQbnV1Gg0ECHslufZH7Aj7/gAJ/uubEf28PQWMDo3OB6xvbV2aml91Q9oY
	uJb0ppQYJLOtoaTTUdp1ZhL/E74DIe2y6xLw6FA98YINrEccUJOsHTmhhSDBEyxFg/SMzW/uKMM
	m1gxWwQKUHelsKBsFYBwXmH8L4n0eJTitTBLfFDu8OUEtAMhAg6TLeaN/OYyuiMPzq+gJ6m+0hy
	R5JDHRU0IHlSEn+eHSh9w6N8LH/E3AVGhuIAw8bh9dCdseM48abYC1s/Qx/DZ1nw==
X-Received: by 2002:a05:620a:1793:b0:93c:c96c:a592 with SMTP id af79cd13be357-944216964edmr668715785a.36.1793397920584;
        Fri, 30 Oct 2026 15:05:20 -0700 (PDT)
X-Received: by 2002:a05:620a:1793:b0:93c:c96c:a592 with SMTP id af79cd13be357-944216964edmr668711285a.36.1793397920090;
        Fri, 30 Oct 2026 15:05:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe04edd7dsm243930e87.6.2026.10.30.15.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:05:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 00:04:57 +0200
Subject: [PATCH 1/3] iommu/qcom: Invalidate the TLB in flush_iotlb_all
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
Message-Id: <20261031-msm-smmu-identity-v1-1-a2a70580eebd@oss.qualcomm.com>
References: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
In-Reply-To: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1766;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=LQSeEnZeJwLPjMHD6yS/rY03vuD1dC+sPugd4ceeFj4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq5RSWvF4Ibiecr2lXXJ61ZULZ+El0+25rk6uqh
 DEvzO0k4f6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCauUUlgAKCRCLPIo+Aiko
 1XnrCACbcBLnbtrnjqWfI3ofMBee5ZVbwNaEdA00rUry7tWHK7wx7qu8a8mLT5cWfbQrJxqwxOQ
 7i6yVmfkJQFaySlcalzPLtlP88jf8A3hnAzX5ZHysbCk2TCX6SiYhUP2QjUhz1k2KWx/nxbbMi6
 25OyO0MwxZYyeQeirCNqIJw+jd4GjIYU0hqp6VwJWmcCaPmzN11UUMPgvyabVhFkG41BtDkyM/G
 uuvyvE6Cvdj37X6ugVN5dYce8dVlhPI9KU1ZMqrYhYqX91HVRfXj8APEAEwrV5+hVmwoE5jZpq5
 H6UgKNAeREwuWzcCbth9Y/W+HmkWYCOZt1tBvBNoGF5BHCzK
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Um0VOPF-pYmy4hZjhS6v7XC2MqX-AWv7
X-Authority-Analysis: v=2.4 cv=No9E4MdJ c=1 sm=1 tr=0 ts=6ae514a1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=brFVVzKzgM8PounSOcIA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Um0VOPF-pYmy4hZjhS6v7XC2MqX-AWv7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4OCBTYWx0ZWRfXzoAFzUJsWM5G
 djYHtMOLaRLW8gLfo8EbhtH7Dl/WQqooqy4QDAVSxeetqlimZVKfHnFikXY9p9CjU9/q/4jDk//
 R7K6WiaPjc3XC7UpQ6Vpqd3aNF73j4Z3c6V6OL1hvvGD0E0jlNs3s8X1MOP9lt8zf1AI6kymvUL
 fWc3Gy4aa/1vvNKifSV3v1QyQbzhO2Y7+WgyVGC4J0fVmhiDIdPEF2h0FPdXgOmH4PMjF//YIpG
 NAx5elBGEi/wRaLCjG5kb+szTCVpnnFP10lqb5CuDQFFCBTspGQb3pZjqZQS5Pu6NfgyaAtwPqG
 QcryTqBhKs23czak0DDU6J/IjS/op/iTLwEub36BLYlFktUmamQAb/DNT4upJh6wk8VigH9mvvF
 DJRCmZS0R1OZ7POaUUnehmIxYLuCX8EPIZiysU4qRW4dUySoXbYv19+xOIhTqLFTxTC/xIwYT/t
 1NOxss/OzvevyvuNl+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4OCBTYWx0ZWRfXxXHhL1Qc/CTq
 dnE0cXg6s+yiX+wtpqGjAVMDMhY/6e8KE1iaiAn7R4R4gr51kJUCqVwjYo8XYqujrcIJ4ftuRBE
 vd4ny/rC33wCrtZYVO4OLWn7SkL2VIs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0 suspectscore=0
 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610300088

qcom_iommu_flush_iotlb_all() only waits for a TLB sync and never
invalidates anything. iommu_unmap() users do not notice, since
io-pgtable invalidates each page through the gather, but drm/msm unmaps
with a NULL gather and relies on flush_iotlb_all. On db410c the GPU then
hangs on stale TLB entries as soon as another process reuses the IOVAs.

Invalidate the whole context, as arm-smmu does, and keep iotlb_sync a
plain sync.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 21d18ce67b98..54130c32056a 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -479,14 +479,22 @@ static void qcom_iommu_flush_iotlb_all(struct iommu_domain *domain)
 		return;
 
 	pm_runtime_get_sync(qcom_domain->iommu->dev);
-	qcom_iommu_tlb_sync(pgtable->cookie);
+	qcom_iommu_tlb_inv_context(pgtable->cookie);
 	pm_runtime_put_sync(qcom_domain->iommu->dev);
 }
 
 static void qcom_iommu_iotlb_sync(struct iommu_domain *domain,
 				  struct iommu_iotlb_gather *gather)
 {
-	qcom_iommu_flush_iotlb_all(domain);
+	struct qcom_iommu_domain *qcom_domain = to_qcom_iommu_domain(domain);
+	struct io_pgtable *pgtable = container_of(qcom_domain->pgtbl_ops,
+						  struct io_pgtable, ops);
+	if (!qcom_domain->pgtbl_ops)
+		return;
+
+	pm_runtime_get_sync(qcom_domain->iommu->dev);
+	qcom_iommu_tlb_sync(pgtable->cookie);
+	pm_runtime_put_sync(qcom_domain->iommu->dev);
 }
 
 static phys_addr_t qcom_iommu_iova_to_phys(struct iommu_domain *domain,

-- 
2.47.3

