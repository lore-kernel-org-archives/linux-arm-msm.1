Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3EB40DFAC
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 16:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787763614; cv=none; b=JRP29B8OBYpX+a0AZKnbkPdN+SmdnSh0uhnI63FrpN3qmHRVFKySDsxGqEcZ5Jhsbob4bvUCaSzJXCzFf3pnVkOK/fIGNozs+dH7fo+E/jI8A+592LMKluo/fZhZhg6XVnuYoZLXjCnnIkheW0tycfK00RmjEX4/GXhb+Ndxpgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787763614; c=relaxed/simple;
	bh=QKYEZSeC3zmh2XK/BKCGZdm6AMhBrblM3gg+XaeZC6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=epi6mfuelZRysSQUGD8sDtUiRBt3Mrs2Ge6Vynbc1LyHCDMWKRKk637pz2KlWpoXnvJcvgzN0DrjtHQDA9aLqJrIw8QCJNgbJqN9/MTVeVdNjnCtanD/dkazw8zoHEEqCqnz/uLxItWnaN1VLu8UnvIfcWJ6sClGJQm3jmEoMYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A4eDBhYw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OP8bvpGo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A4eDBhYw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OP8bvpGo"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QGubrU901393
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 16:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	saQ11hVcBW5itbbn9VIVLqXbwdVnQ9NNog4ncbm+MC4=; b=A4eDBhYwS6J4U45k
	3lUCx4utyWKsmAADkd2m+C0OQM0tS1jKVJ9y9u2PryXyeMMiz7MfYfPP2Xo44qas
	jodA0ttOqSB5Ia4BHQJ8Nwoidp5w60wYokACT8FAmfLZe9puvzB5pHTGNt+BYqm1
	pcFSWpwEukIMdO0GyNo3NwjTW1eEVJJ3890JxWs3S4CYlO+IhIWWEiK/iwdScjrf
	Im7VMB/C26d08XgF5VdTUDFfPXduysEFF7rBv3A6MWw1qsmXENPApPuK2aI5280o
	/2SwQBEd2IsamWe8pBBZdWr/7/RGthdKGQej9g8RhmIXMNFaL2Irk3MYuSFhfR/N
	Hp/1FQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga03u146r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 16:59:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3950b1371a7so2045004a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787763588; x=1788368388; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=saQ11hVcBW5itbbn9VIVLqXbwdVnQ9NNog4ncbm+MC4=;
        b=OP8bvpGoOoXQFZgUUJlqvien+Nm+d/B/91uiEG3hQW1tuY3mj1l3wwv8CMRp1yzH8C
         eRWCalUklriNjoK8qp/TlCm6oEY5vi0hyJHIpgyvE9nQ/qKvTf6UcnNT3BCQqRk5uikU
         IbV19ucfbnNWN0K4t7or9psFvFpNJEQ3DosHno1iiooRuah3uzA31RTAlDq8hPKBaVyT
         UguMQZP5g+fiASASb2ZqSVAauoSUu45u0zT6g5R+U9bkfhlPhyJUrhVHIscqya1ca8iO
         pjAMunGOtaMvRv00WJJkg4hVOoUgnZE6ApXlo2l/Wg91E/NBDX3sUH9K645xeH3+D/iV
         +SRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787763588; x=1788368388;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=saQ11hVcBW5itbbn9VIVLqXbwdVnQ9NNog4ncbm+MC4=;
        b=MQY46oDFpdpcH1Pd4P51R/grfkhEzOxi83Cy9rPgw8kEiFb2HKgSqa2LUXQ9Cfea2+
         P3h3KGWC91IpJ5hUjInfSX1hqXjSZrz/INWud3ShXoWF7JkMtWyEYEdqvcyru+nlopPU
         H+vTx4chwQmoHFY421P8w9wIfoPrLdAMxHy5D48YF3G20jhpX/94hYfRbc5CRjfzmUZx
         oEMeGToRs5ElGKnqMSjTiEbEBBEk0IQxt3eAHRT4PE2jt2V65Eq58nKADk+3svTBs4Dw
         0ZdafS3rwaISA7wZs0GZC560/7Mg3WjqcDYi39gU3C5UOee+yUBUV1iLEj+CE1T4rTor
         BhUA==
