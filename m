Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792747082;
	b=pbLJV8SuY6J1HS37HlWoqLUgjeKQ1CFeJHBVwv3souMi5yDu7g1X5jq/jJBh1AMMdYkC
	 W929tNh1+JJkB90PNFBlOnqbtJaTgpr77/OO7qQSszwK6byNz161hZiw7zJT56PW0zPUW
	 lUlq6+NCPk91Kd8D4rp3szvswCznOJhw8pBnDw2Bc7unhWaqHE/os2jppbEhin94K6yTW
	 U+jPfFub2cwrqIXI06yWEKKC+JAO31PG/GfNp6DclzTmFrfB0TU6vZ/rgJl3tsOx0eH+h
	 LS8H/NQFZTmCUECHfF0ePlkdei1/rFQQKvD+ZNhzLm21DBXMLtbP6uwp2ldxldsjkqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=DkBtcEeyoOj9rnNnUDnU5HJQyBwrAv9r2nNM1OjD5c4=;
	b=hTJ2Sh+486OvI+xftyF45D65LGATc05bwcg9SXeBna/L7aJ7xSyDvdqbqjcUnPfwmMva
	 Lj6XrPPu/w2596sVGg437EQYtsKSrXm4l+AYQRn84sFnbncl9N1+JhWWlhY75Xr1GlRr1
	 RA4HRBWH8311+YDzS55AEujihaxYIkvDhGHW8WSZB6HHmwnHMBopaYgVKxyrZNR06OcX/
	 4GYN02I7ri8m7tLFfAy1q9vh/iVkS55UXghXECxklm1N4/vU2iI/+QOPHTSDhbVxWQjDl
	 GI9HbCLMJQ4JFrBx9/9yjf9c7DcfqQNquU9xeXhCSBjFPzM9wj4ljY5vsTdB3zAav9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gS3DtNMp;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E13606A332
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 09:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50E13606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gS3DtNMp
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso5901855e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 02:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792747081; x=1793351881; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DkBtcEeyoOj9rnNnUDnU5HJQyBwrAv9r2nNM1OjD5c4=;
        b=gS3DtNMpVSAhRKLz/tO31/qW1Tzg+CpzolIJbnfPCQqQhCPskhnR67AHmvHStKqN/R
         J8x0Wa+nSdPYcJ9V/6oKnZ2LB6Ccc52tI10KRfK/VZ8/CEuDy4VYK4KnnK/pJYt699C1
         Rx0GwdA8qfU/5PAy0ef+tOhp06JEsfDPt4NL4QQqJpDunFr/oYu6V5VxUZiGfaDygrQN
         PqzJSJK/IF5owlKtIVT1tWdvhO0uz6pzCk5wgQCn25M9s2v0AdnRrK3MskJmF2bccnXK
         +MJD7m3z+bUHECxczgtCxes5DQOElAt1OsoqfjXiptxebUrBZytcmUC5rzfcl/TBSQJU
         GTZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792747081; x=1793351881;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DkBtcEeyoOj9rnNnUDnU5HJQyBwrAv9r2nNM1OjD5c4=;
        b=HTGFzp+N9otn0AcFe2ntZ6LLHTYg32yuRWWM+AFwea5tLuvMzJK8VbiMVYBkootCNL
         BtYloDNM2YkbZcNRRVn2WqsRawtGXZKsWxGWFzAeP2KgVQWu4jPucadRcnpwffslzpCt
         7qZ0LvDHYYrwrUPI7HmrBayakxNr5pwaKr+ZOrgMj1P6dF5KCh8+FdIVdNbtn/D/m92v
         InHibo9vy8w6kV2uHl2aPg0K5/wAFWNHQsxDue7E9o80LxkR1esf7zH5XmdfiP+q01yE
         mjK8BjnYwp6iUlss6hJAjA3nsJTtyo1+nU8KYI2w8NSOWHta90LpPk723CNSEJ4O//pO
         arTw==
X-Forwarded-Encrypted: i=1; AKwUvBwpib64kkLHqjDZ977kK8rPlmLu0wOTi343v8xzvHDmwE7+CoH2eMDawIgHFQVlz9LX65PW6PLn5o9EJOMH@vger.kernel.org
X-Gm-Message-State: AFq9FYIKoyV+wFB3QOKA3kXxPAhm+DDaxwI6uuynsSRdbmqvuJx22bp7
	dtQ8HrHhg57E8RGwFP3HmFnjKYaGCWhay8fWVxToB4C7CNCT9ImFgiQxhFc+sm/RBLU=
X-Gm-Gg: AYBFou36AiyYA/DAJ69bHMo7NZRqAWj3E7+W86crUrjSOUZuqyY6ebdK4bcXWmRhbYt
	tOy0qZqkcxjzSvQb6iT2YfoqCU4CpnitygrNC41sc5PSCZ00e9Yg2jYogDAZ01x1hV2F7Lormgo
	R8iFBTXKdGbeXh8gj8dIsTWR3CCssA+H7r+HmmgjrGuRIz5o15q7x6zWC/c4pKv2PcjO6mRWMBz
	2G/BNOh7PwZ+1Rf/Q4dj4eOVTY8DwxfyFtISBmcAt9GyYdCROj26UwA68cml41TBFsUpVNTN4FJ
	lBLyWi6VPtSxHp30WtG69gO1cehdIlBZvMg9O0XN4GLoq1eIndiZUaS6hsJQPAL1IVkhctkMdoH
	v+VyEU7HZW2DsYJCQ5GRA3A7xNl9S7gZ4UfnricsEfK4iAAx91DO+kP88nS1kvWfonI9ysXcCkG
	Wuxfx02amH8VO9rl1hAxdSWq1vX1/csVVn9KxTD4AUP+hQAMSIOn5xfPriz30qYx13fvFRdHj97
	zh4VAWp/IVlFvBng7yb6wCI0Ijs8lfhEUdISksTllkx3Ui1X2xgmtls80cDk8Ghl0c=
