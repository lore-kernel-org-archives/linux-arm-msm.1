Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FA43BED2D
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 07:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784187907; cv=none; b=Y2MLOPYcH5owASJq8P1WmuZn8WJXP2/wGSflii/IFTBUXH9W+CZzP0uXR71Zg5X1YEpnz80m+yMqTMfC6Np9NLePcMSDRTRTWDr4GM4yr0BUs6jQSTWFNs6FQyz5OCbJQ0NMZsWmgNIorIrnNyZfqxpQEDVhTOqo74pJdFyJaUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784187907; c=relaxed/simple;
	bh=WFkoATWlYCc7bvJGZ9OZ5oGcqGoyYWfN/F2kt/MqMWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eAWoi51UkJQVNr604kvZHfKrslFq0eDWtkvurBSBBDfR4T5Jry5YIKs9ltXp68EdyioDCy6NwUhgZvgQRZxe9AIPY7D+p60GlZ0FRO3uWm195BR2SFUSvJXIaDtgZX+uJ8J6eGJEinygX/BcyhkOIJHpYXUgtrhgOwWYu+HGe1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CgJ10oIO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bv/duN2g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CgJ10oIO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bv/duN2g"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7DTQ41994799
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 07:45:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vP4P2MRDhAa/J8SMjgLk08z1
	ZJ8mhkaQZHZh+HHsFC0=; b=CgJ10oIOBJfaJZuHFFjb9GHESyQoJ00doLflwBvT
	jM0h6giZo3sapagZIN8+TxgJwQAWy92H99tbu2Abn4GayWGl4IUyQWq6o5xyXOqc
	CEnb58Ynl7jpBTweIeq0pXcCpwkCeNLFObGVHjWgTE903JMIIwixlFepku58soi/
	WnwekJxYAj4mo5NPCXZwleXa2CfHJpPZ13H1mQQgviU7hRhfSFTuTobmtXQVOkaw
	4nTbP+s3+F1iaGgCwXoEKsN4U7DfOptIPUmflo2fLycHSKNfWVMNzJVz3l+eu3wR
	Sz9kjddJOAHbcelw9gORqDg56DY6h6jXXX67gbLyrR+iBQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feefqjmsf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 07:45:05 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88cfe287e1so2958905a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 00:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784187904; x=1784792704; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vP4P2MRDhAa/J8SMjgLk08z1ZJ8mhkaQZHZh+HHsFC0=;
        b=bv/duN2gItqjC6NNOGilk4ugusb6XiXAUMcciZio11t+LBr0BrtaqI4GgSkUYNjvAl
         OQM4Tib9kOZbmA51fgdmVLX9/gyZBBNN4r1SwMzO2QkQJGxUsxoCYkVZIxS+BlyFwoql
         tz73fZJOmeEUi6MiAzYzEquHcA4mN508rU6f4ZnYN7PbKWwFcyltL5PDjxPQ/kVtyRIc
         Ku3h/6vqf3/YiJ3rIj0J5K4s7B8Foo8JlJ1yPb0TpxzFvNY0WuQU1mqA04EY0Sp9bKgt
         l/nFlRmzAmBa0/bnC1QGUXDeFpp6aMLSiLGlqcMnv1k0t+4KOBjMH8Gi4Idca8O0hGUX
         Jlgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784187904; x=1784792704;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vP4P2MRDhAa/J8SMjgLk08z1ZJ8mhkaQZHZh+HHsFC0=;
        b=caJUnyt56P39oKgGX8GyViHtVVXUnEN7jAYTuhtJq5DC2MLpT8XUE3BEeDUCdQjeQq
         JtVFRE32AVjfp3Lkdodf9vCz1cWsQ1owa3YTpSvptWzQsgtQ/WnH9KhIhht/d2xqfN0g
         DWiE5+NXUb4M8S7+Txq27Oh9VQ7iKaKcAczrlVKA86nzoq1imeJg/Sy7RvaNKsZ3S6bk
         Ng6jTzRcXZTu5uYFT/jaNVKEqdX5BBh8JeWrBgq6545A8RamiYMCwy/B9iMjcYAzuBd2
         ccfbGd+3tdbu8InD4P/AMdrnOVuWnZ2Dmyz5yNLCS20cm9JhBNpK1bg4EHe2lsBcUnlR
         +rPQ==
X-Forwarded-Encrypted: i=1; AHgh+RoDxzlA0IetZnKVWDcDn3ONkFOM+L1FoFmm2isQsraz+fyszFHekyhAzzR23FdBlXkyWxzJbvCqndzj6os/@vger.kernel.org
X-Gm-Message-State: AOJu0YxOsGdIaLpg/xM8fQqiah8+49FrvpjyD3DF1Ijwxv8jjyAyZzb5
	oeKIsbTvzYMqbIYqbf/K47bC5H5AmS//ew3ASjYPagUA+Jnyn4QXJmzDi1sU23+2jDeDFKCz7aY
	TYCTHBI4aOAT9CxJoyDTRdaR7vtrE0VoNM6WdThq0Ai4XX9SQnwhPRs6xNaPG50z7dOCP/rOBf/
	Fs
