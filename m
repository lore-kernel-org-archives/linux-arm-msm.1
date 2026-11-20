Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175210;
	b=bkz24ytgiW+LkJYN/uPya5iTERt/exbfkXrv2Sp0zNPGRmhMWQ+hMMu/EyJzb2K5qazZ
	 NdPxCj1zqR1kxFNfpoiP4AoB6o9nHWIjqVc2Fg4aaCdUDqfkvnaH3MauUU2d++IL4JB5W
	 d0VDYkEWa3AHuYfPBcMpm609jxLH4hUO+3rUnUNUsgZiJ9qo7UXPEs6YU3qbKsA2zHkQ6
	 ACnV7UFoXCdefTb0BP4o9juWRa1X/xePvPtOrPkLcZHshLkfJVSwYKBJXn+ijF68mLEBM
	 vqi4ttTBpv5AnhXy8R+xGNnvHZvVB+Q820pjfNPlwhUsNyNZtiMNsP45Vo1dP70Ej4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175210;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=f21tDZjqKcOPY336nyAIM7KO47wuCYsqNootvKfID7I=;
	b=leu+NDTmqb9EQGhTXqoLWmYs9iEtX40L5WJZD0kg3LqM3P2z0HNPGohLb1SUzWSv59pk
	 OLul6rtDjPMGQzBPUpplmoE29Ri84wfFJyPzKqH+wmmBfRBL86K7s7OQqhpIuoqlEiXi4
	 +qT6xNQYxsSgKgXWJCqHP6iaV/s+xenwx20YltXsoA2NGdWkcYmSaRuKq9J4psIJa/CjH
	 qxYL7i4kIQxFhzibvuywmjGX8pY/O7M4f0ewxKdYtbMitBoXoPAdxjEtdXjuzalrIZ4b/
	 8oEWu4qghzWaGKpaGsT2jcXtxtwTUBsoYDUeirAYzEvkqpI0Fbj6FCVir+1dX28KuTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="aQBfA7q/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A786606A332;
	Fri, 20 Nov 2026 11:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aQBfA7q/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1187C1F000C0;
	Fri, 20 Nov 2026 11:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795175209;
	bh=f21tDZjqKcOPY336nyAIM7KO47wuCYsqNootvKfID7I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=aQBfA7q/tbMay95w3GWYwDt7xvivPiImCng8iARMDBbmWY958yEgw59v0ccX8B83u
	 Q8FX3fskwhhqQMnENO8G7WASpkrUPKEuLugVef77+ld7WH3Qo1aSkvoGWlcmkGlAjG
	 6XZ/gWt/2c85QS0M64vhPmFDABTleS3qCw5uzlI2FqGJt4yIghUq2fUf4vU2XEYnlO
	 LPQadcaQmV/mdT8KFbTolGzfAOgsCZ0FfJkEl7pI9U994n6WsU/NtWf1U1cpHLn28I
	 +3K8eYtpUN6MOfZ6IlLwUgN+6mOYjeGl6z4f6M8kGLKrdSU1302SGJoTfjBoZ6OBUA
	 caRtSFz56R/jg==
Message-ID: <00b0f4e3-e726-4537-8603-58570e79cc68@kernel.org>
Date: Fri, 20 Nov 2026 12:46:45 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] devfreq: qcom: bwmon: Reduce zone1 threshold count to
 3
To: Pushpendra Singh <pushpendra.singh@oss.qualcomm.com>,
 andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261119114426.4050161-1-pushpendra.singh@oss.qualcomm.com>
 <cf2091e5-44a3-473a-a5e4-d9044b053b45@kernel.org>
 <9130f308-e264-4ada-87cc-95553c5e9e0f@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <9130f308-e264-4ada-87cc-95553c5e9e0f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/11/2026 12:01, Pushpendra Singh wrote:
> 
> 
> On 11/19/2026 5:37 PM, Krzysztof Kozlowski wrote:
>> On 19/11/2026 12:44, Pushpendra Singh wrote:
>>> Reduce zone1_thres_count from 16 to 3 so the driver can lower the bus
>>> vote after 3 sample windows instead of waiting for 16. The previous
>>> 16‑window delay (~64 ms) is too long at higher FPS workloads,
>>> causing delayed decision making and measurable power regression.
>>>
>>> Power and performance measurements were collected for
>>> zone1_thres_count = 3 and 16, with the following results:
>>>
>>> Usecase                         zone1_cnt=16	zone1_cnt=3       Delta
>>> YouTube streaming (power)	4126.49 mW	3991.30 mW      -3.28%
>>> Google Meet audio (power)	3058.79 mW	2929.73 mW      -4.22%
>>> Speedometer 3.1(perf)		25.8		26.5            +2.7%
>>> Geekbench 6.5 ST(perf)		3907		3905            -0.1%
>>> Geekbench 6.5 MT(perf)		18636		18680           +0.2%
>>>
>>> The reduced threshold therefore allows BWMON to react sooner to falling
>>> bandwidth demand, providing measurable power savings in the tested
>>> workloads without a meaningful performance regression.
>>
>> I do not see how you resolved my comment, so same comment.
> 
> Thanks for the feedback. I had addressed the previous comment by rerunning the power and performance measurements on the latest kernel (v7.3.rc5) and shared the updated results in my previous reply[1]. I have also included these results in the commit message in this respin.
> 
> Could you please clarify if there is any additional concern that I may have missed? I’ll be happy to address it.

OK, I missed then the part of commit msg explaining which hardware.

Best regards,
Krzysztof
