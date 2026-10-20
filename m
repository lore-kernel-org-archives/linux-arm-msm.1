Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792512541;
	b=X/mtm/O2vWO6Z4hfb1xdGIz67VMH546raXyrnShWlsWY5S/rJtyXHdvaJ8cEYtM/rZl5
	 G6ov1dYTvWGuf/VrVvyo1OK4V9v9QWHXEpDclZP6iWwMkBguss2lKfwcemRhnQ9IRuMQD
	 qr33G0LkZJcHSB2GXHsixoM/AjwlRkAcNFkEjAUSQdK8XMrcl36/DyPUI0wg50On0bq7H
	 hxfQBRe9Pe6VogwJVcX5F5hEkN9gERAP5oZisyArPuCe0BQBXsEs54QA2aotHEvEyQ9oT
	 fQDFqOQ7rjAoBJn0fbMmZ4xnkuZpnhYnOdu53J++hz73DM5p9aZ4FFAfIacBdAluSSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792512541;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dGBOooh6yznjMWE+A5X7fdt4uXbCVA3oHqWYs1djhQY=;
	b=GmeEWueLhf+WBds4yRQZYnntHXNVk4ezkTBSjOgoO5YzyvSApyGgV5JOaKO6Id5FZgDV
	 gPcCdWdcMDBZ7ztGhu6gHvg0f5BSNrx+dJUK2I4SkaESrmC+c6tb5z53LoZwQdyKMFQnQ
	 +ph4sZRHlI4VeeaxNyPKzaUZjuAkOUuXZwTpaGb1m2slfP5M51HwyF3+9yxV7qkLHYAbw
	 v1VLd6Mq2FTm3Asal6d0oHxAkMKlMNu4R15XwhC9qySTnlFc0V7pjjwCy2ga3TY4ZrFSQ
	 Umbn36SiyZkPSdB++ijJPRCn65O/zvspUwlitKQEIo2JH+z9CAwcPY7lwqRpv98FCKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WnI7EJLE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AhD1ouOq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE1C606A320
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 16:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACE1C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WnI7EJLE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AhD1ouOq
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KF3cPQ2548403
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 16:08:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dGBOooh6yznjMWE+A5X7fdt4uXbCVA3oHqWYs1djhQY=; b=WnI7EJLEhLpgenKR
	TSc5pJdCe7p7f6C49vSEMAegR4pqJemkIS/5FZ6I7FY7cjN/WsUjUCdmxw1EwY6a
	5ibpygdhlRjIkVOQZfntu789v5VsaNppxtQbJjrUoyDIPtmRbNZJjs8uPTwNNepQ
	ty6/ox738Ul/pUZ1uEd2KNRE99NxdlKMOgQfrmmziMG5Gc6eV58ELGoF9RFrzGtp
	9DVcN8Q1oWpBAYbAo2cI0hBhTZl/234ZtBdsWt0V7cC9S++EPODIyPkf69KxFUFi
	imXGO2yTCqnKyL7SA2WUcNRpMSuVBQK+Z98FkHhUZdrVxya4NecMwHwbnPOUPi6j
	jLNKTg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pkb43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 16:08:59 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c124d17880so715680137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 09:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792512539; x=1793117339; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dGBOooh6yznjMWE+A5X7fdt4uXbCVA3oHqWYs1djhQY=;
        b=AhD1ouOqAyyz/xHSFKdKiise2ee3PssdUrpc99D05Yr9pUYtsHG6m58WDYwl2c7aXr
         qGBE87vGQZE/QFOZVUo5PgnCva/OXnpSIWiVUmzxpKwzI9SdFFXdYs8OFW3ouIkJBSe3
         if/rww19RfqWjKFnH3O/qWLOtPA6V+HB0gTYcLB46phD56X/7p5X7MSyn7oxnHkgGi3f
         ccnp0HQa2rnRdHiTyju5WAsHmTmjgaxk/aXA4VQo5M+Vr15ndV/azzY+H2i1AwcSLjv8
         vJXauOArJFzswj4MLWQkREFA+VXMAGIWWbVDWXr2aSGfP0FK2TNH5CXel7f7+fY+WlyM
         cTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792512539; x=1793117339;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dGBOooh6yznjMWE+A5X7fdt4uXbCVA3oHqWYs1djhQY=;
        b=lPv1AB7jvJ2ZG4NbEqBBRGZ+oFm/bG+izaBFGXrbcJ1Ikgy5TgRWzQhLop3g7uS601
         h/UtW5gperlcw1J6Ei+rkkxjDDaHEfQJqwLGT0xfayRWi6KmaJoPcUpIkEunCBQlZN9n
         /kSkT9M0N5s98wyUDOCrqKF1Jy5yKQherdxuFnAxvUYfh/IHahhRDZ6lMiNMfzgAmPYw
         QtNJneKcmkkVoGWQ1SxPUft6cTQHvCrUGkl5yiyRTlNbtVhJGJJQbRS5rSh6mrcjcTrm
         ZA09oqGgRhbuB0DSWjWkrOP3lIFD6Q5ieL9Fm3bIOrvWKxJ7QJnYpXGcvbw8Mnc/WsMr
         OuQA==
