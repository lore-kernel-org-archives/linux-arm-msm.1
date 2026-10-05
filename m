Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F813449992
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 12:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203243; cv=none; b=GgfiZ7/8B9gA/GJoKYr2iAVXHKz8cjrYNBYf1DwtIhbYVAeO9iJPr5c8lF/LzTigB3Oe4v07iBScfsKd0Tax3k+XWJKdaQI5bQW/M8svtrvYGlySdYLSFe+ML6pCxEB78v3KeiCCBCkUTc+OhDueSqKZLtKNWCVHhbwDRUKGdB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203243; c=relaxed/simple;
	bh=HM7xWW72inL8pVXjHxjEBpKztV5Tkb4GWN6CBp2ZAo4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pFbt3DKbvwTNEaMiYw1QikWuewthrOq6bdiOfQWXMCADkJmq9lNaiueUjHcyOEWkm06kWTh8Hg1svfQYQipsg5Y/9M0GU102DXxQ/RKfojtd4x+DrJYtYKrRBHgwfUDqDPYgDFDp2geRQyowFoX/+gLrrs1jUoyctX/ndFLa4/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HjWl7pS1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jNyvKZIF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HjWl7pS1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jNyvKZIF"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFYpq914125
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 12:27:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ku1JxzIA5L2qSeOtjta51eOG7KEMsweqrxxJaRm5ZmM=; b=HjWl7pS1l/rXQ5fC
	iBy57nsVs+CQ6C+sC+fjd0uEl54MLMqHzIKkx1wI4Gzsan4QUJYEgR/5GH0RWkUI
	FvqLEOCvkW3/ZIumt362q+uWEcHNHurQ+O1fHBkk4cRevEv/7eFrKWDQtxV1uJSq
	hNk8JG5/1pFdea4OBIJ2ksRtMErB4VCsCSXEzWxQzvO0cjDub7GnbXC93VRpvnvl
	t424W32a8IuNIp+9LZkGCCBN5GuI2c9aO7SyxhteBJVlxQ94xjM+OzL5bDVHWWZK
	mwGWCP0dZYDgIbLDjTCXUH1oS6vBNvBilnk47h6cKCpa6Xhtfy+Hlop7qPHjAfGj
	Vm36Ug==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3chfkp7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 12:27:20 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-46a12cfc288so1979927fac.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 05:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791203240; x=1791808040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ku1JxzIA5L2qSeOtjta51eOG7KEMsweqrxxJaRm5ZmM=;
        b=jNyvKZIFzqKokh9TTeAz4ZPXmpKTnspUxfWQmfBbXCCbMvo635rvt0RekjjP33ggy/
         m7l4URmd2Ij2lCRtcRt6Ssw86oOa+Cu0VUcOCIT/aeP0dZXbDpYZjErNhteiDz7kx8m1
         FkvsC1/UTDGalPHqz9GXIxxVRz5VOpMCd5U5MSohy02g+3UDfZxRIsxbjhMObSDayFr8
         HON/Np3C88gh4+PKBWMLVNfJtFomvZTfYxzmp1JkJhiJiX55mgIC9UDrhlDlYpNq7N1y
         9CrcQUwPqbUQ/UfO9jhuGaZHrU6Fan9TSZVFwc7hdC6211oD51BRYgxvD+2ZUMcUyI5H
         nV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203240; x=1791808040;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ku1JxzIA5L2qSeOtjta51eOG7KEMsweqrxxJaRm5ZmM=;
        b=YVKxMI9Gl/wDmU7740J1KGdh0A+MLAVUfTN+FyAngD+pQFANv3peOyCm0ouNW3teoq
         672nL3u5zV8fW+f0hJjHgCCd4Ypm9e4IJ5TGzf5hKSp0vKAsKSIFXlk6bVzQaeRRRgW4
         EBThkk7WR71JW+1qVap4HM5Bz4XYJ0WUd9wfGzx8vQ8VDSRiBpZpVaQi3iXOJyWtq4ZF
         4ddP5Src8f+2UetA9yTe2B2J1epcAFUGuC0kIpUc8nfPO6c5RRtzTlgWf3XLjnVGyByU
         0KfLWt+2Csfgo2ZcNzhxQFwYTx7XDErdD06yGg8Qzw4QdJgZxzI59RMe2rSjtyRqcsNO
         Sp2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxfv31jpUmm1SDicIvQWOjP8T4GpoYtZtVCYRek1ukxSK5pX/zCZejmwXWUf3mVaVef9P73rEKlp13pZryG@vger.kernel.org
