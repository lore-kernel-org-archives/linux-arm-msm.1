Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2215E49553B
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 13:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784813384; cv=none; b=LzR1w9ct+coBHWB76+vayEZbHUrlMo7KcdjIVuqnKuYYteILKMz7uM0sTJ0/Fil+vvibbrx4zKi4ugVnJqHlK1eC9BaTYbKO+vh1n/M765rvd/gGkOB+EbkepaXhxN/Vvv990jEUB+tmyWXrszOkVbRigLD0K2zv8ZASN63GzkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784813384; c=relaxed/simple;
	bh=JJc/s3E34c9Q+dE1g7XqPAHj4hEsGFmN67owW7aJxT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gYTAU7xhr9cg8aZyPQYOpFHqcR88WP0EtD9JaWu6kE6nsi7gzHvXLjgYg/nasfgtpP6AyRex9WxbEyYSV+Y/0uyOA4kLAy27bbl7WTTloTep27Ql/TslsOX/jdLXlguyd899A/RxPi3BangFij6pS0kpsF59WUjBqJ5ul2vK1bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TLORcWXg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KNHHoM+X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TLORcWXg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KNHHoM+X"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvVnD1030654
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 13:29:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Go5kvd+RGN7WvDgQGkVUFMxaD+SYGgtgtDjG4EetZhY=; b=TLORcWXgUP60TL3f
	WjlUQW50sdYRsNy+UD4mB/aBEoRL6ll2R8hW6kNmSyZwNdFrL/s0xKJtZrog6+Es
	7rSSt4hsm9FlC3/cPD0WsEzX7ptjqvrtaVunjpvKrm8XMQGp2eL8L3gS+S+OgfNr
	dqbs/gAW1ik9Yf7gheRoDL2tDYUARDQTAyp1gB/e5Ss/axWmfnQgazFypRNTVVEe
	CzUz87hti4hALxG5ejPyzrg8+4ar2BbRTC9gm2ohV9NtUWEjQn9tCNXnSOME5S4Y
	2zQ4ZaVFPchHKQrvVhkHclBkG9LhUFsM4FUXWzk+ho93aXtfigX90JveBZN47h8P
	/2CVRA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28xv9tg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 13:29:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cccfa32670so9470195ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 06:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784813382; x=1785418182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Go5kvd+RGN7WvDgQGkVUFMxaD+SYGgtgtDjG4EetZhY=;
        b=KNHHoM+X4ZIWz7Lj+UiwEoVq+G9yfJxqJlha20ueLCLM5rbHrPYPD5gANXp6QpRRU9
         IWgsryiLTRd0JKgWXzN7gYNc+acKoIq//ZlrDQOLjN3M0Om4Fvr5k7fkPUGantSoF+Xs
         SNvZhJ88Q3bOUaT6M6XdotUpp39tTsjKoS+cZeL7WiMz5VfnK0vofn7J4Dyp+gyYhdi4
         nrKsc+gSC/al2uCDqibjBi9s/5FgKMo9n1jc1N8C/sF+tvdh7CfFX9KGkzQIUwMs/5jD
         zHV35XFzJA9ABPU4hI6tH+pYqzegg9lyxraMHGdbN/MTet2MfO8vFePgz/x3bYCsc+Bo
         D6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784813382; x=1785418182;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Go5kvd+RGN7WvDgQGkVUFMxaD+SYGgtgtDjG4EetZhY=;
        b=DSUguUlsw9+X1/7HjZPLrWkvoqYCXc22OPbzi/+aXuFBF26bYUgYWj1MWd5AB5327k
         LgcUJOc2EE/On6dBL7X0iBK4xb5M8TyeWBMD4shiJMl2ZpfTUwB57Cf5v3EFF0ig/gts
         R6fk68a9VYgRrLTqDjq1gT5bpyhKFVdv95w9zSohqzVe9hGKX/RzC0mJxq3EzF42vuuO
         lRM/HQGdOAV6JrLi7OKOEbxKtInSq5wp07FzTsvbgAeJy9GNfkKBooChyzEi8V+kTgXv
         cnhVFgw55looIy7tNrEPDYiTzBX/8ULVevL/f3h76wAxn+9ljv2fWU2uLYa2fcaaGeao
         0SrQ==
