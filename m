Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAF83A3834
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 06:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785392532; cv=none; b=tlpyPdm5GZ4dDh2F1Ze4qoHsGsW/qHNEwDSzXIq96dNouJ7BgEEk7DwDuXnN4LLxwU/s7QWqDLWqf6Klhe5HaR8pSo/7TuzYnJ4LNTTL2ijDVCFPrVc1vTXbmpeiHNFxDK645+c6ZLD8zhLW34kWVAkN8fsURKJ4fYBw66uczg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785392532; c=relaxed/simple;
	bh=1ZJYHoHJ37ZZpsYH9NUMN2wGcABiworAjC/Sr2cVmOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aFY/Bhv0m8qdRknXZV9awOBeVLSisL6HYYVlIGvcBypAgTHCMqdwb3aV8dyG8oaNJD9nBCFKFTfrgxaQBpqVCuaHHtVuWuC3MatW9sdGzAVQKKn8ts0XTZZqdCwAP3fwQ8wjb+MFchdwUQsgypcLSpyYYqjWAlZg0RjcgpowMFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BZiQeIE7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bq99Vpkn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BZiQeIE7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bq99Vpkn"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U607Lt181089
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 06:22:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g+th42AJhFhfR2DwxCr52sTk8OWy30+SGiJN/KlR2cA=; b=BZiQeIE7PBFHb/4r
	YstZTjLNO52KXW72e9lbESjHl8/bKG3ZoPHWZQXAG+Hla1KvrWMyMGMjbVElv3KL
	0XB5bYAcid2gDJt/Xf927dWxZSobF/GuiFVSx0sN4aTQ8oK1DhS7excxsgy+x+OT
	Uow20uPE/eAQrbksKF5dMh2ehzNlQsx4pctLf6UOsewZZET5Tw1bVZ/EAm8moah3
	+im7Fb4FLQu61fsjNwq0zsuKZWk7PxHep4+rSOTqYh1TPX305VpzY5Ft1559QFpW
	aBR58h+jizstkp3blOlBk7lgN1460hTE6tjShIpIBjjwxq/fCoMy76ZxoHxiVFCL
	RLT3Og==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr0y2g36y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 06:22:06 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8488ac68185so4157402b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 23:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785392525; x=1785997325; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g+th42AJhFhfR2DwxCr52sTk8OWy30+SGiJN/KlR2cA=;
        b=bq99Vpknk9+TSI+K209y2LAT9gSiSwygnyAsD8acXjenrmg6eAy1VHTY7hEX8xq4X5
         OJcfsz+nSUiXeZbDl+gbDHibJU50Y5ayoG/VezzsEmsssaAnu+NfEjRz12EFOnEXOWQo
         k8HLmGM5LdM0N/vI3Hzb59FEj2VYWqV0KxF3uEniYM+A/PXTQL0iVr16DS8bF6Ix1cRP
         t+NmNKCvnNDmVGX6VQK6rIWaQrS0JkvChPYvzUNEBzljRQ9st0LWsW3lYWnYoAquRLNq
         pRS/opdnCunWm3kw12cowDsUDb/MvNHqQv0HQE3vAv4VLmXty8tcjU0nSdJPO67Kfiua
         vfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785392525; x=1785997325;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g+th42AJhFhfR2DwxCr52sTk8OWy30+SGiJN/KlR2cA=;
        b=SsiwSliqjUE/ty0EvxDJZh0SlGb+DS4uNWbQ1ohO8fDdrh0PQCASeIFnwoDfvRdkqD
         UlY0O0uMJa22N/IPqnGUsWQVPzqKarxpvWlgChovvRNUMQeGHUwne+syr7V3R324juyC
         aUNeU4QSRZ1Rl/7L0H9myoFgMqk5vTkV+VBc6QNfsmSdcx/z8SjmPt/uo13eDI+Xd+aN
         lonOAFXiqENK5GebDxuQOBNmkVNpF6Pf/pIIyp/2qIoSXSzM0eUikyiguE5RM9wKRKRD
         FZMIdSp2ecMDycl1hrk3E4bD+QieubLlZUUDMPd0pY1jznghEOMEoVqApysFCUTLcs3d
         WRcQ==
