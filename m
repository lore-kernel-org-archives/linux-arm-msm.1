Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D7F3CEB9E
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 19:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790795078; cv=none; b=Mz4923aSfut8exMKEB7ionthb2HrJE1jFFXq8RSMwdfbwQqu/+YN7jhbSulro6bfLN3HWTwnCfMmk0fq6EJiZRqShXYZd2+wk1FUY5AzrrdXCPyfODVOK5HWLpd0ZsGMi1ZwmuJIKUuf+4I0M/WZVrQD1CaDakHNfHhuSlWIboY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790795078; c=relaxed/simple;
	bh=aQDTmzZkNtfi9M4WvijRvmcfH1g1CjNfc24/4SY1nHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HcScAOwui+1lsjxnybpUdx8WTTEYUia/NOsW+kvnpknEdci6NXqGFz6Hd1V6NY7hQqPWExLj78SR1FJDw5yTm6h+cXedBTu6vRTqiUrYseFYwKWztV+JQZuK4gg6jQt1xRnbImuMa2l3kr2D/kBwV6Yb5EejWdVci/6vRchTQUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bwt9pseH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b6o0Xmx4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bwt9pseH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b6o0Xmx4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UHedBD1198560
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 19:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n+yNVJmf6N6JAqx65mEM5Tj02xGBuXskr0wTh+rjirk=; b=bwt9pseHMIHAfkSc
	bn+n0tlrDMTjIlSMiibMFrTlfErRB3rTVKgiJlIPiWi53RIObkXBTmBIJyBbnqKo
	j3FdIl7rMcrCLMKsmaXi/OWwgL8eP5ZuW5MFqmURc/AHBeK84hdPBggrCGo9pCrB
	CdMk0MFbSvlvZYwSu7cpvE1LA9pd36V/LosmsvjfxxxrqUJO18HyRq9MXzhd3QT4
	plHf5a21LnytTrUUg0w5KcpFwVx6I9DKspAU5WdDWZ5TjVJUT2Dl8csmOeXiEBrm
	822cmtag5qdNaRnVKs7YVubmb5HWKCio+W20lsaB0UT9lgK3zy85rWInNFuEo6yG
	EJIAyw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h136thjxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 19:04:35 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98909a978b9so101091241.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 12:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790795074; x=1791399874; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n+yNVJmf6N6JAqx65mEM5Tj02xGBuXskr0wTh+rjirk=;
        b=b6o0Xmx4u5HFmqDCnLYh4YMi+vIWON0c40wJOrwZJLp82TBjryvEDFy+CAGsv1Vjsd
         5x6qyvZkRy49mqnhnv8l1LbLsBU8OeUZvstU3IzB4nwaLLCmv4WUzWSw6nP8exTHuZ5E
         Wm5UZny4LGRGw2t/N4bDns1+GRAvND4fi5K3ehVtwlnaecVuztuekoUwvDuZr6TEPrBk
         94yiPwJ00sxzt94E9DSGLSnUMUuuzAkBQO4nO4Xox72ErxeGLWiLfynEGEiI9rcaMuCx
         RlXFeWq5rSj0HVeuO6+O7/gA7dPQUowCMts9AMLvWDR+59tTvvva1cO3qrQtNjqhG/9k
         DT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790795074; x=1791399874;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n+yNVJmf6N6JAqx65mEM5Tj02xGBuXskr0wTh+rjirk=;
        b=cFIc2KoAA6czlCMmo53E2gUQevdaWoob740sGdfvigNKFbDPBtM3fNVxLcink1ugzA
         WhB8psCHai6LY5TsniNeewqSmpUhVScg4z7gnu5WB4cyDb5LDXLBnmiu7TK78BoHzpS8
         77NFVHNULTekA449cAyKjM2zct9WjRf3XSErCBdU1n7ko0zds0h0LkyppT/X4x1Rj828
         Xd0G4vb5lzxsLD1P2CyVFStzMbudwsxc8zLRfZ2i2rlq/NhWRyTo8GWutQGRHsozJi2v
         Wo4ppZyTrODtBglaDX/YPYX3wYz/LULyShWzq2rkdjEyquEhjOwerxtqN0NqhVksYxqZ
         SRUA==
