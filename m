Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118EE331EBB
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 10:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786532194; cv=none; b=WjDZbwCvXcJe8bVtjj6DFWuxy5fzgW5NkG6f2g+Fz7lYOp7s7uIXZtVbIiQSf18Y0dETFPO4LSYb0AodLfiKhSVfUfLype3vH5H2+phw/Jijb2dc2T5i3kcNI7EehJl5Ni6s3DEFvKM9pceQQ0lmN8DswCCOu3AmwUhK7ihB/Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786532194; c=relaxed/simple;
	bh=7Z02+fljkLPe3KL3kcGUkTEIsxSUDuJ09GtiEyy2x/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n9vAuSM7ydRWgxKlDjAfOBGOcodP+lK5YK2p9IKtcMXY2lyMzgxnx1eX4Wj3QzgU/fMbi9Eg/n9cTSuEPa4wNJOW4JgH3IFMPsRnq2RpDc/fsTpjds7tYjhoWE/8Rtlu1hrVjgiC1RnfOg2WzY0hE+RystIIgnMW3w3laYJkif8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pR0lAuOk; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pR0lAuOk"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b0148201fbso603459e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 03:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786532190; x=1787136990; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ITtfty8oisAJyNjU306eVUiZ+XmY+gnBC8OefItjx74=;
        b=pR0lAuOk4HTc7cSYev9y1dO6aTataae+d26OecPIC2hZmqr0OWvhzhZ108cDpmT4+d
         H672a/I99MC+mMTtH7HKoZlD8nMegmEdO1CR8DxBPzUfOY8lzLCrvzWTacdEHP/aqNbq
         W7cgSvxQ2+1HKvtAFmkakRZrHdvkcFoSlB8867/flGSQeAz4ZEORDPO5G0O2nx3ImGI9
         3tP/ccDiPAtG+1jHUrDl7SO3FnLXiK0+QKt2uXmkiWjmN0Xdun8riW7U2ix7iXIrd0TT
         Ul7BIZGip2wWunrPX5uORcTTof/mQ+5InZVwSe67cTJAGh9WpHV4JQH086E//7X8FZNo
         44uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786532190; x=1787136990;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ITtfty8oisAJyNjU306eVUiZ+XmY+gnBC8OefItjx74=;
        b=U4GaC+wPnkY1K+9EtdtQE3a3O9TtYo5PIDVAfnVzNh1zJV18SwovOLF+AHrxOtW6hZ
         FZUVPRnqNy6imPITNtJqBTartSDdD4kCGUA/reu22yDhv/PY2Ds1pR0japMX3UuwD79f
         6/2mBmFnUk/aYueb88P5fQ1cNqhCE8YeyvhrO+8bIp7sexTuMJrEWK1uQIxDL3dhjVrR
         A25mpGsFRsDbSIfZy2Hj78Q1g2ocAwi8OrkknReAh2hBPvX4NEYXSbm+THUC77KTX+ve
         Syp/K+m7R+AfF0rj847HwatRHWFU5bFJjGmLctA2+QBm46GE8CmxXge2OO6ktkY8/UJO
         nlTA==
X-Gm-Message-State: AOJu0YxQmY8hYrouz3ykXRzSNuQziEUS/zvAOzNn0drbZYGhxZufsY4y
	bFIgcKBbm0hIU9nO8PM/rxTjDcWGpNOlB5rICyBuZh3VwSDnY3q6Iidv
X-Gm-Gg: AR+sD10MhTTyr+CxmLqRuC6rIhHvip9axoilUTfrOcfzQ/+Oki+Kx/aX5XHkF03JUXu
	HysFyaCoKM5J/NymWugLwK4K4dix1ozwZtDNnBlbmslsahdkYXSDn9grHskyWcyTEIAcviH5hmI
	RZLrQf/CIzXi252KJmXf2IObHb+wwufO3cPkGs1WJUHmnOrYi+QDOvhAYtGYqQsctsHF6HEdf3W
	5on1n+letNYyLWYNEJhSEe+CrPuxFJDXWXFFnJc9mIKE83KM5dBlXjpJ5eq9ZIGE4EXWEJ1ABI/
	3NZO/bF9RaTHLTC4xPiIRgpMGUWLCqRlWPoBbAs/Y3BLB/VWBJo0kht4nPL/M3syho/kDAgZPXC
	z5oWJHyHsELoXoNPh3vV0P9aI9KJilD+uvkBkDQhZ+cn8SGHGNTOe4FDH8eL18XltjT4jyTi0Cb
	lfOFc4svCTY0VnPvJZwazibo4qwamek4zUTP/qjpWpcO4LHOYj17lcRKW7ZBy/wGdgr+/FNa6Br
	uKpcfLS/VGDNKP4mVzj+8PoEgS5++GJA91Vbd81Z/TL1eevgSdu9GYYxw==
X-Received: by 2002:a05:6512:3b91:b0:5ae:9dcd:d04a with SMTP id 2adb3069b0e04-5b44e2f672cmr625996e87.29.1786532189904;
        Wed, 12 Aug 2026 03:56:29 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:44a5:16e6:5436:f44e:c789:f9e6? ([2a00:1fa0:44a5:16e6:5436:f44e:c789:f9e6])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b44d0478d1sm429376e87.72.2026.08.12.03.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 03:56:29 -0700 (PDT)
Message-ID: <6b83cdd0-0800-4a2e-af36-e780bed4d127@gmail.com>
Date: Wed, 12 Aug 2026 13:56:26 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/14] arm64: dts: qcom: ipq5332: Add Super-Speed
 UNIPHY to USB node
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Praveenkumar I <quic_ipkumar@quicinc.com>,
 Varadarajan Narayanan <quic_varada@quicinc.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-10-8f355d7ff0ef@outlook.com>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20260812-ipq5018-usb3-v2-10-8f355d7ff0ef@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/12/26 12:34 PM, George Moussalem via B4 Relay wrote:

> From: Praveenkumar I <quic_ipkumar@quicinc.com>
> 
> Add the USB3 UNIPHY node to the USB controller node.

   You're not adding any nodes... Perhaps "refer to the USB3 UNIPHY node"?

> In addition, switch to the pipe clock supplied by the USB3 UNIPHY
> instead of the UTMI clock.
> 
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5332.dtsi | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> index 664586979ec4..6253443c8d7f 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> @@ -523,10 +523,8 @@ usb: usb@8a00000 {
>  					<&gcc MASTER_SNOC_USB &gcc SLAVE_SNOC_USB>;
>  			interconnect-names = "usb-ddr", "apps-usb";
>  
> -			phys = <&usbphy0>;
> -			phy-names = "usb2-phy";
> -
> -			qcom,select-utmi-as-pipe-clk;
> +			phys = <&usbphy0>, <&usbphy1>;
> +			phy-names = "usb2-phy", "usb3-phy";
>  
>  			tx-fifo-resize;
>  			snps,is-utmi-l1-suspend;
> 

MBR, Sergey

