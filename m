Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC3443F4C3
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 15:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786463968; cv=none; b=Hm3vZwxNjetKxENDoXLkPeVX59t6KKQEO8oUDWUl5GSgYPxAUxpAdf+wb/EBEMurEZPWmRM+186B8/pXpd0MB1IWn/hCIxfhqxbWMg0csbI7RRWfSpvc4gMVry2Abxm0DJeGwh3MrpMUzsXzTkG8qRinwAPtj3W2VcaaKtln2AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786463968; c=relaxed/simple;
	bh=c7XWVPIrtzDy3yNpuL8Ga1a+R1NHWYdnDUUqTNp9KI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pj3csoENarnBUlZVQipO0yNeFbvar7OemghwI2bs2w2s7jdXkVVEQV6bR0enIj1FhIapaeaoed+G/kI/hGZS3zqOpEJHq7330viLTpA0xYQ1c2vkpZ0KdxaBi1i83D5SpoNWmojjQbT33oc2PJGornbL6RAyHUo818XSfuCvPzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KO/eO+pz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fYIbw8+i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KO/eO+pz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fYIbw8+i"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDX0kf693996
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 15:59:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y6wOPYYtmKIqj95qma0W/5EiM5dJQOCqAMNjkBDRMOY=; b=KO/eO+pznKNcOc/3
	s0DGg944VeJxlqt1hAr+TmK55GzAMYD7J5UgiAMkVa8oa9IB1BIKyQQGc61jZmwp
	qIxl1sy5aAKffdGq9/I0sME1/E52iUPRgMCkYiIOeZs/QaRoj+mb27nP5Sr6mPUJ
	zty1I0p4g8Sbce7uGcLG3LINng14DYlp1xkb998HszaDwBi13F7xBQlsU5r7x6OG
	nmO+ATf/7OfgqfGQOGAFB4tVwt2MixVCVZRgUhG7S3Eu6poD9SB0awPZ8QUxjcrP
	0Vgnhiljb2GyajF2syApcRw7uvaOWajhB6WRl6SC09KpLih9zRdwimYayhfPPAoc
	UFOd0g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049gru8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 15:59:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cce14a21faso519355ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 08:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786463961; x=1787068761; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y6wOPYYtmKIqj95qma0W/5EiM5dJQOCqAMNjkBDRMOY=;
        b=fYIbw8+im9CuxNQgYOjTuw90SI8C047hZFvsi1rzF2LvLXaOWM6WSCocAoWHsDkzCn
         P71LJy/CJoy0kiSNx7RjZMwqnsxGXT354eUlM8XrKjBpekFg1/stfCLiqAdUzhM9oyEC
         e8btrAhNdsEIWWBC2ShlRxgt8oGV83UcON7VP9ywOBnxIpUHVhDuFzq9uayC+xbmdp9m
         P5b3ok42ZacuTlj4ehjEG4OGBbEqMTAPuSr9zabUBj8+SbOyeRE1BU8pfTb2s/jpWUJq
         iLfdQOyXE5AdXtajQFQ8iRmI7vnQuKErWTrkHe2lX6EObVqUmJtWk+QqSlr2ML11IZ/b
         xb6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786463961; x=1787068761;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y6wOPYYtmKIqj95qma0W/5EiM5dJQOCqAMNjkBDRMOY=;
        b=QKPvZbLuEXI0I+WiRfQD0f47KNkq/Sh9BtP58hJBbxbcdvVzH080Zx+yq6FZlTNSEa
         dgYz0kRpSKM+T3y2z1k7CALm/T89jijDZOHzVrJmxFOUflhavZXFW4tW+cNfcQynSSvt
         W7bpIedvDDmahuP/xM1ne+r0kX86+Raus7KprUTqAHbuZ+f9hPW/UyvL1TkuqdltxQbC
         9fXNKgwwu8nzupFDS14wrVCcPUnwFaLT5GOhRPvFX0x55zPZrKJyUdk2qnUpMwPassV/
         WS8vqi32zikmSRuQ0i+GDba4AeqDMjP0sn/TRaSPOI/qFxZHNRJN/tMEl6ITpGSaSUyv
         Pj5g==
X-Forwarded-Encrypted: i=1; AHgh+Ro2efoj/WSXokJH9DveLUE6noumwoL7FwHhm0sxe49e/GkxWp8Iuw8UzxPTnosNWD0mwn0u9OEDuChKNqQi@vger.kernel.org
X-Gm-Message-State: AOJu0YycCDxI6qMrGEbz7rulXgPPaoQnV7+najZZbgbUEjdruPlHejm9
	qNi0PmgfVPrCDyC2Owa0YJiib+tQdfvx6OUXaDnJrde6m8kJhEVqzpR5PuxK6GKcmw4BvKEth5f
	9qs9ywh3X71mV3XGaXe+LM/sBkaS8X0zkw59svcoQX5pKnWMzihjA8nMnKjPz86Jt6GL9
X-Gm-Gg: AR+sD10BxM31mNG5xWZP28ZlS0Dz1ROfbqSKcKUJ/ABCRH5O1440TJZp6S2kZB4hX0C
	XFdiRhPzKXyqjGcrwmKLN5Igtl0u99XVdJBsMUcTGe3VpKRDI5nbMfGUsp3Avbz9poqGVfAO4eX
	dJjDVFar3vfrK7CLgyg2BbLAbowA58HKvNJ8tExWlt2sY1pgV1GdP0HLbst2rtC0RcYfNA7Dk+F
	66GSKIJhsyeqicXxsPdUQUmxu6DmLIPP54Oud0OA8oPkT3iq+VkswWwG+eW7SOLkEhqzASZRyuU
	fwvmy2p00SsEdokXHGvUjFFtkEkuPERSOH2mGyjU0tZAWg6VgpetMDjDMQ7klvGn0dhxh35IWje
	GCwF/gck2nWlz+XV5U/efl5eOL5RsIKQBD+ocE/gvyGZl