X-Forwarded-Encrypted: i=1; AKwUvBzAWF7DtWhqjBRPdZF8R+Dd52VR7SL1htR++ryvggE+6S3UQjIYYd/dpg1+3He6nhmovrx4V4yjSxTmRLud@vger.kernel.org
X-Gm-Message-State: AFq9FYJSBEbmfN/sS0hSOlz/vYFkg6VrRhE+5DyfvxF9gRiRYGHch3Et
	5ZV4HDToTZvRBwZno8BZnS5sxSMoeGZcBvgJUTwymeXFZ9/69k4gR6DaDrGuWJW6QG5SUpvmelz
	j25RI++dn0MYpcfs9QiRQ+n2j55GEtjRLMAuTJnyWehh8UyWR0UUJZgKuw2jyGj9SIDB4
X-Gm-Gg: AYBFou1LYTkwTkSiWhbAS665Z2cQJAcLJg99Mja3aKeaIteVozIsWAa/Ffp50M/xawa
	Wj9iZJKKLPzteajozDFJhLFxdeJK3FtPlXQU99MoATuVjRDWpv6GiqDPUOie4+1tOn0PZ4pHrbV
	viRHrVQYtC7UL0Oseu/BQNOFzUalnQPyEgWdgE9p3sy/gvZwSDUhBwv0TloZ9okBsAxWDYIYXY9
	YzHZ+T+mjqhaJfr6mJ2J5VcSIE89E8CZAIminQCAObXy3HbUyhS7cI/DU35tmdJa8M9gNgQqvwF
	3B5spRP71UUVvFry/vqNVcdVHddXLTbTaxD/ot3B25sYIxYtLwiD4KvC7Q0V1wWmzOISv42mcAm
	7tvEI/Ki6ySUOyJuDazHks/muzFzoLjevgcgpTV+ocMZTHyWFbDVdQExrOr8xnJIvgZxsf89R9B
	KEzKb5n4O3X4SK
X-Received: by 2002:a05:6102:41a8:b0:7a8:f2be:9517 with SMTP id ada2fe7eead31-7be733a564cmr586807137.23.1790795073938;
        Wed, 30 Sep 2026 12:04:33 -0700 (PDT)
X-Received: by 2002:a05:6102:41a8:b0:7a8:f2be:9517 with SMTP id ada2fe7eead31-7be733a564cmr586784137.23.1790795073234;
        Wed, 30 Sep 2026 12:04:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fbc4a5sm174124e87.63.2026.09.30.12.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 12:04:32 -0700 (PDT)
Date: Wed, 30 Sep 2026 22:04:28 +0300
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
Subject: Re: [PATCH v5 5/6] dt-bindings: display: Add Synaptics R63455 panel
 support
Message-ID: <2lcpzwh7fxecpffnakpnp5lecrm3e6u64ztat7cd75nuxofxa2@clj27bzgjy3r>
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-5-c042266b9eeb@linaro.org>
 <20260727-spotted-winged-mantis-7aa1ce@quoll>
 <CAD++jLkX0m6_GJd4Pd1Ko4tghta4AXQ5ALZpLe_x-3xxqu1Cvw@mail.gmail.com>
 <668e83d0-a017-4f59-bc76-bf6c9a80b5ba@kernel.org>
 <CAD++jLkyEPY5cFg_pHb71yG52iLwS9tQDpcHu=TTBknQMeFctw@mail.gmail.com>
 <bc3e618f-2e7a-4439-9466-8cd9695242e5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc3e618f-2e7a-4439-9466-8cd9695242e5@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA3OCBTYWx0ZWRfXzT2v5Q5HZIHk
 j8Z82NW4CrFw4oLTa965uLoThGwv1BajqLqrA0Zv5bSak3L2nyCmWcetT1DqY4p6zHJm1XBsrIN
 uL/aP/8GjfxLLpf/2ScrMNd3LSG6XKQ=
