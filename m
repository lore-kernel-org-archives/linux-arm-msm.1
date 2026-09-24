Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9391292B2E
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 11:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790249636; cv=none; b=p2NkTGMJp8gSE+io3GwMhY68WDjX0lM8CeWhOCFfTsawXg9RO9Vdx7gfLFzS7ti7W23jGRINwKMg1PssWh4gTagdJJpVWf1i7ZnZiunKsMJAUoKhkpr5WQFvhKbhkgxlnAkGRqg97cNdtrqhocCj5oSVR4I6oBlwZdyLSxjVsRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790249636; c=relaxed/simple;
	bh=xz9dxi3INaU36pJpNlvgHWawp1/NGShtakUc/gOosvI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=kbsPMvUE0r1i3MQOWaI/dbM8OzSzDsmBFPUxz95eYIOJ1OrNJA7p2Mx4BeCM8q2muekY68GhCb/eBHTbgrDiClvc0e6o+RZu9fxTkKsxHqKqHrXcJj03Hsg0ejQGeGkkH2LsjgFAgiuo8EE/ySvKVgXEUcrBH8z8pWTSFxCZSWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SXymEBl5; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SXymEBl5"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49fe8bf173aso2611425e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 04:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790249629; x=1790854429; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Q9bv5GdJS4737ZoflJrDPxuZu2bDsMMhiRIqFZTTwg=;
        b=SXymEBl5mkPDEqgdQD/07QFHI0ZqPsCFqzb4iA5SKwEteGdbc2X/C2MmvL+1lAxMwk
         t2d3xfRNKBFgj9tVTj0vaeMz0rSaz0Pslg9jBlbOa1dHa6l2TG9xLST2nf4Fct/RWStT
         vu5aTEMuZORu837Nn8PwyBmjG/NVbStka4rT1oZe/NL9dvasP/oPH39rGOocvfEseruu
         CqV3DSNOl7AGNoRnZ6Dtf1ikNL3PJcTGhTEQ3F8+s2YKjAbHtWpdCMUKdfsn3lhz5bFf
         +NdTDymd1Pw38BQKAKESu6r/jnb1j6f1pe4cu2UfejymWwk08Zm7WSOPjcSl8bmptUjP
         xsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790249629; x=1790854429;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Q9bv5GdJS4737ZoflJrDPxuZu2bDsMMhiRIqFZTTwg=;
        b=P9iOEbdPfTgFdhoZtaNKijPFu9R8Dc9F7ttwIbxYIBGSP9vfY5rij5C8vZUIQxG+RR
         Lax70igUqN42voJKmjmTWscq9Y+OXTUYI+zAe/GWqQAeulJ8/EyKBeAk4/cNbicdoMfh
         M7tRw3Dtyeg9cpIwFhdnb8L7ygmG5sPN9sMfSs1VEXIUOXPdFDN+eDqeogsWpDFfUv5Y
         ttU+Q0Moe3bS+O/8khREjsngnNcVxBSmaNwKfIhgIgm+ZFioMH7nGrYrq2M3+zNKsll7
         WvHL2mGaQLE/Tx2pYecs8sCJHuDBJNXZ6XPPJhb+9Z+uje8lNz1I2iYE9EgXaP0RsR+l
         rlyg==
X-Forwarded-Encrypted: i=1; AKwUvBzk3DTHYZ7+1C9BHXUbHcTxaFUBmlasm4niSvt02X0r+rJ6PltQiuMton7f2Ad/t0256i+Q5Hdx2uJ3VkKI@vger.kernel.org
X-Gm-Message-State: AFuF++mIqATakfOW3K3A29w4X5ElDgPHg/kp3c6esjP+2Tld1sS8h3ST
	YBgqYg08Xm+f/Ld2d4q2nXkwfB4fOpipj75kX5rOGu5uAjjJ8rcZZdUz
