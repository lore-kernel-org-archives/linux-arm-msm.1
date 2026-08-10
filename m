Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64864248AE
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 17:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786382288; cv=none; b=ToRvIFCQYkPuQrRpOMDdHU8dKPvfYBCcgHon6+YwOEvU6Cv0g7DtC+T09gN64BRPEJVTnvgFLW5/3gT+wuD2Lrgm4eOrUZNUzmNVHkEPMW+MWK1HoZO2rFPu6g/2HnbWPfCVSlHV1ho48p/uNcXRLJ/wykEy3BCO9OqD4acDSt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786382288; c=relaxed/simple;
	bh=Ci1XaFzRBv/qpXZwP21pNljumVkUJ79fkDCBQF3hafY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B7joktzQIy9dHzono+427+aHsIyAj0ynjqDRs3revrxB2XMwrVqSu+8rMEU6dctSxit8g6qvcpUbIC0SKhzHVyNabZE4o5Z80ARohktCINqiZvFWA2Jma9hMB/rS1vxng8Usq4ZQKfRHdWW/j0vjMo/UjoUF8UP+cfml2ByX5nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MDchtSJt; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tk5nG4P4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MDchtSJt";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tk5nG4P4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786382285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e60Y2Hd3VNcQx2rW0XYN6hHI/hSb69wpEJYZUkdU7+s=;
	b=MDchtSJtpN0nY+3wJcei0rF/aILOljATsj073C3sSD05tfWbenmmO4jJ5yOJ2DMwP2rn3I
	4zz16s5GT/kr6znA009SrYvhoWTqigf/wFvCtuQBwFYaWjodPZ/gsqeLQffWGBzRoSHgkx
	VMkJrd7iV9pR/Bi2hC1z6Ca6dFTr4Cw=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-Cgj5912lO86bNLFVGuyVRA-1; Mon, 10 Aug 2026 13:18:04 -0400
X-MC-Unique: Cgj5912lO86bNLFVGuyVRA-1
X-Mimecast-MFC-AGG-ID: Cgj5912lO86bNLFVGuyVRA_1786382284
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81ed0c52d9cso55192357b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 10:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1786382284; x=1786987084; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e60Y2Hd3VNcQx2rW0XYN6hHI/hSb69wpEJYZUkdU7+s=;
        b=Tk5nG4P4jUSvmLWVX4rJqIwOUN1/aEp+++F3gNCKjkD+sCb7SJmiHu9bmz2bd9ktHD
         JxW79x77QlRsd4OX7db3HT3vuqyT4cxRG8D8Nk4p8+72h/BwOyb6VuIqZTDVrzWYswjw
         6xRTS5LQZGYSRiSYTALyh3h7j6sfTBC6sTFSqVrpEvPnFK7/WncX3G1b5lyxRNxM5Ft+
         FqaOH4uCch+hqUF0JKZKnt8bbntDh5w9WWXXTD45kF0Nw7JhrExoJ19C2tpzJGb7x6jN
         3V2VL1ZpIDFRyd2cz9+GL7EOOjVOqbTO2W1iTYhyYvYAF3D8BebURw+WZopXFWrtJLcy
         n9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786382284; x=1786987084;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e60Y2Hd3VNcQx2rW0XYN6hHI/hSb69wpEJYZUkdU7+s=;
        b=ZGjBJZpDIC5hdN7K7LEiiAudkK4/fdLNzuhJdgAenCYcT1WQY2jJ7uC0koD/9yPLFH
         ZftF61qvh7WzxJJNN9p1HaPx8IiE8D4Br9W2lK/iOyMwMZ4yIqr797J+WwAK0+qd9vBe
         OPCOv9LHtgPITkLxWjn5Eop8W8u1zjO2ADtZyfr9wO83RiWm+DrMjQotX6f+NvsgHnOg
         zdk9JGAv2CzUD0khTdOGhR3EBe5IBY7vmJGUv3XYOiAEFvJ5Hqg2myJ8bhu8AU288aMg
         G0m8IvLu6UF68dRJCUgmqUgjPCbj+ByILBV9GqtX8VetMv+VmdciPffQBeayxjmPIL4o
         Dk4g==
