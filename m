Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4909A379EEF
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 21:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790542814; cv=none; b=V9Xb5RDWm/iCYGaGzmBTeMTBq35VGh91hWqHvZwx7yvjH5C8G8ak5g7XpWFfVQiCw71zSHNqN9p3QyHgk+R645vluagIDTGSi6hEeCQDmCJHi487vi1izcL6l1nEHYj68/OwYDSurJOpdU3zzUgtlLF8XZ0UiitefEAp7SXPIi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790542814; c=relaxed/simple;
	bh=G2oUcl4PFuECTL7Wrpefi90ylipzCMBA/vio+TVO4HQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=twivELI3nxEttzuiIRDnLu4Qfe+2AxyKn824mSrKAj/ynHosBdWoYzxTIupeyk0/ROyaAzqzzPIztyun7cl7qLFvBbgIui+R8MbMaWnrs/JsseseYDj2L/KUhxA489sIt3EzDfrg9edZ4CPQsaTyb/+iuJP7YMnROQ0/fBP2IV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=mvIk9pMc; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="mvIk9pMc"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887840c529so877058f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 14:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1790542809; x=1791147609; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HdQLpvgoc2kmRQGNUAWswTV8bwgORG4pWTKI2Gc4aS0=;
        b=mvIk9pMcmF/eoSKyOQNUNXVRwuDcWeZMzIBthXsDBkf+q+dEkzkyD8+ch2buQsB0/T
         owvU5qY5AobLL5aHYwK58mA/NA2iPOddJOprjf/tVVN5gryy5yBCAOWtkxgPbP4ZnWSZ
         pb0NiEitsJt0Q7WUtLr/PR7ymVOWL1qQ5SZtvL92oruXlrRNaPc5npWURrKpfGS6bT0J
         wqf4MnTSmZtz2fjVkLl67Yjf/lRhpS9dfQZNXtpafrBCD5r0mS/Lcv7FbL6ONrk6bfh+
         ZqczdNFyfdYyn/pzVTYxPDjCj4lbwU2HNxrDCQd3iV6MUkRoUJdFeRfDlImDItCmFN5K
         2mrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790542809; x=1791147609;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HdQLpvgoc2kmRQGNUAWswTV8bwgORG4pWTKI2Gc4aS0=;
        b=VfaQEHLz2mMsjczNFe3eSZ8UsuIfOjzWSorfVYKaFe+gxN3P2/n1GeLslhKCxx2S8x
         RlvvSmylBr2rYaF+O/dM/acQSESqSjdKBdXBAwzKV13YYL71E7cgSM0nMnPLevmhKFpI
         O2Mi509sEy6bXzPjgtkPQ6LuT/3OQLDVN2krrtMCtk4+m9MweT4dvTT5+O56yLFd3GwZ
         3ISu040wcraHlvMi1CEbIxpotgWst1MzOuln84PO9CVGjVABp75urQcahtNAEsb6tpLh
         VMo8zOcs5TvsopbkcOvgluyaWaBOuw6+FO3jSmkciq7ytEyF10yVCS4SY1j/gyRJERgt
         5Ibg==
X-Forwarded-Encrypted: i=1; AKwUvByMVSCeRz0M1MmxVHmdJ/yAXER3gos3+2CdPWNXzjmQaC8X5pM+xhY57XhKU46xCEEsjvRVdloDOr4PUJlR@vger.kernel.org
X-Gm-Message-State: AFuF++m1h4IhRVlFD+AQQbRpnHM3t5YvW/arnG5nXVmedR6sa2T1q1Uy
	76rxvNMruqU5AR5SzP9JqUZgAQ3gUMQrTJ5Zh4uf3D6yLi9WGRxESRg7nUwUS6FieD0=
X-Gm-Gg: AYBFou0S3wEYXpy9AbiLRA7rzNcBIbaKofneULDTx8K0SJH1RzrItoIw3L7Nu8KZilM
	ZQjA5bddX3gP69A4/j7J8PuQaNPl1Kk4tctylLI4R6aFihrODvLwSAEEoepfKnkNQFXfaSaTJGi
	iwe2PeO/wNOTrJYxwSg+Ee2nrcdS8Mhvc6aQ6lPdd4p+yG9jL1f6EBF9C1MVHP79M1E0IuFZpnv
	pQn4IygkV2E4mMSCVe4tBdDcinVWJUzX9xHzpjRt3OjcFkKkWQd7zN9sgnyfqCYpJibC4Bi4+H7
	aTtI9T7vOkrmXc2ebDsHxA0RVFZX3sNUH0I2uJjFszOy+WU6o45Bk1KG+ZHLGWDzKcodlQQxWYd
	X6NzNl2R5NlFu/qdaFKF9bbGIALNBGYFkocp1z+x8Jut7wcMIK541KYp/3dT3DPxSQcxm96PXxR
	FWGIhZGn5jh6TE71We/yyqGVWFrGB8mPuIVl0QjXfvOFIxHzMKMJH0hAxfxjK3v9N4T1GpK1g=
X-Received: by 2002:a05:600c:4e53:b0:49c:e37e:4389 with SMTP id 5b1f17b1804b1-49fe66c8288mr201327785e9.4.1790542809339;
        Sun, 27 Sep 2026 14:00:09 -0700 (PDT)
Received: from localhost ([62.217.52.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fee6ced69sm146468965e9.0.2026.09.27.14.00.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 14:00:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 27 Sep 2026 23:00:07 +0200
Message-Id: <DLQEGA48W7X8.21N6R6EPU8C@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "erebion" <erebion@erebion.eu>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Jessica Zhang" <jesszhan0024@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 1/8] arm64: dts: qcom: sm6350-lena: Add flash LED
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20260926-pdx213-upstream-3-v2-0-b4612e3eb536@erebion.eu>
 <20260926-pdx213-upstream-3-v2-1-b4612e3eb536@erebion.eu>
In-Reply-To: <20260926-pdx213-upstream-3-v2-1-b4612e3eb536@erebion.eu>

Hi erebion,

On Sat Sep 26, 2026 at 4:00 PM CEST, erebion wrote:
> Add a node for the camera flash LED found on the Xperia 10 III
>

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

> Signed-off-by: erebion <erebion@erebion.eu>
> ---
>  .../boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts      | 15 +++++++++=
++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index 6e2bbf4f060ac..79aa2521aed40 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -4,9 +4,11 @@
>   */
>  /dts-v1/;
> =20
> +#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include "sm6350.dtsi"
> +#include "pm6150l.dtsi"
>  #include "pm6350.dtsi"
> =20
>  / {
> @@ -302,6 +304,19 @@ touchscreen@48 {
>  	};
>  };
> =20
> +&pm6150l_flash {
> +	status =3D "okay";
> +
> +	led-0 {
> +		function =3D LED_FUNCTION_FLASH;
> +		color =3D <LED_COLOR_ID_WHITE>;
> +		led-sources =3D <1>;
> +		led-max-microamp =3D <180000>;
> +		flash-max-microamp =3D <1000000>;
> +		flash-max-timeout-us =3D <1280000>;
> +	};
> +};
> +
>  &pm6350_gpios {
>  	vol_down_n: vol-down-n-state {
>  		pins =3D "gpio2";


