Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA12855C1A7
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 13:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874082; cv=none; b=A8s7L4iPRIM2IBpJim8oxS+qgf6VF/8VPM1n6EqzCXmN9Rn0RO9RIQv26HYEcl/iHhYV7+bs0dCqCPMB5w/eMI62b6fP6GdIIT+bCKxZGnjOeWKI0UQEWR6B2x6AYorTzFhCM9TBdn0y0k9Ua/aPE9lFpJ/3lzOb8uLrUqkbG3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874082; c=relaxed/simple;
	bh=1vPH25wGKRaHElEwmno4lsAnu5wFn5CpxF/7QBCj6po=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XwNpyB4F3eP+jQ3ahdIW9FPuXFmbYukoNzYeZO9Xypc4QxYE4N26QHXmO/1Ur36XIhuOnGEATHFXhuhCShsuIFY+Q8doYIaGEjaTUbSMiQthOeH0kZgxMsRdf1fGCYVI0RfsFyLqcVtZePJdzFdWnEnyYHx+XiZbmt3zRKDfJzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=xa5pIYoT; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="xa5pIYoT"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-92ed19f4d60so421832885a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 06:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788874068; x=1789478868; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6qYBhvMfqWnvlGnnbePoY5lEKE9qhqj3w8sosJVbnkU=;
        b=xa5pIYoTnxqDyiKe53i7kEiwjVKLisKIKZNeAjBdZjIr9UzeVOnozCdbQrS5e8SC48
         cPpnoDHtlKmbVGoDxgmgn/wTeIuM8jczqsp46Mm0gY/uo9sZs72tjaJBF+hK4VhiaLHo
         jccWZdnabCAMyvKragooCCYuoV40i/5BPfbOYqFADQeSAh2qKuEio3HZdhKTd6SO4wJp
         gmjadpNAD8vmQ584IUeJQIy78a2BKTMCRlLUJdoAGB7eHFU2pVfvtKUStVMZv+K7bYlq
         /zjEJHQnhFXERaciO3LvOFYSWVXtb+AzV5E5wnkcFhhFG6SyuV9BhC4gLg0qOXUCawD6
         sWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788874068; x=1789478868;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6qYBhvMfqWnvlGnnbePoY5lEKE9qhqj3w8sosJVbnkU=;
        b=kFUmCDxrl+WGXYVk0OVLArnW7gKy8XcrXOpZIoItrPDaGiQaNnJYsUol3sL7m8w+zY
         oxncpJP1gc5dvyz+Bn91poHjL4qOLM9i+5W7fceUba9fIrKqMo63zsP/7EIlBSGnRSqw
         mxhpJJaCIe9Mh1B/PZ1D/qGV2ObqeB9UAkEWXfNUj4i+ew/QkWF4q2PCqu361xy65q7L
         fwYvwCSQgMj3O5WBzj0vh+U0EYxsMc41xNFycWGBR1cASy28B1oXwVaAfL88O5Cyl5Sr
         /eDN1a5CXWbCo/+WGnBKpeCv0I5Ohw3xzpX+n+HmAtEFyiAsNwzAxxT/1u/bNA2RzptJ
         krjw==
X-Forwarded-Encrypted: i=1; AKwUvBzeuNORckq6z61aJA4hasYCu8gjR2sVCnlkZFaw8l9w0/bYZbEcnM7DiMkIFwVHrLzlLJ3TxnOhmL23Hwdy@vger.kernel.org
X-Gm-Message-State: AFuF++mOPvy0u//qz/ggVhGLU5sTum3xS1LmkAdqWCgeiLeuEQfyD7SG
	kxBsWM/5/Yh+U906yBCJENOsMTsV0MCrKg24KeFiLMSQH5237n789ogR0eBtgadxZjI=