X-Forwarded-Encrypted: i=1; AKwUvByKv97zImG5BErTMSVOSPIcF5Y/7peFcNTh0ZRRN8dcITaepmvfTb8xNIdkQLj0SWuPC9yc1iLQXNfeaWie@vger.kernel.org
X-Gm-Message-State: AFq9FYKtPVl6J9sX1bI41rtwgtxPl3CpFey0lBxxE22nRRdpprhVcgTa
	qWik47Ml+0p0nSBXsWPtFwJktn9AS8VY4exBtfLkWHvAWR7ZD33PZknXYrNVoxD2/11nHSiWM9c
	OODK6NIrbQ2t0rGxnPPREvZZj66DqJtuBNLje6x6NCTCeNo0YRL/tzTMDKkURUHFOjVMDF0kaJ+
	+I
X-Gm-Gg: AYBFou1ACEjuC13nUtK6BY9MSiwa/Y7WLvvdHcij0HkICp+Af/YV8JHyeVQn9f6LvX1
	HC0RSw8jcZRL08gIoUj/G1+Sho0b0s95FBoo0/9cq1t++NZTVRYR9zvfI8JSKPHmMjpJegov00o
	y9t7o+i3N5E6wPoiPc1pIGP20nCFoT+BaxuOV7g5LJZ6oA9Fb3XaXzm9l5DpAgR8dW4IqoWDoyJ
	mPAhPaTjRbRERmcV52DM4LDaKtuPXsHVpDcVI65a8iQP4+uZFQclcvKtR0fJGADWnTqqtZhwebw
	B/Qaz6LWemgZtuf06UcV2OYCA2kGmKdP0ojt+h4m9JdoT1X3eByfTjHaCOFCb/2ySlr6ZqSGKKT
	yrSf0a600exn4YMMBTyc5UeHvJwOBirQP+4Xlvk6t8ZFX+W/afKpm83Ln6Ws=
X-Received: by 2002:a05:6102:f0c:b0:7cc:26e4:1943 with SMTP id ada2fe7eead31-7cc36acba14mr2586620137.28.1792512538835;
        Tue, 20 Oct 2026 09:08:58 -0700 (PDT)
X-Received: by 2002:a05:6102:f0c:b0:7cc:26e4:1943 with SMTP id ada2fe7eead31-7cc36acba14mr2586602137.28.1792512538216;
        Tue, 20 Oct 2026 09:08:58 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:8d9e:b00d:491:1503? ([2a05:6e02:1041:c10:8d9e:b00d:491:1503])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fb859326sm7011895e9.10.2026.10.20.09.08.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 09:08:57 -0700 (PDT)
Message-ID: <aca2cd5d-18e1-406d-a062-e219478b243c@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 18:08:56 +0200
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
Subject: Re: [PATCH v3] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, johannes.goede@oss.qualcomm.com,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20261014193524.5590-1-daniel.lezcano@oss.qualcomm.com>
 <atH0oW5j9pxsTty4@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <atH0oW5j9pxsTty4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a7WlZkSF c=1 sm=1 tr=0 ts=6ad7921b cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=yw9hh2pf6h8ebXW9gWMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: jlXR6VT2JIsZoB5N0x73_CFOch7zpMOm
