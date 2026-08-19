Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583083F44EF
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 08:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787129906; cv=none; b=A0Y9UwVG+bbdlx1R0sfxKQ8aJ+ejTOIUlVlFVMV9hzJ5x48YOTB6s/qNmaPhIjvEMvyXot6/JlWm4EpYeC27JaWGOwZjGD0FB1TD0k5bi/6wa6d7Phhudr5Li6maTlJQHn7c4jl4wfSHbwkVqaekIkegZY6U2oglQ2ZV5Bk8u6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787129906; c=relaxed/simple;
	bh=xy5f4yB2DW6sWV4q3Tyz6Upe2KQdZq5pgbZ5gJyoZlM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JsOrxN+s4yarB2W5RVkqbNG0pUAt+cMb5IOVr6Qd6td9JXJcENzeD4oTVfUBBHO9Odx6uDaxs4GrABA+RRU2TykT/pSgqYWMqTeC03LOgATwfTE1lU5/CLc62ps4exMabUmMQFqg0ITphwKIjrX1rE84uk92GVKgH87Ki25qfmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DDgWCAs1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b7L84NN8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DDgWCAs1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b7L84NN8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J6ZAvE3589445
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 08:58:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VgXMRBypRqfhAj6RjPVVVARbvuqQB5nTNT5Y33zDvrU=; b=DDgWCAs1cohMV1jJ
	pwSqRKw5KZm/gUwJoCefJTZDevQ1N5XCRJegEGTlwo9Vd5QIknVO6XZbtyE5k7Tz
	Wo8G9hVoptm2wRqAeX4XWnJ30qsqeU5EAsF8syg38ExzmBTuaddkFLWfZMuINn7c
	iAykdsZSYodye76A+yWPrVtIQHvciknQonhYg22zz3WG+aX46Y1FKTWhq7PdD56T
	Xjw1GzE5aq39A7M61iP1LsoTwslQmB+Rz4rc0RKrXgZqfdQrdnOarehO87whRzJV
	p41BCvHaRlXS9CMgEoy/llo0DWrX+60olp0ITDmK9G+aV5AQpH1t9Q0SScjnMsQp
	ywpTdQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfna8q5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 08:58:21 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9058a836724so3060196d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 01:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787129901; x=1787734701; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VgXMRBypRqfhAj6RjPVVVARbvuqQB5nTNT5Y33zDvrU=;
        b=b7L84NN87GWwxXSipLAj9TyGxTs2FTPS2KZy7jO5A9pxUerNyYS8Ka4RVG986F83/u
         qW0hRB4mTuMCiiTDdrqGwUDCisJBdT6ljAMITXfvHKy515HIWHneUWDZv7vVGbDsMf5k
         dQmuzGL+r34huD2L7RFi26xFHyCoLJyRfL5tazzhrfVFjYhnvLR7tvHDzpD+VhvVrwJE
         8vcBi5S7MAr3lZt5gno/xoSfM07F8gIOHimYP1YWZf/FO4knGoEpfArtqFH1OMq2maJL
         MQwQaRX8M/szEd813QY84EMCa5k1WUK0wnwjgWvDMd3y71bzprLA3wS7qDWnwhEY6iFE
         EDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787129901; x=1787734701;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VgXMRBypRqfhAj6RjPVVVARbvuqQB5nTNT5Y33zDvrU=;
        b=ZsJTA+XUfU5pwiwgXJgFjzAxoaJ4Qid1I9g8GYRUsD5ITq3ficiLClCVCI3sZVIbgE
         JHbvciau1011vf4+NO+vNzds8CpcacAyOUxlwoy1DYUjSWh8PqQBPWk00q8iEYNUC04W
         2tJ/QAb8kxh72g9Z2pE4TSbgKTjJsWkeGscTRIH/WaDH0lHcR6ThlhJdfSxVES+IE023
         RaidQ1r72F+CZMIRby3lVQha+gceG2XuSGOkUglhVyQ/CRSaidEkb0C4nsPCn4/ibmzl
         QZQ/H+FCLM9CrYscD+9gkhgsDj9JI+I2cuiwkdeSAuixg5eNbOpayZULiVsGGuDIJxAI
         +eDQ==
X-Forwarded-Encrypted: i=1; AHgh+Roc6ljbqyQHrHHZS8HUkIzOINbeZ62Ky1/42Ur4tYKIzlIHrjdRljKLT/N6BeM/LCUIs3WgswM9BNg8TMHg@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc527Fyp4zYRoiWFvjiZG4X7t+EcXIVRQmuDUlRu03Oxyvq6ZF
	sLmU/9dfvMsPZA4KzwdjXwnhIDoX4IYV+rwCt2wdlKwTVHbsWA0Vt+LvA2alPSylojOgXCGwGTw
	to3qHECC55lB3kONQo2YOx9UCjQZbbDwXdDs5/LKozVelvYmFAEsjy1txXHhadr8Ftggw
