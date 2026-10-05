Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A692517A5
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 02:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791166959; cv=none; b=UPEAmcBvwz9oyeNagy4oNoLeriQ5P+i2PJtlK8pn02PizcZpuwor/x7vYtlyYcfunb86hVCTwKk4eVc5KdPuwX5b0OyAglU0MZL7fSH0PUxF9x6nIlNgnm5Mvr++/5tjT89mM6HcvxrglLYjdo4Y7Il9pVOtpv4ba7ATczdz4HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791166959; c=relaxed/simple;
	bh=Xl2DdGsWjQEdbbvk8p2bEAcA+VdvI37yIoMFpBIWfV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pdaeUEG+2okbIYxpGvJSAQOR1PlRA3me5UNokqyKZHWjoxcsHnVuXz651zB4PPQhxZUITL3yrCdWaNHcct0OUaLntSJ5Kjzh8InvSv00U/cNakcurGmIcCkPhq+FDP7gTlDIMDK3pOZ5UMYxelF94wLyhZqD9A6KPEZJs9J5zDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OOJduBMP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B34Xsi0w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OOJduBMP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B34Xsi0w"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695107T94061107
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 02:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xNAkAdnRqmG1WxVm2qrUwlPD3YQ5EJEfWaG7blUh2rw=; b=OOJduBMPLkuU3ICF
	GnacmXqnbNczTFye0O11DdlJnG6biVDGNT9eq+lFvRf1GZTT5xEjICcu1yMJEUMi
	b83CgseG7/1r/IqsWOxzEpQZahSI34h1aDSqm3jtargpsCn2JRNpnMxaNH1R/Uea
	HlTj504dV0cRYa2/ooWAdGtwLm3bN3cx2hrY41/nGElxqq11/IKTd8VWe/P7w4z0
	uFEI+OPQOJ2eGTqzDbkSQ5BWMVu1JkfT3P/NhMJvF7OHs0wrcLa6nyLp6ifLv3SH
	CsuTAKBnf1iQDnqwxZqAmGLGlMSFQOEXy0IgawaLKLYPtSeihV4XVqHmxHTHrVw8
	00xz9w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h41gn859p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 02:22:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cbacbb996so191916685a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Oct 2026 19:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791166956; x=1791771756; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xNAkAdnRqmG1WxVm2qrUwlPD3YQ5EJEfWaG7blUh2rw=;
        b=B34Xsi0w7q/bS130S54jlbSmjmwsq5rX86IICUoYvhxMBESLq3vvJ4OZJhqKpCIFY2
         RQSUtThZ6rETvxWQ+UfnBMYblknjOg3XzkBMZSECNPV2vhjINaKSD9t8by1PGvXFQs6Z
         rL/H8khTY7+ERSbWWkL2+QmA5WFCVByosXGGHAaasJV7whLYw5wA90N2s/zwcVoYl5o4
         4YYMrXYi6LgOH7VN8iZnjWuXFPWNdCfQtUQoR6ER5B0lPxkemkhY5nZRqUFNGlduGTv/
         HbnRiHJKbw5RElcNVc+on7rekk+/nkxmPpcNLDD/GAHI3p2gd+3vkt5q7C1MmePWhNUf
         pguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791166956; x=1791771756;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xNAkAdnRqmG1WxVm2qrUwlPD3YQ5EJEfWaG7blUh2rw=;
        b=ovxmE1qHE4vKX7ewEmvQlRWR1UkRzI1FamkVoLwSXcak8deLDLNc16vQ3R9SXennQS
         yjzBC6xgyww9cq3+gweYSIOeru71Hgi8eYjVrg/UkNvQUk7+KnKHRzCnUuyIK1gDzFBr
         7VRHK6jspANPV0zWNMcmtTaSd4kl4vlhJ0duDuNQ+ms9yclUflW7WYPtAecR/W2VAvBP
         GK7sa5d7LzBNPgpMSDzAEFbQGpJAbWmIlZd1jAuph8bsf8ZmKpSkZ75EGfPuN3smuqpz
         U4xkuDHiA56aOHCBkh7u3nrjM+puQO8Nn2ExHAPABgSDHtHPSsXYHeryEVGaaXVVEXGS
         gzRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzXSBh1vLI3mAPB3Z/9CveP7046aGB7UER06SY72OQQ7zwso7lRdgHLxomd534Sq+1+9FYDhmkt0qeGG4a@vger.kernel.org
