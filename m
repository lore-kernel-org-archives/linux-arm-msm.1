Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2114E3EFD27
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 08:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784190808; cv=none; b=ToIF/hDR16VWlz6VQrrgtBhFnbwayeJkyD/AD5EfBbHN7rDajbvkaPLAZOlOg4CDx+qHQrrNAeQXJAzWB1LEnL0GYg9MsNmUph1uXOwtMEKlQ9tTccdBAy19+n5bwjMxDcx25aCgBIyt1SmJW8Ky8KUA5ZjF4PFN9I4eLr9dW1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784190808; c=relaxed/simple;
	bh=j4YP8VVHcJxGBcL41VK5qnTosLDIe7RBXIvw49IAINw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fe41k08TvmsEZD9E1Q+8cqzYBOeaDCI3M+IVGoYM1FhT9DCDAORKUY83GToBEga+T046y8ScqCnvpx6xcU97Rd/Ao5IhLH0anINEd0/u0XSLmILHmG4ybbcLgNXAjWe8pnmLeWbdvBqUiLs14xNnf9PKbGcJe3YQWHLcBq1vjDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ibk74bdb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Szhb3QS6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ibk74bdb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Szhb3QS6"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7DPOo2193550
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 08:33:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DTg9lmaJlslbUOkVtN27vmAWs3BfSe86rDw
	ZaOm3C20=; b=Ibk74bdbcWdTnOnIE8S3UghYR/967Q6LVCbX52cbZx85QvjhYD4
	+aWMhkHatls6NcaGlzg6Ofvr2Wwmm5bneP3dU/Fp42KowOtuMBA1x6mbDnsjfmg2
	jdTvu2J5l5bnLeDztP9le+aryFRnDYyb8iKCHtPNubY1OYmxt0CnilCXmeWV9Bn0
	hstsJoplX0DqK9WB3veLFjlhbbL2PxzaznxhkmXiK5PvQCMEOD/wRIRQBTIE2U/q
	lg+XrkaHzRdbnYq8OGBHyP2diBX9A31EYyBvTRqLz5P5NOrQsXp6QCqc3FP7aEQO
	X32oRtt8zBQnaYOaIRHM08LruKCSc+hF+/g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fetcf0cd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 08:33:23 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c890bac374eso15829576a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 01:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784190803; x=1784795603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DTg9lmaJlslbUOkVtN27vmAWs3BfSe86rDwZaOm3C20=;
        b=Szhb3QS65DXDBb8k7G576ytQQ4n7FPwOi8lEr30Tft5MbzcSi9neXTUGt81oWji/t5
         aCOagIPmhVImbNY5pLs4MHmglC60eJEJ7SiDd4836bqqkGD9CFeQYYJr3FWfJHYJunF9
         F/eklon9PILJI8O+X8XviCJrMkoNK6aBryo8ZPLQlfqkJ34Nf2vKCy/x8v0CCfutiWnS
         LTXVqyj4vdB9E9r2eWDCIYxG45rs8saZkQ4hkVpORODE0RRHGtdbTJBFG7f4YUjKjkpj
         nbx/DFuhFy/5XyBGjYxqdRJfEuLw7cYvRjuNjCpFBhhtjf+RJjDmNNyG55n2uSAaGJUA
         Hw4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784190803; x=1784795603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DTg9lmaJlslbUOkVtN27vmAWs3BfSe86rDwZaOm3C20=;
        b=cEPjLS2BH0uIpfiTNacCuCVkkBYvQwG1FiUpEbkSlq27+m2buaJGhTZEwrWeoQIsp3
         0rpiXQSC619MkaFVlwQTnT8OUPysYQMuCNYj3PlA7dkjZrSERwmicjMShCSq62jM625A
         TE+cgXjg1gHfLe/d0jWu7kA21piDWYT2qfJ4NnzpHVMZ3hASFGq8QRYzv7Gvg74RwUXM
         7cxl3hy+QgaFznyPQqqaM83gtqAOq4E9NhoiHG8Tq09RS3FiLQYPpLgM9uoLdUqRHDKB
         jnOYs86j+qRGd3nGUuncbTMtuCA2WsNE0qibidFRWefG6u5+uBRDt+T6+dN9+66rwj35
         1r4w==
X-Forwarded-Encrypted: i=1; AHgh+RpILm57HseQGTrgul8d60mDaqoAZXUEXlh223dNWQ+KHt31KDm/WV+P8gEwIlLNxk6imtWsfBEJqSxX06uN@vger.kernel.org
X-Gm-Message-State: AOJu0Yw76VXTgtVb//vwI/qIxxcZDWVvWeDt3PwwLm0aUgzore3Zphc2
	Zqe/SVvtU4I24mfydjC89WhL4n3/pVDMu7RR5SfqYkbeU5wVDxNfr55SSdywC6SmYv8owVXHeZ2
	SGqEK24onUF1bhaYO0gVzc5uSe24VulrR5luFATzo3wDkP7g2tXeadVip3HqkR5sdvkpf
