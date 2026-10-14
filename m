Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CE751DE1B
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 13:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984346; cv=none; b=ggor0Oar7H8Mq+40rinFFRMfQa3nd5x+LxVsV6JYL4psNzMsSi3p32XNkqIHifSSgYy3tvUCcjfAeZ6+H3TjgfFj6+COQPAjb9hQMHKikm+vZEAnhlmZg33YwUWAMkSYz1cAh+BVAoQKhjRaeS0415bCRiriBKK+j6zA747ctJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984346; c=relaxed/simple;
	bh=0INl34PhK/HRg5WJtm1080VCfjv66/kDwm05AckFZQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hVAbnCgCTHyHufv8WBshplIDQ6Q+pHoD+9XgxJtVgeO7pGlC5AHpTlhnyjcy+8/CMLKJYJQVbdX2C9z+otSin7yTs+kvRqEMDZy9C1Vuarysa7t/TrFzouIEytigcp0SbTipC32X+mLxT5CIrdA9IWqLDSjtLp9IZLHdulofZF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aKkAUL+8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z94GVm85; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aKkAUL+8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z94GVm85"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E8IbNJ3017940
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 13:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3zp0rB17dPxE0QziDSpcEJV4
	TAs/poWOIETcgxNKjkg=; b=aKkAUL+8T6OsV9J6HjgfOfDdXbSYg1fA+0PxtFyU
	d+ieAS79rAJG5VVYshE4C3NPYzjveMJMJu147/YVJaUbebJ3QOvBz303yvHgFk9S
	Ggli2kGpbF/6m0WWJGDxYAdqNAsEPxORkNV/Q6m4lm+0WIoLKlP/iiyODDwmrMqH
	U8yUXp7ovv12GYkXWsFyWOTRn7jxRasiMtApM4SNQjf9AubbJq8VOleALZHwca2K
	QKPEAJt/mBB8+BkdR1GPRlwbmxHBG+sKeJ9YyXh2KI/uhYbnl2W8n/DO2fu5GQR4
	mn+ykTkWgzp6c0AKxjA58nupLPAOXs9ys/cl+GLlsjqkZA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s2b4gc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 13:25:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93dd3c3badbso79325585a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 06:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791984342; x=1792589142; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3zp0rB17dPxE0QziDSpcEJV4TAs/poWOIETcgxNKjkg=;
        b=Z94GVm85YvUiozyO0scS4kZOsvQvVJZAO/cHfAJW0LqM0T0yDs0aSz0ztNl7IGhj/t
         fKC/BzNqU2Ed3hGePNo01hemy7fMfG5E9OjCeVuTEHykTHq3awOt8tOTcjWj2zmkzf9i
         0Mg8R5ImX3tLxIQhWOBSXuQ5wJm42k8spEzo1Jh1elVKDPmK1dyKgQsI5Y3H/z2b50Og
         VyRH+twB3zZFFeGWgN4FojI1quV68t1Xl7y2kk3RKLcahW/yIk+qzCB7WXm+quvciukw
         DN/oKQ0bgsqCwXdS6Mtg9DJb0XytOPDdy7edJL3bB80hkfcr6caU1FXWE/U4jDCQmGXw
         WX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791984342; x=1792589142;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3zp0rB17dPxE0QziDSpcEJV4TAs/poWOIETcgxNKjkg=;
        b=bQLTszYDErrxZnM7VI2qD3ZrQHBySKGUohd3yn4q/ECm3AxeMWx1QAb+WByc0NM03+
         oYH6QC7lzcawPQhU5ZMUxfoLT4CBdqhB7pEEoA8659lNjPAj1ICvoVrmSRyoUyW23afE
         QiPi97wymyY2rsNPFOZ8QvJWG3gLMQyWyaNweyt5NiD7EFa8/ehgB5IG4vKTpNKGdjfW
         6Z1knCQ/bPXR0F3UlDnPHfIEv+6PeclYWK8CPOqojdMYnJF++4eT7LOT+o/W76LrSQL9
         eY/RtjTvA5oAxW5PmNflcqJ95WyWqowuTWi+Wk1XC18LB0Tl5Uas4WwWwGZaHxqWzb8D
         aJyw==