X-Gm-Message-State: AFuF++kg8cdlRjGlFwIUm80rZ5dUix4CVfPQKtVs6G/SdaYh5QoRj7Uy
	pMc6JZmGPpKA6Yrkt4JIXB/z1yfTB4I4NUpzgI0nk0w96vYpO9oW7NY9KI07tJPyDe+5IaAEENQ
	Y2JnrOj9PzYZuzBmwu5V/3VfkYfMu+jGQwXSdOkQkGNApPZ6IZ7O3uMCsZCf3IlEDh61W
X-Gm-Gg: AYBFou2xYoKVoLaYV7qvCSQax4HkxVai5voQojXeQyaeZTPmRU+y7A0J6LQJZWZ2KIC
	xTWz2PcfE9XJD61212AAhzk71M4PWjau3fqaouB7wg+i7dVdNFCuyZn3xjUyQoXq6KAGzOayhiL
	hO8DuEfsRcvh3qwEpW0KEVp2zgwdDom4Hp/EY87DPecqyI1rdjv2YBoAw4aVueJGtG6Bvs23a23
	FGyNQXBk7ZSK34H49OPMw3yCySrX2Oqv6/iP5cP3suNMlBpIcC2hvtxZomg2mXaXUm3m0D69FyF
	V/EFZDu1kKc75Bk0lebWSVrafKv/ObMipX5JkSES+SBxygRcq9QEwHxtgT9nF2RPDD2I6gFE68l
	O8g/9pyVmmSCPq6mhPPC5hq485IT5CGB04MJVQAjScwut/CaqPg0FhhGw3VXH9AtdaVNLW2mx2m
	Ba4YEboU3T45tF
X-Received: by 2002:a05:620a:271c:b0:939:6de6:9518 with SMTP id af79cd13be357-93cf1763839mr1579089085a.47.1791166955792;
        Sun, 04 Oct 2026 19:22:35 -0700 (PDT)
X-Received: by 2002:a05:620a:271c:b0:939:6de6:9518 with SMTP id af79cd13be357-93cf1763839mr1579082185a.47.1791166954023;
        Sun, 04 Oct 2026 19:22:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c795b22sm2750298e87.36.2026.10.04.19.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 19:22:32 -0700 (PDT)
Date: Mon, 5 Oct 2026 05:22:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Linus Walleij <linusw@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Jun Nie <jun.nie@linaro.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 5/6] dt-bindings: display: Add Synaptics panel support
Message-ID: <pyl6bihy4zsyhmblrgvuvov2gi2jz5ktpbcz4u3r53qw7h725y@4wzvce345wwh>
References: <20260727-sm8650-7-1-bonded-dsi-v5-5-c042266b9eeb@linaro.org>
 <20260727-spotted-winged-mantis-7aa1ce@quoll>
 <CAD++jLkX0m6_GJd4Pd1Ko4tghta4AXQ5ALZpLe_x-3xxqu1Cvw@mail.gmail.com>
 <668e83d0-a017-4f59-bc76-bf6c9a80b5ba@kernel.org>
 <CAD++jLkyEPY5cFg_pHb71yG52iLwS9tQDpcHu=TTBknQMeFctw@mail.gmail.com>
 <bc3e618f-2e7a-4439-9466-8cd9695242e5@linaro.org>
 <2lcpzwh7fxecpffnakpnp5lecrm3e6u64ztat7cd75nuxofxa2@clj27bzgjy3r>
 <4d053234-06d8-4268-b60a-2fccc78da654@linaro.org>
 <d3xs3kzc2wg5lkouaemdicrbtsoquff6bvmnlmuxwh4kspfs2d@b77l43axr6a4>
 <8cf6ec52-fb36-44e7-831c-2bb24214f591@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8cf6ec52-fb36-44e7-831c-2bb24214f591@linaro.org>
