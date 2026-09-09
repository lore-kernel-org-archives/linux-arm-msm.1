Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D7F53FD56
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 11:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954737; cv=none; b=IjsOl0Fr5q015jNoiWJESCKVQ5LMFY9kadsNFzTklbTdqiOTPbl9whCUBiUSnZKxKn6Q/F/5EacHfbrJEHsf8C8/SEZrgWfIERFWMMONltK6CRpef+Q7TxjKsntXw2Kss4zjmLKURtJ5E6gcXxFpdNR9LHEMnUUIQSvzve/eC6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954737; c=relaxed/simple;
	bh=wynWGA4fk1dSOZfkILyjQAZw/pninY0nN4ZGWNEnsL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=InKDUfYkfgsxoVvxzJYXN60ft04aeINEnJN6m31GHaDw38Ft+nk9xBmoEYmNEwa4H8uTkZzp2G5WcAUUg9rV2G/qrTBZsS8Q9X+/ZWWN3NWUHP4KDr6jk5r0+FBAeLmUPcN2hR2QKunQLUb1y/bAglIDWxTqJBEPUdmIBQhmBRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GoB8j0+o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eKu7VbjV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GoB8j0+o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eKu7VbjV"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU13L1723043
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 11:52:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yWVC0il5ooJ5HqrOgC2T3F4oate1AqgFeCGJdC2H1M4=; b=GoB8j0+oNcLw46Wu
	W3PMSyrJBelM5vMugl7TFZcsdxIPc0fF9IkODtHREuycZBztaXUBw+XcqSiHXhbl
	30Ps9ie4Gk8EbMFgvDr2MXZGxe6Z2LOYGWW/w7qNjx0uAmDGETHSK6sbdvklYy97
	letFusq5wnhD2/hDhpl2+iSKNzJbYwHRy9E8MMVoe+D1TYG7coxggnbgZ6xX0PC/
	ccAcx4CJ2w4EETXuNvpAZCaF9t2LYdnLZ/wKkzSQzHnsRk6Rb1AGHEoR8cRIZ9aQ
	6kLlcVHiA/LVvd9W9lxm+Uvbb0Yc4uC5dvCc5tQvWaprGpFxaXXbKupbaI5TXeUX
	lFmPtA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5cnrd5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 11:52:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-530ac448bfdso753041cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 04:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788954734; x=1789559534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yWVC0il5ooJ5HqrOgC2T3F4oate1AqgFeCGJdC2H1M4=;
        b=eKu7VbjVnt+HR9QTXtdqr7zyYR2TrDG373Z1p91JUQEVMDEomV76yr+XidghHG2pne
         QE68/0xP9X6lxRsdxz0Eor+YM7wqcz4BE58dZ1n899hwjnwGLw9Hbv3ja9xDKR6LXkHn
         69xllTkPqu4z0tAQXX3JKnz6AKLFaLL+EorPA3XWVhn4XrxUq9fwZxlPtV/wBWZYIT0N
         YJ4KY8qcrxbTptcIJKfTEhzpHxj5BFgVRbFZmMPY1qZK50ID2mXSMWLC2lq5lqjwHT/s
         9oLIXf/b3XBrziMyW5NFzRGKIzemFHp8ZF9M/B895hKd89txiXT7Zm2/oIg0LawU83Ks
         6vig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954734; x=1789559534;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yWVC0il5ooJ5HqrOgC2T3F4oate1AqgFeCGJdC2H1M4=;
        b=sI4E8ThA9Xpglziji7Ty9WC139QJJMsOJaKxlhKaaXTN6A2Dzl4jFa5huTOKIvwGbE
         pliclVj5c2b8/M23KoXW/bn1d90jyF7jLOZyeJQse18GSgbJNmQN1Kk1utO6tVT6MrnU
         vlpe2Dfq5mNmGOoFeDnCEIkO3biKlVVxFxBqHm7WadG7I5IiYYudNTZ3A3H6p+rDXikY
         kA1Tz8cwSPYXfQDoJDqT3NehQPqAsNLPcIm7ejVqVaH096hF0Prw6IH1kCzid0KKcEYD
         QGvekuPGX87/2IzbNxa1XCCRohR7H21rBcR8O5vXUXU2DrYTeG7oiXn8ZqMG8Js+ZOSp
         cdkA==
X-Gm-Message-State: AFuF++l7bp8/UMEvNn/9h/TmlY3g9GSZHesZcihrkHZlhChi7QTGCm3m
	cP2f7SblpVLUvQ4UTgX3VwsvXb80wFC4xTYlI4u3ohpx8jfzny1iR7Bdznl3MwSFlkbzJ5li8tY
	JCRzg1xdKbfS6QJVrm/sXsMFGRCmsbQQt4dnhfsP+avvNdSFMQHh2nRl0U3GD5H3O1MiY
X-Gm-Gg: AYBFou3e62q5zj22UChkIZRAIWT3KV2X1ov8Sv+uoUKGuEYVouu38fRC//gIvJEGTzd
	qyoG2gNYZkxKaKM99YDNC+T2Cy2LWdsR1FrKEOhh5xRlKgNbGwL92cdvonQGyEclRGte3BRX/s+
	tN1ffF4jNprJP0PCOqy8/ZOpzeuX2PYP0UEL0uFdq5Ni7MF2Q72W/aCjOAzUYNG4f5fgSZHVbP8
	IwuP8dw9IhoJn399JodFCNG/riIWyvMbCxaDgV8H50Ch7cjxlZfUUGNWQP37lzLkHsx5Oks5ars
	8XR7EDnaIF2BO2tFc/AN9SjXjQSsOV+cBQJNACg/0RuIMYmfhPsy2o3MJd11ygdYxNy1V9Vjn8h
	3jJGuPBxsdJ9u3GDnpG5CdA==
