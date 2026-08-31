Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6464A3D3492
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788166753; cv=none; b=EqzzI6U24v1mGj0WI25ihCYrh5tq/Os6qP9Mlv2iWT4RLQMNiKY5xaQMjs+no0AFc6p+gdXeWx4YI53EQe8x4eaAMv+GdZY64mK4KFxLVyvr7FaRtJ9H+8BQlLH871RJ3aMzXtMIIcdyPdqZwlU2NgouBS/sNXOzX4i3tUqwfPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788166753; c=relaxed/simple;
	bh=wxnfIzo5XvZDjBjhV1dD8p5HMO10Fyim+Mk2lpELM7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c0OehpYqSDuZ7saPoHryMncM67SMsl/SGdDdeMNobUZo1n4irwcN96OZNUCAPm8nfDQcig+rd4pj0os+b3Q1SpCAm6C1GnR4eEuQ9iW/uL75AsWGOpn2PLzCyTKdDj97dNculzH/s7eBaWqSZpX9tBpvmvIP/QRVvIGnXdsLm1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZaEOa3Sx; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZaEOa3Sx"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f96c5b722so1960052f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 01:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788166748; x=1788771548; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GU+U/mMMPSLsI6dWkRQr+9qpZwuOc/xQ+PbvwqeFWGw=;
        b=ZaEOa3SxqPXv5zJ4Zs76voxkdOpV5QolrfF+ippy7hEB5U9tDPg8FXomHNG/hNUyPz
         FHnX6gBBlbaHOMiMvnq2U68OjLBHvX34Pumx6Wrw/4mlC0PiEQ0tC+omztGZZOdgeTch
         usQgyPpQt5GQGo2ADNHc9UwbuUmULtTWdQVmPyDtC0jOvQvoIUCOsoTo7f59UqFaEj43
         rGpAWnQwN+g6vc4J51qYPiLaqxdEgcilpeQ9Adn+hcHVVoVMIZwa3lyljtMylJ+iaKED
         WyY27yzHVa3l9Tbn+uj7+vm7rgE4WPfi8BDjJdMlN1q9zJbVVPzCceZavXlLyIE3izOR
         Gddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788166748; x=1788771548;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GU+U/mMMPSLsI6dWkRQr+9qpZwuOc/xQ+PbvwqeFWGw=;
        b=CmiS2uLhjKNDENT9uWnBRU7nsMD7EonzO3HwRFaPC7dA6gEDIi9YEvSzcqCIuAm2CC
         SQfINxDK1knHbSTsKHfJGyBrAFT8k27wSJtHvBDZtRS6PzOjX+ntjZMaj2JczDx992tp
         hRLDJfLGRc92WNZzHj3UAxUa8kKdpS1YpXYedLLRkyWIbgy8w68WHE3KpyqTaaKuV4Wm
         xZvIGDqdzwKA9uT8iBDFICevpNlnoBEOigB4zpvEaNUqIDCbHjbG/4TMcCauw8OclcUb
         4B2XM6DpHyRF4vmQl3fTHuYNwAbQ4GRBNcHUCLHbjhN/Sx3AkU7u0iRcuWUC1MX2Rw5y
         /1Bg==
X-Forwarded-Encrypted: i=1; AKwUvBwhC514O1ZtdfiSLVcnQmmvdjS1sER3n1/OdHvSL6+69lDv02jmAeyHhFuBjaL0hV7QoXTJZNEZUiHp691G@vger.kernel.org
X-Gm-Message-State: AFuF++nGPnBMMmKJ5PVBr7k2mDjcyGzNoV2LSr+1GHpuObtsQo5q5kF1
	2VGtWY2VyeDVrDn384FRI5h+Wdx73r6W2nDqo9XtENebJD98+JUFF+QeIdnvp0oV1vk=
X-Gm-Gg: AYBFou29zs0gA4fdQkCALQckru01qZLTjfnDQrsO4OdIJSS0bMYLNbOqd5ttHdrHFJN
	XagSkPiH41X4PKMNAjXNA+hVL/+gqQrEoBW6aO/vprsDw6XRbpkz6vTy2jauDzcpyo/IQwKN0lQ
	Ecw8/AKIv6fn6KVWrDBX7A4BN4BT/oZgHYr1T1N4GOsmnmhymUswBI5Q/bITesJl19q9uVkko9P
	nyhQCZj+/B9cLjqp8stWKRBpGh3bnwT+vNimEMHLDSnlsu31WcnqYlJutdPSkhm9or9s99Q/BJ1
	mn3vOcfa3NQ6uUAZS8+Ei32iarfsrkDPtIYPZZ8c23GaSFijOoOkgBjMw0DngU+IZJq090HOYKI
	AFKF9Ikhlro/ToxQ9nY7Sb/QpYYWL2nkNiLvhv67JCDIC3EdTZu9bmohoP0wYt5c2BeGX5wAlGs
	AajZxYVaOOVsAk7RIsyjLjgEMJf+cTqKnzOi+Y6C9UYVn0sGNhZJ01PI7agP+BjuZ2IQo1xvWPe
	g==
