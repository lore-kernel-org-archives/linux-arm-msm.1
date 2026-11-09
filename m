Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794259225;
	b=beQUxl+UJLacquZcj/uGDjwiCwdIRAd4D0xJIGZ7+a7rfuIDz0+OzuoKcJVoDoPf9vrf
	 rfgl42esqaRaXr3oB9LAprBDUETEWg6/JqDoLKbxGfKJs/1/4DFwOC7/q5r9Ok4hlnigl
	 XUzXfwGwzCJoepr01kbN6+ZOLfa2E/+t5GQRdHd3teHMVxYFO39g1XsWxy1yDrhFgcBv2
	 1f4PjSYliBOVoQkhPKasVzDHX5GMrn8P22TeNGzsPKrrexZ4ycvG9tIBji/JHFgTmc4dC
	 OukPi949L/sI9pLDvgRiapiywj/G3y8QpIVACco7kGOgvMMw1zGDki8CformUVj8uJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259225;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=jhTFBrZbm1nKNNYaIDvPlXMHWrRMWNpq39pjf8IlDhs=;
	b=RxCvlPsi5F+pFktYygBB6m5E6X3J+BaqLkeaMWuHUxrvGYiEQrWehPPM8zhWnvk/dgVT
	 7qYAkPAAd5pVnw06jfgR3ck88bNmuT44Ws8jHwWqdWVYnuF3Ww7loKsquiR1ia+GBmyAk
	 Z6wLjNa3w6ARtcTryDlSjpyNzgs5yPM9vXDNGnyPp8JLpuYLAtFr1Br9u0geIuMlaVxCL
	 9Hs8VgfrnU4iRV1uthk6XNCZin/nV7+9HuF+VYlyfZFFk2O4wXQfjCbvBG9x2V18vZpEJ
	 SQwCjPUbM8gUReDGqXB9EZeOSjtZtszv0AHvMbUsG9YQlFEoP5bv3VWcm90amiujlXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hHYJAzHU;
	dkim=temperror header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=nvL4ojAW;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DFB606A321
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 21:20:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4DFB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hHYJAzHU;
	dkim=temperror header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=nvL4ojAW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794259216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jhTFBrZbm1nKNNYaIDvPlXMHWrRMWNpq39pjf8IlDhs=;
	b=hHYJAzHUmU/+h8rsgvJcMazixAF5ITT1OLim9qLZTRgStIMcisunBIuiQGEHx8zxxcq39h
	1reGwF/2r4qYbKoJei5hn/UpiD9E+PUBdSAyWJa0x6sGTE7q95ngnjbS6y7a+qbCl/blgi
	YxEU67tF96ryh+MyGTwK0ettvQlK34s=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-99BY_RXzPDWKU_4dSC-r-Q-1; Mon, 09 Nov 2026 16:20:15 -0500
X-MC-Unique: 99BY_RXzPDWKU_4dSC-r-Q-1
X-Mimecast-MFC-AGG-ID: 99BY_RXzPDWKU_4dSC-r-Q_1794259215
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b35b88aa94so20228047b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 13:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794259215; x=1794864015; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jhTFBrZbm1nKNNYaIDvPlXMHWrRMWNpq39pjf8IlDhs=;
        b=nvL4ojAWxrXG89Ui2evwQkpj4Vt0M0P4HWpUBwQov0ihCLpMM6dNoDqHWIasA0fyp4
         HOYZlTmGJXjZ6lEfq9VfTIFeUlBQcxqSRzn2XncQntUdL7A3MBjSt00y1xU4M5lnx8Cl
         YHGJF8HROCW9zVJvoZcZBdE7iR86exw61q36NzkHB4JtVmUjMXsp7p112M9PFZFytjON
         oB/CKDRkSBq3Pmhss5ZmbEjxSBeGkqMb7ozaWd4m4acgROrf4H14VZ1nw1YUWr+nGRHq
         V0bYcRyHqKe0dbU/MgM9aS1P/Zl0FfvlxEexbn49TtLsXe/N4auLRoTLOtppETb1nwyQ
         mwPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794259215; x=1794864015;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jhTFBrZbm1nKNNYaIDvPlXMHWrRMWNpq39pjf8IlDhs=;
        b=rQQUNGQUkBmd8v55bfsEUgORBsbiYCoPDWqWqoXebaciLLFBxCAcCIuMun00a8RVK3
         h8MTofJ/QMAh/WIY0K43w32ZvY+vE6RFp0Jfo8x5Ws6h9GiCzDW8bBvwAowTazbJZnMU
         7jsU0QexeCv3cNjciVwZCHHtY4v9nhJnPMvVs1PfIIIlWx3IGtolB5mt205iWdz3CR5X
         TBXR/HcD0MmJKwLje5HSbSsQLt25bZHamkCuMoq5SeiGYutuuDdrrsxSV5PatyvBVy0s
         uRk1xI7DB+NCxAyG1fv0KffrWt3XSje3AFFoEoaH/Viz+i9zHr/0Ipb597rzPH9UcPmP
         td9w==
