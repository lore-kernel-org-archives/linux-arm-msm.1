Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABEA448BA4
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920988; cv=none; b=nZrdKTHGvovKDmBksjmzB7tf0yD4K+DlsYXKAViwkLYJdfb0edi5wYmHG7vdjofn15/bkjbLIgC9HIQVDoOclFmYsN36BKkZNjKOw6K8JJ8NNuuEX57ihXhTvYEw8GJaldtuLazQ7KaxRERCvLKIu4YxG2CmaEKHHHbEEChwWtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920988; c=relaxed/simple;
	bh=xcKYBW/fzhoq3B/N4hMrGWjH26fUKgE4ehUFJv7khkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p2LBZvALm5hqKKDeMM3VTK4xN977NrdczrzxuNSwuLbkQH08thglD7V/YtpLzPyPRH+MBaUp/UDpGX9Kr+6GqElfO8OZdsNEqtUqeivPJ0h5BiJFdCY8tmw+Igv0r2pGzJFlzJmy/PXXnV6R7z94DqV82r5Ys/4Em0gEY/+ZqwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KHxTnYhL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SVN2ghPw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KHxTnYhL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SVN2ghPw"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA8BsN3752279
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vafQ8CbVP264KdhCPbqi7uL9q+TNsqpYwNy+Mox5+1U=; b=KHxTnYhLQMs8U4zW
	dLmlKuGf9SJQA0OBsqlhZBm3lmBWBRJlTnETDPcmRWp1du+nby9jWmF1EEEXzEB+
	MRZFSn17ukfca4H1lgm0bpLU/NDkc9rWN/b85N397m6lO5MpSzPpmRr9MBWtLBNW
	bGR92USgqwEpEibt+iJ7shUFZP3DPdvLYXYXUwrAKOH25mGfysOvIkGf+kLBQHCl
	/djJLfNRnnmsLlgJk0lDrFRoFsWE0Rmc9J6oiRCZ3ZjTx+IYw4GJTp61/PaKUW4w
	fG3URrLhtd2zIasytjd3iC4ycLVmpDdsdyhFvx3cwLndRzcPEvwsFeCtSCsGCT8d
	2AP2qg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb8afgh64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:42:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52fc0097865so15388231cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 05:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787920973; x=1788525773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vafQ8CbVP264KdhCPbqi7uL9q+TNsqpYwNy+Mox5+1U=;
        b=SVN2ghPwdVmOYMirDFjZ6b0R+y8uCbN9QxzqHsURxjSlH6zR/YhApjoMPtzWtevW/S
         Bwk4qnhmXstjjrY5i9KZKhG2Fj5byUFnm6G7cZwn0D3j+e4HrGKdUv88pWuuJlGv07wz
         3gw+602PpMjIM1UVPXqYFha/MR2R4BLSQEl+sMKvvOb8OwTtyNgaIGZl4Yk+mMnR+XTJ
         Le6Pg0v4Biu3W1otlECOjmMnA5lNVtW8H6D4yNc5u1B4koVkWJJXJE91NxWxI09f+wHK
         4vT1DxNQIbBgMsSCMs3mbj5a5B2N9Razy3otlHT+nbMj/dXYfCHMlyI6o30uQrcIKqP+
         dtzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787920973; x=1788525773;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vafQ8CbVP264KdhCPbqi7uL9q+TNsqpYwNy+Mox5+1U=;
        b=l/Bim5FHST2cANOBcR/Rop3qTT9pGjnVTkCYJ6OhNkP2j4zguhpRuGSFppoIkHP8gI
         haccCOM7bcdpF0qnt/aJXUG71GDMNaKaVPm8YiPfvLfpaw62nJisFBP+3aMHKkn/nFun
         JtPAdvvTKPJtU5FXlaYRdX5R0Cy75c+oj5F/n5nWZjMkTluVfxUfZfSPiNI+2kPF84nb
         K/Iwi8Gi9Su5CS65Wjib4p+OvdKqildwJf0/63aH1U2MAt8CGZwyG5/+ytVpAQ1jFjQ9
         XE1CbL2/vr9O1PvLHS8cfGuc4XFz2qT2bZSLt35FtzmomaxQELpg39z47vDHfGlqQBAU
         qGVg==
