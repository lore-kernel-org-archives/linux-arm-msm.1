Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AB24E01EF
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 14:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790607105; cv=none; b=c8AoAUNcXpW/n14wtifEGuZP9WzRtEqjxGBuRpin4k8FNfaGxSFJix7sZq9jcxmUzYHg7yT5CqjLFymgfDFcEMWayWGExsBrkSZ9/jbsxG+GUW0EdZHfEwsm4oOchH0kegHh32/4Iavs9u7VPDzVIfJMxzU3jYm4+HRmUTbz8Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790607105; c=relaxed/simple;
	bh=VHh9BvaOe14A405lLmF3EkfjMXNDD6EjGQjTA5nafkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UfrysI43YuxVQvrUYwW9GrNkLsCnfWHD2WxOSdUsk9Z3bMB/XFonLgrQZYXPzXacaYCssN6OwjPaGsrfFjS4guRMHB72d6mtDWtipOBvxgvj0da4ePTkQ0V1p56Ykcc9dxhkaVkFOp8weZDYvK/G+GiJX4sxeMUq861MfzzUBOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OjB2xNLT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FmWxSuRQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OjB2xNLT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FmWxSuRQ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEe91C1244041
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 14:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZmhFpeTSl3y
	9IoBkZPsx5G2f0FCu2azZTfk9A9ZK40E=; b=OjB2xNLT3Vvmx41LEuBZ4RS1fMg
	iOxCiI77/a2CG0vdIQ28rTFdXWsa6FV01kowJEY3qK5gqGQQTikzSC4JwKISSAtT
	OFCrfT0dOre0nAkFQFt6IGATjjO85Q7/sZhltGs6LwEDX/z+ZimYlEXRZASCD2He
	Nu8Ol6Hby7j/Dq8pftzsIdv1G89Lt8q1BoPXfW85MPVXOYu22qHx0GhSQyJfdS+Y
	aoBxxWPire03NyEQnLoRIaHTPl8b9J5dAoyNw/iJCGADk2JGpGD5gkh4o6RSIz0B
	BOTduHVBop3B5q9CvzICVQXKzaLWKEIB2AgQmw1Fz06j4ycemUkPvSq+eqQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyav4b1ea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 14:51:42 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-980c3b71002so2557860241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 07:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790607102; x=1791211902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZmhFpeTSl3y9IoBkZPsx5G2f0FCu2azZTfk9A9ZK40E=;
        b=FmWxSuRQu3+3EFHV3nPgcegeZ2XAq/wEMMu8MTxAarrZizwCe9Q/U9uOyFihkWYRTc
         tgDno6qWIDgyNducGIGvdNc10V3b/7uZRpJVLRFqz8YPb4zDi1BaoCrfI8otvcySa2Gz
         hMVE/iBoh8HZOpYV5BSkFiXuVpVSSIFPAVfnjaETHqaBjo75vIZVj9PMXHahld7rUdJ8
         EXzZTZenljJ4qihjQ9V+ym/8QuBQ6Oz8ZtcAkU8EDLc3C+RenuJBspbElUpPyFuqVqxe
         rOgUk8JlOi/X5EoYdezV+nEy3Eud8HN9a7XA+nnTwXGcoPsMb5Ac5I76aQb1PWX+qFcZ
         Jzmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790607102; x=1791211902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZmhFpeTSl3y9IoBkZPsx5G2f0FCu2azZTfk9A9ZK40E=;
        b=mxzLCv+cWdv8YYYSv3mU4sHJ7QzjZeTIXRjZSNi6Qi9IbfmBKFuMoZ+Bs/IWkZlRDg
         /eqsJue21BJbB1NEQ2+1vjVwFvlmEN4mksfdw0TFh3aK+iyynQYAwBebbsu65aYGUNOJ
         YjBjWh1tbhYWWZ7QdDgSA+8e4i1Qjn8Fgl+XrJ18+10suW4NLYLWoPSe/+kjFdyE5AIx
         F5fjnNLr8huuI5c770dGif3Im4aiAUyRxKNUVoPdo6Ia+gtZXiSdj+/ee3wLbStcGQX8
         Shxb/47kEtMGexY0kBMJxLhwX8ulm3QIAkbVrexelbod7yno2NUPFcGd3Mih+XNs5rqs
         G8bA==
X-Forwarded-Encrypted: i=1; AKwUvBzoBpKvfjMxK3JUZ++9sUXHgr1fTSZ3Qy3l+A3cMzqtfu6PrfS6k0vdJD92//zJg5Ef8143URmLkjKirLj0@vger.kernel.org
X-Gm-Message-State: AFq9FYIuOcQkEXlxnyLXLUS1NpH27ifLB3plS58ZOH1zkLHd7Z+vpfb5
	ehceXfFq4elUrUZd99xaTDCA2wOmKUqgoiD2Jv4A3Yzyh3UP5mobpBFM7sRaiQQpTUthrDNgQG/
	Fe5dFU9HoetOdxwCp2jYkkNTHy2QQNW98i5Rr2FS9NxFlK7+a+5vEgXwKO29eEcA6LxfY
