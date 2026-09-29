Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BF452E045
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 14:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690893; cv=none; b=YeBn8sl4/F8N3ULHmH0+EgZ5ZXOs25qMv9Kteox3k1NbBvbBjFtTeIgcGYZW+idAlnC8DfwUTbu8Q+04rqn3I35b+5Eo8yMU/sZdz4VjS6/GNzYzWFMBuev/msvP/fYZXLqCF2RfmrzfkOA5j4IettBjQ+QY1/ZATPAluMdvOks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690893; c=relaxed/simple;
	bh=/Z3PaVK7oAFmp3iii9Qe4p0K1MX0L1nF8sfYd5gbdz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=epQDO2DfP5mR8WX0E4YaxzNZwGtlrHYfzBzb6GvT4ZiLZ08qhoefMUF26TAGfirehElVDj7A4D7qaK/32JnVidawGylnLB3DeQpq4mSk0VD98jEBEh7KbYCUnoYfJs5+jQqBmnv/HVJiCxWjeGnl1IsWpj81hqZPdxuaMs6+NB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CwsMkXn7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d+stGOKD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CwsMkXn7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d+stGOKD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqePt611496
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 14:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iknpj6cjDsgT73juSTDvDpFp
	aBzMbtR1nZOpTbq3tN0=; b=CwsMkXn7GPMQoO96BVR6SI78E8zRgQyQcgeJiUkC
	4rGCxH5UliEujbfHR5KsBbRi7nYBxoVWvGbQLjXADst3tLSHhn+iKzqQ+0B88Ql2
	DZaT0FUDj4T6aW8vvDVZtRHiLEN7p3J2m94wHRq2apGnaDLWozwRZ9+sTH378lgi
	Wa42q0tJZ1hMnN+hzsW/IM0uhWDIuVqs7ChzFqJI3XysdzchvrOFLeXQ8DSIBbh6
	hhABNOC7AX8JRBx8kZoB5jX6oKh2ZEUJqow3u8AXQnb7/Y+mpkTeT1Uo9gGOAqbH
	hlOn9eoQYXUCYNbHayz257wLfz57+51aw2HqaFrY/8R6RQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4ug7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 14:08:10 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b37620eb73so7917506b6e.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 07:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790690890; x=1791295690; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iknpj6cjDsgT73juSTDvDpFpaBzMbtR1nZOpTbq3tN0=;
        b=d+stGOKD9Vxo28hNQh/M/A4OmYvTKrX+m4aB05Mc5EevwnX8ODldwhAelQzp+42DO6
         sKqUHWg4izYboPSNP2JocnBbUrD2UuF/5isR9XA0OsolSjPAvyseXGU0DuaFUkAxGb1X
         tfaaCxo05cbxjlj+InTRDSXPYtri4PHi0byKx8hOmt8D3QQym9VSP+H/qUkSOnMhqkn7
         K0iOYVv3uZ9b8dnloNmAZBl+gQQsXULHo65gQs4VVGoiVxmKfw+CSwSQ8M+pPONAGYMJ
         nEslZDQjXRjOEWsGZqxahYJZgVnh2c2n19am5jh6MMoqiC7REUc5Dnj6iK12L8kOLxmb
         sShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790690890; x=1791295690;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iknpj6cjDsgT73juSTDvDpFpaBzMbtR1nZOpTbq3tN0=;
        b=y4/Z7Pb85kPDjYGlVPQ6c80NW3gVv1c2RAkXA55LWOr0jty713RYIkWhrkPD4oAAit
         Sg5sDhEz7xV1WapDBtoTsORsmBabDax+rwA3iOjCTDw/TT/a2EpT3z865YluUA9OcZ72
         XiGFbNxmPxztFziXA1lOhdIwTPIt67tbpk970pE5yH046cFfjx0qy2//mi3JOTZfXSpf
         1neDQxhW7EqUZBbyeIrxBZPZg/gj9m+OLOzgir9nTYorvMfKfFTt0ek1wSGDb7YKGL30
         5Ojh0kCN/HJ7sDPqfWuXhbbN+DDQY/A7t0oH3JfQgXmwa8jEfKS8Pgl8/ZvjHInT3+zh
         xcRA==
