Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFB5283FCE
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 00:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791246661; cv=none; b=To/JKrOuDEKwvMOBJq5KAuEEea2GxyV1+bbQyMN4x5tiepZWXOkhT0afK6dz0xHechyhqr9lHVMBGeGITzsUCRqZSGJ17/sCIUBPjXL9MP7Agew7vGJOci502obk1yM76Bosodici+0sdreCXqqpGIN9Q9RUwsVhqnY4TtmLm6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791246661; c=relaxed/simple;
	bh=nlfOu/Cx3dx7WAl82DavblqM7D6pKK70uc9LSQAqkOY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=OppUGuCSqJdL9QcCLJxpVhsZW3BiGQsdmTL2ycFbb7Of3eXiErPnobTcZmxhZe8P7fLBfvKhfTUfSJRI5CGK6x5+fTgKPKCmuPcNRf6NR5y8QEiCMdlNj8eZkgwhEyZHGfD7+9zQkBglOIYJAhDInsmC7O+aV5tE37G9AkAwytY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=yjuXTVDl; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="yjuXTVDl"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5351748222cso18627371cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 17:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791246659; x=1791851459; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CN7LmvsZdWmYM0BHY8P9OeOGiwwpFgBTQfuLY2b1oDc=;
        b=yjuXTVDljkilOSkqsXDTrepJowjwalef7nPpj4wqE6jD51Pr0dD3qeh/XYnrDRPnrH
         9IjrIYSx2Od/XbWfcZ0rntFoO+qmWoceO5N8qN60NWfx3xwRu/zd/h5mmTsWrJvkadrf
         kXKgkuRmllR8oCLz3if0ul+kSkKXtbcZnCI2svf6smBaYGbG3vHoUApQqqSIlReK4Z7H
         Cvc8vDZThI9eIbQ25gcdUxvXXNprQVUtgSw9ki//opsGqeGrnftexKMl4LyzDfk+Wmsv
         7yzrRantbfUy1Am0utS8FeDfgX3a0DNAgom/oVGjtshqJ2TCLDnrc0rMwUcNg+oaRphC
         j7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791246659; x=1791851459;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CN7LmvsZdWmYM0BHY8P9OeOGiwwpFgBTQfuLY2b1oDc=;
        b=v5iDz6I543BvuPTsGHJUbmfUIVFlVcjfdDfR+24ZtMck/xGrWUMRjrZBauZxfTzhX1
         2jSHihaqoewUPTWiUPvfz4PeGHwJQiJ7//c0eSh6mgYr1ntU8t5HwXhT4fFlMHsb3H6B
         Zg1aJFFOynUba+3bJO59UWl6Lgmv1YWdX8lcekZ/41KvFmcCJM7XTO0lZAXjHAXt0QZ2
         trK+/GMG+6voX6eqIU+j6maxZkZI01bf2BxsMGhUPLNoJeQWXiOTId91RuYhb9rbF8vs
         XEK+Xt4yRsU/t1MUcmHPuF97kNayqaeTKdIRSQBZ9ruhKHh/pHxKTRBV+2Xc1hVPI4SG
         Dy0A==
X-Forwarded-Encrypted: i=1; AKwUvBztdJxA+T2ZB56ZO2esC4mDyyj/BXwtSKOh+adlm3xBzFfyjN3oXeh+mVE1n5KcukfnhfidngxXRUJX3NQx@vger.kernel.org
X-Gm-Message-State: AFuF++k1k9QfBtfvfrYBeFby5RrjIQQK90+c3rMRSUbzqzeYk2s7jfU7
	X59yGnzD3X7M+CrYK/3LCCIJmRRiXZqIJHv4GUPFnAcMTBewIah+pLCKmltzbiY1K4U=
