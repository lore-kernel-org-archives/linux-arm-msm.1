Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA32746D577
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 10:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788258796; cv=none; b=ZMeiaNbED2q9MIBYpALQSGtOxfNctbJ7SHKiRCPzi/xZyL4kGShhUERDDTzFF/ZRBKT/lVpzTwkxFD9un26mAHdS2PB5Uc9vAN/tWUA9yXVvc54acoF4R1cjNZTFxbULRT2LrZYV3zXZ+KyL7xiNy5Z44mHnvEX4AHNdXthAlTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788258796; c=relaxed/simple;
	bh=V37AGxiIlCADNfSVQa1EtPvInImMvR59PBciUJmFxDc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dAUkWySXZ4dxRH24ORzQBWVMPKWlZRKd33DoYAs8bRlfMWbtmIRKqWwBahsnK0sWt+XrVbF+6oJV3RBCQU/AsDoiNoioR3HubtpGs0YpPEWyvW3QU+xnVGI//SRjoJA8QuInQ4FNMK/DiRwynBduoAkPkSBA9WCsS7hBRFyCKu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wlch6Jr+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SE8UK3Q+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wlch6Jr+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SE8UK3Q+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJJW51136749
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 10:33:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Rps05BzNsJlsNoYV02zDupxVjpxJ2krr4ce
	Ti6viGmU=; b=Wlch6Jr+g5IKNJhz1JpH9241NrwjccJI7ZSZwBOYU54DTPxPhl6
	q51cxiBW3fPRgksjDMB5PPg+6HmUEKMlKOkgHW9uNI1tfILLqaWFOSUIXGZ2pr94
	3Fypro+OBt9oBxo2CjthJxNv6NByGaJpdEkvlBKOpleibCWef8nec1s8SVhH35pS
	2b7LP4rU7b3IKcA3W7EzNcoMj6xR1QstLaFSfAdYZORGezPwnh1Ql6m2Yowj+yPb
	o36rIlKPrq0+wCjQnW8FPA5pw3uY0HLJATFwmaQ4XLBGdiac0SQmBv5IsuKYpO3P
	j3YxnBsS5z1XwDyRdPb8yJor0eOY9uE2zZA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcshb7f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 10:33:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6f80c76e6so74686975ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 03:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788258793; x=1788863593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rps05BzNsJlsNoYV02zDupxVjpxJ2krr4ceTi6viGmU=;
        b=SE8UK3Q+DzaTFuO0xincUApt6ICLxuhT9QeiBbJf7uOcjVGYFoXrMch6MZJPJtQjJQ
         5oPV3nTGkHTz8IpwKnNvAt6pt/Jzvhh3jVW001jX5ngPcZHSNz+9LJi/jqs+jzLTk/y5
         diCXSRuCHFwPRebT4lEcBNILueMaIpWYHZ1DNRYkwxTyzy/Xg2mpPw8CzEShTWF0YoHk
         bw8aMHeLTzVAdOqrDgdGh8qss5JPFuSeDNKYUWn2mGIiuEOYt/5xJFqCb4eDEPYqQfIv
         73FrHg+7YZCBWjoReSPkORvm52HTLQVHAvVEtv2iGik6Rj13wFMCV710/ACEAXWeBQCs
         yNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788258793; x=1788863593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rps05BzNsJlsNoYV02zDupxVjpxJ2krr4ceTi6viGmU=;
        b=k8It6cDhYlXU4m6s385AgwAsMSIVuzITj9Jg2MrKPRCCJlkO7rt/HdshRCxV5mCWnA
         6yum28mNx1Xp9UhBv0ePBmKQalG/xjMWRiZmsGU6OVf98uiGW2boY79Z4Gjamt/TfA+Q
         iQIGxeYZf31BCo8M0AxN8Kw7BzGN9YLx7bq5WbApcOLkTLBYkQ7qZ461JBjWnjNcQqKt
         tHzA07iGegiXPHGElPI+BaubXwBKYjgJHqPOqei9OIeATA1oCh3MD57DW9jFx1Xsr6IO
         iBtP805ZwCukfDAfcgCSAvM4UalNJ0a5WU2dpmHuJV56SO0udNB04tHCYKUgGjP/ePRH
         OI4g==
X-Forwarded-Encrypted: i=1; AKwUvBwYKitt+0205aJJz4YFN9Y4Y0bbnw6ADK4PoR0mYd8FUxkHWa/ihitsKdbR/C1gi2qB5a6Otl0ZyOJlb91E@vger.kernel.org
X-Gm-Message-State: AFuF++m272qJpNU5E87vELEgstMvxb8Mp+Th9Nu52f8VXehtkFSGAyKi
	L0Em9rfG9+p6PQ+OZH8R36YUd9X1Pi5R36a/3OkODdP8oXMLr1mOiHksgLq9hnNq+aONX0O2VCn
	UZlAUc6SzFWdFjZpkx1m3WXMBOYsFFczgXRxUwjsGihJCKBOyEfrlOsCQiGSVOx5Ro2xl