X-Forwarded-Encrypted: i=1; AHgh+RqLp18oEXfYToHvg03JtlUKvE6g72YBEnSqpzf7q0iGPca2kOitUPJ2TMnlsl4cOTeCKtZR/VaYqlK2UUu1@vger.kernel.org
X-Gm-Message-State: AFuF++koIADFKzajXTr9EUhJg0Oj9pTm0uOioVc+sgfEZRPujgXSZo87
	0apQgjD5eKd66u0ZXSEz+S3A0giqO9Po9nXuF7HzhN5v5N+MXGf1Ut2+nTnUOsPXMN8EI89Efs2
	9c2UTvhcMTlLUgVMJ85FWE2YOWy0opo5jsJmtG/SxXvdpnBDRkaJ2BhgUHk0uklP0b9suZHNjT2
	Vt
X-Gm-Gg: AR+sD11P3bCeFhNMJlKdv2UUbjruoJCaE+OORB7dQQjnEnk6wHSh2gMtd21/xo7xEgI
	lJ0yrkSxCX433DMEH3C683wtgNUap9g09pf/5MNdp67uDW8lBu27bgypnQsmaLcnSUVfWJRZaAj
	CFI3SWt6j4mjD+GthTtNCbIiYcUAVBpBlr1G+7AY922DYbnk/NQlsxWkTyqyN6PL3Zs4lp4/u2A
	WnIhwlQwLq8UP6yYd2vvd7nxGWSMOJc5PUI4pwv+jUZE3o17YkSKR2UT2TXl6kDc10BbaoV2/xP
	RdITaaiQO6nPolFueuJuGH7ZBBz2c7b+OFLz8tpRDvQIu76zRlc90md3pyy/B+eIm/luIb/j+ua
	L43hHmziIFILighqBO594EUG7GuU=
X-Received: by 2002:a05:622a:1105:b0:52d:7b2a:93b with SMTP id d75a77b69052e-52fb9404fffmr67524261cf.9.1787920972907;
        Fri, 28 Aug 2026 05:42:52 -0700 (PDT)
X-Received: by 2002:a05:622a:1105:b0:52d:7b2a:93b with SMTP id d75a77b69052e-52fb9404fffmr67523581cf.9.1787920972331;
        Fri, 28 Aug 2026 05:42:52 -0700 (PDT)
Received: from [192.168.68.119] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49b4c321184sm163839105e9.11.2026.08.28.05.42.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 05:42:51 -0700 (PDT)
Message-ID: <36b61b1a-1b5a-4946-96d5-576baf707af9@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 13:42:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <bf6e42b4-ff21-4b6c-a7d5-024e5b9a7da4@oss.qualcomm.com>
 <CAC-tS8CaVN8YgkUHJVvLcU1xWB3V5dOgS07CHVOBUnPtMjNxTg@mail.gmail.com>
 <08b6fd88-84b3-4b3f-a8c5-dd6bfd39403f@oss.qualcomm.com>
 <CAC-tS8CtA+wRuucDskRXSc=AHgNdbuq+khj85pFmCG8dGS3Njw@mail.gmail.com>
 <137d4a06-4542-488d-91e2-d338ffb9d47d@kernel.org>
 <CAC-tS8DbJq_hAcOA3x+mRAihYdPeCDMYJOBng5kqtBN-TaBM=g@mail.gmail.com>
 <375dfd48-4351-445b-890f-cbf3a835f65a@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <375dfd48-4351-445b-890f-cbf3a835f65a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mkeWbQFfo1oJCdVRrkngQ6APIIAe5Enl
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfX5uVVSFBE0Kyz
 nEepBmCCfFjFADOqWZ0OAEq2oWxpczC0Cov6LmkmcoY3mugua+MT6knKr/wAJk8izC5LAYcwx1I
 SM4qkapjDkd6L2+5uzbzilQ7eOesJnU=
