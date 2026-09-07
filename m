Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC7D4477FA
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 13:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788788363; cv=none; b=mwWGd5cEO2PxdMahsI5mTqFG4VdLJXwS1ntfqhivEJw7L/nzQX/myk6m3nyRJ/rCR6t3eNTA21LD6b6+hhvDMOVBfxAHJ6yd0kUPtTdP8Y0e4camtfoUJ7Zvnmz9WHDnSlXpQ2dZpp0zDNia3lw3AZ3yPgJhj0L9hZyMND8WvaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788788363; c=relaxed/simple;
	bh=LuoUpMNshQ5t5idHuLjWLOPZmBgbq2ucZ5M7HsXdSsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mq0u507sbtpkmR/TlLzKad/3UvaQRXaPn2Ii436H56R+vWH4d7end59Oegr6kZkM+eujqEU2xR9STgn2i/+bRFiAwoUqdm//1LYDE2aQXynpjoaVn9Zh10agtK/FamIpHTtDKE9HT2ZmAkc0WwbMC3SH4DNAuDRQCUhi7+6B1gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DcMxJJhQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jUqHCYk7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DcMxJJhQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jUqHCYk7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687An3gh3230485
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 13:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Imd8sMtl7PDNNp8Q9khBRYLBDX+X8v274yOTSj2qwzc=; b=DcMxJJhQghvdxWJi
	Tk+FWZE67WMGXYylw5stS+Yt6WvgpXD1v9e/5yP0Q3GEDupUy3TjWkK86Y6gJR7u
	XYgkEkT63u/sqmHyp0ju/wzf0x1qx+DOv6La8QzlyOfRiSYc2N+j6kcgyOl1jgFT
	vHAkGJnSEviXjPWfSum+PBHah2REvWgKr5eSWrAR5YyOrLJjSycmjeaJdS6DLADY
	QgfdOskRmAIw4DSAcYJhN/WeEjZ41otAoUwVyWBVBUvonzITcziEjG+qVi9NntBx
	1htNsmCZGyHKClaEg3IAW0M4w53HrEDGeHtYxb3cTiIbN47636msAM/at6koH+Uk
	BWnl7Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfxktxac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 13:39:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so4523722a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 06:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788788359; x=1789393159; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Imd8sMtl7PDNNp8Q9khBRYLBDX+X8v274yOTSj2qwzc=;
        b=jUqHCYk7LB58iIfT0ZBT1j8rofwQA9K+zgN21+2uJZ0UdqZ/kRsyVg8PL6/XNqL/hp
         XlrvB08FGrP6sptVfnKhYALTTljJe1QHAeaZWcokKOrQ+c9JJyyBY3vzq+uPboTAJwIJ
         kMnjUDqbal+fzp6dPfqPB3/tIrYgp9RlyqY9Wwn/5kWYU8c6F/zUvtzAKGIgmWEtIkF4
         lMZZT0LyjDGu+tu4RCBN1x+ufRGqnUjnOkjLQPtzHQWp3hZ3lfPfBykMXcXBeB/6i1mX
         Isho7+lgwM7F3yePOnRxHi0iE8DgiEEAXFea7oWTkDKQ5oEKmFgYq2yPOylEiZi4wiXF
         65jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788359; x=1789393159;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Imd8sMtl7PDNNp8Q9khBRYLBDX+X8v274yOTSj2qwzc=;
        b=sOuWIlgWhJfAchhndMAQ8GXTCEgzr9yQ1bMPo8/q3xLxmPINVQLDQCedHZH6Y6Devg
         R1WqAIvaguaXsLYAR37abfaawidKYzUbHkd396EGsDKOVRHamhj3XE2YrgMeYihCBisG
         G79XYj8reAmzKpnsapMvwU5so2OhoaP3e6yAX+iJ7XyUadxlYsVXWo6pSP35sxh1SqoS
         KbCk9r80X54sygmrGzzaEsNkES3CP2AAeyJm1ET4XWmrZt22k3GBHxtZTjMkLFzLFKtD
         U/aTNZaSLewdwI3kgDKtJNMu8OwqzNd1iKPgiOKw3cDGGr5TfX7wJTljWzPaStPJvbRc
         GXPA==
X-Forwarded-Encrypted: i=1; AKwUvBxZcaiJc9LVSrub5m+Zr1AyyyiNswrWywKgseKHUgEoLh/eAhRDRmlZHkkHNsT+6ByMRTl/TbFyZ6jeW417@vger.kernel.org
X-Gm-Message-State: AFuF++mY68sZXM4BGsfxMHtW0YtExZZzjpEOwphYOF6RNaWoRrlatXn8
	y2uUiAqYE1jxTfu8aHf7SgMc0NbbvPEaOlFjSCIEX6LLVcj9kIApXIvKyBzoF0iERsMCm5mtWAS
	Oy8TyS5NslV5B6uef2jgVilhD9G+84IOoXUfv2Zw2RmUxbloGD4mMx7a09oE7G9pCu/Pz
