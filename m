Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522585;
	b=Ww+1T9pN7gEtY/+pc9q7j37bilXZHWeGrZV1uPLXBiFSbWAKeUB5ubdmX4g7hHSUsQfP
	 A9gESZe4VvamvyR/qwpnCUn6Lue7xgqfq9oNc7YaD9n/bgw2Kw1zMI7+Hbk88TM67/Zhr
	 vwYHB0Sg4bq2KUKywGb2XuLguMcQfNOpCsI40Y8ln9NIAkplToX5f6wpXwUKqpeVRgeIG
	 RJ7gfsEU6kCDU+IAyqqaTDXwkKXc9oVi9oszs17qoIjenTt3b4qnRn2DsQZnFDAdL8AIJ
	 H+wWrrBN7bWxYfo1yuY//uiou//DrtBagSLHc34b5JH5Fx14QzVOiBHKGxr82962z2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522585;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6MRwCGY3EIkm2Sb+ci3Y/6bF7HgSt7oRZHgHfupwS00=;
	b=2dLV63Ua5166wn3YCfO8Tor3v9qXuEIuK1ACXvb/AlDULzZs0dxblnUjuAye5JKnGAms
	 vEDGUH4Z/MFdb+Y3CydefAv49XixqYdHoOad26veEFoWHQMHxOnssMbu91My1fIXYnDNb
	 xsvFn4KPAyT15RGzDP3RokCDS+2yKFUCacsRhwivFT8jQ+zRofB6fst5FfCJEPD9Ia2zu
	 6OdHDUOpgIh7PrsXQhAR9JfQ7m3qAXm2UQzxPUGsBcrBok9EsykhUCpxU5aCw7wISH8Ah
	 0d5TKnD7yYBXeh0TK0Lv7DhvgGXURGeEGcO5sgjNCUy7XVANPU0LgJKlvE2FtLwU86w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lPhv7E3Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ijeEuiq7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AFF606A322
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 12:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1AFF606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lPhv7E3Y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ijeEuiq7
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuKRO3541806
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 12:16:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6MRwCGY3EIkm2Sb+ci3Y/6bF7HgSt7oRZHgHfupwS00=; b=lPhv7E3YmnPEk8qa
	4smohmy9wBKRAbB/cU7qwdF+X8P3rc1IpypwQb5GcjmXC8fKu1pfAgTKTP83T59H
	exAfVmLqi9cQuHeO97KcUoO8FDpAhWcc8aLj5BQMeA61DPwbDWdyeL9kDtSTDV7C
	yjBwrY774PC559i8tUM2JiSrBWpMTp7+xat+tO06EGVatTfpZwkTHsxdiPkXqqI9
	1ZrZQIP7K7coRt/N7PwIYg9tuthEOB+RcpMQYDCQRL5+Jvtx2G+RmAvENioEOkEL
	QasJoTCmpJfLJCIU7cOUAwh6ofd+kai46p6U36zMnmKlNEAqVuYQaGSDWJ2cCVe2
	qgrdUg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rh9j6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 12:16:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b32efd7ec4so4678916b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 04:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795522583; x=1796127383; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6MRwCGY3EIkm2Sb+ci3Y/6bF7HgSt7oRZHgHfupwS00=;
        b=ijeEuiq7jbW3AojaiCBI7WVrxVWCC7Xyz+2V61JvkvolM3at5yfTgQMCW8bPfmsnLt
         ZEhhbLDlzpW44Xihe5whkqT9nnCDWH4wzaKEAf562ropQtdKBba5DVWoBBA8YycAciBk
         S6gI5Hm/ENHXVl7jT4Y9HSVF8OtQ7wWPPQme+cBZ8y+u2XhdQYmSJ1+J6d6VT8eRpgyh
         dcoFVSCiw5nwCnabxVFhdaY2vFlDA/KYeGAMYUVpJteqCKzRSX78r+lj1xu8zhWDyx2J
         KYVVxtiMygwwW6SjxGWpwR0hJ8iX8CdPHNBYFOxi6sJIdL3lSXOuCK0eZ3sxxoVAP7Np
         oh2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795522583; x=1796127383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6MRwCGY3EIkm2Sb+ci3Y/6bF7HgSt7oRZHgHfupwS00=;
        b=DQ2PAJ6JzyCR2Uqqk+/J3s8P6Vj5gbZDEpgTlar+FIuzNq0tl2nK7qUqMtJQA74eY9
         8xMzwCAKd+KdyyfwJIVxgHWL6+bfBVwsaNiCJ8n17fBiRK/kwtlLoKaTibzFBjUGUc8H
         ZPjbDBO2FLnOKhr2OzCCuq2Qlf0VYIanN4CtWdMOBYMy/XeJNztfCnmuI18Xe8dZeMET
         74ZFcKBswiEnpZG4OFISB3459ss2rwmCa6fU7gsfClZmkqB62/fTyVxJ8OSY203DGrw+
         8i4wR6tFemKKEQVXxoHaRvmz+edV//6SzSj6p/RXY+qYOw036AtNPAencqqDgKEFOh/e
         jYsQ==
X-Gm-Message-State: APuU4Z+aJUhp6GiQfhu2DTC2lg320p+zPbJAaj1rKEXTJVc66njG/rpz
	629XXqIQxtxmYCWqyDssG+Fr9JIWA49qwWg96iblv+a9HCiUHoN5Dfho+E/1rkI623qO5zgns+Z
	xxAZXZ1gBlpA8XVrB8oGjJCQCY/9IQgFXB6ek2DCr4vBF0JRck+L/LoX4cKBk2pYUFSlt/1ozub
	sO
