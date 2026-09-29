Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520223DA7ED
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 09:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790675996; cv=none; b=fegJaLBnMVE4Zhq4CJyzty8Lv015xCXR+M8DdccF+o6nG1KUvw+JWUs+dKjcmFmYkE9AzpbYiDW38qsU3DU6Pftp25235849ybnD7RiZIq5BVUlWG5P+R4pO/ULHjSvFDOdJYztkak+6x2EHQov2/3GsCg16b9emtxF7zwCtu6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790675996; c=relaxed/simple;
	bh=9Xgc6UQ5KNhU9TgRSQYjuJRejAzY/LAix8Z0rUXJIYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nyMNWe7UfiScdyqIULZBO+VLC/P/3qaWvDeQntviWEPRGPmWAZ/iTdRAAf++tcsfZ1XmCSNrsECh1UNs2H9rJhuYteRSPKf0FtChmowpMm/4kyBZZuxb//GfEbFDBjbKREVGrc7RLag/7qyQ3w8FMksxJEbMKzQ2huSnpgZz0WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mXDRv9bj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ayiJtHeJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mXDRv9bj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ayiJtHeJ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7U1Oq3684787
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 09:59:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SitGaPdS1185rMwXB618H8QLsSJ3+iy3JIMMMT0jpes=; b=mXDRv9bjA58j+Tob
	SE7hSwMlWvbcfx41LCoagatKQWM0+TWRE1ieogFPw8Gh61qLUUoVmvh8cAdPCyLV
	bLBDAe42vT46BMmSiEmh5vChlAQyYSHtVYpsH4Rpqu4VYeLSsBOGHzSSltGEY2du
	TT+UhktN863kN6EQRmd0Y+aS6+dNqIa/q/0tKnYYppaf2MqAaS5Dr3b1+pITBfn+
	Qvy9i0mwJwJ+okxnimNlLBvKRwbDgsWqhdnXYDyPxa5tfmSbyoMfZFrJvuJXwWqe
	RtorqU6ZP3j5VFwBvh0jR90J9bhugvyag8QVQ28Ruk/kl/a/3gGeKyRZZyIuaDKt
	5zLKyw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0144tba6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 09:59:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c57e0436aso321520085a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 02:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790675989; x=1791280789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SitGaPdS1185rMwXB618H8QLsSJ3+iy3JIMMMT0jpes=;
        b=ayiJtHeJKy/Bcyaw0vMyyh6HbSXZWOgVYsnW0SMXMpDKUEhqFsKA9YZDd0ZB34K1Uf
         /GktmIG0K5Vb7axF1VMD1mKzC3z99NyrL2JoU9bK1AH/GvrEKD7iI6znioIZAseTJ9Ga
         KVyNylqlx10rsZSZGzsv5GkSYDz0CHTYL/IIBd5KQb0+/ykr8D2Qd2LT+1XpGkYgt2aH
         ZIr4xWlcw4IvRaS1SQtr/motzH3L8B44/GoV15V6toxAGfr1+t4zODQGDrl1LcXvUJmc
         1JKKb4l9UaBYmNFmDKByZDi+E0mwi+apwT/eGImOIzkqcBexkoXySC0bCY1wQKjNVUjx
         bP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790675989; x=1791280789;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SitGaPdS1185rMwXB618H8QLsSJ3+iy3JIMMMT0jpes=;
        b=MMkHPQROXASaVgC89DIV+rns8BA+BPjxBWCaLNXThVHrXNBYviKRkVkM0uNYK0T9Re
         fG4d8R5GzIenUo5rvE8BRmLpAdUiFhSoKOMwMkuuVh7Tt7VlJLQY/VavSE7l9yXvDsIs
         ADtG4oKuzs0Bhww/lY2+iDvtmyctr5YbLuNZCotqb8kebWR+n05OGe4aKr0g5muua9iK
         zV5AeM9Zdby+Tv5VzTZJQRqRmSfdBhlStCOcUShp1m2FR7PnYcB6aQRtPeO0yZ6USNZX
         dpR71k2XvfdHbKAHTgbdW07zKI5/BH0CF9xVUO/ZJk+rXC5iYt5EJQY/gv8/Ing9ntoV
         gDUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUSg/k5OH0O9Rj8Af3QgJbrUGgyIPS9Jcpp2cxrkHWRkQ3IEcMCg/SD4jg8hxXOMZiNJhRTC24ceiosom/@vger.kernel.org
