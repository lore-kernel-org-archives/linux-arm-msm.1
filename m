Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9908652ED42
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 13:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874080; cv=none; b=Z16lKDGVvfaI1wYkCq2NilbVBA4uxjETCWtINBtBS7dWNCm92yP5HgD8+ip3hSk/ThTR5ZABjw9sqcvw2ByP0rvz/7TzT8FJaaWOGZGWxVnZ0A3RgyGHjsWFP0KuHyGH3Ia7IhYTWkyY8V4/HcdMMNpiVYKuigGcILQKvQQbmJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874080; c=relaxed/simple;
	bh=6PJK0pz+BL/5McTQS33m8+vXFQ4Vu2G0kEXngy27QKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lFyFufDNLkMVQP0u8lPH69VHZEPJWmOLKWTCXpc4PdQs092P+tE5vgyZSpf5uzcQvnOHGTYBjvyoseuXmUPAvxNTNjVOcGUZYKPSzhNpw0ZRlvzEqP92JMqnUE7MZi/7jp2T+GhzbBKNTDRMQWbnzaQdvkWjnIoVlYUJc1pZBXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=uKC6GuT0; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="uKC6GuT0"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-9399ac1acdeso226084885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 06:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788874065; x=1789478865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fOM8fjA8q735tt73QwsrSjUT4b2Ez8CVrzSTIP5W5BI=;
        b=uKC6GuT0F5uOeCu6S9wDn8NTmkUMfOXaYX5pe0XqnTqT1pB1aq1/qN6XKJ5o2gmfT8
         v1VN52YjSVa+grV++v9DClloDmjFP0d8l67l6te4qY3n6SR8QXevVtz/E+MK/K4sOHWi
         Hvv14Yq8a24C92hn1+sVkA6uHo0Uc/ywe9JdBmIdPghi98Nxm3lZDTTUcxLKGFH4Se9S
         097ScNVQkvzslgQkPMCHV3grE8GevAsl3Y1VzZredadZo2WFyo0qdFZA2etKDiLS6/OT
         Hh/Aq8TN7CstMc/mC/QxPyChx1urQQ+9rCZj+q1M35urOhHDhmUu+EV5XPVZHLsvRUL3
         KMzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788874065; x=1789478865;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fOM8fjA8q735tt73QwsrSjUT4b2Ez8CVrzSTIP5W5BI=;
        b=jBZIZLv0Fe18qlVoNYLhthxWp8dIQNBczb7bM9MPcpIyXWnLQggsuSVg4ICCDdinp9
         nYIygjR8/+xzQrIyxOM+R866PBG0KXRrPtP68jG694vzXBOxW0GJdajf2psddyRED6Lp
         NBNsdAZZZ80Wz6aLwzeN2WU2l4lmUTUCfrD6JhikIH0SG4rE3I7FhzVqjA9tEXtDibGg
         g9vXcae/FSAjyL++uBwBUXOq+2cZITUQe9BJr42otwE0tXCO5EZalcTv94NwHBr9t017
         OlH8N76MSliifKvDNqt5kkhDmmhdOnyIpGqO1PdRB7l5qIAvejm5f/061vF4RKMcqp8l
         LrXA==
X-Forwarded-Encrypted: i=1; AKwUvByBSLWE05z+jXI42BxYeLJlOATjqJN9MQamBWxjYe2wZnGhs39+0smkEWXpDgP1dfi2NZoPDQNvUPIdEFqs@vger.kernel.org
X-Gm-Message-State: AFuF++k/AJWHRMjAaZv8SFw3UG1CnjizQaYd34hXFEC2Oa1OSR6dqQkG
	Lpu9NdNX+KrvHDz0c7LtjwLg7iQti/t5h9k2WY0SJdGlJs6nhfRxJ1oAvYqxcv5b5t4=
X-Gm-Gg: AYBFou30zjh0m/DYc2SlSbB2hnbqqh9kUE5nlpa13HbewiBdzLKR53duaRTu5svRolQ
	b/bAHJ93KaQeN9+sBMeuVpdstIqQIdc1Cen09ajH/wM+uSZrynPv+nWiA4r49A5VMrSTTBDUcia
	ecXQLx3FylRHO6XGJv4tVPLNurI9n43o21TGNivA8HURL330AD8emcL7Jo+tupfBl2KI/6BclOw
	qv7ospcXo7vog3iK378/aiR/UDfFshlzLtBu7snq86YLUm41ouLtt3U4qd/AGovi1zX6enH95oW
	RnrZ9+6FaSdlotnuIgF+cwLhWLvIUN2iMzssbZGcM2B2OYLM7xVbNtKWVUIvweCvL7rAcrH9VOT
	RmDc+zfxbW7AB8ccODu0/scmI0b9fcU2C+w7ku2V/EBtJT/S4gyQglyKXvS88btpvm8ISEVi3wM
	MA9KzJgMc4l5va/HrIh9G34qIHr8Z0ZuJrENPvKxeITZ66Qve9C32gPk5n/O0BXQ==
X-Received: by 2002:a05:620a:4101:b0:939:9f51:29a0 with SMTP id af79cd13be357-9399f513198mr1866256085a.50.1788874065152;
        Tue, 08 Sep 2026 06:27:45 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939b8fbc1dbsm249492285a.11.2026.09.08.06.27.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:27:44 -0700 (PDT)
Message-ID: <a6e8a2f2-7477-46fe-920b-5216d0f76dfa@riscstar.com>
Date: Tue, 8 Sep 2026 08:27:43 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] PCI/pwrctrl: tc9563: Add GPIO auxiliary device
 support
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Michael Walle <mwalle@kernel.org>
Cc: Daniel Thompson <daniel@riscstar.com>,
 Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