X-Gm-Gg: AYBFou3b+nDusnuf4LJ+LPlE54pHryaGlky9IJ4o5G9qjrvzs8PKo4Xxm5myD6On7Y1
	PpF3PqjVQbV8PYZSEs7l4AF8mfzS5V1SzbXRm2afXP4MDj5mgSpVodzU2azepWCb+GoY9KyuzZf
	TNTVBh3cT410oH2ofHl5LRjIscXR2PYp9iaPj7BqzzDN8FwsHAeUtgwYl3E7wozPDkmdBdYhmsR
	ElX+BroPvZSmWWU9DSiwyav+Ri7y96XOju2Q9g1Uv6+xRY1ZVyU7o6P7865Kwj8AbvOXxk28DWk
	r6s9pxwRE4A/+EzMIHRq21kG410Psi28zOud9xFaFne97SbtxKaGfj7XkHwtNGi8ykmz2MEnIOa
	ZLCOzs+LRxKfB4DTG55yl1P9f5VN8uZzkd92p7aoI222xd4amtrWqsIQBMxr1
X-Received: by 2002:a17:90b:52cc:b0:395:4de4:92be with SMTP id 98e67ed59e1d1-39907e0f90dmr9999018a91.13.1788258793142;
        Tue, 01 Sep 2026 03:33:13 -0700 (PDT)
X-Received: by 2002:a17:90b:52cc:b0:395:4de4:92be with SMTP id 98e67ed59e1d1-39907e0f90dmr9998946a91.13.1788258792676;
        Tue, 01 Sep 2026 03:33:12 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9ecaa9sm38719882eec.26.2026.09.01.03.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 03:33:12 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: usb: qcom,snps-dwc3: Document the Nord DWC3 controller
Date: Tue,  1 Sep 2026 18:33:00 +0800
Message-ID: <20260901103300.60803-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5MyBTYWx0ZWRfX7mRrSHh2GW3J
 77ZymwBZg81adRd26L4167tdLgOZCNVIW7u2nd4r3GqkUQ7ioaU6dGNkpNDobTL1WTdtgbFJPNB
 3nsjTviAAsoGy7b7qgpA6L4fGp4JKB4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5MyBTYWx0ZWRfX1Sjl6RuncjTe
 4sl+6iyIeKaqbkKj8Ee9W9yb7IF7cy1K2S1K5yqtxmNxSyIF9HX8TXf4/3nKivgfZcmrRikkZmi
 bFtQKQpnG+T3p6J+M9SVzp4jK5dAk1gc4BIq6JZ0z+bqD0IahgjuTPIwdPHhP/h7XET6WVT6mvL
 yO/We9z4lAUgtkTSMQgJTAamJPX7g2gbbB9Fl4vWH9EjuRoaKoNLS+v80ig6aDqxPiJPHldvDe2
 e8M7urYF88VDou11vtStxznVEzmdwgLWMkrfCU7jKjvXEzzrY0DnB/zDOtzPwN9Yfc+Be0VTD7u
 O54/7h+XR4Fl2ahUq4BRj6bewCM7IZao0pEIGqoMaXC+q61v3maDpJQVe3p+MbD5Q81QCyw/d6J
 Id89pIdxRtyUT02CuwUkhNkku5AzraWPK1r9QR3mxXtdPIt3jCLH3WsiMhmGqihU7MuLOlVaVwG
 vbz3WEqcfWkq1NQ32mg==
X-Proofpoint-GUID: ReyFwvaoFlNhcdSKwnRBP8aBizy8lgxO
X-Proofpoint-ORIG-GUID: ReyFwvaoFlNhcdSKwnRBP8aBizy8lgxO
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a96a9e9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=tFf_m68rkw3bL0m7f1YA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010093

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Add a compatible for the DWC3 USB controller found on the Qualcomm Nord
SoC.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index ea60f7220afe..1830b979bf3e 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -43,6 +43,7 @@ properties:
           - qcom,msm8994-dwc3
           - qcom,msm8996-dwc3
           - qcom,msm8998-dwc3
+          - qcom,nord-dwc3
           - qcom,qcm2290-dwc3
           - qcom,qcs404-dwc3
           - qcom,qcs615-dwc3
@@ -359,6 +360,7 @@ allOf:
             enum:
               - qcom,eliza-dwc3
               - qcom,milos-dwc3
+              - qcom,nord-dwc3
               - qcom,qcm2290-dwc3
               - qcom,qcs615-dwc3
               - qcom,sar2130p-dwc3
@@ -526,6 +528,7 @@ allOf:
             enum:
               - qcom,glymur-dwc3
               - qcom,milos-dwc3
+              - qcom,nord-dwc3
               - qcom,x1e80100-dwc3
     then:
       properties:
-- 
2.43.0

