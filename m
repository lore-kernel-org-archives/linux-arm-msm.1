Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8B8396D0D
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 22:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790203113; cv=none; b=A6fCn2x9oteTHOUvRLfQkwWGBpzCPLkKLRNegSdcLs9qiRx8cC7rLg8ay3tY1leUmXKlKDOP3G/jjrF+yLNpFQP8oDAsxG9g+krED6zMo3fCOsqEtvqbMb6gvHvfZ3WlAap1Oveg3jDhTaKwEvsnLnzQF3XbC0TJE5veENKQBNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790203113; c=relaxed/simple;
	bh=mE077adzSO60826bSPH8AmWIYay5TSVj9G861oBtwr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VEt2xCq7wiwWg6JVucbIglM1culI9Ce2RxhZuJ/zjFsQcwZ5rmYgJhrkjSnbXnsXJtL5e/P3GyJVtUbFPn4DxXdgkdB46QClY9eXnOp2dHHl7GKskH6W32M6m0xLAbKGql1HqY6YABFVcqXc8Y2Gmyp2fsdm84DoFfBPf7MKMlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BVh6I7Lg; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BVh6I7Lg"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d097b4939so7835405e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 15:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790203110; x=1790807910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tQXtWNjNigWNQlYLBO5wxwxCg1hTWjPpuHjvfkhkF8E=;
        b=BVh6I7LgJiQpSqUQ8UjSkxOMl7PebDqlC8l36VtPGUP8V9Fo+PAlO0Kr3pIGhRDhSC
         IbXnYW2iOWbKkSZDrW0dU61p+0lelXCCi717NX4inSl2cft//811AvYD5YsyyggFohSy
         nopjBkxXWTKOQG4xBSHZFbrihl+ZFP5AvIzynZJwqyzXlz9TQ0LJ9vz0ccVuAwS92Cv1
         IQb7+3UGRy01Pv3TOrGICBZ2Rg6sOZusXA+tJJ7db0EpWqggRnSMkvs1RyXs7Qw7wHoz
         k5MzH/5XO3eK+o/KZ3GMrVHIZGAunBa8InMqbaaXk8vwWDtlsTndTOdxmH7WH6JH2i5S
         /wyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790203110; x=1790807910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tQXtWNjNigWNQlYLBO5wxwxCg1hTWjPpuHjvfkhkF8E=;
        b=Qoco/uLZj6MiJ4wKZR0kft6je4MM7WXU81iS1JURvnJr3tTEyqvN9Wa4pxhayaKyKu
         qS6CHga3itYGdqmvWzbYN4fw47mQyTNAKQngFBw0TsUxXVTn8YiYmzZ85g7CWb+DVyWZ
         B/Dsc+WFB4bSZ4f+rcQigQxAlasLEvgG1syWJ2oMwECBkSjBpQiI+JCrUCPSVn646rvX
         E6eHMiak2s3LCxuVixouw5kfdGPbVQBXgykGOD6DBHcijFRRWgPAUlSGLKJLURuB2yhp
         FdagJA9oVkUiqjUIgeqsGzgydD+i6uHhNEuIclcK6VvSHEd4Upl0vDi773JiwG/MHsWw
         A5Ug==
X-Forwarded-Encrypted: i=1; AKwUvBzlryRgsHPm+8SR1u19qv3ogcTlboYTDTEthdqiS2c/46HcQPw6Q86fvxAd5RwvOzVRQvc5zbd94vZbZJFQ@vger.kernel.org
X-Gm-Message-State: AFuF++kOVNE17bQE+67pK11Mrkt1APtsErdAv9aXNjyW8HzZX7n7uRWL
	YsTOl5f5gCx0s5ZTKWbcXMOO9abs/D5p2OOWkiiMsJ1E50MRIjrqdrr7
X-Gm-Gg: AYBFou2KuR8XTCryQszI+FK9OSGcFYS/mW0tIVNi1QLSVEKEf1NQ4PWHpVET1gFCThz
	dJxtL3fteYm6d1TUklEeq7xyjxUldlCXVlU/K0Ct3dR1auNwEeMHppA2uYitj6RqY8kgfnfbWqN
	xTqBatYrnLKSqjDXyzkIJmyEDB1RdIODtUtOSme0xrjoyCGWPLhvXr6lGV2nUYVZBNC5pyPwRMu
	69witYsfasK6ECTlpZkHT0X6m6+tOVPGmVs6gsZ8UV8jbgRx6Hw2CAf1icyurhm8GzAHqe/Fz4N
	yiFOrqNFhIIhC3za4542A7HdDbmbNQ+tHRg62BPaKMfHu2N0cU8QS+/hGjoTMTY2PdJ6KmqvRJt
	OxftlZPUkU8rIde9SBZjNauy0EncOGASXv3TL1fnvBvdnv7ztRX+tZ/5UKZxu+cl4Bc0bIAvRc9
	Gy/EDP9xNsH69epuAvgd7mq6akxVJgokitgW+E2F09rIx+2K7nWqgNB5qRPKlZ/zLQSrjT/zCBA
	iXtUqXgWj4AddcuSM1Sfn9eCujYmZLFTQ==
X-Received: by 2002:a05:600c:c492:b0:49d:1f32:c911 with SMTP id 5b1f17b1804b1-49fe66c867fmr8606205e9.3.1790203110240;
        Wed, 23 Sep 2026 15:38:30 -0700 (PDT)
Received: from x230 (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5b47da1sm20046625e9.0.2026.09.23.15.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:38:28 -0700 (PDT)
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
Date: Thu, 24 Sep 2026 00:38:23 +0200
Message-ID: <20260923223823.190313-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923222521.188197-1-petr.vorel@gmail.com>
References: <20260923222521.188197-1-petr.vorel@gmail.com>
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