X-Forwarded-Encrypted: i=1; AHgh+RoOQ+DhSq0Qrk/Vv5Vwt5oQlctZyKndT/lJWDJ2825ozKGoasJrmGNeMdm+ZVxudUB92LPawODlHNQulxBw@vger.kernel.org
X-Gm-Message-State: AOJu0YzApln+Jj1RimCVoV65bA7Hbwk8n+LEaGH01K4kc4KUxYixTWWP
	WIc2OWDotvnX/nt2smiorj75XFcvGNZrfKYt2+Nk9To9nudty2SBCjoLpQvzaNyvIg7oF16C7k9
	rqls8s9vo574Np6VGF1BZzq11w7HLguH3dtkDENiLrrT936KcTBuIuXMw67vR8A/sfsRV
X-Gm-Gg: AR+sD13zTPPay7PEJMuwYxdwHEcHKj8Mn/s5oCO/NhQ6FObMqesNJE9rmvKGx3em3yn
	JYbbUK7PY5Pbsio/bhOW/Ryj0X5xKvzJwgfaKF2Jvc7O56W49J/INiDO0TfJW2hBjRtgXDGM6jS
	dJ/6uDD0CEniZGekarWuQlEIjr1VixcBdHhdI9SUrrWqDhxM9b0Q/qyYk1nZxBpy4r4Xb+Z+JsB
	woSgejhCFg3hoBS5f+BBh+mwSpxUjJvYR8YjpIQe4k0SL5JqPHGpBn7dxyeI8iVfv7PhRnjPJce
	SnGDWHRiZANnLDiTUrd8JWkWG4lPnGKwQbU8DExPRPRp5wqxQIqI5+/G0x/pKmIToCoQauNFab3
	GuNoaBkOF5+MOAnybj7SaLI8lKDD6HMHLTNk=
X-Received: by 2002:a17:903:ac6:b0:2cf:9f62:1dcd with SMTP id d9443c01a7336-2cfa6d83500mr42657975ad.32.1784813381387;
        Thu, 23 Jul 2026 06:29:41 -0700 (PDT)
X-Received: by 2002:a17:903:ac6:b0:2cf:9f62:1dcd with SMTP id d9443c01a7336-2cfa6d83500mr42657275ad.32.1784813380882;
        Thu, 23 Jul 2026 06:29:40 -0700 (PDT)
Received: from [10.219.57.229] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efa39ffsm34340295ad.14.2026.07.23.06.29.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 06:29:40 -0700 (PDT)
Message-ID: <9457aa92-2f58-4c0c-bd33-916da493846d@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 18:59:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 04/13] firmware: psci: Introduce command-based resets
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-4-e7453c548c21@oss.qualcomm.com>
 <282fd166-2074-48cd-84ce-c887711e51c5@quicinc.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <282fd166-2074-48cd-84ce-c887711e51c5@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XG3xuXk522RxzvB0xy5ibhAX-GAapUUa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEzMiBTYWx0ZWRfX+qxDV8cWWktO
 9IY+xkOoznyBfMwy9wt/dzGH5OpL5g93Ke5dILF4P3N+X0Q8zMCshpp9oL5vVEcByt9jAcCvkQ1
 TcDnxJwenRHNrJobRGT+vsnk8qlYeo0=
