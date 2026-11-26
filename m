Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795683413;
	b=RH3qSu9AfXrgi3sQWbjchz/Yy6BApIOcRX7WqZ47hFKPlqhiG2AGn74skS7TXlbxieFD
	 Cl4mzOUlZazlKNqPWC2SB4CJHlyWM19ocXGH2nyyYvxDClxpXrW4ktFD65pLzskGxInKs
	 LJeaJq57QAP6CAEKWqSxW0kfo2rPn4fsoxM3f/+kDNqiIKIr3tguR5jrabtmZOR3gs7kl
	 C3d/QbuIOuwb/3Q+aRtuaPndJYEQZSXxpJe9FUsA8oUMj3cIfvY04Y3XCXbm7rvzAmu9g
	 Jq2mGUhvqjYo7eNCRkuZl6xt7wTlLtBuQwiZi3wRQ/w5e5PB/3wC0IyuFXrRlxbHSVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683413;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GdAeT2uzPb1MI1Dd2EoVov680FDkwR732zQnKIcOH7o=;
	b=5QbmapvywZSBmgot/xyWgRaABoAUVAj+VIqvoswd/Marl4xmRXcBEl36oM6P73lRIEW4
	 iOnw7bjC/9E9mRTq2tpo5lkzDlFR+X5eLSQ2qYEK0bSvh2KvUABWRrvHXtqZt16w28WUd
	 OM4x+xGzyixmzeKZ5De/O+OUHYVpsY2SXlWKux8jc+NzrLz6Z/Kbn9f3Xze5qpTzgLM0q
	 ptmS8tnFXt4t/62Noi2NvkYaF2pe1N1257zMmtODf+7YZfABjMokbw/822osCBdAweRry
	 RzJ2eO4kJoufaFBd8P/HMp2lXY945fg7uc4XRfKHm/AzVabY+Txtx4ROvXaoBgiWBLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BmySYio4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FS5KsC4u;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F60606A323
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 08:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93F60606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BmySYio4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FS5KsC4u
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B3hx2210825
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 08:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GdAeT2uzPb1MI1Dd2EoVov68
	0FDkwR732zQnKIcOH7o=; b=BmySYio4wd8cI0/sLlw0Wxmdt+mHmtNTeoFQ2VIV
	w+1dHvTgG7ic/V1JDSUHPkrXyovd3mFFbpHuh0Sl3/vufoeqZ0wGEsQ+NhBoa4K9
	9AyhgLwPws32CQjVixp9F/RUqEokZR5yH9mo35c5weqRDA+ZwHndNuGXHF5tRbV9
	VCMqdkwiLp5o9MbTfd/nckN17UqNIp8u+kXpXDvsOfBTrWlLY0BdA0ietklKYdDu
	rG1t/Mchoh5lAzmx99TD09kmcR/NPj/GCP6oU3Bc0vMmZ6MO/dc/iYmT38OMlNed
	2j6JweVSWDLxDL8jbDWxHEpLe1jPgSKqCB44/jlwMfUl4w==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qfa527-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 08:56:51 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-67dc4e966b5so6466787d50.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 00:56:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795683411; cv=none;
        d=google.com; s=arc-20260327;
        b=Zg7r77uQvl8c2uYBXsGakK1fnc4VOa0WUJg6ePI3Dg4QY03HN7oJcUgac2c7qH/ar+
         ncqp7mqfDs9Jt/F0zlYMfnD+s4bByiE/5U+rseEBnd3oCqhRXO/9ss/5JnSQ0QODAPuw
         JL0I76kKh0tGL3KwXM5gAKDPLL511W+UHjpZS1QTPDGUZBYudMKesT1WARFhAUPXdfIr
         g8RxBtceT2OguASYbephVHF99SstZcq75EpBSfGx7Hv5cjqguwXCAuFoNie2rtwdSj/X
         B+5e64GaEFbmybEx36yl/z8AFAXVSQUYEeKH0ra6qGrZMUJNGq96vEDQB5pCdeLYdSjJ
         6wkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GdAeT2uzPb1MI1Dd2EoVov680FDkwR732zQnKIcOH7o=;
        fh=pVdck444IKsyzRAHp5za2GhtApGTypsfufCTx1pIQjc=;
        b=Yt/wVHkbPAFSYdLVZz02o0Mnjb+m/ddzONZz9E/oMmNAQHqn/IwOOcRX+WrjEhZwdp
         /rd82OIKOs5G0zcc10sbZgwQJwSh4N7xEaZWNfGr1MMaiHVANaKwwxcxqpzVOKOGvg4l
         nK1Oqln9svUyEisam4SC3DzkZ89tTF0pFroVC6lPQyFzhjEpA2DnfOCMWjVZdaSmvHxF
         PmA92RHyFO0r1Ki1pM1s67VFBTE8C16cV2JmpQAhX/PhEzNrbSzKMJPokwXS2+qkp9lO
         oMXZo2c1Ckt5FGDQqVCk+nYarDrAs1LbBwADxeTD4zVslvAXgITqmV/uzhNHrJltVtm+
         l5+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795683411; x=1796288211; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GdAeT2uzPb1MI1Dd2EoVov680FDkwR732zQnKIcOH7o=;
        b=FS5KsC4uaNxsB8z23fHgO1q+k6nVhRWWW7JnlrhmCFXyWuK1JWM85JDnZvZ+gcyrOH
         B0zJXzEUest+MSdKZCJqOLh+tuzIC2YSUWKBK/slWdolHNDalZTaygIeZijlkYxHv3YD
         PS8ni/GVnUTv/WxEDP14AKqyqdYUBydGXTvKD/7Y7GzlUGcgLdZ98vUtLSrzQFihgKJM
         HSOwYfKndhX3uvL2Kl5ELjQyL6++gNThILvAa7SL6IAbVfZ6ZS7ST88G3is/Pnx8EJ2A
         AjwaLZdiAgt2mh7kgAEub5o37OzEDFJ5ZxKdDJKIkPphZTNiu/d6LpAFXLXjHRX9ByJJ
         cEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683411; x=1796288211;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GdAeT2uzPb1MI1Dd2EoVov680FDkwR732zQnKIcOH7o=;
        b=Tnb4c/ZAo993G+ZxMTjLdiXtZaxkVzOZ63u6SSZOkd+ag/WNX9R3I2F2WpxXl9VhnT
         j0/nwiNB/UVbDJ6OfRLimqwNZzBU2RMPtU4BsCyNj06AnKdiHIu2tGy0GG0qQnF2MydV
         QOyzVZAAjTzHGqGamnOAgpQCGUkgYP0CGaeo0GSiATdO6+0V0jYVrJscD6EKD0qAiDrK
         T6W2pcPtrfQAeRx6sbf2J2JeNKtFqjY3z60b8YpVgWSTrT3RrmXRWkIs11rPX+vIbaCj
         XtaaKw8lcvzkB6bqg290LPBP6UhDfl23+H9300tJA5IszyIMt9Kw+sR6qUGJSFbPh465
         +B8A==
