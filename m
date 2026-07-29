Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F40436BD3
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 13:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785330202; cv=none; b=APXaLyAxm5JH0co6HYB0TnKs58KqVg6Kc/T+tXrOL5OFGlIWABew0/pbvVWhHCp8BVIOxxh7xOucB2h5tGt0MoMn24RICimEIXcSrCkPM+YMT0UxsCMbwmmfZOV8/9EiWkXLG0ZYvk4rxLIp1oBS0Riws3v+YjdKj+GinwYxRPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785330202; c=relaxed/simple;
	bh=/YeA6e4h90/TYAApBQ5RFPCojqWub7XeOGXkeguNddg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wov0DWPPOAjfzustax5k9C3VMLTbDWHauhWd9oZMRuINpAykkLmHa6TdCJTcQR3LVblH5aqbhYhuDpocCYpNXWcrCXA18F486Bwl1ob5Iwx/MNxaUtAekoA/ddbXTHLDYvi5FXxt153hr+DyisvIh+9p96gvs6F1LIEx8tcPDIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=opC6dvDf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bEEAoVJW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="opC6dvDf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bEEAoVJW"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TBt6iF1767569
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 13:03:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tlh3rnxfJkXfV5KarGkZfL1Q3S+pBYhT9xp1RWLyIIQ=; b=opC6dvDf4y7teSIq
	f1gZnd7WLAx8MAXMbfxooWoZlq+OgUkKeTEFcLhao8AZlmjo8kNpYbBz+O03AtMT
	89w1oWmt4iQnJkwyMKmNyW1FpJxk1Z75bSnpPhT71QOaqI0nCWCZIG7n7gZAv2YU
	JqDJJkLc5Mzdm/mQlq17YUTZutsubQxjumWApDHuwcWH1vAOr0NYM//2d+p4gVqd
	zIrWAX59UsOANgV6LQJ85bqfNh+Dltm3EFvdjtDS6KmsX3bMieEYFQ5fPbVie7UI
	AsdoKYZZgLjuCXn8vs5x9STsc5JBBPRjdpt2JF1KCzHRjhc3LwDCO8yOLlQ23IVL
	Pz0N7Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqh2kg865-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 13:03:18 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f5ac7354dso1560676a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 06:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785330198; x=1785934998; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tlh3rnxfJkXfV5KarGkZfL1Q3S+pBYhT9xp1RWLyIIQ=;
        b=bEEAoVJW7hBeKuLwerY/7vNXT8Lv95w9Nbaqc4P77hDC8MLllq8kJFiMDNiasGZJ0h
         Qgp9usvixjWO705BEnrowjnONvPkDS+kPFWKuZKg2g9xdfDzwIaOpgo8CwFwX1s9dV3I
         KhMRw8GZChLzhgeYGapwbWjYAg5QMhIjObzaEsSNj4CYeSNrw1hculAftkiATSum6/BR
         YOd4PyuKYNbxaAiBrIJ5/5rdUXIOAwisiydCHfPG8sZH3Re/WX5XofVK/p0IWhNGGc51
         bzDEsl8mgueo3YuNxmUcdMy+bEzttvkTdbh1DI51BkjdYrqwOXhbhyn9TWH6sPU1+kgy
         pZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785330198; x=1785934998;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tlh3rnxfJkXfV5KarGkZfL1Q3S+pBYhT9xp1RWLyIIQ=;
        b=KUIk7OQXumSsX5+c5n+0V+Bm7Hb8BGLtpX3zQZfBd/03OeODMRlz1eyrf8IH5sSGaW
         /qgeS4WCidluMtE1iDs8kfO/s3KGRykGezW7canEunNBIpktA7APPiaARblOA52dcu1O
         gsFJ094OSq3cnlcH/x+/Hq5PbU52arwjsI+neXmC0H9uSphHXxPcZTGCVeWuDZ35XPnY
         1fQr4tdz7FWYtyQnQDuBsL0Wv6IUj6FrnqaQE4C2lKIQKyjrxqMLxOllnKCArz3lWW85
         fGOB+aTZI/p3wpCOCRwVgia6wxJNVQVmUQlXKdYlhAUJ+nfdTRYuXFbvJL/rXjNJuMzQ
         O3IQ==
