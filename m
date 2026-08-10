Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC2E3C0A14
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 11:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786360568; cv=none; b=Qkvsn4+DEO7bUhCgDbCVkC/rnydf3jD7L0GGiG0sUpODbSnxtkOUD2OqIpL5F2HIK+6u1NOd+nU2iBoQIAU3ybx+NCoT3QuvEJOv+RJm2SW7+4cvCyLJk5WfwDRiz+KeoCaLurKmMR4Aw3EIHVDk3MsVwXCEiZrU0Xdh8EXaFMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786360568; c=relaxed/simple;
	bh=P/IEswyLeXqjgrL8ZRHDu6AS4WKKbd2sMTKf9/HtXA8=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lh8gLcJhyumLTZI1c6Rij4WVHxDOI4hmlcmExkgRBPN9MTkA35cnvqjspvjrievpnvr9HB//OhTl+u4Cu23ax+weZjTdNhGVU4Q+GM0Iqq5ARXXusdQeYpIU4OZ5kq/VQf3HgE+3Mbnvxexg68uR7Gmczgp8kOmX3W6L3ZFuAKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mREg9nz3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mREg9nz3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA1321F0155C
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 11:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786360563;
	bh=KqqXjK5wKyje470GpH3zQbrt/NfiaPoZDgrm3GDppTI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=mREg9nz3r8yXiZ3cn0P6ocvo/JVbB8mqbQvjL7/P1HymKkdAbjfs0Q+ylF11Xb8aN
	 Khj86WXmKiCrXATFwUGqmVsdfcnm+7LpB8XelP6GNs/IE4LyZ59vEThtDEHzcZ8mJI
	 WmyeJhgkwdDQ82+bP/t3xoBuDwnGcJ99FBXSESdI+K6aRLIrrCpdvQx0fDizqGQkfo
	 lBgpsUv5Otf9KCniNreoiIufyajjrnxpYYJgSIh8aFW545AyspSbU3RBTOivgj/taA
	 /vvLzLZ4F9CGXXFl41QZ2qtpVaI3/k9BOlrfsdELf/J2pnsjCH8OhaxvILIlhgHg1e
	 FjHJnyc8IG2Kg==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b011edaf7dso1868966e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 04:16:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoK8xAjwawasfHROrVyW7OedYQXrz5DNf/GwUV1P8WIAnjant4DGGmvKQk4arFNPBWzJPqLvX99XRZuPaY7@vger.kernel.org
X-Gm-Message-State: AOJu0YzRHTzdxMg6os78RDztg0X2eMgyEBSbQsct28TS9W+RJJF9aUjq
	yF2DtKIVZXxNjDfvegRhdccf9A1e8AIc/PXiEproGjBSyi9NwL55+cgw6lGSUB9itTMz1ONHgKh
	AyyRHhs0nE+9s28bv+wel1PTCOjb1zsCqUQ6Zs4Vegw==
X-Received: by 2002:ac2:5b47:0:b0:5b0:1708:afa6 with SMTP id
 2adb3069b0e04-5b3181cec8fmr107659e87.43.1786360562682; Mon, 10 Aug 2026
 04:16:02 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 06:16:01 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 06:16:01 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260804-b4-sgmiieth_serdes_regulator-v2-6-c4bc688177dd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com>
 <20260804-b4-sgmiieth_serdes_regulator-v2-6-c4bc688177dd@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 06:16:01 -0500
X-Gmail-Original-Message-ID: <CAMRc=McVMyM8vRq2JR8aCVvNKCutV9D+J4R8zizUG2kf7ra1xg@mail.gmail.com>
X-Gm-Features: AUfX_mxh8nhhV7PpY5aNGc_B2bOST12W9YV58LCffhOyHw53XBZ3qAYQYNo6m1U
Message-ID: <CAMRc=McVMyM8vRq2JR8aCVvNKCutV9D+J4R8zizUG2kf7ra1xg@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: qcs8300-ride: fix SerDes PHY
 regulator supplies
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Wasim Nazir <wasim.nazir@oss.qualcomm.com>, 
	Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>, Umang Chheda <umang.chheda@oss.qualcomm.com>, 
	Yijie Yang <quic_yijiyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 3 Aug 2026 21:28:02 +0200, Mohd Ayaan Anwar
<mohd.anwar@oss.qualcomm.com> said:
> The SerDes PHY node was configured with 'phy-supply = <&vreg_l5a>',
> which only covered the 1.2V rail. The 0.9V rail (vreg_l4a) was missing
> entirely.
>
> Replace phy-supply with the two named properties vdda-0p9-supply
> (vreg_l4a) and vdda-1p2-supply (vreg_l5a).
>
> Fixes: 787cb3b4c434 ("arm64: dts: qcom: qcs8300-ride: enable ethernet0")
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> index 1ff39530ea3deebe454416d70a289e44c2d89e3f..76c34215dbdf07e520fe96d350f52da8c4485c97 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> @@ -702,7 +702,9 @@ &remoteproc_gpdsp {
>  };
>
>  &serdes0 {
> -	phy-supply = <&vreg_l5a>;
> +	vdda-0p9-supply = <&vreg_l4a>;
> +	vdda-1p2-supply = <&vreg_l5a>;
> +
>  	status = "okay";
>  };
>
>
> --
> 2.34.1
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