X-Authority-Analysis: v=2.4 cv=aPFlOr9m c=1 sm=1 tr=0 ts=6abd5d43 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=vnREMb7VAAAA:8
 a=VwQbUJbxAAAA:8 a=twE6rBcdgA2BTABM_JsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: G51z3uzykcPMKZINS63iI0zFkNkRl9Gl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA3OCBTYWx0ZWRfX7KDVsr78XEyi
 VTJ6r0Bq3SsH2xM+GPBuz8mS3ct1JAXVrX8OKD9EE2FwrGCJZMM8yKvbPB9ReUcwY6IiiousmsT
 avg8vuq6HY3udI2LcvqZ3iEebzJEZO/8JfKQ+GmXyLIuN1FC7/09ImjCNvgCBsi7KhEkD3hBC5w
 rzmhqcnDC8BiLw7oYltEZH7Npwa6IVmoiB2+VgcPqJyj/x2qP0sYt9JcpraL0nfg6bDOFJUjExE
 RBy5O8owzVMw1GBHUV1Ee4Q5GRJv3xOxoGlu+x9KRFUCE/ev/uxgzwRpWOYonJDL4UoHwK7Vzca
 JDgV3fYuU2DMnFGWxDsALIbIV3/VbZSxhNUA1ncYEx+WmXcYsL7Vz1V+mYG1HXjCeE4uB/a+dTW
 3fujO7v8okegsYSAwtjQs8NXeVpD7Lg+ugq+GR9RLqyqpMpwKHrsUTNn3kZkFy0v9oU6fm29y0F
 /Prvqhz7XZVm9y5zCWA==
X-Proofpoint-GUID: G51z3uzykcPMKZINS63iI0zFkNkRl9Gl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300078

On Wed, Sep 30, 2026 at 06:43:47PM +0200, Neil Armstrong wrote:
> On 9/30/26 09:44, Linus Walleij wrote:
> > On Tue, Sep 29, 2026 at 3:35 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > 
> > > This entire binding seems like stitching two devices together, which
> > > might be fine (I don't even remember this stuff... two months old) or
> > > might be artificial grouping of separate devices.
> > 
> > I think that's a good point and fair pushback.
> > 
> > Neil and Jun talk about it yesterday at XDC (1:15 into the stream):
> > https://www.youtube.com/watch?v=6tNGW8PoSzw
> > 
> > The current binding does not reflect the physical topology of the
> > actual device, and the bindings need improvements. I have a feeling
> > there is one display controller with two physical panels.
> 
> No there's really 2 controller and 2 separate panels, but they are not
> classic panel, they are a pair of panels+lens which are in front of
> the eyes which forms a single "image" for the brain, so they are
> technically a single display and requires to be hard synchronized.

Yes. However this approach makes it impossible to share the code between
the double-panel drivers and single-panel drivers. I think, that the
panel driver should still reference a single glass+DDIC, while letting
the DSI host driver to handle the bifurcation.

> The R63455 is designed for this exact use case and are only supposed
> to be use in XR application in pair.

yes, but no, but yes, but no. I mean, nothing prevents one from using
this DDIC in some other usecase.

> See it like a single physical panel with 2 controllers which
> shouldn't be used separately. While technically a controller could
> be used to driver single panel, it's likely impossible Synaptics
> would sell this IC for non XR applications.

I think, this was causing an issue with the DSC too. A normal
bonded-DSI-panel-with-DSC and this-double-panel require different widths
to be programmed. Having a panel report real resolution would drop that
quirk from the DSI host driver.

> We want the both panels to be seen at a single big panel because
> physically the human eye will see it as a single display.

That's the CRTC side.

> Describing both panels into separate nodes would only be possible
> if we described a "VR display complex" nodes linked to both panels
> but this would probably be solved by actually describing the "display"
> linked to a DDIC controller and is out of subject for this serie,
> and can be added later when we properly define things.

I like the VR complex idea. In the end, you have two modes which you
most likely might want to support:
- L+R, having double-width CRTC scanning over a double-width framebuffer
- Mx2, having a single-width CRTC and a single-width framebuffer
  displaying the same picture to both eyes. I can imaging that knowing
  about L+R might be an explicit opt-in feature of the DRM interface.

-- 
With best wishes
Dmitry
