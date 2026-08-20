Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3ED3BD642
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220696; cv=none; b=gk00JCm+A9TF31x9HhiE9s+XOauzkHNuu2sGffojWF1MvsQ63yYbIXf+34MHB8/XJ6dfvsh4rI8iv6JIvkYwdVn7a3FiG07XXYm5+c1drzC1Eoj3f2SQq7NYwg9mtakmkjFxdL2yVKqYQYTBvGehDWFb8gcCV6ySg3xC+Xv2P8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220696; c=relaxed/simple;
	bh=bZ6xM1SZKB0NFsME1W2oOpRVlIF2Ya5p8rS4SppKXfs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Qd1RfrY5rlGO+DUvfqjgvcjNnCNymv8EOXfW2mu0d6/88Ep13nL2e2cD1W+nfGStq8uLEkYRMCc0vkAsEQzAr8oGPoO4MXD3Z7FjareCiDZNhErRL31QnkvgyYlyjPt1CbGB2LUiDYlYAm6P8yXgu5aEE62ZL6cefCYQpxjPp/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jWZu8Hgx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KFwAuixW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jWZu8Hgx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KFwAuixW"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KA2oiF3132018
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:11:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JssFVA6pCnbDd/6JCffR5lO/LmOJNmyaHajF0VYc+Jg=; b=jWZu8Hgxb7Oi1EyO
	S5AnsPdedZzKsMdHupxMA3mEw0r7fORQjuRlnh8cXYczgQaAaGUa/oXPdZ03qN9e
	7jsW1SqAJGQXIBon8rxaBZ7Y7ptGkDJhqJjs+P37P6BimP+DcR3Uge/xBhcdmTTB
	JcDGZFfUGhjumXPp2pL0nTF6oD3jxXbJ54hN48meGGtsx1TGfJOC+yTVPTcQBdmH
	pXycW0uVxIZMGj+VEu6IckzVa/KLoSg4gf5bWY/15/QTBsLvDDGoRIvw5tr5SFUO
	CJNmsuLpNf6bEEHeOoO+RRarZ5DBAfJgd69qxFP7Rc8ibaEAk/AJJfaR+IKEFI58
	Vt+XSg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg1817u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:11:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936e393061dso188032985a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 03:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787220689; x=1787825489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JssFVA6pCnbDd/6JCffR5lO/LmOJNmyaHajF0VYc+Jg=;
        b=KFwAuixWArueKADSIm4YMI14XdUm8YBlrlUis7+joFqZVfNSWV3/a3Z5T/8o4lyVd4
         GChqlAUUZfY0atRyIGzG90UK32z5yQ2v/VUNR2zhuteJ1IL9Af9GQVLmZNXnPhS0p1Ol
         02AeDjVq65nLzANzG2OMdSI0oPE/q6aqYnWK6LwylbxV+oTTDbzKkMfZ+6ADzT3T0zaw
         i6FZtbZHY1s2L20SbzQ8sD6fdWTMDBRqG0DBwB1auxvV9jUnu26J1d6KgKjY/9CFlnwk
         A6BowSK+vFrtsqW8l4SLjFR/MJHyIPcGRnI6evN3QHCMyh+4zR5jDR04aEoG0EEvbstr
         8kwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220689; x=1787825489;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JssFVA6pCnbDd/6JCffR5lO/LmOJNmyaHajF0VYc+Jg=;
        b=R9W2M6EY/wGJrsgoA6l2+ptBZ/+/mnVd9fKTauA7vdh+XD+ysDjxC/ndKiEA+2mLMj
         kp2Ic8LnNgcbyFNCU9D3Wan0QaDv1vVKB/KYPFYxoyoocPoXrw0ErzT+Ouc4yNDtsnvz
         Ky1bmcTd4teINnaGKneYR9Ov2HfET4i/uTflJNWw1zwlixQfjrSNY0WFSKvo81iBf8H4
         vS4aOM24uTy+56Xi0GJf+F0uNrxglvAy1nzxHShx8C/8Ka88w4Iwti7PiviRVUzTBw8B
         pZHjXbnoTW7sEysbchdRsP3J2pUrl9eO6s6ET2gUCU4Zn6k29SNn5YAPzGSSBK0rZwyZ
         +Y2Q==