X-Gm-Message-State: AFuF++kYu6/x7q+xg0VXBmpEQsjBt1J9EecgpWz/Z89luByVptZK4wky
	PI9GBj09e868S/IBs7M9bN43F4WAWiMII7pOqaU7rieyrttI9XAEGDn6K6jNzSRa7QXSlfmZqXk
	sz6kCuR9DuQv6x4tEaGqEKd4cxDkzt3zlInMxxN38lEtcQfZt9yyzwmQhFsDyV/tuwEX/RBLi9m
	JA
X-Gm-Gg: AYBFou3RdcNIXOBeU9o5r7zd+nWin2/Fc1TLPuHclhvAajs/zDNkO6A6JptOMbwC9GB
	E0w2Hq0RwZK/cBMGtF9Bz6b/PiMcBxMYHgKzydW2pd9Uk6/MXZCeewI6srGBDPv1toyipGzgQ/V
	v1xAkEZPHVhkV/W8VN6OXsVzix65GZsYEJQKkLkKcYhXvG9zke3+1DpxgbJ3CUS6u+ELvD4sZYI
	NAwuYOoiMGTG0Z9f00B2rBEImNWgQY3f4/V29ejxtqASA8rI0zNnaZn3pFM4+rUsyieVZKjLENl
	2+NRBEBI2cj75GYpIZyW0mGqGfMopXQiQHLwjbIlbbVa4tDZU66eIIJyeZzdOrIj+BB/Pm+KYGf
	Qjbu1s12+POlef8PYm+4ZFiVVTnE3w5C5goeKvtrX+KmSZQxmFL7UrM+5mvZgFw==
X-Received: by 2002:a05:620a:6cc4:b0:939:fd0e:9fd7 with SMTP id af79cd13be357-93c43cf88d6mr2578310985a.43.1790675988722;
        Tue, 29 Sep 2026 02:59:48 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc4:b0:939:fd0e:9fd7 with SMTP id af79cd13be357-93c43cf88d6mr2578307785a.43.1790675988156;
        Tue, 29 Sep 2026 02:59:48 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af502da06sm3353200f8f.11.2026.09.29.02.59.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 02:59:47 -0700 (PDT)
Message-ID: <4846bb08-9317-407a-a25a-8437a599ee7d@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 11:59:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, johannes.goede@oss.qualcomm.com
References: <20260922181818.5503-1-daniel.lezcano@oss.qualcomm.com>
 <aruFjEq4AfcIOxa3@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <aruFjEq4AfcIOxa3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzOSBTYWx0ZWRfXz0z7REzCIzbf
 5396kSfjw28QJD40JypHeHay5tVgYVN/7JCZGNsXP5Vi8KmZ+CvArQpbQpqeh662zucvQpBPIoS
 xl+fLpdUO+144BEgJkzuP3unEK3zv2SrObijtSU1vNUrTvy4cGWIzDMBNMjhEdSIKig038xpip4
 hHdWM3ts4N5fk/QlnY+obt3md6AmDpdhWCu+Yg3S3a7wzCGie/sRCsjqwPvw+vKp1n1tqmUpZ9F
 jW64wb8O9MhF18K5hIffO4LG9LA982f+7QPg12JlPCq8Zsl6w6HAEdg73kEOJ9CnySuyWEqXPWS
 PpWYyYrsL7JnWyauxIPutJhdcQYGY3xJrJ4rg+H9VtaxVgaAd++qz5JidWflUkumwMrU3T8+grj
 v5zoP48Ienu9rqgQycV9MmLUvUokoRYzr/8zn5h+ebnTSWavXxfPx1wAgZDxWrVo3l26iSnJB+z
 /ynfwxVV2wsFlGQmSQQ==
X-Authority-Analysis: v=2.4 cv=FJSOVOos c=1 sm=1 tr=0 ts=6abb8c15 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=8k6WQxmsAAAA:8
 a=7Jf4kJHaAAAA:8 a=EUspDBNiAAAA:8 a=yHKr3JDVMgr7eIydpkwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=B30mOkiisUNQCrgcu9ts:22
X-Proofpoint-ORIG-GUID: C18eYFZThNKOIrAdX1V-_TyDSB66PoAb
X-Proofpoint-GUID: C18eYFZThNKOIrAdX1V-_TyDSB66PoAb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzOSBTYWx0ZWRfX6a5ZtjwzYPJO
 tZDZp3L9k09I80sdXQ66vQE3sUO7hFKcclt46KC1oyJuArUvPxUqkXzZm9oTpeJnbk0qY6n6eXx
 FHPTpeyR8TUyF4TgkZ4VDWqZzIacWG0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290039