X-Gm-Message-State: AFq9FYIDI+Ot18jnbRMl9EKJNKY2xsiY67dTbKuItvdegpPh2bpV5tme
	Pj0wUHRn1UYfmswrxcQXK1XG/ezGa3Eg1FXjCx0uqTR/JBwDKY16GZLjsGHWqfkQXjxnlQdNyI/
	ZLHLnPA1rK1KcBLUiAQXABIip+Ts2SPrUVUJgFvTEGwQSpkIpQRnRbPfQBdicFiEdzT0=
X-Gm-Gg: AYBFou1WAUVyq9V+NKAOiuUPX7cIMEzw94wuZPk/gnYXm+nH6SeDQ6+bpimknhSaC+X
	JqeBgtasNYRE09YfRJfdTrQvtVECEE3nDqZJe+GsKC89Wu8XrizlNyNPiSQz3m/FPfGRb3OwYtF
	Sxz+YYTyaQGqpuxLMlBMEvFFPIUfa6ZaumWocP3OVFF4Djzloey7+YODmkTxJklthjKiaxtFk9J
	5tvUss5SnrIHrDasqxHfUI+Jo2Mp+BjvAWc47VsSLEt0U3piMWRIAOmJh0DaS7dWnOLj56DjJLC
	STYYTuyYa9BDWaHw8aCoX7Hk07NTZ8gPy4+RYzCQUg/fiw3VtyIz7EtzvPEFSRUAKnDz8BUsddg
	7qxMaszjt3h/wsPjpFrCLBFuIOkrQ8Q==
X-Received: by 2002:a05:6870:8262:b0:48f:e363:5cc6 with SMTP id 586e51a60fabf-49e1600a4cdmr8908536fac.52.1791203239719;
        Mon, 05 Oct 2026 05:27:19 -0700 (PDT)
X-Received: by 2002:a05:6870:8262:b0:48f:e363:5cc6 with SMTP id 586e51a60fabf-49e1600a4cdmr8908496fac.52.1791203239158;
        Mon, 05 Oct 2026 05:27:19 -0700 (PDT)
Received: from [10.218.33.235] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49e16a4ecacsm9110158fac.1.2026.10.05.05.27.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 05:27:18 -0700 (PDT)
Message-ID: <e4ff494b-0321-4d63-b648-1b26f42be2b3@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 17:57:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Subject: Re: [PATCH v14 2/6] reboot: hw_protection_trigger: use standardized
 numeric shutdown/reboot reasons instead of strings
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Benson Leung <bleung@chromium.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        Guenter Roeck <groeck@chromium.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        avaneesh.dwivedi@oss.qualcomm.com,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
References: <20260921-pscrr-framework-v14-0-a16290003b7c@oss.qualcomm.com>
 <20260921-pscrr-framework-v14-2-a16290003b7c@oss.qualcomm.com>
 <ar9e9-xnxO8rbJk0@mai.linaro.org>
Content-Language: en-US
In-Reply-To: <ar9e9-xnxO8rbJk0@mai.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tuHbOqpdoDb2ai9aLogXW1zWM9y63Ku0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX/kM89jdxPUxN
 Ktmt79bGrFJvmpubob4qz1lr10rYFk2JwPIyqksx39PqKZ9yezISUjO2rv/BSqilJ4fRnZaEZvp
 vyyVCUO07M7R2uQ/XUfDd9SvtVWErhY=
X-Authority-Analysis: v=2.4 cv=eZSo7LEH c=1 sm=1 tr=0 ts=6ac397a8 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=djRMLSAIY_qdro3gjIQA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-GUID: tuHbOqpdoDb2ai9aLogXW1zWM9y63Ku0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX5ESTniTZpR5d
 QVwmeZJlwuXAWQdiPSsBXgQD8Clp4mjaXBMny3AMD6W2Lqp9TR/8KGIk/mDe+yaxTRfWhWQGr88
 4MunFbw595ugpPLx+BRNxzpEHoSKQZuVE7ilkzDlHG93qCPWxQCm/LfN0defk3ErFoMy0EB+Xvw
 C4V45ecK2zBhbLG9uG69O4HmlP/7iU9e80PfykLRftDe/wPD7NfCk/cRfUy6JvHMJNBEsz/WEri
 yRshDT4APPZ/p0gULw4kcv/BsLD2oP5Wa8p7fyaCExEBKbtkLHoGz9aPi/thJMK/PUCEG6AuXZ7
 x/URlj8ynXcqd06CBln5RcBYIZ/04qpMbuDdYA9UZthjtp+Gs4iTZiIt4wbVcj5eC/4kWpV0Oq0
 JW/L9Dcu5MrcMQthCL0i++1Q5DTtHoNe/NjAs4CZh4pA36s+CxOSOf99rYDYbXeACPCyCPi40JN
 MNB9J1cNUagYnbm/Xug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050048