X-Gm-Gg: AfdE7cn+oUUK93aW7sxt3laeSE5GSpF1dhk8CYGfjtuAAzEu8eDzihZy15/nHaQ1x2X
	rP+N/CLi9u0vtvl4QtJ0ikdXJXpW0GpEWosUvYx8XvoR0lNqlDqixIP7F0t5/9z2Szind8iRvPC
	Yn2R8Gss8LUnVlC/xhOKS/67v24gfP26x0ao0u9WPIAmmOishyuU/6U3Aiy/DC2OE78yDR5Sz7Y
	WAqGqqLS94qE679SOqdnR8AAoGBAjJmnITN6JkW9HDceSadnkzq9OjXZXCau11Al/rs4bM57arc
	zYwQiZqPuo0S90+5py28hU+pUU+f6/JquG5ponNx8mmbZjAhImFhpObnZcYCk2eD1rvYA4w4pU1
	XGVIKDoOCWnBTlJQUoY1kAJd5i74=
X-Received: by 2002:a05:6a21:510:b0:3bf:6c08:2b2b with SMTP id adf61e73a8af0-3c110b6e0a7mr23007933637.51.1784187904166;
        Thu, 16 Jul 2026 00:45:04 -0700 (PDT)
X-Received: by 2002:a05:6a21:510:b0:3bf:6c08:2b2b with SMTP id adf61e73a8af0-3c110b6e0a7mr23007904637.51.1784187903601;
        Thu, 16 Jul 2026 00:45:03 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd4359166sm8015776c88.14.2026.07.16.00.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 00:45:03 -0700 (PDT)
Date: Thu, 16 Jul 2026 13:14:57 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: qcom,tcsr: Add compatible for Shikra
Message-ID: <20260716074457.72hpdvqbqsphro2u@hu-mojha-hyd.qualcomm.com>
References: <20260501-shikra-tcsr-binding-v1-1-0c136d193634@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501-shikra-tcsr-binding-v1-1-0c136d193634@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=APNfGQ4N c=1 sm=1 tr=0 ts=6a588c01 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=En0k0xXHmbUGYgfYSFQA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA3OCBTYWx0ZWRfX3uu/4qmNxhBd
 lpLmyIFNQAUba70tDBwu9Crom/YNvTH9bbUN8NfHXerQC/lpfGAZQorA2SVxs8LpFp8W5Lyqetn
 E8214cpPVlUERIr8WOknhgPFxrHgYbk=
X-Proofpoint-ORIG-GUID: 47ca7bJX-R_dr97gDI-4Wwkmm6jFyUc3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA3OCBTYWx0ZWRfXzLycUBd9OrfM
 gi+ZWLCj4MGnB94cT8L0tv8Lrchj/rdi92zetKkmS9ZJx12lWnBeuJA/z4uo/Nm9eUMDBNNE5st
 D5YoeCbt0cBTw1VCeivntCKFNbFPCteG6hSDgS3lmO6bCW77nkm7nOWdMvgD+T6jxDaPgBnXcJc
 6zwjYyzCKNxs2MTd0fFw9pivqJjMwXELrBiL+68TOnnTHLaLZSD+ElfLcAvBnT6kBD96BqsP3AV
 NcyChzVlJI7IsD9VA3uM045kUJ8Ra1SACNznD3Kyh2gFrr3aQB0n+Xtm4CRT6zZcV8h4mPU0xR5
 ++MWygSi4mfWGdPRxZ68X9fGCNHJ0K17n8ZoLXcUnOkX0Jz8MlSZSaFMco8Chw+TUg7/Arwm0YF
 CiBtA7JKfYM3D4Off2N9LbWqyaMRCtRQ0c1dycteH+JmyMoroQ5/H3N7Ua1V4dXJvlb/MoeFhJZ
 izT86nv2yFgrjUvfP5w==
X-Proofpoint-GUID: 47ca7bJX-R_dr97gDI-4Wwkmm6jFyUc3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160078

On Fri, May 01, 2026 at 11:31:17PM +0530, Komal Bajaj wrote:
> Document the qcom,shikra-tcsr compatible.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
> index 14ae3f00ef7e..51d0dcab5706 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
> +++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
> @@ -33,6 +33,7 @@ properties:
>            - qcom,sdx55-tcsr
>            - qcom,sdx65-tcsr
>            - qcom,sdx75-tcsr
> +          - qcom,shikra-tcsr
>            - qcom,sm4450-tcsr
>            - qcom,sm6115-tcsr
>            - qcom,sm8150-tcsr
> 
> ---
> base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
> change-id: 20260501-shikra-tcsr-binding-fff1689e4097

This change still applies on Linux-next. I see, this compatible  shows as
undocumented there.

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
