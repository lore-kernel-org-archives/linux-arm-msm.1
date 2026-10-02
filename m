Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB1F446BE0
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 07:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790927264; cv=none; b=Yk7BVjYGo2npKsdGAEXLfOc9yN8thB8Jg6ID0qvuvlZh5V/mc8gqeW1bc8rubVPE14SPG6QtaLjUJeMRH2RFW5IjABxyp8Kwl4uUAZlWzVEdmYKxaDz92jQs8y6Qg7RManQQjjtYohoTzULvazMm7CxNkr5ffQCILEpXJF1IiPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790927264; c=relaxed/simple;
	bh=GsiBeouX/gtaMf4zOeo+rrTtK4Uq5wqLAWhlg0LU0nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G4Y1ChxTiEvfr47RCfW3ACd1ZJr+XS/rnBWFyYkZAKiZaBF3GS1bQY7+voUkNDH7uEuB9WJaocNiop3RNhBXkr/A7eWFjl4gTEQrczHbEZ4fti3L/ii1zXM9EZSZnqIzkcZgoRrIY9Clvy0bXQozuknBDm7CV4O3/iWDTAvypbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cLCHH9ji; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=acmkKUWa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cLCHH9ji";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="acmkKUWa"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925jQrK234091
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Oct 2026 07:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=koV6fU0fBroPWgISEdPaMuGQ
	L0eL41QYrOdoT4EtC4U=; b=cLCHH9jiXbsSGmJ+tqO9aDNUTBNApEwWtKKes23z
	sPBxgFVeLXGN4ueIFrGFXakHGUflp9yq2+7fm1ktVfD6LArlcXfLmHuCxmcdkkCT
	D/WVc//7fa5pibXdEyoWnR7CWLFICLA/BY4F76o6T6gl8KifANcjwZ6Pw9S0PWKP
	EEMaPqbszLMf2rS95XltMTtP8lwpcGgKlr7z0mc2wcfN8EWp+dtqobSrfX1oOzVW
	o8u/unPL/QlRx8FVT4uQWNS9qTnDFieviRbc/uBesDPZ3bonBGn3POFCPxZsg3ZT
	YNVThu6zCo+P4cgSY3ILopBFhCH1qkBMfl8ypq2ILV+KoA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1t9ab3e5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 07:47:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e49a1d3b1so141985a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 00:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790927262; x=1791532062; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=koV6fU0fBroPWgISEdPaMuGQL0eL41QYrOdoT4EtC4U=;
        b=acmkKUWa3bJhl3fyWEgaDyTWlrqo/rRfuEgihT3upddqM0njGZwNMCwhgtMIOTrX/L
         BnhSuXD/URuX+07sM1oVOI2p6zfN7i0d0Wtg1eycKdCPHXQQPkAzjcK9ojzNRCov/AwX
         kOZHlno9hojVNZlSSL6BsH/BfUXS7FxY8+NThJzVHla88TYUvyMjt/QDUpC1nAgAfCZc
         LT4GGT8KyS/ckCT4h02+W7dt08bbxQvRrDWff1hSlFi0TIQPz38koCH5t9XoH79Ln7KY
         DaasGZJgxAOsvqahWIOCYBAyQwTGA1hOLrVuCxIqqP5cFnXP8fWCFDbJicEoBq2/HNwu
         9HrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790927262; x=1791532062;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=koV6fU0fBroPWgISEdPaMuGQL0eL41QYrOdoT4EtC4U=;
        b=cIIF2c86loiF1oxtwRG8UTAx9yetGoP+xhAE5zlF8KLQqUUrkyzPDvaam9GxYB2e0G
         /dImhC6aXaoCbzdCQW6CfNumsqdiYmZnMXUjTOul1y6m7hJ4rznc6RC8tNT2AZ9ZMhd0
         b5S63Z0INHZ2EgYMYNDvbqJMcOTDQ9/vBL9txirT+VK0vQ1ADh/V/6kWSqV/Php3xT8j
         yYFD4Q7nxcS0x1UOK07tfwoCYexrCIEGRnT2VW/BWwpcRDvUehzCWYVAOs4qYg16sCV1
         ioc8YVViF2SaDcwEduDxTRvHAvf4SPlaudDxxkN7iGjz+oD4bQRizrh73sn1TOxXZsEL
         uh8Q==
