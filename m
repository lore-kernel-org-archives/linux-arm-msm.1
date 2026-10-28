Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793170687;
	b=dyfSaffe3MHlpAYiIbvP3tqPIxD2kGazU8H4QffmqVCf4eSLdt4D4Ty3cXUOAN7jgIj2
	 v/zdM9J4gsJkclkeNaq0iIa91sK/m83zF2oxqs9ocrLlQt7EaFGfq0vJMOpCWQi5bABok
	 zkqsICfBdsZgx/ErY/NfjE9WnmxcW8QLBWD68FFDZCq8pIQ2qaDrx+GElz/pYiSO2YnVn
	 +Rt/WyZaPSaqvXBLtSh5DiQy5ic0PTm+d3sKKW3gW87WUVBM9n1ejx3/Jdk3ZRA3P88kG
	 mz7PyDRcARdEclDnk4a69gsuEmc5SGkXCWvoS1D1gFhQD50heq4npKa2EwSHun4zj/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793170687;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VS4ShSLAanyAlY38ZoVAMSYpmnLuMlS7SrKkEO8Ofbc=;
	b=mH4i/8/evtQtzj2WbvH0bEc2Q685WgLZ4VXYZrVYkBT5mUO8iAtOw7NUxbbnqfStch+K
	 GZyscVeERuFMulZOKbIdFtKi2vXa3448sKIGsscnDuQMD23cbtjF6ht5/qnUccKDa8tNU
	 4kRUez5y3reR69wPzeJPvei6ht9K6LL1KYNU1Ij5xvobD60gDVMA6D5j+v7u394PPHX+b
	 uTgFtEUMGjwOq45p1/0CJDreO02is1pnmFfObBieaLyxrZkMhRpnPy+kN/9Arwqg5f0OM
	 rBI6Z4V31f53BlVqpruHEqUDBsJYxm9KpgSRiVobImwdIgEO1evEUgRPthxXMIrFEaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="MXaB/cCe";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AF0w4NsU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836A9606A31D
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 06:58:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 836A9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MXaB/cCe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AF0w4NsU
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S6AaA2327544
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 06:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VS4ShSLAanyAlY38ZoVAMSYp
	mnLuMlS7SrKkEO8Ofbc=; b=MXaB/cCeoa8z7lcXWEwFcT54n4jHwDc2FfCH/jPu
	OiVrTiiaaZ+kN2LfxvVlH+19lnuvPWtuIO2Gylt8CCbu0xc9v9LSgZ2jccGzgN84
	egRnqwvdcMX6WcpSrHIraLbXMt1RzWEPjlQUq3gl0V0lEvP6MksuPrQtxhNUp/wv
	A4ooLS+/BBXIZLQhNpifBQ4szM10JsmzM29F7rEOqm0+AcwY1mZm9hOLcjQCN/e8
	KOupPxqwEc82iuXm0zvxStbn8sxmhtGos6S3GyswTnBCsD2SZnbRERsz4xwVisFP
	rkFQTseKu3MaoPN/03+88nbF7Msbxqa8T8jicchrxJxtrg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhw856f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 06:58:05 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so1384398eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 23:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793170685; x=1793775485; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VS4ShSLAanyAlY38ZoVAMSYpmnLuMlS7SrKkEO8Ofbc=;
        b=AF0w4NsUBWpIfF8a+5amDpzeJIDDVdHmu7TpxmBQRP6KLrL50Fe5PPsq0+JliFx02F
         IEELY5N/Z7dPTsyCKlc3XqBSaE0CEBZyzKZ31OlpxrZJjVolRCbYxKMieVvZQDDMCqCU
         Zulkw6HcUEpnBmZwTTuXSbPKOE8WAWYLd0z4tmwjmwU1fwHGuGTFgWaIxmX/ziDWqsom
         QF3HceD6hJkHBU6I5+jz8QObcIyfI8YwYS3WoO/6O+TO1qfO4tmeRED6N16arf6oaGl7
         BFnYOYF1rQv0sagAjf98hJls5iPKyPc88duJJLoc7qrbOQCVS42ZQyW5zv4a3Z97IT9F
         Ul3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793170685; x=1793775485;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VS4ShSLAanyAlY38ZoVAMSYpmnLuMlS7SrKkEO8Ofbc=;
        b=eOIsg6YJaSdaodyEqWibH7OAPrWXahJD1zU080g4uPVfMjX8WEVq6lpDr+ks3wtYpx
         s/u3BQP1Zxc394O2oQ4MvQ97WPpE/eEb5GFWdFak3fq/cXDlI/WMcj8Yz240rrM9KWCP
         DSflnl0sZVo2P85LowpqBHGa+PBVrbYLSYrCNCKYdU2v8ZEDy7JRkeC1tm42Eh+FjTRH
         YJJ39jxsRbtHshsWaWeAmw4+HO7F+jHezpWAR5hgmNPwkLf7VGBg9LD0Kv+wtYalzQDQ
         oJoOoF9aM2L1/V3J7AL2U/gMDNwtb7sLRtfrPBUdXMOQMNCQ26rr93iUzIs5x1PwbyLM
         AQfQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+BCWqMbCaSsQIeoYRbdGYCh/2jmGq3wwAULiIaCrZl94F7CzwlLoHRfMYVN3dAXbhj5GFUbXOk87IGhGd@vger.kernel.org
