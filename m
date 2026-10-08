Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08EF3BAD9A
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 07:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791445388; cv=none; b=QdYI2AlMoNIzKwT3EDztE2ooPBQ0FUs8BckqnLES0vZEl4JFu6B3emzwxeds2timzD6eQ+64e8wSrsHMV9O64SK1V2Al1geiFUmUxcqPE87QwmUUhJ6s6VafrILKf2V/18jzNyknQ8d7maboAWiBLrDuH/ZZ8rRnb+1gvnx2WjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791445388; c=relaxed/simple;
	bh=LDYQobeDjOG2L7Smr32jfhJEtFav1I7VwM/dHHy+DsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lGaa5gxHgCEVFCAD2sNJefcHwMq32GFs7/Fv8WeO2iCeGP1Qh3HLxxfPjAOBHQTG6WVlDt/UfqL7iRzQ1e3C5zZz6KlLgfYxaFm3LpfcFFLSeaKHZFoS6z+VLXDBvqRoNmbRLC7pJIsYHal3aOnkOdCcSFzEDcHKtzPsNMn7KdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c5XwdBy4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J1D5Gyu8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c5XwdBy4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J1D5Gyu8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KMPV3307910
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 07:43:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7nat/sc0rXD+7bccDq5WD70o
	EM3/iocHY40TJUcgDKU=; b=c5XwdBy4lYQ3eFwyizDxbLoGU05OLIsMPFQGV6Hu
	plLAFOI14FSXIH9B+ptb/H6Zr/5NM3/VMnPI9jdyYUZvZUUqfFShLohSeFtosREK
	73oNltZ2i9jIY9d8VyrocqSNnCJ91PFL5bqGipy02icgVyLsGvaYhlHvIEiO6wkv
	+I5P5hbrtbxbyXk8eqxgj76MiOPOw1+VAM7HGkLjTOsQzYWxsW2jCS98GPlspRu/
	WfBqPqhx+JaItfuVQk0TtSkLVOtiek1O9AnMKQNGrSM+vBd8M0LG2ySc3K28c4K/
	nX8n7eo6aQ/7tcVXU3drLeLrMDvf5GviFUXMBh7gubYuBA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h60sg9b16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 07:43:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb6391e89so958356485a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 00:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791445382; x=1792050182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7nat/sc0rXD+7bccDq5WD70oEM3/iocHY40TJUcgDKU=;
        b=J1D5Gyu8aKM0LlwRrsFKGxYRHKSS3o31E4cJSHNxOOKJazNR5ygN3KWoVRK6vzKgfd
         LBfhf1Q7PfGWFFUD098YHUB7U+JPLbqYEvEfa2+8wiOBoeYIvlWH/DqLs0as503fHSXI
         fkoe4UHhztyrdiNrToCIVAsooW+0yoO//tJjBoW2f9n3MWiB9I6bLF9hvGjw01OLSxeK
         Yy9M1mZleqpIpDaoJf9TnOe7uE7Q15QPckLtoTBxbsG1nMqHqpQHZ6AMniwEJEJerMgs
         IiYcV8npnx3GL3tZUb6PHwNWlaO1nRwbmPGVNR3M7ppy6oAY9s6yywGMAznhtEAjMww+
         joFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791445382; x=1792050182;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7nat/sc0rXD+7bccDq5WD70oEM3/iocHY40TJUcgDKU=;
        b=r7asAQ0d3U3S10q5DejYVSW2/iw1B9X/AeCIGl2f+HeT16fHP4IGn9vRTHJl8mgzK9
         st2Qbt5TpF6ibZbYSWCVWlO55MzU9B+v0M4rn9t+rV5Z5NzJSV3Zavzixmm0YFnk0Q74
         7SaraSrNgWkuH1nkJYaF3i7xevu7QK0XWXCxT1/GF21NmKWXgo4GDQn0T4pTsqna2xp4
         s87TCP07vrAWzIGNlpEdPoCAh843U6y2lso8kU3mIfG2a20z3ixBExIKytpz4QX7nMi8
         q3gJzADmibBNBm38bkD8Mg9fCXptNZxhN7stZkwLfvhkik38e09wTXRzSkZfKyEmQ0Nj
         uRGA==
