Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72BE449992
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 12:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203206; cv=none; b=t05FE8ndzAEtemE7ar6cUg7pNgFSPstu2SYRctxGIdWPpc0VnYkhutptYphGUHxdi14hzD5hdINJDJr53fjExdqUeom3ZQh4o0DzY2eX38eQyvhol1RSl1pHa4a/vk4a8f6Oap2fqLPffHSJVqURWzhUDwYNNfHgEjDExO3osww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203206; c=relaxed/simple;
	bh=DWqhyC/tmPKLMx1pkykGRx5DG8fgtYzZoHE+/f1kBIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EYhlOR5kfNpah25xpeTS76iruEN86VJCW3x+VHWQC43Ij2qekqGEo7ayX2uaq18LEp4FI+GrHyBv7y3TtCmbmFB+BYGVmdMizWfE9llYPmeWbqV7f5Iu5QnoH/7N2zrE/IjEgCnH9XAo1WgPkRY/hATzM2YigGtDW+rwKBbS5Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cM3WK5vQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AT7/7Ndj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cM3WK5vQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AT7/7Ndj"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFSIE1068617
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 12:26:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0y29NJ72KUb5bWZadq5mDDroE1zzdodKPhsbmTO8YcE=; b=cM3WK5vQFupBhngF
	4PaseE+jzfQaPWuNxo9fP3m7KgaRGaX3O1CdHMy7cbSiEJJ38VxWQGgXUnMDrNA5
	7V0z2kkS+MHGO7Qxn3yvOvhChH2WZ9bbmhCF+wwEeZr1Aq84vw4Is9s78IDrP2/N
	MANmojsPccAaN33WVr8f61PMZv+vOCQPMAETHGd/WVtK+Zcba0PSE6gO+ABEVSO2
	F/q/RD5WpQXgptnvFX8RZxGPOt5Pi8/JNFs3/GDLqzXVqfiOeI4qyrCfgv+xWTKZ
	0rNvjx2aHptmxF35t6BQoyiERcMiXPLBYdnjU4NDz+/OYPw26NvOWHDqqrk+wkgP
	9Gxk5Q==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2u08npd1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 12:26:43 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-81b20bea169so1714601a34.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 05:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791203203; x=1791808003; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0y29NJ72KUb5bWZadq5mDDroE1zzdodKPhsbmTO8YcE=;
        b=AT7/7Ndj4byU6Dqmxt6vsh1CdF3TfpCqpEmMkXJ8keLew5re/x2hbF4DCcbSkAhYD8
         PbDuHoN3I01sNGBtJcqWdlHfSSx3DRkIWhUEnxmqJORWM1n6BQ5Ac88vFhj22sTQshna
         2kkoTGs6zAFmRpFHM2HNwIympDP7ToOrsX1PvN74/AMchorLAT4UCFME8LU2fTLXVuPX
         5dK5utKeGL03hvAKczKBXpAsJIqUfouigdq6B0H0vK7QxJ1oDcV8QO1thwGkiSuwQ1sl
         pffDWC++ZbJUIDOCFRy4N6XVKLTCj9MLvrvLT48c4ZlsI0b2d3Y9xSkkYT/vcsWsRA27
         /JUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203203; x=1791808003;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0y29NJ72KUb5bWZadq5mDDroE1zzdodKPhsbmTO8YcE=;
        b=g4fAKjX014+2sB4DcQ3NX71aSonz7LtsjuSXTP5hYr0xP0GH8+QdMgihhPkFzltO5U
         MiszEbJerD77JQxgKmrN7ed5H375rKA+2SXDMqzjzqC3M3PAXDf3sxERtVTle4MTJCka
         J+3KXAKMQHMgrsA83LN17aORfXlxpiXN1mJxTe99RqS9ZQere63io2GwDgcR2hVSnlQZ
         X/eOa25ycGVsGhodwfQi13XJJeJtIeV6T9WVxMRHyM1vTOJ16At5Wo5LICH6iZM9cYWC
         AB214f0zozuKJvcJF3/kC2NZY0UkiGUaw427cQaUJkeUNHCz0QPojupoltWVM79heuJW
         L12w==