References: <20260904-pci-tc9563-aux-v3-0-5b1449d62ba2@oss.qualcomm.com>
 <20260904-pci-tc9563-aux-v3-3-5b1449d62ba2@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260904-pci-tc9563-aux-v3-3-5b1449d62ba2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/4/26 12:15 PM, Lorenzo Bianconi wrote:
> The TC9563 embeds a GPIO controller used for per-port reset signals.
> Create an auxiliary device for it so the gpio-tc9563 driver can
> register the GPIO chip and enable DT-based GPIO lookups. Pass the
> tc9563 regmap to the auxiliary device as its platform data.
> 
> The pwrctrl driver does not wait for the GPIO chip to be probed. The
> per-port reset GPIO lookup, returning -EPROBE_DEFER until the chip is
> registered, is added in the next patch.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

Looks good to me.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/pci/pwrctrl/Kconfig              |  1 +
>   drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c | 69 ++++++++++++++++++++++++++++++++
>   2 files changed, 70 insertions(+)
> 
> diff --git a/drivers/pci/pwrctrl/Kconfig b/drivers/pci/pwrctrl/Kconfig
> index 1952ab4f29b6..38aab596aa04 100644
> --- a/drivers/pci/pwrctrl/Kconfig
> +++ b/drivers/pci/pwrctrl/Kconfig
> @@ -29,6 +29,7 @@ config PCI_PWRCTRL_TC9563
>   	select PCI_PWRCTRL
>   	default m if ARCH_QCOM
>   	depends on I2C
> +	depends on GPIO_TC9563
>   	select REGMAP_I2C
>   	help
>   	  Say Y here to enable the PCI Power Control driver of TC9563 PCIe
> diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> index 59ad219c26c0..2230765950b8 100644
> --- a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> +++ b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> @@ -4,6 +4,7 @@
>    */
>   
>   #include <linux/array_size.h>
> +#include <linux/auxiliary_bus.h>
>   #include <linux/bitfield.h>
>   #include <linux/bits.h>
>   #include <linux/delay.h>
> @@ -18,6 +19,7 @@
>   #include <linux/platform_device.h>
>   #include <linux/regmap.h>
>   #include <linux/regulator/consumer.h>
> +#include <linux/soc/qcom/tc9563.h>
>   #include <linux/string.h>
>   #include <linux/types.h>
>   
> @@ -393,6 +395,69 @@ static int tc9563_pwrctrl_parse_device_dt(struct device_node *node,
>   	return 0;
>   }
>   
> +static void tc9563_pwrctrl_adev_release(struct device *dev)
> +{
> +	struct auxiliary_device *adev = to_auxiliary_dev(dev);
> +
> +	of_node_put(adev->dev.of_node);
> +	kfree(adev);
> +}
> +
> +static void tc9563_pwrctrl_adev_remove(void *data)
> +{
> +	struct auxiliary_device *adev = data;
> +
> +	auxiliary_device_delete(adev);
> +	auxiliary_device_uninit(adev);
> +}
> +
> +static int tc9563_pwrctrl_adev_add(struct device *dev, const char *name,
> +				   u32 id, struct device_node *of_node,
> +				   void *priv_data)
> +{
> +	struct auxiliary_device *adev;
> +	int ret;
> +
> +	adev = kzalloc_obj(*adev);
> +	if (!adev)
> +		return -ENOMEM;
> +
> +	adev->id = id;
> +	adev->name = name;
> +	adev->dev.parent = dev;
> +	adev->dev.platform_data = priv_data;
> +	adev->dev.release = tc9563_pwrctrl_adev_release;
> +	adev->dev.of_node = of_node_get(of_node);
> +	dev_set_of_node_reused(&adev->dev);
> +
> +	ret = auxiliary_device_init(adev);
> +	if (ret) {
> +		of_node_put(adev->dev.of_node);
> +		kfree(adev);
> +		return ret;
> +	}
> +
> +	ret = auxiliary_device_add(adev);
> +	if (ret) {
> +		auxiliary_device_uninit(adev);
> +		return ret;
> +	}
> +
> +	return devm_add_action_or_reset(dev, tc9563_pwrctrl_adev_remove, adev);
> +}
> +
> +static int tc9563_pwrctrl_add_gpio_adev(struct tc9563_pwrctrl *tc9563)
> +{
> +	struct device *dev = tc9563->pwrctrl.dev;
> +
> +	if (!of_property_read_bool(dev->of_node, "gpio-controller") ||
> +	    !of_property_present(dev->of_node, "#gpio-cells"))
> +		return 0;
> +
> +	return tc9563_pwrctrl_adev_add(dev, TC9563_GPIO_DEV_NAME, 0,
> +				       dev->of_node, tc9563->regmap);
> +}
> +
>   static int tc9563_pwrctrl_power_off(struct pci_pwrctrl *pwrctrl)
>   {
>   	struct tc9563_pwrctrl *tc9563 = container_of(pwrctrl,
> @@ -596,6 +661,10 @@ static int tc9563_pwrctrl_probe(struct platform_device *pdev)
>   	tc9563->pwrctrl.power_on = tc9563_pwrctrl_power_on;
>   	tc9563->pwrctrl.power_off = tc9563_pwrctrl_power_off;
>   
> +	ret = tc9563_pwrctrl_add_gpio_adev(tc9563);
> +	if (ret)
> +		goto remove_i2c;
> +
>   	ret = devm_pci_pwrctrl_device_set_ready(dev, &tc9563->pwrctrl);
>   	if (ret)
>   		goto power_off;
> 

