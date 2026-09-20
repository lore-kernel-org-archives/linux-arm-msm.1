Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC5030EF92
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 13:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789909716; cv=none; b=P7MiqGyOyUkqpxqH2ot/jIwmMBWGP+/Sx1eLoweah56SeAY+AxzYz9f+023zff9YJP2asEWPdEDFNVDnypHh6WK3qFbHofV99OqXNSpOJiIr3A7iG1WhrAzPYdZ3tfxWKeWKzkmFM/6kzD2r/vTieFKb8KGXIG1BSSmh9jfAg2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789909716; c=relaxed/simple;
	bh=ZIXgHM7PiqRYHQkQOzZqHLX9M4bZPIUL90nLso2dV24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gwhym1Ynn1Keh1pLzpHR9ezUv78B8Z4Ay6rrufEtU1LkDRngJoH7ifPF3RiPGFQfYGDO7j1qJm4qby/54KNCHYQ1aTq3TRMsNSmE4g2IVZJdWiAG4/UPOQguzOx32fZOlkwlzmS1fvwOo4QAeix/LGLb0F2IhHk3BLOXa/kWvLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IQowgj2S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UHq8fa8P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IQowgj2S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UHq8fa8P"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBnv1E1572200
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 13:08:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+fWQ93GWSWlpqI9jaUvjBtkH
	zf6rpJ3Yfwxd9B7T2oU=; b=IQowgj2SLqfFWsacIlxcY0XUvAq/uKUiH/jFfU8d
	BUZb+3AVcMyKBHGvPBKcdlT5uF08XadbMbwHpoo/RJIDMq7G195IJjhSDemAY/m+
	xrJXJlDefKRjTbp6JOuonrSK5C6oyCcusOGPoS6hs+uz0Km7WkDGtzTLWvWkmuGr
	6jVKlUgwC/SJ0aGi/slNmoLdBHp9SYp03Fm6gWSKdnAsWr68VsOtX3Vwj4t43NZW
	HFPEb6yRzbp5r7YYOCLyylki4/Dykx/j+gA0/0mgRuW3z+9S1JckLeG7npnr/Ssk
	qfhc8s7Di+WM0VLH4TL8PKeYCbcHdtUu9y6G+nC+iShj3g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gskp9tvf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 13:08:32 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39b6416441eso3771318a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 06:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789909712; x=1790514512; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+fWQ93GWSWlpqI9jaUvjBtkHzf6rpJ3Yfwxd9B7T2oU=;
        b=UHq8fa8Pz0XL4Ykv2Pk142BeTpYyrSvZIolyH7W+bcIb7JW5+b9e6HwPhROzIsnUTg
         7H9Colaw1qxpHIlr1F5fcOilo3Vhap5tjYUoV4Ujwwt5hhkPZ154qVecHHcja9ptDVA5
         FUcDGLXBYu9yRhSj1vpPB/qSDbCZCto7Dd2yLPq1j77vXsIU4iaJiTkDNSjxU+FZvfdu
         JMkQQ0g0xFipGD1IFt7AarcafxZ9HCSkQYjgfL2HbKiOBeilO21KP4/R4Unwda1lAXu8
         3P4REj2IZfrVvYj/ZgzRAg7ivjhrDB3Ym99mU7FUr7jLInuhxnp/kXZvV5bQg1GIxCrz
         VHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789909712; x=1790514512;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+fWQ93GWSWlpqI9jaUvjBtkHzf6rpJ3Yfwxd9B7T2oU=;
        b=b4lOIYlq70i8fBlxLXy5Fdc89Jr8IFBtnIa5o3vEEXMo3rSGNxcb0rLFLFLrWb0QDD
         TgMBPX7QI7pQcEFRIyiX271r5bcWs6S3yaRpSwRaJ4dFb4AAkOnFvjUFGirmsWqq7T++
         YMYnuJu0oCXI0+V0ZRWPCKmwaZ819Pa94JDTZMVXm2C9KzX2vURW9G7w1zuhTIj+/Ydu
         vrM8K1a2MqZYRns+aa+IHdKmEiTZU3CJRJvCc9o3brUOq03wYuhQjmjrdKs77zb0YeQJ
         73SizcBurNPYV+654dRLR3I0eGE4kb87DWGE3FppQ0QJz4kjzOw+Wzpx/q9i02ilUzX/
         6w2A==
X-Forwarded-Encrypted: i=1; AKwUvBxGYwfk7vq1oR5feiFPNyRZH2cDUn50V7QolyUVeMzpuZnUipICNs/Jz5DAKK4rfgvUePLLtnyx8Av8AHdF@vger.kernel.org
X-Gm-Message-State: AFuF++kKlPOhG6s1dZYeLBKmZlkmMXnVsKxbBxQKo8NE9cZyNO9SKcGf
	SgD47uLtk4ECnbLza4nF7+aXDp6HVYTTHgaAe/dZYC//GBQ53iZB34o+FgPSGdqmLM7A8xM9DnB
	NE1cplHpiy04zyvHtUjZ40ERYGezRcnhs+Fvr05q5GIQvgA29zCF4dB8ov4Wbh0twG9vy