X-Gm-Message-State: AFq9FYJwvHAOkmKDOL7AoHtI00D0tPekQUBLjIsv8Ou5WsGZ8axyAgAR
	HWj5e2Am/1vsbWC3MImo9UF7Fx5/vEGIG9+ZGAwgmIjijyBE1LX7uf3JInlzeulUPvc4JI9YHXf
	IWSD05Bx3Ylxi7lcijajdw1T7NpoF9gmY+JfyjpRiHCQnB5Z7+CbbLiaexw2er4nVgOBM
X-Gm-Gg: AYBFou0FdV+LxeYITjpx506S0QWGMNPCsDCf5Ig2b017rWFTiVLsOJ+s757meswRcII
	Eyhhnda3vXw9NW8/lpyMBEpoOhkd+ft3SYrQ+0GHfwWzCHhBpmpvbz0CAoT1OiRKhTy9O6j65IO
	LLHg8wZ6DqGkvZf/lFC3PYEkv+UrfynLKPZoi5RF2fQJEcHBzs3mBya/RfeEinKpe6bGh/Rhr/o
	bpwe1AT6L8mC2bQVplTgQ4FUnWjgeB2UXNDMnat1XNUgdEjF0217u7/fjQ0CPBonJX8z/o+2gTe
	DXx92v591YK2RjavXSHCPew7anQSfo7+NI371XRNL6aP8+oZ9i9g/72Ic0QIIBmLdZ48Bd87+Av
	ghUz3DONBTRuC+fPdwGjpnfljxjqsOvcTzYFe8xiWJCxbwqzNF0HcUgv00ev/wvGc7ss/DC7fC0
	SnTRTillyajDcm0Z4=
X-Received: by 2002:a05:701b:2302:b0:1a1:8974:593f with SMTP id a92af1059eb24-1a6cf447ae3mr1772958c88.30.1793170684818;
        Tue, 27 Oct 2026 23:58:04 -0700 (PDT)
X-Received: by 2002:a05:701b:2302:b0:1a1:8974:593f with SMTP id a92af1059eb24-1a6cf447ae3mr1772941c88.30.1793170684236;
        Tue, 27 Oct 2026 23:58:04 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75f143cacsm2786314c88.16.2026.10.27.23.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 23:58:03 -0700 (PDT)
Date: Wed, 28 Oct 2026 14:57:59 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v4 1/4] gpio: shared-proxy: Fix race between concurrent
 first users
Message-ID: <auGc974DsKIskR_6@QCOM-aGQu4IUr3Y>
References: <20261017043605.1503563-1-shengchao.guo@oss.qualcomm.com>
 <20261017043605.1503563-2-shengchao.guo@oss.qualcomm.com>
 <CAMRc=MeiENro-ivDkve5Y8C8aVKsPyR8x+Nd6gC5h_fn4ZKoPg@mail.gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeiENro-ivDkve5Y8C8aVKsPyR8x+Nd6gC5h_fn4ZKoPg@mail.gmail.com>
