Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E220934CFDD
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 07:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784791662; cv=none; b=iCFyfOdkr3Go6zlqJqY0opdxoCR07ByVWDJ0jt2VC13HygcdZQxl2R1oF2RsBIhj5Ko7ReE7HHASRnDXuTJj6St0+fHFtEPqaexD4hIbvXopm5gVDmS5Fnhh9a01LDL+kkEcWfgLydAVcApI9cczI5oyDO5IIU7mX+h94oA7CSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784791662; c=relaxed/simple;
	bh=/2XKoCJxvcSxvaeDqNlyblkKwjI+YIrM8V+JQc8aYZo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=NEGGZ1DGihWd/okYiT18LJtbtPSmGX9Tbwl4LRNworeaB1di4ux4sbyE4gW1BDuWeX+gg+JG6GJLVP7/ewMiM1zDpLOZthkVSs3MHDfdOK3uRh2oaYS9aTtatTn3vGbAD6hMvS56e/6df8xXlvRJxcku0TBkbaQmJHFNIvc98e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CUeylnXh; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CUeylnXh"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47de0093c42so203715f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 00:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784791659; x=1785396459; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yAOQgQXlGZbkbH3CWib2fcNHTb5Qf54AdoGX1X32FDk=;
        b=CUeylnXhdBC5EUJkme+GaYw2+xsLK8Vq8cdsDCvXUe0eU3HhmAEEWQ3A20K9INXwXx
         ka8td5W89/iqjZr5+vm3t+15br7QEv1+3WkfTxJ8JjzIcl0M47uI1trc6PuX5cHGaJYC
         gOo9nd4ixOUYVgRzGazdI0sJSnJSSI68ZIf+ZqN+vKt+8GlZ4kK52XGA8Ii2PWryNYd0
         qyRRzOGvtRGixKh+jWmMafxaV0iB9ppNIt4dSNE+ushtpxGhEBsi2tReAqFuWoYZTHVT
         2nUrmreS5Uyi/DT9TphdAF/y9gBwudB5L4sr/B46xNePI9lHq7VBykPaPr17PEGkPY5Z
         De1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784791659; x=1785396459;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yAOQgQXlGZbkbH3CWib2fcNHTb5Qf54AdoGX1X32FDk=;
        b=JD1uy82DR8ye5QwtHhME9tYdlh2hWJTebuj5lesiBn6NBpnAKKY5lAjWti7Ek24lC2
         VLHzirLjOtsszettqDtB8SoMXhPrC+fl27rYvnCF6y4BCYT5MoiF2tgYbVeG/NqtA38T
         mlJ0k/J19paa+Z/oHi6oBguxB2NPAR3se3JDZ2/rXDNwQLQDz30ZJBIkAX4qWQGVzwC9
         AnuqttA411HmQsjrz/rJAPKDSV+I9H88N+0pbxhE9osxze4wOFTF3Ii2AVF4YBczVavv
         vvvjbLRz/xb6khtIhqNUU7VQluxAOWABGDG/4Nr4OXeVcdVysJBag16ohH7p4AGB7DfS
         wMMg==
X-Gm-Message-State: AOJu0YwAfr594Epx59TxVmH43YK+LPAHt48cc9il5ZzOFe8th6kNTDCO
	an66LJlgMu54R2rrpabhFvJrYwyqfD0MIMP6hOQEzuXYv+y9PubkwjPG8ogGXxRWpNM=
X-Gm-Gg: AR+sD12BtS1dUNA2wJ5sOKyRgaIFAgWYwCIj6x0Eg27Lry2//Q+CD7wLfbciMVpp3PW
	0Hx6THQyj9tuKg7a/OsEcOE4wfi1d5q20FhtVhQ2VCIvgAZAHi0anBWX+S4eHKLFPJiVIxR64Hl
	0awajiKq6K3QlGz2/BBq1xEi7Ay/R8XBrk0FomTnCjD3u+fPaOeCQGQ+3cZGrs87t3+7O5IE9d4
	P8xOoehkt7qVyBZp7z1e8IfGxPjpr64EJu6f3OgnXIzKG/5rXYtUxRWOIZBCH0NtXEN9tmpNsjN
	qcn7cdXCN7cXDBm5Dv2+cGoof1twaU9qpIUx1K1KxSGPpRnx8eH5w83TR+lJLisyNgEIPIlsgEG
	CUPd2r2KY84bLInM6KEfRJN9/fql9PTS2rlUhek0B5wZzb9maL99B9BqP9tf8g2AD9Xkp82p9de
	+rPT7NbOZkCf8v//B2qpAVJ7z23GfW8TmI9c8zS2DlH1Tozog6OlImJ7LHfA==
X-Received: by 2002:a05:6000:430c:b0:47f:923c:9b26 with SMTP id ffacd0b85a97d-47f923c9b57mr667478f8f.47.1784791658900;
        Thu, 23 Jul 2026 00:27:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:ab55:6d63:2bdd:9491? ([2a01:e0a:106d:1080:ab55:6d63:2bdd:9491])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f8fd04192sm3998409f8f.26.2026.07.23.00.27.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 00:27:38 -0700 (PDT)
Message-ID: <9856a5ba-ba03-47ef-bd10-96d19f78501e@linaro.org>
Date: Thu, 23 Jul 2026 09:27:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 2/6] phy: qcom: qmp-pcie: Add QMP PCIe Multi-PHY driver
To: Qiang Yu <qiang.yu@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260722-glymur_linkmode_0722-v6-0-bba8156b8cbb@oss.qualcomm.com>
 <20260722-glymur_linkmode_0722-v6-2-bba8156b8cbb@oss.qualcomm.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260722-glymur_linkmode_0722-v6-2-bba8156b8cbb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/23/26 04:30, Qiang Yu wrote:
