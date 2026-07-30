Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71F63B27FA
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 06:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785393629; cv=none; b=ZTf81fr1RSjPyyVsBUX66K41iAfMAAr1sIKZI7BkUwELKEfYN1+MA/ENZJ6sBOT0kkGScvs1rlsNI31vef08in3V3SbZs/QaT+5EWLOzJFvWTxTinC8jm/mLDLKyGHFOC0+IBi1Nksp42Rk+aEDVfZm7yOtm5vAWDso9tny5Cfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785393629; c=relaxed/simple;
	bh=Y3x16PPIVyHj8Uh+iuCq3XKJqgFqpJFXRbLoKKVW1rI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tJZAeHrZsDTMqAWsKRx+2D8dzjDC4j4a9l8H0eOdBFjaLyLE2r73O8/toXTTZcDq5izxLYdgO0E4oADIxxF45H+VZMfRCOzJ3NwK1DDAWoDC48NRraswjeemAqmEqcXXOHSbO6bnAkLJAAZbUSMXLLRXI8wVTzMZtOQqwO9bOmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ts8aN9wO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e49R6bGn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ts8aN9wO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e49R6bGn"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U6aUXA4002746
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 06:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	59EmuRUbgg9pAUe86V2NHMrtVqPRLri3llHo5p/HhR0=; b=Ts8aN9wO+0Hi3lpv
	WqRUQgeVeTXb1912+2DTImx7Xzjyyeqggj1mcyos7Yov0F/Dxlao/xKaIQYUVJOz
	MBkkcC/szBmAxFy6XnNe7zXEunOflzbfTUfpgtnGkNZdshPQYX98eKQQYAiS6Qrr
	r5eK6mWUv1yHyPXDOp4tll+7APlP/ZY8dvDAosgER8//fdc46QNDM+Qb1GHuexDH
	f17+7Gn4pHJ+UCd9LQouUWHY3qm05YsDi2WWHXtGy1quKbVja28EaUvtnzFE5wd9
	wjsH/04zKJ8EcPtAmyEdzZL3Gh1sK2GkJ0uCq70iM2J41ih6kQByQGXi2xl54k4G
	BofN+Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr17s839m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 06:40:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfc52ddc55so23363545ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 23:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785393626; x=1785998426; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=59EmuRUbgg9pAUe86V2NHMrtVqPRLri3llHo5p/HhR0=;
        b=e49R6bGnNlpQkITzIbXl0D02xty7T/5Gcuhy+q6ELXESbtvRLZuZpoav8DAB4AqVzV
         0SD2z2ljYWwOVTSWAwarpzjeeoSIrPF+4tNbLSEhe8/IUoO7rnq13VXmul8OpmGE+YwT
         G9VuyfMCH0UPea59zH+CfUc1uLykZ+VexctGU/Y4Ufffgq11XcbwwZQ2yTuHBhSdspj6
         Yo+eb5/Cck3CthM+tKvv6kv49E9uu8Wa2Apdu7UDPXTIm48vtP+m1nRA+vs1X7gbLF5V
         jc4sO5Qt86ZykLTDF+3VZbZBptpqLsXLgz6UJMyUNDkC1out5KoHnqAHMEMbGA6X6Xgo
         Fncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785393626; x=1785998426;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=59EmuRUbgg9pAUe86V2NHMrtVqPRLri3llHo5p/HhR0=;
        b=jK17kCXqNIkgTw95oAC8AmMSwy1TEtp/Hu7A45spj7pYTv43LdjAvxFKLe5Yt3OQZH
         fZt68Qo+cE7oMMvCr1T3gQmRNaAsHg7zRmW13UFjPETGu1YZt+DuR1+E2UpBWzLKkhh5
         cd4jNcJZ4/uOxBtuANZg/Rh0MLjA1/D/XThraLRFnBUDqMCIRn4IIykD9kJaSMneTdD/
         69QKADu94IAbaWKtWFJ7PBoL0hJv/MrwQP7h7J6Xsaz6DZNb+L7SyaKeGihDCoRCAXb1
         dkE+EoJnePFtFK134F+eM4ktDDE3ESGjB0XJnLrN76Othu+ww5Z/RuJVKtxU7qMh/gOJ
         wvTw==
X-Gm-Message-State: AOJu0Yw7kC5+Y3bSRMy8qHeuEYKQESjJYYq8YmGJkiVUjN2zyMqRURJ5
	Bl5ZSRKhSl7McPm4gofX2pzUVgnd7G/D005WIgdE9k7HIFPsoJatwOzGhr0tcrDlShSN4RRQDZC
	iakq6NL/AY4j7yYAZgIqwK0kCjrwdHxjKuX6NOCmi9SLsAUh6zLpLZZ4Cw9JwIddkNdT2
X-Gm-Gg: AR+sD11nM/h0ZNzWsZjFy21cY8LsIMGU2vBt/l3cAxYLxUjMN/HziAcLlvxcJr+Hc+t
	FvsEGuWP9HizZg3H1IVa/Qgy+5KJtBgdQTVhdxXw7mC/Z0X7KKYSx0c/FdSvifvDo7J2iDWHd6f
	TvPJ8biGXxfj5nzbuKeqLsaX39gmN+IcrerAvld+YNIoALE7Os7EHcklIc40wn8GLt0Een75yj3
	z7r4FM5/3IWWN5NDvgBTo1T5OSW4SaYFZlVwnwpCPRJaceD1XLKMr8l9xAknu+tJZJ7bQeB8dls
	dP1Fs1vSz5MCm7NtaVQO/SzdN4Y81f501D2eVCbLfr34p7ZaedccK4SWwUM6kE4wGQ5BdSkHjMB
	3OmfVv5HN+4rNoBwFJmlDilc0v3Q6Te4wFVY016np37N7Ghu3MY8owZAs4eV3nFfm0r6wDYUPlU
	8x273Kr7lHSWnuQw==
