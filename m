Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821073;
	b=1oYd/BLfRe4H/ctYzSoe8Yqpk17IFIv2X48AFRP863YhuuW/KW++UetaIrBWqSdf64Fl
	 6pMJMUeBQ/IZQJQp8zRuGEQe+P5QjNvchcS41KJy+uCCcK+Dn4VjjJRaaFvdwPpbY/KOR
	 Kxy2jm4PXJTLC9vvR0htI0VAfMzbz9wy5JSV9eeFJ0xbF6bt23HYZ5/BhuhBC/5tNJolZ
	 B6FF+9lqtWlsIvCQ684B8MuDNqCgayxXLTvuJBJ5JNuC7pQhxADZ5+12sGlk40WHFEz1l
	 1cy+4KE7VkUyQrj9hrQQ2SyoetaglXhhcmJAGDM09W2llEjNtvfcRCbE4xNDCaTZfyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821073;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9/OFrJ8GGE9h5yRFJ66Xeugo3H18/5jrLH6ADJy3KDU=;
	b=2OC/5cJg+TNvdEUgU/NKdxul7P9ObW30boZm6UxXIA1qFz1uWLQYujtKU7uvsN3IBhJg
	 t/YS6Jv6na3S/9E2l+zAr7WZB7yXBRhJMVxEoxvl+VcIARI2sQi/5uEr/BtNsqYIlgfm2
	 J38GGGry2ozgr7viyzCVoBExLhmSuhIxB2nggq9UIQk53N885NX5av8qp1ClqlzPXWEOl
	 drvUSbeShGXebk+mfgZhYGBLL50DLoGrglWE1Uv0m1wN5zIAAF55AJtzCJiCDqdZMalrR
	 SEjzw2e/VCXITtHH+9rkXKOhNtcRJt2YfJfj4AHIG6/Pg3c4yeDnFh3LZqPtBsm5UOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=orkRQADS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BVcXMdxe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0136960B4C02
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 19:37:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0136960B4C02
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=orkRQADS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BVcXMdxe
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Fj6ef3208773
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 19:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9/OFrJ8GGE9h5yRFJ66Xeugo3H18/5jrLH6ADJy3KDU=; b=orkRQADSaGoJA41q
	M3ucuAKlsyuMkNqB0/eHQR0+sNhCFqnjWtlyeLMDJRZMU06NlUf80dJHdEeqOqcp
	kzp42KOc/OY8+XBtwlEqh5LCaicasOhfM4/ZUr3NIQCmZ5zka/tNYzkQJdGIo3oG
	9NFzvoo0Lq3bEoH82qaWTSjSFEftDL2RRkHVr2UJvfL+IVFZlmW7NkRqNC5k1ZjS
	tDgxpjw69QdCPJ2iCGZlZwtLx7e6jyRpU+uZmExYqICFBDIEUaYiw5gz04kYN2na
	Ic5W9DcrjPCWuIxrdyU7TX5H1vtI+PJ52jWQWg/11U50uIRp5izUpoTzEKVQpXvu
	r5cxAQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bj1b7r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 19:37:52 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a0592d4539so1573549b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 11:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793821072; x=1794425872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9/OFrJ8GGE9h5yRFJ66Xeugo3H18/5jrLH6ADJy3KDU=;
        b=BVcXMdxel8p1zLqX8GBFTbQQbpqnJet3Xe1hR425mDzvPB+MhP+4CYLIig/Esu7km5
         zThzW9ma+2J64CBfErYWRHcR0JirH0INHwDqEgqVCte2JWg9hHzbsGVsAicZOmCcCrpJ
         UI7VZtqsMVk8TBQPCtxYr8m5HsEF0wZSXXY9Le8Ppa2e7GnRD4gtKoACJgoSaLZT0zin
         uibkS+dfSTq/iuTh6wxDIQpfwwtybJoUCYgL5pT7aSA9RT/10bJyoLOtjVaENgeepd6E
         toQksNDNllbJf4njNL9eOUCy9Ls12pXVezlmlY4UTvgN10bWBoThvo3at/tMtxCy89Lt
         qzbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793821072; x=1794425872;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9/OFrJ8GGE9h5yRFJ66Xeugo3H18/5jrLH6ADJy3KDU=;
        b=sHPeODdoF8AvPETlSkeSEOADQwTy4lCDodrzWE6TxN+Qg5lCGDuPtdzhe8oG3igoT0
         6Dd6U75JAafNYwaw8HMbpv7rWCBpO7rG59FiIb4zvRygi41R2fGw97SA6dmdgVhjbRGs
         z9OOmceIRIfF8hH0nzBA53uCzK0VFuTsiq+zjAZqfTxGMdjq8R7WMIK0f2Fr51Pj8PlN
         Qkvt6lTmZX7iIH75tbxZclF0jgbt+24l9Quq6FwVqQ/AnjD9xQr+SadE21EZobNLm42l
         HCq+w3rGErOV5dD12VSWjrZ+c2UOry4HymkWyjuKrvRGHsnp2ZjiA9tvw+BI5i9jdFtO
         ZXjg==
