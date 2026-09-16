Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2033264F2
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 08:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545924; cv=none; b=uSUxqO6ItNnBj6HpK30DFAJyfk/tpahf1l39u5c7TJFpw1MQyLxBz3VNueA/X6NLSG4fpwZrOogbSsahLZffB68VdnehRGrHL4aum620XDvhhGZAN6vKn82CEZCLfoMDCVic5171B45dMBomk13AvpaUsjOLa50MZ9CBvHPZV2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545924; c=relaxed/simple;
	bh=PcoDdCIrr83oRm7NwUejbqInnkYFw14JsuggRsrAzaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hCJuXwj761ygYdc/AH4QjjEZRZc0An7C6bSaBelD5LIVMEa5rHUDJ73PqQGjz0EiQt5yizmthSTz/sLS/zGv0yIxfo7jwkQ/b1+UdFhW/r8G3XAU1uCpJw9VY86mJnmiljjyYVRdxZjBKFIsPXy0xCaxn4LekuwBncjHl+JlSaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RnKS+OX6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WApN8GGP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RnKS+OX6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WApN8GGP"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G69eEP1163431
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 08:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tMtG0dE9KOzOS0Ul5d7vnn6cTO8RBI5Lu4clV+yWEr8=; b=RnKS+OX6LY6NAIDV
	eTAXl2puL2Z+1bukV8UZufyeIOEq3wY96Me19W3U7ezAvYd3PwQYrWqY2mR3oX/d
	XdWxreS2yeXYCJGP7eoiaWlJzFYojxZNEHyqEhCelupeqTKrc9kw7flPfIAfDSXI
	E/LX9bGO7fAoofS4Cj531erUqEPL3+J6KWUwg/k+LtOJUCW5zTif4BGNqmT4buYw
	mUzajS3SKVyg2MWhPs4PHG5+UYkeqiJ6L5CPmuTgVkoY482HktOIELAgyRBNcP3R
	TrJqfHpTREoqbWnQF224ivLyloMpwQ5G0xt5+JIzcZZsTafrhgCgrXbZ7/sNYFE/
	LBWBEA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq9n63jam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 08:05:17 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e9fc6dc091so5553340a34.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 01:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789545916; x=1790150716; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tMtG0dE9KOzOS0Ul5d7vnn6cTO8RBI5Lu4clV+yWEr8=;
        b=WApN8GGP1xIpF1SAVEpzK5DaDe4ich9pWJfHCXI5KHW/dp7bJfDN5aqZB3OD4rrReK
         b01uUxGePef/HvT+FCHqzo4ZrWg+a17R8WMdYWSvXKoYKvPheMeMyqwDMzDjg6caZ/n6
         NTbDhu2MQCKaOtaeq7sd9dv4IRoMUwhgmr8p6sqcQkEX+M+YA2fTQYKUzeLhdXz4INgF
         EMcYff00LRdRjrjekmG56oNb/0yU45SvkSFONREPV/nG7M/LTcZdFHg6EbCLKrt1Qmn2
         PABOvUmXSR1TcT3Jz3maLrn/BdikHdc/HZwLSZSQivqLaBSiK3hwkl/PacWt6l7WVpKl
         5mzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545916; x=1790150716;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tMtG0dE9KOzOS0Ul5d7vnn6cTO8RBI5Lu4clV+yWEr8=;
        b=WRuUFN8ekkqz2uTr7V3DbG2a1vrGwKNusy36piHFLCxjWLwjU97ereoeoQzl1Hrw7+
         hvi+YvPJ2b8E3VDW2Xc9U8tOY5QfO1PIDsvf18pjqMchCSx0154BWAC5ZrrvFuIboXGB
         4/FCfpuesnGk/k/U9CQt1H9wXFSvimF+cyOli87+0B/qx13R9N37px4HSE5Yc8MTp/YO
         vPlUjNn3PGQkwxUXHY3yt4aIu7qxbfnYCFQlED6HyWAIDAwZBRXJJjlrzY1vQU56m84g
         euXDYmhmCqVJ4LCCOZMJQngFyunnIV9aorfLhWOuhVb12D3ebrJ8vt6y7iLqTBVSZELq
         LF8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxEkw6pvY2s03QUCq8CcteWCQPwhNSCFsJ5d/jk5noeOVN5g7utztkYf8ZUU1N4vdzrrylnAms5gPIQZdHV@vger.kernel.org
X-Gm-Message-State: AFuF++m/rybJGTBVa1JxNdeXDnHez6LRkNDOIFPgf8nUcNXylRWBqA0X
	YS/Ojqo4IVy980YRW3GmlR6atSym1u6M3WPe6EkR7vHZWuh0DCmbCHcfiEtZErWDcYhSFckoQSY
	1d+TBhtsUC2ne7XkfoxxM8xlFdp+mNJJU+8orbumPaegn27wJCfbHzx/uC6aEpMQ0hJpr
X-Gm-Gg: AYBFou1bYJOh9Q+pamDrhPYmTbO22pV50tnGqD/jIKcni2k9DsVtliYwO/k5nBuPV42
	f0aHwLwz+DDDJ9SGPY6h5QUe5F2ZRrkh78XKG0BqGeSOWJZwR1zKD0Zw5LkcomozlQ7MKf/xhkN
	Ae59v0RKBOvswt6XTHFsHGQjEIcLPO0pAmRScJ32zor7o8vP9MmHWWC9q4IGVWE7NFARftAlfWh
	OJJ/Sazcf8a0td6khr28tkRwsqm5pK+8am7TT+ZQQ/3EfFmO45bpt2fNaJpwnKiCRiC+sEGEioH
	mxaYmE1xaaedgdMT8u/TKKxlCM9UurmF+tNlm+t2tTJ5WvRTWRp9GVv8jyxvWHZmXpzMEcNNCSJ
	95crT74vjEXv+wWFmaPNSL8oZZ0fAyw==