X-Proofpoint-ORIG-GUID: EY0stW3I926HxOHotsXfX0tPbiDptMAL
X-Proofpoint-GUID: EY0stW3I926HxOHotsXfX0tPbiDptMAL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAwOSBTYWx0ZWRfX7UVdM4yG+kFH
 Tf3NbZ4Z3rP064f1u+LXrYYR+rIVlzPpIxPoPxnpZWDRvpEZxzrqUSuxWZFHsacxK2tEEvfaPXr
 L8UeK+7sm6D7X5gdMnb2Gp8NPtfgnoL7AaDoxOTuBbetbTUk++MYFXtAzTR2hmWEr0NVohpwclt
 VIQuWSyL3ljRg8R0yb4yDmvDmdlTHQ5vmQvrO5SifZTpiNSBszVIybNNLtWws0QM/TG5Fm5eg01
 M5SKhLGDw0lWDActI2qTbd0XZ5tB02DSkW1sYa0ZRC96qhOGKUymMIANouUmEP3PlwjM7LmS+YP
 NS9RzLrMKUWqAruEgzhZKBuZhGiFl0YUZqCrDNyAPhGIhAPfom0z2JaH4e/sUDayf6xpoeEAsRZ
 30kLZ/t5jfBxp5+WQv/45jztmtEWX7OHK+T0ymrdy5n8EUCp4GhZJ8o8eJRtPfKRCcVBpStVt2Y
 eohYjpQbJNkiA1KhZ+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAwOSBTYWx0ZWRfX7jixgffNsl/f
 XT54IbTzct1Z3CEkRDTUhOExN8cZ9OSZyK4W/pEMy2s8HSGlo1aro3LLSYyKrImwZ4ewXJ712Uf
 oKO4KfA6O2aIv/bxajwRQR78sQajoVo=
X-Authority-Analysis: v=2.4 cv=P9WvFSAu c=1 sm=1 tr=0 ts=6ac309ed cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=vnREMb7VAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=c2XYxALNj4nUam8qvhUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050009