X-Forwarded-Encrypted: i=1; AKwUvBx+Hwe/HGMS2RFtTAMjFc1e9l2FfvzhSEQ7f9VMgb4QdY/YBKaX0hNv88x/hidQOYw2onVotPydi2lO5Ow7@vger.kernel.org
X-Gm-Message-State: APuU4Z/Z/veFTuANEBMaXpsnYzGgTMDj/iQeuqlRASub810SkRZXsGUf
	6eNZs/+XmzXRQ1cLso40c1AWPMgVT3/nKJMxUJDmTXgky1bLd5ZbwZd/3MfvoHVmBl8t96aDOa6
	du0aDwRma6mK8pKco5dTsIbF6tRVXcR7psWnBvMyKIg8f5VKsYoppTnPqZfTI+3GFy54=
X-Gm-Gg: AYBFou3IKRLU738IP/FvIn7onjMj0KU+iCYuyFrzRvFJglBXWCMoJM+tJnJL0HkX6nD
	jnCmRDvwfOpAlfPtYVaOGIvsdLEpwlgEvgILymGX8k4aJFUe5hel4b8EAUEc9yyXInp4JtYYLWO
	KEbFwLbRAZ6ZOK7E+RM24bNJSV2Hs3+5gMIbk08eTRDcvIM9OIaPVfMDJqSi4BTT2PuRLk/cnnn
	6ZlMVFP3OCwP3HT1ipsHz/aCpxE+pjp/Cuqfzsq59ROdLQzXY1QJd2XDqQ5g31L5rEnN1HCNqle
	OYQuKnYFqa87pGm2o79Y1dobg6pxfL9Ok7n2bupIRk0Y0seroespxCfaXyp1Gv6Rwzd9QHo5Xdg
	XLvDXyjhtrRbYSZGiaBr5xJckWSpMuRL3DOZ2QJQ6MpeUainmOWmyZZdN+lG8y7lM2yMj3yOjRJ
	gYwyQm
X-Received: by 2002:a05:6a00:1f0b:b0:878:34d7:6a24 with SMTP id d2e1a72fcca58-8a9beb69d9amr14143261b3a.38.1793821071594;
        Wed, 04 Nov 2026 11:37:51 -0800 (PST)
X-Received: by 2002:a05:6a00:1f0b:b0:878:34d7:6a24 with SMTP id d2e1a72fcca58-8a9beb69d9amr14143249b3a.38.1793821071128;
        Wed, 04 Nov 2026 11:37:51 -0800 (PST)
