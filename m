Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65329400DFC
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 10:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146250; cv=none; b=sM9hSWZNGJW6fji+n/OhjH33QP9GMOw91n1It0dYm0WEYNNiWxjXxNxnlD2t5seZmnUlKiUDxbicDDduwWsnfd8A3IrS0/RjXzoGnYNeJmkWw/otu1dxC5Tx7xl6/8kxGt5ZsmvuDQM0yoQXVnbA2tniNCKqJWMl8mYk+Wq6f1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146250; c=relaxed/simple;
	bh=Eqos+6EzBeXZQ5+tnoQmAKmgx7KCoLgeANRlrALMAUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SrJfF1GII7/DgeJVX/FZtbasIyYIF2DzoN/AbnIc5ZGFBKDGE1ql5xxRRLuprI9OE0Uct/WEgDecEcYL0T8V68+Hhgb3CNYwEDr/rNT0dPGO0TuNMB0eBpL9T1vcmS+Wj6ZP7EonlxDtFjccXPcb/gEdFd0GWyaeB1Du1Cx/Egw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dpAG9BKx; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dpAG9BKx"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso29085735e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 03:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792146247; x=1792751047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:from:references:cc:to:subject:reply-to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sOTw9soIxM/8+OWR+CjCT6SmOaW7X99m/wAQp60lr9k=;
        b=dpAG9BKx0waZYpAN/E00JugXlQcSBvLsQYUt2sc8StXhjrDIHeZTdrL3ZW1my1U+5Y
         9ZLG/YzbE7wh6j1ImABg2V8lWWBObL/vn8lVy29DHdBEIzXNzu8vj5wP/iGs81fUl5+U
         yp+AYNRyyHbpNIckaNWK6uOSoSZJjVMiFRDlvmMJx+/T1NEURlhCUjo8vyTUsflMghzn
         KSc1b+ovgjJOAwgGU9WjTDL+zW/9s+G5O1JzZUogCy45sK4H+dojsMgg/5N2PaHdbF1c
         ewJg/qYiNFTdPDV2PSyoMBZF4Nc7G+WyD4KUFBjMx4Azz5vAd+uF4CLTiTDAiZrr0lKu
         7+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146247; x=1792751047;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:from:references:cc:to:subject:reply-to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sOTw9soIxM/8+OWR+CjCT6SmOaW7X99m/wAQp60lr9k=;
        b=I2xdt+Ln1BpMAbb27Ck9MFPxWxdRPoPw+7laXpVmW4ijoEcXHg3QEY5q0FKZPgXqWZ
         jP6ZJsY9ilCAucjVescEkXpKOWU7nIkP7OO6KMLgi6iNctEalE8j6Zewj7CbNJDdPSuw
         MTbuU8U6qN9ZINAvAl9/dhTjOkQxeokbxiN6Ih4YtG//oapKBhHSpSrFioJ1WH3nM1xH
         hcXE2V32R8pAvFbInF7oUgJE2+551Ctc6+oroeGCtqIYD6Js/8+7MWZmd9yz8wSTTMlB
         416MipvllY0y3qHrxW9tkDiTBlIFwfXTaJsJ97EPD3hvkHte6AoERCMp65p1KrskItDb
         Ckmw==
X-Gm-Message-State: AFq9FYLVTS6AGXIvpV2b+GQczo1AguDAJB+njykDQQR3hFGSZnBEiObu
	n07HwBfFmv4BNKQ5YlyI6E33ctCGY8Grbfm3H1tDB3CmP3rKfGNw8L7E9FfqtS6mK0s=