X-Proofpoint-GUID: jlXR6VT2JIsZoB5N0x73_CFOch7zpMOm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA2NCBTYWx0ZWRfX9rv6JbcaszMk
 Gz8vwrb8iVSLystGdfn849tpIkquSRpYh6zuJydI3OIphDaZgz5ndeS5krB2vkA0pa6wLKUE2MJ
 gy8GbNYoH93ddzUmnoOkYujEuIogXg1+I+lBxhgtgTB/p03vONgFigkxe4CpTGRrIKtwQ9qv4go
 ZF/Xgyo4AYbNVQnLjZCxOIlCsBhCO33vcU4Deh6Pzl8GkuHIP3ifs6LuoY6mcRSFxOGrIm9BS9l
 1TiwbpZ7wKbjWKSgx7sGcc5ZEaVVydzHLFv4H4yAmdCG/n4JgZfOyIZiS0us8LaOI/xPDoADVpl
 m3rIPzfZUf5bZ5LCOKZkYTlcRuWjLRDO4nnq/lstjUbMkGMRugFPC9J2nqkugXSY2FxBB6R4BAo
 P3qSJVrS1seOVkHxtUQAe26GeRWPvmFzOAyEGUtgkn0PcL5fxg4kWsAvy6UiFee1j3/0FjGdyXZ
 umzi1V2BDeVxdVqFiaQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA2NCBTYWx0ZWRfX+v6KqKw/WTfs
 7O+QiZJixn1rMQQAz4z5YHyJYU/qlHGG9Lu1fx/4RjPL1siNGKvVh9EF48amRwLyyo27MJQ/Lj2
 G3hiCOgxM4wCUoGapEhFYSzXV1l/s08=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200064


Thanks Stephan for the additional information, that's very helpful.

We currently have an urgent thermal issue on this platform, and getting 
this thermal mitigation upstream is important to prevent overheating 
under sustained workloads.

Would it be acceptable to address the sensor naming and description 
improvements in a follow-up patch, so that we can get the thermal 
protection in place first?

Of course, if any of these changes are critical for the correctness of 
the thermal mitigation, we should address them now.