X-Received: by 2002:a17:902:d552:b0:2cf:41ba:96c2 with SMTP id d9443c01a7336-2d32e4ed90fmr6535305ad.12.1786463960748;
        Tue, 11 Aug 2026 08:59:20 -0700 (PDT)
X-Received: by 2002:a17:902:d552:b0:2cf:41ba:96c2 with SMTP id d9443c01a7336-2d32e4ed90fmr6534945ad.12.1786463960205;
        Tue, 11 Aug 2026 08:59:20 -0700 (PDT)
Received: from [192.168.1.9] ([122.164.84.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3160ce674sm10523625ad.49.2026.08.11.08.59.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 08:59:19 -0700 (PDT)
Message-ID: <c50a0fc4-97c9-413f-8405-584f729eba04@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 21:29:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] i2c: qcom-geni: Add I2C frequency table for
 firmware-based SEs
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260811-ipq5424_i2c_scl_updates-v1-0-bddcb2ceebda@oss.qualcomm.com>
 <20260811-ipq5424_i2c_scl_updates-v1-2-bddcb2ceebda@oss.qualcomm.com>
 <962122da-47cd-4325-9ced-ecbee2281580@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <962122da-47cd-4325-9ced-ecbee2281580@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEzMyBTYWx0ZWRfXy8Vkd9vfHIm4
 /8XwsS+1Z+oZuoY29ytGU126f/w6g9B5CW60AlUD3+6fRweoG38bWe2vAX5piRrHqleY+Ogivkz
 MZw+2Y1y1mUg5NpT6hfIKrkUGvjZ9KY=
X-Proofpoint-ORIG-GUID: 611Ss7-Coz_Ytqldl9UqQxcbo_7XNMJU
X-Proofpoint-GUID: 611Ss7-Coz_Ytqldl9UqQxcbo_7XNMJU
X-Authority-Analysis: v=2.4 cv=cvarVV4i c=1 sm=1 tr=0 ts=6a7b46da cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=0/lRlipvHLU+ZVN6ZkkSUA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=vrlhrcIekUZfEXex-bwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEzMyBTYWx0ZWRfX5X9hY0LtsNVi
 T3gbEsOiFLg/ygk5czHXQTOqjjU4TqBOLSpiqjcd0tKRseTLQDUEZ1flPYpt0HeVuE4I3wYIUzz
 HUPBZxQpJOwdWjdORGtOi2zJRI0QJr4wek2bvN5V4hui+8zxa1BdJewMa6PHNwp4/0iLBSQRMOD
 t64agl00B78b3HTr2Jh/hzNjtrxGlzsD1JlsCMH2FMWBp3A3EF0tAUSRIyTk2ZN4rA7+Fbe6pC5
 WwJseF+3SfWGR8NjJbA1lIXc8n2V/UUmG6V0HLg+oN6eUECQ1iTUgdrP6KJN3OHyVczlhI0OuNT
 bC9LKWCLkl2HMZVN92n4HdwgRhYimzuHehcFJ7gsZHoxEH8CwpUo5b/dd9j1dP7uSm6XhWq4Jot
 Vr2mwP0STUyl7QaWLd2st0SQCP5W0uLAeMISLPyC8QaNy9RvmnWRB5DLGweBZFaHVK9+xPxqTqK
 DPAZgDrBDnuAaAXp0mQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110133


On 8/11/2026 6:12 PM, Mukesh Savaliya wrote:
>
>
> On 8/11/2026 2:53 PM, Kathiravan Thirumoorthy wrote:
>> On IPQ5424, RTL-based I2C can be supported by both minicore and firmware
>> based SEs. For firmware-based SEs, use different SCL settings as
>> recommended by the design team. Introduce a separate table for the same.
>>
>> Identify whether the SE is minicore or firmware-based and select the
> what is minicore ? Please Make it upstream specific, RTL hardened or 
> define minicore first.

Ack.

>> appropriate frequency table to achieve the desired bus frequencies.
>>
>> Move geni_i2c_clk_map_idx() from geni_i2c_resources_init() to
>> geni_i2c_init() to ensure SE_HW_PARAM_2 is accessed only after the
> Reasoning required - why only for 32 MHz ? OR better reasoning for 
> 32Mhz support related changes.

Ack.

>> required clocks have been enabled.
>>
>
> I suggest to add 32Mhz support as this is already having 19.2MHz 
> support. Subject shows generic frequency support sounding like no 
> support present.

Ack.

>
>> Signed-off-by: Kathiravan Thirumoorthy 
>> <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   drivers/i2c/busses/i2c-qcom-geni.c | 23 +++++++++++++++++------
>>   include/linux/soc/qcom/geni-se.h   |  1 +
>>   2 files changed, 18 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c 
>> b/drivers/i2c/busses/i2c-qcom-geni.c
>> index 00013b41a6f5..2f3026602c0c 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -194,12 +194,21 @@ static const struct geni_i2c_clk_fld 
>> geni_i2c_clk_map_32mhz[] = {
> rename to _minicore ?

Ack.

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
>> +        itr = is_minicore ? geni_i2c_clk_map_32mhz : 
>> geni_i2c_clk_map_32mhz_fwcore;
> _minicore with above table renamed.

Ack.

>>       else
>>           itr = geni_i2c_clk_map_19p2mhz;
>>   @@ -1046,6 +1055,13 @@ static int geni_i2c_init(struct geni_i2c_dev 
>> *gi2c)
> [...]