X-Forwarded-Encrypted: i=1; AKwUvBw1LvB7KEol4UNsyvfnnbnYzBCUUck1XOVVKicZRQ0COFObUzZeoJZc1Dn6VaHeGKKZrcMqK6MwavLb6exQ@vger.kernel.org
X-Gm-Message-State: AFuF++lnuIvtGwLAgD671ft6Am9zeAoRBZ3aPgwMFDZC721hTZdc4y25
	OUFIx/Nra3OY6dUhXHlApfiql5ssEdw9mKWjHgy4kelkNl87HUwInhkYugZrOsljRISf1iSM8Ad
	Qgp5tUMfG57Ii1Owu5TTGz3HBT+4t1Ph1loYHPQg8Glh1KGD9tNwm2M3mN4jx9PZXd+s=
X-Gm-Gg: AYBFou1/C7SXwqR9z7onxJaDuplE4pBfHcH6im12grIx7GUiIGEDI65WgPJcQBHyzWi
	t7qVQokvYlvslye3zmtZDjkhJWiw7ALzDwwusANHsHDOTuyHgEYW1YOnbFRknytlEbBjOt3y9dk
	PaVYE5e1lNla1SkkOCviNm8KIZFGH3EfGS6N6YsOMX2nKv8LfMqBz4u5hPGblk2J4NSCbPUguhO
	CqJqQ2NAH21tUNEBWGUjHu/x3XxHMRX5NXjfujxTcJkkmTFycQ4aqaDM4Omx0wRemLC+LQCjVDA
	MC1ld1C5GFlhVZY2zZENKRidDoGNOt4j0vnEqP5IOhRbrI78XWErdAKd8rpswTIaEOco8tv9Npc
	P4t7ogq+ctyGzLkxBHE15hHFplslDHw==
X-Received: by 2002:a9d:53c8:0:b0:822:e8ac:7d20 with SMTP id 46e09a7af769-822e8ac7d64mr6133263a34.6.1791203203069;
        Mon, 05 Oct 2026 05:26:43 -0700 (PDT)
X-Received: by 2002:a9d:53c8:0:b0:822:e8ac:7d20 with SMTP id 46e09a7af769-822e8ac7d64mr6133232a34.6.1791203202474;
        Mon, 05 Oct 2026 05:26:42 -0700 (PDT)
Received: from [10.218.33.235] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82279c7cd33sm12170590a34.14.2026.10.05.05.26.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 05:26:41 -0700 (PDT)
Message-ID: <c5b6538b-98f0-4feb-81bf-531b9d350654@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 17:56:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 5/6] power: reset: Introduce PSCR Recording Framework
 for Non-Volatile Storage
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
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Francesco Valla <francesco@valla.it>
References: <20260924-pscrr-framework-v15-0-7af87107e0d3@oss.qualcomm.com>
 <20260924-pscrr-framework-v15-5-7af87107e0d3@oss.qualcomm.com>
 <ar90GoaxTV8pjonY@mai.linaro.org>
Content-Language: en-US
From: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
In-Reply-To: <ar90GoaxTV8pjonY@mai.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: grNVfOTY-ewvpdRFsKLvpfH8jOJml4z7
X-Proofpoint-GUID: grNVfOTY-ewvpdRFsKLvpfH8jOJml4z7
X-Authority-Analysis: v=2.4 cv=JqlkP84C c=1 sm=1 tr=0 ts=6ac39784 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iCmAgw2Nae9LL_8LRIEA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX2afIKI5Pt+pY
 poEyq47swFix//y2eTomqO1JIAL/gKPyxvri5IfxRd+yg3j2PUTXYAb9KVaE5crX/7c7GaEMQHz
 wRUc19wwfDfpIbuu1gCQDlbAu0lfMhY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfXzAg8Cirie84i
 uEr/F5Z3cKoayRK3ZEIUMyl/WfFq8f3bmxjLdMKXC2tsNb/dXKjvB4OTDVuYbdFaxElni31T6zW
 5hozkwBhVGLXi71GB08e/iytD3RLZopo8cIKSwjDiQTj2HmmMb3n/hvxRpVnV5Pt7Of6lsAfQ6f
 Rz2vqRbKzkbjrdOtjgoUEC3PnSctbzVf5p8Mu/zk88xzIJihfzjk6hmZHGwuSxkEYpNCk7EON21
 ptbRitEvW6F1r0LHi8zMRUycZ2ny8IehXJAXkp3vrpnwKIAUjEl1yJvmKeHbQy5NvrcqgbjqyUR
 6YfQxEtagfca7ie0WSFeZ/7lAVu6Xg1usPyg+5k1GO5kOlIL5QfSBynKUrUoiJRFdS/kt0Qiy6F
 jDpue+DkpNWyjZlkDDPsKpK/s0RsR/c7q6PVD5FL4/WhcNuQ0lNsim5v0/lsAXZUUFXWmYcLb+F
 UZJB1/l2I6UsEFv3iGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050048

