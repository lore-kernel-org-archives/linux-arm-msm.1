Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634806;
	b=UsZkZFlgCOglXwpBE3c6nIvqRJta5tnfy5HX+/sdqTRM1PjeE0DJxleHe3U69O5mW8Xy
	 V2soNOXmdUiMO1ynGtUGwxDgYQmBWw6AjCzbrCW6TH1tCFIzz5ZpS6o8L8cQATlTP6H5F
	 ETBf+kr/c/wq/L8lxSQOpqCMlC/jHMZgwmMGEJVC93DqoOnCD32VYoIWbhqJqUX9cxuRN
	 yQmuuca7JP6ZCs0oJmvapREOs1XSqPzylP9yuHsSLVI4X8Vgxi/bSS1JrSpgPL7LQeEQt
	 aUORT2POpepqaqxvvtftuUEnQvysMdfstSY4V4iuC1K0lscRYHb5CFYEohXUA0K1GrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634806;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=;
	b=kVmi70xBIbGhZA5BPaXGN7H8zrUXat8P5qZH4AIOgdsRphHORhY1DgaWfOwxnM7vDl9R
	 1+tHxNQAmnnCTRAUgInARzNUSmLhpywD1cRma/XA132AMNqWIUUc7dZ+ojGPVb1M12rPV
	 0VCjXnDgfHAEIXiqkAOhr/OEeynN4frTyD4MUo6t70vL/nS45Hs0SXCey00e7qEsDHbWo
	 zPQIJDNaep0CTwscyyVwwhdiG7rhS7notXr5PfKuz9WQeKkwz8nJ+udrA0Xo6OoIWE809
	 h37d7iHSc2NGkhIdMjVxAsJm+22d5NWnaEIp9pHVpnZm0jFugixRhMUz3Hj+9Sc/d0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pa4dKkB7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ea8nyh+X;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCBF60A8C36
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 15:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DCBF60A8C36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pa4dKkB7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ea8nyh+X
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpIej2991821
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 15:53:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=; b=Pa4dKkB7FS/RPmpr
	4MycTztlI2IEOMbUxMKoE2U1BIwIGcXTEhWZNav9AXAMbgLRbuRh+o/ePhzk7WPV
	a4W0EslWihwIAtEmhhwdd9WdslD+aiWIihz02+FIcEAgQg9GWA/Fyqo68zdpH8wu
	A2Gmx1UG5SkR5lkjYGPMJfCpE+nO+XiihC9unReG17IpHCJUgxLlZ4poWXV1w6i5
	FA2MZCew5ueXmQE6l5YH8bxX3asLSvLvBtz9ce0zRvLCvpu96UvdNrD7ea6fc5rf
	Y9tcrqfL6qSSKGN6nyMTDt3D9y/QFdZG7h7i0Q6mOc/qyLNqKhuh44qcH9bYq0EB
	Ctd9Pg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsavh6km-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 15:53:25 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7b206156cc6so2276779137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 07:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793634804; x=1794239604; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=;
        b=Ea8nyh+XA0oeddX0lth30wFRUuW7ZmkKz4W3zjE5qGRXar+E81WnGSphha+OGvCyMt
         jLXmm9ncRWjHDlrK71ILiEiLeer59jxAzVT1IS9tki5RTwzh7PItCMHVtNGtesoCnhDt
         z8ckrzGzIgQUBs2wxo94d0z5tMQqdwpi7NKxV3x7NqAvZI1lJiOhWUVCEiOlW0V6NSzI
         +LOuAJbarJ9HtRrk40B2UEz75iz28kH2W41tufUeENumJPX2prqAYcgI/reF+CeLzTOs
         ocThDgh2Deq+e0px6F72jlRw2jib+mphad1eUacauBNPqwps27Yo2Uol+XexUd6tMJkX
         9Ilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634804; x=1794239604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XXmN69Ge/+VQXDrPPXfk0gw9jzVKs5dfYUsGisR9ehM=;
        b=e37jTEjFyv8rUe4mtaBiyv+LzKtCjrDq3O+B0Y1erLna2g/ytdbroSwvzQ6lVfhKlT
         DDxU0tcu60n2JeFEmtu8ViqMoZzkFumYGzdBdy9fUeQF5tOtuhspOs6yDqStAdb7JBRq
         dcE5Gw1cVe6XkpIJpRfogExOif3EQUdDLRLZ1cjxgSRTk3RZFZQ+XCkHC6PkdlVoHmV5
         BYW6s5EA1nD+IFNxU04DIzvXeuVOf5HsWAfwbtqqn+q9nOe44Sqt7kGVsArJIp0kKyB1
         ObUdMGrF5ZPNW/8ZpaA2dGlvZtNQD1+kyB+IdaUx+V9DdlA2i+GTvcNzRHXNP6mEJit1
         6+5A==