X-Forwarded-Encrypted: i=1; AHgh+Rof13AF2EJMXy+Qm9cMa4tsLYjH3Q8+WM08QvXJruSWEy+A8+nWDoGlZbEaaR9P/85wCLZCIWy34IHm1SgO@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9W/lmvtAyv03H5cG4Jw4izJBJmiggZf8ncOtNRDd2v8MUUjl2
	FhvwJAzpAbSvpkbO9WyX03+Wb15yXYCmh/3Bb++Vhc7+dULoa9iG6pCb8AwH6I6awlPc4gdecdX
	DnUqWDkjCGDi5oSbMS8kG5tngsKPgsM91shNrr2iBLdEN+PUCMKz7lSuWHiX0HFLZbfCw
X-Gm-Gg: AR+sD12xRip2101ocSwrrE+jQkACnNjQCxvMiMGDFqVH3dz2Ht8glPtlBhsIFF5Nypm
	pRUliekKqtC/1NYMhyfxtAQowAZTU2Vn16PzYaP+sTMzxW3lx4QqJYos46luPZaaSaXRDSI9++s
	gmAtetgh3aX4JzMiHIb6hFA+XJKRnQ75zbEeZBPp081iZLUMrr+g3G2vc2Ap44/YUr7R9U4+SnF
	ucuC+U/ACNDunG0c1iHwj6r5FckzERXmKV6skItWknvXLz6TpVb75Cn/8Jk/RvbEQ9YuqhrWoJZ
	CWmZ4cVU46xtidW2INsM+m43NJh4QqnoD/0hlYTtSpnLeZxTGMCnP/iTiRvqPJUF3wut8PBGjNI
	OcNuLMWUpkLrP7MJscu8JmwKTMI+1Hgg7fmQr3VHbuuBXNCEpouqGqYLYYtE7l4OUeCSRX4T9CJ
	Ld/gFS9/NJqq/xxMB0TwEJ57sd1ed5m4qsSKq96uO1Hmi6A/TlJHAw+kz9In8mKx4GX3A=
X-Received: by 2002:a05:620a:7003:b0:915:a953:4b9c with SMTP id af79cd13be357-9371e1e1139mr1092985585a.3.1787220689014;
        Thu, 20 Aug 2026 03:11:29 -0700 (PDT)
X-Received: by 2002:a05:620a:7003:b0:915:a953:4b9c with SMTP id af79cd13be357-9371e1e1139mr1092981885a.3.1787220688651;
        Thu, 20 Aug 2026 03:11:28 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24591df744sm49221666b.50.2026.08.20.03.11.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 03:11:27 -0700 (PDT)
Message-ID: <884bb199-e181-41da-b364-9e15cf6b0eaf@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 12:11:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: monaco: Fix CSI I2C controllers default bus
 frequency
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260723114844.63093-1-johannes.goede@oss.qualcomm.com>
 <111bfc31-7f02-4875-ab58-e92bf1ccc44d@oss.qualcomm.com>
 <b690426c-94fa-43b8-a805-7413e45f2849@oss.qualcomm.com>
 <b44872a8-dd59-4f0a-8665-c4f23a6b86bc@linaro.org>