X-Gm-Gg: AYBFou34wBcver4QdqPU+qi+Dm2DeZXlbg8+/cIZGKuZqzWjy9og1JvA2lpe27fwaxt
	B2CHIB8ALN1+ns3bNyKgdOqVzxjzjATbUO/hyctr8iVGVjjZf+WeJxQASOWchNqKEtVz+nynykl
	lc6qibfqZMJoAiEuNga/ORxLsyBBhLGHFp5dmJVODsyguK+euPRs9FuP/KySL5g7qdqh0OC/xnC
	tZkoxFmbXIMCMa3rkdlXbNhMVkvSXuhFtmbxzpLcsAVwgeRB4mXCIz1ITs+XYoK+QGV86C9QQ95
	LpA3u6S+/iU7LWawbiw9RjtDl2yomqthyuvukryLA7jIHc9unNr833BIcXDIDzUkeJY3xrHcYYd
	sFldJbMKRUAueQhmMXwQgVvATKcJfQRva9UGD7BMU50CxNeXn0wXmvwUP6dGMx0SicDDv39odp6
	HNziVka2e/51RIlRQAqJeLIrs6tNnFHapBsTF+yYzdVITPLn+hnaJKCKLvxZuCM8OkO4wbevKTE
	hcFQJ9lToXqijdLfTacJF06X69ZA+mLTAqZsg==
X-Received: by 2002:a05:600c:4594:b0:49e:6249:268b with SMTP id 5b1f17b1804b1-49fe6707f69mr40469475e9.32.1790249629279;
        Thu, 24 Sep 2026 04:33:49 -0700 (PDT)
Received: from [192.168.20.170] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488682668dcsm15098556f8f.1.2026.09.24.04.33.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 04:33:48 -0700 (PDT)
Message-ID: <f2ccd6b6-e5a2-4d36-a12c-124638c31280@gmail.com>
Date: Thu, 24 Sep 2026 13:33:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: Re: [PATCH] clk: qcom: gcc-ipq5018: mark 'gpll0_main' clock as
 critical
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
 Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
 Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: Stanislaw Pal <kuncy7@gmail.com>, Mieczyslaw Nalewaj <namiltd@yahoo.com>,
 Jie Luo <jie.luo@oss.qualcomm.com>, Georg Seema <georgseema@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260918-ipq5018-mark-gpll0_main-critical-v1-1-fbe8f27a0106@gmail.com>
 <e16cf23c-82aa-465b-81b2-6240f4a0f4d9@oss.qualcomm.com>
Content-Language: hu
In-Reply-To: <e16cf23c-82aa-465b-81b2-6240f4a0f4d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Konrad,

2026. 09. 23. 15:32 keltezéssel, Konrad Dybcio írta:
> On 9/18/26 11:27 AM, Gabor Juhos wrote:
>> On IPQ5018, the APCS core clock feeds the CPUs. It can use
>> different clocks as its parent, but during system boot it
>> utilizes GPLL0.
>>
>> Under some cicumstances, the 'gpll0_main' clock is getting
>> disabled during kernel start which results in a system hang
>> then the hardware watchdog restarts the board after a while.
>>
>> This can happen when a driver gets a clock in its probe function,
>> then releases it either directly or by devres cleanup on probe
>> failure.
>>
>> For example, since v6.18 the kernel often fails to boot on the
>> TP-Link Archer AX55 v1 board by using the in-tree dts. In the
>> failing configuration, the 'ipq-cmn-pll' driver is built into
>> the kernel and the problem is caused by the pm_runtim_put()
>> call in the ipq_cmn_pll_clk_probe() function. Due to this call,
>> runtime pm disables the 'gcc_cmn_blk_ahb_clk' clock asynchronously
>> which results in disabling 'gpll0_main' as well.
>>
>> Mark the clock as critical in order to avoid such hangs.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: e3fdbef1bab8 ("clk: qcom: Add Global Clock controller (GCC) driver for IPQ5018")
>> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
>> ---
>> Note:
>> There is a patch [1] awaiting upstream which intends to solve the
>> problem in the case of the 'ipq-cmn-pll' driver. However the same
>> hang can be reproduced with several other drivers by triggering a
>> probe failure in them.
>>
>> The actual patch aims to solve the root cause.
> 
> This is a good workaround. Ideally, we would resolve why this
> happens in the first place.
> 
> At a glance, we have the CPUs consuming
> &apcs_glb APCS_ALIAS0_CORE_CLK
> 
> which takes XO/GPLL0/A53PLL as parents.
> 
> GPLL0 is a child of GPLL0_MAIN, so this should never be gated in
> practice. devlink and probe deferrals should make sure you always
> get a valid clock handle for the cpufreq driver..