X-Forwarded-Encrypted: i=1; AKwUvBzS7CdnfQ+l2gvwTJUtncAaZsIQyuqGd+z99wwp1uy+H2VgXIuxoDQNENojXaCjaFOR1YbRbezwX6XvXx8d@vger.kernel.org
X-Gm-Message-State: APuU4Z/dOw4DavVrZjN5E2sunsy1j8+OVKsLAAlyu9Z4w0yp6MKltjLs
	YnItjAn/DBym8L9BQRwAzKjvvVZ4kzEQjdiv8p4G85ttLLvDYVxHSvRtv5OGtpblW8Y2hKPCv5l
	ygIZRQTJeqU5hrVs6erU51QWnlrrrfE1KKqZyE5OV0lxLUKJKWUimf3z4mWtV+Pexdc6K
X-Gm-Gg: AYBFou38OTc6hUfNoLLlZV2Y+yDws5ffp6l0D4c9J1xxeYEIv+VjEXGNdTmzSdL98D3
	dCkD+Rb65q7lXHbnDzyFr8s8mM7G68uz5au3qc5azl559oTVEi1GVy4/jo6xgiGCWzc2aLmK0KC
	uTeJZ0gQ00t/3q2lw5iLP/elofa9BB7tuHF1BAiwPSZmVJmhwgt9SePfS3FFHUiXEv5WFIA2v9Q
	DzP+kkszwW5oaQ8zo6XryKSpjuB1Wz499UoEO/4DxnfyvO8vKeaqNSxz1kM2UtHp2JitpwSFjUl
	D9QsjqbIb+AncgV84nFZH7hQOow+0qu7GeKW+kp+ezoM0N6zaDSmj7XGu88jD69cAI3349iYWIu
	0IST040IOzdjdYfqKMZRxjT2migdcQJXaa+7GCJrRS4ehtMs2WVCwkSZXRVzx6iMpxySx5IQTxT
	kG8JogyEMoA/z12kPH1JSGWMfEkoOoPIlPNmU4d+VYw9cwf/w3uvNa7JFcM/Q9gnCOXTvMoZhPI
	9h0COFiJfJpwIjz8Gaj8rVQ5c8b
X-Received: by 2002:a67:e102:0:b0:7cc:2086:34e0 with SMTP id ada2fe7eead31-7d0728b1cffmr3143655137.4.1793634804362;
        Mon, 02 Nov 2026 07:53:24 -0800 (PST)
X-Received: by 2002:a67:e102:0:b0:7cc:2086:34e0 with SMTP id ada2fe7eead31-7d0728b1cffmr3143636137.4.1793634803840;
        Mon, 02 Nov 2026 07:53:23 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a7d1sm20700323f8f.38.2026.11.02.07.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:53:23 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 16:47:34 +0100
Subject: [PATCH v12 3/9] dt-bindings: media: qcom,qcm2290-camss-ope:
 Document shikra compatible
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
Message-Id: <20261102-camss-isp-ope-v12-3-702254689feb@oss.qualcomm.com>
References: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
In-Reply-To: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfXxi85yC+m49NG
 QD0AvstoL3I5/w9DdbdQjSkvFiKOM4KcCZdvP4r2GmTloPAkVG2JOykpoyTmNbYpZ7RvRgegeaq
 46mUlyCRX8A/8saWdnCzpcJfAww9LNMOQfbovxYEuMkiVRGe8XEHqc3bKnzgTldxGyf49olWo1Y
 CBzNb+KTebjYEuN8JH8bDZk8m6cVZ4cCdvA3M1BWlOLgzA2FrjUSykkyZNoBDJKQsMB7uyvYfHK
 11nCUy6NhZxuC+GFZac9WiX78D51RBxgwLIYmkLjPBDDFgA1p5953V/mnop4uNRmj1xQqHo2i5F
 YmJdJHOkfQTBLY5PttpFVI8KlHAwFdLT36d0eJCWDbyuCf2drAGrIs9yH6kPCB1SWui6rc24j04
 S4EE1JxGRbq007rynmbIUAb9KHBmwNSGKah5Kcc7L2+4Adm8FEAK4J4stboOuFlNVim8hLCmMjJ
 HA41S8XztsHl9OzzqLA==
X-Proofpoint-GUID: gEk8gtVy1udx2gbB8YXMB47UxWiJJRPd
X-Authority-Analysis: v=2.4 cv=FZmiV5+6 c=1 sm=1 tr=0 ts=6ae8b1f5 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=yPTVd8cUMD2GasGf7IAA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX71wt7funyzdC
 /Sqxz2n3d8aOYrCo1TKR1yakk3+wB8ALd1T1C0Xik9uu5geU1jsjjoqrMzFns9ByxnsblvF6waC
 WmD7yJd2cNCswJUImXefcaxyphUUpT4=
X-Proofpoint-ORIG-GUID: gEk8gtVy1udx2gbB8YXMB47UxWiJJRPd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020063

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Shikra uses the same Offline Processing Engine hardware as QCM2290,
add qcom,shikra-camss-ope compatible string with qcom,qcm2290-camss-ope
as the fallback.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
index f9c31bc88e94b028c241060bbd8e56e0bdc49af5..3359581bfb13e918bb4efb3bc41749e60d772ef4 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -19,7 +19,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss-ope
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss-ope
+          - const: qcom,qcm2290-camss-ope
+      - const: qcom,qcm2290-camss-ope
 
   reg:
     maxItems: 6

-- 
2.34.1