Received: from [192.168.1.86] ([65.181.14.223])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09a7cc082sm1275492b3a.12.2026.11.04.11.37.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 11:37:50 -0800 (PST)
Message-ID: <6f2f8357-59ef-491b-95f2-d58feb362ba7@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 06:37:45 +1100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tee: qcomtee: user: check the parameter count from the
 supplicant
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        HyeongJun An <sammiee5311@gmail.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
References: <20260730062219.2836938-1-sammiee5311@gmail.com>
 <CAGgiveUc+TkGyGDxuuCLpHO=i22-4fn1CqjqnnmWLdWWYOZfPA@mail.gmail.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <CAGgiveUc+TkGyGDxuuCLpHO=i22-4fn1CqjqnnmWLdWWYOZfPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA3OCBTYWx0ZWRfX5HZkcIi6TWCo
 72hhic4H97au1qGf9bfVT3Trs8n1MOfmeZ/5esTyy/t6dtRfT/C6UX16kPZSAHc8LIcDFE8/eRa
 ZIt5Xf5fUVZb/OwMJOTKKFmc1PbnEucXpodUbjp55ABb6rPlB+vBRzK84HgzTkOlmfZHByE4X1x
 fTjVKwIc371FJV8pIwoSGiiDnJ9Nsksmjg9amHXD4JkxSIGDFsrD5FENB1wUjKSe9mzjWkQPiul
 n9oAFDfziRe5IoZA7Le+xsrbMBJxLlvuQyutwPgiQ9+foDYIuWLg4+yW4Q8rHKzC8mm5rn+TgH5
 uUoXbdVKSfFpybvuoCeF/6OaeNPUz4H8N4bCrshLQUbTFQUVcfLwRPfuQlfzFjJ+80ngSNsqa/7
 BFA0T+3+JS8KcyfegMAV2h5eJ3cwDXY7dmrgZytoFxIO8txpO2zR4dTTV/3yPMQ/SYCNP9Kgkzx
 uXMp8kRj8oEv5OBjErg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA3OCBTYWx0ZWRfXyizoyDbrk6AQ
 0ntIaTqwnR0FKgVzkkmyc/ZTJbhbkzp/LifkTgRU7doUkSjMcVtcq4Sf9Gy1rkDsrf3xd5RrjkT
 3nDejgrQTjg/uu9D9teNtDVdp3NKFqE=
X-Proofpoint-ORIG-GUID: BbHwVuWmj4fl8disWa0b-NJkk8g2Fbzr
X-Proofpoint-GUID: BbHwVuWmj4fl8disWa0b-NJkk8g2Fbzr
X-Authority-Analysis: v=2.4 cv=N/u8hG9B c=1 sm=1 tr=0 ts=6aeb8990 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=YVmDP9EW+FTsGeEl22X1ng==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=47U92Yqy_zLrgJxgMLYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040078

Hi Jens,

On 11/4/2026 4:58 AM, Jens Wiklander wrote:
> Hi,
> 
> On Wed, Aug 5, 2026 at 11:23 AM HyeongJun An <sammiee5311@gmail.com> wrote:
>>
>> The qcomtee_cb_params_to_args() walks the argument array QTEE asked for and
>> indexes the parameter array the supplicant supplied, but it never looks at
>> num_params. A supplicant that answers TEE_IOC_SUPPL_SEND with fewer
>> parameters than the request needs makes that walk read past the end of the
>> allocation.
>>
>> To fix this, reject a response that is too short, the way ureq_select()
>> already does for the receive direction.
>>
>> Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
>> Assisted-by: Claude:claude-opus-5
>> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
>> ---
>>  drivers/tee/qcomtee/user_obj.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/tee/qcomtee/user_obj.c b/drivers/tee/qcomtee/user_obj.c
>> index 10452fcc7ccb..2a594ae299da 100644
>> --- a/drivers/tee/qcomtee/user_obj.c
>> +++ b/drivers/tee/qcomtee/user_obj.c
>> @@ -507,6 +507,10 @@ static int qcomtee_cb_params_to_args(struct qcomtee_arg *u,
>>  {
>>         int i;
>>
>> +       /* Supplicant can not send fewer parameters than requested. */
>> +       if (num_params < qcomtee_args_len(u))
>> +               return -EINVAL;
>> +
>>         qcomtee_arg_for_each(i, u) {
>>                 switch (u[i].type) {
>>                 case QCOMTEE_ARG_TYPE_IB:
>> --
>> 2.43.0
>>
> 
> Looks good. Amir, do you agree?

Yes. It's correct. The check is missing.

Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

Best Regards,
Amir

> 
> Cheers,
> Jens