X-Gm-Gg: AYBFou0+fRBksdHvqrGatcFRHUhs4L5IM4BOzm6CrsBIy7R8qYRWRSexSYXD2Kar+TA
	Aor9VYkILbZevOI/aOoxij4HkqBBp65pHQkMVPKwt9RSalix0go3Mv8D+v6nRN3csoFdCeVi012
	+FBG+Lm5nWlmEuLmWWuCdlhm7vclNeGEewhaSRwpk6b1kQni4VBsicGysoCaQk7ljMiwbb90QQ8
	Yi4axvDxsNk7bG6DJIJaxEDL+TCOSysi4okJDFtRNEsSHjG5enbaMZMnETrQH0Yu+3wkGjnwTor
	X92qVtJIxXZevR7pCKGGGyNyz6qbP2+8pr/ouCBvzsS/Pnq7Sj0eoB5vq5PMMQLiKZ9mqfRPj4U
	QnMKBF0nKUnKDmPMP/usQsjc6NBpJfXgvOK+bFDxWu0gMe15CmvqyX6r14DylIp7oIsCMxWxpAY
	ViLFP4HvQ6qTl1LUIUk//D9zU9fNHvnWbtdY4yoZFFB76NyQs3Rd7AjLhT+aiADx75J8GQMUCBU
	XnYznbatGI3z91AcXSp1OJCVmbKYgHnkUeeZv9m/N8Goc+ZawKLTwc=
X-Received: by 2002:a05:600c:154c:b0:49e:74b6:740f with SMTP id 5b1f17b1804b1-4a18e4aa310mr439047655e9.17.1792146247126;
        Fri, 16 Oct 2026 03:24:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:3de7:deff:62ea:d0f8? ([2a01:e0a:106d:1080:3de7:deff:62ea:d0f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cbedb6f7sm47064765e9.2.2026.10.16.03.24.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 03:24:06 -0700 (PDT)
Message-ID: <d709693e-b9ad-4d53-a368-67fbb0cbd601@linaro.org>
Date: Fri, 16 Oct 2026 12:24:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] PCI: qcom: Advertise hotplug with no command completion
 support
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260314-hotplug-v1-1-96ac87d93867@oss.qualcomm.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20260314-hotplug-v1-1-96ac87d93867@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 3/14/26 02:56, Krishna Chaitanya Chundru wrote:
> QCOM PCIe controller advertise hotplug capability in hardware but do not
> support hotplug command completion. As a result, the PCI core registers
> the pciehp service and issues hotplug commands that never gets completions,
> leading to repeated timeout warnings and multi-second delays during boot
> and suspend/resume.
> 
> Commit a54db86ddc153 ("PCI: qcom: Do not advertise hotplug capability for
> IPs v2.7.0 and v1.9.0") avoided these timeouts by clearing the Hot-Plug
> Capability bit entirely, which also disabled all hotplug functionality.
> 
> Instead of disabling hotplug, mark these controllers as not supporting
> command completion by setting the No Command Completed Support (NCCS) bit
> in the Slot Capabilities register. This prevents the PCI hotplug driver
> from waiting for commands completion while still allowing hotplug-related
> functionality such as Data Link Layer state change events.

I'm a little late to the party, but marking the RC as Hotplus means the bridge
is marked as is_pciehp and pci_bridge_d3_possible() returns false.

This means this breaks D3Cold support completely since in __pci_host_common_d3cold_possible()
we now check all PCI devices, including bridges, and the RC is not set in D3Hot anymore.

The only way to enable D3Cold is to pass pcie_port_pm=force to allow D3 on all
Hotplug bridges. Which may be wrong on TB bridges.

Neil

> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>   drivers/pci/controller/dwc/pcie-qcom.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 67a16af69ddc75fca1b123e70715e692a91a9135..a2924610f3625f2456a491473c135840e31bafb9 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -358,7 +358,7 @@ static void qcom_pcie_clear_hpc(struct dw_pcie *pci)
>   	dw_pcie_dbi_ro_wr_en(pci);
>   
>   	val = readl(pci->dbi_base + offset + PCI_EXP_SLTCAP);
> -	val &= ~PCI_EXP_SLTCAP_HPC;
> +	val |= PCI_EXP_SLTCAP_NCCS;
>   	writel(val, pci->dbi_base + offset + PCI_EXP_SLTCAP);
>   
>   	dw_pcie_dbi_ro_wr_dis(pci);
> 
> ---
> base-commit: 0257f64bdac7fdca30fa3cae0df8b9ecbec7733a
> change-id: 20260313-hotplug-4c296595b5b8
> 
> Best regards,

