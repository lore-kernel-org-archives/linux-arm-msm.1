Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD1926AA91
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 05:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791264580; cv=none; b=jECFfT34VwzC4PIeosucIP1jsx1NdJF4vl8LVeeQBynbFPgUHp4dVhllwDqt8biHGxKc0j/61YRte7CxBPnLXqNB7eC4xJPpmq6kKz/lHSipc86PV5eQpCD0+ZLPb20cYjSQgc50Urh42nO4dB6gPgnys7Vu+28vB95kKTeu2a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791264580; c=relaxed/simple;
	bh=r93Jb+RRci5KjslpMwSwutEV/c/USqhXg7qpdeh+1sU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G3vqqjOKG/teDH90TpQEvod1mp5OI5jZJRuWjupyp3PXmIv/mihzAqzYN+avVRIDqmgtHre2oUB9kwlgIi1uTtBTMPEoaTxlLd8tLG9Ai6wL6UJvbTU1USuLcUOCM5h6OMjpXSdRMeV0X9FhiWwniUtd17juozjLZxHmdDbTjGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KGm6v3Xs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a4lyeio8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KGm6v3Xs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a4lyeio8"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6963AVAf093766
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 05:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jrWr4WEEoDxY2QpPfvYR+d27cAyfCi80wCzqnJN1qlI=; b=KGm6v3XscGWir+j+
	DcdnJdkShndEyP1ZHB48EdljHIb5VD52QKGo81YTB8IzCjYkKm61PAUWgrN/07kt
	e353mJfs6EfrsVq9/s42R4SuCN+BmnJEd/2i1BfJQRo3mXNbiWU/OPUai6pr01LR
	/curnycN2Mo27itGJhIUrxmqJggUVQ3z4IZzr4RWk4DuTZZgAvkT7bTjruYPDrtd
	JAk+qyhx5rGRwG7EEDIdj+6VwxmDKlNZbC9iq4vjWkVTkgdmKUX/ycSkT54iQnGa
	ABLzU7bRAYugZR8l73BTdAwwrhcAU/pmf+E+X9rfo6QGyHkw0M9g+O+FuMsiTSTR
	yxWmow==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h49tvurrn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 05:29:37 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30f1b904861so3046326eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 22:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791264576; x=1791869376; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrWr4WEEoDxY2QpPfvYR+d27cAyfCi80wCzqnJN1qlI=;
        b=a4lyeio8g6Nmztny3lOaKAh/0ih/TRpYAmPhQ5+bQdRFgYq6okz+qFLUqubv/i+e4V
         ZfKQIvnpRv5zT3+xhTIGkOeuSXBO91ZhVH/KtVKRJtVrWQD0ax5/dO/4il/45XioIpo0
         utsnZck+YOC04Zdn64pBROcBTgoiUWXmmYtsbDtLBzyTU9u8bqQPpM0Njuigl8x8TMic
         8QsWQ/PKcrrPDaiMXXTCU5D9EnWFcgdE8CcjxeVG2ASYZX6tDQHeeEZPl49rT9piX1JK
         pHwtkxYq5jOjAZygPrxqHJP6TRWi17oFKQs8yKdF/GQNR+gtoZ63YXujq+ggEm8yBKI1
         S1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791264576; x=1791869376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jrWr4WEEoDxY2QpPfvYR+d27cAyfCi80wCzqnJN1qlI=;
        b=ReEnUvrtNrmeusu4+YifR2mCdg7Eybq16q6JYD5Vitdl9KhvazyMWNa7ChdzMSyotK
         2JjTypW8w8EWrSsDqj5lz9/0LJgfVr+zHLMQfq2DpeOBMRolDGXgi7GFKj4VXslBr5a/
         U4A5G6J/xPgq/6haA4GXQifjbylIwRcWbrxnt76qAXxRGpCj/zgzpZ+mKzr257zoZHec
         EPNo5DRSe+BqR+yEWxnK+kYcJDzL7QuZxUPMgGi7EVYZ8aWWwsVI/vhAXnttxDuSrFBZ
         zq0XCYum+v74noNLNmAA0KM4J/VXU4z39mPz6Nxfu74oxZKdP0A/sS84OLUpd6/g1NsI
         T81A==
X-Gm-Message-State: AFuF++neytFvrhadClD/8BR+Fgge/qDZdu1hmE26HcW4ZNgHnYrZqlfn
	uM0ZBvRylhRZr31nksyqsgxRBxtl/WSZI3urkRULQYknBF4GPf4FWiieNMqdEiWiF7pd1kz+ag7
	G9trlBAo+L/XFSw1+hLZhlMFLohOt7fIYWLxumDhPjCQR9v5MbkgwszqOB8bIONigEYUv
