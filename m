Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794836734;
	b=hv3uxpoMY99aRhbhu+NvEXgH+D+m5Zu3YVvsDCW2HTIx0j+fK7RBvdnYCgC2Ew6E+igV
	 piNHpWE2LVJNS7wBlanbIXqzEWchKxj+SpxhIz7XTV5iIJiNnA7XtDA3laKC+BpAVvAqd
	 PXUC0DkSlrV4hlzDuW64KCErVYjJxaKMqRQt7cdnf/HgZE6sLQA9TANZPfe9FHBVkaHqL
	 mtYDtPW2f6oaeBUhxGa5FuHtRbfHuFTSVFvsGgPUeNzLbmUUNZ5o5FzWFmDLD1W5UDklY
	 y13dzOMUS9rFmk1h3Rsy4IUTYRJh2NbCK99E+QI5Zn+EoBKvG0tX5MerDVu3Jjyw5bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:
	 Content-Language:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=HHhT6Qo81+qqfHiAP1aXCUEzb0E+3rfD32/ByjPjT00=;
	b=vTExiBmlQ0Rh6/VOJW0Zo6JFzRO7/HXHl/xYmBYICy8oTKnYeX51JpS71wnBXkmFsvlM
	 ijJLk/1+HEoR4q8vyheCJaGHSCqwEXxoMN0SUW5lZnBQPxz3lqpAz4HJep7QAsJ8d620h
	 ubKKL7aZA3EHpZm5bGT2Tmv3WhSv0HQhLHtnEJ3UImHUwtA5jGlVkktEasbfn6T7uH07G
	 8IaiauaTxQMzWSMQ2VQUSJzb8/kOieN3oYB1oMViq3KoBIv0cpmC6+boxjlB0mvF+sQld
	 yZVtm1wuNl4TZrkT2Fls34yqyApCMSAMGLdHEA/Mq/8s67DolQUFKujdiFVZH15ayeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s4f+gDhB;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC2A606A337
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:45:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EC2A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s4f+gDhB
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ede7cb02daso31674825ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 05:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794836733; x=1795441533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HHhT6Qo81+qqfHiAP1aXCUEzb0E+3rfD32/ByjPjT00=;
        b=s4f+gDhBscXhRooJhch5qxUAkSkZypQ1goeVJZx+HOFbJYpHs8fPkyx92QifmChYgj
         s5WBjf+4JvxkQFmcPHnpAMpEu1obLMXSYIcrcWhmGpOYeQa7ZeWd8jje0esSFl7GiBhd
         pgjKIW23MhZM76HZ0nUOrlTr/C2nfdOuFbZQuN6lGPgn7iEIH83PTPi2sYzbMiyaRg1N
         9EtdOnjVB8cuKpFHmojQxmSOgS32yaXZZDaK49mUobqsi+Awk5duYQ5VswQH2NNvty9l
         N4MfNqz8hYXYG642iytGPbEVl4czycrL6yAHfypNNR6ieZk1j/AegJUeGqzMbfGoiBv2
         DVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794836733; x=1795441533;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HHhT6Qo81+qqfHiAP1aXCUEzb0E+3rfD32/ByjPjT00=;
        b=NQrnvSBO8vZr+dege/OFlGso1BBim/xhnRYwMvpsDrtAwf42wmD94q/e26Kx9l9RCs
         cW3s3KXs4tSPdPjDV1K/K9dcwkHus3vJDE8Q8uaAbmAhy0YPNi0sgDDhUW36u/LbIzsB
         tL3Nqgw3EqDDDH2unE/RNcGsiAAFgAk0CDIxqt2umU9nSUhoJkW1JxhY4zp7KsaXijI5
         GlCxUEZEeGqJZCB+Cii3PnNriCWQUdyTbKNCgQ1YWGxwWLbOBws70XsxRDe8ZpIQW4mJ
         PgHGx6wwzBTWWGukaxzPif166F6U73li3wYcAc988shNZU9Tx43Zg99PoLHBq/O3wXNk
         W1MA==
