Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50D23E1701
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 11:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791285271; cv=none; b=HNedqoSUiR5pyclqhD5GAKS5WQKhAuyyvgXkNf+m2bGKXXgUjc/GlpMfw77Nk1WWrNvTesIgiDyb7O97jxMSoGDPmz/KzxD6gVv46XsoKya3pGNz5xs4ICZJPgou7Z19Z9YShiTV6hEWzK32F7qXFUXGHy+6obOBNWsf2XBCgtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791285271; c=relaxed/simple;
	bh=zGHk3MfhmiAb4EiIwnRAES6AmHNoERAFk9ME9WyBloM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rPghBUXAQc9JgIAjReF3Dq/4yoqwbW1CZedx0ojvAsXMBeWVxCXkYk026+oZgvLXhnwBGfTHfTqyW3j/Q+i1x0r9cEncAPvnyx422n2/iUYq1r/Ig1QoXCjFVN2kG1Ue2NHmiAoLy+hu2oB/k2Is2UiAOykIvNSYY5MGGEleGUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Air0l3m1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PB/DwTsa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Air0l3m1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PB/DwTsa"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696ARNNj1580929
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 11:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3mKE8/aG6YFx0Rzm0N6mZ6wjhkusQUNFNvey825JE78=; b=Air0l3m1Fb/GFS56
	4WfyxfDAyQRfD0pxrCNoTiecMzvTGATiFX94hFDntblThnpkxDUD5DDzNcsK8lOX
	ogzHKB9AaU6Ty3BzML5dzw3BESoWxv29qVv1LsRfajMSDHx1nx2Xy0TY8S1EFvpr
	mfUNdQ4sV6KgeWq5N7EFGquOn476B+DgCxWFAdsHiR5OjO9SLPcopiKpUK3SC+bW
	61KLv+poburXs6u3vUunbZSgyxQbEvN1sS7M8/sukWfpPw8fc8Qob4rpU89xLmkJ
	/CqV5Wtqzzml5SeWFzuyVl/W7yNBqW3MAlq2NMjLyadtEfU8Z47pxq3GAEnXV6LE
	KthVqw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xc50bhq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 11:14:29 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a4f7eb79f2so2785171a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 04:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791285268; x=1791890068; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3mKE8/aG6YFx0Rzm0N6mZ6wjhkusQUNFNvey825JE78=;
        b=PB/DwTsaMUC9iPYms/mo2zL5T/JgEzvsk8KWN+R+7shaT+0E9LTSXjM2vfBA8bQn0L
         0dqcfbq7mZ5tupPf+v69uTLVPXDYN4rWZ8UVtY8eujN+uCD3w7SskPV5/pDcKsvfyYJ7
         G3Kboct/qA5f05eLuIY3NHhkv2y6oiFE4bKMR4FmxfWcwYy7N+gqXv0Cx2mH1qK4R+1o
         59hFpjRLmgJU/j5gl1bQ7wSkGM9/T/EGM4YdjepUr7yhttvX1HNJIbuxxxnPv/cmwSwf
         nVIO505HM+/Q/BtiKMSKw3FPiJHbcEpEn6emITugSQlo3Fz4raFe1zxxGmTB2XPzKTtZ
         +qiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791285268; x=1791890068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3mKE8/aG6YFx0Rzm0N6mZ6wjhkusQUNFNvey825JE78=;
        b=ErJiHopKTETzIi6K5AXQvkQAY+FZ1aRI8cyrLjEB8qZrCQSEGg+SDElwIolaX61cEg
         +PS024pN4XINbw1G4lT5N2/oFgpulJ4gFeQxKxb2LcGzOSVrE98rtwX2tSKTah3ZRIvE
         zfiQywabKqvlMoViwBT2ljrKnamH8t+P3s4wGryQj283MBlIPYqcfVbfWQgULn6C1mmC
         WFF7FVuCqbVHpIjlngmL79xfIVhDLlW+U4uAn4gEK/5xp6macAxgWSKVnLkbS+uk8Xh3
         78HQPc1RBh8U6UjBxf1hY/qxqXQSoPxlvYn8Uu9fTgl/CiYbrdgeRzyCZhvG25g+s4t3
         0H1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzueQ/LoNo38A7+T88QamtGf5vJWLmOnXGsRWwIRIg/ltJVZARVDiAbmywbY4W9eZbxltDrtthmd9nIb4e3@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8cAUyT28Ttt+nBiUQD21CNDxIVCZtDdyeM6g2Da4N1PeEph2T
	l4/seZcFeBeXWo5Vsf/BreyyCPHT1TAsE0rXz0yywX/hBcT4ASv5Hp43BnuI7VX20ecIu8n81rX
	1ZmJWZL1EcA+ytg4G+TWKWnkG40yYi/qiQoIme8gb3ZM5dDIhHKrRwcJgB+GYgl2ma0cx
