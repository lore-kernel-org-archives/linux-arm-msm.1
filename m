Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9AA4399EA
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 Oct 2026 13:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791122298; cv=pass; b=n4I6rUyzVQEDxWge+FOYLagSpPlVupLX7rptPZ0NOFFAkOs0UqtmJ5l0VW6Ka7N1OFe1i2Now09JtqQAB2qD/hu7WURh7THpvI8jYdxZCYFH6qLAynWAm+EWgpZg/H0egMx98mrgSgVw44n95DPhHAktkFBSklbjCcj4apnA6jc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791122298; c=relaxed/simple;
	bh=WEaQ6XiqVtg2tmigVy5JhaPpL6oItqqeQ0+x0LG+yaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VcUUh2SKArCsP8IVss1D6TBezY42QEoDsBlEdXmBm1qtlZM5bBxxAXp9s3aM9kpoNUUfcKN70V96flk7a9n6ZZrz3781R4ESuMImAGzEKROo/cMr1/UOod5ER+AmBnX+nimQGUnTVfEP5aqAtdEu8Vba+e2VHUGsXF8hUU3l4qQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tiH6Tam3; arc=pass smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tiH6Tam3"
Received: by mail-yx2-f43.google.com with SMTP id 00721157ae682-895eaf31683so5184237b3.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Oct 2026 06:58:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791122296; cv=none;
        d=google.com; s=arc-20260327;
        b=lLxTSwhOzDcwtE7XhR9MfSJVAPWwyny/Y51T/5IpQy3POPc3VdGagyaEb3lbPDYSq1
         hErW9Dhqjhj6bFsmBmHnzAYZVgPlksqkdM6YXOXIxhzu2wc87MTWaACcFnjzDRZ7reML
         WRyEvRlmwMDQ7ZwBLJ/xbc0ds0FIw09LhnQ/+IqBcINzDcJR/bAPfKQLeudKiCjC3git
         mg9QkJPVEA+MRgl5v5i0G3Ib2zOpWFJJ7sXOWV2uWKNxCeh9vBjAnSPJ1LVPtG/sSBXH
         +mGy8Nj5ocfkBqwA5BPDezfNfzOZ2wNzmGoHB2RrtUSy5qf8WQedx70o68OI3jX9jyuJ
         tsHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Sc47DcnOG4SbqUBdnELdeiSnIhxnStqddXLb/q6F8OA=;
        fh=fWeqSiig725K97CTLTts8ldVaP63/CoLh9cXcC6D0Sw=;
        b=chlTY3QTALXzBrJaWPDWqdqWMLURD96krStW8VfPh/EmJHyhX+nSA6MbP6Oab/24ba
         PTWDHRs+y3TEmXhm/NFfKcjL8KFQpUlfqplQYRbf4QOgMTrwrN6uiuJLlEHsF/1Ew68p
         5feE/4UmhctEFYKSrQ+gPJYlnyRMN8LcQsDL4+/5X2rd3k2BqU7eZGjUUQq01ApneHdJ
         +QQ+dg09MyCTJaHC1AzxF35Ttsb1N/vSvwn82JZztG1APh83qEGPjStsLfcN3cc7WVTt
         b5HHpF435z+6N854fOyHEDBzSquNIZecvZeaQbZHC5wkeGYoRjASlZfZvukLYDGSvvo3
         JBtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791122296; x=1791727096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sc47DcnOG4SbqUBdnELdeiSnIhxnStqddXLb/q6F8OA=;
        b=tiH6Tam3uTd2FiXGSp4cxy7BQT2SyfuRaZ2ny0fStEJfjXUAfxIDYl47qa3HDFdivA
         7ptVHFPAq0PEDn6+SxhA+luVp46kSo+f+m86prEP/wUCnjmL5nS0GZY1DNx5EdmIMKoy
         dUTTItSPg3XFyhJca9mxAl2hSH4xLIN+/RwupcrP8r+k1Asmuc17I6Y3O/eJ/r5cmObt
         P3ai1msSZCVD/MhY4AfciVOn72dvDsR2VZb2o8Gus4wOlwv5UI62ft2xOoNbJN4ILCK9
         KowIRK5QzV1LmRwSqx2t0niwkcmMoJqsmlE4XT5bH+ODeig7tDD0UPn0+IE9arsW+VPE
         FIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791122296; x=1791727096;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sc47DcnOG4SbqUBdnELdeiSnIhxnStqddXLb/q6F8OA=;
        b=Lrevv9pGwxIQgQD/llS6HGX3mJX3cOu3lceWpipZuwnDEZjcQb2uEyajDzRBkTG3wd
         MSaS0lDSUrV34jf4I8iNIhzJNK0wBHW2ouZhpH+v/ELezF1oQbyDQ4yKqjRAwMp9aIm0
         ET2eNGJXWCZCG8e1IkGtJ3k3+acR7Xf6cG6ClylToMamwePyoAl43yCwiKBYoLVAETfB
         ax9CoPdzLKh7aFQ0jmNv6wOdvT7SNARfFOJuGYFvQjI0b03EhMMJgfr4ggF7ZKn4RlKp
         +YsjcLAlmb89RF3uuSdmQfGtzsis6BXzk0Pk41hlXcR/5iSQhm6Ew3cw0oOrShgNYWQG
         qx/A==
