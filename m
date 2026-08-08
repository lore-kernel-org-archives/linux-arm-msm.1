Received: from sonic301-32.consmr.mail.ne1.yahoo.com (sonic301-32.consmr.mail.ne1.yahoo.com [66.163.184.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C345F2868A7
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Aug 2026 21:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.184.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786226170; cv=none; b=t1HnqEEnT4Njy60tiez3auNPe+wjc6JxegeO0D6d1MTCMtjBumloD3AjSygLzFvfQ9tWAHhUQoQ6hTLZ0pC0hUNeNh730dqn9/yVhyQO5XE3hfQXu2HZugIFWv8TXqOWkdFoe2aCY/s0bpQYFsB2Q0EBrHEJl4jS6dL7TPE+5qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786226170; c=relaxed/simple;
	bh=P9GZKua27kHk87nOoDuIx986vLiN96klWW2v6y0Vzbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AEQ8Gg9/DV9kBYSYvXorITw3w3a+aJpkbJ2m1dgpEP5W+0H0cxrFLrxJY3vyFuYK87P/O4iadNV6aPqc9TcNcqWoKDnXXjJcyjUZoKzXYru2bTEMQbV2KCToOBOW7xDgycevrfcET52p3MVt1r9dz8I9yVs++w2BhzrMo8h2774=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=qjgPSJQc; arc=none smtp.client-ip=66.163.184.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="qjgPSJQc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1786226161; bh=x4Exd5dUVZzZ1h6YcswkbFiEUHTp13+PB7/Hv0TP+HA=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=qjgPSJQcYj5LzA3iCuXBpDhCqimPvGuFnAsTwWTAVRozSHfk+jZYx70ZmDDVQKi6sZzhz8oacvLQuGTZ6qRnFfnsBJk+OaxjTrUNSNILXrRT6nKkbyflZ+BeJ7MmfCWxZrom2eaO1wsxan/TA258AUsXLVcbvtw5AZBHHN0CCtFtMBe1uKk50Y1qQ0MtOXtQA/A+OmzGvqdEIxB0dxYY9ORa5SlEBZIb7IUsmAiRfE7rkVMfAFLXLI3JdGAWne1o+vA0lDz8G9tHcQTwRl2UDuXasIbKvHxrTQfziXnIJg7Zu36WST60Gop5CVX5wphDPxXSJnBGWhhd8ijt9ZHQvw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1786226161; bh=1iodcGyylwFsLDg7njI+d24XO2WWJ5c/d0ARYdyz+yT=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=SH8S8yo8+8WafaRNyLqyAFHkxYeEs8g0RthStImI4l5TfHMiEofccVaMG2JkoPQ1RYMhvdkeyW3SdQDg6WoUGxylz5RnqnxAKVFMu4UL14T44PnuhJV54+fqbrKc7p7rjW/J4we8GYjFukxvqaSZibXeIFInk7d+k9HHFJR/0zB0lcd6t4eCLJ9UoRQh7EXFMJBv9ze0UUmoWsB+zef+onXfK1kyxKAjXjHcG665jueLqxhcEm92eNrql38BEhr+o7Tu/04jnpmPRMSLKUt11CTJLGx0K11x7jXuCFo98L3x9lCQ/4hTJXdb/db/32gMO0BpoeythTANVBu//wfKKg==
X-YMail-OSG: qwBOUr0VM1kRmTXYKP8BIo2gfVQZwq8EcGaOEWPgQjdCXlCuonQd3.Oas1jmRdN
 BuByy4mhgTPyDJVviPvMIVeQfHP3pBvwKyuYv.od0eZSJv55HPYoC5ofRmxc5Nzjr0YF0dM_LwP5
 ltzuuW1Vmi00Ki51ikMSMybo4IVgq5pHPbCyhQv9oY9oQGKI6CsXaAhZzG.jc_c5LQh.QX2r0zox
 wEeCo2K6O1GQVzELFYqLgyLI6eDKo8Z4.qm3B1mOv8w.AKF45FA_AH1QBB7JzLFr763SAlnhTz0F
 L4_FamyRbQ0KWnQSj8ARxVES0oyszLXEF9BoTvM2bdGT0.RhEMHHfWJTfbFWrREytRXYOJK4JYXe
 WFFtRlIpUIt_Vu8w_u51yamEW3tHSmo8areeo4sDjElZArFMsGMQ7.Votn7b6ShTXosnwwxp67Xt
 y.27cnz0qLRrN2_PdDHLzgZQjRTnIcw9MPb0ATmlHc7jBkdF1MMokmOguxil98fDGcSRyZAg4vvI
 PPGtcoDgh_f3y0EuUohPRV65vr5XbLA_83G.hWFLTPwgAVzbOmz7nWjRjXQ_3V8j8kDJnvZesTlL
 H6kO43uo8hLsBWMrLqFPoiq7HqAa8fQht_JuAb0lZ0k.mRqzJl9Y1hIhh6KDtC7MXvAibVYzlRTr
 JDNVs5_BlviU4MI0BRIhJSQwGcRe_Q32l3n3sWXnYJk8VRBP2R_u30QcqOo1SuTgu_0b1FUd.xxv
 yA3ZLKgfIxVnvlNpoa0tAt2F8kOGaQbJwQZj.fujS0_G76Sek3Et59jBkjf2du7SDt9vRbI16RrQ
 RUQdrUERJBY4O77TeboWfZVLA0.6fzA5ClTV2qiSdPHo8on777nrYH0qmVFKP5AGpqn2ePFOpkFJ
 d2dU4R0iau.b75F8vs83H0.T7ERW.jWQ19t82Aq.RjvyKUhud88KZXaSiKOhCLYeWtQXCvnKAYU0
 SgUVkhKqQW8BDx0XDpI6ALq7u8D5SRpCnQZ1vHbvuEEaQx_HZ1ryYl7bjnsYFbvt9cIHVHG9HgGU
 HuLCaXpzHv_jUUYLaZCLcA4iiHtRoj3HnVFlCZ4z6C5MB8yxqIZ.kjtORK7cG1EjfzTQLwUq197o
 eTvQMbDGuk0sbqdNKsCKHJuqz5GsChSUAEKtFlmxzBmhCUW61D39IdCRlSOKdOmO58Y23.qcxduq
 Cl6J.TVGy70pX488DSixJIjLBYz9gv8QLKXcNBuAKQznuGVIrKTThG67K.aNm_yKKqvbDvqxmiGi
 lCD.0xzaip_Ao1RD7LaJ9tgBCYPKGs7kPl9SfqH7Txy1VixdWLqtA9rAvJZmUW6NLMwDjRgvvUc5
 S54bXPRwxJs8Xi2Dh2BbPtVTp5WoBckYQAjhauHTbc78JjQToWGsgJi89I3nS0HPhx3eaKF4X_OH
 i6Vqd9pBXexN3ZYRmBrXW7aYNphaH39ChEnKupI9qYsmJ.oHJaY4rbZTZkLTBYL_WBTkuiuccuG8
 PZyIJqlXgWiQjR7.4SWmil74diThmDaMUKIveMtB_80NLcWFNDxDN8n7RrpmgTb6ZfroNe07Gy9b
 LqQ1ORYHnI7LVHdQBrsJ.XxnAGS_5J9cbwx1uJZjNVwklRDI5FFFxZNVf0ABOcdgBnF9KJOv026g
 5xeWARGldU.mpW83ip6mZZqLgNJA1abbKsw2i4MwKN4oQz7wcuWrmNVufOalxSwT3UG894pQVPS3
 8VvxeVjRva73Rw8Ff9H1h416VT060n5tCu1L7AUmebhLiX_wDbBPP2H1WF3NeG1FOJqCvr0wxbHE
 CX9UCvx472pen8HsG9OHIwR11DSkShTabDusMQUGpbExS3TUGXYhIhavRnOOuViqgp66JtKH.Awz
 SCqwkYMXyEfcT7cIQTb8o.VXY5x7QmXzwUaJ.yhNWIth4dZbd2vxS77qTro1Vrb7w2zaIIulKWLj
 yGpdB8u7TQmcPxe62bM5cwZSD_HB3lBwXwn4JUtoZ6qjnH5.C4UJIURyAry4wqFD1H5eGikccJ7S
 sdhdNcFbrN33IZCgnOUJRT7ksm3yvOy043jnE1CUHtVUqqbY3foxP1gJTa7HKMBzZUSm54e8vC6k
 5hm9i1umFVhHQnf3qjO6Yd_I7p5.UivovU_w2qIA5kSAHfR5in3XMqVMJEoCHqi4hkmBPxIqOa4a
 kjU6nTJH9R_IHyyA488uBtKdjOthmUNzuI9VDa6ISRJxXoPkDtCs4RC7loo_nD0Zj7tdvj0uY8az
 t2Rw29fHJ2qrBm0dBg4gZU0Y56c9_z1WSxctqdgNkfvrTiBY8cd032oroWnfuXtWEnmB.l3ZdO8V
 wA9qpI5whXKY9VjTaLiJ86cP_KgVTdMiOMw--
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: e3a40ec4-6b56-49ed-8126-18c88621383f
Received: from sonic.gate.mail.ne1.yahoo.com by sonic301.consmr.mail.ne1.yahoo.com with HTTP; Sat, 8 Aug 2026 21:56:01 +0000
Received: by hermes--production-ir2-cddf86dcf-dn8m5 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 523dfebdc042a695eef441963409944f;
          Sat, 08 Aug 2026 21:45:44 +0000 (UTC)
Message-ID: <fdc4410c-18f3-4f34-8519-deb37862477c@yahoo.com>
Date: Sat, 8 Aug 2026 23:45:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: ipq-cmn-pll: keep the CMN block bus clocks
 enabled
To: Jie Luo <jie.luo@oss.qualcomm.com>, Stanislaw Pal <kuncy7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Brian Masney <bmasney@redhat.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <1dc44e5e-7787-47f7-938f-1ac0676d96d2@oss.qualcomm.com>
 <20260805081240.11497-1-kuncy7@gmail.com>
 <7913cc81-5531-42ac-a85c-fb873e439a07@oss.qualcomm.com>
Content-Language: pl
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
In-Reply-To: <7913cc81-5531-42ac-a85c-fb873e439a07@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.26254 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

On 8/6/2026 4:33 AM, Jie Luo wrote:
> 
> 
> On 8/5/2026 4:12 PM, Stanislaw Pal wrote:
>> On 8/5/2026 Jie Luo wrote:
>>> Is there any use case that requires accessing the CMN PLL registers when
>>> no downstream consumer is active? If not, I don't think a fix is needed
>>> here. As you may have observed, debugfs clk_summary can still display
>>> the clock rate correctly even when there is no downstream consumer and
>>> the AHB and SYS clocks are disabled.
>>
>> The clk_summary observation does not show what it seems to show, and I
>> have to correct my own previous mail on the same point: this driver does
>> not set CLK_GET_RATE_NOCACHE, and clk_core_get_rate_recalc() only calls
>> .recalc_rate for clocks that have that flag. So clk_summary (and
>> clk_get_rate()) return the rate cached at registration time, when probe
>> still held the bus clocks enabled - no register access happens at all.
>> It displaying correct rates with the clocks gated is exactly the cached
>> value; it says nothing about whether an actual access would survive.
>>
>> As for the use case: on IPQ5018 it is booting the SoC. With the clocks
>> gated after probe, boards hang within milliseconds - 100% reproducible
>> on some builds, before userspace exists, with no consumer anywhere - and
>> the only variable that changes the outcome is holding this reference.
>> That is also why I do not think moving runtime PM references into the
>> clk ops would help this platform: by your own argument nothing calls the
>> ops at that point, yet the SoC still dies. Whatever the fatal access is
>> - a CCF path we have not pinned down, or something else in the same
>> clock domain - the platform demonstrably does not survive the gate
>> itself.
> 
> Once the CMN PLL module has been loaded, there should be no further need
> to access its registers during normal operation. The CMN PLL provides
> fixed-rate clocks, and its output clocks should be initialized and
> operating at the correct fixed rates after the module is loaded for the
> IPQ5018 platform.
> 
> Regarding the hang issue you mentioned, it should not be related to the
> inability to access the CMN PLL registers. The actual root cause of the
> hang should be investigated separately.
> 
Following along here - just want to make sure this doesn't get lost:
Stanislaw pointed out earlier that clk_summary can't actually be used
as evidence here, since this driver doesn't set CLK_GET_RATE_NOCACHE
and so never reads the registers live; it just returns the cached
registration-time rate. That seems like a fairly load-bearing point
for the discussion and I haven't seen it addressed yet.

Given the hang is reportedly 100% reproducible pre-userspace, is there
a concrete next step to root-cause it, or is v3 the right call for now
with a follow-up tracked separately?