X-Received: by 2002:a05:6000:24c6:b0:47f:4919:d5b2 with SMTP id ffacd0b85a97d-482f79870bemr36436816f8f.1.1788166748527;
        Mon, 31 Aug 2026 01:59:08 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7241:7d09:c3ef:cd6:3fed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f3asm21635560f8f.3.2026.08.31.01.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:59:08 -0700 (PDT)
Date: Mon, 31 Aug 2026 10:58:56 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: hamoa-crd: Add thermal control
Message-ID: <apVCUObyxf8Akbsc@linaro.org>
References: <20260830-hamoa-sys-therm-v1-0-27108c40fba5@oss.qualcomm.com>
 <20260830-hamoa-sys-therm-v1-2-27108c40fba5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260830-hamoa-sys-therm-v1-2-27108c40fba5@oss.qualcomm.com>

On Sun, Aug 30, 2026 at 09:02:03PM +0000, Bjorn Andersson wrote:
> The "limits" hardware performs rapid thermal management of the CPU
> cores, but during prolonged CPU usage the system's overall temperature
> need to be further managed by software.
> 
> The reference design provides seven "system thermistors", connected to
> the PMK8550 VADC. Particularly interesting is the "keyboard hotspot
> thermistor", which is wired up to sys_therm1.
> 
> Use this to throttle the CPUs, in the same way that we're throttling
> previous generation laptops based on "skin-temp". The trips are chosen
> from those existing examples, but are comparable with the ACPI thermal
> policy.
> 

In general, following the ACPI thermal policy as close as possible is
better than following existing examples. Most X1E-based devices use
hybrid active/passive cooling, with the fan controlled independently by
the EC. If you start throttling even just 1-2°C before the EC reaches
its highest fan trip point, it will result in bad performance. Linux
will try to keep the temperature below the specified temperature, and
the EC will never fully ramp up the fan.

This is what I determined from the CRD ACPI tables last year:
https://github.com/stephan-gh/linux/commit/24f053436ec2eaf70968803adfa8c17905e53cae.patch

The fact that GPU is only throttled based on back-thermal is a little
odd, but this is what the ACPI tables specified back then as far as
I could tell (maybe it was fixed since then).

Your changes seem close enough to not cause the performance problem
I mentioned above, although I think it would be worth setting a good
examples for others to follow.

> While not used for cooling/throttling, also add the other thermal zones
> for temperature reporting purposes.
> 
> Enable thermal-monitor mode for all 7 channels in the ADC.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 116 ++++++++++++++++++++++++++++++
>  1 file changed, 116 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> index 429deffcf3e9..065af18357d7 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> @@ -11,6 +11,92 @@
>  / {
>  	model = "Qualcomm Technologies, Inc. X1E80100 CRD";
>  	compatible = "qcom,x1e80100-crd", "qcom,x1e80100";
> +
> +	thermal-zones {
> +		soc-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
> +		};
> +
> +		keyboard-thermal {
> +			polling-delay-passive = <250>;
> +
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
> +
> +			trips {
> +				skin_alert0: trip-point0 {
> +					temperature = <55000>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};
> +
> +				skin_alert1: trip-point1 {
> +					temperature = <58000>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};

What does this second trip point do differently than the first? It has
the same cooling devices. Will it try throttling "harder" than before?

I know sc8280xp-lenovo-thinkpad-x13s.dts has the same, but I'm not
entirely sure what it does there either.

My experience was if you specify 55°C as one passive trip point, then
Linux will try its best to keep it with the specified cooling devices.

> +
> +				skin-crit {
> +					temperature = <73000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&skin_alert0>;
> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +
> +				map1 {
> +					trip = <&skin_alert1>;
> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
> +		};
> +
> +		backcover-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
> +		};

Should we add throttling here as well to match Windows?

Thanks,
Stephan
