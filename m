Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D1648FF71
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 09:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588315; cv=pass; b=g7KkkySv3XRYgMig+r9uSBU03fRWMsb2HKLPU21R8BZWkGB/6AI0uKESOj7k7NfztxrLm3e7DWYio67Xg3elJI/rfV47qjiahPDYMq/FnR+P2QTqOa/StpCVuU7+vfQROGMsuT90madIh6uuCTBrDqkbkIRmKLS92Cm3M9ILTxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588315; c=relaxed/simple;
	bh=/RX3rQHRs9PtVs0cxd9dcGbugZQcOH3eLVd4N7Lge0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jUkaZRVjLfTM9v+7ermmMoBQ8OLdtPz2lhTTJNbWkMFem75BVmkJPOLFA8Qy1SWhIiTejxZP4Yuj6G1HoYGg2XmCQCBtZuuvILhcS3a4wNR0jnRdlM7VK5WZQ1QrW4OiWxfWWcEhS8zYd8x5sPBH6eu5b0o5xk7frWmiZS8gEOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kwJD3Va0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bxj/cd3e; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kwJD3Va0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bxj/cd3e"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9M43E322562
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 09:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BPiJa4wM+ql2ke3koOa4WOH6
	Ghoz+qC0PRzupT+f3yw=; b=kwJD3Va0p6p5enT0D3F3QW2FS+/bFJnN68ccCr9W
	Q+1+DSMYW14B0hTklTg+c6mDONXWr4OqWLfUVM8argAU8VcezIUI0s5s3ABCtsgP
	bl2b++U5ziLih/EyXrczhdYME3yJAb1iAzf0tOm6U6Vrrt/v5kqqgIrh4z/X8N92
	RUqjIOBDLzA+opLFdf14PxwCBCBAkHw4grj7VjPBka3UBeqJUZV9QKgoI7KIWfl6
	E8hOANSrM3RyFLSDLlmvArez18dtXrYQMLjF6JlKY1Qk3pxWwKjs/1t4A9KeERzC
	Jxh1k2i9CWC1SbHAz60ALxd2Pl8gJ5wdQdfHLrQfnSlppg==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyebq1gwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 09:38:32 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-892be308686so34766207b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 02:38:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790588312; cv=none;
        d=google.com; s=arc-20260327;
        b=GAJATTQ7LdfIrteHIqICJEMiGcZFekWSfjCUN2NO6WPiY4/CmoC6gyk9HoY9DYTftz
         +aO9MSjhicJUslSPSpdL3XTubhRAM6b4v7p7ghkgN78vmzj1cVZGpSrmwXFEQFWxvFMt
         WReNX/C+bwhnFeHfq0e/Urj/ecCiuv7mHxVC6gbGvLv9MJbTf8A18hHhs+gSMHkXnR6u
         uEWHdKtNGrcudkJWuqIhHxQTsOFzybr401WDJadJrCcWxzTflmsEp2euleZaqVsKedgY
         XqI26iI9agyp1YqkmLXuUXjvz+/CDJSapbZLlcr7GlZAbTAndV6A5bHtQfSkZ6Xv2iGZ
         XRhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BPiJa4wM+ql2ke3koOa4WOH6Ghoz+qC0PRzupT+f3yw=;
        fh=C8sG8wRT66qmcEycnwlcFiCLP/mtyo0RsQOovQbH8sg=;
        b=eE1IJ8MQy6EZerrL/bkk+AF+l87UtjWjeeX4Q2Am/hTnGj4+WLaT9HvyJKonYJaG6A
         KN0WRt3vaVUhf2LFeRqbCpnFnQK/tiNAk0uIQZMyS7KzZOmjCrvDnI5br/yF4udUDUAP
         KZYNNS65RUvQ4O713pD3Lm5MZoTTvOOm8uSv9RV6L3Kb0kyTT2MXumEZChB3Hl1Pf5Jk
         MJg+UOOpdrFP0YeAbTMZ+DaEzk+9ZilDIUKihvo1OIlcBB4VVTboF88bh7qe+pMQprg4
         xZ0WvCplhu2oY9+yUdus81fn9wt0k6aGWYmUAYNqpguWmOMRZcVlCpJimdGJnaHc88gJ
         97WQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790588312; x=1791193112; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BPiJa4wM+ql2ke3koOa4WOH6Ghoz+qC0PRzupT+f3yw=;
        b=Bxj/cd3e11QO/RButch5Czc30+iQc4YBze6Xa1XufUwLBohcfiocW1+Cd3JCwDjMbs
         XTiKKrase7Efj5wCi1irQgSaKEttPeLRnDDz9wBZf8N/tYj2psfr98BwWCralCECJ9eG
         i+yzTF39+OjyG0IBDYZokRVXf25OzXVZXQk9xGqRC19bsRlUrdt4e7KDCShZHo6oE+4N
         CqX7SYu0C0yJ0AsihW/SaLq/mba4+x56sh0DxlsATAI16yrsJbF2vvUqHKgQsGgkxuf8
         4F7aaEkkY/8mgK8A0PU9POFp9zC61JVXLY4cuvr+v6WpIfOLjseg+diAnqumiOHNFLjU
         dkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790588312; x=1791193112;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BPiJa4wM+ql2ke3koOa4WOH6Ghoz+qC0PRzupT+f3yw=;
        b=YoWZaR+pFsQBUYaVJpok/zV/vhiLYzlpQlMHlO8r/vkVxz08VNuqlvNz9epVfpBIfK
         kg1y0tlJcVUCVDshfLl/vCSd8QgUJ+vVpAEsthNvRhMtpQbAvMNhUppUiYsazLvm1pZ6
         L3agEsE+uQD3JDExEwMVQmIauK8oLKr1WEHiFwUc5kMUq+pggznTvFxE6IVrPmKVe0hW
         5gBc3StITAk/yvAzMMAHFxWCUAd12T94zscBF5DYsukICjwMeHwa05C+1hlnDXbSMf7G
         r2KhugjyKqqXjY72KNOJvOCN5JNQcpc9x/RPm+eZC2rIMygXHd6JFsRjiax1wX+knNiC
         Zs9g==