X-Forwarded-Encrypted: i=1; AL+hErEav+xaI4W22/ilWmwH9uwkKkb/oqZ8S7BMf9ouSNbNoCij3mwtTu5WYctpj+6pdIDkGSrAWhM5Dl89W0OA@vger.kernel.org
X-Gm-Message-State: APuU4Z8IpxWKD+AW5Ld6N+z1OsZsV8oXL0yw2xMaheSZ8jJTQANoJDds
	yexd9zRTgm/EDK3ifo1zSScMJnC1MQDZeZfN9cwjzESFeMDRXGXy5Zso
X-Gm-Gg: AZFdTZcm6MCerQ47DoUGaQ1hblkmAhGyuLzzVAVgpzP6VBe+WRd6GH29s3Np3YXfrVo
	2Vqg0If3MceRBatiIGPsb+eVdsyy6Aw6t9U9X8ykw974I72k0BO0Ab4ZQJnILlNU2CrgDqsdzLT
	Git9FyomBoSsh+dFxX8kL8RE3og2xtsq8le79PZMLPd0yRTzuVfwS6XF/v2s78QiPh7h05ca5Kd
	WdsvOEgyY1lDsbXtxzlron8pHJ5ue+aFJ9SYjp/IRZdJ4OCCTiU7+j8Fa3NiohcBam+nFclx28S
	aN8xTBX0S0Dwd+AUkC/M/41zAiMhe0vlwqw0NkYT7RSTqI5q0hxTGSea/nZI2pxNjH7N+ZKyvyu
	mv1mMvojpXjLUjyU0B+uKiWLYAlD89NkCYp7yzLuWzcbAQe/HHPCZu3sAfklBEaXwZwlEIyxP4+
	hfDz7eLbAwlLuTEhyope6LvbBTHhy/9N8LRjlhsyyEQM8T0LK2AWdsQI0qXMLGDbidRkn7rsCAQ
	vBkEKifqhvs5HAwPmiAa9q+8t+kGGP4IUAXAiEt4syYmrr6Ys2l98rgESq73/blNYO/AC2jv++K
	RoBSZXynzb1XbESOgdlwV6+lVkZGkRcqvp7pCRzxQ7pQ/k3R27XCJ44JDPUro4S41tg=
X-Received: by 2002:a17:903:1c9:b0:2ed:238b:7db1 with SMTP id d9443c01a7336-2ee0dd2a2admr72241505ad.13.1794836732598;
        Mon, 16 Nov 2026 05:45:32 -0800 (PST)
Received: from [192.168.35.99] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f868203sm37637585ad.49.2026.11.16.05.45.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 05:45:32 -0800 (PST)
Message-ID: <9fbd4a2a-d28a-4dc0-a4e3-0e91e7c160f7@gmail.com>
Date: Mon, 16 Nov 2026 22:45:25 +0900
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
Reply-To: chanwoo@kernel.org
Subject: Re: [PATCH RFC v7 4/9] PM / devfreq: Add new target_freq attribute
 flag for governors
Content-Language: ko
To: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
 Pankaj Patil <pankaj.patil@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
 <20260610-rfc_v7_scmi_memlat-v7-4-f3f68c608f25@oss.qualcomm.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20260610-rfc_v7_scmi_memlat-v7-4-f3f68c608f25@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/10/2026 5:51 PM, Pragnesh Papaniya wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> The target_freq sysfs attribute exposes a governor's predicted next