X-Received: by 2002:ad4:5fce:0:b0:90e:8d21:714 with SMTP id 6a1803df08f44-910476de413mr284196146d6.2.1788954734398;
        Wed, 09 Sep 2026 04:52:14 -0700 (PDT)
X-Received: by 2002:ad4:5fce:0:b0:90e:8d21:714 with SMTP id 6a1803df08f44-910476de413mr284195746d6.2.1788954733843;
        Wed, 09 Sep 2026 04:52:13 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d55b306sm756078766b.36.2026.09.09.04.52.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 04:52:12 -0700 (PDT)
Message-ID: <2b163290-d57c-4e84-99b1-d94fb5f45f79@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 13:52:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] power: reset: qcom-pon: Drop reason shift for PMK8350
To: Alexander Koskovich <akoskovich@pm.me>,
        Sebastian Reichel
 <sre@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260907-pon-pbs-v1-1-cff2f5810769@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260907-pon-pbs-v1-1-cff2f5810769@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fQo9IDgAReD7ymhNEamcDgOh7jPRNAR0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMiBTYWx0ZWRfX9OH/T69I+wyl
 ED7Syh7ZXKWHayv4lmPoraeQTOyAfXUIuOFlOFT83APtU4rgUAGkkuU8id9bxH2Yg4CmfGw3xF4
 0C1Uvr0M+WZ59HbLtYYDb+ZqA3IqAh8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMiBTYWx0ZWRfX/75N4FuQbFUl
 kZJjzN7AiFH8qMTAVERchuwepWFbPRW9M89FJITozMmcWCS6foj+lBTXDBp8E+v2OoZqjTzvSVc
 Kn6cf6imo/naYJmYhoUJdXj2r9VwswjEAqSkYSwbTE1op53dHl8gxxFKzVjAfjZYz+fFLnIApn2
 XSnbXqjqBg4L3aF6cv1wre4ZhaBSXZheC7X1z5hj7GBRY4rzKE30FhWp0JKwyNTQD8iPmKU9Hbd
 E62QQlZ4eur2cMWxgVaPdJzxQNZK4y98zvJt/Ai9RP7EucSwfbtSaUq/AwUlJs+pnQR/joCknXF
 1rKz+tyWzq2LSHkadaS+1vx6z1OOR2TQQTUCz6R9gP8TAV/g2KO0Q8jKbpkMWmbpjYpiGm75/zX
 wMhsg5aRHzdBg6aDZ2DeOsF1ZIJaOSe4roNFEBKFXQuMKNgH+xtuty0r7hQjGADcU8NzrjJ28/f
 1XJ5UaKrN7qmWxaXOwA==
X-Authority-Analysis: v=2.4 cv=S+jpBosP c=1 sm=1 tr=0 ts=6aa1486f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=XjHw8PULWccToXi1muEA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: fQo9IDgAReD7ymhNEamcDgOh7jPRNAR0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090132

On 9/7/26 6:44 PM, Alexander Koskovich wrote:
> On the PMK8350 the SOFT_RB_SPARE register does not exist, the reset
> reason is instead kept in SDAM and written through the reboot-reason
> nvmem cell.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
> Would like some feedback on this as I'm seeing conflicting results,
> SOFT_RB_SPARE does not exist on HLOS but it looks like the downstream
> qpnp-power-on driver writes to XVDD_RB_SPARE2 for GEN3, which is on PBS.
> 
> Though, targets like waipio don't seem to have access to write to PBS
> from HLOS? Get SPMI errors when I try. Didn't have an issue doing so on
> milos though.
> 
> Besides, the bindings doesn't allow reboot modes on PMK8350 so maybe
> setting no reason shift is correct regardless so it gets skipped?
> ---

Maybe +Kamal or +Fenglin would know more

Konrad

>  drivers/power/reset/qcom-pon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
> index 7e108982a582..9cd55f5536b4 100644
> --- a/drivers/power/reset/qcom-pon.c
> +++ b/drivers/power/reset/qcom-pon.c
> @@ -90,7 +90,7 @@ static const struct of_device_id qcom_pon_id_table[] = {
>  	{ .compatible = "qcom,pm8941-pon", .data = (void *)NO_REASON_SHIFT },
>  	{ .compatible = "qcom,pms405-pon", .data = (void *)GEN1_REASON_SHIFT },
>  	{ .compatible = "qcom,pm8998-pon", .data = (void *)GEN2_REASON_SHIFT },
> -	{ .compatible = "qcom,pmk8350-pon", .data = (void *)GEN2_REASON_SHIFT },
> +	{ .compatible = "qcom,pmk8350-pon", .data = (void *)NO_REASON_SHIFT },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, qcom_pon_id_table);
> 
> ---
> base-commit: 944a035ecca915ae947905dcfb03f2b9dc6d032c
> change-id: 20260907-pon-pbs-76b7ecaafe33
> 
> Best regards,
