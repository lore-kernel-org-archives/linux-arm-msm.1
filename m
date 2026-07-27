Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D8D400998
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 12:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785156714; cv=none; b=Zkqp9EBegvMXHX+RgWNZ8ZX1QN0B1vG1FQ9mCyuoHcN2kfzsTojvLaHafx4uU3hssl/wl1PGVm59VematGe0wboRR1S7xe45FLvBj1+tyMLu19iDEWClU4IpXDCgGg22HSjV2t1n99YlvRb5Yx5c1r0LdfDYyUBzr9SZfIob7ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785156714; c=relaxed/simple;
	bh=7lAnEboM05pxKLJKuQkUK/+Xj0N55Uc3icMOdr2M+eM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e9XZn8giWyHu+4VAZZlSr8iuGiaHoZ27DMCzU9qQsPds84FDcHBTL3qCwtCJBlJYDWDjd4nTOuSBbNCjviB0/Hn3LtutsnK49BrDH8y6jM428GZLMJ0gSTzt0IP0U33rVzRsEhuWKXKFgHtNA8w5FXBKYZ3HMXSwO2erRjtulRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fJAwV6RS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SRZ9qqHb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fJAwV6RS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SRZ9qqHb"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RAMQli3594211
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 12:51:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BIETq0q+ZXab0uvSzqdPRZQrHX1hfSH66MKbozuc2X8=; b=fJAwV6RSV8EeEAzN
	9IWcw9eIsZY7NbvVesrucEjuTJps/pjJhDAvR9NIlxveEZBcZkYt69qmqrKFAPq6
	hG0s9r7h+BDWFQrjG2zvLVJwjemBwRl9/Ud4WmvgufW6qIjFKhS2FXMEN+S+6Ax4
	F+2eW8au2lGzqik6KdRqM3wFEdthPMWFonpCM1OToDyoW1M6pQE2m6NidS/K3BNW
	eTOiAkQF8GaUlc3J5XD0QoMvhHKd0s48v3dtkmgioYRiG15D1SXevoHOfy62ohcq
	jXeoD1wkRFGPRd9c2AQ8qijzJ4qCcEWUssncl/5uTWFdYKMqI4kDh3AlVfD4EhrL
	j3R6DA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mq0rk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 12:51:51 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so3392769a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 05:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785156711; x=1785761511; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BIETq0q+ZXab0uvSzqdPRZQrHX1hfSH66MKbozuc2X8=;
        b=SRZ9qqHbhYtJuXkK6ziPHkio6mlVIld5JcJM0tESHYzsiSoHmpG61LTdoz42qX0HGM
         9ANcnbGgQ62zwIE/yimIoGeag8/CAuyMhHpJX7WC8Ekw03gjb75Lzje+CQnTuZK04wqV
         vmLv+mvhTGqAGlEL9TuVQmCqvvFAkRyq14lRUKkx8H+xJn1F24EaJ7PtLhg6YDuArP2e
         YgtcUBzONLHDIhiPdwEhYkUO5gHlPnewqW/hshMfzHncbASZj/44nirtftjJAKKgHhGE
         ULs0j2kQIRiDhq+73nNa1Mc8M8I3wwo0zu1nbZHcCZd2q02jD4WNwpQ+xUdNgrWGW7h/
         2WmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785156711; x=1785761511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BIETq0q+ZXab0uvSzqdPRZQrHX1hfSH66MKbozuc2X8=;
        b=UAC+qF316PZ3XQry1Q+5IrACN0BwzodF/NTxGwofpG6elHzu+LU5cnbDJLsnA3u1kL
         6qB895C4esdPuAa/KSQdAyoQnWtl8po6SGWl7kSbCVJm3vZ5SvtU2Ttr4RtlQtYs3W8V
         CN3GEcawVyW878RLUW+0lZJBvqakn3UHHhiXQXcR75ouK3hdWPJoOFGrB0RJuJ3giVH/
         Dm560C+RvKOdPY/202Cc3WegfEiC5kW5KWxzdxMa/a6RT3pxEAgUCxq1xe/3uOHpfNng
         SNa8gk/A8Sdyu66tysNsOTMfWXqB3zJUiEUCDVcUmo8A3XQWndX5IEFQX26O4/7j7Zjv
         23Tg==
X-Forwarded-Encrypted: i=1; AHgh+Rr913mr9Vb3eDuF9f3LjceqIxfrE1eNL7CSXuZ6ikCxr2uSIvgtLtrFYkfF61/ckHL/WN9TN1diFDWNu1oV@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp83GPa1swkO1oiBHeRPK2R1Zi4OXuqHNXNTAxxiLwf6yS/Tvd
	THuIfGv9XzvH2ZXQVl8GoeeRl/lSD2jPGVFEcm0r4KSbxlYVD4lhVR1V8fUZLxo3lkWznN/gLww
	xcZ5XxcoQH4Ifhz07yDsiQsSnxh4iVtjHFjyFpV02qBLhevf4eoa0qdP5v3Oe7b03B2xx
