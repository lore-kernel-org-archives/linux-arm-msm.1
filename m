Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C616F391E6D
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 07:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791356963; cv=none; b=uhvnzak0gllezZ4BUDRPb3ez+IYwHi3upJOu7W2UScW2f2Eaa3426FJPQilKctZxlKQAyTxM8bTfno5fuDukpwwS+I+MFYr5f+nWDknR7m8gdS8TSmVOhZVRWMQZ74miYNhrirIThmIoKvJ/G1Ary0LL/Jyhza70OkdZMDPKgjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791356963; c=relaxed/simple;
	bh=iW3JVrrvUcsHlZnMMLphvKMG3KwNUPby8ziTuz6RWjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQ927bCnEjLXuEtnRnpRaqYZUO7y3wXUwbHlam34buXfdPN2vNp/Ps1KU1AcmHKkC8bgWh7xA8tmydT7/TLmN1nBnL0QIrGpN7T8Hy3WuYWadktwzV+lQSuDu0IhmvZIKde9ngnQ1LQHSO1cf4Tb43Oi20dhMZsAAUlwFBADzv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p2A6pld5; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p2A6pld5"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35154cb9de2so1678500eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 00:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791356962; x=1791961762; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e34WpKUSaPAFWF8n5+ufAQ5hbBzjHzSllBW72um0g/Q=;
        b=p2A6pld5VNzoYyirqz54nL1QRvqxRL1ej6qCNZCjVwaEOMDxE9g8sn6kvvNm7yt/++
         ZjTHzIvM6cOsvWEv+KhQTQWGQ58AtByZw68U9+xN7oZWjmYLekTir23pjAGfThrM/Cbi
         9qEQnO61e5AvvFOlE/njnRNdKxaHzomOFVbwG6V90kKZoMNoWhvC1xTA+cpB8o+jiiF9
         g4Km6xZfNtEpYHiErsCnOJXO/DH+xl33kUMtiKokKySjk8Vc+aFcjhkWeV4ih5ob1t3y
         uTQogIpJbU0P4AmrKOaBryIGu9mkfGNmEakg99hOeBT7DuIrGLMYWFiksMKwUY9e8Gs9
         z6ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791356962; x=1791961762;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e34WpKUSaPAFWF8n5+ufAQ5hbBzjHzSllBW72um0g/Q=;
        b=HVdDDrLqvigN9DN/E0aAsLT7NnqDmQwHwRV9eQEa5x15eRu8LZYdA4P4JQKHwErNFa
         pi4tF2lRzqh+xhF5TFUHGpJSBwS/6FV9wlwy0RIf6U3JjB4EbsVIvFfCyq3Y7TcZeNUp
         ZZrZBNj0TQVRcSGhM7huC0zrwxClpiYaFuDvSyGFAR+Y9ePRTEnk+Vy0LEEOlR0NBo2x
         wggdCx7shGO2O73rvRNg82NzPDE/gmsojK/R1enhirrGDZSCn4Fi9SAOr9WOXT9h87hf
         soHV7b+KNJKdwp5R9cQJblVsE06SjEdd40334cZdqCLdq3QaUXDJoO4hd1RgcLLIZg2b
         r75w==
X-Forwarded-Encrypted: i=1; AKwUvBwBLNRsyS+5lmectMGxbatgqRK5yiytP6TdPVjtbPUFO5ImqhgSck0cm4Li1e7QehggwBGAND+R+xHLi5N2@vger.kernel.org
X-Gm-Message-State: AFq9FYJRfiIe9wMBgcW6DMRS8UdCviu5IIuRFlbgG5caFSC40XmpZg7S
	eLRyjhchCSH6+aYhsCRX7Ln7gPD9kCbq6Uk3syRTLEfXJFc72NSNaJmDLcSMBlhoxtI=
X-Gm-Gg: AYBFou3IlSjxP2MN+mtQd05TswkqDI9c1BPy2pVokpUya+x/GVN7JipAtVJJ39ZpOjf
	NJwFGfr4AeMof3IRzM107eO8OGNqfUwJDBFIzV8O7PDX2Ib2pkImBr2Ter4Ed+YH49aHbeLQ9f2
	d6WyfoJeWRjILheLLfaaNb6zC2dzVh9TDwnQD+/OGpcFvq3NPFgsWWCStp7kbsC9ZDzjQ2ahenS
	C/TDmHJzaotafJocabugREL6uUNvJI+XGLYlrP4hUJ+YIugbvGhcmqAq9TppiDCz5fJ4sYM8S5T
	koW2jWL3VHfkz6VW2F0u16OA5SHCVb60eOCYKW/HHankV/vpZkYH5Kbg7Y4XRlYObWre0AwC9x9
	JIMbfPY1qsTtWOJ7iaGVYgjx0LlR3ZnRMEjE1vRx/MbQ7NS3nZIHlXouxOeO2hXan3oogaf3tS3
	qIB3boPYfPKcEJ47qrQTl7+mXDWt+5FZjI3CWYhKHWpwZwQlfiTBzmJL3vsxkp06av66+YlyW/H
	+SsCjRsZ97x
X-Received: by 2002:a05:693c:2512:b0:33c:e82:70c9 with SMTP id 5a478bee46e88-3515dea1d6bmr1296696eec.32.1791356961645;
        Wed, 07 Oct 2026 00:09:21 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515af90521sm9797157eec.19.2026.10.07.00.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 00:09:20 -0700 (PDT)
Date: Wed, 7 Oct 2026 12:39:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ilia Lin <ilia.lin@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] cpufreq: qcom-nvmem: Add IPQ9650 support
Message-ID: <asXwHVcEyf0fpvhP@vireshk-B250M-D3H>
References: <20261007-ipq9650_cpufreq-v1-1-bb808da4ab2c@oss.qualcomm.com>
 <tnmm2misly3wct7out4gybimrql42si47trcoygaquan2gm2w7@rzqqkefwdmvh>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tnmm2misly3wct7out4gybimrql42si47trcoygaquan2gm2w7@rzqqkefwdmvh>

On 07-10-26, 10:07, Dmitry Baryshkov wrote:
> On Wed, Oct 07, 2026 at 12:31:56PM +0530, Kathiravan Thirumoorthy wrote:
> > Add IPQ9650 support to the Qualcomm NVMEM cpufreq driver so the supported
> > OPP can be selected at runtime using the eFuse value and the
> > opp-supported-hw OPP property. Also block the generic cpufreq-dt platform
> > device for IPQ9650 so the NVMEM-based driver is used.
> > 
> > Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> > ---
> >  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
> >  drivers/cpufreq/qcom-cpufreq-nvmem.c | 9 +++++++++
> >  2 files changed, 10 insertions(+)
> > 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Applied. Thanks.

-- 
viresh
