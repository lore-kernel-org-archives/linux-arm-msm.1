Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3248B45DF65
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 13:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785850013; cv=none; b=t368JofV2tnoXmrvlTS42rNkc00B6Dl1ElZKF2Au4xCzH4KZus83GQ2Fzo9PyURxCFS3n2ygvwWKjQ9CYKlbx00N4t90cANX73h+BczsZLAz3XtiU6f45Jueb/g1fUNX3oPYgTG1NU+nxng4Xox0d+LfMJefGknaPJtMBCetZ0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785850013; c=relaxed/simple;
	bh=8785ODvlGI+w88nkKpZGop7jNiOSORDnJDRn/cyEcGE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=GmwfM7GVvDnQ+HBV+KCF8ZrEGvqc+1qfjMG1gDSNqURztWtPz0Y2dso0RbgRECUx+HV5ZfDrzkEn3yIJmkxqu6vBZy0/gjsUcF0nzqSaxH2dWucg5A2EhtEEy4K0WHhT7o/yCVS66EjfWOmQNveCYtiOGh6/GDcpr2n0Iqje+qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=tLiiCN9s; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="tLiiCN9s"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c20363107f4so6920866b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 06:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1785850010; x=1786454810; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=duKCsGugrWDv5g2IiTe0pk9T5MutZ42wqjHedhx9GgE=;
        b=tLiiCN9sb+k2xSeMB+QvnWN55K1XESdJ7GSaOVE3K6pjY+q7J7+BMhilkG2as8HJuM
         zZfD1xqUvKulxvL5WEHlV78lDWybtDJeNgV1EQLWPQ2HMNapFdxfN2sgQGz5Gm0G2aIU
         7/qMql59AGD0JFeYNtSA3i5ApTm7iw+sI4tl6C4XXrL9w68mViuRz7Z2NHDoR4Bg969q
         UfMZ5KdoIcAuidli3Vs5HUGklIRXuP4G3hndb9dkowlb3ZnQM89JwWOTvouAXHBlWF42
         51ESsJ2qt87NmAUMXUoMLn+P7+vgAO5+gD3KQStkIoSBJKixdmdOHrEFfItVQH0+zS0k
         5eJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785850010; x=1786454810;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=duKCsGugrWDv5g2IiTe0pk9T5MutZ42wqjHedhx9GgE=;
        b=gCZoeJ7eOVmCSgK7sATHAs6i+WsjxRmyd/QcwDy1ctk1TuXwt6FQe+dKHjBOueqv+T
         7wRVtUX9m4+ujM3Ukz/OKOOXm6wlZTL4xLQGZKruRBZG141eDUNUB6FZVIpuwxRC9n0T
         4TJUIManHMSMCDwP7+zJups1NiaJvkstCQximmZmxcRxRiEEd3g8j5Tb06XQd6+q5A4Y
         6kyVHiKR4w+7TuMU8JQpA1wBtspZs/4XYcLo2+hVmBQvmLa3kA3oHoRx+TxF7IjvWTvH
         Xe/6+S6sy0/Dvo+DaIqvVOjgNX3yCx94Zuk6r5/puqvUOrt3hiL6CLX8cyv+8x2Z5deg
         1zCw==
X-Forwarded-Encrypted: i=1; AHgh+RoIsjwDkPyd9lBc9waeUDzJXQHoCvnJOYBqkqG8ahUVVhDRlZ0S2JElw2Q1Q6WU6Udm/7hnGEA+joCAqI7G@vger.kernel.org
X-Gm-Message-State: AOJu0YwPH10NXShjrWm+PWDxvaYB8zBj7iovr/J9+BftpTtipRahNLsA
	sqmqaYilc0UHPRlsYvBvtWT7CK7ugqNsc2VmCPh1Xnf9b3rlT/yYl/4EpGAKIm+XOXA=
