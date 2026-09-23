Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E682147F3D6
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 22:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790203497; cv=none; b=AVmhdUrYXhQfsCgkOqPCO+prXqXKJ6BB9aahXDMjARyvQc817TCXOx5EKJZvhAPYYm6trZN4Zity9c7fQ4AaTavIfeeoLiBq4ta+U00GgKGPw3Pi4uE4LKgkAxN/ehQU9gCH1K8wTEHDrDpEOvZWV6qBTnc0QNksxuFrNUeYyKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790203497; c=relaxed/simple;
	bh=mE077adzSO60826bSPH8AmWIYay5TSVj9G861oBtwr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NYS8W34nfWl1dqjbgXAuE87wShgC3t//7a9kmnSEK5CJfyPPY8u2NHc387zuEgMCJWcrYTGx7bRP3h7FT4xGKR2da9AfCROwzlXTBLnRt5IAk4rPPnFt1n6s5KGXqjOzC21sZB3596Me/OtL4T3XuhEQlEQS3iJflAHEkPNjqvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kvhHG0l1; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kvhHG0l1"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e2406so7020165e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 15:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790203494; x=1790808294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tQXtWNjNigWNQlYLBO5wxwxCg1hTWjPpuHjvfkhkF8E=;
        b=kvhHG0l11CbSMmLkesMZqC7nHoieLQCeADezEsr8yrPLdnUcmm6VD2gxnNUamGVxqJ
         yNkiGsow/oT8WVtFTz/GmN+r3rk8IvoX9ob5aM3h+mhtlZlryeVsj/GWgS1oiKsKS2ab
         8eWGIWszPCdCsnWK9SyHtqfx2xkB8tk9Bb/7oD0W1B9V4dKRgLFUFX3L0wWANAX8pgC+
         7+nLhg52dEyWIhUcaVuKFGwX80iwxf3kYq5GBywGTJrtS0QKFm0zVdmb9HxCEJ5Ifffg
         HNFry18gpRg1qKtOYiVhUFWr7b1vHAYk6kZDqc+82iAvh1HOnyihTq8nZeNdSN3Mbjug
         yrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790203494; x=1790808294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tQXtWNjNigWNQlYLBO5wxwxCg1hTWjPpuHjvfkhkF8E=;
        b=tk4uZaaZW7Wpr7vaSoghCYgNUIb0gzq8yN3/bR7QVl9Fw0kNtD328MGKQg+Xod2CNu
         wP5vZe0NotFfmAsFc3Q7GldHWQBq2wupoW54VaEQ4BoGuVBVygEljTBddhO60l88CecA
         qx9BOBjK+8SNbBBuaKxt1ZOVBKqn+w4JbM4rnl1mJNiH73dcAPuor5wIRgJHMWbEAwoD
         e2xvkFUkkTP/1+8ZyCzJblCKh7g/qE4fm5NDmjnj4jakAbsuaf3C4DHbhq8k9Qb/aY6h
         cUfgTMyRp1QD1PBITTWfvNpU/JJJjM9ZFMhUnSjJb+pIUlAdMh1Zagw5U3+HcQCARAxC
         GXWg==
X-Forwarded-Encrypted: i=1; AKwUvByATkYaErzp5HuBJNQc/D8vynP1oY5r9E7/dPnkXRVVIjyQjByMqT4KLQmqX7p1y6GmTANHLnoktxXhySGb@vger.kernel.org
X-Gm-Message-State: AFuF++ll2wtMbZQ/QkF+qJSkXE72EjxbqqJgclKD0D5JqGWdCt2FBFcU
	YwnzCFMS4Z49HoxTJzjeGro8kwhVw+0CEFTCeyizxAkW2/Iodn/x5oBo