X-Forwarded-Encrypted: i=1; AKwUvBycYg32A86mCDGAUkI0pmk3nm2YtDZtRhls+LmZ1bYfkBkV5Gw2cjYVvIfboFVForUcpy4850Mk/Ta5YzgA@vger.kernel.org
X-Gm-Message-State: AFuF++nxrqELo/GT7y+EX48VsPbZH7qXQvWm74HKNcvHcPO050LXOt2H
	Vf2QnJWtY6QYG3uFBZU6efqCbTtDIufUfMP9Pvb64FGp6cP/bFg/5y42JXWDOcXDrpU/sab/alM
	BFnd7dZ6vPwEoSxB3I5ttisAQNl+0695T9Myl1qY8TMQwBhATCSZeO5s3zO4IVV07FPza
X-Gm-Gg: AYBFou12JGBEm6IMPIYD4X9VuOGK6TDdNAZ+ThHc8VZiuP6CEE5bUam0Vas0FTULoz6
	c2fOP18cwovWDbvWkR0pF2d5ObY1O4FtCsekD5EhRE6LRAsjtJBmURf+7pMxk6F4eyVbVORQC52
	VQwi3ZHNNJTqX45cWXWGHZf+tLcKYpLGM3kDD6jxgrEJc6rtt80bxt7JbrsAtFQFyCxwFBWgnLY
	DNdXjse8nxhFuEjTLWfdHl6Yx2KDk0zySi5bcOGB6xZ3K9a4qKpFhQUoBnUConzCFJhxkMiJLgb
	cJ1dMvgJ+q2tLixLnnnnHJPvaK22+R8ldu8QQT2dQxcIQaV4DD2vWiQd4jzm6nHXvxjzyW4ZwQp
	d9NUjU0inkTt8Y2WSl+1neUaeZA/ctn8lXsFJrcLTsw==
X-Received: by 2002:a05:6808:3c48:b0:4d6:9222:9a19 with SMTP id 5614622812f47-4d730c6809emr14819374b6e.52.1790690889929;
        Tue, 29 Sep 2026 07:08:09 -0700 (PDT)
X-Received: by 2002:a05:6808:3c48:b0:4d6:9222:9a19 with SMTP id 5614622812f47-4d730c6809emr14819209b6e.52.1790690887748;
        Tue, 29 Sep 2026 07:08:07 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49abdc4ccacsm1106138fac.11.2026.09.29.07.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:08:07 -0700 (PDT)
Date: Tue, 29 Sep 2026 22:08:00 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom,sm8450-videocc: Fix clock
 inputs for Glymur
Message-ID: <arvGQKBY9DZlS2EJ@QCOM-aGQu4IUr3Y>
References: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
 <20260924161152.1162301-2-shengchao.guo@oss.qualcomm.com>
 <20260929-visionary-hospitable-beaver-e2c1a5@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-visionary-hospitable-beaver-e2c1a5@quoll>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1NiBTYWx0ZWRfX6xmAGwaY2Um1
 KDNy3/oSiuBUMGB7eEjE1bVyvXieMteSBf2GCwv+EtAbgoio7MdOl71c+dEYc6dL/GUj5arm5hb
 11+CqaFAw69I4Y2yKYN1ueMgv26Q9UQ=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abbc64a cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=AY5MHz9oPD_TeV_maQoA:9 a=CjuIK1q_8ugA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1NiBTYWx0ZWRfX1t9tLNUnUGQ3
 JHcR4fcwaZ0obJwpT68MRRcBaeWY2lU+U2cvUUwIMkzrfBcMcPrDbpzWPr/1maxFvfWy3BGp8CD
 S9GAMrc2XNZx3CKuV/fFQip/Y+oKFM0dKMfvoqBaWDtNUaCv4CM0B7qYLc8+mih8D14SXwqC5xV
 pnqCtZTotyNXSKkH0PPh+xdGNiahNc8+thgJeWcY1CF0HsolWFUXOt7IIl6qyDllJlmmB7r+GJv
 c6ZvvD3i4YibN1WzTPVHSaw5pWDi6pQKCwWDlnfgf0qwPyVtm3XJ+TAm6vvyYtASoCYqaLyW6b6
 M4+IzM3j4c8G/vOuIXyEFX1LABOqp2dVbaQ4A4V99R9drT8wwQbzBDc835ui3IMQ8GF3QSXxMC9
 dotu+gqcCADHP/hkhPlTqhbp7W60AS3hfvvCbaOZ5UZQIrcVUKOLA7k37o9Kl80IQrShA7bmLWc
 N9WJM+GQRWweWTvrGww==
