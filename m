Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6295B47426B
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 14:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786632324; cv=none; b=a6ZYZG37Z4R9WQDBo9bIyTcqGbaUrfB21YS08JCfTyM0EaBwZh1wcCpOHB0HPw6to9pEYXli86JC/ekBKbSWwqyokQd0+gcU5D6VCl2o/1a/pJiP3Dd9Em/GLVsCnW5OX6PkrsStbieLbA4Ql6+SghkaxB+LPijQt/Srym8mxjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786632324; c=relaxed/simple;
	bh=K/bS4OawuWKCP1wgt7b/+KBz5fRpWlij9MbfH+npyXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OgCX2XZvpEid8JntkEcrA0w75Bwmokmj4WFcRNrakglERXnsBn8qvOdeiDYGeD4rDoDvQqJudrOv7Oy8kWJsLV8aZowUnAJ0vR3C2OxrUpmqNof63sXCCyNPA3z5V1aZhrX6EBhfUSodho/4QVk4OSU3iQC5U8L9C/FbYcR6R50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I6Mn+9K9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QaR4d2dm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I6Mn+9K9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QaR4d2dm"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DCKZbG2711893
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 14:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uRZcIZWzwhsQClQoWCRDPoqO
	ksp7QGY7YMrfX9l8rqM=; b=I6Mn+9K9EspsjWvojXXfiCCEvAtQqFWih/Oj3jdA
	XBfRqklcUBgv9iZHlLDWXZ4B7id3CUEBKCkaB6k11rO0nM4C5iLFr2w1X9OxUEnj
	43C+WMeaFMj8oiVzOL7MPHbLHP+chP3QHru+tZXrNueJce+MFifTdQdA+lshGMfU
	hAEaxXBbBDgJqDvISz9BtTOg0rIz9vSnzyvtxIQG+N7Br4WMd3ed9b14PZk9Rshr
	VT16vNDfK1lqzS+B81wr0p8ZZznHfdiGqVl59J7QQRIqEKIjveT5MduteBiKUh5V
	cUdosNGb3TxlzBqP5580kEcfRP0Lhu7SXx6u+ik4n6Jmvw==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0y04m59x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 14:45:21 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7f1da5e5b06so1282143a34.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 07:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786632321; x=1787237121; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uRZcIZWzwhsQClQoWCRDPoqOksp7QGY7YMrfX9l8rqM=;
        b=QaR4d2dmGYcqRqL/eh4XVkzyqVHVXi1Ptoxx28LPDHDP6rhbR1EFiQPomBdmr2XADE
         1JfBMRRixPcuJpzEoPalq4Cr/WVEvaUBPylslgBUJIxU+sxiGiOKIUDH1QXHPbcjGzGx
         ODW5RwMXV9NzAE1BDCY2HvpA/w+BnQdohYeZV7hWaA5nUW7x0b42eh23PuN/NDnVl36z
         pslXsKiHpwqg6mPGf3A2YyXh557TJyvbXVyxP7enFOKMcxU0/VhUiNi4gS8uadAAxKkw
         Y0K/lSA6eX5Uioy9DADL35H6B0tz3gcvl5xrsinL529Bz5oLOoJFCw2ZdounD4uPYEEH
         DRaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786632321; x=1787237121;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uRZcIZWzwhsQClQoWCRDPoqOksp7QGY7YMrfX9l8rqM=;
        b=lv+cPGc9mjdtT3lPFgaU0m/rkhlEpNx7YBNtSEX8fftB4NlWht80MNSY4gdjPJQ6/W
         Znmnc5Ho6tEgpWIY4GSxM7RK+W5OjDBjEeaztdtBOIL6qqovJbdhcdvDkTuuZYsoASUd
         tT7AwdBwBxtkSVJjH48UfLIPZ8sREaKLq7GpkPD6gH78/9x5lGBZxve+pe3X/ekijLIj
         5NejrB4vJqgbepNTwXw8j8hBiSpbLoe0/xUidDl60P8K8KzYsKZah69W4N1ECpe2HepH
         y4eYClnUAF0NlvgdKpkkwqZ9UaUkR1zadcT/H6GyMb2XNUNvYZSBlBpDssFB1djDzoOa
         NYcA==
