Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF92381AE5
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 01:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791424265; cv=none; b=AHDY4sqLh3nSAaJocnqt8Fr2qmf17XJsrhxzQfmwc4UOrPHiID406Y3moYvLlrLEbyqLW8XfxCzUD6sfqR9oVyFVoqhEkJKMYnaNe3z7u+moVJVM89E4SAKJYKBK5DXyJ/w4q0/ZyJbYgqA0E1i0kB7RpJhEX6Om0RFQDVS4pJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791424265; c=relaxed/simple;
	bh=4xcxFzPvIMc62FhXBW3ZbIQJAwOORkRwLRbjLw+7oJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p9ARS2LAKLLNA1HT42SN6Gaav9kno9gpyJmNmP+YHKeKtGO1rDFHxqg2Z2nV2F0bqtOISwag/4+YRXl8YLXSxG2gbnUEcK5EVycXtZ9WIFtYLrmF0PNVgQ6YTJQWvPvR5XxZGpb0exhoNQ9O+VdOIUyZR6UZq9E9xxNNETE6vZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i/adctdT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QISRObz2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i/adctdT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QISRObz2"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6981hLVB1334260
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 01:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LV2BIYsUVUL
	vybE9644thYeT30NIhyAOdd6md90QgEY=; b=i/adctdT60q9QRC/Lt75j45F6HZ
	UayrqAk10lf/8UzhpDFPX5+6esYW+AufyrN1/Tm8gDAns9tH12ALykTBcOWGyuig
	ldbSgb07gMxG6X6Im6lup9IAiVBirU97AdG7srg+5clq5zxZxBZnkqH9xOBIdJt1
	JM8P/ckKeM9xyi1C8OfpYCsiIzSk1OuvCcE4AxnbE3nvok0bIygec3B+KYwwThi+
	309Weolv4xosgO/m7Iz62N/O+tTIGq6ITlHpAX1GOZf4R1X66NGLZ2B10OXZfGH4
	BEbqrfZsTRNAdbtepTF5YYGolHma0WtdWue6oOi1uGPB9P4jI1T0maycpVw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3gncm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 01:51:03 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3510a481ae9so9104479eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 18:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791424262; x=1792029062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LV2BIYsUVULvybE9644thYeT30NIhyAOdd6md90QgEY=;
        b=QISRObz24/Sp+BuxRUgPqb8V18ptyOInUKjKrZrrhNhhErIxk4IQeeAOEv8MCjHuXu
         Bl0FSd3NlPwhyKbX+6AwYGe0WCWz+5NeFCJhPJmJydgQmvivPQJeQklkU5VqokRJzmJf
         y+GD8DOjnX0716lMmEXb3i8neORS9Uh3owFBGKSXg/pWo2qfcqZbhh8On+3cVRcHw3zY
         chRFqqK4rmzUKl5aRJj/OOpAtm1qh93LiN+Xn9R4aYlb2M2QsevGuTXzj4dCX5oiXbTP
         Hptfylco6qo5ZsxKR10ebpJd3yJxrdParR8v9XjMnZCj6pWGpn5yCXq8zCRqp4xYC9hc
         eGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791424262; x=1792029062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LV2BIYsUVULvybE9644thYeT30NIhyAOdd6md90QgEY=;
        b=Xf84h6nG/EHWbLSg24pjhUbYNdZMFDminggGfytU33onkmhdOrJ1tUjcoCi2vTHNoX
         qWXNtb/OdkBhTQi/uQcMf/FNPW8vyguzNaPRfTSFaqTxDgZ1gY4Q8fN4FiXfCgx47SQE
         2+9zvFdpCeVJ320SPg5TwdzvOvXk5vVI735NyX/aqNZbzBe35+qDdfRDbKuusvsY9bxl
         lVAAIozCiBFncc5IRdw/Ap6wKntAtI0xd66ejWivDj0d7IN0S5YrnJwUHyZIOnzds1aW
         wru0T2KqGX/ghAciDq87QfxTlf1t2SjNbfd1kPRVzdTCBQIusk/9s9FyTawTi2EE1nt9
         mBqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYwpAtPPj2qg4lCBEZDhYp2YZmdHGrQAvFb/HMI/vF3Vl2sj2Q0GeoWvsH1G1ifT/6U5/sYsncU5wv/Eyx@vger.kernel.org
X-Gm-Message-State: AFuF++mSC8GyV/pp7ZXsmL06nFsO0/ebhwV78XH8R2a7rNeIsaos8CY4
	UXsXCRBhZB/IxvRm7KvaqgaPRYZryYeEns4FtcoEZFVpUazjnzGy3y3WDL1Um/A7BA6GcAjndAK
	YoUf10W8iC9RIFyfC3/C1kOCdja5PHLoIpZwAdo1qqusAuknpRPr5FWWqjjUvvrSyL8cw
