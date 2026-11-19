Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795090050;
	b=b0iil8ZlwJCZ0wFkkqREDZxGEX/ssVeYw+o+QAoqlMb1puQT4s0FEKB9yfDc8PVt6iUf
	 0qD0Hb3m4Dxb+U1fJFf1uABd6Cl8l2QtEQp4g+VwYVFH1b+Ow1NAxosfBspmGBsXDO4lu
	 CYrD5gs9GpzQHf0cce2hShK8vdEZaEvuF4msOsNvAOJiNJM55CQxFiRy5gDgn9BOKl6Cd
	 TRQPztHH+slYXHvBqPKAbN3WQAWwMgVg8j4jteeZV9xBuJFxPis7OdK7U9LmrumLCnoz9
	 ZMCO+T1fKnT82BrWDh2+4UYLyMAIA3K/jyqcNA+DvfAtsFRyWdfY6VE0MLuBUVS44Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090050;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=sEh748hTFXKoOcx65XoNThIs8/IpsB6k+/cDw03wuuQ=;
	b=e+OwexX0YnWslqWCKl9ysuua656vkf2lWMVQIHq/LJEHahfoYa0UHx6UplZ5CMuZQakh
	 GkKk4LGlD1E3Wi9qRWXTOoUnFol6P/kvCsMFsvHDk5odNR5rmW6utNIVCvlBvi5YPIzpp
	 SW7YbUmmyLrLD4YVI4IOu7jjFlvZ2E6NcTnz30AircYTDv1lqOBGExXAb6mjWb7OgduUA
	 SuxsgIQaePOyq3e++Tde3j3CQlbgjwumWh76+TylJGpn+nynL9Z/RRgh5WjoQHw66+LAa
	 jYYPHKz56equm2wPuk74Aqgycl8ennCSNSLeNhXQRSwZNUPzzN9kQ+Tg2BBqPS6ToEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ebXpSfCf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E41606A320;
	Thu, 19 Nov 2026 12:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ebXpSfCf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AEAE1F000C6;
	Thu, 19 Nov 2026 12:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795090050;
	bh=sEh748hTFXKoOcx65XoNThIs8/IpsB6k+/cDw03wuuQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ebXpSfCf8kV1dK07wotHuytks1bSCVLhMs9HtkjTk5CxdHsMwFCN7o/mk92jksQLl
	 GNFoG5p6F1DoJiVYzjXFzMi1K0hRkOLheT2tQ3Y8wPOv5BIO+3l/JugEjkGhfG/xmq
	 aGZo2O+3M7zW5FhNx29Ig8y3Ue6m4OeqdIoYLA6KHQzHblPUKm7p1vC1xfxt/Ywtly
	 RsoVahPbktMkx9ToZPWrUDYhU0Ipvuq+xSiM+RMAIZY+kOacv/RKVDl9DBEVSH93wq
	 Z8zW90bjcB8UmPAvwB+pnLvVHeH3CGW+TPhnIKKCrEo/IsYF0b+A5QUwqCJaRQdTH8
	 OXnkpNJrf2n2g==
Message-ID: <cf2091e5-44a3-473a-a5e4-d9044b053b45@kernel.org>
Date: Thu, 19 Nov 2026 13:07:26 +0100
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
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261119114426.4050161-1-pushpendra.singh@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/11/2026 12:44, Pushpendra Singh wrote:
> Reduce zone1_thres_count from 16 to 3 so the driver can lower the bus
> vote after 3 sample windows instead of waiting for 16. The previous
> 16‑window delay (~64 ms) is too long at higher FPS workloads,
> causing delayed decision making and measurable power regression.
> 
> Power and performance measurements were collected for
> zone1_thres_count = 3 and 16, with the following results:
> 
> Usecase                         zone1_cnt=16	zone1_cnt=3       Delta
> YouTube streaming (power)	4126.49 mW	3991.30 mW      -3.28%
> Google Meet audio (power)	3058.79 mW	2929.73 mW      -4.22%
> Speedometer 3.1(perf)		25.8		26.5            +2.7%
> Geekbench 6.5 ST(perf)		3907		3905            -0.1%
> Geekbench 6.5 MT(perf)		18636		18680           +0.2%
> 
> The reduced threshold therefore allows BWMON to react sooner to falling
> bandwidth demand, providing measurable power savings in the tested
> workloads without a meaningful performance regression.

I do not see how you resolved my comment, so same comment.

Best regards,
Krzysztof