X-Forwarded-Encrypted: i=1; AHgh+Ropaw323sD+MJAfiR8x0a+0gE1iXbu8MNPT2/GM/WSsXEdvbTtyes3edF/5tYhR1CBd9120Hs3Fis+5ppK3@vger.kernel.org
X-Gm-Message-State: AOJu0YzKOS9P5qiXMpE6m6OUqeYkLHNVBSAFiicMLZ0yNPZT3xnhFcCU
	jEqoViTajXzhlDK52E5huqvMr3I5Uy3vcWrCyWEvU21v2pmlmHoorfspjA6rYohBJ0bxf0uEM3w
	pNtMiKmcnKpyMFA+ZrOY/YDmpvw1lo7+7mhrNJ9lAKf8wplLQ2CZMRwk3vcEoSvR4U/Q7
X-Gm-Gg: AR+sD10ObzCTfZnxYrnnk87Um4ufLDI2GD4PvlyaPhHHo11EcuHyCHZTX4+hMGgX0vV
	R9qTz8CsMjFfBc6y3DeXRDcnsAxaW+M0vzpI75sM3gTOESFoiARP58SU7u/JxlOgKSWNo8cF3e0
	iWEICIOSMuhbapBeDj4IN+jQuk4qwzv+4xaVFGF7mxRT5OBX7e5Yb2dU0H3DH24Qi4p5s1xEKbc
	kdUtLGAe3O2TMWSAbONSkTMpivW1XQntpy9OhF5U81n53nRsDnj8KP9c2M1QdadQDcl1bHZIBAC
	50J6T8OByZGzatZwvpPmakCZtkRghoi2FbgEZGyJ+7wemlmBEqfnsHxVPEKvoRBKR0F6ayPxaOh
	WEkaFut718WkNDEWePPD/5ZbZi6/FCyPM
X-Received: by 2002:a05:6820:4b08:b0:6ab:676:7b11 with SMTP id 006d021491bc7-6b0c41b6d75mr5830264eaf.7.1786632320842;
        Thu, 13 Aug 2026 07:45:20 -0700 (PDT)
X-Received: by 2002:a05:6820:4b08:b0:6ab:676:7b11 with SMTP id 006d021491bc7-6b0c41b6d75mr5830203eaf.7.1786632320304;
        Thu, 13 Aug 2026 07:45:20 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45e65452709sm1652632fac.11.2026.08.13.07.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 07:45:19 -0700 (PDT)
Date: Thu, 13 Aug 2026 20:15:12 +0530
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com, vishnu.saini@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: hamoa-iot-evk: Add eDP display
 overlay
Message-ID: <an3YeOetvEJHE7V8@hu-anantiwa-hyd.qualcomm.com>
References: <20260806-edp_overlay_for-next-v1-0-c3aebbc81f38@oss.qualcomm.com>
 <20260806-edp_overlay_for-next-v1-1-c3aebbc81f38@oss.qualcomm.com>
 <anUgxo3BPt74Wx7K@baldur>
 <anWsrXO9RztrF5H4@hu-anantiwa-hyd.qualcomm.com>
 <anZGDietz47mE2wp@baldur>
 <anmKUoLFSDpgOjoE@hu-anantiwa-hyd.qualcomm.com>
 <annMk4RnQKl51Oug@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <annMk4RnQKl51Oug@baldur>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEwNSBTYWx0ZWRfXzFVSMWUJruZd
 hZeHif2SO81qx9Nvg50i5ty6A14tTBkcVgITnIumWYHs2k6i80bOFBHAa+7q45x/3W0OLKoztgK
 xCqmw5UmJ/nuaMjJxKEwX39p0URj/NYLz33Xg5G/H2Yh4vkb400Z4ej9h06KDVVIcxsKXvMFEjL
 HVNxAjS2W797so7UureiYKGdlc7vIexW9c29DIQ6N6obvTEHppBu4faqrpp0SkByTj/aUGT0t1k
 yXq5Hd09bTfqxN6cWHW4cK4ilLe8ztKQXizXechJWNhE/4jzxP1h99Wb+aVbNNwlW6r51jni0Cg
 Dyl08PaD9EYf+zLryvygUtohlJMz9A87fy/FPwdHKKz6ykggz0EQkvDtx3kouEuHZOsil2EWlGM
 +e9VXNOtIuO96Xg7TT5wpfmBsSLBGXLbRwRK8t9iQcEXnVijODlijp7qGBDpu4+ZexIPViy7DsN
 j2wwIXIzAtvweP7RQkw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEwNSBTYWx0ZWRfX4u6rqMbaOpRv
 VFQprSujamlUkCx96omLQotVqFU2ssXenyWMByJKExY1Ztz+p+3TCxm3P8i1Y7SKx0wmAIDjbAB
 aouVU6Ck9nSCM42GTI6ajQb4rcFDSgc=