X-Gm-Gg: AYBFou3LVcdfpu9WlGAAUro+BGhKa3rBskQURgTYyrhJe5gznxdZjr6aoPXx6htjfbp
	xHBQDPT+H1wsEppld770ahzNX+TLIfqO8owhSyriiLuH9F2FxNItLZixrQRk3OSjhScWYBVdYIQ
	lT45CUYLRYZXJfnQz/9/pWEx+mc9mv03Dv+3cpc4yMRxjKETiH9P3sUseJqIV82qN7dF+EIPt/w
	afdXfj0SMfv6/VLFXv2vMFkp9y9FLhKAq3dAYRnm6J+uBKqnFC5o02VhkeObBCnYFNTbVUoSwb5
	kRdcaXLobx2Akanih15GFu5cQN7E+5PunY2E4VgHj6UHmZUMWLVljVxKrMu0Io/Ak3psRKa8qKH
	C0w2xvLqWMh0mwRHfwQGWkKlO2TDlY22OaEsuoH7JeZ83VEfr/qSdqngkvyWk4bwlbs9pSk/7GG
	+2XxRFd4Pc5XsI2q7YL4Oes5ouDUccBQDRArnY97asfGW44/bqBbLNbD2ExOc+GyzvE6ruVMk=
X-Received: by 2002:a05:620a:800e:b0:93c:326b:43b1 with SMTP id af79cd13be357-93e5104ee28mr1517731985a.36.1791246653835;
        Mon, 05 Oct 2026 17:30:53 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca26371bsm998476985a.30.2026.10.05.17.30.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 17:30:53 -0700 (PDT)
Message-ID: <c92b8d7f-20a1-4bca-b51e-40ae52155099@riscstar.com>
Date: Mon, 5 Oct 2026 19:30:51 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: qcs6490-rb3gen2: add the clock
 controller
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org
Cc: abelvesa@kernel.org, kees@kernel.org, gustavoars@kernel.org,
 mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
 danielt@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daniel Thompson <daniel@riscstar.com>
References: <20261005230927.2000398-1-elder@riscstar.com>
 <20261005230927.2000398-4-elder@riscstar.com>
Content-Language: en-US
In-Reply-To: <20261005230927.2000398-4-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/26 6:09 PM, Alex Elder wrote:
> The clock controller within the TC9564 SoC is accessed via a PCI
> endpoint bus through BAR 4 of the first embedded PCIe function.
> A syscon node is created to provide access to a range of memory
> that is used by the clock controller and shared with other devices.
> 
> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
> v2: - Moved the clock devicetree node to be a peer (rather than a child) of
>        the syscon node

Whoops.  I dropped the "reg" property, and that means
the change mentioned above leads to a warning.

Either make them peers, but keep the clock node "reg"
property, or drop "reg" and make the clock node
subordinate to the syscon.

I will address this in version 3 of this series, but
(unless someone suggests otherwise) I'll wait to get
feedback on the rest of the series before I send that.

					-Alex

> 
>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 0e3bbdaf4661f..06246d185b50f 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -9,6 +9,7 @@
>   #define PM7250B_SID 8
>   #define PM7250B_SID1 9
>   
> +#include <dt-bindings/clock/toshiba,tc9564.h>
>   #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
>   #include <dt-bindings/iio/qcom,spmi-adc7-pm7325.h>
>   #include <dt-bindings/leds/common.h>
> @@ -961,7 +962,7 @@ dev@0,0 {
>   				#size-cells = <2>;
>   				ranges;	/* This will be updated dynamically */
>   
> -				pci-ep-bus@4 {
> +				pcie_s1b5d0f0_bar4_bus: pci-ep-bus@4 {
>   					compatible = "simple-bus";
>   					#address-cells = <1>;
>   					#size-cells = <1>;
> @@ -989,6 +990,19 @@ pci-ep-bus@4 {
>   	};
>   };
>   
> +&pcie_s1b5d0f0_bar4_bus {
> +	tc9564_config_syscon0: syscon@0 {
> +		compatible = "syscon";
> +		reg = <0x0 0x2000>;
> +	};
> +
> +	tc9564_clock0: clock {
> +		compatible = "toshiba,tc9564-clock";
> +		toshiba,config-syscon = <&tc9564_config_syscon0>;
> +		#clock-cells = <1>;
> +	};
> +};
> +
>   &pm7325_gpios {
>   	kypd_vol_up_n: kypd-vol-up-n-state {
>   		pins = "gpio6";