X-Gm-Gg: AR+sD11hBHLiVsUoqkVePk2diqDhGH3pOsUP5uFBz3UU5OtFQ3FRLDuLMVH/4Y3KJxR
	gvfGUO2iBop6txhaySR0OjdYp0g58hwP08lnqhs61L8BJoucIds28upnreY0IWI2O8Yq9OzIllu
	7skuyfcYKTEY0xGLyaEfR7xS7A6YKiORRIxow6mZssvV5Ooac1+c8GkCv8QooKrWRng8dyaZw7G
	vtPjUYpj9dWpRnb9buXzHOOtPboKQJzpG8zq6sJThgcHildGzLaxq/INCLjtsls+1j+BajJ9667
	1nRP6kbN3c28s3zqiEtSJ1prbBZgDUW2vqk/TyOsor1dYcZtw7rlwYwDwf3bqv3PASvFN9PgTjH
	A2+30qGT3c7qe2u8xIO74hGQx
X-Received: by 2002:a05:620a:6508:b0:936:5a34:7a6a with SMTP id af79cd13be357-9371e703370mr216688185a.3.1787129900910;
        Wed, 19 Aug 2026 01:58:20 -0700 (PDT)
X-Received: by 2002:a05:620a:6508:b0:936:5a34:7a6a with SMTP id af79cd13be357-9371e703370mr216686285a.3.1787129900331;
        Wed, 19 Aug 2026 01:58:20 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff16c16bsm634126a12.20.2026.08.19.01.58.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 01:58:19 -0700 (PDT)
Message-ID: <03ae6ad6-de5d-4f14-904d-bca58c07ee00@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 10:58:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: add ST21NFCD
 NFC
To: Kristian Brox <isyourbrainfoss@proton.me>, oe-linux-nfc@lists.linux.dev
Cc: david+nfc@ixit.cz, krzysztof.kozlowski@linaro.org,
        luca.weiss@fairphone.com, linux-arm-msm@vger.kernel.org
References: <20260818205940.1973944-1-isyourbrainfoss@proton.me>
 <20260818205940.1973944-4-isyourbrainfoss@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260818205940.1973944-4-isyourbrainfoss@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QedWeMbv c=1 sm=1 tr=0 ts=6a85702d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=wLTDt5XO8WXoAWZpawcA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: 1lp-HoaNEtaEpSu7Nfo6kGOZq5PYaSvf
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA2NyBTYWx0ZWRfX/DZYCrXiTtu0
 eG+OfQP6eEBPdAGBAKW4hmHXBMO55f9KiLn9oXKEEFdkqxAi186i5zTWEOb87rVkLj1rbf24e0V
 vEnZPQYtFs5D7R6Gsk3LaN0rxrRy8nA=
X-Proofpoint-GUID: 1lp-HoaNEtaEpSu7Nfo6kGOZq5PYaSvf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA2NyBTYWx0ZWRfXx93fuI3mzN8f
 qQciIGGrlyIZPVj2VKX/UgLVPdxSczqgVKiEJiH/+X7y5l92SzEjx4RFt5mZprsJDsTFHC0IChm
 lbC3XpabNJMXtLhNw7Qo4WclZc/hnnZz82d73WJHcOOz8HOdnBM0YIB6GNduKTmlqCpdQG66W9F
 25eipfanz2MJfP0rPfwET1Xm5FQJymfkBUAzZgKAxbZWY5XsM2cOkf2BBQM3TMXWqaQu2Ho25rK
 Zb7/KGmIUAltBFHVLbx0CXbh2O1yGHCKvvqyj7SWCZww2s3Ay9RzXtscqjZ9RAJ0SR+VoILFg4X
 BfTuYzjpgZs+TQks2LEt0YwBVxHdMhIoK1I0hn2aSZXhajuhYwTGVCJ1Omdxy5NkCw+l63S/7G6
 Jn5/4u8mmDSVblGqLqw7OoeARU896BzFkjUOPWmnGukMrMleWSuwQ2fluwARcwVL0pSu/WiwR5l
 +NHvWVbrB9MvZjFpDKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190067

On 8/18/26 11:00 PM, Kristian Brox wrote:
> Enable the ST21NFCD on i2c9 (0x08), IRQ TLMM 41, reset TLMM 38
> active-high. Compatible is st,st21nfcd-i2c (raw NCI). ese-present and
> uicc-present are unset; those links are unproven on this board.
> 
> Signed-off-by: Kristian Brox <isyourbrainfoss@proton.me>
> ---
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> index d48cf38b7..a485edd24 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> @@ -1006,7 +1006,14 @@ redriver_ss_in: endpoint {
>  &i2c9 {
>  	status = "okay";
>  
> -	/* ST21NFC NFC @ 28 */
> +	nfc@8 {
> +		compatible = "st,st21nfcd-i2c";
> +		reg = <0x08>;
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <41 IRQ_TYPE_LEVEL_HIGH>;

interrupts-extended = <&tlmm 41 IRQ..>

> +		reset-gpios = <&tlmm 38 GPIO_ACTIVE_HIGH>;

You should also add a pinctrl entry for both these pins, to make
sure the appropriate bias/pull settings are applied

Konrad