X-Forwarded-Encrypted: i=1; AL+hErG4DP2hesfmQvjILxghJIwhYXob4CE/9MFH9XHRjK0z6Fliqv1lfcy3VJ2gWyP9wG3T0OZ5RC+cDzjts2ym@vger.kernel.org
X-Gm-Message-State: APuU4Z8gllS1lNR4HFaBfpdBU3/8HL0idyCXd+Lk34r9PX8/Nmc9ZSLu
	ayio1KvtS0yJu/vf7iI146UiUMxWqmp5hRUvqsrjtpQuFmdDLBTEEuM6H1iGY+vuhkmFbuOQP3g
	9rymtLzivpptkrpFB0AdyAmc2hlWOxpBnv8zfA3oEYJWb4G8SJXJeJ4OdgDs6RATG75+hIHVOv5
	sNWrAEreiLh7hFKSM+8bfMnEblY2wdfKCcsByqtIo6X6c=
X-Gm-Gg: AZFdTZdrFK3rFIEAHJatUiLZ5x9sI64uMpyNafin+XZA8mDvnSu//OxTAfc53oHY//k
	bfsSXbXzquxEDK6nZxI3JZGZyhaduu3ZK/eRcBWpHznVZ/27O21tom83yXiw2ecC7zJZqM+hvFH
	IjPniIvZquWQsj6FV9OYF22e+3bUR22iuAp5H+GNMK3IGO5L/wUPZIsV8ApsUvBnXJR4BsgYxkN
	tBSA+CD4M66oN6IIg==
X-Received: by 2002:a05:690e:4384:b0:67c:2b34:31a3 with SMTP id 956f58d0204a3-67df4499656mr4524831d50.104.1795683410375;
        Thu, 26 Nov 2026 00:56:50 -0800 (PST)
X-Received: by 2002:a05:690e:4384:b0:67c:2b34:31a3 with SMTP id
 956f58d0204a3-67df4499656mr4524823d50.104.1795683409171; Thu, 26 Nov 2026
 00:56:49 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012-wip-obbardc-soundwire-qcom-fix-port-off-by-one-v1-1-81f1a4c9c73a@oss.qualcomm.com>
 <773e7548-4f0f-442b-a737-c288b8cb582a@oss.qualcomm.com>
In-Reply-To: <773e7548-4f0f-442b-a737-c288b8cb582a@oss.qualcomm.com>
From: Chris Obbard <chris.obbard@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 08:56:38 +0000
X-Gm-Features: Aa3M54qz04OSpkfl1fvVhCmYpAObBtZsQ0kjRELJJmyBWonCoo2wb2JsmKgjWbE
Message-ID: <CAPnEM6aF98vbebMhCU6akpsoVzjS0pH5xcurmEsekWw3RF1vMw@mail.gmail.com>
Subject: Re: [PATCH] soundwire: qcom: Fix off-by-one error in port exhaustion check
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: A0g_rVcmmw4GZyRLSgZOxFyxkjm7lB-c
X-Proofpoint-GUID: A0g_rVcmmw4GZyRLSgZOxFyxkjm7lB-c
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNCBTYWx0ZWRfX6gDoVraF7XG4
 wIdDuSnuTc3SWZXzuvb4La08Qy1gkxrnzwgH0xwc8Y2QUeMtiAtXiH+dulpcBhh+bHQvehwmEcC
 tn/iOdUynI1ZW48jQ9tQyFXpAU4Qjuw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNCBTYWx0ZWRfX8ETQkY6KBf4h
 OtCsvrV9jhVVZ1AylmzMP2NncpPDeWcXn3MZW/KER1J+dKi4tqM5uGPw+uuYx1QJ+WLq/lvua5o
 3esi84jia3+/CiQPZ8rHRHeTV875gUZMQLBgB9Sds5n2HfoKaztxmsajYKDgrz9D4jnHj1fccn9
 UjLSwba1qs/+ri+1t3MlCxkLYPC/Ny8lox7/lX6qOfBlsCt5oZbg5aSbG5D54PlhFelsVJ2ahia
 oPHVmLOfF2TdlBWCZ5owo3HOYrZU2znvqHa26Hcu5Mo6qNlN2hqJXwYQfVDbnd2frvTDsxPKHF0
 WZq92G/B5xS2FOsIuyvVaMNPRS4JFcJgjEaEGEpWu2NdCxRiKuOfGNqNR3+mfC6eCnyVdYcLSCg
 SCdMBA2WTDkw+01PmN4Yq2xEbc53tNbvhgZLYgUVO4xie3T/1VbE5cDlDUrkxXMlIxa2S5uZryX
 s9XgPOBgqlhfrB9yGXg==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b07f453 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=rLSoK4kSsnz7ToN-XvQA:9
 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260034

Hey Srini,

Thanks for the review! I got some time to send a v2; it should be in
your inbox soon.

On Mon, 19 Oct 2026 at 09:10, Srinivas Kandagatla
<srinivas.kandagatla@oss.qualcomm.com> wrote:
> On 10/12/26 11:17 AM, Christopher Obbard wrote:
> > Qualcomm SoundWire master ports are indexed from 1, with bit 0 of
> > port_mask reserved. Valid port numbers therefore range from 1 to
> > maxport.
> >
> > Commit 6ccec91c3535 ("soundwire: qcom: Fix port exhaustion check in
> > stream_alloc_ports") changed the port exhaustion check from
> > pn > maxport to pn >= maxport which rejects the last valid port.
> >
> > On RB3gen2 (QCS6490), two WSA883x speaker amplifiers are connected
> > to swr2, which has 8 ports. Each amplifier uses one port for playback
> > and another for voltage and current sensing. The right amplifier's
> > VISENSE port is mapped to master port 8, which is rejected by the new
> > check.
> >
> > Since all ports in a SoundWire stream are allocated together during
> > hw_params, this causes the stream to fail with:
> >
> >     qcom-soundwire 3250000.soundwire: All ports busy
> >
> > The codec DMA backend then returns -EBUSY, preventing speaker playback.
> > Disabling VISENSE works around the issue but also disables speaker
> > protection.
> This comment is incorrect, we do not have speaker protection enabled on
> any of the devices.

Thanks; I've reworded this in v2. This bug was found while testing
AudioReach userspace on
RB3gen2; Speaker protection isn't (yet!) enabled in upstream, but with
AudioReach userspace PAL mixer
paths enable VISENSE on every speaker stream, so playback fails unless
VISENSE is disabled.

> >
> > The original fix addressed an exhaustion check that could never
> > trigger because find_first_zero_bit() returns maxport when all
> > searched bits are set. Include the reserved bit 0 in the search so
> > exhaustion returns maxport + 1 and restore the pn > maxport check.
> >
> > Fixes: 6ccec91c3535 ("soundwire: qcom: Fix port exhaustion check in stream_alloc_ports")
> Cc Stable and Reported-by missing

Added Cc Stable. I found the bug when testing the AudioReach stack so
no Reported-by is needed...


> > Signed-off-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>
> > ---
> >  drivers/soundwire/qcom.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> > index 6e0c5fb10efad..b4ce96792fa94 100644
> > --- a/drivers/soundwire/qcom.c
> > +++ b/drivers/soundwire/qcom.c
> > @@ -1348,9 +1348,9 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
> >                               if (m_port)
> >                                       pn = m_port;
> >                               else
> > -                                     pn = find_first_zero_bit(port_mask, maxport);
> > +                                     pn = find_first_zero_bit(port_mask, maxport + 1);
> thanks for adding this case, rb3gen2 should not hit this anyway.

It does with AudioReach userspace, which reads the VISENSE port :-).

> >
> > -                             if (pn >= maxport) {
> > +                             if (pn > maxport) {
> >                                       dev_err(ctrl->dev, "All ports busy\n");
> >                                       return -EBUSY;
> >                               }
> >
>
> Once those are fixed,
>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

I didn't add your R-b as I would like a review of v2. Hope that's OK.


Cheers!


Chris
