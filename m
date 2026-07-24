Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AC5423780
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 16:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784908872; cv=none; b=bIh+b3sMJrVIq2SAo4Oiqgqlf5rYHaDvkKoVKzWCEt7o+yzUxT4KirCVUGAsVjWPQf7jJWp7+zGFBRU3RElyESQV4jcCl3h0KCuz9YpWCri2fF+dg45yn1OOedACZ7wUmHFvqFK5WCkckOoQj4xf3shWmDEGR9KJCpWKgWDi/KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784908872; c=relaxed/simple;
	bh=Fn1LSFnvcQPwl+OpOHERR5ed7+JefDQcZI+Vfb0q8B0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EoWyejp7UbMgUwT5yWeszMxjNfFQtEefqEBnmvVdozTA5bQKoQPhOuw7cfZjSN5n5Te9yYko+9C098K1rymF7fFN/B4TNvnbBSkQUjS6ZA+NFJ+SrDuhghFgLieFl1ygBE43aOCLBHhM0TeyothLEiCIlrH3U/iBwhgFjn2q6pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V2Frpefr; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mm2rOugS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V2Frpefr";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mm2rOugS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784908870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+bkEHSp7uhvmCp1vkWRoofsHVhKJ4GQ+rCHfCWSCHbk=;
	b=V2Frpefrn+laJxjo6xBnC18ic/k5lWGyDo5ps6ABJ/QP73yoEuUnzhT6Yue2OAkKiU/7qg
	xJNDYSEaRFg35/wYHhd3nep14QCuaf+9Gbih2Pr94vkGiYtlfJTrTVwrQZrR0H3+oVxpGz
	TdJwnoNDEXCKU16Iyvgic0N4OM9zTG0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-X8aByvuvMbyzJB3qzKWb_Q-1; Fri, 24 Jul 2026 12:01:09 -0400
X-MC-Unique: X8aByvuvMbyzJB3qzKWb_Q-1
X-Mimecast-MFC-AGG-ID: X8aByvuvMbyzJB3qzKWb_Q_1784908869
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92ef13b61bcso101130685a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 09:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784908869; x=1785513669; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+bkEHSp7uhvmCp1vkWRoofsHVhKJ4GQ+rCHfCWSCHbk=;
        b=mm2rOugSk7KAS7M42+iocUJr91NAnfLJe5nqGr4OVjqF4xh7AOUnPBp2TQja2A3/PY
         GuQMfpvNVHiYKpLd1HMNMyMH2rM2iKt55mZhC+wVoela2+BC0GRyCEPA1jsrt+B3a+9F
         OsC2wz298ZsfsoO4L2EbMqY+BBfRVOgTT0v0Vp85pS4XlD0P2PUEeMDRipTzOjUmYXPk
         YQMqETesjjkUJYVdtK3FWNJFLkUaoD+dGTxsvvDIgd7CTnEaczdEVGzcxmVQmdxYcpSJ
         GOAU60b4jaWmfDj0ne7TSszdgkFTAGQiDSTU2YkhnPNILC/TqJqncSrPpIKsE7ZzifCY
         zTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784908869; x=1785513669;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+bkEHSp7uhvmCp1vkWRoofsHVhKJ4GQ+rCHfCWSCHbk=;
        b=m9jk+B2aaibYUL1wQFBiv4DnCBWsvdlSzjYoP6XyRJV7kQ2GbGNRjbol/zCODGjBIK
         Fl8whgVWChjVBWOqQ/pAA5yoQ+m4cEEby9yoe3wvA17VfYwJ2llfoUDjFQNLRVoyFxdL
         ukdG2KMVZ7eQ8uVAG6O5khOOyTx6OJa3BeQ6sZW2fWUHGCoWJG8mxcQmwE/rcde4r/BJ
         jp2FouPvzkGcRxFAfE+IoUtVaQ+Rv20exO46c7tqy+fsUNA2geybyEhnrhx9fdtg3GVx
         uxOWrOSyylIgJKer/MeIZnnh/lJOvP7dt6s0ZqecRTBv3gEcq2RNB8AqUz+AzxUReldI
         eiEA==
X-Forwarded-Encrypted: i=1; AHgh+RpGCu9GzlzQx+EvJVA+Ad/HoiU/ahr0TGmEt0ow+8Kgl68lcFtguk9qpHl4fJ+6R8T5mZHf1soRZOSbI6ux@vger.kernel.org
X-Gm-Message-State: AOJu0Yy04RxLfKF+5oA5jwNElpxJltXYsUSqngnPcPI10jWhYo72uf92
	LNPFpipIiVc/8XyfycVRVSy9om7NNZZJzkGI/EPxiFYjLBYCk34GdBxfA0QZnkS7ehOGD/l6W+L
	rTcMAwwyPGJsNs1JP5325y2Jgg3GsoCodxUTZNSfB0lhmNie9Ll9LkJJ9VAKVJtFdQ2A=
X-Gm-Gg: AR+sD12LJeMDRaCYYkIxBvRv097hHr0WGZ42GvuBtfIMvJR1QrESp064IA1BAQHLToZ
	k6M/m6pHzJWaIsY5IXe5fO4+EctlxVM+v5yuS4Jy3PJ0azQYoptwEudYUogLrU+G8xxPfHKz/CB
	Ipxhaeq2SwtdLQ81Turfx1bKd33Y3ix+hmPqt9Qje5KUFwlVGHrkJg0jPx1gz+NA/gnlQ5ffg48
	jdb6WjI+yO8KqGXuGU+VjoRygccMVPZsFxi3daWYzKLY+ms/SJ/10LN4EH/+6nwhU6UXdG2P6HJ
	/lsE1x2+ke8S0ehAFfUbyaqPjciCEN/p2EW528KY71D/FzR/wV0Bv7REyRciVPIgKTppPVgs1bf
	zqNxtNNTUDhKGP9C/c2Xz0lPlH4iq9nHjjhc=
X-Received: by 2002:a05:620a:4706:b0:92e:7c0e:5912 with SMTP id af79cd13be357-93103aee644mr937769885a.56.1784908866938;
        Fri, 24 Jul 2026 09:01:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4706:b0:92e:7c0e:5912 with SMTP id af79cd13be357-93103aee644mr937759585a.56.1784908866130;
        Fri, 24 Jul 2026 09:01:06 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f6a0371asm684521085a.27.2026.07.24.09.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:01:04 -0700 (PDT)
Date: Fri, 24 Jul 2026 12:01:02 -0400
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
Subject: Re: [PATCH 08/12] clk: composite: Export
 devm_clk_hw_register_composite_pdata
Message-ID: <amOMPmn1fBE1gGoe@redhat.com>
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
 <20260724-qcom_ipq5210_cmnpll-v1-8-a8b8679d215f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-qcom_ipq5210_cmnpll-v1-8-a8b8679d215f@oss.qualcomm.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Jul 24, 2026 at 08:00:30AM -0700, Luo Jie wrote:
> devm_clk_hw_register_composite_pdata() is defined but not exported,
> preventing its use from loadable modules. Add EXPORT_SYMBOL_GPL() so
> that out-of-tree and built-as-module clock drivers can call it.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

FYI there's a separate series for the UltraRISC DP1000 SoC to export
this same symbol. It depends on which series Stephen merges first gets
in.

https://lore.kernel.org/linux-clk/20260720-ultrarisc-clock-v4-1-fe639d63bbac@ultrarisc.com/