X-Gm-Gg: AYBFou0KvRH8WbfXE4Cu6+97PL8UjuJFiIRO6qHa6vI5Ooe3HJ+33K0UMjvnwIzupq3
	8CdNu/sI0YXm2NDAZBFSUcUDagpmTsATQeJToXPETulGqvTigL6GgTNl6ldMUSVSjKGg8GxZyVv
	n4iJjgPgq0lHa/Ek83UkCHYB8XZcSGc1CMn+R7ovznAsREijLWUXBhq4OThUlQd6wp8ZPk62Na1
	jJAnRMYhbUqnxv+V6pnryLZUSo0ZiMB++OyH3eq88+xV0SC2tnKyoofZW4gRLhjNwsQM/OVAeWO
	TpIlBJ+3lFv2FwFBWthqQMUfnTy+x63OtY5ueFxzSmfPRKtQlkNWQJNuEE5+4QIRxgMblAU6U09
	BgnYgcwwwRDoQf7jnaL1YICNj9Y170K4=
X-Received: by 2002:a17:90b:5790:b0:398:9bd5:4910 with SMTP id 98e67ed59e1d1-39b2624f0ffmr33905918a91.23.1788788359414;
        Mon, 07 Sep 2026 06:39:19 -0700 (PDT)
X-Received: by 2002:a17:90b:5790:b0:398:9bd5:4910 with SMTP id 98e67ed59e1d1-39b2624f0ffmr33905857a91.23.1788788358993;
        Mon, 07 Sep 2026 06:39:18 -0700 (PDT)
Received: from [192.168.1.12] ([223.230.61.94])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm32726196c88.5.2026.09.07.06.39.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 06:39:18 -0700 (PDT)
Message-ID: <841a008a-1ce6-40f9-95ad-09b4abc7456a@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 19:09:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: shikra: Correct QCE node
 configuration
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260907-b4-shikra_crypto_changse-v6-0-0676f61894b3@oss.qualcomm.com>
 <20260907-b4-shikra_crypto_changse-v6-2-0676f61894b3@oss.qualcomm.com>
 <iow4xf2uflvjduax55tkbhaw2r4436uqvys22u6pbm3ry2gryw@g777gu46cgin>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <iow4xf2uflvjduax55tkbhaw2r4436uqvys22u6pbm3ry2gryw@g777gu46cgin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE1MCBTYWx0ZWRfXyakarJmYyDO3
 1C9lNtY2ibIoX7koQJMnclULzOHcUktCpZaJ92HiaVgqjQDSWdi28Hbs4hCeILElgBtEtC4U8yw
 AIOGtzIrS9jGgYA7cy9jT/xZMYA4FIv0QRPd7piTjfG64fkBgsJJF9JV0+wL/+6UxoWSeF/VhVD
 Hhotzc2SC0vm71kUfaaPBNeNwkMSqdPlheoUgOrtUlCUICut9PlQFlBXh/fVfGjTBtrDoFLo0re
 IN+Y3fUTvU5ri5yJ4XPJEylaiwYeRpLw1rQ0tZzxUC/cGDplMV/saSjD4C52jG+1pXd7LHgjiJ3
 Piu5x8lZRlU06ZA9RqjMKeGe9Ck2+fFYJI/SEJgtLTmJT/JmemTkExv3rJdUqCWjGQd1pz7kZj2
 BbE1EkttQdkAdtGCEaKQTgIqmnDBi9k6SEa27RhWWYUdYyTq7p5/fHHrMw4Eo1pGZ6A3DIi9te/
 309ATczleb+5thhROzw==
X-Proofpoint-GUID: iDgRnB3RiY8qNgkr8Co9h52bFB2Zezh_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE1MCBTYWx0ZWRfXwsWbEC5llOrZ
 SwXSylZvwlmr3e1OloMRBBVkyGHXdfNzyadatlvbzjXMuVb0a137XrmMe7BxcGtpif9eVAvfhf7
 4jIe6hvAme6AVf4xRHMK5pXbCKPh6FE=
X-Authority-Analysis: v=2.4 cv=daOwG3Xe c=1 sm=1 tr=0 ts=6a9ebe88 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=YDt4qybLIboWMMC/SFNjLA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=9GsNmjbEMOpVDnpVqTcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: iDgRnB3RiY8qNgkr8Co9h52bFB2Zezh_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070150

On 07-09-2026 19:01, Abel Vesa wrote:
> On 26-09-07 17:33:37, Kuldeep Singh wrote:
>> Shikra is derived from Agatti and uses the same QCE integration.
>> Update the QCE node to match the underlying hardware implementation by
>> adjusting the fallback compatible and related properties, including
>> clocks and clock-names.
>>
>> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> 
> No fixes tag ?

I was having confusion so didn't add it.

The parent change is in linux-next branch and not in torvalds tree
currently.
Shall i update Fixes tag based on linux-next commit only? or not needed
at all?

-- 
Regards
Kuldeep