X-Forwarded-Encrypted: i=1; AKwUvByIO0cfeGX1yPKc/Yto7kMwJsYb49QbiXgoSAiY3qIi/Eiq3vk6y37uRT2JIpeVtK7oRMRm9SAbh9mMjisS@vger.kernel.org
X-Gm-Message-State: AFq9FYLd4rFAhTgTPOS5MBErh+ODimwLkVdxgVb/orbtjA/u0bm3GQjk
	Mm1L+JFrCLnF22M7YwDDWDQxBOLYluThh8neon5ZB9dAMB0NINwPcJxGBKcmPuXyJqHeoWFVVLv
	eclIdP//jKdi1r1BIVO0kPXRcuruY3VsZ2FksnYyZN5UE5Qbtk9GuetFxVCni2Sl8u7wq
X-Gm-Gg: AYBFou1YZDGGq12Wb/oFNxVXUXonqZX4G8DSWPHYXPjlU8LSTEDK0RAYe0tbbT2MI0O
	/EJhJoJE+odwvXcper31XQKbleHZK+1vk/r9USLXmTVJKrBpUwfQidRqtioxfT1AEaaodtREazv
	leSJGoMI9oG8Fetx7WpVdfhV7sq/gawPuS1G8d6uJCLpFI5uIbmvGMUqwaYWDOOmYwjNbtDtzTr
	wVXIf/Z0lp/g0oGRtrAYlgqK1NP2245N9P2R1zjRrrOX7iCJXET75l6HU8M2JyaXJHFdp6wpMPN
	iHqV2jiiM6YvmHnF5tRmZcivcHbJOckZrxl+gDp+yrvTxEG86jmLtRga/JIDs6GLPq7KxDUnPb5
	9XB722FROaK2+9y2UFo0ZONQNFrCHg+U0tW/nZBpehxBj0GLZsCkIypi4Z4EMFITD2ojCqxKWqo
	sYZLI7xWD8Kwwm
X-Received: by 2002:a05:620a:6496:b0:93e:c12c:9b6d with SMTP id af79cd13be357-93ec12c9ee5mr2552207685a.72.1791984342366;
        Wed, 14 Oct 2026 06:25:42 -0700 (PDT)
X-Received: by 2002:a05:620a:6496:b0:93e:c12c:9b6d with SMTP id af79cd13be357-93ec12c9ee5mr2552201185a.72.1791984341835;
        Wed, 14 Oct 2026 06:25:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d88252sm665670e87.52.2026.10.14.06.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:25:40 -0700 (PDT)
Date: Wed, 14 Oct 2026 16:25:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC 01/16] clk: Propagate rate programming failures
Message-ID: <w5omlz6fgvtruhz2mmlpx2jps6vww5rnbnfmfgfyfflcuuxlqw@kji5by4g4ghn>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-1-3041b788e9f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-1-3041b788e9f7@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RPQmjIi+ c=1 sm=1 tr=0 ts=6acf82d7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=mF3ojIlt9b2smrM3QEAA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Clto0pDKQ1UM4CwwrpKfM6dDcljuddFy
X-Proofpoint-ORIG-GUID: Clto0pDKQ1UM4CwwrpKfM6dDcljuddFy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MyBTYWx0ZWRfX3PkB0uPiPgdR
 FUvr150QNJLHCIlRdQS2NdTI+3Y7fpjYTQzkutRhfOudvhrqMvLolpCPzHmf+3rDrWi7iMKy8NI
 d1JhIS7A03MJgBJtVnShut5SRltNBDMXFjEPrD3WVBGR7om74URynanXHtq55A6wl8O1u7qa4id
 3TJBbBrmvOt+h9uV4N+TAjUhnU2/ivmVvu5PWorG3Q4o6/fYibdUxF9ge5Xq4VxDITmp8Vzv0nn
 jKjuuVEnC3WbDjqyZFqbc7tU3mBofWFOsg/IQOvU7k2BLtSMcsewRkxW6j46YvTiEo/42hcts58
 X62HtjdV9ZYntD7/jMTS1oT9yo2rxkoGnGEUloUomB/0yrBB3BMcT5oZZo/lGsSVDDyMjLh1Pxo
 UmcVslVli586GqTMBoaAdATLqJJiTEMGVANicWOcsaboiZ2zfMuWhb6G3n1KE9fTPtX+whRKkVp
 txNZwoVZYzhpGJ+3fpw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MyBTYWx0ZWRfXwD8CJK2ML0i/
 Y7X3dJ5GOUWNbSKbt8RGoybM1NZVqd6Y63QKR5tPwJO+ditGsgEvs/MF1t8nuoxPDuPKY5otdhq
 CIuVnfD5TcLphHj/gvtB6+YtqRSnT/A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140053