On Sun, Oct 04, 2026 at 05:51:44PM +0200, Neil Armstrong wrote:
> On 10/1/26 02:43, Dmitry Baryshkov wrote:
> > On Wed, Sep 30, 2026 at 09:18:55PM +0200, Neil Armstrong wrote:
> > > On 9/30/26 21:04, Dmitry Baryshkov wrote:
> > > > On Wed, Sep 30, 2026 at 06:43:47PM +0200, Neil Armstrong wrote:
> > > > > On 9/30/26 09:44, Linus Walleij wrote:
> > > > > > On Tue, Sep 29, 2026 at 3:35 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > > > > 
> > > > > > > This entire binding seems like stitching two devices together, which
> > > > > > > might be fine (I don't even remember this stuff... two months old) or
> > > > > > > might be artificial grouping of separate devices.
> > > > > > 
> > > > > > I think that's a good point and fair pushback.
> > > > > > 
> > > > > > Neil and Jun talk about it yesterday at XDC (1:15 into the stream):
> > > > > > https://www.youtube.com/watch?v=6tNGW8PoSzw
> > > > > > 
> > > > > > The current binding does not reflect the physical topology of the
> > > > > > actual device, and the bindings need improvements. I have a feeling
> > > > > > there is one display controller with two physical panels.
> > > > > 
> > > > > No there's really 2 controller and 2 separate panels, but they are not
> > > > > classic panel, they are a pair of panels+lens which are in front of
> > > > > the eyes which forms a single "image" for the brain, so they are
> > > > > technically a single display and requires to be hard synchronized.
> > > > 
> > > > Yes. However this approach makes it impossible to share the code between
> > > > the double-panel drivers and single-panel drivers. I think, that the
> > > > panel driver should still reference a single glass+DDIC, while letting
> > > > the DSI host driver to handle the bifurcation.
> > > 
> > > Yes, and no, it must really be considered as a "single panel driven by 2 identical controllers",
> > > and even this is really purely software implementation issue.
> > 
> > [...]
> > 
> > 
> > > > > Describing both panels into separate nodes would only be possible
> > > > > if we described a "VR display complex" nodes linked to both panels
> > > > > but this would probably be solved by actually describing the "display"
> > > > > linked to a DDIC controller and is out of subject for this serie,
> > > > > and can be added later when we properly define things.
> > > > 
> > > > I like the VR complex idea. In the end, you have two modes which you
> > > > most likely might want to support:
> > > > - L+R, having double-width CRTC scanning over a double-width framebuffer
> > > > - Mx2, having a single-width CRTC and a single-width framebuffer
> > > >     displaying the same picture to both eyes. I can imaging that knowing
> > > >     about L+R might be an explicit opt-in feature of the DRM interface.
> > > > 
> > > 
> > > This makes no sense to support both modes, and this will never be used,
> > > and anyway this is purely software implementation.
> > > 
> > > We're defining bindings here, describing the real reality, not hypothetical
> > > situation that will never happen.
> > 
> > Let's ignore software issues. On the hardware side, you have two
> > distinct DSI panels, each having its own set of controls, own DSI link
> > and own backlight control.
> > 
> 
> OK so let's see the problem in another angle, if we had 2 DS links 2 physical
> controllers, 2 physically distinct panels but forms an unique display.

Imaging the case: through the time the backlight LEDs on the right eye
age faster than the ones on the left eye, so we need to apply dynamic
correction to the backlight, dynamically calibrating the coefficient to
be applied to the LED brightness (or even worse, dynamically applieing
the _curve_ to compensate for the brightness difference).

Note, I don't have any information here, if such a difference can exist
or if it can appear through the time, or if the xR DDICs can handle it
on its own via a pre-programmed LUT, so you can totally say that the
argument is moot and I won't even argue here.

> 
> Describing it in separate distincts nodes is wrong since it doesn't reflect
> that it's an unified display, so either we define :
> - a "combined-display" bridge defined as:
>   - a separate top node in / like connectors with a graph from the DSI links to each panel
>   - a DSI subnode with 2 panels as subnode, port graph from both dsi to both sub-panels
> - a "R63455" panel bindings with 2 subpanels as Linus shared in https://lore.kernel.org/all/CAD++jLkyEPY5cFg_pHb71yG52iLwS9tQDpcHu=TTBknQMeFctw@mail.gmail.com/
> 
> I think it would be interesting to have the "combined-display", with a connector-like node,
> which will do all the split-dsi dual-panel logic for us and leave use implementing simple panel
> drivers.
> 
> The outline would be:
> 
> =====><=======================================
> / {
> 
> 	xr-display {
> 		compatible = "combined-display";
> 
> 		ports {
> 			port@0 {
> 				combined_dsi0: endpoint {
> 					remote-endpoint = <&dsi0_out>;
> 				};
> 			};
> 			port@1 {
> 				combined_dsi1: endpoint {
> 					remote-endpoint = <&dsi1_out>;
> 				};
> 			};
> 			port@2 {
> 				combined_panel0: endpoint {
> 					remote-endpoint = <&r63455_right_in>;
> 				};
> 			};
> 			port@3 {
> 				combined_panel1: endpoint {
> 					remote-endpoint = <&r63455_left_in>;
> 				};
> 			};
> 		};
> 	};
> };

This is an interesting approach and it would be a requirement, if we
ever have a device with 4 DSI hosts which can driver two sets of XR
panels (there would be no other way to understand, which pairs of panels
are bundled together). I am not sure if it needs to be an OF graph
device or if it can simply reference the DSI devices. Or if it can
reference panels (which is not the same).

Another question, do we need to list any other devices here? regulators?
sensors? maybe proximity sensor? cameras? I'm thinking from the
4-host-2-xr point of view, because if we don't have 4 DSI hosts, we
don't need to describe anything. We already know all the hardware
properies and connections, the rest is really just a software plumbing.

-- 
With best wishes
Dmitry