> Some QMP PCIe PHY hardware blocks support multiple link topologies (e.g.
> x8 or x4+x4) selected via a TCSR register. The existing single-instance
> QMP PCIe PHY driver has no way to model this: it assumes a single cfg per
> DT node and instantiates exactly one PHY.
> 
> Add a dedicated driver for this class of PHY. Match data carries a
> per-mode cfg table; qmp_pcie_multiphy_probe() reads the current link
> mode from the TCSR register pointed to by "qcom,link-mode", looks up the
> corresponding cfg array, and instantiates one qmp_pcie per sub-PHY
> required by that link mode, registering the clock and #phy-cells = <1> phy
> providers so consumers can address individual sub-PHYs by index.
> 
> The driver inherits the phy setting and link-mode programmed by firmware,
> so only the no_csr reset is used and no phy setting tables are provided.
> 
> Add the first match data and compatible, qcom,glymur-qmp-gen5x8-pcie-phy,
> for the Glymur Gen5 PCIe PHY that can bifurcate into two x4 links or
> operate as a single x8 link.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>   drivers/phy/qualcomm/Kconfig                      |  11 +
>   drivers/phy/qualcomm/Makefile                     |   1 +
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c | 770 ++++++++++++++++++++++
>   3 files changed, 782 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
> index 60a0ead127fa..31241d1bbef2 100644
> --- a/drivers/phy/qualcomm/Kconfig
> +++ b/drivers/phy/qualcomm/Kconfig
> @@ -77,6 +77,17 @@ config PHY_QCOM_QMP_PCIE
>   	  Enable this to support the QMP PCIe PHY transceiver that is used
>   	  with PCIe controllers on Qualcomm chips.
>   
> +config PHY_QCOM_QMP_PCIE_MULTIPHY
> +	tristate "Qualcomm QMP PCIe Multiple Link-mode PHY Driver"
> +	depends on PCI || COMPILE_TEST
> +	select GENERIC_PHY
> +	default PHY_QCOM_QMP
> +	help
> +	  Enable this to support the QMP PCIe PHY transceiver that is used
> +	  with PCIe controllers on Qualcomm chips. This PHY is a single
> +	  multi-lane QMP block that can be configured either as one wide
> +	  link or as multiple narrower independent links (bifurcation).
> +
>   config PHY_QCOM_QMP_PCIE_8996
>   	tristate "Qualcomm QMP PCIe 8996 PHY Driver"
>   	depends on PCI || COMPILE_TEST
> diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
> index b71a6a0bed3f..8bf887d58ee4 100644
> --- a/drivers/phy/qualcomm/Makefile
> +++ b/drivers/phy/qualcomm/Makefile
> @@ -10,6 +10,7 @@ obj-$(CONFIG_PHY_QCOM_PCIE2)		+= phy-qcom-pcie2.o
>   
>   obj-$(CONFIG_PHY_QCOM_QMP_COMBO)	+= phy-qcom-qmp-combo.o phy-qcom-qmp-usbc.o
>   obj-$(CONFIG_PHY_QCOM_QMP_PCIE)		+= phy-qcom-qmp-pcie.o
> +obj-$(CONFIG_PHY_QCOM_QMP_PCIE_MULTIPHY)	+= phy-qcom-qmp-pcie-multiphy.o
>   obj-$(CONFIG_PHY_QCOM_QMP_PCIE_8996)	+= phy-qcom-qmp-pcie-msm8996.o
>   obj-$(CONFIG_PHY_QCOM_QMP_UFS)		+= phy-qcom-qmp-ufs.o
>   obj-$(CONFIG_PHY_QCOM_QMP_USB)		+= phy-qcom-qmp-usb.o
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
> new file mode 100644
> index 000000000000..4531570b6fb1
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
> @@ -0,0 +1,770 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +

<snip>

> +
> +static int qmp_pcie_pd_init(struct qmp_pcie *qmp)
> +{
> +	const struct qmp_phy_cfg *cfg = qmp->cfg;
> +	struct device *dev = qmp->dev;
> +	int i, ret;
> +
> +	if (!cfg->num_pds)
> +		return 0;
> +
> +	qmp->pd_devs = devm_kcalloc(dev, cfg->num_pds, sizeof(*qmp->pd_devs),
> +				    GFP_KERNEL);
> +	if (!qmp->pd_devs)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < cfg->num_pds; i++) {
> +		qmp->pd_devs[i] = dev_pm_domain_attach_by_name(dev,
> +							       cfg->pd_names[i]);
> +		if (IS_ERR(qmp->pd_devs[i])) {

Sashiko's review seems legitimate, just use IS_ERR_OR_NULL() here and return -ENODATA if NULL as in
https://elixir.bootlin.com/linux/v7.1.4/source/drivers/remoteproc/qcom_q6v5_mss.c#L1955

> +			ret = PTR_ERR(qmp->pd_devs[i]);
> +			goto err_detach;
> +		}
> +	}
> +
> +	return devm_add_action_or_reset(dev, qmp_pcie_pd_detach, qmp);
> +
> +err_detach:
> +	while (--i >= 0)
> +		dev_pm_domain_detach(qmp->pd_devs[i], false);
> +
> +	return ret;
> +}

<snip>

Otherwise it looks good for me, the design is much better even if
it still shared a lot of common helpers with the normal qmp phy
driver so I guess at some point if could be optimized to avoid
having some divergence between the drivers.

Thanks,
Neil