X-Gm-Message-State: AOJu0YwwCjigzHAmOWxuiXCU7y0lcoiCFIk9STaz68hFMznsLZn2tQ8y
	P641Mi8x41d0NLB4o42h67uD2ZGH2FW2Z9o3aNyuLUds7wZTKdvbdb3aEV5KBEAPYTQ8Jjv5KTl
	vvHwWjDoJ+rVPXK65MwvQo6ked5+961uOCaLLktnCwiiLVq8ehR6Uqg7ZC89aVxtYfP7o
X-Gm-Gg: AR+sD12WzPwN5tL51FSrI6h9log2C0L++jDjSnpVWujBRCqZvwNS/3yL4TlpR98PSnU
	GRjHrm+8sZMyuysxnZvWDDNnrWgzwQqY9NMEmxKmOBGmii6tO2GkpBhZkO+DxIgEzaFKj14dshv
	HqcbrSdsAu3CjxGTHg8Omyx78e6Da7vAXYJYcFe8cItoGhc4NL/1do3TiBomz861LhQpdr3gWJq
	aXOgyiuzcElLFsBy+CGCvy0haabi2diIQsDQ1yRKuFGx03yoLyejFbhZS0y/MW0PzpVt0wpiTcd
	r4MqjfIu2J2XQ+WfIjHMIoEx8Uuq0HhIITbCabyrGxtUWaXgBJmuEd0OnFbUfygVZGtws24p0FW
	ltpESJ6e6iRkUQw+M1AwNaOWU1qK94z8BasZ33n/va50i5PjYloQ3pCdWIYYhDZDckinmjhYXzT
	4V3b5EMzTreSUr
X-Received: by 2002:a17:90b:55c5:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-38f6a1b8aa0mr6429839a91.0.1785330197195;
        Wed, 29 Jul 2026 06:03:17 -0700 (PDT)
X-Received: by 2002:a17:90b:55c5:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-38f6a1b8aa0mr6429771a91.0.1785330196459;
        Wed, 29 Jul 2026 06:03:16 -0700 (PDT)
Received: from [10.149.71.180] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f642bfc71sm2710478a91.11.2026.07.29.06.03.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 06:03:15 -0700 (PDT)
Message-ID: <95133f63-c7fa-4c68-9db0-2123cf754f50@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 18:33:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] platform: arm64: qcom-hamoa-ec: Add SoC junction
 temperature reporting
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-2-771abd65ee1a@oss.qualcomm.com>
 <94081897-2e6a-4c8f-bd95-1961ca843478@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <94081897-2e6a-4c8f-bd95-1961ca843478@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEwOCBTYWx0ZWRfX+bsUlwHeqYYV
 MvYJVUKgFYzg3Dus/WYXxI+XkomOb2WBJ9rz4ldmFIL+m7jo+XqCHCPAqFbuff0PEKW0g9rQO6t
 ElOo7fnv+R147MzQRUlwTxJEMJ6HQOJ4vIo7eSFKasCmBVhzTIzUu7t79VMxaycr3SwYdJXYE8Y
 kIswvCxm90LJqwWg+bzXYzJV6nUyD9wbQSl+0bI8s8SZpEYyHkXA/QO8sgXz62q4FAE/gE5PgeV
 RM2EieNX8GqcMx6B3QfcTUs8mXLMesoN6EY1KHUXlyIt+GYp/1gzhyDosBbUJKrSEQWSvGlhKgC
 XdvwT6HJxJBv8R2QGozaTbyPrm5UBu614ArkiiEg3MdLdwO96Boq/Wc91BQtOkLg8+jQLP3ubOV
 eANI/XYEWT+DQEbSPZcQIL6v2X0IxYbX5NEkBvFs7bcQB0XR7TG4kcWmffRSpajpt7MLtFMo/FJ
 h5b11KsRZOFKTMWaKvg==
X-Proofpoint-GUID: F5yDHyha85D5ofXoBxOyG-kIbBAkoC-o
X-Authority-Analysis: v=2.4 cv=Q4biJY2a c=1 sm=1 tr=0 ts=6a69fa16 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gdiicE2fkixeoH3Uy70A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEwOCBTYWx0ZWRfX8sEQ1NF09ly/
 Pr3GrKwjydWoBTr5KM6PmpGbMRWmnPg6LAFVU2bpKYhcnYbPLD7yu4bWk3q+aBrZNw8HJxSuotS
 uy5AIphKDppmbUaZpvu/mq8ZM3vHn0E=
X-Proofpoint-ORIG-GUID: F5yDHyha85D5ofXoBxOyG-kIbBAkoC-o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290108