On 10/16/26 11:56, Stephan Gerhold wrote:
> On Wed, Oct 14, 2026 at 09:35:24PM +0200, Daniel Lezcano wrote:
>> Add thermal zones for the ThinkPad T14s and describe the board
>> temperature sensors exposed through the PMK8550 VADC.
>>
>> Add a passive thermal zone for the keyboard area, which is the main
>> thermal constraint under sustained load. The EC reports a thermal alert
>> at 57.85°C, so use this value as the passive trip point and allow the
>> thermal framework to throttle all CPUs and the GPU when the threshold is
>> reached. Use a 1000 m°C hysteresis and a 500 ms passive polling interval.
>>
>> An earlier approach used staged CPU cluster throttling in an attempt to
>> start thermal mitigation before reaching the target temperature. Testing
>> did not show a significant improvement compared to throttling all CPUs at
>> the EC thermal alert threshold. It also introduced a latency imbalance
>> between the different CPU clusters, which could negatively affect
>> workloads depending on where tasks are scheduled.
>>
>> A more optimal solution would require a significantly more complex,
>> system-wide approach, accounting for the workload distribution and the
>> available power and thermal headroom across the CPU clusters and other
>> devices. Such an approach would also require kernel mechanisms which are
>> not currently available. Keep the thermal policy simple here and use a
>> single passive trip, which at least ensures that the system is actively
>> mitigated before reaching temperatures that could ultimately lead to a
>> thermal shutdown.
>>
>> The mitigation temperature is derived from the platform behaviour when
>> using the balanced power profile available under Windows. A separate
>> change will adjust this trip point dynamically according to events
>> reported by the embedded controller. Name the trip
>> "keyboard-ec-alert" so that the EC driver can identify the corresponding
>> trip point in the device tree.
>>
>> Also add a 73°C critical trip to shut the system down if the keyboard
>> temperature reaches an unsafe level.
>>
>> Add a thermal zone for the back cover with a 73°C critical shutdown
>> trip.
>>
>> Describe the SoC, SMB, SDX, east and west board temperature sensors as
>> monitoring-only thermal zones.
>>
>> Thermal camera measurements were also used to compare the reported
>> temperatures with the physical temperature of the chassis. The measured
>> values appear to primarily represent temperatures inside the enclosure
>> rather than the user-contact surface temperature. No unsafe external
>> surface temperature was observed during these tests, although this should
>> not be considered a substitute for formal platform thermal qualification.
>>
> Thanks to Mark, I was able to get some info on the location/purpose of
> the thermal sensors in the T14s. As you noted already here, the sensors
> are primarily focused on specific components inside the enclosure rather
> than user-contact surface temperatures. Below I added some suggestions
> for more accurate names for the thermal zones. Perhaps that helps to
> optimize the thermal control further.
> 
>> Finally, enable ADC thermal monitoring on the corresponding PMK8550 VADC
>> channels used by these thermal zones.
>>
>> Signed-off-by: Daniel Lezcano<daniel.lezcano@oss.qualcomm.com>
>> ---
>>   .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 105 ++++++++++++++++++
>>   1 file changed, 105 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
>> index 75ad74bcb042..2d0a434d2248 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
>> @@ -502,6 +502,81 @@ platform {
>>   			};
>>   		};
>>   	};
>> +
>> +	thermal-zones {
>> +		backcover-thermal {
>> +			critical-action = "shutdown";
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
> dram-thermal or memory-thermal (or maybe keyboard-thermal if you want to
> give it a user-surface name, although that purpose seems to be
> secondary).
> 
> Next to DRAM memory, on the top part of the mainboard, facing upwards to
> the keyboard. Unrelated to the backcover.
> 
>> +
>> +			trips {
>> +				backcover-critical {
>> +					temperature = <73000>;
>> +					hysteresis = <1000>;
>> +					type = "critical";
>> +				};
> Is this critical temperature is appropriate for the DRAM temperature?
> Windows seems to have 115°C here as critical trip point which is maybe a
> bit too high.
> 
>> +			};
>> +		};
>> +
>> +		east-thermal {
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX4_THM_100K_PU(1)>;
> gpu-pmic-thermal (next to GPU-related PMICs close to the SoC)
> 
>> +		};
>> +
>> +		keyboard-thermal {
>> +			critical-action = "shutdown";
>> +			polling-delay-passive = <500>;
>> +
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
> fan-thermal or heatpipe-thermal (or maybe backcover-thermal if you want
> to give it a user-surface name, although that purpose seems to be
> secondary).
> 
> Next to fan/heat pipe, on the bottom part of the mainboard, facing
> downwards to the back cover. Unrelated to the keyboard.
> 
>> +
>> +			trips {
>> +				keyboard_ec_alert: keyboard-ec-alert {
>> +					temperature = <57850>;
>> +					hysteresis = <1000>;
>> +					type = "passive";
>> +				};
>> +
>> +				keyboard-critical {
>> +					temperature = <73000>;
>> +					hysteresis = <1000>;
>> +					type = "critical";
>> +				};
>> +			};
>> +
>> +			cooling-maps {
>> +				map0 {
>> +					trip = <&keyboard_ec_alert>;
>> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +							 <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +				};
>> +			};
>> +		};
>> +
>> +		sdx-thermal {
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
> wwan-thermal
> 
>> +		};
>> +
>> +		smb-thermal {
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
> charger-thermal
> 
>> +		};
>> +
>> +		soc-thermal {
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
> cpu-pmic-thermal (next to CPU-related PMICs close to SoC)
> 
>> +		};
>> +
>> +		west-thermal {
>> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
> typec-thermal or usbc-thermal
> 
> Next to USB-C ports, bottom part of mainboard, facing towards the back
> cover.
> 
>> +		};
>> +	};
> There is also ssd-thermal @ SYS_THERM7
> thermal-sensors = <&pmk8550_adc_tm ADC5_GEN3_AMUX6_THM_100K_PU(1)>;
> as I mentioned before.
> 
> Windows uses the EC sensors for throttling, although given that we don't
> have interrupt support for the EC yet, I think it is fine to initially
> use the PMIC sensors.
> 
> Thanks,
> Stephan
> 