X-Gm-Message-State: AOJu0YzJhdgq7CmLItepYZ2oOOCA1LWpMFknLyJOzDwIqiE1I9vhu1vB
	spnUEVz5SHmE2ewR1XmluTQ4GDyHn2GOWKD1mugFAtr9QtPyvdNd9icJk+xiNY+g+wwwxViBHUQ
	e/GilIElLEyLUPM0V5WArqm4Mbog9lxn2Nxrxmwz/+CYfpj6huj7Z5qBqKwolT+T+nNJe
X-Gm-Gg: AR+sD10JYfzOflMTB5FdRIPIll0siz8vAyDVQFpFeC3EsTHFa2x8O2pbinOn8Umyvh9
	1MEfXEoE+FVimofIDPODxXw+LB43+uvJlU5j5pFDejE2Ngpk4LDIs8UUBtDl0T7aJygiG6spps1
	V+0rfyDeLIHdbC+djqULxypdXeuv0CThppaCGzDIlTdNmwEmPsAa2FLDaSjmYX2+X96s1PggXwN
	aTl3pc6sZ8Uz7XKa+9QRpvq1IZlPSP99PHh67rwgSPonmyZPzFw4gUSbKa6i83yyuW8ptfoj0Im
	F/c/OTGY0vK2qvu8QxncGuHcZdbJtn6Es3B9aIiZcmC5SUNj9XxglytfSNELPujZUaZ/H5/o+Tm
	2DM9SbFUhFBPGT4DrQsiloeJ2krI8DvRy4m3xjC+Ug6VvUi2MXRgwk7FmTfsh/ZHSKUJwidJPxS
	KSqRQGASVhJNTCpw==
X-Received: by 2002:a05:6a00:1f0e:b0:845:d286:1fa8 with SMTP id d2e1a72fcca58-84ebc4218e2mr1460838b3a.55.1785392525089;
        Wed, 29 Jul 2026 23:22:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:1f0e:b0:845:d286:1fa8 with SMTP id d2e1a72fcca58-84ebc4218e2mr1460779b3a.55.1785392523752;
        Wed, 29 Jul 2026 23:22:03 -0700 (PDT)
Received: from [10.190.200.192] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea02f8473sm2413144b3a.31.2026.07.29.23.21.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 23:22:03 -0700 (PDT)
Message-ID: <1612b46d-1291-4593-b24e-464ba2a180ed@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 11:51:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] platform: arm64: qcom-hamoa-ec: Switch fan profile
 based on power supply state
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
 <20260728-ec_add_more_commands-v1-3-771abd65ee1a@oss.qualcomm.com>
 <cf04c613-ed91-4929-aaf6-421fe9bb7ab4@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <cf04c613-ed91-4929-aaf6-421fe9bb7ab4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ibm3n2qa c=1 sm=1 tr=0 ts=6a6aed8e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=zE2DOYl6_rrREHaYA3YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA0MyBTYWx0ZWRfX/bEGYi5mDG9l
 Yx9YSakzQ7OW8MYdUKshBqZeKwNyAPk0YBVfPbjGH41ByUQ7HVqWDCLDNFZil8unGHjsWXTFkNm
 Hq7ppqJ9/dch4bfH9TU1u7jdty2fuQkdCIIAAKCfBNtnVadTDF2mvcFDuwGc8E/w5QqseUkCNpM
 m4mdfWNbYM42hVPUIfN+3N+CCv8cLTwlJc6cL5iYOI/zEF1TnqE71S4o9Lo2gB/0ETxpA+Udjra
 qaefYddppxgxo0xQlmdpXNIBRG6vuEFdAE6anmoDaRhNX7OTPYlkcZpl1ypQ8pzCbTmVGaiQZzj
 UrdC+So6UHpVRqefOazX0w8x43vgvCcnGISpVinQGKJEAl0Ocd+MELpkUqOhukApRKQPtB/j4H5
 qw1S7kM/qdUdcDPQqK7FnHxmmhvYdIXX8/nx9lxtqlAYCKc9t84Gng2eOSNFF0kmdASK6Uqd1s8
 vYPZ1v6phuYa9LkvQqg==