Yes, the cpufreq driver gets a valid clock handle. However the hang happens
early, when the 'apcs_alias0_core' clock is not registered yet. So CCF does not
know that the clock (hence the CPU) is a consumer of GPLL0.

The reason behind the late registration of the 'apcs_alias0_core' clock is that
probing of the 'mailbox@b111000' device is deferred probably because it requires
the '&a53pll' and the '&gcc GPLL0' clocks. This can be easily seen by enabling
debug in 'drivers/base/dd.c':

...[    0.627289] platform b111000.mailbox: bus: 'platform':
__driver_probe_device: matched device with driver qcom_apcs_ipc
[    0.627535] platform b111000.mailbox: Added to deferred list
...
[    0.967199] platform 9b000.clock-controller: bus: 'platform':
__driver_probe_device: matched device with driver ipq_cmn_pll
[    0.974373] platform 9b000.clock-controller: bus: 'platform': really_probe:
probing driver ipq_cmn_pll with device
...
### without the patch, the hang happens here ###...
[    2.272775] platform b111000.mailbox: Retrying from deferred list
[    2.280683] platform b111000.mailbox: bus: 'platform': __driver_probe_device:
matched device with driver qcom_apcs_ipc
[    2.286054] platform b111000.mailbox: bus: 'platform': really_probe: probing
driver qcom_apcs_ipc with device
[    2.301354] platform qcom,apss-ipq6018-clk.0.auto: bus: 'platform':
__driver_probe_device: matched device with driver qcom,apss-ipq6018-clk
[    2.306621] platform qcom,apss-ipq6018-clk.0.auto: bus: 'platform':
really_probe: probing driver qcom,apss-ipq6018-clk with device
[    2.323267] qcom,apss-ipq6018-clk qcom,apss-ipq6018-clk.0.auto: driver:
'qcom,apss-ipq6018-clk': driver_bound: bound to device
[    2.332307] qcom,apss-ipq6018-clk qcom,apss-ipq6018-clk.0.auto: bus:
'platform': really_probe: bound device to driver qcom,apss-ipq6018-clk
[    2.342573] qcom_apcs_ipc b111000.mailbox: driver: 'qcom_apcs_ipc':
driver_bound: bound to device
[    2.355998] qcom_apcs_ipc b111000.mailbox: bus: 'platform': really_probe:
bound device to driver qcom_apcs_ipc
Now that the 'apcs_alias0_core' clock is registered, the cpufreq driver can
switch the clock's parent from GPLL0 to A53PLL:

[    2.427166] platform cpufreq-dt: Retrying from deferred list
[    2.437131] platform cpufreq-dt: bus: 'platform': __driver_probe_device:
matched device with driver cpufreq-dt
[    2.442776] platform cpufreq-dt: bus: 'platform': really_probe: probing
driver cpufreq-dt with device
[    2.461285] cpufreq: cpufreq_policy_online: CPU0: Running at unlisted initial
frequency: 799999 kHz, changing to: 800000 kHz
[    2.479751] cpufreq-dt cpufreq-dt: driver: 'cpufreq-dt': driver_bound: bound
to device
[    2.481435] cpufreq-dt cpufreq-dt: bus: 'platform': really_probe: bound
device to driver cpufreq-dt

I have not found a better solution which prevents 'gpll0_main' from being
disabled until the 'apcs_alias0_core' clock gets registered.

On the vast majority of the boards, one or more consumers of the PLL are always
active during runtime, so in practice it always runs anyway.

Regards,
Gabor
