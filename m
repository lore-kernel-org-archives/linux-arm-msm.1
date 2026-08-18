Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C116D431E68
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 09:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787044970; cv=none; b=UvbmpNVNqmpmYPLfzeZ9SqKNqJKx+AZnCjLF75XL17LYz7WxXNNio+COHhgzGIJv67aAns7umsyyuPXoAv6+QiZMmgcSm7iL/a90vve5Jvf/aTByOReRjIywk87hTV6eHq/uNkFcuTkpmL353ytUP6OwFQMc/WCXZya7GUKI44U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787044970; c=relaxed/simple;
	bh=u6361v8Uib/n/iTfG4KC8YAYXaeOdYsfglkX/0VQSIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OMSakjb37Tdf7ho5QSxZ2kEFOvVAW3/w/iZA5yo7r8gwTjEAf/AcCuREjKCnJ3XKNX9QMUJf+FKW/wT3DobXa0YrTGs2Eaq5hkZS6m8HqRRbv944Jz9ukh53Tx4PB1thOrtlXSTU0jMauoOT284Ue4X4MGybVjXFliwh8I9x4jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WPKtT9T3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V1Nt/R7A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WPKtT9T3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V1Nt/R7A"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BGck644982
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 09:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OSIL9YTRSIWHiru5H07jwll9RFpqB+9Hr8pASO8MwNk=; b=WPKtT9T3+8xyOifs
	YQKEAdn0BU3kqC0MWAphRGIpJsxV4MGDUnxlbbwGG+c73SVtp/3ZIUEmLcemp3Lg
	hCvRYMpgr7Y2oVKEmHFRU6LBe4leLGdKY9hPx2nc9xCkp6ypzcFswd/8IVsUD16D
	1oJCWtQEtLnY569SIwcaYAF7UxhnrcWKsLclYKdqQAC9ir3aI03TvJWDXDeEjB5z
	s/TaIladLl9xYoeA9mgtpMNLUlmFsGT+EYtn8nzwYkq+kPZsSsd2+hlWwrx0aV0v
	wuRa5Wj95iaZugys4V5J0GFn7vBHNvO8gZtvUrIhLkddusi0600P1mlQnD9V6v8u
	fYf00Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4611bt28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 09:22:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9310484c005so2961185a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 02:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787044967; x=1787649767; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OSIL9YTRSIWHiru5H07jwll9RFpqB+9Hr8pASO8MwNk=;
        b=V1Nt/R7Av/1dpvANKX+cqLo0Ch5vxH+10O6hNhmoD6o9+w1biuCMsbvNI9V/zZZ/DL
         VycbiVIobti3PPvX57Zae0xobixytanb13ySkGDa+CNNvoPwO5gN0dCuAhS8tm4hk4oK
         GdB+zLYt38CqqbHxE44MyCs7WmW37rYqLs9nmajLjIDjguYh4cXqKbo8JxSwi6ggP2g2
         uhf9bsDQWsH+XOoGqRiT2kiqi6rRJOS3SWLclA9+eGhns0wVNede8HZdsfZkkJuE5NX0
         vcGmZzyMHZb7jLuphxFeG4svPBmKhiLd429Sfb/nkNmaphAodL+qaGyA/Fu6qLUeJ4nN
         4stg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787044967; x=1787649767;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OSIL9YTRSIWHiru5H07jwll9RFpqB+9Hr8pASO8MwNk=;
        b=BSkOyAZJ3tw7g022YIv5A6K7Zh5WhORul8dzYnIc2BN2VPYpNvxILvFXlMeryxNLiM
         yHip8iV7sPBtR6XqoBfM+NG6WodCU7jDdaFkfg32mOMAThHkxxpeU6tCW5a3jx1LHXv3
         B0ng+uX3h+7kUniZ3kyfFrFjYVU01GviG2vq5LJU3Y/g3n5QZMKuVrrd937vIH0RBrHE
         sMXqymQxQhoHh5X+0OE3AccsmnUycJuCZyYsrhx0adwq/C8rYZvTLm32CPQUzQdW5G1W
         qdr5i+Gxr2w3jN+3U8aM6lsznhTyfCJuG59THc3AO33igkMjI2+diZC9MlfkQp/VrSKG
         RUyA==
X-Gm-Message-State: AOJu0YyY0AXm3d7up46uImDDMMu5e//YBkxnEug8WOt4RBsyRM37LB4v
	5E5m4R05/PSLjzH3P9+03PG7bwIIjrQgIDA1oHcNcjfSJ6BmBx1mVVo1MJ0NEMW46XUZqzbF/t/
	fn6f/z+IlV8m8MQYCJD9eoAozT83k5ABvHBCI7aH58ctSdVoEoVTG03D25Hu9Erc2K9rlPfbm6u
	fA