X-Received: by 2002:a05:600d:84ca:10b0:4a2:150f:1610 with SMTP id 5b1f17b1804b1-4a2150f1826mr12043165e9.23.1792747080587;
        Fri, 23 Oct 2026 02:18:00 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff25:4f10:a88e:f1a2:fd42:7693])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2104627e0sm60827045e9.9.2026.10.23.02.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:18:00 -0700 (PDT)
Date: Fri, 23 Oct 2026 11:17:54 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, johannes.goede@oss.qualcomm.com,
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH v4] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
Message-ID: <atsmQqSOuqp1LKw8@linaro.org>
References: <20261023083827.7648-1-daniel.lezcano@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023083827.7648-1-daniel.lezcano@oss.qualcomm.com>

On Fri, Oct 23, 2026 at 10:38:27AM +0200, Daniel Lezcano wrote:
> The ThinkPad T14s needs thermal mitigation under sustained workloads to
> limit temperature rise before thermal shutdown. EC interrupt-driven thermal
> monitoring is not yet supported, so use the board temperature sensors
> exposed through the PMK8550 VADC to provide mitigation now.
> 
> Describe the sensors near DRAM, the fan/heatpipe, the GPU and CPU PMICs,
> the charger, the WWAN area and the USB-C ports. The DRAM-area sensor faces
> the keyboard, while the fan/heatpipe-area sensor faces the back cover.
> These are internal board measurements rather than direct measurements of
> the user-contact surfaces.
> 
> Use the heatpipe-area sensor for passive mitigation at 57.85 degrees
> Celsius, derived from observed platform behaviour with the Windows
> balanced power profile. Map the passive trip to all CPUs and the GPU,
> with 1 degree Celsius hysteresis and a 500 ms passive polling interval.
> Name the trip "backcover-ec-alert" so that the planned EC support can
> locate and adjust it.
> 
> An earlier approach using staged CPU-cluster throttling did not show a
> significant improvement and introduced a latency imbalance between CPU
> clusters. Keep a single passive trip to provide timely mitigation.
> 
> Add 73 degree Celsius critical shutdown trips for the DRAM-area and
> heatpipe-area sensors. Retain these baseline thresholds pending
> sensor-specific hardware validation. The reported Windows DRAM threshold
> of 115 degrees Celsius has not been established to apply to these VADC
> measurements and does not justify changing the shutdown thresholds.
> 
> Thermal camera measurements indicate that the readings primarily reflect
> internal temperatures rather than chassis surface temperatures. No unsafe
> external surface temperature was observed during those tests, but they do
> not establish qualified critical limits for the internal sensors.
> 
> Expose the remaining sensors as monitoring-only zones and enable ADC
> threshold monitoring on the corresponding PMK8550 VADC channels.
> 
> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> Link: https://patch.msgid.link/20261014193524.5590-1-daniel.lezcano@oss.qualcomm.com
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 112 ++++++++++++++++++
>  1 file changed, 112 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> index 75ad74bcb042..21f4569068e1 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> @@ -502,6 +502,88 @@ platform {
>  			};
>  		};
>  	};
> +
> +	thermal-zones {
> +		/* Sensor near DRAM, facing the keyboard. */
> +		dram-thermal {
> +			critical-action = "shutdown";
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
> +
> +			trips {
> +				dram-critical {
> +					temperature = <73000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		/* Sensor near the GPU PMICs. */
> +		gpu-pmic-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX4_THM_100K_PU(1)>;
> +		};
> +
> +		/* Sensor near the fan/heatpipe, facing the back cover. */
> +		heatpipe-thermal {
> +			critical-action = "shutdown";
> +			polling-delay-passive = <500>;
> +
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
> +
> +			trips {
> +				backcover_ec_alert: backcover-ec-alert {
> +					temperature = <57850>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};
> +
> +				heatpipe-critical {
> +					temperature = <73000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&backcover_ec_alert>;
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
> +							 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
> +		};
> +
> +		/* Sensor in the WWAN area. */
> +		wwan-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
> +		};
> +
> +		/* Sensor in the charger area. */
> +		charger-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
> +		};
> +
> +		/* Sensor near the CPU PMICs. */
> +		cpu-pmic-thermal {

I'm a bit confused by the node order here. It's not ordered by the
thermal sensor (SYS_THERMx) like in x1e80100-crd.dts, but it's not
ordered alphabetically either. Or is it still the old order from the
previous revision?

I think I'd personally prefer ordering by SYS_THERMx, but alphabetical
order would be our typical rule.

> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
> +		};
> +
> +		/* Sensor near the USB-C ports. */
> +		typec-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
> +		};
> +	};
>  };

Anyway, for the changes itself:

Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Thanks for fixing the names!
Stephan