X-Gm-Gg: AYBFou3J8LHK6LApsMpwX23zKrqruuAa0LkO4NmvmxU4sYSPAHtPm67U/hRkL7OffLL
	owuJa/MJ4Pt4flGZ1TbVZrmFSGU+YrjzvKBPfkibPlbNijC+wvo0+hRat6JWhwXUFbPtftVwA85
	eCPzfZ6XTe4973Pqeauu0fADvT4N19ghiT4ueFSThaoo1ojI55O3JxM7EuUroo6WySCTul5+0z1
	tJUXTKEdSm5t4geIJwiw8a3vYlUd8W8KZv2EPRtDHwY08NWXgtYWjD9SAlUW0EQOVH3WczqaPlC
	ysDwMWrtEcw1x4keK0hTlIiHdLyskXoLpkqvwitvGrOkWHk6QDYgewZ/GCYYFqkG3oyfpdbwHZF
	lyyNgfBbjMf1ecOmvuoBRxBQ9DhQKJQi9WEGVOX/2KjctiZNizpjYw4QXQzUDPywst8dCKWgY3/
	wZEeOvhzearLNk5Y0vIlCJevprEMo2Zwnp8TUFUbxFjUmtysvyuelFXuCS1FAm
X-Received: by 2002:a05:620a:2809:b0:939:b053:ce44 with SMTP id af79cd13be357-939b053d8femr850467585a.22.1788874067640;
        Tue, 08 Sep 2026 06:27:47 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939b8fbc1dbsm249492285a.11.2026.09.08.06.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:27:47 -0700 (PDT)
Message-ID: <0657a33f-4d92-4445-bd72-bc74669e06e8@riscstar.com>
Date: Tue, 8 Sep 2026 08:27:46 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] PCI/pwrctrl: tc9563: Switch per-port reset to GPIO
 descriptor API
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
 <20260904-pci-tc9563-aux-v3-4-5b1449d62ba2@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260904-pci-tc9563-aux-v3-4-5b1449d62ba2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/4/26 12:15 PM, Lorenzo Bianconi wrote:
> Remove the local TC9563_GPIO_MASK and TC9563_GPIO_DEASSERT_BITS
> definitions, which are no longer used after switching to the GPIO
> descriptor API. Move TC9563_GPIO_CONFIG and TC9563_RESET_GPIO
> definitions in tc9563.h header file.
> 
> Replace the direct regmap-based per-port reset logic in
> assert_deassert_reset() with gpiod_direction_output() calls, falling
> back to the legacy regmap approach only when no reset-gpios DT
> property is present for a given port.
> 
> Add the reset GPIO pointer to struct tc9563_pwrctrl_cfg and introduce
> tc9563_pwrctrl_parse_reset_line() to look up reset-gpios from each
> PCI downstream port child node. The lookup is done lazily at the
> beginning of power_on(), returning -EPROBE_DEFER until the GPIO chip
> is registered.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

Looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c | 85 ++++++++++++++++++++++++++------
>   include/linux/soc/qcom/tc9563.h          |  3 ++
>   2 files changed, 73 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> index 2230765950b8..d9b69c3aeb7e 100644
> --- a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> +++ b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
> @@ -25,9 +25,6 @@
>   
>   #include "../pci.h"
>   
> -#define TC9563_GPIO_CONFIG		0x801208
> -#define TC9563_RESET_GPIO		0x801210
> -
>   #define TC9563_PORT_L0S_DELAY		0x82496c
>   #define TC9563_PORT_L1_DELAY		0x824970
>   
> @@ -59,9 +56,6 @@
>   #define TC9563_POWER_CONTROL		0x82b09c
>   #define TC9563_POWER_CONTROL_OVREN	0x82b2c8
>   
> -#define TC9563_GPIO_MASK		0xfffffff3
> -#define TC9563_GPIO_DEASSERT_BITS	0xc  /* Clear to deassert GPIO */
> -

I very much like getting rid of both of those masks...