X-Forwarded-Encrypted: i=1; AHgh+RojRt2mBX476OcMfhOmTWj/xgwyvJJelvYx3jAyCHTpxauJORoo0SAUs4LsfhUKcPAigQZ5mcjFKhfmrvnC@vger.kernel.org
X-Gm-Message-State: AOJu0Yzia8Xb9WUfF49zeHv06MKx+u9uuuk34u8JWpvO6HL5RkmUFdZ0
	YOrfGslHMedPEdtqXTLsq2ZongOXIn+c77v6Zyxl+3DMXW5DVOY3ys+fUmdPauoncZ3wvbNp1Hz
	plzmsjhpSNJaQ5d3OXjOY/c/pNYZ7TLrKnFjk6QfUGic8NRj8mHxEw75ftXn80b1hxGw=
X-Gm-Gg: AR+sD10byW2tElmOAo+v86RL8zz2qVrtRkmMUEFYvo40fXwPy1Bb7jXi9PpwNANw6rM
	KEfYogSrK+w+UhXkhVPF7wXgv9d2Ql5id3naBlMBHoIF+fXBJfFA35qSTdnkPbeh7KmTuB0jQNw
	HSuth80d5F3HgYpAyXUISfqCAznCgHywZ8oMMNRWqCYxbx2r7fygngT+hK653AVbM/3CU4l67i5
	swYXwI6oJlkae6feg56DPkZlgu+nBCgMYmHdDDJsakCo6+Iw2XruK/5ImhloPS4WcjfCZqCwTWz
	gFjIyMk0wZgiJO5K7+eXjTAcreJxjj2tiYCX6j+dm2oYf2lnbDcQ+3W5UzvjxAEa7mx5hV1lX/L
	Ws97CQy+KqJerDLPscbia0/dF1EGi3jo0/9I=
X-Received: by 2002:a05:690c:9a84:b0:81e:bd02:b02c with SMTP id 00721157ae682-825728d1963mr135364647b3.1.1786382283708;
        Mon, 10 Aug 2026 10:18:03 -0700 (PDT)
X-Received: by 2002:a05:690c:9a84:b0:81e:bd02:b02c with SMTP id 00721157ae682-825728d1963mr135364137b3.1.1786382283255;
        Mon, 10 Aug 2026 10:18:03 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-823f75c1c17sm60279477b3.47.2026.08.10.10.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 10:18:02 -0700 (PDT)
Date: Mon, 10 Aug 2026 13:17:59 -0400
From: Brian Masney <bmasney@redhat.com>
To: Luo Jie <jie.luo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
	quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
Subject: Re: [PATCH v2 03/12] clk: divider: Introduce
 CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET flag
Message-ID: <anoHx6sbVKn0GVlk@redhat.com>
References: <20260806-qcom_ipq5210_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com>
 <20260806-qcom_ipq5210_cmnpll-v2-3-cce718b8ec17@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-qcom_ipq5210_cmnpll-v2-3-cce718b8ec17@oss.qualcomm.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Luo,

On Thu, Aug 06, 2026 at 11:53:07PM -0700, Luo Jie wrote:
> Some hardware dividers derive an even divisor directly from the raw
> register value, i.e. divisor = 2 * val, with no +1 offset. This differs
> from CLK_DIVIDER_EVEN_INTEGERS, which is one-based (divisor = 2 *
> (val + 1)).
> 
> Add CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET for this variant, updating
> _get_maxdiv()/_get_div()/_get_val() accordingly. _is_valid_div() is
> extended to also reject odd divisors, since _get_val()'s `div >> 1`
> would otherwise silently decode them to the wrong even value (e.g. 3
> -> 1 -> 2).
> 
> To avoid regressing rate requests that previously computed an odd
> divisor (which used to succeed with a silently wrong rate), round to
> the nearest even divisor in _div_round_up(), _div_round_closest(), and
> _next_div(), mirroring how CLK_DIVIDER_POWER_OF_TWO already rounds to
> the nearest power of two.
> 
> Also guard divider_ro_determine_rate() against a zero divisor, which
> can occur from an unprogrammed/reset register, the same way
> divider_recalc_rate() already does: WARN unless CLK_DIVIDER_ALLOW_ZERO
> is set, and return -EINVAL.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>

One of the other patches in your series says:

    The NSS (network subsystem) clock is derived from the CMN PLL output
    divided by 2 and then further divided by a configurable 6-bit divider.

Can you register a fixed-factor-clock parent with /2, then use
CLK_DIVIDER_ONE_BASED? That should yield the same results and it may
more accurately represent the hardware as well.

Brian