X-Authority-Analysis: v=2.4 cv=IPoyzAvG c=1 sm=1 tr=0 ts=6a91824d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8 a=YEwIN1lEEnS1Bx47E9YA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfX1eM5SJu4CVqT
 Ntybn4zDctfJMcArAjjhBRD/MhqUkxkasVYyHAGuIfyYgXFS0zjv9QLi3dC/ECj0opxZHmPd0fZ
 0GeZNBjF+zMY+dfbndQhC7KXy+9I9VO198mY9HV0+w+UieBtGumu2zei97WlQTyPJ5vDn/Dx2mj
 AWUz015OkpxcXiJ5TkneaSA5U5s/fAavGvZPK2IzEHWR5II95fEi19KbEtcrYEEF95HlNg3GalH
 S9d0nAHABrTgF27G3JeY7Eshci/Z+n0ZuuG64YAjeECURUJo5iBxyOKb6M/U/eOpj6yTidqI1cy
 Hgs5QIb5g0NTcFzO7k0v4DgziKL2jKvlnZf6mOGDrQrYciRXOj+VHE2yLos/KmjWwBXQqQQXbdU
 Z3EkKYLh73W8OY/b3sfq3XwHNGWeRUbmnDXRekeJHtT7eQ8OQ/soFYO3h1zrsSaop0Q2uQo/MFq
 OoNCWV5QNdZ+c12i1+g==
X-Proofpoint-ORIG-GUID: mkeWbQFfo1oJCdVRrkngQ6APIIAe5Enl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280109

On 8/28/26 1:37 PM, Srinivas Kandagatla wrote:
> On 8/28/26 9:58 AM, Harendra Gautam wrote:
>>>>>>>> +#define QAIF_CDC_DMA_VA_TX8  254
>>>>>>>> +#define QAIF_CDC_DMA_VA_TX9  255
>>>>>>>> +
>>>>>>> These DAI IDs exceed the LPASS_MAX_PORT limit, which will cause sound
>>>>>>> card registration to fail.
>>>>>>>
>>>>>>> Check sound/soc/qcom/common.c, as the current indices (246-255) are
>>>>>>> beyond the supported LPASS port range.
>>>>>>>
>>>>>>> Best Regards,
>>>>>>> Rafi.
>>>>>> Thanks for pointing this out. We can either add the range check for
>>>>>> min/max QAIF DAI IDs in qcom/common.c or introduce a common helper in
>>>>>> qcom/common.h to validate the supported DAI IDs across Qualcomm
>>>>>> platforms.
>>>>>
>>>>> You should add these ids to
>>>>> include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h instead to avoid
>>>>> conflicts with common code.
>>>>>
>>>>> --srini
>>>> Thanks for the suggestion. qcom,q6dsp-lpass-ports.h is specific to Q6
>>>> DSP/AFE virtual port IDs. Since QAIF is a direct MMIO driver with no
>>>> Q6 DSP involvement, would adding QAIF IDs there not be misleading?
>>>
>>> These are IDs that will be reused across both dsp and non-dsp solution.
>>> So it makes more sense to keep it in one single place to allow the
>>> hardware description (DT) unchanged across different software solutions.
>>>
>>>
>>>> would it be better to update the range check in common.c/common.h to
>>>> accommodate both LPASS and QAIF DAI ID ranges instead?
>>> No, that does not make sense because these numbering might conflicting
>>> with other ports in future.
>>>
>>> --srini
>> Srini, could you please confirm if adding QAIF DAIs to
>> qcom,q6dsp-lpass-ports.h is acceptable given that it increases
>> LPASS_MAX_PORT by 56 (from 149 to 205), which indirectly grows
>> multiple arrays sized by AFE_PORT_MAX and APM_PORT_MAX in other
> 
> BTW, the dai ids are already added by Prasad
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h?h=next-20260827#n240
> 
> 
> You should use them.

Correction, he only added QAIF clk ids, not the dai ids, Not sure why
dai ids are missing.

That also raises question on how did Prasad test it without the QAIF dai
ids.


--srini
> 
> to your question about increase in size, yes, this is know issue, i have
> some changes to send which will remove the need of this static array
> which should fix the concerns.
> 
> But for now all the hardware dai ids for qualcomm SoCs should be in a
> single place irrespective of dsp or non dsp solution.
> 
> 
> --srini
>> drivers eg below
>> https://elixir.bootlin.com/linux/v7.2/source/sound/soc/qcom/qdsp6/q6afe-dai.c#L30
>> https://elixir.bootlin.com/linux/v7.2/source/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c#L21
>> -Harendra
> 