X-Forwarded-Encrypted: i=1; AKwUvBxjPkSsKSwip7irHL8WLxq2XqbnO07PVMka2k4bINiaqYtcIca9yJDROp+y7V9kmSoj/No/Aanxe4tcJc68@vger.kernel.org
X-Gm-Message-State: AFq9FYIgihx5/rJri4c2TGIpmboVTpuPxW3vG7gMRhadbuV3tItTM9DJ
	jgOtmuBeHm572adLlUCkRO5WKShAHYwjqWVCFbrHix+nHKG14qItUpnK3naIkidvN5QCmfg/4e7
	QvKFFhNTdfSUZ4EF5yXpCNAb461v9If9zM1PsvWYb8oA+jqEwj+oGxfiHpkzFToQl+x3IC/+XtT
	SiZhMKViCj7dFTja2DwTGEvnS9rOx7wa/J8wFJkUCpXEg=
X-Gm-Gg: AYBFou1C5CQiaEyRIrkqfUgoL/F70GlPSkuHxFWLcBUTxzoQMQfLynw1nghSZ9xxZiT
	SVcF4wQrRVG4153PCf4qYjaxrsmW9YzNNHEICSWaHG9D5y3yw14qfFPoe3nOWbdRaBX66GCO8db
	Ln4DCbeu5FrCqzcq2Ss071yJCDivz+cv6LFmSRKXBMmEoCw51o3KCgQuq+gUI=
X-Received: by 2002:a05:690c:92:b0:89a:63da:cbe3 with SMTP id 00721157ae682-8a649f6fd99mr67447717b3.41.1790588311794;
        Mon, 28 Sep 2026 02:38:31 -0700 (PDT)