X-Gm-Gg: AYBFou3yo3sn2cIFw5kb7Yyoot2Pv47G6tBNYjDoIAD2EaRGuxap3hDdblOVWyws0Z7
	53R5GMhD7+VE+GnbYAi5QbxN4lPBk71AilFukLoO158SDegIOcIrZrlJppB24mcQj+OT7i6YC9v
	G2Fkc2VJRhucFhBeZBupiMlQEKz54W5ppJUYMl+TqZN/yhalLzOMOoA/xHr9T13kwPfw/H1eawm
	oocXJZMXegznAWdTaNe00qC3bb4LIjhAHJAU0v2GzVRldTpjzPhyGPhls0ZDwDpZpQgEvwMhwsY
	fz1WWHwFF71yMboz2PVpdyZBs5r1cXg6J/ReZWhUultqzDW6DNi320YUlb5X5PNrIMULCrC4bFN
	5SkqdYaUKI/+xxtv/xryK6NOsoHKbz78sNcKbp5duqhMkEica0VbtrTUGilA=
X-Received: by 2002:a05:7301:105:b0:351:27bb:271f with SMTP id 5a478bee46e88-3515dd4c451mr4118597eec.11.1791424262121;
        Wed, 07 Oct 2026 18:51:02 -0700 (PDT)
X-Received: by 2002:a05:7301:105:b0:351:27bb:271f with SMTP id 5a478bee46e88-3515dd4c451mr4118573eec.11.1791424261528;
        Wed, 07 Oct 2026 18:51:01 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515abb7117sm11761823eec.3.2026.10.07.18.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 18:51:01 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/3] dt-bindings: phy: qcom,snps-eusb2-phy: Add Nord bus clock
Date: Thu,  8 Oct 2026 09:50:16 +0800
Message-ID: <20261008015017.3359804-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008015017.3359804-1-shengchao.guo@oss.qualcomm.com>
References: <20261008015017.3359804-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NchzRGD4 c=1 sm=1 tr=0 ts=6ac6f707 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=-2z6ypdNruSm38GMId0A:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAwNyBTYWx0ZWRfXyCIg+/7PxQLk
 XS3AYy3bukHPCnwM0bWG/XyL594Y8eZp3CsPV9zBDT4iaxzW0VkVWZgiT7htAHPux3BpqP5u45B
 VHsq/xwNEtAH4j7naOgf4QtkEDyDx0o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAwNyBTYWx0ZWRfX9Tb41Akx0h+J
 Qt4rRK+q7j7XcUOLVZO1eZ3hm5psewIxI8prZVSpscnyqXsC5OLHeLkBiLwExZViErrVc2Arz1f
 PcB27PTusp6O3nSrxZfkXOX09l70xnF8ob76r+ujIHJfG4U4bHEvsdT6XVbxvQFWWXCtfXyUYNd
 B1u3+mQkqwJ6QEg7rt/E7X+IDrwKv62dUYXi/gi416QdDbneBcnEs4I33kMXxw4SMqJMOkmk30N
 7vQBdAvbcc4YlQOUFv8vLK/WfRLwaAZIT4PJzha57BSGJRFjO9STQyNMIKpDatKyLXPgIHAQl8n
 uprouyEHrsUhNgqthE1Yh4lm1NFncCJAeqiNYOv5PQpU4d/WcCFrzbmq+rzuehuJ3Z9TxCqmwt5
 Smcd5wPmEnLTi6jm8OYjUANrQBfbZM7XeXWKVwGWK6Vglh2bgkJJrM+tBfgvrmMD02vpRxiN7K5
 nuahvyhzk8uvH9RNy5g==
X-Proofpoint-ORIG-GUID: qrev9h6Fb6QmSP9rsiNJ-1Lh2ADyyMuY
X-Proofpoint-GUID: qrev9h6Fb6QmSP9rsiNJ-1Lh2ADyyMuY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_01,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080007

On Nord, the eUSB2 PHY registers are reached through the AHB2PHY_0
bridge, which is gated by NE_GCC_AHB2PHY_CLK. Allow an optional
second "bus" clock for the AHB2PHY bridge, require it for
qcom,nord-snps-eusb2-phy, and keep other compatibles at the single
"ref" clock.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../bindings/phy/qcom,snps-eusb2-phy.yaml     | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
index 931cd0e7d297..67f2a587e65c 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
@@ -34,12 +34,16 @@ properties:
     const: 0
 
   clocks:
+    minItems: 1
     items:
       - description: ref
+      - description: AHB2PHY bridge clock for register access
 
   clock-names:
+    minItems: 1
     items:
       - const: ref
+      - const: bus
 
   resets:
     maxItems: 1
@@ -77,6 +81,24 @@ allOf:
       required:
         - resets
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,nord-snps-eusb2-phy
+    then:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+    else:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:
-- 
2.43.0