X-Gm-Gg: AR+sD10pEVHUtkikoMj/02sMelVbpmdwqckythvQWtgn6pUx1oo4vji0c+qH/qHyhy7
	5tOMoFUjvmTMj6EJLePrEuyY4TQwS3dW/Z9D887w1gTeJRkCk7SkcHIK5gjCKkA8Ut//B04AD9e
	PrDIO4h+pxjTu/t+hU7BzKvSQtvkbggd550I+K+KUFfi+7a+KCo4jxMoIpW20pQJEUMy7QFXe4M
	GcPDd9cdW0fhwe4nzukZr9DdM8uh35JD8YfbyxZC2AnVKgAZoKKHLFgp1JyIWPaV9kTCDQjbAJH
	WCQ1BeatgikwlN1eNdZirteUbhrluzeelJzW7zOlK+Xnvs5xYUYGvqg7hh4MMl28mE/LcdVHKg9
	fnkG/W0JeknTXA1PAHx/p0A6XPhGXOe3xknk/42kvYNDQfkYYypBQ3l5W+iB1brx6
X-Received: by 2002:a05:6a21:778f:b0:3c3:91f5:82cf with SMTP id adf61e73a8af0-3c67e061f5emr5314482637.46.1785156710641;
        Mon, 27 Jul 2026 05:51:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:778f:b0:3c3:91f5:82cf with SMTP id adf61e73a8af0-3c67e061f5emr5314424637.46.1785156710003;
        Mon, 27 Jul 2026 05:51:50 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e878esm32263425eec.3.2026.07.27.05.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:51:48 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 05:51:38 -0700
Subject: [PATCH v3 1/5] dt-bindings: arm: qcom: Document Kalambo SoC and
 board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-b4-kalambo-crd-v3-1-25280faceece@oss.qualcomm.com>
References: <20260727-b4-kalambo-crd-v3-0-25280faceece@oss.qualcomm.com>
In-Reply-To: <20260727-b4-kalambo-crd-v3-0-25280faceece@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785156707; l=1039;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=7lAnEboM05pxKLJKuQkUK/+Xj0N55Uc3icMOdr2M+eM=;
 b=hXf7SCu94IW+Tm+OSM+S4JIL4mqdMWZszyzVXI285NrheBevq4yegB0zuFIBzjP3vy54TYhy2
 cMKN5ETAtZhDfRx28PCFMZeNv9FjXaG80ABYEUxPZsemlqTYIYn2x91
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEyNSBTYWx0ZWRfX83uMKYUdPZob
 Xfing9Gdkf4n0Dca3jMq+rfaF0mCUQJPTwZTrHKtVyTu6jeNBe2Rd8QQenPBedJ+CuKY09OPMsg
 uRISb3+8soAU4+v9vdO+bNSMxRijHSM=
X-Proofpoint-ORIG-GUID: zJ4tZl3UF57B8YImxIMdov2QYjrLlEu1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEyNSBTYWx0ZWRfX5LfZ3UX+wEiP
 JhJ9t1RRuC7AZbBJCoeA3AVdtKSLDQvYBL/we0xktWm04MSSHXQwdogCw2QLRZ4CJFgT7pZ3Hl5
 WSrYjpkn8UfsxLW3mioxuc7Gm/HlHFqEmuqXXwnjqeujPcNqUsHCgPXSAh8il4mUlsEaz2E/Sgx
 ZjCS9kHLm8mh7RftLlUIv+s2hz58hIuYElE5HPp9Lw64ekTqTnWjYClbalGnaaB5uBzSXlN2xnJ
 ftZltTGFZL2OQxEzFaBlzUAwRPKrqJZTCfi7wIP+k+mXWkuCCyq4XkipG9IeLQmg+EGJKpeuBI/
 WPjHXc9U4oAmDB5776eqFx6G1PbQWwoAOnaIakH80R0aLM8MJc5IDcNyDiLpVgPvSKJKt4Lhau0
 YOdg73DmsD+YhHF80E0UpdFFceNYcutPFMgAxfbkx7cs3tiNHhwVwHubLt7A7OGMyV0i++TBc9b
 +R6Awdg1Ai/M4Fyc4fA==
X-Proofpoint-GUID: zJ4tZl3UF57B8YImxIMdov2QYjrLlEu1
X-Authority-Analysis: v=2.4 cv=TemmcxQh c=1 sm=1 tr=0 ts=6a675467 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=p3IoqaKxkAlDmzJvLqoA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270125

Qualcomm Kalambo is a derivative of the Mahua SoC with CPU cluster 0
removed, leaving it with just cluster 1. Document the compatible strings
for the Kalambo SoC and the Compute Reference Device (CRD) board based
on it.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index c7c9a9279684..b0c07a57bda6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -174,6 +174,11 @@ properties:
               - qcom,kaanapali-qrd
           - const: qcom,kaanapali
 
+      - items:
+          - enum:
+              - qcom,kalambo-crd
+          - const: qcom,kalambo
+
       - items:
           - enum:
               - qcom,mahua-crd

-- 
2.34.1