X-Forwarded-Encrypted: i=1; AKwUvBz0+I6gFa6MLswU0SoNDgHwlHHntzYappj2/GtKidUV6AQQmN1KbwakyJbOVWQ66XIyekBPEPIIck4TTLbX@vger.kernel.org
X-Gm-Message-State: AFuF++l1OFUbmgnQNDazwfCBgIh/2EPlSfcbMmXlLvLykSeseAbz+ruq
	8SsF6VAg44nhV0Ya8D7MGV79itpgUneA46/D5L5uB5ubHvLxfMQU1LBS5QUcVKegWXEOwXQk+w9
	JBZHkKUgGz7z2K8eHYGVwL1N+70TNfi5oAMMzC/xSU1slVB82XRqlz0gDELtZEq+qqT3y
X-Gm-Gg: AYBFou1KPR9/woLBV92WOs2NfJWxk/ZZVuvdVVb0atRJ2anWsIjZBdozeS8LYXY4R+b
	8I/S952dWF4gawyJyF6Ec7rAbvjgqJFIubZs1EMZ2LlBswL/3gZ824UHDhQOqnlCAoXd/Ym2IRN
	XyaXg3zYTFg9yjvtxhVTLWWC+KMCNd3mJ1WGzVaLZchDZnrZuotV7Mngb5dziNo1Exl819z/z6+
	yONjqqygIeIChJz+17+JWn4RGA/h7SdI4RnO0E0QudxC7F/F9FbEEc7kPH2Q0HSsS6S8WcLO3WC
	gEo4w4xzz9+T0p7PJA49OtA0qJ3MKGjtqHKYw6hGOGM7/3enxV8ZVPjY1LRKSU7j9gld7EwijAF
	X+k7hWYRQ2Enjn2yhDzaJ
X-Received: by 2002:a05:620a:1a05:b0:937:5298:7820 with SMTP id af79cd13be357-93ce7a9de10mr312521985a.8.1790927261398;
        Fri, 02 Oct 2026 00:47:41 -0700 (PDT)
X-Received: by 2002:a05:620a:1a05:b0:937:5298:7820 with SMTP id af79cd13be357-93ce7a9de10mr312517585a.8.1790927260779;
        Fri, 02 Oct 2026 00:47:40 -0700 (PDT)
Received: from mai.linaro.org ([2a05:6e02:1041:c10:f14c:b716:c104:4712])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027741586sm59554805e9.14.2026.10.02.00.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:47:40 -0700 (PDT)
Date: Fri, 2 Oct 2026 09:47:37 +0200
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
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
Subject: Re: [PATCH v14 2/6] reboot: hw_protection_trigger: use standardized
 numeric shutdown/reboot reasons instead of strings
Message-ID: <ar9e9-xnxO8rbJk0@mai.linaro.org>
References: <20260921-pscrr-framework-v14-0-a16290003b7c@oss.qualcomm.com>
 <20260921-pscrr-framework-v14-2-a16290003b7c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-pscrr-framework-v14-2-a16290003b7c@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzMCBTYWx0ZWRfX7hmEqI2QJLK5
 K7meNEuslSH+LqiFBhEu6BeXMfA12bcpW3FMIxIRYe3jkPdzJY4zwuIsxmaV30NSLJUv7CQ9pSW
 NK6i9A2HamFPveRCPZN5PFt7+LRHIa8=
X-Authority-Analysis: v=2.4 cv=N++8hG9B c=1 sm=1 tr=0 ts=6abf619e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=pD7qEO7pPVLmAv5tJawA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: MMHK42denUczsz8D45bkfd9h87mCYjRp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzMCBTYWx0ZWRfX8cuEyQN194hb
 0RtL/63tfBeArylJmNdrmkVt61Ru/Z6TtMbtWQLLBkYstTq58Td0kLb0Sn2vvkSYkEwC5TA3dn1
 +VUQZDyCFdOOe5/iWPtb/RVDi1GwqZluw/iyu00eRoT1MwrglKvVeQuC1oX+n8maLPgxRYEtf5q
 J1H6szD3n+Jia6/Uge+8fZMxjoLrL+aN9ULtb18ntHHFowCkH851HzsUdvzUDslMouMyyokSts8
 Dq+VBOWzDrA1/ueYchHtFardzjE2YQwQ+StMYvPWU2hZBiFds078PUGuRlwV6+xCkkY0fn4Nze+
 X+1kdO+8RurgsoNxDEHC7COwiH3VFxvQP36FsDHV9xRwfARCvNHRcFT8FrOIHwjDAv/DQtJaMrC
 Shgnixm2ysuG/jR8JSZg406YMJBOZywEeP919w45aU4Eukwh+wABBsKI/8LEj9XQdb+DIEPrItn
 xtYPk9AFtGw8uLaZUxg==