On 9/29/26 11:31, Stephan Gerhold wrote:
> On Tue, Sep 22, 2026 at 08:18:18PM +0200, Daniel Lezcano wrote:
>> Add the thermal zones for the ThinkPad T14s and describe the board
>> temperature sensors exposed through the PMK8550 VADC.
>>
>> The keyboard area is the main thermal constraint under sustained CPU
>> load. Add a passive thermal zone for it and progressively throttle the
>> three CPU groups as the temperature approaches the 53°C limit. The
>> groups are activated at 49°C, 51°C and 53°C respectively, with a
>> 1000 m°C hysteresis and a 500 ms passive polling interval.
>>
>> The cooling maps limit each CPU cooling device to state 6, which
>> corresponds to approximately 1.9 GHz. Testing showed that the system can
>> sustain the workload with all three CPU clusters capped at this
>> frequency while maintaining the expected performance, making it a
>> suitable upper cooling state for thermal regulation.
>>
>> Several configurations were evaluated while tuning the keyboard zone.
>> Using a single 53°C trip for all CPUs allowed the temperature to rise
>> quickly but resulted in a stable operating point around 54.3°C, about
>> 1.3°C above the intended limit. Introducing staged cooling before the
>> target significantly reduced the thermal overshoot. A 49/51/53°C
>> configuration kept the steady-state temperature close to 53°C, while a
>> later 49.5/51.5/53°C configuration improved the heating response but
>> shifted the equilibrium slightly above the target. Based on these
>> results, keep the earlier 49/51/53°C staging.
>>
>> Also add a passive back-cover thermal zone which uses the GPU as a
>> cooling device at 64°C, together with a 73°C critical shutdown trip.
>>
>> Describe the remaining SMB, SDX, east and west board temperature
>> sensors as monitoring-only thermal zones, and enable ADC thermal
>> monitoring on the corresponding PMK8550 VADC channels.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>> ---
>>   .../qcom/x1e78100-lenovo-thinkpad-t14s.dts    | 142 ++++++++++++++++++
>>   1 file changed, 142 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
>> index 5cc6a63d1ef6..9407868864ad 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
>> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
>> @@ -10,6 +10,117 @@ / {
>>   	compatible = "lenovo,thinkpad-t14s-lcd", "lenovo,thinkpad-t14s",
>>   		     "qcom,x1e78100", "qcom,x1e80100";
>>   
>> +	thermal-zones {
>> +		soc-thermal {
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
>> +		};
>> +
>> +		keyboard-thermal {
>> +			critical-action = "shutdown";
>> +			polling-delay-passive = <500>;
>> +
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
> 
> I believe this is "towards back cover next to heat pipe" on T14s, not
> "keyboard".
> 
> SYS_THERM1 is RT8502 and you can find that labelled on the top bottom
> right in this mainboard picture:
> https://download.lenovo.com/Images/Parts/5B21P83385/5B21P83385_A.jpg
> 
> In the T14s, the mainboard is mounted 180° rotated, you can see the same
> part of the mainboard in the top middle here, above the heat pipe,
> facing towards the back cover:
> https://www.notebookcheck.net/fileadmin/_processed_/d/c/csm_DSC_0003_aadae1ddd2.jpg

Thanks for pointing it out, I'll double check

>> +
>> +			trips {
>> +
>> +				keyboard_alert0: trip-point0 {
>> +					temperature = <49000>;
>> +					hysteresis = <1000>;
>> +					type = "passive";
>> +				};
> 
> If I'm reading the Windows ACPI setup correctly, it starts throttling
> much later. The main thermal zone used for throttling on Windows is
> TZ40, which is thermistor 2 read through the qcom-hamoa-ec interface
> (b94000.i2c, 'i2cget -y N 0x36 0x2a b'). TZ39 with thermistor 1 looks
> like the SoC thermistor, so TZ40 could be the EC equivalent of
> SYS_THERM1, i.e. RT8202 also visible in the mainboard picture above.
> 
> On Windows, TZ40 is configured as follows on my T14s:
> 
> Passive throttling starting at:
>   - 3310 dK (57.85°C), power mode "balanced" (current default for EC)
>   - 3330 dK (59.85°C), power mode "performance"
>   - 3230 dK (49.85°C), power mode "low power"

Yes, probably it is time to take benefit of the platform profile in 
order to change the trip points.

> Cooling devices:
>   - CLS0.CPU0-3
>   - CLS1.CPU0-3
>   - CLS2.CPU0-3
>   - GPU0
> 
> If we start throttling earlier than Windows, I would be worried that the
> EC will not reach the trip point for maximum fan speed, and we'll end up
> overly throttling the device.

Mmmh, that is a good point.

I don't know the thermal management in Windows and if it has exactly the 
same design as the Linux thermal framework.

As we can set multiple passive trip points, may be we can try to step in 
the different cooling devices instead of making them all together tied 
with a single trip point.

Or do you think it is better to just make all devices capped at the same 
time ?