X-Gm-Gg: AYBFou0CSifAIv6oyhTKZyMO99dEzXnDs0j3NyuvgDLEcW10gCV3jr0jaokHtdlw/qM
	ayJrmoDNIHnGraH/4vtFyZVUqFFeciINHZ5o7oEz5N5mGiU1JEEK0J0569fQsYG2vQj4MoSrsio
	bpEf5/QMlEnM5NFKc1/Dz1IwBFIwsH7ms8nXSimLjqvlJLj6sbEL5J7jdZjzg+8pxfetDoyx1B+
	00cZjOSL4oFwT6RVQ9YHad061l3o9VeT5wJYywAj3gYT6CzCNxrIARx8qc2+fsVZnIUDJ66mdOL
	0z6Rf5HzV5gh+sfaowWo/brNASi4jNvDzVji8Kewb1nEcvxcUxT4zkjCbwOzBFZG5JtFPijiUkZ
	JLrn4U8VDdC/WG4ZXvm0atNf9e/Ti+XHj/o8p6Rq/ewnf+c+anC+kwojhdb65bvAlmLzlEkfHSK
	2zJOKcqosquDzwLSsy7oL9Ke9URJuR
X-Received: by 2002:a05:7022:f902:20b0:151:6e80:ba7e with SMTP id a92af1059eb24-151c0b1bc76mr13208138c88.4.1791264576495;
        Mon, 05 Oct 2026 22:29:36 -0700 (PDT)
X-Received: by 2002:a05:7022:f902:20b0:151:6e80:ba7e with SMTP id a92af1059eb24-151c0b1bc76mr13208101c88.4.1791264575932;
        Mon, 05 Oct 2026 22:29:35 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d85781d49sm4017403c88.16.2026.10.05.22.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 22:29:35 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 10:59:16 +0530
Subject: [PATCH v5 2/6] dt-bindings: phy: qcom,usb-snps-femto-v2: Add
 IPQ9650 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-phy-v5-2-cbe9330a6449@oss.qualcomm.com>
References: <20261006-phy-v5-0-cbe9330a6449@oss.qualcomm.com>
In-Reply-To: <20261006-phy-v5-0-cbe9330a6449@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=aN9lOr9m c=1 sm=1 tr=0 ts=6ac48741 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=JwZr8aepJa0OdLIFGX0A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: TJ9o0Usso3lPumVSkK2ee9YNircARbOl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAyMSBTYWx0ZWRfX88Y8BiRzhALv
 HAs7ncHvk87kXd4cecxVtow/NyE5DR7TgxSJvax6Erbqmc1YTnLffaVfXlSGsoDzpNE0U1+j7mV
 MeiBRYboj5DXsfn2MBsYQuvA58+gmLbAP/OD2uXXrpGeXP8+Hxt44XiI6yTYXDV2rmkYZaXkqhx
 9ZAJBhFwb1uS8CXpGJr44KUf2nCi0rlkEI2FwA4jIiKRZEjMYF++cFzHVkIr3zUDmsYnVnkaKMJ
 +Tq85dlgxz05qI6512GsWkHf0q1iQrluQH7y9HK8ejGtSl634iHLnzGpqJYd2/CAkv0BDms8nME
 BPreUuEOG3s9vEorQtsyp1wUVwv1ERM/OMhJr3s0ODnv+/OvuABn5Yoqo4snJQ6YbT/CmoPnrz4
 9Za6lbQWjFEhv5nqjoqbWnECoJ4v4ltaagQM1Q6OZ7+FEouUaa7QGJqp9TOHala9B5ROg6Nr2xE
 MAAV9tvfUIVJ2ei4rrA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAyMSBTYWx0ZWRfX0WkyHg4IxaxM
 /WUwQ5LN+94QBaaTPJ3xZAp1K55A8wIYpGD7N2PoA0R3M4CW/4yTmMhnPBHOVFUs6iil4PWwITQ
 BWBjjUm7l+EB8mdvBTqYBV/nJiI9+uQ=
X-Proofpoint-ORIG-GUID: TJ9o0Usso3lPumVSkK2ee9YNircARbOl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_01,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060021

Add qcom,ipq9650-usb-hs-phy to the list of supported compatibles.
Unlike the existing SoCs, IPQ9650 does not share a generic
"qcom,usb-snps-hs-*nm-phy" fallback, since it requires its own
tuning/override sequence, so list it as a standalone entry.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
index 661759b25064..db00f5a99d80 100644
--- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
@@ -15,6 +15,8 @@ description: |
 properties:
   compatible:
     oneOf:
+      - enum:
+          - qcom,ipq9650-usb-hs-phy
       - items:
           - enum:
               - qcom,sa8775p-usb-hs-phy

-- 
2.34.1