X-Gm-Gg: AYBFou2svNM0Cqf7sVrA+TxOEaebYPqwdIPfX2me+5rpwMFZn8QQj2ZmjfI7DxZs2VZ
	ARU+nOG3+QzQtckgUR69Dqk5oNel8JbOpNb28MXuFNkx6O+6RmmzXGi0L2EHtJrWZdnnSfbV/1j
	Yb+ytraWuEAsNMPq58QXZUFqpq/RpKELpucdLiQF9W9R/qw5VtJglfRJn2KSTVzdyZer9i2YwYx
	YQ4x3kRdE6bhkwzI4Y2K95cOOtQ1eKcF2JevTI3IdeIhZppI8FDeMOQN5xv+KhnCQmNHSQWFw87
	rPmZDEIBlfQLvFHoaFQ7YZPYKBjF9tvJGUxPWpCXU8gV/0t2F6pYWr45PVf+KTm+oP7FAd0kzdC
	yQlCP1dujTDX5mQQ8rBrRfMujdKBeM2f0aA==
X-Received: by 2002:a17:90a:e7cf:b0:3a8:181a:2bfb with SMTP id 98e67ed59e1d1-3a873546726mr394111a91.23.1791285266973;
        Tue, 06 Oct 2026 04:14:26 -0700 (PDT)
X-Received: by 2002:a17:90a:e7cf:b0:3a8:181a:2bfb with SMTP id 98e67ed59e1d1-3a873546726mr394102a91.23.1791285266258;
        Tue, 06 Oct 2026 04:14:26 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cde769sm4306838a91.13.2026.10.06.04.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 04:14:25 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 16:44:03 +0530
Subject: [PATCH 1/2] dt-bindings: crypto: Adjust Shikra compatible
 hierarchy
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-shikra_qce_fix-v1-1-8ac54d81edb4@oss.qualcomm.com>
References: <20261006-shikra_qce_fix-v1-0-8ac54d81edb4@oss.qualcomm.com>
In-Reply-To: <20261006-shikra_qce_fix-v1-0-8ac54d81edb4@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=X5THu2Te c=1 sm=1 tr=0 ts=6ac4d815 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=DcSQVDPtFCqqlbpqkFgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA0NCBTYWx0ZWRfX0qWIxNYxHiVI
 hcpgCfSY6O5ILzhl/0gdUDF2l+4ngADnF2FvWqKcRqOGM6q06ZXQ+p0lYUSGCp9/WStIFWwmNl6
 g7G+bpx3rAMVqswxgac/aJBSx8FZXpw=
X-Proofpoint-GUID: btiU2RH7ZQptbuFbI6FxJgm9040V3dHF
X-Proofpoint-ORIG-GUID: btiU2RH7ZQptbuFbI6FxJgm9040V3dHF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA0NCBTYWx0ZWRfX1hThB3YV0b9E
 43g8yQwwXt37q4i9oW4eBQw597M8yiv2lJKhZNyjDt5yemR8/laGHwLS9KkHHxOYB7SzFrqjnQ+
 hvQe9AK0NIuH3vvIjqxYkZHkG3IPBjXKnkenT8/a4QpD1tUX8FFhL8f78pG92LvV6RLDGN9kBxf
 pjpE9bzRg8DvWHq800NREQTgGaX7gzfPExQ9hFeCSmw24xAoxM1EQHwg2vIjLpiT0WPdBoMCOps
 v5mnngJeTYnFnJbC0GmyURYp8X+DQ7j5ch0kR/FOXy7ngTcVHXMhRjvMSn4pVNJ+vqxEtkbdB2h
 yQdF1FdjEKIQjuDObzi19GNDloXcmUoxvm4j9nPGDeZLj254FnmnVqbOjEeizBdDNwKYhmXh026
 O3Uw96qnr8W8gpfPIji42jjy5G/H23umnhni5ukBk8ITSHsGHOYY0f2gUlTo5A8ETxIE9xM7c7d
 iTIy+QAazI1d2UmDy/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060044

Shikra reuses the same QCE integration as Agatti and should follow the
corresponding binding requirements too.

Move the Shikra compatible to the appropriate binding hierarchy
(matching qcom,qcm2290-qce) to reflect the underlying hardware
description.

Fixes: 45834ff95a6f ("dt-bindings: crypto: qcom-qce: Document the Shikra crypto engine")
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 5a653757ee75..fcf725bfa36b 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -39,6 +39,7 @@ properties:
               - qcom,msm8996-qce
               - qcom,qcm2290-qce
               - qcom,sdm845-qce
+              - qcom,shikra-qce
               - qcom,sm6115-qce
           - const: qcom,ipq4019-qce
           - const: qcom,qce
@@ -54,7 +55,6 @@ properties:
               - qcom,qcs8300-qce
               - qcom,sa8775p-qce
               - qcom,sc7280-qce
-              - qcom,shikra-qce
               - qcom,sm6350-qce
               - qcom,sm8250-qce
               - qcom,sm8350-qce
@@ -133,6 +133,7 @@ allOf:
           contains:
             enum:
               - qcom,qcm2290-qce
+              - qcom,shikra-qce
               - qcom,sm6115-qce
     then:
       properties:

-- 
2.34.1

