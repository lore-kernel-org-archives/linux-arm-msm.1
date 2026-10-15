Received: from mta0.migadu.com (out-143.mta0.migadu.com [91.218.175.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88BE81724
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 01:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792026435; cv=none; b=DcLshDtC9uH3BC9BV2B+GOwqnAQLCMw0mJLZCPjopDQ4h9sLwL44PkDyjeUqAAtItEssGFDumGHC0Ir2uAKcVbvoZTi4lc1iB3p6WVBaKLekkt0WulqdidBz1d5bxEDdLCUprx+ItBe40vN0MT6GW0cedvRnR8mex6UWYxxE6Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792026435; c=relaxed/simple;
	bh=+uX67Vzm+bNsl4xNrP2XTPj4XGBE49HuM5HV9g/gQso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kWJurKp0xYBvIAt683peY15cEFHPopOVPeDav97zI8WvEDgCDx3WpMZ5hMhWYSIc6aWscmOjlsiMG28karewuHmovGltXmOYbYcSGDj212uW55N96QUKriYJALGQWT6r5WovjMFMeq8hiVDVbEmEfZTN4SiUSuVqYrOVjoxBlbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=BdhSi5aq; arc=none smtp.client-ip=91.218.175.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="BdhSi5aq"
X-Envelope-To: linux-arm-msm@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+uX67Vzm+bNsl4xNrP2XTPj4XGBE49HuM5HV9g/gQso=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792026429; v=1; x=1792631229;
 b=BdhSi5aqJHM4UYLxx9nh3KQGBk+xWP7fKVTASrGqm6xcGXExcr1rhEZfvQRY2rXKL3iyX/1u
 eE+/mv72GIRFjVr+Vt3aTB2RnB9K+Z9cwKpDLCSLZNQWwMFJKBNuML7CF5PCtByteeVwM8Yhee3
 cCajpYznyUBHR5IK7fR7RbM2ZwaaBXyP3izYgtMA2lLAh8cPi6Y31gPSfe1b/eJZuAmW5AYnyQO
 jp+/bc3i4uXXqL7OdA2k25RuIowyskTGwHXrftzWX7hdJZrWR4EHWd+hqW2Vt86xFG3K/w0duxw
 xiMstBSj25jYnKekMkdNNP+xVteXTqRNyYLOUkRdnpNwA==
X-Envelope-To: linux-arm-msm@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ffac52d5a5b33753;
	Thu, 15 Oct 2026 01:07:08 +0000
X-Mizu-Trace-ID: ffac52d5a5b33753
X-Migadu-Flow: FLOW_OUT
Message-ID: <87ff2d90-63aa-4d20-91e7-7758f952a021@packett.cool>
Date: Wed, 14 Oct 2026 22:07:02 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: x1e80100: no AOSD/CXSD in suspend with APPS votes at zero - which
 vote is left?
To: Michael Burch <me@michaelburch.net>,
 Maulik Shah <maulik.shah@oss.qualcomm.com>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
References: <20261008215540.15933-1-me@michaelburch.net>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <20261008215540.15933-1-me@michaelburch.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 10/8/26 6:55 PM, Michael Burch wrote:
> Hi Maulik, Abel, Pankaj,
>
> On a Dell XPS 13 9345 (X1E80100) I cannot get AOSD/CXSD in system
> suspend. APSS collapses, but DDR never enters self-refresh and
> qcom_stats aosd/cxsd stay at 0. Standby is 0.43 W; Windows on the same
> machine and firmware flash reaches 159 mW with 99% hardware residency.
>
> As far as I can tell APPS holds no vote in sleep, so I think the
> remaining vote is outside what Linux can see. I would appreciate help
> identifying it. Below is what I have eliminated, either by readback or
> by a deep suspend that still gave aosd/cxsd = 0.
> [..]
>    - sync_state: crypto@1dfa000 disabled, Akhil's GMU sync-state RFT
>      applied; GCC, GPUCC and all interconnect providers are synced.

I've actually applied the crypto series from [1] to get at least the 
tiny core driver to remove the QCE vote left over from boot fw. With the 
qcrypto driver attached, I *did* for the first time start seeing DDR 
sleep stats climbing up in "deep" suspend on my Latitude 7455.

Apparently the GMU RFT thing was rejected[2] and it should not be 
necessary? Though, maybe that's only fine with 
CONFIG_FW_DEVLINK_SYNC_STATE_TIMEOUT? Because since I've unapplied it I 
am seeing sync_state() pending due to GMU, and without the timeout that 
would be pending forever..

> [..]
>    3. Has anyone seen aosd/cxsd > 0 on X1E80100 with mainline, on the
>       CRD or a laptop? With which DSP firmware?

A few people in #aarch64-laptops recently did, starting with the "vibe 
researched" x1e-sleep thing [3], but since reproduced without weird 
hacks with nVHE EL2 and EL1 as well I think. Doesn't look like firmware 
versions matter.

I only have ddr but not aosd/cxsd for now, but I haven't yet tested 
with CONFIG_FW_DEVLINK_SYNC_STATE_TIMEOUT etc.

[1]: 
https://lore.kernel.org/all/20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com/
[2]: 
https://lore.kernel.org/all/bc2ed82d-0d91-4683-b9ae-cb4299636c2e@oss.qualcomm.com/
[3]: https://github.com/justririll/x1e-sleep

~val

