Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA3B22D4DC
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791787527; cv=none; b=OjDCe0VGdHUX5sO5tbxxWcutGRgtxgFbsipfNGQvBk6hQQQD0dtizxsWGGVNYZRPdRSIPQHr6WqczeVnQDE27wf+6OriMWjbhQO8LP2iDeYMHoYs6KZT9cNy0be7QwHcFSqMIfd9P33eFhzW1+rJ75Ac9uV699jUuP1ZgodSpzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791787527; c=relaxed/simple;
	bh=zsqdQtklwpvdbiVBw+YVSyi6bmJpPl6N7PlUwRG4pvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fakMoWQ3u5gVFgqTKLCXRAz+h8/WkHcfQ9+TLLb09Q2u+g+RATqgimbU+3XGNJexd+P0h3xbI5kNzofsoeVA2QRwaZWC2vS0yn9nCWyL5HAckCpp4xmGdqdsQ6cHZ8SDhpMSt0vo1rVKEi9TnlrOvcO32vUwvA4nYCfXaFDORvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hr4iZeQG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=An+EnxeP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hr4iZeQG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="An+EnxeP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55grN750871
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:45:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=; b=hr4iZeQGkQrP6Hi6
	Q0kCOTSwXZX01Er/bk7i2l6XSYJsOT6kLPwR0AX9sfqxaGfeSlsGcUjr9MtVd2IU
	PlSasEuSvH9gAX8yX1Rcu3Zrn1jNccUNwpk/vD4aJUibT/VZ3EUr9HHqu4K8dHsI
	/uGWWWD74nIR/+OMlrXrHqqtca/ST8UJvgJeAI3HQ4HHf0RqmOM//piGh+hcAEDF
	D4kkU+0SfeaSl6vehvR04huCiioavjQimTQ802U3ZaBbDBwrlacqfRb6PJtzCfUd
	TAoJ7Uvs82Wv9KcxadokKFeiqk9woK+FWGxSuhJ4XS9AUyA9VINYzQn7X9GIVaN1
	nDWMvw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7e4ed2j2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:45:25 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-892ccb01fbfso1367821b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 23:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791787525; x=1792392325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
        b=An+EnxePdqhSgjB9M+PRPOoT0BSn6mvA+qr1feWsYTZWpjQ35R5spiCnKzpw6nQl+r
         rBCd2DZy7m/fiuqQ2QFJx04jLB8dm8eMHHXLxMXpqGw03pF32oWVwpmi/iIxDvOoJXVy
         H3hr81f2lfN/GDGyIN0jKDFnYaIuiwzg+37W4vfGQGr+AUTbdXwgKUaoPMeVrJcffbGm
         UAUVv2QgIxE8j0dfXADJPhQ+hSkmpDr+bRpYOqNXOlOrjSAR2abAqHZQqUxd8bxWEk1s
         44WW7c6CkKcJ4lxgXfmoTM+UBLLN/9FVMhJzd0aR9JehRRdrKDU+56RBoJXPiTEmdl7j
         IAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791787525; x=1792392325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
        b=GJpu+ja03T6TI70TfTAtYnynJG0Ph09JKwuWfXdV3N0tvBkB1lZqKEyv+0ZFJStl0J
         0CPK17GMF4gOTf2EedTPC7+jNQuMYde3BepcY6FXHehqSemnljsxbCT0n/w2n25DM0zB
         qreX0bnc46AijdoQsAsR7TyaZMTK86ShFLAJkZdE7V4IKp2tO4Uc3CvDVeTv4VyfS53A
         yDKgpq0JlwJ26qy0NM8A9cR4tZPIM8MX18j108hDQlvYwdS37BtbNtzIqfpK954R23jD
         GdEYNg5pPuvUgytMOu715I01qyFF6fwkCRP/z8i+AYeKdXFeExqNgWgq91237MpSGcTF
         UCOQ==
X-Forwarded-Encrypted: i=1; AKwUvByn4EU5QuRM19boz6ShBZl9O61C8p5M70v1GrDc7B1dDfJCElTgn2J59SsBgwhIky8QytyvSj0rDFA+mlcV@vger.kernel.org
X-Gm-Message-State: AFq9FYKG+rRgupRKIoslLlYcR9chK6yssKu6ctcZLizVWKWxMfuhSSuE
	yDI3WN+rLMD5DXKLLfXgc+RbxOYs/1lDo22uK5K47RsBijvLxqggwKznFDh/N6eHfQBuHDWY8Ob
	u08ChVZvaTHoRtKkSj7K8z0E04gqdYw8Q02t+12j3sMJ0e+NMb0K077T08fRtUdrpfbwP