X-Gm-Gg: AR+sD11OBIkfPN/p/wQbbuVNVysoRGpY/Ip/BPuXw52gzKKMYKELkuuVL6dPlujfY8p
	Ht9k+jgsplBHwj5k6T8jnMtUwVE9bmD4APAVEnfRip7tCY2egBQ9Kd6XIBZwz4mS0iYtGDZ56oe
	wPtX0O4zhtqzLDYaBxWHN04TeTqBYUnajVzv+M2Ho4r1ObvJxoO7Dwz2mjVBVDWFdZFNlAvULeB
	IXNYJT6kSXa23l9hTt5cEI8BTNqQZAK5t1JEr+VQl2L4iqBwgGs7xvOo9W2qASAgr4uakMaCArl
	G0GJfDY6/hNZZr+sNGwaEnFyvJ6Ps/+i0AZLpz5XChJEO6FJ7vETGmEzgAURiwi9Bt11hZHzm1v
	mCzT1FelJHvePBm8OokDMlq0fJEpF7bp58/4hK+9MMEiQv3Hv83Q3aC/UsrUlwDOTlBMgOYWKT7
	CZEqHIeHq1L7hi+j9YaX2Zb06jsb7bgdYDWNp72L+xmxZ0EzspeW/HtylMY3Ji1dyAbiwR+tq35
	L4V2/TuG8SHB4HdXZMVg0hcbAnOomjM0y3NeC6YzxSF
X-Received: by 2002:a17:906:fe43:b0:c1c:2c32:1163 with SMTP id a640c23a62f3a-c1fe7f4b006mr1435330266b.25.1785850006304;
        Tue, 04 Aug 2026 06:26:46 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c203644c62fsm9811266b.53.2026.08.04.06.26.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 06:26:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Aug 2026 15:26:44 +0200
Message-Id: <DKG6ZQDKN7L0.3A4YY34C315FN@fairphone.com>
Cc: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>, "Manivannan
 Sadhasivam" <mani@kernel.org>
Subject: Re: [PATCH 14/28] arm64: dts: qcom: sm7225-fairphone-fp4: Fix
 swapped USB QMP PHY vdda-phy/vdda-pll supplies
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: <manivannan.sadhasivam@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260803-phy-supply-fix-v1-0-5880630cde3e@oss.qualcomm.com>
 <20260803-phy-supply-fix-v1-14-5880630cde3e@oss.qualcomm.com>
In-Reply-To: <20260803-phy-supply-fix-v1-14-5880630cde3e@oss.qualcomm.com>

On Mon Aug 3, 2026 at 8:34 AM CEST, Manivannan Sadhasivam via B4 Relay wrot=
e:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> The QMP PHY expects the vdda-phy supply to be around 0.88V and the
> vdda-pll supply to be 1.2V. But these two supplies are swapped for the
> USB QMP PHY on this board, feeding 1.2V to vdda-phy and 0.9V to
> vdda-pll.
>
> Fix it by swapping the two supplies back.
>
> Fixes: 4cbea668767d ("arm64: dts: qcom: sm7225: Add device tree for Fairp=
hone 4")
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Assisted-by: Claude:opus-4-8
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.=
com>
> ---
>  arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm=
64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> index 23f950067a08..bea82cbc2c88 100644
> --- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> +++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> @@ -1247,8 +1247,8 @@ &usb_1_hsphy {
>  };
> =20
>  &usb_1_qmpphy {
> -	vdda-phy-supply =3D <&vreg_l22a>;
> -	vdda-pll-supply =3D <&vreg_l16a>;
> +	vdda-phy-supply =3D <&vreg_l16a>;
> +	vdda-pll-supply =3D <&vreg_l22a>;

Schematics confirm:
* VREG_L16A_0P88 <-> VDD_A_USBSSDP_0P9
* VREG_L22A_1P2 <-> VDD_A_USBSSDP_1P2

So this also matches.

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

> =20
>  	status =3D "okay";
>  };