X-Gm-Gg: AYBFou2PQRZ3QQzTFo5tadv3pWT7sju+wj8gWX0EVqGsAZEgCzYg5KPK4vMQlS3robE
	K5A6sp9Ihi5aSZTkDHMvglwwDs0kXiJ8NgWg9/98C4gra+PqYI1fGqveos15fZhvEmAC8w2XedQ
	83k2d+xMVD0DWUZwY8P283+bawfe2XQ8mdbMyy2K4GYn3W6fJTdnMH23tEWQNRqRNZnlwdPJcFC
	ziq58DnexWY5Eb84fzLSWW2xUO18OrbNFx1liFbKP0RJZ3keUYTPZsxzxXvrrlSGopQKQ5UGo/J
	zlANUgWrELfdN/pvFhfaBU6SdvSjfuGC7X6M1FRuudoC4i+PilpeX7QEvqPjbOiobR7tCj5jvWP
	Zro/qmswXpYuWo3RDZE2puG+t77K+n2TpLUTyFdivXNvUn5UL5ZIisWO3fYFTccxmShU6cXqRDx
	CNvMavIHqw+2X89loemdZ9gIdTSilzqrFTqYVQF7LcFJ68H8OYQnICfr/oA0yzAf6MzdgQCic0o
	7ijPovxZ3oiFCQ/70/dud7GQCHYCtmxaQ==
X-Received: by 2002:a05:600c:6986:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-49fe66d05d7mr10255655e9.8.1790203494222;
        Wed, 23 Sep 2026 15:44:54 -0700 (PDT)
Received: from x230 (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5b9c16dsm31420695e9.3.2026.09.23.15.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:44:53 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: petr.vorel@gmail.com
Cc: abelvesa@kernel.org,
	airlied@gmail.com,
	andersson@kernel.org,
	conor+dt@kernel.org,
	david@ixit.cz,
	devicetree@vger.kernel.org,
	devnull+david.ixit.cz@kernel.org,
	dri-devel@lists.freedesktop.org,
	dsankouski@gmail.com,
	jesszhan0024@gmail.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	phone-devel@vger.kernel.org,
	robh@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH 10/11] arm64: dts: qcom: sdm845-google: Move panel pins
Date: Thu, 24 Sep 2026 00:44:32 +0200
Message-ID: <20260923224432.190902-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920-crosshatch-panel-v1-10-de6e9512da96@ixit.cz>
References: <20260920-crosshatch-panel-v1-10-de6e9512da96@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Both devices share the pinctrl configuration.

LGTM.
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr

> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts | 18 ------------------
>  arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi  | 16 ++++++++++++++++
>  2 files changed, 16 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> index fa89be500fb85..a000c75494f1c 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> @@ -61,29 +61,11 @@ &mdss_dsi0_out {
>  };
>  
>  &mdss_dsi0_phy {
>  	vdds-supply = <&vdda_mipi_dsi0_pll>;
>  
>  	status = "okay";
>  };
>  
> -&tlmm {
> -	panel_default: panel-default-state {
> -		reset-pins {
> -			pins = "gpio6";
> -			function = "gpio";
> -			drive-strength = <8>;
> -			bias-disable;
> -		};
> -
> -		te-pins {
> -			pins = "gpio12";
> -			function = "mdp_vsync";
> -			drive-strength = <2>;
> -			bias-pull-down;
> -		};
> -	};
> -};
> -
>  &wifi {
>  	qcom,calibration-variant = "Google_blueline";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> index f1379857e2742..d54cb47cdf95b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> @@ -473,16 +473,32 @@ &qup_uart9_tx {
>  	drive-strength = <2>;
>  	bias-disable;
>  };
>  
>  &tlmm {
>  	gpio-reserved-ranges = < 0 4>, /* SPI (Intel MNH Pixel Visual Core) */
>  			       <81 4>; /* SPI (most likely Fingerprint Cards FPC1075) */
>  
> +	panel_default: panel-default-state {
> +		reset-pins {
> +			pins = "gpio6";
> +			function = "gpio";
> +			drive-strength = <8>;
> +			bias-disable;
> +		};
> +
> +		te-pins {
> +			pins = "gpio12";
> +			function = "mdp_vsync";
> +			drive-strength = <2>;
> +			bias-pull-down;
> +		};
> +	};
> +
>  	nfc_default: nfc-default-state {
>  		enable-pins {
>  			pins = "gpio25";
>  			function = "gpio";
>  			drive-strength = <2>;
>  			bias-pull-down;
>  		};
>  
> 