X-Proofpoint-GUID: XG3xuXk522RxzvB0xy5ibhAX-GAapUUa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEzMiBTYWx0ZWRfX7qv/bkFr1aky
 ywg/vcfB5qXDSEPdpFQcWk9hdLyKi6J287TLNHtL16eELfPY/lX6yaCfOSkF8xBce5wBscKCM4s
 diplX+xZYShza421ZTlTZlKtfy0siJYIJVADRlPn/lqpeqO81SKu1bJQEBYJUQv6PZ7dXWt6SGp
 GMfWkRvjobhEtZP6/MfykpHP+rq2I6eq16PW0eJGPqgzGbekUtTsGou1rw6hXcf+T+vOQ1zAfzs
 70r85xDXIwfVwF7UHo+3p0FxiXZ7SV20CWI51f60DLFHQk9hCtupUhhfigEUUOBUSfMmYpSVfO/
 9aGNoWdRzKrwuJTKFA2BgCyWPT9efsdYqUQFpxd/CVPxHFioeKyqemU5MYcmoAyL77fHaAznncZ
 f6HIyqVFTcQvzX7K83nchopm62AEb0QWmD1kR6dPKAp29zCE67zq28o3nhoJDHfWHKzkk0fVjsn
 Kr5X+cpyMK6dqr6V/cg==
X-Authority-Analysis: v=2.4 cv=WNxPmHsR c=1 sm=1 tr=0 ts=6a621746 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=QCscv-Hw-U4uApuusycA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230132