X-Forwarded-Encrypted: i=1; AKwUvBwnxtzFSezR/uEuMHRXBOyqZrYxKoluDOkarfRC4bNBUQxxnTTMcQd0aL6nudVjEkyRZoRxZ1ds3lmhsbG0@vger.kernel.org
X-Gm-Message-State: AFq9FYKK5O9hKv0VQDahTTV0aeIDSRl6ClZ4+wWcEQh+6pd15QTEP/PJ
	NGlXf2IAaI/50KicsjYyoqdqAiitsXF3XCAeqlkzjz5/FCZEp2VcCl20qKnWwN81EuHkFYjFj0e
	qSN8bePKYLIGPAAWTxtFQ7TpAWyDjcSZIXSuKcCH7lA==
X-Gm-Gg: AYBFou29X/lux5XAREhGxAUDTJA6MhUEpjz8kryTofNuxa41SxjY25Azl707/IO7aBW
	DphpoxnRTU8Z8KKmxncfT6xkZpBKz0hYiXs+N5GSxn+v6+l4wwaQ6XDMmZHtDf9p2OsnzbjRTNS
	6lL4TCaeWgJ/ZJ8o1mU0gj/dFn5QL3uWw8wGWvciFp4T8Nh+EaCb3phlxYItKWqeAPbigMMEFTW
	I29D6DFW7uWMO6eo6T8Cn/ne3Rt6SbJDK5YyITvNoKADOl0ftmDD94hFFDrqiOD112WU85zk4By
	IvMu83UxxdcsWXXM35LPm+yVInhU7Da8FeIOmFdGgyFOZJ76Mqytm1R6VjRuqMHs
X-Received: by 2002:a05:690c:c3ec:b0:8ac:b167:4877 with SMTP id
 00721157ae682-8ae39bbdff2mr22844037b3.36.1791122295720; Sun, 04 Oct 2026
 06:58:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-3-c042266b9eeb@linaro.org>
 <gu22hz3dnttzyu2eewpalgzxtocmlbfvnpwore36ufmyr3xtag@r5bbhafsn562>
 <CABymUCNtcgbcRNXdMUjVdnH_ybOxjFB31gd6AW-0HCFDSn9w4g@mail.gmail.com> <kgnrsnko7u4g6bpxudfo6yqubhd5gcyrdyovjfkohlgo63yrwn@xbgp7jgv6ns3>
In-Reply-To: <kgnrsnko7u4g6bpxudfo6yqubhd5gcyrdyovjfkohlgo63yrwn@xbgp7jgv6ns3>
From: Jun Nie <jun.nie@linaro.org>
Date: Sun, 4 Oct 2026 21:58:04 +0800
X-Gm-Features: AclHuK9hzkrn0hz5wdouvmEqGC_OxpKSvbDPHUzvFuTecXtty7kAzmgPFKXJfPw
Message-ID: <CABymUCMGT32A5gE+a3u7=-3scH_Nu7Amb22-FRfWiNrcEOnAgw@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] drm/mipi-dsi: Add flag to support dual-panel configurations
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
10=E6=9C=881=E6=97=A5=E5=91=A8=E5=9B=9B 03:43=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Sep 30, 2026 at 09:52:48PM +0800, Jun Nie wrote:
> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=
=B9=B49=E6=9C=8830=E6=97=A5=E5=91=A8=E4=B8=89 00:05=E5=86=99=E9=81=93=EF=BC=
=9A
> > >
> > > On Mon, Jul 27, 2026 at 04:08:42PM +0800, Jun Nie wrote:
> > > > Some devices treat two independent physical DSI panels as a single
> > > > logical panel from the CRTC's perspective. However, two separate DS=
I
> > > > hosts are still required to drive the panels individually.
> > > >
> > > > Introduce a `dual_panel` flag to the `mipi_dsi_device` struct. This
> > > > allows a panel driver to inform the DSI host that it is part of a
> > > > dual-panel setup, enabling the host to coordinate both physical
> > > > displays as one.
> > > >
> > > > This change does not force individual panel driver to manage
> > > > system-level display topology if the driver does not intended to
> > > > support dual panel topology. Only the driver that set the flag to
> > > > true need to take care of panel topology.
> > > >
> > > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > > ---
> > > >  include/drm/drm_mipi_dsi.h | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > >
> > > Do you have a single MIPI DSI device, or are there two independent MI=
PI
> > > DSI devices? In the latter case, the flag is wrongly placed.
> >
> > Yes, there are 2 mipi devices, and 2 mipi hosts. This flag is used for
> > mipi device
> > to notify host they are one of dual panels, so that horizontal
> > configuration(width)
> > in mipi host can be handled correctly. Where do you suggest to put this=
 flag?
> > Thanks!
>
> Into the msm DSI structures. We already have several Qualcomm-specific
> flags. I'm thinking from the 'generic device' point of view. The
> 'dual_panel' doesn't mean anything if the device has more than two DSI
> hosts. You need to specify which hosts are mapped to L or R channels, etc=
.

How about to add below 3 members regarding multiple physical panels in
single logic panel. We have h*v panels in a panel wall. The index start fro=
m
0 when we iterate panel from left to right of the top array of panel wall. =
In
XR case, we have num_panel_h =3D 2;  num_panel_v =3D 1; and
panel_index =3D 0 for left channel, panel_index =3D 1 for right channel. Th=
e
original framebuffer is divided into width/num_panel_h and
height/num_panel_v for each panel's DSI link.

u32 num_panel_h;
u32 num_panel_v;
u32 panel_index;

>
> --
> With best wishes
> Dmitry