X-Proofpoint-ORIG-GUID: Frlaif3wpszNvQkmacP-Zzldo1xJmWIB
X-Authority-Analysis: v=2.4 cv=X5Vi7mTe c=1 sm=1 tr=0 ts=6a7dd881 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=JxsENykyxGhnw_pnO58A:9 a=CjuIK1q_8ugA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: Frlaif3wpszNvQkmacP-Zzldo1xJmWIB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130105

On Mon, Aug 10, 2026 at 08:11:12AM -0500, Bjorn Andersson wrote:
> On Mon, Aug 10, 2026 at 01:52:42PM +0530, Anand Tiwari wrote:
> > On Fri, Aug 07, 2026 at 04:01:05PM -0500, Bjorn Andersson wrote:
> > > On Fri, Aug 07, 2026 at 03:30:13PM +0530, Anand Tiwari wrote:
> > > > On Thu, Aug 06, 2026 at 07:05:37PM -0500, Bjorn Andersson wrote:
> > > > > On Thu, Aug 06, 2026 at 10:01:20PM +0530, Anand Tiwari wrote:
> > > > > > Move the eDP panel configuration and related power, backlight, and pinctrl
> > > > > > nodes into a separate overlay. Keep the base DTB suitable for headless
> > > > > > variants and provide a composite DTB for headed variants.
> > > > > 
> > > > > To quote:
> > > > > https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> > > > > 
> > > > > """
> > > > > Describe your problem. Whether your patch is a one-line bug fix or 5000
> > > > > lines of a new feature, there must be an underlying problem that
> > > > > motivated you to do this work. Convince the reviewer that there is a
> > > > > problem worth fixing and that it makes sense for them to read past the
> > > > > first paragraph.
> > > > > """
> > > > > 
> > > > > In fact, I'm not even able to guess what the problem you're fixing here.
> > > > > 
> > > > > Regards,
> > > > > Bjorn
> > > > >
> > > > 
> > > > The problem is that the base device trees currently describe the eDP
> > > > display hardware unconditionally. However, Hamoa and Purwa IoT EVKs
> > > > are also available in headless variants without an eDP panel.
> > > > 
> > > > With current base DTBs, headless variants are not stable where eDP panel is not
> > > > physically connected with board and userspace is trying to use it.
> 
> If this is the configuration that is shipping, then it better be
> stable...
>

Agreed.
 
> > > > 
> > > > This series fixes the inaccurate hardware description by keeping the
> > > > base DTBs limited to hardware common to both variants and moving the
> > > > eDP-specific nodes into separate overlays. The base DTB can therefore
> > > > be used for headless variants, while the overlay is selected for
> > > > headed variants.
> > > >  
> > > 
> > > I see, then it seems your change does make sense. I don't understand why
> > > you didn't explained this in the commit message though.
> > >
> > 
> > I will update the commit msg with details, currently details added only in 
> > series cover letter. 
> > 
> > > 
> > > I further do not understand how it can be that nobody noticed that the
> > > display was missing on their Hamoa EVK during the 11 months since I
> > > merged the offending patch - this is completely unacceptable.
> > > 
> > > Regards,
> > > Bjorn
> > >
> > 
> > Internally, we have always required the eDP panel to be connected during 
> > testing. In theory, this platform is expected to have a display attached 
> > by default.
> > 1. The only difference is that the eDP connector on this board is externally
> > accessible and can be disconnected quite easily.
> > 2. Also, only the boards shipped to customers are delivered without an eDP 
> > panel attached by default, which is why this requirement exists. 
> 
> In particular since you're shipping it without display, that is the
> configuration that should be the dts (and that you should test...).
> 
> Common additional configurations can then be added as overlays - while
> the developer can add their own overlays as needed.
> 
> Regards,
> Bjorn

Agreed. The headless configuration is now the base DTS, with the eDP
nodes moved to an optional overlay. Testing is complete for both
headless and headed configurations.