X-Proofpoint-GUID: MMHK42denUczsz8D45bkfd9h87mCYjRp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020030

On Mon, Sep 21, 2026 at 11:14:17PM +0530, Faruque Ansari wrote:

[ ... ]

> +/**
> + * enum psc_reason - Enumerates reasons for power state changes.
> + *
> + * This enum defines various reasons why a system might transition into a
> + * shutdown, reboot, or kexec state. While originally intended for hardware
> + * protection events, `psc_reason` can be extended to track other system
> + * transitions, such as controlled reboots triggered by software or
> + * maintenance operations.
> + *
> + * The values in this enumeration provide structured and standardized
> + * identifiers that replace free-form string descriptions. They are designed
> + * to be stored efficiently, making them suitable for use in environments
> + * with limited storage, such as battery-backed RTC registers, non-volatile
> + * memory, or bootloader communication mechanisms.
> + *
> + * Importantly, the order of these values **must remain stable**, as
> + * bootloaders, user-space tools, or post-mortem investigation utilities
> + * may rely on their numerical representation for consistent behavior.
> + *
> + * @PSCR_UNKNOWN: Unknown or unspecified reason for the power state change.
> + *	This value serves as a default when no explicit cause is recorded.
> + *
> + * @PSCR_UNDER_VOLTAGE: Shutdown or reboot triggered due to supply voltage
> + *      dropping below a safe threshold. This helps prevent instability or
> + *      corruption caused by insufficient power.
> + *
> + * @PSCR_OVER_CURRENT: System shutdown or reboot due to excessive current draw,
> + *      which may indicate a short circuit, an overloaded power rail, or other
> + *      hardware faults requiring immediate action.
> + *
> + * @PSCR_REGULATOR_FAILURE: A critical failure in a voltage regulator, causing
> + *      improper power delivery. This may be due to internal component failure,
> + *      transient conditions, or external load issues requiring mitigation.
> + *
> + * @PSCR_OVER_TEMPERATURE: System shutdown or reboot due to excessive thermal
> + *	conditions. This attempts to prevent hardware damage when temperature
> + *	sensors detect unsafe levels, often impacting CPUs, GPUs, or power
> + *	components.
> + *
> + * @PSCR_EC_PANIC: Shutdown or reboot triggered by an Embedded Controller (EC)
> + *	panic. The EC is a microcontroller responsible for low-level system
> + *	management, including power sequencing, thermal control, and battery
> + *	management. An EC panic may indicate critical firmware issues, power
> + *	management errors, or an unrecoverable hardware fault requiring
> + *	immediate response.
> + *
> + * @PSCR_REASON_COUNT: Number of defined power state change reasons. This
> + *	value is useful for range checking and potential future extensions
> + *	while maintaining compatibility.
> + */
> +enum psc_reason {
> +	PSCR_UNKNOWN,
> +	PSCR_UNDER_VOLTAGE,
> +	PSCR_OVER_CURRENT,
> +	PSCR_REGULATOR_FAILURE,
> +	PSCR_OVER_TEMPERATURE,
> +	PSCR_EC_PANIC,
> +
> +	/* Number of reasons */
> +	PSCR_REASON_COUNT,
> +};
> +
> +#define PSCR_MAX_REASON	(PSCR_REASON_COUNT - 1)

May be I missed it but where is PSCR_MAX_REASON used in this series?

[ ... ]

> +/**
> + * psc_reason_to_str - Converts a power state change reason enum to a string.
> + * @reason: The `psc_reason` enum value to be converted.
> + *
> + * This function provides a human-readable string representation of the power
> + * state change reason, making it easier to interpret logs and debug messages.
> + *
> + * Return:
> + * - A string corresponding to the given `psc_reason` value.
> + * - `"Invalid"` if the value is not recognized.
> + */
> +const char *psc_reason_to_str(enum psc_reason reason)
> +{
> +	if (reason < 0 || reason >= PSCR_REASON_COUNT)
> +		return "Invalid";

s/Invalid/Invalid reason/

[ ... ]

With that fixed you can add:

Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
