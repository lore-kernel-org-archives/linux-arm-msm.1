Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1828530FF1D
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 05:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787031305; cv=none; b=MvJ8FZNu/cqlydkVJGoyKWa47Y6MAImoEHEpyGSNQ+KJqCiHweq0E+EdaXiqKhZv6sHHurYJVld7v+Pbgcy7xbzgwWTZ9aWd0novZThXRK+cvGVwvrWFarVVQVv6sIyVUq1HEfptGXIlK1wpLYAytasMai3/dcSuI9l8X6cyG+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787031305; c=relaxed/simple;
	bh=937cBjiDkSVjUvXYFLJRnSxbQ1op4kLnG/ZQ4cZKCIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FK2n01Ux8hmZvnKWvuuEetrg74faBtVk4Mh1fi4Qy217IZ4NXeB9svVmepuRFPf7EQnTsfS44g1g5HvybJy9vkvxGqxcjjatFdm9W6lK+eoHserWr12DIzNgf0wm0aqlUbwqbgdJVQ1HhP0KZMnKElWEyioWIumuPl+HPuJVg8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mke5dGlc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JEnwii5v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mke5dGlc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JEnwii5v"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I3r12v477853
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 05:35:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y0SIHNHEr1GKYCbBglF4YzbkpCW6i3Jo/GjHjnWOyG8=; b=mke5dGlcJesHo5UO
	n1tomtdA4100WkAc9vaWTtfb/+lMrLFAYlCPl0bNhXrN3cZnBi9IBk5tG4z2OOKt
	+KJxWxn5TPwBo3miAsCX6xSFao/SMjdkD2cUDgeJvZcTgKEG/OnheED9X7uggTuU
	jrF7TG9jv75/50jfOnBJqnNgxwCZ0WGYhwHgJo4FGHZf2fvko15Yr7nk4//KLr9+
	k6YkcLfkuipXX+uwBfTaG3i7veO+SPzGZ0xlv8SNV/NcyTZssY05KLiQ3qLtH62n
	UVGnRsIc7wO1JNTTalBT9XLeZR+9iH0g1G7nr7Kx5WQbR5kE4YLYbQFr/+hTmx7Y
	g8LU/Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4fvp0cce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 05:35:02 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cab048cdb3eso4915975a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 22:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787031301; x=1787636101; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y0SIHNHEr1GKYCbBglF4YzbkpCW6i3Jo/GjHjnWOyG8=;
        b=JEnwii5vBv3dBSIzKrcRjawLBjOeX3gWHr+KOC3gWcsyjs7fyYGZ5ohx7+PhTP4Lza
         ZJTyNmIyh60ZPNDSa8bkJQmXOXyMerJgEIX/3zlBzdTRppieKbVngWkfkpqoDEE2PM8R
         p5Qoh9GnV72KWZuDQjCGj2V/r4ly9fgkxpVY33dLe69GuLS1MoQfctPPfZggODTIy0mr
         V1uzIwvpe9WsuxUdj2aFrN+WGeICTt09WV3JKCbfVoYPdTtZogiaahRwVET2SlqcJ1L1
         wDgePUGqYNuXzlXoN0wyI9TMALK0nFqZ9FtO4Icoy42ssDwtia97/1MaAE9FK6JSu4Mo
         IBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787031301; x=1787636101;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y0SIHNHEr1GKYCbBglF4YzbkpCW6i3Jo/GjHjnWOyG8=;
        b=CEgH3hSjMGJKhWfB48KZEK9tphAzPgpBU5SMxCfOt5lqSkbN/V/2bqji92nMETAXNj
         z4FAQ2N1VBZ5l6RLL2njTf9MIVF5oAqHWUAKw8jkyUdm71HQiAUduopKW9RmBGRG3YhX
         q978YjHIBqus1+dPdwDCPIUuIMguvsX6vrKY9TP77q0ANgUfIzPkK/k/QpjiC9VSqdlt
         Tmld9wNMJ4jkLzAAn2PlKnY0FNjcniXxmHkpL8Hl0fEmR1lOMAEyCX3q/e4LXAVwaa7v
         fpQc24PY9DF624hZi1kDZ8rZFeJb0gm/Y0zOO4H47a7dxPA8737CzrTH6hJZzVPvlIw3
         P3yA==
X-Forwarded-Encrypted: i=1; AHgh+RpdyblrWZrU7eaOktKDAEsqCx/uB/Adt9SPeVXDINEDfypsuGolaQ7VM1OWS2MK2BOA7oq2AqYIKgHCZ0BY@vger.kernel.org
X-Gm-Message-State: AOJu0YzsDHd291S+ZTUcKQZ52S/obaZMl9qGsSeH2LteGmk6ZNmoYlxd
	zUy4Gj+T6ZwiDWgtbz5xn1rAx11+yLKoIJzu5p4sf6cVlTKUB0mbGwdEHbvUzyQI9WDkS871VJe
	H880B9MV64fzrlinXbLSCaVqcMUnZMRdJAk30MRS8zhbt/8S8BDr1wh7zhG+hoSC5w3J6IaC2Qb
	iZ
X-Gm-Gg: AR+sD12eB+m9WogIM5mKHffAyPqzzxhlNID622Wo85jYMwrVCDovelJCHmkFfo5Mb6e
	Pp9wj4I4sXNNzJOAEfVVwOPuAGJwlihnR+6x4+qOaPpZgCJvrPGQvfAAi3M5HNv2Xq2OGho4oB2
	1ktqDcJv0dArwy7TvcV8afbCfT7qQGHiVEgoVm3JpA531VD9/g9/+1T8U+fpeDY7yTAkP3KRqdl
	HZIX4M4zRMeDBoUtQlwB0DZnCjQiS7snOIDYClpWSQWrwGsT0Z8MzJ86RzPSPeUV7j3MM9dGzKb
	GzkErciKeGB4P3UFX+C4WJHfa5JAUPAiGTGBV452EdjvnkonT+Y/eVN4yKUwUwAdX7uLptrLqvT
	qFbD0sQ+YfJh1UaTohXw+kQi+zOqO3ko=