X-Received: by 2002:a05:6820:6ad0:b0:6b3:6236:6fa with SMTP id 006d021491bc7-6c7d1cbf597mr1540870eaf.21.1789545916594;
        Wed, 16 Sep 2026 01:05:16 -0700 (PDT)
X-Received: by 2002:a05:6820:6ad0:b0:6b3:6236:6fa with SMTP id 006d021491bc7-6c7d1cbf597mr1540838eaf.21.1789545916104;
        Wed, 16 Sep 2026 01:05:16 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395bf6e8esm4914471c88.0.2026.09.16.01.05.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 01:05:15 -0700 (PDT)
Message-ID: <5ff87d08-c263-4b9d-a18d-c8da8fc0de1a@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:35:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] regulator: qcom-rpmh: Add off-on-delay support
To: Mark Brown <broonie@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, robh@kernel.org,
        Saikiran <bjsaikiran@gmail.com>, monish.chunara@oss.qualcomm.com,
        nitin.rawat@oss.qualcomm.com,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        lgirdwood@gmail.com, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        krzk+dt@kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>
References: <20260127190211.14312-1-bjsaikiran@gmail.com>
 <20260515111647.qg75thdvcbvvjpoi@hu-kamalw-hyd.qualcomm.com>
 <06a264d0-6a14-4b71-b783-82b771f04411@oss.qualcomm.com>
 <oa3okt7mdhoqmrebwim5yswarbcacbmhpwfvqbhtv6ib3cwrwi@ddox6mw3uhmy>
 <0d4fa333-df22-42b9-b9c2-ccb43ac4fac3@oss.qualcomm.com>
 <3pybhkqdvve2ct6burnhav3utis6nljz7ncheqcrs7v55ullz4@nek57empeoca>
 <086f8e7c-0afa-45d5-bdb2-54ac5f79eefa@sirena.org.uk>
 <xmjovrqonged7m77zlx4gbz6xvfksygbw7g4vgv2stlucvqoy6@uie3qdhdtkoe>
 <aqg-JSTrbg-xR69l@sirena.org.uk>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <aqg-JSTrbg-xR69l@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BdVNQbt2 c=1 sm=1 tr=0 ts=6aaa4dbd cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=_IcSBqDZdpl3-7frVEAA:9 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEwNCBTYWx0ZWRfXwlGPU+eJBIk2
 SS47VQCjjr60K7BCVC169hiKrzmoSf8SDTSdIEOEmV8QyX/LBoxkSnCpxr2/LtQrpbfnL7Cv+ds
 2mDpLF6SspJpRPmrbDvmORUw1ZBLXkGsg6alMaaJznfgdk2mCqfIxjcZemkB2sYmHGhGM8fv7sU
 WrLBlC4taqrQjyhbU6FzZx/mU1AYgyaok4SudGK3liEWYM8w7LCTXQ1WP14sirw+fB+noxso65w
 7MK+cE46pEMcD1uHjE4wlBSMoocObs3QP8T2Ow0+rhS1d2S/KvRnmUoYmQ7NwzP53YSUJBXYPja
 U1lCd6+vo347SGgEeioJ6qhLwXexPeYz27/vDSjS7/stz2s4E1fCt4q/p2tTqRw79b0tb3i+tfz
 WUbcHMAB7fuXpxzhGs+zteqk61EAP34i1BmaJN7GZWsW9j5rl4UQIlqrKquzW6UpxlPKE0uh7lh
 x9qF13jq8Y7u7SRBonQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEwNCBTYWx0ZWRfX9n/6qPkEBRxy
 +tqRLu6sSLuC+oNTMa/toPAtYdGbmSrSLYm1Iq0+2CENNyDpQGBQV6CEsg3bDD8KCvzKQon+LIf
 Df8FCugH/GeGRXSGLeawMKQDFVCCRAY=
X-Proofpoint-GUID: uNYFXUXwQVh0PRZ7cxsgBgyxk3DMmVmk
X-Proofpoint-ORIG-GUID: uNYFXUXwQVh0PRZ7cxsgBgyxk3DMmVmk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160104

Hi Mark,

On 9/15/2026 12:04 AM, Mark Brown wrote:
> On Wed, Sep 09, 2026 at 02:34:21AM +0530, Kamal Wadhwa wrote:
> 
...> 
>> 3. If we can avoid turning the regulator off itself, so we may not need this delay
> 
>> point 3 - We evaluated this for UFS - but the problem is that the issue happens in
>> the defer probe path, so if we avoid turning off the regulator, it leads to long
>> error prints appearing for the regulator being left ON. So we couldn't take that
>> path.
> 
> I think Rob might be thinking here of something like the runtime PM
> autosuspend delay where once the final reference is dropped we wait some
> time before we actually implement the power off in hardware, thus a
> quick power cycle would never actually get implemented.  That does sound
> like a good idea if we've got issues with quick cycling, obviously the
> actual delay would still be needed but if you've got quick bounces
> happening routinely then a delay like that would allow you to avoid both
> power off and ramp delays.

I'm working with Kamal for upstreaming this series.

If I understand you correctly, instead of the approach in this driver
change (only setting the existing variable "off_on_delay"), you prefer
having a sequence somewhat like this:

1. Regulator (if configured in DT for this new behaviour) gets disable
   vote from its last enabled consumer
2. Delay timer is started
3. If regulator gets enable vote before timer expires (quick bounce),
   clear timer and return without touching regulator HW
4. Else, disable regulator when timer expires

Is this what you meant?

If the above sequence is right, where would you prefer it to be
implemented, in the regulator core file or our regulator driver file?

Thanks,
Jishnu