X-Received: by 2002:a05:690c:92:b0:89a:63da:cbe3 with SMTP id
 00721157ae682-8a649f6fd99mr67447477b3.41.1790588311305; Mon, 28 Sep 2026
 02:38:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-b4-qaif-shikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com>
 <20260923-b4-qaif-shikra-audio-v7-4-d5b6f056568e@oss.qualcomm.com> <arOe2yA4KOvhYqRb@sirena.co.uk>
In-Reply-To: <arOe2yA4KOvhYqRb@sirena.co.uk>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 15:08:19 +0530
X-Gm-Features: AclHuK8ozZ4LOVya0q4te54vm9li9qjkifPcUO5lK9UE0weRjOvI69Wxbge_Uuk
Message-ID: <CAC-tS8ASR899SH45=mbr+8z6xcOBoRgYJWXfXXER9CUXdYCOrw@mail.gmail.com>
Subject: Re: [PATCH v7 04/10] ASoC: qcom: Add QAIF CPU DAI ops, regmap, DT
 parsing and platform init
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: v_42JGXRiR9DaL7oDShbtzGSdRKgoXGm
X-Proofpoint-GUID: v_42JGXRiR9DaL7oDShbtzGSdRKgoXGm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzOCBTYWx0ZWRfX0BGx4AbnL5to
 EHZ33zFcOxc6s3dK/2na7+cr3yLbOb6IiYvqeCqCaDyVAEP8a/OcfyyTqGTD60Jivb/p+5P6Nc2
 LGW5hRfPlftGhZB+6lUZ/sblHmt2+P4=
X-Authority-Analysis: v=2.4 cv=EqRHPicA c=1 sm=1 tr=0 ts=6aba3598 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=RlkvObwyMWO3Bv68wiAA:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzOCBTYWx0ZWRfX1kgUUPN9zDHi
 7jQW17NUcWukye9iER2SuYChsbj76gvwt3zKWU7jlcVOjbYnHnqgtL8rMqooOJhS9mqg+mU4tgo
 qeNe0SnXIoxlcRRBe5+GNDjG8TTA3NeLYFwOTGuM5SweS4jTWLbgyZIRxlr2oV6PXM1aMOiyg4Y
 /6LGi9YVq8ij8zxppJR2nhkb+jfWfKkk3WwzsaWX1MMlkB8SRw51Wl6vtgqbp85UQfxocSGxfPa
 Zx2SZCoJrTvoWbNxBL44NKUPabhmNoez7GLtcpYOq57Ra4t6mvawBEIjyF6S8ILE83tZ+m/5b+Z
 265idXuAovsK2/pcUoTdeFMDqQ2ClOPPRuks86r5hs3BomzrNtKPxSy2rSQimFFH5nYFNfntJl6
 bU0T2ggmI2+bVIJnE48/StYw6waY5bJYmk54mnasrpq/+pLuxfhfuCtm4rGaKwa4PMCuOWuLIzh
 pGB3/yFXxv3tCcj3ZSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280038

>
> > +     /*
> > +      * The sync, lane and frame configuration and the MI2S bit clock are
> > +      * shared by both directions of an AIF. Concurrent playback and
> > +      * capture on the same interface are therefore expected to use a
> > +      * compatible format, rate and slot configuration.
> > +      */
>
> What enforces this?
Both directions share the bit clock and slot width, so rate and sample
bits must match on concurrent streams. Would adding symmetric_rate and
symmetric_sample_bits to the AIF DAI entries work?


> > +             case SND_SOC_DAIFMT_I2S:
> > +                     cfg->sync_mode = QAIF_AIF_SYNC_MODE_LONG;
> > +                     cfg->sync_delay = QAIF_AIF_SYNC_DELAY_ONE;
> > +                     cfg->invert_sync = true;
> > +                     break;
>
> Does this line up with the clock inversion in set_fmt()?
invert_sync for I2S is set at probe via DT parse but the INV_MASK
switch in set_fmt() could incorrectly clear it. Will fix it in the
next version.
-Harendra