X-Gm-Gg: AYBFou1p5Dngp6qFDFuW9DzjichULWe3IEb1OAdvzZKx0L3qnfBPRth4Yf11HPoVWCZ
	fhliDISUXGawj3s9r4+aWFpkdwO4+ZxS1ouXlPyA9xUN7gj142omn4uG74PRTlHrbz6mwt5r01q
	ykYIePRe0slxCPNzFg9cdqU8/R6t+5nDrHwPkDhBTPfW+FvnuTFJP2itCx4qj4JywM8IgQDg2ci
	jmqQubWDcT2i1hfZRpshO6XDvMCn3eoGaZ5Y6vg/EYvjrqC3M6GjdwBQxFbuQcRDNmotcFvGErQ
	FRSrxYDubKw69vQcGmSxNrSLX3bCOXxRgtUo1Hv/x/g5KKB+m35ERD3+HUevmEQqItY+2v5Kd4z
	vBkeowG0pAmi/
X-Received: by 2002:a05:6102:6883:b0:7a1:f7d2:e820 with SMTP id ada2fe7eead31-7af1ecf1913mr4911098137.25.1790607101811;
        Mon, 28 Sep 2026 07:51:41 -0700 (PDT)
X-Received: by 2002:a05:6102:6883:b0:7a1:f7d2:e820 with SMTP id ada2fe7eead31-7af1ecf1913mr4911073137.25.1790607100373;
        Mon, 28 Sep 2026 07:51:40 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a007fd1a01sm42777315e9.0.2026.09.28.07.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:51:38 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 1/3] dt-bindings: arm: qcom: add Lenovo ThinkPad T14s Gen 7 (Mahua)
Date: Mon, 28 Sep 2026 15:51:20 +0100
Message-ID: <20260928145122.1337186-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260928145122.1337186-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260928145122.1337186-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: OGxo1dHiZjb4-bftskJXJvtgEh2m7i64
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1OSBTYWx0ZWRfXyZNUma/+v2Y4
 3QBMrR3mM6Y4hkQxGvLWVHzTkicNlzOYgxIJBSGOrVzGY0XEWjDbdWVxxvq6mhkgDF13OBvUU87
 Sg3m6mwnpRdz+ISHQuMalWXWj6C3L6WlJzJFBAY2FczCwnBPUypV8QxTZNV8rqLAVaAeZ7LT/QK
 cmfVntE1K+asA/XseE2AX5L/ZEcMaq01YtR1mpC81idsGNNdBzITY+gz7BqWo/XDpJ91AffJd8O
 9/lN2ibYwZ6iIGg0ujFSVNzFiXYFJsB/AFPXwjDAgTOST71FRlT/m/nIQzTw/aCGvKy799W4Ugo
 qq9j9qccaDfleo/0ad+tvzAncmtuDGngJwR2Imge5oZ/Kgg8+/OwPERuTbsYu3MPRKKKyxEfeA2
 IrcNVTjV0d9DwwC8N0F/es0TcV3dyTWe6Ix6/BTTIp+o08A9nwBmqNIG4wo7TYdXMeZ0z28Coga
 RObK1iwRPg80SgApzPw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1OSBTYWx0ZWRfX+uw5PYVjRHOA
 UWsIadlKBcbM/4l94TE8rz5CUAkTfxTy0/FzIUJfoqAImbf4j991byDiWOniZDXymtpfI2vKfvX
 6SAT/RUmE8BKXrYXQgZ05pWv8p2+O/g=
X-Proofpoint-ORIG-GUID: OGxo1dHiZjb4-bftskJXJvtgEh2m7i64
X-Authority-Analysis: v=2.4 cv=MqLHeGae c=1 sm=1 tr=0 ts=6aba7efe cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=MSM6P-WPhp0LPykjVWQA:9 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280059

Add lenovo,thinkpad-t14s-gen7 as a board compatible under qcom,mahua.
The T14s Gen 7 uses the Mahua SoC (a 12-core variant of Glymur with
cluster2 / cpu12-cpu17 fused off) rather than Glymur proper, matching
what the platform's ACPI MADT dump reports (12 enabled + 6 disabled
processors).

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 18a13b4a460f..de4647501085 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -194,6 +194,13 @@ properties:
               - qcom,mahua-crd
           - const: qcom,mahua
 
+      - items:
+          - enum:
+              - lenovo,thinkpad-t14s-gen7-lcd
+              - lenovo,thinkpad-t14s-gen7-oled
+          - const: lenovo,thinkpad-t14s-gen7
+          - const: qcom,mahua
+
       - description: Sierra Wireless MangOH Green with WP8548 Module
         items:
           - const: swir,mangoh-green-wp8548
-- 
2.53.0