>   #define TC9563_TX_MARGIN_MIN_UA		400000
>   
>   /*
> @@ -87,6 +81,7 @@ struct tc9563_pwrctrl_cfg {
>   	u8 nfts[2]; /* GEN1 & GEN2 */
>   	bool disable_dfe;
>   	bool disable_port;
> +	struct gpio_desc *reset;
>   };
>   
>   #define TC9563_PWRCTL_MAX_SUPPLY	6
> @@ -351,16 +346,40 @@ static int tc9563_pwrctrl_set_nfts(struct tc9563_pwrctrl *tc9563,
>   static int tc9563_pwrctrl_assert_deassert_reset(struct tc9563_pwrctrl *tc9563,
>   						bool deassert)
>   {
> -	int ret, val;
> -
> -	ret = regmap_write(tc9563->regmap, TC9563_GPIO_CONFIG,
> -			   TC9563_GPIO_MASK);
> -	if (ret)
> -		return ret;
> -
> -	val = deassert ? TC9563_GPIO_DEASSERT_BITS : 0;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(tc9563->cfg); i++) {
> +		int err;
> +
> +		if (tc9563->cfg[i].reset) {
> +			err = gpiod_direction_output(tc9563->cfg[i].reset,
> +						     !deassert);
> +			if (err)
> +				return err;
> +		} else {
> +			/* Fallback: legacy DTS without reset-gpios */
> +			switch (i) {
> +			case TC9563_DSP1:
> +			case TC9563_DSP2:
> +				err = regmap_clear_bits(tc9563->regmap,
> +							TC9563_GPIO_CONFIG,
> +							BIT(i + 1));
> +				if (err)
> +					return err;
> +
> +				err = regmap_assign_bits(tc9563->regmap,
> +							 TC9563_RESET_GPIO,
> +							 BIT(i + 1), deassert);
> +				if (err)
> +					return err;
> +				break;
> +			default:
> +				break;
> +			}
> +		}
> +	}
>   
> -	return regmap_write(tc9563->regmap, TC9563_RESET_GPIO, val);
> +	return 0;
>   }
>   
>   static int tc9563_pwrctrl_parse_device_dt(struct device_node *node,
> @@ -395,6 +414,38 @@ static int tc9563_pwrctrl_parse_device_dt(struct device_node *node,
>   	return 0;
>   }
>   
> +static int tc9563_pwrctrl_parse_reset_line(struct tc9563_pwrctrl *tc9563)
> +{
> +	enum tc9563_pwrctrl_ports port = TC9563_USP;
> +	struct device *dev = tc9563->pwrctrl.dev;
> +	struct device_node *node = dev->of_node;
> +
> +	for_each_child_of_node_scoped(node, child) {
> +		struct tc9563_pwrctrl_cfg *cfg;
> +
> +		if (++port >= TC9563_MAX)
> +			break;
> +
> +		cfg = &tc9563->cfg[port];
> +		if (cfg->reset) /* Already discovered */
> +			continue;
> +
> +		cfg->reset = devm_fwnode_gpiod_get(dev, of_fwnode_handle(child),
> +						   "reset", GPIOD_ASIS,
> +						   NULL);
> +		if (IS_ERR(cfg->reset)) {
> +			int err = PTR_ERR(cfg->reset);
> +
> +			cfg->reset = NULL;
> +			if (err != -ENOENT)
> +				return dev_err_probe(dev, err,
> +						     "failed to get reset\n");
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>   static void tc9563_pwrctrl_adev_release(struct device *dev)
>   {
>   	struct auxiliary_device *adev = to_auxiliary_dev(dev);
> @@ -478,6 +529,10 @@ static int tc9563_pwrctrl_power_on(struct pci_pwrctrl *pwrctrl)
>   	struct tc9563_pwrctrl_cfg *cfg;
>   	int ret, i;
>   
> +	ret = tc9563_pwrctrl_parse_reset_line(tc9563);
> +	if (ret)
> +		return ret;
> +
>   	ret = regulator_bulk_enable(ARRAY_SIZE(tc9563->supplies),
>   				    tc9563->supplies);
>   	if (ret < 0)
> diff --git a/include/linux/soc/qcom/tc9563.h b/include/linux/soc/qcom/tc9563.h
> index 0dfd25747b9a..086f37a40d80 100644
> --- a/include/linux/soc/qcom/tc9563.h
> +++ b/include/linux/soc/qcom/tc9563.h
> @@ -13,4 +13,7 @@
>   #define TC9563_GPIO_EN0_OFFSET		0x801208
>   #define TC9563_GPIO_OUT0_OFFSET		0x801210
>   
> +#define TC9563_GPIO_CONFIG		TC9563_GPIO_EN0_OFFSET
> +#define TC9563_RESET_GPIO		TC9563_GPIO_OUT0_OFFSET
> +
>   #endif /* __QCOM_TC9563_H */
> 