X-Proofpoint-GUID: cZ7Lc4udzUamKiYi1DT2FVo75F9T6mwR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAyNyBTYWx0ZWRfX2JwAi6hqwwc8
 DlMceLzs1JCNqm4ec06EuqaP0+Jpwwy16iHxGHYV7K6id1CJEUOQhsAnlr9D+EYb8bLUka878zh
 37f3A4S3KzllnlKbzOJjSMJ2K1llgJk=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae19cfd cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=wNbXBFNNolHxpcFWyUcA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: cZ7Lc4udzUamKiYi1DT2FVo75F9T6mwR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAyNyBTYWx0ZWRfXwoMYN1DlPn3A
 II4TcuEkrtE8PWCAy39noUgmTZyZ6IZPs5o3L32cqyWeStg3i+9bvPjkJ0zdyxQEzEYLmCrPVz7
 bQvDke2wZyhk5O/puLk1PW4yUq21XYaUquCBrL2Wsdy6Z2o5+G6HYUy/gOi7hOqNrva+wsUE+9h
 O0B7Tj7R/9Zx13e1eTjhcxemRsx4HnkY2P7yDLffLX962f1zz6Y5aW8imDDsPU0hsMDQ1I7w5HY
 lbzU4S8ERkArqxX2ETeOKiqn8GHwcB1+mW5oUpjMbLD5OwY0QNbADvyoHbhAek+yFfyvSIIDGKe
 q4N2HSnf88FV0H8sLzrwX6VwvO3/m8rHeSaEFq4FZH6WwO7LOPbEKwSO1h+XA9ouYugPPGY8oPB
 ondGZP9GQx5A4osK95e7kxN446Nd/+Ik9v8FkF3UE9+oxCZNUbzsyosKQYoNTOwSB76HLB9V5LK
 RR/B+4i06f2boIzXGzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280027

On Tue, Oct 20, 2026 at 11:06:23AM +0100, Bartosz Golaszewski wrote:
> On Sat, 17 Oct 2026 06:36:02 +0200, Shawn Guo
> <shengchao.guo@oss.qualcomm.com> said:
> > The proxy lets a consumer set the line direction and reset the
> > default value and vote tally only when usecnt == 1, i.e. when it is
> > the sole requester. But request() and direction_output() take the
> > descriptor mutex separately. When two consumers probe concurrently,
> > both request the line before either configures it, both see
> > usecnt == 2, both fall into the shared path, read back the still
> > unconfigured direction (input) and fail with -EPERM.
> >
> > On Nord RRD the two DAC supplies are reg-fixed-voltage regulators
> > sharing tlmm GPIO 41. They probe asynchronously and intermittently
> > both fail, leaving the codecs without supplies:
> >
> >   reg-fixed-voltage regulator-3p3-dac: setup of GPIO (default) failed: -1
> >   reg-fixed-voltage regulator-5p0-dac: setup of GPIO (default) failed: -1
> >
> > Requesting the line is not evidence that a consumer has claimed it.
> > Instead, count proxies that have actually configured the line (set its
> > direction or voted for a value) in a new cfgcnt, with a per-proxy
> > configured flag, and allow (re)initialization only while no other
> > proxy has done so. A consumer obtained with GPIOD_ASIS that votes via
> > gpiod_set_value() without ever setting the direction counts as
> > configured, so a later user can never reset def_val/votecnt behind its
> > vote. The count is dropped when the proxy frees the line.
> >
> > Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
> > Assisted-by: LLM
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >  drivers/gpio/gpio-shared-proxy.c | 74 ++++++++++++++++++++++++++++----
> >  drivers/gpio/gpiolib-shared.h    |  1 +
> >  2 files changed, 66 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
> > index bc69b8729d19..0d1d724a6a37 100644
> > --- a/drivers/gpio/gpio-shared-proxy.c
> > +++ b/drivers/gpio/gpio-shared-proxy.c
> > @@ -21,9 +21,33 @@ struct gpio_shared_proxy_data {
> >  	struct gpio_chip gc;
> >  	struct gpio_shared_desc *shared_desc;
> >  	struct device *dev;
> > +	bool configured;
> >  	bool voted_change;
> >  };
> >
> > +/*
> > + * A proxy may (re)initialize the line - set its direction and reset the
> > + * default value and the vote tally - only while no other proxy has set the
> > + * direction or voted for a value. Requesting the line is not enough: consumers
> > + * may request concurrently, so counting requests lets every one of them
> > + * conclude that it is not first.
> > + */
> > +static bool gpio_shared_proxy_may_init(struct gpio_shared_proxy_data *proxy)
> > +{
> > +	unsigned int cfgcnt = proxy->shared_desc->cfgcnt;
> > +
> 
> We expect the shared lock to be taken, so can you add lockdep assert here ...
> 
> > +	return !cfgcnt || (cfgcnt == 1 && proxy->configured);
> > +}
> > +
> > +static void gpio_shared_proxy_mark_configured(struct gpio_shared_proxy_data *proxy)
> > +{
> > +	if (proxy->configured)
> > +		return;
> 
> ... and here?

Sure, will add lockdep_assert_held() to both in v5.

Shawn