X-Proofpoint-GUID: IrIa1LOv_3c82119xc3IhFtoqHxqEYoE
X-Proofpoint-ORIG-GUID: IrIa1LOv_3c82119xc3IhFtoqHxqEYoE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290056

On Tue, Sep 29, 2026 at 09:57:40AM +0200, Krzysztof Kozlowski wrote:
> On Fri, Sep 25, 2026 at 12:11:50AM +0800, Shawn Guo wrote:
> > The schema describes exactly two clock inputs for every compatible it
> > covers, a board XO and a video AHB clock from GCC. That is only true
> > for part of the drivers bound to these compatibles. videocc-glymur.c,
> > which handles qcom,glymur-videocc and qcom,nord-videocc, and
> > videocc-sm8750.c both declare their DT inputs as DT_BI_TCXO,
> > DT_BI_TCXO_AO and DT_SLEEP_CLK, and parent video_cc_sleep_clk_src on
> > DT_SLEEP_CLK.
> 
> I don't understand what you are saying here. You are mixing drivers and
> compatibles.

You are right! The argument was the wrong way round. What I should have
written for a schema is the hardware, not the Linux driver.  Sorry about
that.

Per the hardware documentation, the video clock controller on Glymur,
Nord and SM8750 has three clock inputs: the board XO, the always-on board
XO that feeds its PLL reference, and the 32 kHz chip sleep clock that
sources its sleep clock generator. There is no AHB clock input
on the block; the AHB clock the controller uses for itself is generated
internally from the XO input.

So the schema is wrong in two ways for these three compatibles: the sleep
clock input cannot be described at all, and the second item is described as
a clock that is not routed into the controller. I will respin with the
commit messages rewritten in those terms, with no driver references.

> 
> > 
> > Because the schema stops at two items, no device tree can supply the
> > third input, so video_cc_sleep_clk_src can never resolve its parent
> > and registers as an orphan clock. It also documents the second input
> > as an AHB clock, which no device tree using these two drivers passes,
> > and which those drivers would interpret as the always-on XO.
> > 
> > Describe three inputs for the Glymur, Nord and SM8750 compatibles,
> > keeping the existing two-input description for the rest. The sibling
> > qcom,glymur-evacc.yaml, whose driver has the same shape, already
> > documents a sleep clock this way.
> > 
> > Fixes: ed9ca8296147 ("dt-bindings: clock: qcom: Add video clock controller on Glymur SoC")
> > Fixes: b190eaea5780 ("dt-bindings: clock: qcom: Add SM8750 video clock controller")
> 
> Are you sure that you are not reverting review like it happened this
> week in IPQ? You know, the trick with reverting maintainer's review I
> mentioned on DT IRC?

That's definitely not my intention! I know nothing about the trick.
Would you point me to the IPQ thread or the IRC discussion, so that
I understand your comment better?

I checked review threads for both commits. Nothing seems to be reverted
here. Or if you would rather not have the Fixes tags point at those
commits, I'm happy to drop them.

Shawn
