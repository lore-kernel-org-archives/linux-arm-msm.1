Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB1130FC33
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 01:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788313165; cv=none; b=H9MC/ysq1miSYc1WMVEMUnDKumYuLGssXU47fhTdQphYgouttjKrffQ5u0ZwjtnOsIASz0CJ6Xn7YfAio5mSW6MiP+9YoqzPR28F+TaxNXcBuhkttpUhmrmbCPjtPRWoLuYTKFQWKPrHmT9Nsa/pk/yN8QoY28UtJtHZ3X+d0G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788313165; c=relaxed/simple;
	bh=srdvK2Pwqt7zMSazM4WQ5PLFrgZu5u3U9HplZRiS3wA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vd218sQrjP2TbzDFjmOUw3+qTuu+0otjnqcWK9Xex1azW37NTYOd2/L5UzwzJyIjV0/F4lSsQKO/3eFUcR5e6uiRx9YafdNQcKaJXEK8UVVn9EnEFVO+/02H8/1ttzC95yXFq8DL8gSWFgMqNA9vwCITl4IP2DNZ9H5XRuCR5F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hgdSUzTV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=it+GziKp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hgdSUzTV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="it+GziKp"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681KTUGc4098037
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 01:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ejjnz4o5DXG5PxCUge09LoByTrK+FdXEL33
	yjHOgIFA=; b=hgdSUzTVcHhP4DlNZmc7x23iUVor0r8ac9MbSBElB9ce0iZrqEL
	NHtZE6l4w/FiRcUCzkSl5CyC02k1v4K0xCBDg0HirNay7EwBdyv5IrX4nuzs3GJ/
	fRtIBBrdqYBPBVK16IGf5Bf1i8PVSw/gu9AP7a241AJHOHnSgQ5fuSOuDBJRIBRQ
	BrxQemgYCJMW7XBkWoOBQktuDrkLu5Y+t0G3ubEtDzwSE1ldl6jMpHfDOMhwK8w0
	kmoCoiuDRz/Sx/UJtTf2vnXz69wVZMNFyLiyb2Kx31LzSa+CSWn2yk2lhBsSoLJj
	AxOA1MLrAe17HHm3RkkOKn7OM/Pw4g2TwLQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdynt2wf4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 01:39:10 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso680755a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 18:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788313149; x=1788917949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ejjnz4o5DXG5PxCUge09LoByTrK+FdXEL33yjHOgIFA=;
        b=it+GziKpXrOvBkXzw7hvJZUJ4qgKN2yeEZrQdohtiDVxGWMwX39dwfY6lgfZEzJxKm
         LOICcZFMZ3afhu0CLudKj1NZ0oVkOt75M5a7i4XHIApUz/0nrGI0OQk384rKXEc8y1Co
         ryI2mCSQ3GCKXvbJ7PiqeXVbOrxIrAVC2+lss3VhdowZwnJ+2kqcbwcdag3buTKd/i4M
         PZmDMF0fNHRhPRWxILF8qI/mG43ZROq7e678Ir9v/2gp4AvrSEvtXO3sYShedeAByuHq
         Di+3lS9vjyBnBTYR8UDoRPbUhQbI4latwOn3kMRQ//wTLAtK1YPMnn1wSV6yY1F7+vYi
         2KIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788313150; x=1788917950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ejjnz4o5DXG5PxCUge09LoByTrK+FdXEL33yjHOgIFA=;
        b=fWg18F+CAxKzF0wU2PF+zogaPRfTPruivxMS4AZCg+vO3ttR1qrytS/Jv3+mo7eu3n
         ToD+Ymz41QTNI6K16KfPfYygAFTNqwLt0+lLdXIf6eae57bVNvrvWgFCcxF1Aod4JbL7
         V50TUqdhS8qygcol9+tRw5JaggeaE9iWGpvEplkfEbKk/8VajPkMK+ssLympw4QLtfZv
         N09awIaC9fFXIQAnoGVz3FG1Ae2mD4SIY5md5J2l32k3MYfeETSJFKJ0/vKc3w1//5IT
         QZQWi7bT1/rdugeRMXgIAk/48IUH2aw1d5khB/F3D975eSIvJBPaBE9Hs1f1seAyhoEd
         xNcg==
X-Forwarded-Encrypted: i=1; AKwUvBzkFymtLhi5EzWWHUm/MGA1MOC+B5UsPrh+T/qh5QdsJd22o6EZffG4p7TG6QOYq8ng+J/jlbCXl0NUUp1U@vger.kernel.org
X-Gm-Message-State: AFuF++motRwgSdleTzyRswZSkPIWsMGDWL8QUvTiT12bOhAux8Bu0xBP
	LWiaQs8NcTqWMU7sR6apD7LzoHKePH5sypfW/NqQpAgd+jCknHcFzcaK2kC1j9An4zcQT7C7mqP
	AYAq7qfjm4i0rpea64J46r/2gO+DHJh7t1+M6v5gK021HZDE+Rcog1+RhTFqPx53iPlf9
