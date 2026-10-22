Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.235.229.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792669476;
	b=2AHUVc1H/23bN+OiW8MsopckYPG/PyHDc9LBmD0ODtubi46rpV7EA9LaWr8qMnIGc0xK
	 GMYTe0Wt9JQ3+TDLFpxp8bUCnz5bpIzT+IBAh3RIRTcRXqvPTKEOQR7DvMLyi0wFCs5j6
	 JXnAqmzpP8uIV5YJXmyKGew6XtdcKyZ4ijt2d1Rr5GksCRR0jAt7dtmiLV0vEt6JwW7/Q
	 Pgg8BnBjcQZi8vfZJUtm0Q/1SKuqjvvUQUZ2aY6g0xMHMVSZH7XLvJiUw5s+JDjqxi+Lv
	 5tpFVs3oWAWp2La4UiIt16eAI2uK7MWVFg5cDQQez+pk/GZ7XaFBomGBKU3lq/V63TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792669476;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Chocolate:X-Operating-System:X-Uptime:User-Agent;
	bh=Xx0vuwoyKXtL+A6hjP1zK1dBEnmM8aLhFfYqcJNrzE8=;
	b=Lw8FAppVMWkbmqVWHRyVyzoglvfqQQFk7/3ZKsN93LjKAyKUWR7kHAX6fDwQ4fUtwJEe
	 MvXAsMYu+53y/MMGUZJaRFPmbkyJld4IUIQHA1GncSsZ5kCkJ2i5pE8zjkmqxAvuy0Irv
	 OXYMbfck95aLIzWweLfRH3Zon42KPVyHME33KortukRRr129fJKfZagRDdQyO3k/Z/kLW
	 9frmk7P33bxnVzdYxYOjsydDWVaGXJgtipz/qLTymbIcs2EtQK+LOA3njbQns5bdEZlvu
	 bVthD389PxWH3giU3Yrq8Asx8p9OGTY1eQTIn1bwnmpFdEj/C1nUmQQJTJNqEZn8zrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=treblig.org;
	spf=pass smtp.mailfrom=treblig.org;
	dkim=pass header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=hyBJ85BH;
	arc=none smtp.remote-ip=46.235.229.95
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43FF606A319
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 11:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C43FF606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=hyBJ85BH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=Xx0vuwoyKXtL+A6hjP1zK1dBEnmM8aLhFfYqcJNrzE8=; b=hyBJ85BHzGoqQ6hF
	subakjfYsb5BRQQMWy9gEExcZbUXF1W/EzF6OGFl/YOcD/IbGzK3xB2wX362UGYI52jVEjxK6CBU+
	SCKZsaQqiTk8Sq6hPc/qsyt2vCQtO5Sn7wfo9qPAdQM+WvFCE1tUxqbPWVjI/jWbyESBudgKB2/Fj
	mMYvTbVOScBSVgYOzhUD/uunfwuXriEv014kbNrWrztt8IR/N+GH//z88h7/DtQmRVlyoASs1TjPP
	cQZB02bUDJgcM++e6c0gj57n/Eu8bEyEUoxJmTqy2XEH6Gd/P0tEzlTvpmaA4nVvNuO8/3NQ9Fpge
	2n7ZZ3iuFTWlbcCy7A==;
Received: from dg by mx.treblig.org with local (Exim 4.98.2)
	(envelope-from <dg@treblig.org>)
	id 1xJrDY-00000001ocC-2SfS;
	Thu, 22 Oct 2026 11:44:20 +0000
Date: Thu, 22 Oct 2026 11:44:20 +0000
From: "Dr. David Alan Gilbert" <dave@treblig.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: krzk@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: Tips on tracing bwmon?
Message-ID: <atn3FAF-3GHPgvad@gallifrey>
References: <atd6TRv4HQApcPvY@gallifrey>
 <87e38bda-7ec2-4b7f-84c9-29a837696572@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <87e38bda-7ec2-4b7f-84c9-29a837696572@oss.qualcomm.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.12.113+deb13-amd64 (x86_64)
X-Uptime: 11:43:27 up 5 days, 21:03,  2 users,  load average: 0.02, 0.03, 0.00
User-Agent: Mutt/2.2.13 (2024-03-09)

* Konrad Dybcio (konrad.dybcio@oss.qualcomm.com) wrote:
> On 10/20/26 4:27 PM, Dr. David Alan Gilbert wrote:
> > Hi all,
> >   I was looking for some tips on if I can use bwmon to see what interconnect
> > bandwidth is going through the dwc3 usb controllers on my x1 based Asus Zenbook A14.
> > 
> >   I've got usb-ncm gadget wired between a pair of them and I'd
> > like to see what stats are available;
> > (See details of my gadget stuff setup in
> >  https://lore.kernel.org/linux-arm-msm/atJn2jfI_cZy3UMo@gallifrey/T/#u )
> > And that's struggling to get much over 4Gbit/s over the network interface.
> > 
> > One reason I'm curious is because the dwc3-qcom glue sets an average
> > and a peak icc limit, and I wanted to know what the difference was and
> > what the type of timescales were for how long it allowed a peak.
> > 
> > Are there any docs I should look at?
> > 
> > I did:
> >    trace-cmd stream -e icc_bwmon:qcom_bwmon_update > log
> > on both machines and during the run I'm seeing events on exactly 3 of the
> > monitors;
> > 24091000.pmu, 240b5400.pmu, 240b6400.pmu
> > 
> > (In the numbers below I've grepped for that monitor and sed'ed out
> > upto the 'measu_kbps=' part so I can then sort on the meas_kbps)
> > 
> > My reading of the interconnects_summary is these PMUs are
> > somewhere under the llcc_mc@interconnect-1, and in some
> > cases under both chm_apps@  and qns_llcc
> 
> These BWMONs only monitor the CPU-DRAM paths

Thanks for the reply and explanation.

Are there other BWMONs that should show the USB path bandwidth,
and if so how would I watch them?

Thanks again,

> Konrad

Dave
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