X-Gm-Gg: AfdE7cl2Y7upMnDJIKqFBX8iabG+tglbFJFprwqAhNhB8ynTGhMppKmXEr7rUcx+mrp
	G1Ozmaa458DzS6LJq5biVB+MrE2jThKQzjKTAPSrcAO8+6vGnY7+nzRuyMSrcUjgiEEES0c9KOL
	nzBUSpCmP3eDPi5C9XKTwQl22Dbv9Dl7TR5JrBnLUPkJ9wacMFdzfsIs+BTu6XF/8gm8RA0MJUD
	Yfd2mP/VPXQMdrSZz0TZrSedRY6Jc6+1MOru4mr7F5ETYXBR8tTqDBcxh3MYcG7qP6t3PN1NJlp
	pKdDUXc5Hz/dBL9W87Zv/qmvekmhHYtuEXjegctscZCixtqg0OHiIRtbpq/W9GEKvI6wyzFMfP5
	qYNlYTm+pqLV7Jx/AHCJ+c/e7UjKIj92iDAN6ZrhjROU0zHxAEDNBeacqTvKo
X-Received: by 2002:a05:6a20:cfa8:b0:398:7ed3:a001 with SMTP id adf61e73a8af0-3c36c0f696emr6539746637.2.1784190802641;
        Thu, 16 Jul 2026 01:33:22 -0700 (PDT)
X-Received: by 2002:a05:6a20:cfa8:b0:398:7ed3:a001 with SMTP id adf61e73a8af0-3c36c0f696emr6539721637.2.1784190802237;
        Thu, 16 Jul 2026 01:33:22 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e5306afsm8979111eec.9.2026.07.16.01.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 01:33:21 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: "Martin K . Petersen" <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>,
        Anjana Hari <anjana.hari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>, stable@vger.kernel.org
Subject: [PATCH] scsi: ufs: dt-bindings: Add missing mcq reg for qcom,sa8255p-ufshc
Date: Thu, 16 Jul 2026 16:33:13 +0800
Message-ID: <20260716083313.2367249-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ffPdZr6cl1yr1YKR4xD9UEpA7sXFc-uC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA4NyBTYWx0ZWRfX80MlNZJ6Cr0f
 kr86PgkjJZePgoh+1THqGlAqQR+AwmVXlDVBroN4JbxHJyO6dvLos7M9etzIEwcs2myUCCTYb4a
 JLSMeaGlRuEsJXUWXby/Cjhq3Nm0ghUSFEfKAOadVbtYzR9T5MclvcVi1Yml6c+owgAY637LXss
 YMAvEyjCixxLFD89wsiQ2F8ZzzYU443Y8aGCIEs33MMl3Z6WBj0YGLkPqCvaAWAYYiZW22ROYOg
 EfO1jWfNVI1DTn8J9ZFa+hdbNlkaHUjU1tfCI8CoOQ2vQXnxLIiSQ9qa4D4U3ohTCwmCPLZkZ0b
 EYBhAvtV87+VGMt9j1lZrCvyNWKr/G+XHypY04AHjs1HAeklPoTaZz4ot2RD7GjuXXn0kbqugJg
 VnLV3A/x3EP5e1BWg1zTrBf7WrVfXbTft8X3QtW7zw43TGAw02mxweDtTtB+xaSBtLlxZeADRvv
 k/fFNHynzYk3GuYmqpA==
X-Authority-Analysis: v=2.4 cv=f8R4wuyM c=1 sm=1 tr=0 ts=6a589753 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=3miq8Qb-Iyz2LYAwW2cA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: ffPdZr6cl1yr1YKR4xD9UEpA7sXFc-uC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA4NyBTYWx0ZWRfX0UyFAgHlb70+
 rgm363wtx5rXeSbNxcSf79NjRCCqp+ZhXGXs587DUr/sXeeK8nzFOJP1sjf7/Uh45c0IZ+jNomP
 HE2HeevrjZHn8RLJPnZ6R3pOjnqj7OI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160087

Qualcomm UFS controller found on SoCs SA8255P/SA8797P has a MCQ I/O
address space. It should be defined in the bindings even though Linux
driver currently doesn't utilize it. Fix the binding before it gets
adopted by DTS.

Fixes: e2725ed2a7fb ("scsi: ufs: dt-bindings: Document bindings for SA8255P UFS Host Controller")
Cc: stable@vger.kernel.org
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml    | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
index db165a235cb6..bc8734e1fdea 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
@@ -16,9 +16,15 @@ properties:
       - items:
           - const: qcom,sa8797p-ufshc
           - const: qcom,sa8255p-ufshc
-
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: std
+      - const: mcq
 
   interrupts:
     maxItems: 1
-- 
2.43.0