X-Forwarded-Encrypted: i=1; AKwUvBw4U+vp37wbjg0a8bkThX5YTzO52u8TIII+RCjG3s/O09+lJVe7HJBAmfo2ybzXiCZU2TO59MPHBLBVr24/@vger.kernel.org
X-Gm-Message-State: AFuF++kAb0SPebHcyE1uLkVWbLtmK6pPQgxA0Ycrg1aAFCbTlO8nqiEE
	5WHx/TyV528TqzQHrqMaWQuscDyZ4JiQbnXZJkM555SV89VJ+P8sM83ZIEjTZXocbE5LxPA2IU7
	kJYZNZCzba6klMFhhTSllLNkUj57sIRbBjVGW6QhPrRNxj3X51Ze89zfvsm78hg7Vv3rO
X-Gm-Gg: AYBFou2mpTCf4YWbtzWwIfBxhwkmzhmBEbz67fehOCTNAZVLEMv+VyoZqeUywu1Q0fY
	9HWKyqO64bE4nCpZQ6NjIvLHEUnpEyjxzwR9ADlT0Fj2DzRV834QT9b0yhrRzldAgVygvnSicpd
	Gliy+0/DpKk+miJobS3OzRt57KEl6sdew4kPshX6oGEB8X8hzhoTRQ3qxrmeuXAWx+dsNssl4oq
	AowXc6sSE+YBRqIP3oO4rTAAHvdUSRPAlznS+wDrrJ5Om+DsgkP96uYLqNijcc5Njt8r29yav+B
	N11GNwTMr6lc5cJ6fsMFXjQ8VIQROA0lTBvdKwbLyURUeR4hZqh5ulwoFMTIMxc+XTNkh3au17M
	yGX6R4j17eSGms2jy5sUXuBXiJ0s1Sm2KZPlzeuDDzNE+8sLCFPTS04qXzywL/lvHmLzhiYT0uj
	iMpXoUsHq12l1R
X-Received: by 2002:a05:620a:1729:b0:930:f337:ebeb with SMTP id af79cd13be357-93e9b2e9672mr871188685a.12.1791445381801;
        Thu, 08 Oct 2026 00:43:01 -0700 (PDT)
X-Received: by 2002:a05:620a:1729:b0:930:f337:ebeb with SMTP id af79cd13be357-93e9b2e9672mr871186585a.12.1791445381348;
        Thu, 08 Oct 2026 00:43:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcd3091191sm927262e87.48.2026.10.08.00.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 00:42:59 -0700 (PDT)
Date: Thu, 8 Oct 2026 10:42:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jean-Francois Bobier <jean-francois.bobier@laposte.net>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Saim Shujah <saimzst@gmail.com>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v2] drm/display: let a bridge configure sink audio from
 hw_params
Message-ID: <3wcmymkzr5xcaa2s6gjupyixczgd5h2newuq2bkt7zvfq465rs@trytq2uvx4jp>
References: <20261005131545.23219-1-jean-francois.bobier@laposte.net>
 <20261005161824.36445-1-jean-francois.bobier@laposte.net>
 <42emyzl5p3kpvq7e3b7npaaghl62r4skrpdflszk7v3jagexal@6jdg6h27eofw>
 <41e65625-fb55-4440-825c-a47ed24800b0@laposte.net>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41e65625-fb55-4440-825c-a47ed24800b0@laposte.net>
X-Proofpoint-GUID: TGuI7f5Y5XMseKVNrnZFptlCIlQ9Dwy0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzMCBTYWx0ZWRfXyhaM9fcNZ+dF
 E4xqgQqeOcTPbQgXoIgAdsB74ldlHoJ6IR0f6H+QUunyrRpZX2xO5/G1u4eFf4IRIbu0nxLbGik
 PJ0s86plYu2TyqVdjohmnjCW8kY3Dsc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzMCBTYWx0ZWRfX40ehtfTX+wM7
 G24gc0Q5JLPjVziFVhTYg1++dv3ML4GjYWbcOBvPbZcjnYzBKRTOG9hwyAU8/jgCeov0hnBmyQB
 4NUYLiqDkH6WNzk79Iso/TdTe7pnCx++uK7KKETZbZl1rdCfFecwsdmoYn6n2t01hTqZP2m8WOX
 NU/MMH9wgepxQLyt4lS8T5SUHyCPf0uFrd4xjTuaZsQ6nM3JFOkxJXQh4Dhyitq0gQP6Zx1OlZJ
 von6XQuP8RMNe0RP6i1DfDyhid326x/rGiOMx7x2Z0grW2GU8dACFxXW2JMwPQtM0gPKKhbbWk1
 UHKLS7B73iWUI1rdydjAGObjoKlNuM0buyIA0tl9MpC90lQPqWgaaLoEhlNBSsGmlCdRjGLEXG5
 DeegvAdG542ISGvCZSQUgvde6A7WK4YKP5LoWGPowkaGPEDKv97T4sWbEmdVL3BimNL5isF4LDL
 dD1xliR2uYqh9R+kjbw==