X-Gm-Gg: AZFdTZdG7ubDqghI8NsdVEUM6Ye0r96pF45zqibnI55vkMXcJDwtUKUsC/2GKCy7R/I
	10Wm8k8ma+SJCgiGc/oTU/YqnxHnuv6QnJ8UtVZSznY6GOFWlEeqongR3cukir+VEn1KHHa450/
	gEMwGDaFTpRliS9QfG3aRejoJLiuXglQOsAnaNCgI4GWtNp+tJfS/zFB23e8M3S2ktlqv/JLOYR
	GEBTvOgHiU3lSEiYGnNJpA4wXvgthFUt7Ixyv89UAEv0/d/w3lLKqzkbxH0lF+IgCx9kysywEAg
	xcfcRPoflKpUSiVadQ/XFnVKQ6wzT9wFwecIsBXsBxzFB58WyG27NyZlLPaOLfSp4BiXuWwInCf
	V6Okm6AQXvNmnAs47a7iONNeF/JnJ1OryQ8ak3DPSpMGzhTzvykljcgUblE96WsRd1EmtCvgwLo
	Hc4M/5Tmi5
X-Received: by 2002:a05:6300:8095:b0:3f9:a6b6:e173 with SMTP id adf61e73a8af0-4014d14a577mr12497077637.26.1795522583412;
        Tue, 24 Nov 2026 04:16:23 -0800 (PST)
X-Received: by 2002:a05:6300:8095:b0:3f9:a6b6:e173 with SMTP id adf61e73a8af0-4014d14a577mr12497059637.26.1795522582966;
        Tue, 24 Nov 2026 04:16:22 -0800 (PST)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8706844a0sm7245572b3a.1.2026.11.24.04.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:16:22 -0800 (PST)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 17:45:24 +0530
Subject: [PATCH v2 3/6] dt-bindings: spi: qcom,spi-geni-qcom: Document QSPI
 support
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
Message-Id: <20261124-qspi_qup_upstream-v2-3-cd69894107c8@oss.qualcomm.com>
References: <20261124-qspi_qup_upstream-v2-0-cd69894107c8@oss.qualcomm.com>
In-Reply-To: <20261124-qspi_qup_upstream-v2-0-cd69894107c8@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795522563; l=1598;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=wquPpfro8iDyDqLV7D69xsSCzyvDGmM++tbpNclpPwQ=;
 b=N3l5nqiq+539iw0mq033y0lWszIasIovNOKFVkYaPOZOh6w9Q3p13NNJ3jevhXXmkWjRhaMgq
 J0gD/S2lXt4Ct372gS3D8np8RqR+QN+4Ajgjx2cNhkp2CubyWGRZevz
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Authority-Analysis: v=2.4 cv=BKkmP1QG c=1 sm=1 tr=0 ts=6b058018 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=yrtxUKLFhIMtdVcRTsUA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0NyBTYWx0ZWRfX5U2+4wueV7n/
 kE6HK4e0ANZCHxuMhM5ZBVc1IGDz9YQuTC/EpzMYcV2J1g7CfDawazlmWmGBagWzmgTqr5b5Nal
 mCxFnrdFYG6mn61pNM9KDRRmoClDIEM=
X-Proofpoint-GUID: XtYX-cPouraifyUOFxyjF8BUHaL4OBvy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0NyBTYWx0ZWRfX2G2ZGBlUenrQ
 VLAfCT5t1SshpxB4pW4Eq9iXh9ABHTH6tb2P2IlEEoah3WzY/1pHhG8Eg0k6mRwsDKBuY9Yw9Qt
 Po6FO34au2rZfjE045M+U/Y72Ti4EQXdS70jljetWGcfBw23XifcTGjv/6fYd837rLPTfBnZyzw
 Q91GKzVYfNTMJq+UxyNrPZSZpQCCRaHr3yuFCtJN7zAkq3fCnxq1fTKdQJX4sRI9Un+QkOFa0c7
 99ZrQdzNhfCKdRTvVkgUVltV512OsaX6fWffPH9v4DlUgpY6jyaVf95qaLG6bZ/c9ayZjC2RT0K
 C176Snk+f2n/KOLzBSpgBLNkOcls8J0zfe7Q1dcKGEYLxUyBwBncAPU2JNmXAQbZCzOQWP5u3j1
 a1jpoigDbYLDuvgBQIaxNMwKuUC5Zkm6aZ3BU2xx2+Cxw64L/ZRqIufUb6kXR+Qat+gyWxkxfQI
 bJiKUv0uQRss87E+y0Q==
X-Proofpoint-ORIG-GUID: XtYX-cPouraifyUOFxyjF8BUHaL4OBvy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240047

The GENI serial engine supports QSPI transfers using up to four data
lines.

Add the qcom,geni-qspi compatible to identify serial engines configured
for QSPI operation.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
index 8d1c78701657..eb44f1fa96e2 100644
--- a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
+++ b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
@@ -19,6 +19,10 @@ description:
   SPI in master mode supports up to 50MHz, up to four chip selects,
   programmable data path from 4 bits to 32 bits and numerous protocol variants.
 
+  The "qcom,geni-qspi" compatible string identifies GENI serial engine
+  instances configured for QSPI operation. QSPI supports transfers over
+  multiple data lines for higher throughput than standard SPI.
+
   SPI Controller nodes must be child of GENI based Qualcomm Universal
   Peripharal. Please refer GENI based QUP wrapper controller node bindings
   described in Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml.
@@ -29,7 +33,9 @@ allOf:
 
 properties:
   compatible:
-    const: qcom,geni-spi
+    enum:
+      - qcom,geni-spi
+      - qcom,geni-qspi
 
   clocks:
     maxItems: 1

-- 
2.34.1

