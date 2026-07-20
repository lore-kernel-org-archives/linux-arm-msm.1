Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE98D3B27FA
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 20:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784577828; cv=none; b=plUCF4Y4Fy2ext1VXZ7xqveBFc4bPRRQxLQG3mY4GuCnJurQygQRmYxc3dS6yPHgtpH//YIawWnZ1F1edUTdh97W4ZyUfiuvvHGkskgSLu8oyh6lKBVXbteIIqYk9JyscLNDeWj65ob7G3ts3ECcYwL9gsAr7U9cfNqQ9bhco8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784577828; c=relaxed/simple;
	bh=vO/oHDtiBeK08zj99SdGvx+O+AqtAveazytcmdamWNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L+UYiaZpAd9yL4BAiotcT1otxkSAWBjTiW2FdA1KQrbFmgfmDT8kxgXd2SCch+iSFvIEpr+TT+yKMc65wGD2kN6slK+MpfFIKt4kESXxEBpaIlJUI7RhSLQoXwWDkPj87J0mjFtTloIagoQ+FYGYFPZ2cPTjOtKLWKG/Q4xnwGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U8+9F8Za; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E6rJ/12R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U8+9F8Za";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E6rJ/12R"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KJTNm13752617
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 20:03:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zqOluQK39isveZavwoVq1wksiLK91zYzzkBRNEfjOpM=; b=U8+9F8ZauaXSKAKV
	09HkI1bnYwNsdI7bdnYTPPm/mxMMDE2lkCUBCCBA/2juPasq6ypYauSGhj260u+k
	Y0az3kIc30HeDNc5ddbVD+fzpQMlQPy16Ss/i1B5xMYGsSqzotOlOgauuhnVC7Le
	V/bR87/J11YrRY2JDYYwoWS0ckadKvEmHZHnbAHtT6rGaSKaRVGkXe8x+bCKCk1D
	PsWeBMgzV1LTOeZnCJJ7jsEIDYDZFQ0o3KC3diYVGaDpw1Wxpu18P0C8AigDnSoy
	HuGWEGqvHiwKNYUFlaRWZNZkCuYrQrLN4dPIUEDGEgkowjYuoK5WpvYyDi+oht8O
	jIJ+GQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv5rpp9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 20:03:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d7886cdso97342861cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 13:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784577825; x=1785182625; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zqOluQK39isveZavwoVq1wksiLK91zYzzkBRNEfjOpM=;
        b=E6rJ/12RhVu28SzXq1jncVWQH7kwyoeGm7l/pXfpSolw7Rh0Wd6ytom33MshXmfkwe
         zAW+D/ySq0JMz4QFUdBHs1HhYQRYaiSEAxnGf/7GUBZln1DY3u0VloQUuc9FT7XTY6Fr
         mq7YqYOdsr7lpSVw2ypaolrFkejjemA0ITkxOCMxkOSQz/07252BsZc5ahPqvQlja+JW
         ERGuz212/z1DVky95UsMa+9IQTpq4ke/CC/Cg1A1fp/aM9zKugRBZVhAkTch7FSHsqee
         7MVU7txZFQ96WHgE/UPnHoXitc5pn6M0TraxCI9EF1oi/zg5KiuOrvOKYYGMlExDVGHv
         4I8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784577825; x=1785182625;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zqOluQK39isveZavwoVq1wksiLK91zYzzkBRNEfjOpM=;
        b=Cu5fgHmMLyjA3mYWbIqNo5HJNNk09KRReOqI//vYfHrMUkatto7S0wXx+M72T/cCM+
         g9T/8X44B7oBELvu67dbsJhkuHcJ8D0rb4k6WNTIS576zqejbn4pP4+qEWlhd/zluAx/
         PlG58MRZlJ0z/wz/pyqgnUDm4XgUFu64zjiCnv6lwVcuoGePPxE3cQ7qY70mTSvasRCG
         Ix4McCsU9LZ1fjryTLMyUWXfEVQg4sDtMc/jnB4+gcgoaDEiIiYlhs4qQ1YkTYpRKENe
         YEXvqizAwdUnAHOTSWibD4x2M4jBzgFfSx8Tx+pJmYL9TAp2n0Tm9bT+juKYYmFf91uF
         mlxg==
X-Forwarded-Encrypted: i=1; AHgh+RrfxDgJR6TBz/pvkDLF/NtvCjrX8KULdwWuKpLWi1NH1gczBMix3oXzrw9eoCLFPbJcbiv1KMi2es0Nw7wJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzAq4c2f1OVXy/6vEJordWzf1CV9XVHaDCOD5TbW6n3hpSbtxpa
	TZs/aDrr0WU1PWeX60SGUyH+UPSVUBSOKGoXvp+pBIIoQyYYh3ImIHikHxwKqOI734m018jIYfj
	/ip35BtR8na3SwLRIpl29RgUZ8Y8pd3g2k3iSi3hBDh0XbFBwSFaKkaKfbhvcPaCEQrTQ
