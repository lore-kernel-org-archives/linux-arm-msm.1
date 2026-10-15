Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9654C041B
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061248; cv=none; b=Raeq77wmS0SkGIJSwEC883/cxiFp6a7xNIQzIKpK1NzPYqnRVedCK5Gqac9KsLnIIZTAnHEtKvNWvio+1JnxOxzzT5XWjM9Ydl66ki1KnUqjwILqQAdzj+0TJ/BL7cjj8fp6ltDge7BOzumZ8OZ0vpDvDHNvQjrlIU0mHvsal8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061248; c=relaxed/simple;
	bh=/TlcWZyr7cUD7Hmg77PL4GmJr7p0uBkeFjaHBxuOZoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eIoSy8LV9QgK3wfcxKvACUDZ4Qi7nO+e1phpcterT2FJcAxBTFAl81fwszIlewfF0RTIK60mVXqop/V5GKEJVrfqXrjlxH7NnKW5gUq4whKcB78EW0IIzM+vbAbCuaSn4yOTPVvGAhFNH8Ox4iLqGHFUnU8cX67ToLUmNRFdtPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iYS7XCkR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GPnVjWRH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iYS7XCkR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GPnVjWRH"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jSaZ2662650
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	80/kA9beZNU0ILkYW4k6rBi5XEHbzEFFell3QuipJow=; b=iYS7XCkRNFlgvj81
	3oom2Lg7Wt/XoDNjXFjWoBMBVzK0aBw/0zLWP8q6zqGXh/Qzpg80VuaqvxzAuXWp
	vT0Ff3CQbtLzDcvsMYKk9ei6BrsuFDEka26R33RcBApWN4b+Y0GL5fgF5ElEYuOf
	LbgMAORUWIPzwln5m0U/Lg4ahQhTNdcoazYgmzmd8oJPOERt0W42lkz3hw8sWWGg
	zrNA2NprUL5eEbeekzK1ZeXzkmcTZa8k0sPTB4uagFtV+r0YkltrcqE4eWb6FTxE
	Gz93HEdtE+89fID0JY1UjXLvYNPHnby5OKa+wCJf+u278z1jJoKI2/FbkPfHUGhB
	LpzYBg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqda1m8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:47:25 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917ad3b42eeso12830426d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 03:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792061245; x=1792666045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=80/kA9beZNU0ILkYW4k6rBi5XEHbzEFFell3QuipJow=;
        b=GPnVjWRHJiswlKANnvFq+PG0CO1FQy8QamCb4mLboV+ro4mhF3sX9/jrBUF94r9OQi
         eAYYLzsV7xEpUjrJT21IhlDaYl5vdPYYAXeCrC5AFwrfx80eli9L0rtAxzOn/CSqiC8I
         TiwA5JogfrYqnLLPUz3/dbHFsxYtsY8yZ31WD7Unk0aPAgMdv3Jnyk7DoCnBnQ9lumac
         G0VDh2VUlVFXallVpK/oJPxpbNV4GxDk5pAGK97dnp9zIFGLVE/uRNVQOfjRu/BHXNrB
         BxqYl6wPIRvwt0wShzq/jPz95Hoj0DTwyTmOxY2J3M8t7EDS8I/vCxstKngocIjxzdWN
         TuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061245; x=1792666045;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=80/kA9beZNU0ILkYW4k6rBi5XEHbzEFFell3QuipJow=;
        b=d2okba2P9OfO1V1Qh5rDjL0wy/6RZqasYah37nwUgr8hsj2cv3JS1yduNsyPuRRvSr
         360uCGfDrZP44hwGBn4BstCQ1miuN8lm2fLEA44ecIprzV1z4xEswqFHPJJHFbtKUDa5
         wZZ82aWjcSfITGthi1TLEkGKt2+64Y1sm/uWP79r67whLW42g/bxH4lmwFD9DDz6/SKc
         F0BkkIC9rZJF40HI9yXPwe856/IeyBUjNAZg6cLqfaMhP0KwxF1hjixiAtBP0yJ5DW53
         7+CrmtAdf43FzrcUix5MxV5ug7CAzFqcVzTLrC0cy+0ue86VZkJfLgcxvhgFjie8tT75
         4BiA==
X-Forwarded-Encrypted: i=1; AKwUvByxSX88+nDrUklSjxCX9fF8xDbfk+eXIvYmAP3c+SINMoOMJqKKaMl40FKgKODaWNXR030wdJ1l5fsrWLpS@vger.kernel.org
X-Gm-Message-State: AFq9FYKda4EMn13uXWVj4GKcqWrVKuXK52qXcgiyWeBBGluClUzLKtmA
	4G88UVK+B1I+okhDgIEojwg+jhleAou0HQTncgBB+hV3VUfBG9a2PAcQ97dPDi2S55gp4GtYVT+
	Ofn457v59gnuMUot+5+4fM9YAWzlj/chpgTp50teMKOcN/doM6fEzYuD/w9MTZNqjqDJ5