X-Authority-Analysis: v=2.4 cv=DfWCOftW c=1 sm=1 tr=0 ts=6ac74989 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=tFzc-x1BRXlNayxtleEA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: TGuI7f5Y5XMseKVNrnZFptlCIlQ9Dwy0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080030

On Wed, Oct 07, 2026 at 10:46:06AM +0200, Jean-Francois Bobier wrote:
> On Mon, Oct 05, 2026 at 06:18:24PM +0200, Jean-Francois Bobier wrote:
> [...]
> 
> > Similar changes were proposed several times already. The IEC958 status
> > bits are usually set by the userspace after the .hw_params callback has
> > been called. With your approach the hardware will never receive correct
> > status bits.
> 
> That's a real concern in general, but I don't think it applies to the
> case this patch is actually fixing. hdmi_codec_iec958_default_put()
> is optional -- hcp->iec_status already has a sane default from
> snd_pcm_create_iec958_consumer_default() at init, and both
> hdmi_codec_hw_params() and hdmi_codec_prepare() fill it from that same
> baseline. Userspace only needs to override it for passthrough of
> compressed formats, where IEC958_AES0_NONAUDIO has to be set correctly
> before the stream opens.
> 
> For ordinary PCM playback -- which is the only thing DP/HDMI audio on
> this board does -- nothing in the userspace stack ever touches that
> control. I checked our actual UCM profile rather than assume: the HDMI
> device there is a plain mixer enable and PlaybackChannels 2, nothing
> IEC958-related. So the ordering you're describing matters for
> passthrough users, but doesn't affect the case I have hardware for.

That's the difference between the framework and a single driver. At a
framework level we'd like to ensure that it doesn't let wrong values to
be programmed and transmitted to the receiver. Moreover, I don't think
there is anything preventing AC3 passthrough from working on Qualcomm
hardware (and then it becomes an issue).

> 
> > If my understanding is correct, a more apropriate fix is to make the
> > a6afe driver to emit AFE enables at the .trigger point instead (maybe
> > together with other commands) or to split the DP audio init, moving the
> > necessary bits from the dp_audio_prepare to the dp_audio_startup
> > callback.
> 
> I looked at q6afe-dai.c before replying. It doesn't implement .trigger
> at all today, for any of its port types -- HDMI/DP, SLIMBUS, MI2S, TDM,
> WSA codec DMA, USB all go through the same q6afe_dai_prepare(). Adding
> .trigger there to fix DP timing would change behavior for every one of
> those, on hardware I have no way to test.

Srinivas, would you have any suggestions or recommendation?

> 
> The startup/prepare split is narrower, but I don't think it's free
> either: .startup/.shutdown are tied to device open/close, not to each
> hw_params/prepare cycle, so I'm not sure it actually survives a
> suspend/resume any better than what this patch does -- it may just
> relocate the same question rather than close it. Possibly worth
> someone who knows this driver better confirming either way.
> 
> Given that, I'd rather not drop this while something that actually
> works waits on a rewrite of a shared CPU DAI driver that doesn't exist
> yet. Happy to be told I'm wrong about either of the above if I'm
> missing something.
> 

[...]

> 
> Please let me know what you think - the patch does work on my board and
> brought up DP audio 100% working, but I would understand if it's not worth
> upstreaming given architectural impacts. (The bot seems to have found other
> gotchas on my v2 patch already so I will hold off until it's confirmed it's
> worth upstreaming at all).

I think the issue is worth tracking and fixing, but at a different
place. I've pinged my colleague, let's see if he will have any detailed
suggestions.

-- 
With best wishes
Dmitry