> target frequency. Not every devfreq governor has a meaningful value
> to report there; some merely observe an externally-driven device.
> 
> Add a DEVFREQ_GOV_ATTR_TARGET_FREQ attribute flag that governors with
> a meaningful target frequency must opt in to. Gate the existing
> target_freq sysfs read on the flag and return -EINVAL when the active
> governor does not advertise it.
> 
> Tag all in-tree governors that already populate previous_freq via
> get_target_freq() so visible behaviour stays unchanged for in-tree
> users. Out-of-tree governors that drive frequency updates and want
> to keep target_freq readable need to set the new flag.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
> ---
>  Documentation/ABI/testing/sysfs-class-devfreq | 8 ++++++++
>  drivers/devfreq/devfreq.c                     | 6 ++++++
>  drivers/devfreq/governor_passive.c            | 1 +
>  drivers/devfreq/governor_performance.c        | 1 +
>  drivers/devfreq/governor_powersave.c          | 1 +
>  drivers/devfreq/governor_simpleondemand.c     | 1 +
>  drivers/devfreq/governor_userspace.c          | 1 +
>  drivers/devfreq/hisi_uncore_freq.c            | 1 +
>  drivers/devfreq/tegra30-devfreq.c             | 3 ++-
>  include/linux/devfreq-governor.h              | 3 +++
>  10 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-devfreq b/Documentation/ABI/testing/sysfs-class-devfreq
> index df8ba88b9f6a..5be9940a5853 100644
> --- a/Documentation/ABI/testing/sysfs-class-devfreq
> +++ b/Documentation/ABI/testing/sysfs-class-devfreq
> @@ -37,6 +37,14 @@ Description:
>  		The /sys/class/devfreq/.../target_freq shows the next governor
>  		predicted target frequency of the corresponding devfreq object.
>  
> +		Reading this attribute returns -EINVAL when the active
> +		governor does not advertise DEVFREQ_GOV_ATTR_TARGET_FREQ.
> +		All in-tree governors that drive frequency transitions tag
> +		this attribute, so existing in-tree behaviour is unchanged.
> +		Out-of-tree governors that previously relied on the
> +		unconditional read of df->previous_freq must opt in by
> +		setting DEVFREQ_GOV_ATTR_TARGET_FREQ in their attrs field.
> +
>  What:		/sys/class/devfreq/.../trans_stat
>  Date:		October 2012
>  Contact:	MyungJoo Ham <myungjoo.ham@samsung.com>
> diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
> index f08fc6966eae..2f27a239e34a 100644
> --- a/drivers/devfreq/devfreq.c
> +++ b/drivers/devfreq/devfreq.c
> @@ -1530,6 +1530,12 @@ static ssize_t target_freq_show(struct device *dev,
>  {
>  	struct devfreq *df = to_devfreq(dev);
>  
> +	guard(mutex)(&devfreq_list_lock);
> +
> +	if (!df->profile || !df->governor ||
> +	    !IS_SUPPORTED_ATTR(df->governor->attrs, TARGET_FREQ))
> +		return -EINVAL;
> +
>  	return sprintf(buf, "%lu\n", df->previous_freq);
>  }
>  static DEVICE_ATTR_RO(target_freq);
> diff --git a/drivers/devfreq/governor_passive.c b/drivers/devfreq/governor_passive.c
> index d7feecd900f1..b75e4bbee4b1 100644
> --- a/drivers/devfreq/governor_passive.c
> +++ b/drivers/devfreq/governor_passive.c
> @@ -448,6 +448,7 @@ static int devfreq_passive_event_handler(struct devfreq *devfreq,
>  
>  static struct devfreq_governor devfreq_passive = {
>  	.name = DEVFREQ_GOV_PASSIVE,
> +	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
>  	.flags = DEVFREQ_GOV_FLAG_IMMUTABLE,
>  	.get_target_freq = devfreq_passive_get_target_freq,
>  	.event_handler = devfreq_passive_event_handler,
> diff --git a/drivers/devfreq/governor_performance.c b/drivers/devfreq/governor_performance.c
> index fdb22bf512cf..b9ec587f582c 100644
> --- a/drivers/devfreq/governor_performance.c
> +++ b/drivers/devfreq/governor_performance.c
> @@ -37,6 +37,7 @@ static int devfreq_performance_handler(struct devfreq *devfreq,
>  
>  static struct devfreq_governor devfreq_performance = {
>  	.name = DEVFREQ_GOV_PERFORMANCE,
> +	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
>  	.get_target_freq = devfreq_performance_func,
>  	.event_handler = devfreq_performance_handler,
>  };
> diff --git a/drivers/devfreq/governor_powersave.c b/drivers/devfreq/governor_powersave.c
> index ee2d6ec8a512..69eab1d0a7fc 100644
> --- a/drivers/devfreq/governor_powersave.c
> +++ b/drivers/devfreq/governor_powersave.c
> @@ -37,6 +37,7 @@ static int devfreq_powersave_handler(struct devfreq *devfreq,
>  
>  static struct devfreq_governor devfreq_powersave = {
>  	.name = DEVFREQ_GOV_POWERSAVE,
> +	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
>  	.get_target_freq = devfreq_powersave_func,
>  	.event_handler = devfreq_powersave_handler,
>  };
> diff --git a/drivers/devfreq/governor_simpleondemand.c b/drivers/devfreq/governor_simpleondemand.c
> index ac9c5e9e51a4..65ff9d912ef9 100644
> --- a/drivers/devfreq/governor_simpleondemand.c
> +++ b/drivers/devfreq/governor_simpleondemand.c
> @@ -118,6 +118,7 @@ static int devfreq_simple_ondemand_handler(struct devfreq *devfreq,
>  static struct devfreq_governor devfreq_simple_ondemand = {
>  	.name = DEVFREQ_GOV_SIMPLE_ONDEMAND,
>  	.attrs = DEVFREQ_GOV_ATTR_POLLING_INTERVAL
> +		| DEVFREQ_GOV_ATTR_TARGET_FREQ
>  		| DEVFREQ_GOV_ATTR_TIMER,
>  	.get_target_freq = devfreq_simple_ondemand_func,
>  	.event_handler = devfreq_simple_ondemand_handler,
> diff --git a/drivers/devfreq/governor_userspace.c b/drivers/devfreq/governor_userspace.c
> index 3906ebedbae8..d1b765a7b8e5 100644
> --- a/drivers/devfreq/governor_userspace.c
> +++ b/drivers/devfreq/governor_userspace.c
> @@ -135,6 +135,7 @@ static int devfreq_userspace_handler(struct devfreq *devfreq,
>  
>  static struct devfreq_governor devfreq_userspace = {
>  	.name = DEVFREQ_GOV_USERSPACE,
> +	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
>  	.get_target_freq = devfreq_userspace_func,
>  	.event_handler = devfreq_userspace_handler,
>  };
> diff --git a/drivers/devfreq/hisi_uncore_freq.c b/drivers/devfreq/hisi_uncore_freq.c
> index 4d00d813c8ac..0800116e3334 100644
> --- a/drivers/devfreq/hisi_uncore_freq.c
> +++ b/drivers/devfreq/hisi_uncore_freq.c
> @@ -399,6 +399,7 @@ static struct devfreq_governor hisi_platform_governor = {
>  	 * Set interrupt_driven to skip the devfreq monitor mechanism, though
>  	 * this governor is not interrupt-driven.
>  	 */
> +	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
>  	.flags = DEVFREQ_GOV_FLAG_IRQ_DRIVEN,
>  	.get_target_freq = hisi_platform_gov_func,
>  	.event_handler = hisi_platform_gov_handler,
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index 401aac6a9f07..fcb278c4a74c 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -776,7 +776,8 @@ static int tegra_governor_event_handler(struct devfreq *devfreq,
>  
>  static struct devfreq_governor tegra_devfreq_governor = {
>  	.name = "tegra_actmon",
> -	.attrs = DEVFREQ_GOV_ATTR_POLLING_INTERVAL,
> +	.attrs = DEVFREQ_GOV_ATTR_POLLING_INTERVAL
> +		| DEVFREQ_GOV_ATTR_TARGET_FREQ,
>  	.flags = DEVFREQ_GOV_FLAG_IMMUTABLE
>  		| DEVFREQ_GOV_FLAG_IRQ_DRIVEN,
>  	.get_target_freq = tegra_governor_get_target,
> diff --git a/include/linux/devfreq-governor.h b/include/linux/devfreq-governor.h
> index dfdd0160a29f..2853f571dfdf 100644
> --- a/include/linux/devfreq-governor.h
> +++ b/include/linux/devfreq-governor.h
> @@ -43,9 +43,12 @@
>   *   : Indicate polling_interval sysfs attribute
>   * - DEVFREQ_GOV_ATTR_TIMER
>   *   : Indicate timer sysfs attribute
> + * - DEVFREQ_GOV_ATTR_TARGET_FREQ
> + *   : Indicate the target freq sysfs attribute
>   */
>  #define DEVFREQ_GOV_ATTR_POLLING_INTERVAL		BIT(0)
>  #define DEVFREQ_GOV_ATTR_TIMER				BIT(1)
> +#define DEVFREQ_GOV_ATTR_TARGET_FREQ			BIT(2)
>  
>  /**
>   * struct devfreq_governor - Devfreq policy governor
> 

Hi,

I agree this approach. But, this patches doesn't include devicetree binding for device
and driver has included OPP information. It might be not acceptable for dt maintainer on device binding side.
And are there no problem with short polling period?

-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics
