Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BBB3B3C12
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 Oct 2026 15:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791127600; cv=none; b=A45oo5le/y95yyV0GwTVFNT0AFYcEAG2aM+ztROgW6XVfN0wIcol3Aqq23gWFut8O1p2jO6J/APNaqAdRWXdZO8FI1ZKk5M++bw9iJBP7t5Clhq3z6ZRTniAAYhlHmeeLtneExLRu4ZuHwy4LOJfqZSZAAoHWHI72Mawat/2E+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791127600; c=relaxed/simple;
	bh=2ch5mNrtmdxQSOSuWG7L73peId4LUbCNr87Fa7anJjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cOIVv7edQNEgV440TlRQTZrv+x7OEc1St+uAuqd2WAiFgs1ByTQX5WJTpGl1u3Pk/CaBU3i+0X7Sx5S5DuYZ3unkPW/QmXsyLilZbKNdt3uDbfXuIaxhs0VQyoyE9pa4RXSFwys3NhxQGMH7LpQJUNBBhozFQ1kTRhfcevkDjp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n9J14xJJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eQ+QWdGS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n9J14xJJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eQ+QWdGS"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 694EdrFX3439111
	for <linux-arm-msm@vger.kernel.org>; Sun, 4 Oct 2026 15:26:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=At3ebrOXbtof0F5P/wwaDdSx
	0o6qxJSpe5weBws8clA=; b=n9J14xJJN1lWY7nq48Qr6iqgFLhmCX0YPV32RQii
	eWSplHy/WAEVZLxezJ5V5sIob28dYHxEyb9EHDSzB/fmXetCV6wRc68ROQkqDVo1
	md6g7n8mvu+/GyfN2iz52C0o7IiuWYCXWJJEoAbLRyhHZlj1qyXFr+KxTsvoPOM6
	Nei2sgYnKkVolyOapJKnya6W9uLEus9iCq6rfTHh4iAXXKwvXC2Zj37cNHALWh48
	eYMnOwtCPSPxRfdhngAdaNyKSfs4A0I4Qtd3kBvNfUlXH1fXnKbej2+aQGpo5YRH
	kI/lS0e+AhsZTgX52U3jhOsNdk/XAxhXJMenL8nM1lnanw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sx3384v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 04 Oct 2026 15:26:38 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34ef5fd7934so3018917eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Oct 2026 08:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791127598; x=1791732398; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=At3ebrOXbtof0F5P/wwaDdSx0o6qxJSpe5weBws8clA=;
        b=eQ+QWdGS2VxDTgJrtGzzWacfkZZ7PPnZPXew0OkSXmj/5p1tThwxSKbd87R6XnA+Nu
         J7eq7M2H0CLuaJQ9jH6BOwdjizfCySmaSeXJLqVmKSULwlW4LA0WUBfjNmlT3XYaN3qy
         clOiB4ZVS+I+37XGBDhxduTnuhHRIouCPVLzIbiZ1h352Ixtn1ylZNni4SYZCYi45X52
         sjc4QM3rCqBN0iYmmLaSBi7RyDeW7CBc1I2/sxS1N+fYFJEW1hRKdbEamGuOEU9rIKq8
         3vj2n1LGUyJvrjL0JyeHtXO/q3nXjQdMJ1alb+jgtHUeLNjD85vPAHHngXl/8Ud833Am
         b8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791127598; x=1791732398;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=At3ebrOXbtof0F5P/wwaDdSx0o6qxJSpe5weBws8clA=;
        b=tZyVnuM9MxSPb2S8esKnLiFD1bIDjgftHHD73riIZbatOXNpwN1FGtIeSaAzm21KRm
         yG/Q2cgR9fI0WgzlyODBPsH4DbnahxEx6V9LgLKYTyyYWMu4tHsah8D0xufVcJhNyIJ3
         GapOBPot+R13k/Sz54p6B6ocHi8MCBJMMN1kPAvDOzdMtuc+Eny0vw4TjKmR9el6bJD/
         97fmgXRnG1j0n4cFzkg14y6g0X7VoOQTuNOfq5WF6Jr9LZf6/Y7A2eAGfbDfrBGReMUg
         ytf42RVPJ3HrRPnjW2xoMaeKrbRbaxHEHrsATGlf+77iA1JpW22VyGEQORB4CN5i0Wn1
         EOgA==
X-Forwarded-Encrypted: i=1; AKwUvBxhUglw6a6VErp9bfQtdreAbLHhdZIzaYvhd1bY7JSa+RLO3xX9d8lJC9BFZdcPcfsdwxvkbE38imilNIqS@vger.kernel.org
X-Gm-Message-State: AFq9FYLpjPq3540kYUJqg8onXGsme4KdXGO8vjuMerXtgBpgDRrUSqzT
	o7SB+PipkTL9b6Uswhp5zjno+0G+b6jVjbnjZ1rQRcLyg/TclCTT9qagpcolxXpYNcfu+9T1g6t
	CBrZt4LQf8KyUfbnRKP79TCUWMjoIdJCVOLT61rqjSO/WiXqWzNC9hm6WIX8ZB3J0yiya
X-Gm-Gg: AYBFou1VMh9ljYwnUja38gU4hQjSuP8yMjOGYlOp5bVy0kA7CMvbO/QQ9jujEuyfo+9
	h8EoV5RkV6TwJoE+8HshG27MXEG3IpMuKyqeXLmdzomA2drNVruIH3YQgIYbEiA81GC6GEDLVC4
	tbJTbav47H12N/HqcCraJ4aZf8DO7vfXNBXXr3IESaXs4fgTOW9NPrqmxf2tg1R9G1kX/Z7sac8
	vvyWMl6JRB9ZPAz9AyRRmoBeIXFwzVIX8pxYhakVFfXWvV12cmt+sIgT1mF6hblEVJ6tyBcXSVR
	A3IlhtpOGgelVRK0z/VqffRhmzWAU45Bo+tg/uia6qfNCbqx//K/jAr21Or8XRy8A8ejoZSwYFu
	Wb7oayRJWs0h/StLDp5KCesaudznyk5d+4xZVk9LNNA==
X-Received: by 2002:a05:693c:88dc:20b0:351:985:e729 with SMTP id 5a478bee46e88-35109953237mr8368019eec.12.1791127597003;
        Sun, 04 Oct 2026 08:26:37 -0700 (PDT)
X-Received: by 2002:a05:693c:88dc:20b0:351:985:e729 with SMTP id 5a478bee46e88-35109953237mr8367993eec.12.1791127596447;
        Sun, 04 Oct 2026 08:26:36 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3512713c9a6sm5600553eec.5.2026.10.04.08.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 08:26:35 -0700 (PDT)
Date: Sun, 4 Oct 2026 23:26:31 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom_q6v5_pas: Drop early_boot flag for Nord
 ADSP
Message-ID: <asJwJ6cq8FcA0IID@QCOM-aGQu4IUr3Y>
References: <20260930020745.1940933-1-shengchao.guo@oss.qualcomm.com>
 <58c1c4a9-afad-4059-ba81-cdcc92d0c5dd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58c1c4a9-afad-4059-ba81-cdcc92d0c5dd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=JY0pPkKV c=1 sm=1 tr=0 ts=6ac2702e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=NTnRRJcS9uFvT1zYgXQA:9
 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: KPU1vGxN2OFqZ3fg_RrzFZloHSmfPrxR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA0MDA2MSBTYWx0ZWRfXyhSN+EsZARLi
 3lP6G+gMK69ZXfhjzPOIILof/YuVfOmwT3oaXk497z2CwKtMAiH4mGnEEPrZS6pu/x9VV/WFOeq
 F8guRBL5xbNLfqPyOU0oVBXVtnguwWo=
X-Proofpoint-GUID: KPU1vGxN2OFqZ3fg_RrzFZloHSmfPrxR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA0MDA2MSBTYWx0ZWRfX0Jw3ORPOJZBm
 unp8aZQvzGSE4jsuqilCm+8mgdO87ErT4RdoxYv8NrH9z/zb8d/NEOSgQHPGkfT3Spf0w8klF4m
 CsrGhi+wFaDlN/4bzDt/wAok2N7KznfmGh8jIKlyjc+doA25w7t6GqrUAgUzkBZbE1BWusthDqI
 XhD5jGf6IQxtLc+SbNzBe9AjUN8mi76Y4BRDpqMIBtXUD/8KGs+lZo0dewwb5Xqrhf8bxk2Rc7B
 72ka/TvI+J3Otfw948fOZq5jFL4DUkicGIVZRnDOQbNmZaGD6jv3e3aR4CW3ezVqEytH9UvTZpL
 hmApLgFGSRp1d0ZkdLzpw1guZ4nN2VaESv/Hri63R6fOkXXL0VeJ61XKdAPEFp6E/uMauG0BOc2
 bDnwmu+5A1y3eWuAm/yGcnrYa85bricvOd+fBQ7G/8kAJi3b5X/6xiANJomFpJ0epx7Uhlu3+pj
 ZqsRl7oAb3V5pMTYcMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-04_04,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610040061

On Thu, Oct 01, 2026 at 10:42:39AM +0200, Konrad Dybcio wrote:
> On 9/30/26 4:07 AM, Shawn Guo wrote:
> > Qualcomm NHLOS team changes XBL for Nord IOT/Embedded variant, leaving
> > ADSP to be powered up by Linux remoteproc, so that Nord IQ10 Qualcomm
> > Linux (QLI) behavior gets aligned with IQ8/9. Drop early_boot flag from
> > Nord ADSP for that purpose.
> > 
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> What happens if this patch is absent?

ADSP never comes up:

  remoteproc remoteproc0: attaching to adsp
  remoteproc remoteproc0: can't attach to rproc adsp: -19

Since XBL no longer boots ADSP, the remote never publishes its SMP2P
inbound item. The smp2p entry stays unmapped, and irq_get_irqchip_state()
on fatal_irq returns -ENODEV. qcom_pas_attach() treats that as a hard
error rather than falling back to a firmware boot.

Even the existing fallback (ready bit clear -> RPROC_OFFLINE) doesn't
work: rproc_boot() takes the attach branch, sees the error and returns
without loading firmware.

> 
> When the early_boot path was first introduced I was really hoping
> that this behavior could be made unconditional and Linux would
> figure out if the rproc may be active by virtue of it sending
> back signals or not, unfortunately that hasn't made it into the
> tree..

The difficulty is with the positive signal. As Stephan pointed out [1],
the ready bit is not cleared when the remote is stopped or force-shutdown,
so a stop followed by rmmod/modprobe of qcom_q6v5_pas makes the driver
attach to a remote that is not running. Without ping-pong or a PAS query
for the remote state, I don't think we can reliably say that a remote
*is* running.

The negative signal is reliable though. The -ENODEV from
irq_get_irqchip_state() means the remote has never populated its SMP2P
entry since cold boot, so it cannot be running. We can fall back to a
firmware boot in that case. early_boot then becomes a hint that the
bootloader *may* have started the remote, which matches Nord ADSP:
it is started by XBL on the Auto variant and by Linux remoteproc on
the IoT variant.

I'll drop this patch and send two patches instead:

- remoteproc: core: continue to the firmware boot path when .attach()
  leaves the rproc in RPROC_OFFLINE
- remoteproc: qcom: pas: treat -ENODEV from the SMP2P state read as
  "not running" and fall back to start

With those, Nord ADSP keeps early_boot and I've tested it with both XBL
variants. With the old XBL it attaches as before; with the new one
it falls back to loading firmware.

Shawn

[1] https://lore.kernel.org/all/ahBG6jKYdSAboWjs@linaro.org/