X-Forwarded-Encrypted: i=1; AHgh+RqqwGL3IVVi6I/HEzl9dWxVlGwGykdPIBgpCE5VwOBVqPv7TXS90yCU8Hua7HMsofbwKZaRg3EZqyW7+7mh@vger.kernel.org
X-Gm-Message-State: AFuF++mo8rFoGm0mUtyo1EhJcekVQ9BXEchg9rC+5w6QX/SoWG8qp6uD
	A2w48GIH46ZTsr0ZxgiOgcxcmnOfJY+XcGXRZTAPsUtdFjaY31doowwyY4zy0karp96GsHWxXtN
	+/dfhgriIlkn3UOFBruzQhG/BclSVZxwDO2mQzojQSLCnTeoA8CeE2zKK68zUx+ORWtV4
X-Gm-Gg: AR+sD12nguNTml3fFS9lx94rSmHHWlcLZ3A/HqdsocOS4/yYdSZtEO9GbSA/eQ36Yq5
	xEqYV9n/QqWrEagc3zTKdAZn7G5X/twfIhBUgXfdhiqfoaBOMeKT9ZhRHxXUyfHLHU5ZxnRzk8t
	dhMR7u9323HbsblQ0wvwJ1RvQuze8hItVfaHk0drsrjWxARrpImjOo6Z56SNNsdpmw1/5xUEhFo
	7y5z9XD6e7fPfYsKRtSIC+I1UtdNEDwHbaRSQKfG15D/r74nG3kHsBeDm/puv095Q8LYATyTxmE
	Ael371+Qkqy2GzcXCyXPmkPFO2h9Vd5q/IsinF+dp+bQsSX7HiDwZVruc9xwdBaUPB21vaBYkon
	JZMpr1vfs56MG3fTipzHlmbeD/BZ4tLEtafX9Ax4KCGKR
X-Received: by 2002:a17:90b:4d04:b0:37f:c97a:939f with SMTP id 98e67ed59e1d1-3966d1fdb01mr15288890a91.7.1787763587978;
        Wed, 26 Aug 2026 09:59:47 -0700 (PDT)
X-Received: by 2002:a17:90b:4d04:b0:37f:c97a:939f with SMTP id 98e67ed59e1d1-3966d1fdb01mr15288797a91.7.1787763587238;
        Wed, 26 Aug 2026 09:59:47 -0700 (PDT)