Content-Language: en-US, nl
In-Reply-To: <b44872a8-dd59-4f0a-8665-c4f23a6b86bc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Okk76_V9l8Oep8VVD6IcCBB7nOC11Fke
X-Authority-Analysis: v=2.4 cv=G7Is1dk5 c=1 sm=1 tr=0 ts=6a86d2d1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=SLibtCQ9OJN-eHD75tUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Okk76_V9l8Oep8VVD6IcCBB7nOC11Fke
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NSBTYWx0ZWRfX+auaKILs/bPl
 HVA50ml32n3w6zEIlLakqb4LehwmglmeCdsSg/voyAaVYqTDtpTtEF7p2U129HTaSd96k1s4ShH
 TIwp44vx2qLxySlQp8vX+Ho+YJYgIgo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NSBTYWx0ZWRfX/m0ZDdLjq1kb
 v6yIZNyki57BTGfpmgz0Eyf3EF/LJAWdf8RQ+88idCHMmSYAHA9r05FyFnF1OycCeLZpV2nYRN0
 dblm+eWLtEIDpoD3j9/P9Mixe7PiRrNXux0pLIyV2tNx64XEeX7Fv9TqcAHlZw/jF8ePj1Kup/t
 IM+rJCE4uMK7p8C1gyMBYzGicuOLahYMVNME6b20lhNFgU41nBCQtjPeiXupGrXXnjUQ9WrDBIM
 xAGJjeizP1jwmLSQyeNBiirEOyCgRCLh8hJyqyGBHaIojd32MeOmyglVnZfKUS09HNC2I7S/LPv
 crMCCmwdNlUvkwucnfQ+IIx5O0wN3L/PZYksP60bH8CKfddM1YtmhzS2ur2Q7Nm9sDf9HlXUcC2
 /cYElU3PYNmK7ZCrhmqLi42rK9qHoVZnLd500Hc0F7jLp1cnGvbRILsRwgfHpaAys0nDNZ8OGdU
 mWZqPsYwA+3F6XdQdow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200075

Hi,

On 31-Jul-26 08:41, Vladimir Zapolskiy wrote:
> On 7/24/26 17:22, Hans de Goede wrote:
>> Hi,
>>
>> On 24-Jul-26 1:42 PM, Konrad Dybcio wrote:
>>> On 7/23/26 1:48 PM, Hans de Goede wrote:
>>>> 1 MHz is quite fast for an I2C bus and not necessarly reliable, change this
>>>> to 400 KHz which is a more reasonable default.
>>>>
>>>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>>
>>>
>>> I guess this is a question of what's more common among client
>>> devices. I assume you have some that aren't happy with 1 MHz?
>>
>> Looking at ACPI tables for many x86 devices 400 KHz is the standard,
>> with some devices going down to 100 KHz. 1 MHz is pretty much
>> unheard off.
>>
>> Note the official I2C spec is limited to 100 KHz anything faster then
>> that is an extension.
>>
>> My specific reason for submitting this patch is imx219 sensors on
>> Mona sometimes failing to initialize at 1MHz which is kinda to
>> be expected when going for 10x the I2C specification max value.
>>
> 
> 1 MHz I2C bus speed is in the v3 of the I2C specification dated 2007,
> its name is Fast-mode Plus (Fm+), thus the statement above is invalid.

Yes I'm aware of Fast-mode Plus being in the spec, but it is
an *extension* to the original spec.

The only speed which is guaranteed to work everywhere is 100 kHz.

Now a days 400 KHz usually will work, but e.g. the DSDT of
the Samsung Galaxy Go LTE NP345XLA Snapdragon laptop limits one of
the busses to 100 kHz because the TI BQ25710 cannot handle 400 kHz
(its an SMBus device and the SMBus 2.0 spec limits the bus to 100 KHz).

Or since this is about the CSI I2C controllers, picking a random
camera sensor I've a datasheet for here, the ov8110 lists the minimum
data low time as 1.3 ųs, which means it cannot run at 1 MHz either.

I've seen a ton of I2C devices and I2C device descriptions in
ACPI tables of x86_64 and them using 1MHz is something which I've
never seen.

So 1 MHz just is a really poor default independent of the issues
you mention where we end up with a different speed then requested
due to the I2C controller parent clock running at the wrong freq.

Regards,

Hans