Hi Daniel Lezcano,

On 02-Oct-26 2:36 PM, Daniel Lezcano wrote:
> On Thu, Sep 24, 2026 at 12:38:46PM +0530, Faruque Ansari wrote:
>> Introduce the Power State Change Reasons Recording (PSCRR) framework: a
>> generic mechanism to record why the last power state change (shutdown or
>> reboot) happened - under-voltage, thermal, watchdog, software-triggered,
>> etc. - so a postmortem reason survives a reboot or an abrupt power loss.
>>
>> PSCRR is built around providers. A provider is either a hardware reason
>> source (a PMIC, SoC reset controller or watchdog exposing a reset cause)
>> or a recorder that persists the reason across a power cycle (an NVMEM or
>> RTC scratch cell). Each provider gets a directory under
>> /sys/kernel/pscrr/providerN/ exposing its name, backing device, the set
>> of observed reasons (as tokens), its capabilities, the reasons it
>> supports and - for recorders - a record policy. The reason set is
>> deliberately not collapsed to a single winning cause, since resets are
>> often multi-causal.
>>
>> Reasons are the numeric enum psc_reason values from reboot.h, shared with
>> the POWER_ON_REASON_* vocabulary, so they store compactly in small
>> battery-backed cells. The current reason (get/set_psc_reason(), set by
>> the thermal/regulator/hw_protection paths) is written to every recorder
>> from the reboot notifier.
> 
> [ ... ]
> 
>> +menuconfig PSCRR
>> +	bool "Power State Change Reasons Recording (PSCRR) Framework"
>> +	depends on POWER_RESET
>> +	help
>> +	  Enables the Power State Change Reasons Recording (PSCRR) framework.
>> +
>> +	  PSCRR records why the system last shut down or rebooted into
>> +	  non-volatile storage, so the reason survives the reset and can be
>> +	  read by the bootloader or early user space on the next boot. Reasons
>> +	  come from software (thermal or regulator hardware-protection events,
>> +	  a watchdog pretimeout, a kernel panic, a controlled reboot) or from
>> +	  hardware reset-cause registers (PMIC, SoC reset controller, watchdog).
> 
> [ ... ]
> 
>> +static int pscrr_reboot_notifier(struct notifier_block *nb,
>> +				 unsigned long action, void *unused)
>> +{
>> +	guard(mutex)(&pscrr_lock);
>> +
>> +	/*
>> +	 * A reboot, halt or power-off that reaches here with no more specific
>> +	 * reason is software-initiated by definition. Record it as such rather
>> +	 * than leaving it unattributed; a real cause set earlier (thermal,
>> +	 * under-voltage, ...) is already latched and left untouched.
>> +	 */
>> +	if (get_psc_reason() == PSCR_UNKNOWN)
>> +		set_psc_reason(PSCR_SOFTWARE);
>> +
>> +	pscrr_record_current();
>> +
>> +	return NOTIFY_DONE;
>> +}
>> +
>> +static struct notifier_block pscrr_reboot_nb = {
>> +	.notifier_call = pscrr_reboot_notifier,
>> +};
> 
> I'm worried about the mechanism. The call to set_psc_reason() sets a
> global variable and pscrr_record_current() write its value to the
> NVMEM backend.
> 
> That is done from the reboot notifier.
> 
> Is this notifier called in all cases, eg. watchdog reset or emergency
> reboot ? It sounds possible the reason is set but then the notifier is
> not called thus not written in the non-volatile medium, no ?

Ack.
Thanks for your review.

You're right. The current core series reliably records only 
orderly reboot/shutdown paths via the reboot notifier chain; 
emergency_restart() bypasses it, so the reason may be set but not 
recorded.

Panic-driven emergency reboots (e.g. sysrq-c and watchdog 
pretimeout panic) are addressed by my follow-up v3 series [1], 
which records the reset cause via panic_notifier_list before 
panic() reaches emergency_restart().

For true hardware resets (e.g. watchdog bite, brownout, or 
external reset), no Linux code executes, so software recording is 
not possible. Those cases are expected to be handled by PMIC/SoC 
reset-cause providers on the subsequent boot. The PMIC 
reset-cause provider is planned to be posted as a separate series 
once NVMEM provider support is accepted.

[1] 
https://lore.kernel.org/all/20260804-pscrr-reboot-reason-v3-0-e706dbfc7465@oss.qualcomm.com/

Thanks,
Faruque Ansari

> 
> [ ... ]

