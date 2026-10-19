Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66EE5A8756
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421204; cv=none; b=jzbLFOJIfSSBYjxtHSpa1uvjmEKhFexXzPv3ZkoBztNcJ55zNlHx1cpz3XBtgjuNYsQoCFx4wKTWwaLOauJJsJqH72t0s0yRE2eQKhJn0QfZ3JJimGqEcIF0nrJ2VC79MtLip2XLemxVqI1dJEHgBDDgiSZ86Udr2HFiLDHEd5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421204; c=relaxed/simple;
	bh=NUYbkwfvMaiq2mgJxrlddsz1BE59iqOwCB5P1rHWWls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qPHv84FJ+lrQOkkqIDo80FG9Il01l0nNv4QGA4D3EpgV3gIaDMAgE2dUMRUJwg+baKL5gyS/NoMzK+Y3HEWeGIUuzMGRWMTp6njYG0d3T/0GtM0lXewor3CCEyNqGDT1EQmuEfIQB7lIZLZLl09sKY5DrinO8Cpmtz0kuiFN+aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kr6S2QKr; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kr6S2QKr"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-53639b8903bso31243341cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 07:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792421200; x=1793026000; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ObUPLsPJGuppIrrJdS1lRX74UIpacBO+aKqW5gbD0SE=;
        b=Kr6S2QKr+WmqwnMRYXaE/QriBoRYoBa1PU86Sznqiif7PZGdZGze0j0T9+7GAGDZ3G
         RVHGuoiTIencGLaYU57BCVxzeqsh1049Moke9M9deeqs/b5as86eHNB9+/euj31Tf1Ib
         lwRO1dk+WPqRrwpaldj+xa4djr7ZW+i9rI5sLtNDTdzobBtEFCsB+94NZPvs/h0jNhpl
         s/ql8Wdc9E4vN9g8tfBNlmFd8bB6QC6i6PgnRsdc+NU0mDbEwBHr7kMGQKXyAkB7XjvQ
         DcPsOm/vbO6BepViDe2CTxWTtNhBa+UZqsGSD0aCXNBz46BSrbs5uLgbXdbyQSyid+1m
         KeUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421200; x=1793026000;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ObUPLsPJGuppIrrJdS1lRX74UIpacBO+aKqW5gbD0SE=;
        b=W4gFIYIalzDJ94zFbyYC+nV7rcRu00nMI4ujzgYOYaELmlnwISVpjMbaDkeDPL85iu
         onDxTArOy+n1yEFFkAS5unDNsHXIz4SyxH1dr+Dr9evdre5/vjSWgitsjD6iUny7RnCM
         YXwOpolD7jyyQ7nAhtij5tO2SKxGy0NvVvTL8fWeD314OALDrKs/sOUrxHoKtLca9keq
         zb0XfAmQNj0to0oMlQpJ/FQAAOBdyBQWunZb7qVTh8gUmYW2m/xksDUnOX1kS8c1dIMj
         Yr4HlVLKf75V+iaFlW0LtcGvsc+KMWKxdYPO44Gu+olwCWvbKBPHcJtHW+BClRoehSaT
         zXbQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9NrkVrb4bDOfQhhdgxBZs+v3DgnRmjTOP19V8ODqTxskQ33KmUOYk2QLpCu/Dl+0jxwSyatzXkG59Lz/8@vger.kernel.org
X-Gm-Message-State: AFq9FYIKglm0JHFSZmWBcojiqWsMoo8N+P4Ep3FstVIUeVD3ETCfjTBu
	K1FvA72JZT3dL2/4RcW/0pHxmICHpONe0geMmHQb5r/UIbBhtweFKuUF
X-Gm-Gg: AYBFou1LGMOw/MzMpXoLFmzZYPT8L1O5mSSfXLeuO5+FBxDB3iuFrIxt4J/RO7x14Ay
	CQz1inwvBBto1P3LbYLn75LJ5D7RJgCm1cmPa9IWRyN3i4+BlOlpNEuXE1aFrRkN8xw8rOl82+g
	yiy4hvKnlwDOWMLbMldtcspZoK2xaPmHqhwyi6Q9SVuJ2wRyOocTM9vWX7LgE8L+xRRLXVX+bWm
	5g+lAAwqugiHYyW3GX2GB+r/rCdunnx9zFRg0wDHOXiFudVap4iERUF8hr86IkrSUvdenRnoOzY
	ZpxKudOxjTI+/7lYDj3qpFgHixSYEumKerq1W54pMQ7kJnrFu0TAPYYEJ1G1mOPrgJW8Is6AFvv
	fVuH806LbpaYAW7ek/tKNP1S+kWZKPAHtLPMAnx5dsk0DVheeGM6rVVLs/CGuajSlIjAhHyrMCp
	eM62rDqeed91ng8xnbCORcuSKwdP4QWuyqIDCyEAmVZrsGLhe3ItJsELxjvgvQKpWML6WxLRboz
	EkgIuxZ
X-Received: by 2002:a05:622a:990:b0:535:ba01:d95 with SMTP id d75a77b69052e-536272c2d55mr176215881cf.19.1792421199332;
        Mon, 19 Oct 2026 07:46:39 -0700 (PDT)
Received: from localhost ([199.7.157.38])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb756fcsm99470846d6.42.2026.10.19.07.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:46:38 -0700 (PDT)
Date: Mon, 19 Oct 2026 10:46:33 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 10/11] arm64: dts: qcom: sdm670: add digital audio
 codec
Message-ID: <atYtSXF6QeTkF6pr@rdacayan>
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-11-mailingradian@gmail.com>
 <87839ad6-c489-40b3-bfcc-60c436cd1a6f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87839ad6-c489-40b3-bfcc-60c436cd1a6f@oss.qualcomm.com>

On Fri, Oct 16, 2026 at 12:21:10PM +0200, Konrad Dybcio wrote:
> On 10/3/26 7:56 PM, Richard Acayan wrote:
> > Add the digital WCD audio codec to the SDM670 device tree.
> > 
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm670.dtsi | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> > index 038ef0f73ea9..91188acd16b1 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> > @@ -21,6 +21,7 @@
> >  #include <dt-bindings/power/qcom-rpmpd.h>
> >  #include <dt-bindings/soc/qcom,apr.h>
> >  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> > +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
> >  
> >  / {
> >  	interrupt-parent = <&intc>;
> > @@ -2541,5 +2542,19 @@ data2-pins {
> >  				};
> >  			};
> >  		};
> > +
> > +		lpass_codec: audio-codec@62ec0000 {
> > +			compatible = "qcom,sdm670-wcd-digital-codec",
> > +				     "qcom,msm8916-wcd-digital-codec";
> > +			reg = <0 0x62ec0000 0 0x400>;
> > +
> > +			clocks = <&q6afecc LPASS_CLK_ID_INT_MCLK_0 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> > +			clock-names = "mclk";
> 
> This clock configuration is forbidden according to bindings

It is corrected in patch 11 which is why this isn't caught. I'll move
the fixed clock to sdm670.dtsi.

> I'm not expert in audio, but an LLM points me towards
> LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE

Does the LLM have access to schematics?
