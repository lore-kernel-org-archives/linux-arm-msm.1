Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793902942;
	b=tJLjbQ1J/bZv5tg8jrl8SWb6sKmyz14e66Mf0oJx9k7mrSy0tVLWLPioy6IS53OXY9OT
	 V8XNFyR975I0SK2gwP4PrdD27HobqMSd4dS+yfnRyQiUKYG4bZTjCBUgaF6SUoVvvHGBr
	 2oh4wjBqh5q7kzcWBTgGn7QyZkr4QzPfzmaRwcZ7PtXRN9chzoyFMM0V68U0ObrhP1WyN
	 jOBB49kQZifl84Fv28QyyJ6PMhIswp6PUimdFe+G2SoCbuR67zeEYLoLjz7QsT0ZEqQtu
	 daq5f9OqYhi28A/tslYogBD8MMuQH+3nFSSf4yb0km/7XW4nEJiGCnVQciK1+O90xzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793902942;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YHJMEIRh83r7RL3if+qhlEXqyFZGQxnKFEkhzXkGzVg=;
	b=b+nmjMvxtAtxwbHTzLtpQfmVyopPRsD1r0m/awpUKlETIHQxAykdrDXmxOOkMednJTFW
	 vu1s2ab/1Uf2uKI5dt9YY2m9GC1uLSGudxJgE++wJf6UYX1R0RzIGyxyPM5y8NoOIpcJW
	 KoGSyYrOUmSXQPwfmxNnDu3SI2ns2r0/IR8ZwDvFDZ1UEFNSFSnY5VBy721AqG99XvOwu
	 FZgoSNwoKv/hOf2HTnsd8QFd5oUODv39LCjIoTM+brDQeuFT4Xle2A0a7dtExqExAaEqN
	 2rOh0q1EQIz5je4dmDvsFe8M8hNrnEatpnCKYwfkxtum1LfCEDoqhIf9QgiETZxmUZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C5A2fBWE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VKuZEg2n;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D95606A329
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 18:22:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79D95606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C5A2fBWE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VKuZEg2n
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeKB51485079
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 18:22:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YHJMEIRh83r7RL3if+qhlEXqyFZGQxnKFEkhzXkGzVg=; b=C5A2fBWEz+nOeUUa
	yXR1tZzfSVPkA0Ok9Lm5hjlni/66tbBOIlfMQIMhBScbceYCpVWRkuFOHowAIafc
	Ccx+/9veRF4CPl/hJzwm0Lx9ZpxeuLkhzjxtPU23Btr2S4LR+IwYxYdt1mo9Ja/2
	4AK4ZqgT0XzEVGq+cc4BN++k3NHnL5PoVHscghV44poXqP8+wmFjQ4aG3RmxTobI
	wJs276tvSzxgpo29lT86qIUBB52NYLlju/ywUQ42ZutoBkXCm8I57/uJfVJ6YYq1
	8WmgM2R9y3X88jvHNCkFj3OPdTpB+aoRB1GMBTpBAxmiKziBsvCL/tZx40864F6V
	efd17A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrpaajkra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 18:22:20 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3843224eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 10:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793902939; x=1794507739; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YHJMEIRh83r7RL3if+qhlEXqyFZGQxnKFEkhzXkGzVg=;
        b=VKuZEg2neCzaL8hArZuAdDn2OVNiISnxjcCjubCYh7sFmtCczctw0uNQSol0U6SQbG
         mzbKny2pzbSUbT+pYNl5O2cPXu0s4er6EIGFE9bywF//L/VCEdr5WBArVFs8CGzc4LBN
         2pzxlWzw8oJEhwT6i0SfaE6u05NEMVk4XEEzTLCwv0ldlef8VmX0O7z7rFiuSNsbmIr2
         s5WOt4NzI2T0aptvlevG28+VohhftI50eLPMMNXhk7BIuGjQ6DMajG5k0krFfvfdtg3/
         CDZVx6OGlz4JjetC47suthxYyj6YvrEs4LY9bbczeHoYreGeuop0/vNVsQQWBl+ATwzQ
         cxrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793902939; x=1794507739;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YHJMEIRh83r7RL3if+qhlEXqyFZGQxnKFEkhzXkGzVg=;
        b=h62nVpnHnKOs1j/W5WKPghbgibbYoaVYocWvmN0axCbR4gAx7/Hzzf4lTkJniUwCZ5
         l+BJL+AQ1Fy0HvDIeqbU6I7Hg4XHpN4yG4L+lJS3vlrkIlybGtZTy6fgRkZ4BdKOsa4G
         YR1c9fRKH3G/Z4W6GRJAkAeCHvoFWXKzR3JT1EX1rjwJokQV/WHuyjVu6spWc9Mp9MdI
         tsQK/0ytMMj3BsxR6cnkuunQUvYPWjPgp4fA9FDg9i7tbhtZZvBpYR5Rtv1pJtKhUMDY
         W0MHVVUAmxkG5GvgRIO6ks8sJJZb6R32HQXs3SRqGZM2Hrzr0FL4wN0+HLGjB84p9Va9
         8h+Q==