X-Forwarded-Encrypted: i=1; AL+hErFLM4AtG8Rg95pscd1N58Oe/talCHTninZyYjJGukuu9UbMqwfuWu+lF/4QjbcCNt7jSTzVasm3xaBKfuIs@vger.kernel.org
X-Gm-Message-State: APuU4Z9/of8HMkgLV5Is9i6EFPhwnh+UP5OsjgTp3fwptQgYBQ99q15H
	RNcdNF7gpU4MhYSyguilLh+ii1GodaxW1tAymJYW5B5YSIGlvN8t5DGz4zLptsgtwtY5Wzpj+W8
	fiN2J/taVdQ4hMR49sKYUywuaIz+n+RdHVr2gLKyeFYHTUBAxuSGGS3/fD76SDrmu2x4=
X-Gm-Gg: AYBFou3nruZK5GAEF9RClSETEbpyWdSBq0YD27DE+6Uncr42F/QPc7NOf6p+332l0S5
	xNtveWd2fAUNcrLdEfyG4MJes5gi0Hj4okVLeE+sAHJoXb2rGQ7VANbG1etMZMI6MQyCkNbJKxl
	Zbkc70TJbJdzl8nUM5uHmycINM5G0t5lVltdUoMxoFX9wwLsyjT11BwUiRpxZrTO5BuF5Atw1x9
	KkwsARVAqVTb4ataMMe/YBeZzJN1FBrVJbSbNy0l+enOKc8jFSOPe2W9hykb7A6ywQA517LEQ9b
	3LMvzBXw9NNue0uVudPNRsr7wnmlBtciYx6yA9JV2+RRk+3+5WwuO/pj22u1BBAzGvsL1F5lRvP
	Hx4na8qvLaM+prMXmk3ygtezACuL/eMRSrXtCf1fIzJdPXMkH3M9/INUxhopM//NpzajLgvlw4N
	r8
X-Received: by 2002:a05:690c:a055:b0:8b0:d468:e9ec with SMTP id 00721157ae682-8b392bd0c0emr2841717b3.105.1794259214863;
        Mon, 09 Nov 2026 13:20:14 -0800 (PST)
X-Received: by 2002:a05:690c:a055:b0:8b0:d468:e9ec with SMTP id 00721157ae682-8b392bd0c0emr2841517b3.105.1794259214432;
        Mon, 09 Nov 2026 13:20:14 -0800 (PST)
Received: from redhat.com ([2600:381:e227:64a:814:7bae:8aaa:cea9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3933c59cfsm3832747b3.17.2026.11.09.13.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:20:13 -0800 (PST)
Date: Mon, 9 Nov 2026 16:20:11 -0500
From: Brian Masney <bmasney@redhat.com>
To: Mark Brown <broonie@kernel.org>, Peng Fan <peng.fan@nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] regulator: convert to subsys_platform_driver()
Message-ID: <avI5C2UFcxKF_LoG@redhat.com>
References: <20261106-regulator-subsys-v1-1-1f91f4204bf5@redhat.com>
 <1b56983f-f88b-453e-bd8f-8189c3f79d1b@sirena.org.uk>
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
In-Reply-To: <1b56983f-f88b-453e-bd8f-8189c3f79d1b@sirena.org.uk>
User-Agent: Mutt/2.4.3 (2026-10-09)

Hi Mark,

On Mon, Nov 09, 2026 at 07:14:12PM +0000, Mark Brown wrote:
> On Fri, Nov 06, 2026 at 07:28:46PM -0500, Brian Masney wrote:
> > Reduce boilerplate code in these drivers and convert them over to use
> > the macro subsys_platform_driver().
> 
> This doesn't apply against current code, please check and resend.

I see that Peng already posted a conversion for regulator. Based on
what's in next-20261109, it looks like there's 4 more drivers that can
be converted based on what I have in my patch.

    drivers/regulator/qcom_rpm-regulator.c
    drivers/regulator/qcom_smd-regulator.c
    drivers/regulator/twl-regulator.c
    drivers/regulator/twl6030-regulator.c

I'll post a v2 with just these 4 drivers.

Brian