X-Gm-Gg: AfdE7claAl0Bt4LvCu9b1QPOI8jm1ikPJvvDDv/rl29DggfsdMjmCPyttyS+Lp3xZqM
	xt0cxbN5ci3m1u2QexAh25VkAyJeiZ/bsZjuYgsw6KidHIdcpB9l35xXnQge2AEd3uxMNyN7C3m
	mcO2oPAdUKxDQOdB5+qDcKhdUhvY5DkflIcOgL/169R8K/2hQJd66s0BCrdY41mSgQK48a036F3
	TJ5OvKrqncyJ2cvHuGfRFjxz/1Vch7X0KFXVf4xxG4Kq/coLNIEfxWJTLOxlxicbh191v8dXCHI
	TEac/nYVFzxtnk2UnhU26O1cpqFNXlVasWkxv/YyoqenRUegtWbgTzNT6PimKURGsYbMQ1lYX4O
	OH/nzMDfID8uiLiAbpS7z+WAdR7H4Sg==
X-Received: by 2002:a05:622a:11d3:b0:517:7188:c47a with SMTP id d75a77b69052e-5213a383d99mr155225041cf.2.1784577825112;
        Mon, 20 Jul 2026 13:03:45 -0700 (PDT)
X-Received: by 2002:a05:622a:11d3:b0:517:7188:c47a with SMTP id d75a77b69052e-5213a383d99mr155224681cf.2.1784577824676;
        Mon, 20 Jul 2026 13:03:44 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f6980582csm25074273f8f.13.2026.07.20.13.03.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 13:03:43 -0700 (PDT)
Message-ID: <86d72cb4-ec52-457b-a175-a7123e341b32@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 22:03:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] dt-bindings: arm: qcom-soc: Validate nodes with
 fallbacks
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260707-dt-bindings-qcom-soc-naming-v2-0-1b7d695be2e1@oss.qualcomm.com>
 <20260707-dt-bindings-qcom-soc-naming-v2-3-1b7d695be2e1@oss.qualcomm.com>
 <20260716211439.GA1290290-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260716211439.GA1290290-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDIxOSBTYWx0ZWRfX3F4cxiZLRWx1
 4l/GeH9mWStrMG+x4mDr1NQVqD6/OOPQ78DOo6/u1tEu3ffHAh7hk3Lt9lz40A0wPUFrt4PNZx4
 L46yBrYdioCld4pQMjNRt7K6HICWiGhxzAo99xpYsl0KW4fOHkz/DUHOnegxjgFHLSXgvor5QfG
 sktRfLOTW2uO7IykjUSVDzkDtMVJd9XAbNziI7X/NiW8NH7zwU8jNlL1d9Gv8svjzr0e98wpYnT
 L040EpNOPlgZ7rphCkY8KygcgumfoF/7f5dSvym6ypaeI73YQodilkbH/vo+VKi8ZWlk1TEAeDh
 upcCLnHqcLQbukM6jU0jkpBOiZMbYPVwgyFKCdki2xkjoqYxo1NsM3t8Jipl8VrKETPVbobhT+x
 jagcWD7SCKobAzxhdfgNzdvsbsJNvm4qkghtzrSEhI9gEgucWQj3oWxkUtSirKFRHz/X0SyVzhL
 QVJ5KVi/QkoEvLSIotA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDIxOSBTYWx0ZWRfXzv9RKlmVKaRn
 qr1WSfO2Qr7abdqBW6CGzcYir3g9sgK+9GWzNuJepygWMVnj48CeFY8MF6EzDvvkOqwgvJETuoj
 ex1ePzZyxOXijuGyzQibqAg7mbrilL8=
X-Authority-Analysis: v=2.4 cv=WNpPmHsR c=1 sm=1 tr=0 ts=6a5e7f22 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=qU11fmIgajKyYpnEY5wA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: uGze5RfHv-XznEclniAWbAqq4UjDHPQq
X-Proofpoint-ORIG-GUID: uGze5RfHv-XznEclniAWbAqq4UjDHPQq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_05,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200219

On 16/07/2026 23:14, Rob Herring wrote:
>> +            - qcom,smmu-500
>> +            - qcom,smmu-v2
>> +            - qcom,snps-dwc3
>> +            - qcom,ssc-block-bus
>> +            - qcom,tcsr-mutex
>> +            - qcom,trng
>> +            - qcom,tsens-v0_1
>> +            - qcom,tsens-v1
>> +            - qcom,tsens-v2
>> +            - qcom,ufshc
>> +            - qcom,usb-hs-phy
>> +            - qcom,usb-hsic-phy
>> +            - qcom,usb-snps-hs-5nm-phy
>> +            - qcom,usb-snps-hs-7nm-phy
>> +            - simple-mfd
>> +            - snps,dwmac
>> +            - syscon
> 
> You lost me here... 
> 
> This all looks pretty unmaintainable. Perhaps you should give up on old 
> SoCs and only do something on new(er) ones:

Yeah, I think I over complicated this.

> 
> select:
>   properties:
>     compatible:
>       contains:
>         pattern: '^qcom,'
> 
> allOf:
>   - if:
>       properties:
>         compatible:
>           contains:
>             pattern: '^qcom,.+foosoc'
>     then:
>       properties:
>         compatible:
>           contains:
>             pattern: '^qcom,foosoc'

This seems to work well, I'll try more, thanks!


Best regards,
Krzysztof