On 7/29/2026 4:29 PM, Konrad Dybcio wrote:
> On 7/28/26 7:44 PM, Anvesh Jain P wrote:
>> Add the EC command definitions and handler function for reporting the
>> SoC junction temperature (Tj) to the EC.
>>
>> Discover the platform's thermal sensor to zone mapping via the
>> qcom,tsens device tree property, average the junction temperatures
>> across the mapped zones, and periodically report the result to the EC
>> over SMBus using a delayed work item. Serialize this and the existing
>> EC command sequences (firmware version read, thermal capability read,
>> SCI event control, and the SCI IRQ handler) under a new io_lock mutex,
>> since the delayed work item now runs concurrently with those paths.
>>
>> Re-arm the periodic report on resume and cancel it on suspend to avoid
>> racing with the modern standby transition.
>> ---
> 
> Missing sign-off, have you run b4 prep --check?
>

Thanks for reviewing my series.

Ack, I missed to add sign-off while splitting the patches. I verified b4
prep --check did pass clean here. Will add the trailer in v2.
> [...]
> 
> 
>> +	mutex_lock(&ec->io_lock);
>>  	ret = qcom_ec_read(ec, EC_FW_VERSION_CMD, EC_FW_VERSION_RESP_LEN, resp);
>> +	mutex_unlock(&ec->io_lock);
> 
> Does it make more sense to simply stick a guard(mutex)(&ec->io_lock)
> at the beginning of qcom_ec_read()?
>

For this call site it'd be equivalent, but a few other callers (e.g.
qcom_ec_update_profile_from_power_supply(), qcom_ec_fan_calibrate())
hold io_lock across multiple qcom_ec_read()/qcom_ec_write() calls plus
state checks in between, for atomicity. Pushing the lock into
qcom_ec_read()/qcom_ec_write() themselves would self-deadlock those
callers unless their outer locking is also removed, which would then
narrow the lock scope to a single command and break that atomicity.
Keeping it at the call site here for consistency with the rest of the file.

> [...]
> 
>> +static struct thermal_zone_device *
>> +qcom_ec_sensor_to_zone(struct device_node *sensor_np, u32 sensor_id)
>> +{
>> +	struct device_node *tz_np __free(device_node) =
>> +		of_find_node_by_name(NULL, "thermal-zones");
>> +
>> +	if (!tz_np)
>> +		return ERR_PTR(-ENODEV);
>> +
>> +	for_each_available_child_of_node_scoped(tz_np, child) {
>> +		struct of_phandle_args args;
>> +
>> +		if (of_parse_phandle_with_args(child, "thermal-sensors",
>> +					       "#thermal-sensor-cells", 0, &args))
>> +			continue;
>> +
>> +		of_node_put(args.np);
>> +
>> +		if (args.np == sensor_np &&
>> +		    sensor_id == (args.args_count ? args.args[0] : 0))
>> +			return thermal_zone_get_zone_by_name(child->name);
>> +	}
> 
> I'm not sure that's the intended use of the API, but this is NHI
> of_thermal_zone_find()
>

You're right, this duplicates of_thermal_zone_find()'s algorithm almost
exactly. It's static in drivers/thermal/thermal_of.c though, so it's not
callable from here as-is — keeping the local copy rather than touching
that file.

> [...]
> 
>> +static void qcom_ec_sci_evt_disable(void *data)
>> +{
>> +	struct device *dev = data;
>> +	int ret;
>> +
>> +	ret = qcom_ec_sci_evt_control(dev, false);
>> +	if (ret < 0)
>> +		dev_err(dev, "Failed to disable SCI events: %d\n", ret);
>>  }
> 
> This should be a separate fix. FWIW suspending and resuming on
> linux-next/master currently gives me:
> 
> [   43.754787] geni_i2c a84000.i2c: error turning SE resources:-13
> [   43.754811] qcom-hamoa-ec 3-0076: Failed to read EC SCI Event: -13
> 
> Konrad

Agreed, will split the devm_add_action_or_reset() conversion into its
own commit — it's an independent correctness fix (also disables SCI
events on partial probe failure, not just on remove()), unrelated to SoC
Tj reporting.

On the -13 during suspend/resume: that looks like the SCI IRQ firing (or
its threaded handler still running) while the I2C SE resources are down
for suspend. Will dig into whether the IRQ needs to be quiesced/disabled
around suspend/resume here and follow up.

-- 
Best Regards,
Anvesh