X-Gm-Gg: AYBFou27dfMVTJpqG1Tw3eEQoDb7fBzPLio0qR/eDVdaPFiSTxYSv/ow0HaBH1BvMGQ
	ZBd2mGh+AFbGII8/wI37EhHk9iRlyjeiiZvQinTi84lK2rTp+wQDaml7c8b8ouwQwrz55iy4UGY
	+CDR/EeCLX5bsDlTNltyq3Ue3i84B48PAmFtzMCVJ6VsZXj4pa+aOCrV40DYAeFR5PaHpdiUwkz
	Z/Ufau6ikYNQoH6bn0m04iTWrD7KsMWhDr5CzAVto+YF6Pgk87pDu8QeEyx42czpETCcokdmj0Q
	o3+sqg9rR/A82Y6tibrCWgRu0RdL2TQZ+bP0mAQ7HjN/CbGj+MRBBqXokQpQs0YliiglI8LXLQ9
	PirpAVjnfrnhtXHv9g8d5reVr8fxwyujf0uiTr2EJ854=
X-Received: by 2002:a17:90b:534d:b0:39e:6c68:c77c with SMTP id 98e67ed59e1d1-39e6c68cad0mr6358929a91.50.1789909711597;
        Sun, 20 Sep 2026 06:08:31 -0700 (PDT)
X-Received: by 2002:a17:90b:534d:b0:39e:6c68:c77c with SMTP id 98e67ed59e1d1-39e6c68cad0mr6358903a91.50.1789909711121;
        Sun, 20 Sep 2026 06:08:31 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144e16a7f71sm2602239c88.8.2026.09.20.06.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 06:08:30 -0700 (PDT)
Date: Sun, 20 Sep 2026 21:08:24 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: media: qcom,nord-iris: Add nord video
 codec
Message-ID: <aq_ayLVdWc1Mt0Wu@QCOM-aGQu4IUr3Y>
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
 <20260919-nord-iris-v1-1-94428761ec06@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919-nord-iris-v1-1-94428761ec06@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: NknCVP2yNxdJKdhKvnJRytq1g04fQoJg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDE5MCBTYWx0ZWRfXzeYfvHlEXFbh
 4vlyUyYyowg6k/SZleNdf9W+LYqV4BTOQg0vWEqJgCNom6CdcIKyJklFEt3vveE1m+xSA0YQDln
 jv8Q/RyFkYV0bttJFiOnGnu2q+Cy8npSPq1mC7y9L6DV6iq+x44wZ7XSys4UDCiaxGSTAl/q4CE
 lFFlaR4MlZMnmEvajszG7hqvyZb6EI4rbsHnL3gh4owzKZt/Bc1ndaf6mIMSh07XDewX808m5VH
 kSh5wpJhNJMrj95qIsmAh/0V3qGHvEvl6Yca76TM24+66HKulvSiGM3OaPLTJ4qTCNxNEvhz/4C
 UMCnbdKxD3/4ybKaVBJ3EDqKQ1O/174FNpejjUaQzq0UE1s+C3UUO7J3ODARiT1nknxz6gWp/cN
 UpcPf/PaJRhnBD01NgsOI7dGUWv7XKCKdBvB88+KqbYFHZ/oza2B95EpUQz70yU3jjdsFZxvKYU
 aS54YZRdd+M83/GW+KQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDE5MCBTYWx0ZWRfX9Ve6ejTHd0/H
 hHatcf252M16EfXnlz01mhP82fbn38Eacuhpqg1lGqiWady/x26yVUQNi9R5ora5En1SNR+y5RQ
 91/heP9Ul/HlWA71QwgaqYBr5yHXj9Q=
X-Authority-Analysis: v=2.4 cv=BKAmP1QG c=1 sm=1 tr=0 ts=6aafdad0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=bt1g-dDAHYZoXwUorAEA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: NknCVP2yNxdJKdhKvnJRytq1g04fQoJg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200190

On Sat, Sep 19, 2026 at 10:14:55AM +0530, Vishnu Reddy wrote:
> The nord platform uses the same dual-core iris video codec hardware as
> glymur, with matching clocks and power domains. Add a qcom,nord-iris
> compatible string that falls back to qcom,glymur-iris, allowing nord to
> reuse the existing glymur iris devicetree schema.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
> index de4792f3b658..558b85ef9ea0 100644
> --- a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
> @@ -15,7 +15,11 @@ description:
>  
>  properties:
>    compatible:
> -    const: qcom,glymur-iris
> +    oneOf:
> +      - items:
> +          - const: qcom,nord-iris
> +          - const: qcom,glymur-iris
> +      - const: qcom,glymur-iris

It might be a problem of prerequisite change instead of this patch
itself. But I'm seeing a CHECK_DTBS issue here.

Documentation/devicetree/bindings/media/qcom,venus-common.yaml: iommu-ranges: missing type definition
  DTC [C] arch/arm64/boot/dts/qcom/nord-ride-embedded.dtb
out/arch/arm64/boot/dts/qcom/nord-ride-embedded.dtb: video-codec@aa00000 (qcom,nord-iris): non-pixel:iommu-ranges: [629145600, 3663724544] is too long
        from schema $id: http://devicetree.org/schemas/media/qcom,glymur-iris.yaml
out/arch/arm64/boot/dts/qcom/nord-ride-embedded.dtb: video-codec@aa00000 (qcom,nord-iris): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dma-ranges', 'firmware-name', 'interrupts', 'memory-region', 'pixel', 'reg' were unexpected)
        from schema $id: http://devicetree.org/schemas/media/qcom,glymur-iris.yaml

Shawn

>  
>    clocks:
>      maxItems: 9
> 
> -- 
> 2.34.1
> 
> 