X-Proofpoint-ORIG-GUID: r9jDK-fywqKyCoOkmLUjgDzeWenPoLCU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA0MyBTYWx0ZWRfX88N/brXg9syB
 35SvkDf/RlnV6w/d0xf47bdDDdO15mdEm0GV/l3063d1KFpNPza7Qg8XEezZPJNzcKLF0Dl36pj
 hXgdZFe0AH0RyENr4940bWPY9jPlBnQ=
X-Proofpoint-GUID: r9jDK-fywqKyCoOkmLUjgDzeWenPoLCU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_01,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300043



On 7/29/2026 4:32 PM, Konrad Dybcio wrote:
> On 7/28/26 7:44 PM, Anvesh Jain P wrote:
>> Add the EC command definitions and handler functions for switching and
>> reading the EC fan profile.
>>
>> Register a power supply notifier so the driver can react to AC/battery
>> transitions: on each PSY_EVENT_PROP_CHANGED notification, queue work
>> that checks power_supply_is_system_supplied() and, if the AC/battery
>> state has actually changed, switches the fan profile to the
>> performance profile on AC or the battery-saver profile on battery.
>> Track the last-applied state in on_ac_power to avoid redundant EC
>> writes. Run the initial sync once at probe time, and defer the actual
>> switch to a work item since the notifier callback runs in atomic
>> context.
>>
>> Serialize the fan profile write under the existing io_lock mutex,
>> alongside the other EC command sequences.
>>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +static int qcom_ec_set_fan_profile(struct qcom_ec *ec, u8 profile_id)
>> +{
>> +	int ret;
>> +
>> +	ret = i2c_smbus_write_byte_data(ec->client, EC_FAN_PROFILE_CMD, profile_id);
> 
> Shouldn't all the accesses be serialized after patch 2?
>

It already is, both call sites hold ec->io_lock around these calls, same
as every other qcom_ec_read()/qcom_ec_write() site in the driver. None
of these low-level accessors take the lock themselves; that's
intentional so callers can wrap multi-command sequences atomically. No
gap here.

> [...]
> 
>> +static int qcom_ec_update_profile_from_power_supply(struct qcom_ec *ec)
>> +{
>> +	int on_ac_power;
>> +	u8 profile;
>> +	int ret = 0;
>> +
>> +	on_ac_power = power_supply_is_system_supplied() > 0 ? 1 : 0;
> 
> Comparisons already return a boolean value (i.e. the ternary operator is
> not necessary here)
>

Ack, will drop the ternary — on_ac_power =
power_supply_is_system_supplied() > 0; is equivalent.

>> +
>> +	profile = on_ac_power ? EC_FAN_PROFILE_BEST_PERF_PLUGGED_IN :
>> +				EC_FAN_PROFILE_BETTER_BATT_ON_BATT;
> 
> Is being on a (powerful) charger a prerequisite for entering this profile?
> Currently plugging in a 5W charger would trigger the switch as well.
> 
> Should this instead be exposed as a fan profile for userspace?
> 
> Konrad

Fair point — power_supply_is_system_supplied() only checks mains
presence, not charger wattage, so even a 5W charger triggers the "best
performance" profile. And exposing this via platform_profile instead of
an automatic AC/battery switch would let userspace make the call
instead. Will check on the feasibility of making this possible.

-- 
Best Regards,
Anvesh