Hi Daniel Lezcano,

On 02-Oct-26 1:17 PM, Daniel Lezcano wrote:
> On Mon, Sep 21, 2026 at 11:14:17PM +0530, Faruque Ansari wrote:
> 
> [ ... ]
> 
>> +/**
>> + * enum psc_reason - Enumerates reasons for power state changes.
>> + *
>> + * This enum defines various reasons why a system might transition into a
>> + * shutdown, reboot, or kexec state. While originally intended for hardware
>> + * protection events, `psc_reason` can be extended to track other system
>> + * transitions, such as controlled reboots triggered by software or
>> + * maintenance operations.
>> + *
>> + * The values in this enumeration provide structured and standardized
>> + * identifiers that replace free-form string descriptions. They are designed
>> + * to be stored efficiently, making them suitable for use in environments
>> + * with limited storage, such as battery-backed RTC registers, non-volatile
>> + * memory, or bootloader communication mechanisms.
>> + *
>> + * Importantly, the order of these values **must remain stable**, as
>> + * bootloaders, user-space tools, or post-mortem investigation utilities
>> + * may rely on their numerical representation for consistent behavior.
>> + *
>> + * @PSCR_UNKNOWN: Unknown or unspecified reason for the power state change.
>> + *	This value serves as a default when no explicit cause is recorded.
>> + *
>> + * @PSCR_UNDER_VOLTAGE: Shutdown or reboot triggered due to supply voltage
>> + *      dropping below a safe threshold. This helps prevent instability or
>> + *      corruption caused by insufficient power.
>> + *
>> + * @PSCR_OVER_CURRENT: System shutdown or reboot due to excessive current draw,
>> + *      which may indicate a short circuit, an overloaded power rail, or other
>> + *      hardware faults requiring immediate action.
>> + *
>> + * @PSCR_REGULATOR_FAILURE: A critical failure in a voltage regulator, causing
>> + *      improper power delivery. This may be due to internal component failure,
>> + *      transient conditions, or external load issues requiring mitigation.
>> + *
>> + * @PSCR_OVER_TEMPERATURE: System shutdown or reboot due to excessive thermal
>> + *	conditions. This attempts to prevent hardware damage when temperature
>> + *	sensors detect unsafe levels, often impacting CPUs, GPUs, or power
>> + *	components.
>> + *
>> + * @PSCR_EC_PANIC: Shutdown or reboot triggered by an Embedded Controller (EC)
>> + *	panic. The EC is a microcontroller responsible for low-level system
>> + *	management, including power sequencing, thermal control, and battery
>> + *	management. An EC panic may indicate critical firmware issues, power
>> + *	management errors, or an unrecoverable hardware fault requiring
>> + *	immediate response.
>> + *
>> + * @PSCR_REASON_COUNT: Number of defined power state change reasons. This
>> + *	value is useful for range checking and potential future extensions
>> + *	while maintaining compatibility.
>> + */
>> +enum psc_reason {
>> +	PSCR_UNKNOWN,
>> +	PSCR_UNDER_VOLTAGE,
>> +	PSCR_OVER_CURRENT,
>> +	PSCR_REGULATOR_FAILURE,
>> +	PSCR_OVER_TEMPERATURE,
>> +	PSCR_EC_PANIC,
>> +
>> +	/* Number of reasons */
>> +	PSCR_REASON_COUNT,
>> +};
>> +
>> +#define PSCR_MAX_REASON	(PSCR_REASON_COUNT - 1)
> 
> May be I missed it but where is PSCR_MAX_REASON used in this series?

Ack. Agree, PSCR_MAX_REASON is not used anywhere in this series. 
It appears to be a leftover from an earlier revision. I'll remove 
it in the next version. Thanks for catching that.

> [ ... ]
> 
>> +/**
>> + * psc_reason_to_str - Converts a power state change reason enum to a string.
>> + * @reason: The `psc_reason` enum value to be converted.
>> + *
>> + * This function provides a human-readable string representation of the power
>> + * state change reason, making it easier to interpret logs and debug messages.
>> + *
>> + * Return:
>> + * - A string corresponding to the given `psc_reason` value.
>> + * - `"Invalid"` if the value is not recognized.
>> + */
>> +const char *psc_reason_to_str(enum psc_reason reason)
>> +{
>> +	if (reason < 0 || reason >= PSCR_REASON_COUNT)
>> +		return "Invalid";
> 
> s/Invalid/Invalid reason/
> 
> [ ... ]

Ack. I'll fix it in the next revision.

Thanks,
Faruque Ansari

> With that fixed you can add:
> 
> Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