X-Received: by 2002:a05:6a21:6d8a:b0:3cb:8810:631d with SMTP id adf61e73a8af0-3ccda918cfcmr7367963637.1.1787031301325;
        Mon, 17 Aug 2026 22:35:01 -0700 (PDT)
X-Received: by 2002:a05:6a21:6d8a:b0:3cb:8810:631d with SMTP id adf61e73a8af0-3ccda918cfcmr7367883637.1.1787031300761;
        Mon, 17 Aug 2026 22:35:00 -0700 (PDT)
Received: from [10.218.14.97] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc13c03320esm1572687a12.25.2026.08.17.22.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 22:35:00 -0700 (PDT)
Message-ID: <c9544d41-0782-4632-9d5f-a06c0314e90a@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:04:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] spi: qcom-geni: Add panic notifier to suspend
 controller during panic
To: Mark Brown <broonie@kernel.org>
Cc: konrad.dybcio@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, chandana.chiluveru@oss.qualcomm.com
References: <20260805-add-shutdown-and-panic-notifier-for-spi-v1-0-b5db170d491e@oss.qualcomm.com>
 <20260805-add-shutdown-and-panic-notifier-for-spi-v1-2-b5db170d491e@oss.qualcomm.com>
 <92fc6c7b-ea87-4577-b200-2bb36388f387@sirena.org.uk>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <92fc6c7b-ea87-4577-b200-2bb36388f387@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UFZzPYPZ-b4rBKoUcefGbyKwPC3_tgh0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAzOSBTYWx0ZWRfX8psKA4EuEJfL
 sbTkHafad9xV5E4yrIC+61RQFpW4bGtjZcC0xZv4k3k/rIqey+E7QimZI5Ab0rYPxquam1h1W4t
 V5KrkrSb6ak74hwQ0vJRpsFDhyDH6sj+znMTMp3M6Bm8FkEibwi7ZhuAch8NcgdOIK1vDtOyqk4
 FOHOkAb41KzSfW8K2OAQJmK/HZt9Vhs4uiYIjkR+PmwHV/FFbkHVAv9eTHcYfP7BFClCyPivkwU
 fy6jfIsVseGgUO72xCvVh2VVkrpv2a+VHGagDE4dYgbKuBenab+OXzo030L9EuvIqu8QA7XYs1g
 uDGMSXKk20J9wLZHvrgZ2uu5HWt2s/1RTTjFoUvRFsI9w+AF1GmcJRiJvhtP63o2Vv49Xf3IaPa
 SuuV8Ok/TcMnW0BSQ4e3NUkY6N6rXosa+lIkTFa8YPmBHZnqswWszLkOd87YI/Qim8hnRv8n05Y
 5WPC+xTrzeQL9v5UkkQ==
X-Authority-Analysis: v=2.4 cv=K/IS2SWI c=1 sm=1 tr=0 ts=6a83ef06 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EIQud5khxiMJNvOwFl8A:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAzOSBTYWx0ZWRfX0WYodu9rbu5F
 FOqqKvVJDvFFY1tmNTeOX5igPLRvOHSEUUKNI6X5YI8ZM57gtS449EXIFr/ri+wjP0fO+epSTv9
 1iWi4ka+1BeWi8qAR6oeb752GbBNMxU=
X-Proofpoint-GUID: UFZzPYPZ-b4rBKoUcefGbyKwPC3_tgh0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180039

Hi Mark,

On 11-08-2026 20:06, Mark Brown wrote:
> On Wed, Aug 05, 2026 at 04:12:10PM +0530, Praveen Talari wrote:
>> When a VM crashes with an active SPI DMA transfer in progress, the
>> SMMU raises context faults as the DMA engine continues to access
>> IOVAs that are invalidated when the VM's memory context is torn down.
>> These faults can affect other VMs sharing the same SMMU instance and
>> obscure the root cause of the crash.
>> +static int spi_geni_panic_notifier(struct notifier_block *nb,
>> +				   unsigned long action, void *data)
>> +{
>> +	struct spi_geni_master *mas = container_of(nb, struct spi_geni_master, panic_nb);
>> +	struct spi_controller *spi = dev_get_drvdata(mas->dev);
>> +
>> +	spi_controller_suspend(spi);
> This will take locks - are you sure that's OK in a panic handler?
Good point. I hadn't considered the locking requirements of
spi_controller_suspend(). Looking at the implementation, it can take
locks and is therefore not suitable for panic context.

I'll rework this to avoid invoking the SPI core suspend path from the
panic notifier and instead use a panic-safe mechanism that directly
quiesces the controller without taking sleeping locks.
>
>> -	return devm_spi_register_controller(dev, spi);
>> +	ret = devm_spi_register_controller(dev, spi);
>> +	if (ret)
>> +		return ret;
>> +
>> +	mas->panic_nb.notifier_call = spi_geni_panic_notifier;
>> +	ret = atomic_notifier_chain_register(&panic_notifier_list, &mas->panic_nb);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return devm_add_action_or_reset(dev, spi_geni_unregister_notifiers, mas);
> Should we have the notifier in place before registation, what happens if
> we panic while probing a SPI device which is probing as a result of
> registering the controller?
You're right. There is a window between
devm_spi_register_controller() and notifier registration where a panic
could occur while a child SPI device is probing and issuing transfers.

I'll move the notifier registration before controller registration so
that panic handling is active before any client device can start using

the controller.


Thanks,

Praveen Talari