X-Gm-Gg: AYBFou2L8Df6NhYmQh7SyTbVlgXAStDZug/vj0wtrsfgj6MJuJ8S2FkeKIGobXjrP3n
	kjyAaY9+Y/Cuvof1geABefQDzO9TlGbp20OwndnzuhIzdV7s8sx2VImPrlBLaNtSObLSrzOOKtG
	SLvm8RGUlMxGkdoaG+K7sHHLiiJObqK2amT721zXo5WU640vUExugIsBsep5Dm0d1D/99iNelZi
	LXVl6AHzMsMeOES1e/XUC7XQkUsoZl/2tPo5cv6OVDeUOmfB81ngQgEipvh+qepr8OqZoikC+JX
	jx+YMbOHolQRAXwuV6Cn7wkzomHqFv6pBn9uoHvlwTdRXuxMO2JaNG47ky5pZy/5eB8+Ib45Atk
	OZWbflUdLUzNIxGECRg/WzA==
X-Received: by 2002:a05:620a:2b86:b0:93d:9dbe:5bec with SMTP id af79cd13be357-93ebd10b418mr3142479685a.2.1792061244806;
        Thu, 15 Oct 2026 03:47:24 -0700 (PDT)
X-Received: by 2002:a05:620a:2b86:b0:93d:9dbe:5bec with SMTP id af79cd13be357-93ebd10b418mr3142476385a.2.1792061244306;
        Thu, 15 Oct 2026 03:47:24 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed9b3f0c3sm107970166b.44.2026.10.15.03.47.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:47:22 -0700 (PDT)
Message-ID: <94172269-ba5b-46af-b31d-35a314bc0a68@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:47:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] arm64: dts: qcom: sm6350-lena: Add qcom,rmtfs-mem
 node
To: erebion <erebion@erebion.eu>, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260926-pdx213-upstream-3-v2-0-b4612e3eb536@erebion.eu>
 <20260926-pdx213-upstream-3-v2-2-b4612e3eb536@erebion.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-pdx213-upstream-3-v2-2-b4612e3eb536@erebion.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MiBTYWx0ZWRfX8uuY+tu1hkdw
 sm4xUbVwrrL3IN7blEgCWRDczDLr8Bc7E4xtVkGPLkoaZxkRK8Le0Yk6oC2zO94yfsOpApWhEcd
 N/kQ6wvMUMsbybkCDvgfZztiBYKHTjY=
X-Authority-Analysis: v=2.4 cv=K9u3jCWI c=1 sm=1 tr=0 ts=6ad0af3d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=JgZe5hknAAAA:8 a=jVuTDJxxa8O3WlNxpk0A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=ODtDA1adfiiB3BH7YLNA:22
X-Proofpoint-GUID: 8o_GuF3dyhJGXhY09JLEFho6fIuPaB01
X-Proofpoint-ORIG-GUID: 8o_GuF3dyhJGXhY09JLEFho6fIuPaB01
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MiBTYWx0ZWRfX/Y9b809VNzPH
 ke2keOdrSvlw5MZ748aZ4hSrZfzDww93okJy6cn24yxPMno7PwNa5ya0G1wJLXvze2qZ83D+A9l
 McT3rlGILYohvvTvE0QNQNsWS7wNKfBlXzC9+PR+1Zq07CnybO5MC3xDkBSoM0b9xTy38VFlz+m
 NhPNtFfdk8eIe8HUYzamWb0yK+ulKjMJaJSd2e3AKCdb1EJ2vwAV2MKvbaDk4xosPi+0Q5k97sK
 uhlRplzkACa1tDifHkJ6cdFZGY/31oS0yJYAcr9NpU7B70KFnYYhVRpFGRp5RHOmFqNNSnuehOw
 jl7QCJC/iM8PiCK1zbiku4Rc9iPcParKRk945lUX8Rho3aBRE/MtJbCLYWyu3mcETSp6tytZjK7
 WwfEiaKHvEEvW1mIxpQANaOwUSjMBOsd6oN5wQY+N4ccZ3HYKUQ15koH3HdHq45kNuflaZCqp74
 7gL6bwcLxQcT+fSsq8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150042

On 9/26/26 4:00 PM, erebion wrote:
> Adds the qcom,rmtfs-mem node required for the modem
> 
> Signed-off-by: erebion <erebion@erebion.eu>
> ---
>  .../boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index 79aa2521aed40..0ef3e9e239786 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -4,6 +4,7 @@
>   */
>  /dts-v1/;
>  
> +#include <dt-bindings/firmware/qcom,scm.h>
>  #include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> @@ -54,6 +55,22 @@ touch_en_vreg: touch-en-regulator {
>  
>  		vin-supply = <&pm6350_l6>;
>  	};
> +
> +	reserved-memory {
> +		/*
> +		 * The rmtfs memory region in downstream is 'dynamically allocated'
> +		 * but given the same address every time. Hard code it as this address is
> +		 * where the modem firmware expects it to be.
> +		 */

This is the case on all Qualcomm devices, you can drop this comment

Konrad