On 22-07-2026 14:54, Pavan Kondeti wrote:
> On Tue, Jul 14, 2026 at 10:46:32PM +0530, Shivendra Pratap wrote:
>> PSCI currently supports only two resets - SYSTEM_RESET and SYSTEM_RESET2
>> ARCH WARM reset. The reset patch is selected based on the Linux
>> reboot_mode variable. The PSCI specification now includes SYSTEM_RESET2
>> for vendor-specific resets but there's no mechanism to issue these
>> through psci_sys_reset().
>>
>> Add a command-based reset mechanism that allows external drivers to set
>> the PSCI reset command by passing a reset_type and a cookie.
>>
>> Add support for the following reset commands:
>>    - SYSTEM_RESET2 vendor-specific resets.
>>    - SYSTEM_RESET2 ARCH WARM reset and SYSTEM_RESET (reset_type = 0 and
>>      cookie maps to psci_standard_resets).
>> Unsupported commands fall back to the regular PSCI reset path.
>>
>> Default to the existing reboot_mode-based reset flow unless a reset
>> command is configured. If a kernel panic occurs after a reset command is
>> set but before the final PSCI reset is issued, ignore the reset command
>> and follow the normal reboot_mode-based reset path.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   drivers/firmware/psci/psci.c | 106 ++++++++++++++++++++++++++++++++++++++++++-
>>   include/linux/psci.h         |  36 +++++++++++++++
>>   2 files changed, 140 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
>> index e73bae6cb23a..881819d09911 100644
>> --- a/drivers/firmware/psci/psci.c
>> +++ b/drivers/firmware/psci/psci.c
>> @@ -12,7 +12,9 @@
>>   #include <linux/debugfs.h>
>>   #include <linux/errno.h>
>>   #include <linux/linkage.h>
>> +#include <linux/mutex.h>
>>   #include <linux/of.h>
>> +#include <linux/panic.h>
>>   #include <linux/pm.h>
>>   #include <linux/printk.h>
>>   #include <linux/psci.h>
>> @@ -51,6 +53,14 @@ static int resident_cpu = -1;
>>   struct psci_operations psci_ops;
>>   static enum arm_smccc_conduit psci_conduit = SMCCC_CONDUIT_NONE;
>>   
>> +struct psci_system_reset_cmd {
>> +	u32 reset_type;
>> +	u64 cookie;
>> +};
>> +
>> +static struct psci_system_reset_cmd reset_cmd;
>> +static DEFINE_MUTEX(reset_cmd_mutex);
>> +
>>   bool psci_tos_resident_on(int cpu)
>>   {
>>   	return cpu == resident_cpu;
>> @@ -80,6 +90,62 @@ static u32 psci_cpu_suspend_feature;
>>   static bool psci_system_reset2_supported;
>>   static bool psci_system_off2_hibernate_supported;
>>   
>> +static u32 psci_get_sys_reset_fn(void)
>> +{
>> +	switch (reset_cmd.cookie) {
>> +	case PSCI_SYSTEM_RESET2_ARCH_WARM_RESET:
>> +		if (psci_system_reset2_supported)
>> +			return PSCI_FN_NATIVE(1_1, SYSTEM_RESET2);
>> +		return 0;
>> +	case PSCI_SYSTEM_RESET_COLD_RESET:
>> +		return PSCI_0_2_FN_SYSTEM_RESET;
>> +	default:
>> +		return 0;
>> +	}
>> +}
>> +
>> +/** psci_set_reset_cmd() - Configure PSCI reset command
>> + * @reset_type: SYSTEM_RESET2 vendor-specific reset_type as defined by
>> + *		firmware, or 0 for standard resets
>> + * @cookie: SYSTEM_RESET2 vendor-specific cookie as defined by firmware or one
>> + *		of enum psci_standard_resets when @reset_type is set to 0
>> + *
>> + * Supported commands:
>> + * - PSCI SYSTEM_RESET2 vendor-specific reset:
>> + *   - @reset_type and @cookie must follow platform-specific SYSTEM_RESET2
>> + *     vendor-specific resets.
>> + * - Standard reset selector:
>> + *   - @reset_type must be 0.
>> + *   - @cookie must be one of enum psci_standard_resets.
>> + *
>> + * This is an in-kernel helper intended for built-in reboot flow callers.
>> + * reset command can be set only one time per boot cycle.
> 
> This comment may need re-phrasing. Please check.

sure. thanks.

> 
>> + *
>> + * Return: 0 on success, -EINVAL if both inputs are zero, -EBUSY if reset
>> + * command is already set.
>> + */
>> +int psci_set_reset_cmd(u32 reset_type, u64 cookie)
>> +{
>> +	if (!reset_type && !cookie)
>> +		return -EINVAL;
>> +
>> +	scoped_guard(mutex, &reset_cmd_mutex) {
>> +		if (reset_cmd.reset_type || reset_cmd.cookie)
>> +			return -EBUSY;
>> +
>> +		reset_cmd.reset_type = reset_type;
>> +		reset_cmd.cookie = cookie;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +bool psci_has_system_reset2_support(void)
>> +{
>> +	return psci_system_reset2_supported;
>> +}
>> +EXPORT_SYMBOL_GPL(psci_has_system_reset2_support);
>> +
> 
> Do we want to add namespace based restriction on who gets to import
> EXPORTs added in this patch?

you mean like
EXPORT_SYMBOL_NS_GPL(psci_has_system_reset2_support, PSCI);?

> 
>>   static inline bool psci_has_ext_power_state(void)
>>   {
>>   	return psci_cpu_suspend_feature &
>> @@ -306,8 +372,24 @@ static int get_set_conduit_method(const struct device_node *np)
>>   	return 0;
>>   }
>>   
>> -static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
>> -			  void *data)
>> +static void psci_handle_reset_cmd(void)
>> +{
>> +	u32 psci_sys_reset_fn;
>> +
>> +	if ((reset_cmd.reset_type & PSCI_1_1_RESET_TYPE_VENDOR_START) &&
> 
> What is `_START` significance in PSCI_1_1_RESET_TYPE_VENDOR_START macro?

Its the 31st bit that decides if its valid vendor reset.

> 
>> +	    psci_system_reset2_supported) {
>> +		/* PSCI SYSTEM_RESET2 Vendor-specific reset */
>> +		invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2),
>> +			       reset_cmd.reset_type, reset_cmd.cookie, 0);
>> +	} else {
>> +		/* Retrieve the psci reset function from reset_cmd */
>> +		psci_sys_reset_fn = psci_get_sys_reset_fn();
>> +		if (!reset_cmd.reset_type && psci_sys_reset_fn)
>> +			invoke_psci_fn(psci_sys_reset_fn, 0, 0, 0);
>> +	}
>> +}
>> +
>> +static void psci_handle_reboot_mode(void)
>>   {
>>   	if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
>>   	    psci_system_reset2_supported) {
>> @@ -320,6 +402,26 @@ static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
>>   	} else {
>>   		invoke_psci_fn(PSCI_0_2_FN_SYSTEM_RESET, 0, 0, 0);
>>   	}
>> +}
>> +
>> +static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
>> +			  void *data)
>> +{
>> +	/* The function psci_handle_reboot_mode follows reboot_mode based
>> +	 * reset flow and psci_handle_reset_cmd uses reset_cmd based reset flow.
>> +	 *
>> +	 * The reset_cmd is configured at the reboot_notifier phase. If a kernel
>> +	 * panic occurs between the reboot_notifier and this final reset, skip the
>> +	 * command-based reset and let reboot_mode drive the reset flow.
>> +	 *
>> +	 * The function psci_handle_reset_cmd invokes non-returning PSCI SYSTEM_RESET
>> +	 * calls to reset the device. If it returns, either the reset failed, or the
>> +	 * command was unsupported. Fallback to reboot_mode based reset flow.
>> +	 */
>> +	if ((reset_cmd.reset_type || reset_cmd.cookie) && !panic_in_progress())
>> +		psci_handle_reset_cmd();
>> +
>> +	psci_handle_reboot_mode();
>>   
>>   	return NOTIFY_DONE;
>>   }
>> diff --git a/include/linux/psci.h b/include/linux/psci.h
>> index 4ca0060a3fc4..39fe0edec651 100644
>> --- a/include/linux/psci.h
>> +++ b/include/linux/psci.h
>> @@ -8,6 +8,7 @@
>>   #define __LINUX_PSCI_H
>>   
>>   #include <linux/arm-smccc.h>
>> +#include <linux/errno.h>
>>   #include <linux/init.h>
>>   #include <linux/types.h>
>>   
>> @@ -21,6 +22,16 @@ bool psci_power_state_is_valid(u32 state);
>>   int psci_set_osi_mode(bool enable);
>>   bool psci_has_osi_support(void);
>>   
>> +/**
>> + * enum psci_standard_resets - Standard reset selectors for PSCI reset
>> + * @PSCI_SYSTEM_RESET_COLD_RESET: Standard SYSTEM_RESET command.
>> + * @PSCI_SYSTEM_RESET2_ARCH_WARM_RESET: SYSTEM_RESET2 architectural warm reset.
>> + */
>> +enum psci_standard_resets {
>> +	PSCI_SYSTEM_RESET_COLD_RESET = 1,
>> +	PSCI_SYSTEM_RESET2_ARCH_WARM_RESET,
>> +};
>> +
>>   struct psci_operations {
>>   	u32 (*get_version)(void);
>>   	int (*cpu_suspend)(u32 state, unsigned long entry_point);
>> @@ -45,8 +56,33 @@ struct psci_0_1_function_ids get_psci_0_1_function_ids(void);
>>   
>>   #if defined(CONFIG_ARM_PSCI_FW)
>>   int __init psci_dt_init(void);
>> +/**
>> + * psci_set_reset_cmd() - Configure PSCI reset command
>> + * @reset_type: SYSTEM_RESET2 vendor-specific reset_type as defined by
>> + *		firmware, or 0 for standard resets
>> + * @cookie: SYSTEM_RESET2 vendor-specific cookie as defined by firmware or one
>> + *		of enum psci_standard_resets when @reset_type is set to 0
>> + *
>> + * Supported commands:
>> + * - PSCI SYSTEM_RESET2 vendor-specific reset:
>> + *   - @reset_type and @cookie must follow platform-specific SYSTEM_RESET2
>> + *     vendor-reset encoding.
>> + * - Standard reset selector:
>> + *   - @reset_type must be 0.
>> + *   - @cookie must be one of enum psci_standard_resets.
>> + *
>> + * This is an in-kernel helper intended for built-in reboot flow callers.
>> + * reset command can be set only one time per boot cycle.
>> + *
>> + * Return: 0 on success, -EINVAL if both inputs are zero, -EBUSY if reset
>> + * command is already set.
>> + */
>> +int psci_set_reset_cmd(u32 reset_type, u64 cookie);
> 
> The very same comment is present in the implementation of this function.
> Please fix it.

sure.

thanks,
Shivendra