On Wed, Oct 14, 2026 at 02:19:01PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The clock rate-change walk ignores runtime PM, temporary prepare and
> enable, and provider programming failures. clk_set_rate() can therefore
> report success after a provider rejected the operation, while later
> clocks in the affected tree continue to be programmed. Consumers can
> then proceed with a configuration that was never successfully applied.
> 
> A failed parent switch must not leave the software topology pointing at
> the rejected source or release the old parent's references. Likewise,
> rate notifiers must not announce success before the whole walk succeeds,
> or lose their ABORT notification when a PRE notifier vetoes the change.
> 
> Propagate errors and stop the walk at the first failure. Keep topology,
> temporary references, and terminal notifications consistent with the
> outcome.
> 
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/clk/clk.c      | 163 +++++++++++++++++++++++++++++++++++++------------
>  drivers/clk/clk_test.c |  16 ++++-
>  2 files changed, 138 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 4d2cc86bfbeb..95669775f8cd 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -84,6 +84,7 @@ struct clk_parent_map {
>   *                     clk_core->rate every time the clock is reparented, and
>   *                     when we're doing the orphan -> !orphan transition.
>   * @new_rate:          New rate to be set during a rate change operation.
> + * @old_rate:          Rate before the current rate change operation.
>   * @new_parent:        Pointer to new parent during parent change. This is also
>   *                     used when a clk's rate is changed.
>   * @new_child:         Pointer to new child during reparenting. This is also
> @@ -130,6 +131,7 @@ struct clk_core {
>  	unsigned long		rate;
>  	unsigned long		req_rate;
>  	unsigned long		new_rate;
> +	unsigned long		old_rate;
>  	struct clk_core		*new_parent;
>  	struct clk_core		*new_child;
>  	unsigned long		flags;
> @@ -2163,11 +2165,14 @@ static void clk_reparent(struct clk_core *core, struct clk_core *new_parent)
>  	core->parent = new_parent;
>  }
>  
> -static struct clk_core *__clk_set_parent_before(struct clk_core *core,
> -					   struct clk_core *parent)
> +static int __clk_set_parent_before(struct clk_core *core,
> +				   struct clk_core *parent,
> +				   struct clk_core **old_parent)

Nit: we have an idiom for returning either a value or an error. Is there
a reason why you didn't adopt returning  ERR_PTR here?

>  {
>  	unsigned long flags;
> -	struct clk_core *old_parent = core->parent;
> +	int ret;
> +
> +	*old_parent = core->parent;

And that's the reason for asking. A pointer argument is expected to be
in or in/out param.

>  
>  	/*
>  	 * 1. enable parents for CLK_OPS_PARENT_ENABLE clock

[...]

> @@ -2247,10 +2274,10 @@ static int __clk_set_parent(struct clk_core *core, struct clk_core *parent,
>  	trace_clk_set_parent_complete(core, parent);
>  
>  	if (ret) {
> -		flags = clk_enable_lock();
> +		unsigned long flags = clk_enable_lock();
> +
>  		clk_reparent(core, old_parent);
>  		clk_enable_unlock(flags);
> -

Two unrelated changes?

>  		__clk_set_parent_after(core, old_parent, parent);
>  
>  		return ret;

-- 
With best wishes
Dmitry