X-Gm-Message-State: APuU4Z/oMCI1AWMzAchLDnLpL6oUoLOeJT9ZbINdRAs93aMyM11YeWZ7
	vshnSOplLWrAPCd0QiMFzmt5o8JYzNSiA1gY70tYM0s2hKXAcb8YOnV+Se503lpg/IDV3cug+ku
	ZsGfqGG9+BtPrqPhsGGCWMHBnfmkeGJfdfxdxiHmzxN2RvGzuMSNILKNGDWD3524L8/c=
X-Gm-Gg: AYBFou324PFnXiid1BYGH9tORQE0rCKbius8eMztDjSB8hs2ZFT1kXVEnCxRFW4dZvM
	V/spgCBi1MgOadt901xz2IyyJgTzpNioCiCsHMEurK09wizTWb0mRJm1b7rk7MOJ5KDOSejrbss
	W+6FuZ3C5gYpzqLjUFAigt0WSzgRqCiotd+ZX/8K8n3zaF0PijoKgxso53648vf0uWZpKT5mjNL
	PU6CHOlKeD3tIuREZJGGK2FTidvZ0T61OCECIppt7gPXQnmpHMBNrzZhj/L4YuAzmfhz2vl8ntS
	qKrFTQGDv2M22WlgHchWrgEDqVXGH7j6mRR9N4kD8ORbzHUK4lnEpZW4JIMwOlwUR4uYBoEaxJ5
	pDbS4jucOdIwhA4thkrb9Thq8pAlpcw8TuxgY6eCNK1znqTrk8VHq1RZLYpKym/aTTUS1Zggpbr
	APEw==
X-Received: by 2002:a05:693c:87cd:10b0:36c:a084:30a4 with SMTP id 5a478bee46e88-36ca084365cmr10656617eec.21.1793902939028;
        Thu, 05 Nov 2026 10:22:19 -0800 (PST)
X-Received: by 2002:a05:693c:87cd:10b0:36c:a084:30a4 with SMTP id 5a478bee46e88-36ca084365cmr10656556eec.21.1793902938276;
        Thu, 05 Nov 2026 10:22:18 -0800 (PST)
Received: from [192.168.1.11] ([183.83.138.70])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f66086a4asm210818eec.0.2026.11.05.10.22.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 10:22:17 -0800 (PST)
Message-ID: <85e8effa-dc1d-441e-a721-e4078388c9ef@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 23:52:07 +0530
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
Subject: Re: [PATCH v17 0/6] power: reset: Introduce the Power State Change
 Reasons Recording (PSCRR) framework
To: Sebastian Reichel <sre@kernel.org>, Benson Leung <bleung@chromium.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        Guenter Roeck <groeck@chromium.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        avaneesh.dwivedi@oss.qualcomm.com,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bradley Morgan <brads@mainlining.org>,
        kernel test robot <lkp@intel.com>,
        Francesco Valla <francesco@valla.it>
References: <20261019-pscrr-framework-v17-0-69ea6cdf4731@oss.qualcomm.com>
Content-Language: en-US
From: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
In-Reply-To: <20261019-pscrr-framework-v17-0-69ea6cdf4731@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3MyBTYWx0ZWRfXxxArhaX2HdNz
 VOdHQGZUxDU2vmdWuV+Zrf/FiZhbvsr8lmTmxOwlZaLmBIX6Ih+CYgOVU53wD1OuGct7HJZ2FmT
 h5ua0Vdctv5c2mbEPphJ/EhAPIHy5h1TsmsC0zFHH3+dDCp8InHuCaUqKzWlYCUCJpuqrO21T25
 tkPyYBpnMh+i3BrWpYe+7YJy1fhFNbhchfACYBUlBMsKmfkTqRCbDBTGvmS2esbp9A7pnOs2Cyv
 rjnYA0pNiwts0xMjF+QM/CAl/hS+KFbvqD1Ux5/XHbKYqQ1EoEAKM2XQvGec0w/5qPzd3j1mEDY
 HMElmdQwwJcKIgklUcG6IeeY4vgb/cvwCndff1WmES5q5E4gGPZOobhrQkM90WVf4TUryZuzSYt
 0PfuHmOaiMS0u+uzOqp9pq19yO9sxJgYMudLj21TO/7r7Qnulq+aTnnvQzaqzu104Bz/QGynaN0
 TkpNSU+fhLlwiMmGLuA==
X-Proofpoint-GUID: xWPdM2WT2kZXebXLjALcyAGjB1JW2vWG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3MyBTYWx0ZWRfX9Fi8PrivrMqv
 XD5zhbY1ZLUYgoEgyySdfHGw8yGI7B1kbyLWPIWX0O4d1gylfRfVKCSWg/eWoRC8JycwAXwquT8
 FuXl3iU6Egq8SW9s6XGfxJXoOPckS50=
X-Proofpoint-ORIG-GUID: xWPdM2WT2kZXebXLjALcyAGjB1JW2vWG
X-Authority-Analysis: v=2.4 cv=WOXqzXsR c=1 sm=1 tr=0 ts=6aecc95c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ns+0gdUR07JhZB4Cb4qmrw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=8mBobP89YcDz70HNg1MA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050073

Hi everyone,

I believe I took into account all the comments and got the 
different reviewed-by tags from the different maintainers for the 
changes touching the files out of the scope of the 'reset' area. 
Is it possible to consider this series for merging ?

Thanks,
Faruque Ansari