X-Gm-Gg: AYBFou06QFt90yUXp0U2qux0wQdhSLgEs0sVgu4hp96+twGmC9K/QQzlGj9M9o8Flw1
	5UeqoCg1c5r7L9IcX4T1WbjbvAZ/S5cynvbWOTIy8Zd4AzIcenMVDkt2Y25RC6oE9D25AVYtwqQ
	yJArk9A4e14udtLFiapkketjYnEbF6+MMnY0P/8W+1e4Yj4dkG9ze2mnyvMdfSnREjEGLngGDQQ
	dG+Cihhqeg2YVrO+qNkUyHDE3OxByUgeE18i8gF+LLaEi1SjTxcZxYbOGtMwNM/FqmFgOQ7bPO6
	IBBwKt1hp+/OJ7xuttveh3d/eL1a+2hYwGz8bK3Big71HMkDMmRsG8+5x6iOM8eM8mE57qt2o+1
	zpHH1HbIT/9pU8ybBy7Nm5qf73H3Wa2B4lI//i1Nl0T8uPmUjM/AUz3CgxueC
X-Received: by 2002:a17:90b:2705:b0:38e:524:8797 with SMTP id 98e67ed59e1d1-39aee084cd1mr1958099a91.13.1788313149615;
        Tue, 01 Sep 2026 18:39:09 -0700 (PDT)
X-Received: by 2002:a17:90b:2705:b0:38e:524:8797 with SMTP id 98e67ed59e1d1-39aee084cd1mr1958006a91.13.1788313149121;
        Tue, 01 Sep 2026 18:39:09 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1430e8c6fcbsm3140404c88.0.2026.09.01.18.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 18:39:08 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: arm-smmu: Document Adreno SMMU for Nord SoC
Date: Wed,  2 Sep 2026 09:38:58 +0800
Message-ID: <20260902013858.130887-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDAxMSBTYWx0ZWRfXw+v9mSasJ3gp
 0vIDQXsld5o/3t5Q5D74jkHW8HZieVidx5yZa3AIFRauT2vaqppioLlnbN6kCCG8GSimc5mLr85
 W9Y7TNRA2vC60ArrvqdKlskfrk9WwfznbbOeK8ietLCUTzVzZ+27rjCDXsXZIraXiBsXUe4eNQz
 aYkVxJ1s0axTE/Qu29HJwQQm+oUnKrja4jMgQ75G3txkbx0z914061lJX5xtMHzUbCLEk6tCJRn
 f9XXExGr+Enu3uVfBI0mKWQtkhhCQKZvcmdfcY9+luB2oT482xKgHseNXuXtxEh04vcvUTte9B9
 GNT+sT6kKKnZywrQbnL7VH2GgBeYIcx/wVQENz/GDCXM6k7Ta9tCCYAVB8HqiKuyy2+NL3hlf+I
 R76JlbXCQsGpNAFiDU9jSuWmQ6hHjbsoTMJH2QEuQEJw3t28Hn9yjkD6VFXoJUNGsCNgKgpPEk8
 L09ENOww1MLhqCh9bCg==
X-Proofpoint-ORIG-GUID: bKV6oZGVOkiCQ0Y-pBYN682Ihx0YIgPQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDAxMSBTYWx0ZWRfXz/Kwkj/uHbqh
 XUf4Wn0xXRXC2PC/kj+rI1WaeaMC00lnrnc8l937viLopg1vqhXAdvJsCO25NivHpa183X59NsU
 2M0Rk5xjgdrzt8kB+rB6XWGjH1U138g=
X-Authority-Analysis: v=2.4 cv=LfkMLDfi c=1 sm=1 tr=0 ts=6a977e3e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=iEDX-NX4Me02MYkbRrQA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: bKV6oZGVOkiCQ0Y-pBYN682Ihx0YIgPQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020011

Add specific compatible string to document the GPU SMMU present on
Nord SoC, and constrain it to the single HLOS vote clock.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes for v2:
- Add the missing HLOS vote clock constraint
- Link to v1: https://lore.kernel.org/all/20260901140816.74200-1-shengchao.guo@oss.qualcomm.com/

 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index ffa33b7f4a96..214a9c051588 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -102,6 +102,7 @@ properties:
               - qcom,hawi-smmu-500
               - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500
+              - qcom,nord-smmu-500
               - qcom,qcm2290-smmu-500
               - qcom,qcs615-smmu-500
               - qcom,qcs8300-smmu-500
@@ -579,6 +580,7 @@ allOf:
                 - qcom,glymur-smmu-500
                 - qcom,hawi-smmu-500
                 - qcom,kaanapali-smmu-500
+                - qcom,nord-smmu-500
                 - qcom,sm8750-smmu-500
             - const: qcom,adreno-smmu
             - const: qcom,smmu-500
-- 
2.43.0