X-Gm-Gg: AR+sD11hKDXgJlxCH/RLx2ygbSNLq4iFMeaB7eEH8afpmgkqRoD3Tpxu+KIv148BRhG
	nLs3Onuz5/mdTp5BTxP94OIhOcA84Y2IgJx1GvbY0HKc2eSfZVB8HUpx801r2zWVWOcN7Qw4/eM
	1ucswwg1wZKTh6uO9Vm+UhV7X0PVpu7eiRFWApaAVBEc3mpO33jbMwzessECPSjR5ohvaH33XHY
	g3cz61dzEVRNFKdgLAJ7w8MhxA04eJdJlx8lxAzC4lTJkKUmZkf+0VEJxf61LT1fl/+tqZby7/c
	ZUFJEfA2r/yz2bTZnj0WVybp9WJGYmM7Z7qb6Gr6KsjXwYRFCUgzi70CEzgY7pxyiYtNigbx5B/
	WScpFExy9EDqENyy5its6CTIi
X-Received: by 2002:a05:620a:45a8:b0:92b:7420:bd58 with SMTP id af79cd13be357-936d1ed8aa2mr2222531985a.0.1787044966854;
        Tue, 18 Aug 2026 02:22:46 -0700 (PDT)
X-Received: by 2002:a05:620a:45a8:b0:92b:7420:bd58 with SMTP id af79cd13be357-936d1ed8aa2mr2222529885a.0.1787044966465;
        Tue, 18 Aug 2026 02:22:46 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d851767dsm1627320a12.5.2026.08.18.02.22.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 02:22:45 -0700 (PDT)
Message-ID: <90c9dca7-5873-43eb-b9bf-1c8dd2c0093d@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:22:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: llcc-qcom: Handle errors from optional IRQ
 lookup
To: phucduc.bui@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260810051031.26656-1-phucduc.bui@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810051031.26656-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eCC23tfT3bfMgYBJdp_yPYG88fYy8XEp
X-Proofpoint-ORIG-GUID: eCC23tfT3bfMgYBJdp_yPYG88fYy8XEp
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2OCBTYWx0ZWRfX4jPoyDxnrNBK
 2TWBv9Br6BVKfDYiPCTkX/nXKNZFFQbgfYfAawLrS2tP7guy0r5KVLB3Pa8x78OkG2NAFArHGfa
 zq3mQ0DOT+JZLwGlIrc/6R4m0f6HGIY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2OCBTYWx0ZWRfXyZgCAbCjnmTB
 Xqlx3QOghb/ElhRWzQBGGWTO9js5m08UIte2HBb8Os7CW7sxgwXEyM/05t8awYNb1MVb9R/l7x4
 tpPwVCPi9g4JVYHs3ZaRouQtl3q2xLrJwSQkRdGvnnIB33MlO2KoPDfqwKL768f51X18IGhF7ec
 BP8f1tTaNrkPVK2+f4s08L3sJEbk5H035/jio+I+EecEg8sas8R9XcMuG/kqdWk34SHmy9uD24v
 cbPDp2kjHZxjb9ASiPHpZWIYwtGxMfgfmKoz5iys8dZcLuYLDRO/PhY/EgogiqTaWQzGyniLAxV
 KXwLoH5oI26TrqWs2oGyjIpdAMxidhqGLIZAzQjmNQdRqOzgdwxM50/ByLM09gyDEmn9Hk6Fvcr
 cNlkczgaTA+g4VLyTSUgZOEdLVo1bI5HzRepkHISXvAXioGLufePaBRPyh6NLbAQzHF1fL1ethz
 TI/69sfbgkOxcc8PUAA==
X-Authority-Analysis: v=2.4 cv=UslT8ewB c=1 sm=1 tr=0 ts=6a842467 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=hZ_HGFdO2wMKUaizlUUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180068

On 8/10/26 7:10 AM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> platform_get_irq_optional() can return errors such as -EPROBE_DEFER,
> but the driver currently stores the return value directly in
> drv_data->ecc_irq and continues probing.
> 
> Propagate negative errors other than -ENXIO using dev_err_probe(), and
> only assign the IRQ to drv_data->ecc_irq when a valid IRQ number is
> returned.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  drivers/soc/qcom/llcc-qcom.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
> index 8948b5fd42d2..e42946810b50 100644
> --- a/drivers/soc/qcom/llcc-qcom.c
> +++ b/drivers/soc/qcom/llcc-qcom.c
> @@ -5587,7 +5587,12 @@ static int qcom_llcc_probe(struct platform_device *pdev)
>  			goto err;
>  	}
>  
> -	drv_data->ecc_irq = platform_get_irq_optional(pdev, 0);
> +	ret = platform_get_irq_optional(pdev, 0);
> +	if (ret < 0 && ret != -ENXIO)
> +		return dev_err_probe(&pdev->dev, ret, "failed to get IRQ resource\n");
> +	if (ret > 0)
> +		drv_data->ecc_irq = ret;

Techinically you can drop the second if-statement

Konrad