X-Gm-Gg: AYBFou0WfF1oyaojO8ri7fq2D1a7WDLqVHqi717u4J+h4ivt9uWNihtKji4bO7sp3sO
	Hai01x8cNAnzftKgaH87wiTXyO0/R6XprBlpGW05ZJFViaJLCtp3LgXCaHkL4BPmh6/QnzVBDKM
	dzkIHWpr+RfePkslJNkNZ/YUMApnO5AJg7cDJ389R+QT05O6YSj9li26v3TzNoGcQHmrQV4YctR
	xPwTtzU3Xz7er7/bK+vn538FZ2UQDs6M0ejZVCDwXerfQ1WlufEJ7X3I9Koy3FhUjoodYbGZuXz
	u0t9ejDAGSbTXwT39cF0H1GNStO/aoTI58VZjLswr29cXcOtOv3LoKxhWd7pa4pqza65ezTyLyI
	rwHH5hYfYNtB6x27/iUj8pzq26SqulcqOi+LI2heN4MX8H+9J0uoMKXfmjGayZCyD/XxTw4lAOI
	5euFJCZnuZlw==
X-Received: by 2002:a05:6a00:148b:b0:886:5f48:3fca with SMTP id d2e1a72fcca58-897c76e308bmr7234588b3a.37.1791787524700;
        Sun, 11 Oct 2026 23:45:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:148b:b0:886:5f48:3fca with SMTP id d2e1a72fcca58-897c76e308bmr7234545b3a.37.1791787523925;
        Sun, 11 Oct 2026 23:45:23 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3dc6c93sm3534420b3a.33.2026.10.11.23.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:45:23 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sun, 11 Oct 2026 23:45:03 -0700
Subject: [PATCH v21 01/14] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-kaanapali-camss-v21-1-04fd28d815c6@oss.qualcomm.com>
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
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX237LnpUTKzqk
 Bk16X4v5pcdmiJt1NCuIk6Dxi6qLJfGoOH2cclqkJbCkFid0QuANzsUhqi7UYWhSVxwG6uB3c0/
 I5/h5AjBXzKNTBOjlt3WcQTM6a9PoNdtkPTL2/mNcxG+UKB94cUv0A5w6gV6uiqaW1EORPu0f1A
 dIRbbQdZgefqUs/TZfmliZ/otgnB7GDHrtZiRHxvpUK0ZCi033W3pE2jiJFfgsMlWvcJ7uEEepX
 m8huqZ4+1o/uvMN8SpdYtzWj0ZMpzxj0wrBM662fOcPwetyrS5j3tWCvrFLm4DX2BTKMAeZyN8e
 xOowtuvvURryPHp/28Jt5MvBO0y6qzbnkb3XxLiVSOSB+KW66MEXPupg9GnoLDNWq9JBEbNmy7F
 RBrJlXY15Js+1KfqED8MxlURUMNqmcBLSKahYXTLmkhsy+jrAW0iceCpHkIV/uWMsd+Y78pYE2k
 l5UzoO+gDoKtxwviN2Q==
X-Proofpoint-ORIG-GUID: PBVO6W9xzn7hrIU2RQdZweT2UOqo0Iih
X-Proofpoint-GUID: PBVO6W9xzn7hrIU2RQdZweT2UOqo0Iih
X-Authority-Analysis: v=2.4 cv=W5utxhWk c=1 sm=1 tr=0 ts=6acc8205 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=mZPZtqNPFm0sPOGUM0AA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX9/waByfaYbkh
 JmsiyUAzWiWga7OWDA028nNPOzbWTZZZ3Dwi9iFkKJ0owss1iILUOGNwNsvxya/zQ3ggm5Hnhjg
 Bgyum8Y6tbSwJok+KREUFZ2YUGwvmSY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120026

The Kaanapali CSI2 PHY is compatible with the existing x1e80100 CSI2
C-PHY/DPHY binding. Add the "qcom,kaanapali-csi2-phy" compatible.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 1f1e2a4993b2..6e9eb8e265df 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -17,7 +17,9 @@ description:
 properties:
   compatible:
     oneOf:
-      - const: qcom,x1e80100-csi2-phy
+      - enum:
+          - qcom,kaanapali-csi2-phy
+          - qcom,x1e80100-csi2-phy
       - items:
           - const: qcom,glymur-csi2-phy
           - const: qcom,x1e80100-csi2-phy

-- 
2.34.1