Received: from [192.168.1.9] ([122.164.80.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645b64c48sm8792338a91.8.2026.08.26.09.59.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 09:59:46 -0700 (PDT)
Message-ID: <8d747275-fe32-4fb4-9c57-ff9bfe13ad1f@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 22:29:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] i2c: qcom-geni: add I2C frequency table for 32 MHz
 firmware-based SEs
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260812-ipq5424_i2c_scl_updates-v2-0-e09cd39d01d7@oss.qualcomm.com>
 <20260812-ipq5424_i2c_scl_updates-v2-2-e09cd39d01d7@oss.qualcomm.com>
 <fa199e71-537e-4bce-a0d8-ef59fe871bf6@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <fa199e71-537e-4bce-a0d8-ef59fe871bf6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE0MSBTYWx0ZWRfX6U631x/vlt7u
 hoUFMECFUcJAS2lV5iClHV+zBRvjwVLyL2LKw7Wmpp8coFfpbufbEJmcFd24fRVL88aYOlEHCYO
 GYYNqKjLyY69pWT+uh0qZbhEdj5TqDUQfmsi7J7JHnobKo1V0MdXRsz6AmX5NFMjbmMzDe9cTNj
 LDMqOoKYJm4k1fNNJbz4S5jMaU/PNN7vGAqF8cilO5rthMvHzyAAwU/KgV0bc89HT2Jft5+2VqY
 M5aOyUU1yIOxjdg3dWAVbLb/t9Nddby94uiNrPIkp6HP9DbvSh5WJF8nmb4jJpIwlZ2BS9HbbA6
 9skxjqdHrG6Oa615yp+ci0T5HJYBFOUjUph5sIuIwzl/c2zhxwY61kPqW6A3s3iTi/tL+Ude483
 5qrxMlERhuEG2yVXsXdNwlcVNZK6umD2CmgFtbttzPWfU7m21B1I2VCj5cDXOtHoiIorm2xcp+n
 Lwj+5xsmsot/v1fO3HQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE0MSBTYWx0ZWRfXz+6ZSy1ePI3Z
 4vBPgsQtrEjufj/yVCdiCwU/yiwiKS5Gfbd56jsQjvwsMDT4q3S4dfNESMsjhiXes97wm+HbWed
 ocMxIvZpE2pQ4eBIv/BjmpUhwogikEc=
X-Proofpoint-ORIG-GUID: qWHexQjANLH6FIroTs9k9v-Pxr-hFx0B
X-Authority-Analysis: v=2.4 cv=RcqgzVtv c=1 sm=1 tr=0 ts=6a8f1b84 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=hGlz9nroTSpjRt0Kr7HQew==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DGHQIYP18U1F1bl52OQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: qWHexQjANLH6FIroTs9k9v-Pxr-hFx0B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260141


On 8/25/2026 10:50 PM, Praveen Talari wrote:
> Hi Kathiravan,
>
> On 12-08-2026 14:00, Kathiravan Thirumoorthy wrote:
>> On IPQ5424, the I2C controller can operate on both RTL-hardened SEs
>> and firmware-based SEs. As documented in commit 506bb2ab0075
>> ("i2c: qcom-geni: Support systems with 32MHz serial engine clock"),
>> in IPQ5424 SEs use a 32 MHz source clock.
>>
>> The existing frequency table does not provide the required SCL timing
>> parameters for firmware-based SEs. Add a dedicated frequency table
>> using the SCL counter values recommended by the hardware design team
>> and select it for firmware-based SEs to achieve the target bus
>> frequencies.
>>
>> Move geni_i2c_clk_map_idx() from geni_i2c_resources_init() to
>> geni_i2c_init() to ensure SE_HW_PARAM_2 is accessed only after the
>> required clocks have been enabled.
>>
>> Signed-off-by: Kathiravan Thirumoorthy 
>> <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   drivers/i2c/busses/i2c-qcom-geni.c | 25 ++++++++++++++++++-------
>>   include/linux/soc/qcom/geni-se.h   |  1 +
>>   2 files changed, 19 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c 
>> b/drivers/i2c/busses/i2c-qcom-geni.c
>> index 00013b41a6f5..15835f10b062 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -187,19 +187,28 @@ static const struct geni_i2c_clk_fld 
>> geni_i2c_clk_map_19p2mhz[] = {
>>   };
>>     /* source_clock = 32 MHz */
>> -static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz[] = {
>> +static const struct geni_i2c_clk_fld 
>> geni_i2c_clk_map_32mhz_minicore[] = {
>>       { I2C_MAX_STANDARD_MODE_FREQ, 12, 9, 10, 26 },
>>       { I2C_MAX_FAST_MODE_FREQ, 4, 3, 9, 19 },
>>       { I2C_MAX_FAST_MODE_PLUS_FREQ, 2, 3, 5, 15 },
>>       {}
>>   };
>>   +static const struct geni_i2c_clk_fld 
>> geni_i2c_clk_map_32mhz_fwcore[] = {
>> +    { I2C_MAX_STANDARD_MODE_FREQ, 12, 9, 10, 25 },
>> +    { I2C_MAX_FAST_MODE_FREQ, 4, 3, 9, 18 },
>> +    { I2C_MAX_FAST_MODE_PLUS_FREQ, 1, 6, 15, 29 },
>> +    {}
>> +};
>> +
>>   static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
>>   {
>>       const struct geni_i2c_clk_fld *itr;
>> +    bool is_minicore = FIELD_GET(GEN_USE_MINICORES,
>> +                     readl_relaxed(gi2c->se.base + SE_HW_PARAM_2));
>>         if (clk_get_rate(gi2c->se.clk) == 32 * HZ_PER_MHZ)
>> -        itr = geni_i2c_clk_map_32mhz;
>> +        itr = is_minicore ? geni_i2c_clk_map_32mhz_minicore : 
>> geni_i2c_clk_map_32mhz_fwcore;
> The source selection remains unchanged when using 32 MHz:
> writel_relaxed(0, gi2c->se.base + SE_GENI_CLK_SEL);

I have to check on this. But in downstream, we didn't change this 
configuration.

>
> However, what about the voltage requirements associated with the 
> higher frequency?

There are no such requirements in the IPQ SoC.

>
> Are they automatically managed by the underlying provider, or is 
> additional handling needed in the driver?
>
> Reference of konrad change for CCI I2C driver for 37.5MHz with voltage 
> requirement.
>
> https://lore.kernel.org/linux-arm-msm/20250904-topic-cci_updates-v1-4-d38559692703@oss.qualcomm.com/ 
>
>
>
> Thanks,
>
> Praveen Talari