X-Received: by 2002:a17:903:2c10:b0:2ca:b4b9:4586 with SMTP id d9443c01a7336-2d035bdf320mr14389195ad.19.1785393626590;
        Wed, 29 Jul 2026 23:40:26 -0700 (PDT)
X-Received: by 2002:a17:903:2c10:b0:2ca:b4b9:4586 with SMTP id d9443c01a7336-2d035bdf320mr14389005ad.19.1785393626143;
        Wed, 29 Jul 2026 23:40:26 -0700 (PDT)
Received: from [10.190.200.192] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a45f1esm21550055ad.20.2026.07.29.23.40.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 23:40:25 -0700 (PDT)
Message-ID: <bc5b3299-7895-434b-b83d-2d28e450a484@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 12:10:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] platform: arm64: qcom-hamoa-ec: Retry I2C transfers
 on NACK
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
 <20260728-ec_add_more_commands-v1-6-771abd65ee1a@oss.qualcomm.com>
 <e3394d91-ddab-4983-92b5-714d5bd5220f@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <e3394d91-ddab-4983-92b5-714d5bd5220f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA0NSBTYWx0ZWRfX00WYKTdsELNJ
 wNvtT5rIvKt+PW8p3hkExec22gPkBAPcoKVULl6lVSNLsSb93Oj8Z/m0EvS4GSdiWw/UcHIyFPx
 X3x53E8TdFOc1hFwO+8d6KgCr+z1ht0giRs7hT5Y3sJuhos874HSB7biWouj1qTNbvNTDgZCbXw
 jRcILDBLQlzQT0mSTeV+L+Lj26W8XPQ9pCkfdFJ45FZPw0KTzI0wIUGCLQIsFvdMOlLI3kLbVax
 OoQOgIpkZs4+enLJ4OAKJfXaOW68Qg8JAmscizUNbP2Xl5X0CmWIE6hlWVmzC1xDl/VmsvHKsK7
 LwlnhwZ/ZiAsaepCoTKq8ZpsuwqzdAu+SGrDvO/r5SYfD39pfiiN5knB7SviUHhVLUmgfwpqiqq
 Vx4737/VCY7tMZ8/DGfaV8Z0tgOlUECQ6Xj+kg5H/04alV2Pf5X9r9fc7PS+GwNO0EC3RIrEoq9
 v4QxcrwIwj5p0Tqp6IA==
X-Proofpoint-GUID: ToDtCPZV3j7HAF6rPZQoF9D_QfTCtZZG
X-Authority-Analysis: v=2.4 cv=M6x97Sws c=1 sm=1 tr=0 ts=6a6af1db cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=It6PG1r-qJMbqxhxAG0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA0NSBTYWx0ZWRfX1xplgfkw3cv9
 RR5Zu0rwSkVP3VtSyqaM9hYkmNEOa2GFi2SquUFBGzd6ipp44vEfAaHZPR684wiblsEHoXOAlFz
 Azd2m/E6Fjwtapkt0kXaJr8J9wX/sg4=
X-Proofpoint-ORIG-GUID: ToDtCPZV3j7HAF6rPZQoF9D_QfTCtZZG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300045



On 7/29/2026 4:41 PM, Konrad Dybcio wrote:
> On 7/28/26 7:44 PM, Anvesh Jain P wrote:
>> The EC firmware NACKs the bus instead of clock-stretching while it is
>> busy servicing internal work (e.g. right after boot, when it is also
>> emitting a burst of SCI events). A transfer issued in that window fails
>> with -ENXIO even though the EC is otherwise healthy.
>>
>> This isn't visible with the smbus-only command set used previously; it
>> surfaced while stress-testing the new fan LUT command on Hamoa, which
>> issues raw i2c_transfer() calls more aggressively and is thus more
>> likely to land in the NACK window right after boot or during an SCI
>> event burst.
>>
>> Retry qcom_ec_write() and qcom_ec_read() a bounded number of times with
>> a short delay when the EC NACKs the transfer, before giving up.
>>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
> [...]
> 
>>  enum qcom_ec_sci_events {
>>  	EC_FAN1_STATUS_CHANGE_EVT = 0x30,
>>  	EC_FAN2_STATUS_CHANGE_EVT,
>> @@ -233,11 +245,20 @@ static int qcom_ec_write(struct qcom_ec *ec, u8 cmd, const u8 *data, size_t len)
>>  	msg.buf[0] = cmd;
>>  	memcpy(&msg.buf[1], data, len);
>>  
>> -	ret = i2c_transfer(ec->client->adapter, &msg, 1);
>> +	for (int i = 0; i < EC_I2C_NACK_MAX_ATTEMPTS; i++) {
>> +		ret = i2c_transfer(ec->client->adapter, &msg, 1);
>> +		ret = ret == 1 ? 0 : (ret < 0 ? ret : -EIO);
> Please break this monster up. I know it already exists in-tree, but
> since you're moving it around, we might as well.

Agreed, will break that up into an explicit if/else instead of the
nested ternary in both qcom_ec_write() and qcom_ec_read().

-- 
Best Regards,
Anvesh

