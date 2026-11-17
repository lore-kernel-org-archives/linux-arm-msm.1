Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794948014;
	b=Io62OmWgph5h5O0fZy+21dvN250U1VZDkEIdAsNCcjnUtrhYZBQGz4y/frYEIlH9fnRU
	 wNj6tK3yGdMOvzFQ4m9fnbLcWcgMGVp406KslcSnvTJboZbAb2Ey6vz6qtWk89KCrkdSJ
	 XQLEiw7pcXo8jaQ1RI/4UC4NPbq5hkKGARbBdJU3LHoPZGD37fbUVZDtFw9b/1g3sOhA3
	 RDOkIAL8jVoJvUM/Glx0RqsnozJhQZ1w8Rrnnb8VqAErpGM2t62DRidesT+ENDXoWc/+t
	 /T0zS4bcA8wblXjN8G8Koy3I8jWFX35ayIZcQCugLq+Vf3QnLdgwe1yKJQncDZ/n6SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794948014;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6EdTFJwYriIb4IdCOT1qSEgGV4PWIdtBBRJW54ecre8=;
	b=Hz6u3AHotClbi8hwS2CZjATG1SyD1CATu4sZAwX2lUGEI5Kkr5tR7bzReFST8T8zIEua
	 jlMPLXtPM5UZCimRuBeSbbI33rue3sYUFqrb4nOz2lS7ApMN2AtAk02CYaigijthrtJ5Q
	 tII4UAwCfrqiMQdi57dBSWptlZ6fWuw2sfV7NlCoSgXbIsg3nd8AW/A4pDKWHKZM9jm4v
	 aLYKszLSvL0dX5XmV0k2ajGmQ6F2JdkhXljcpWyaIdacxPZNkWze0/bD8vsBkFD3mU3XI
	 fYrjoiXAnACVommN2Vp8b5je2yI6gfA+CIjYy5Z3usefKB9JvlZ8L4WSQ+6ZR4DFQHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZqJwLEzn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MzG2pNFJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF468606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 20:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF468606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZqJwLEzn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MzG2pNFJ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHJ6YkT1640317
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 20:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6EdTFJwYriIb4IdCOT1qSEgGV4PWIdtBBRJW54ecre8=; b=ZqJwLEznxyO5/+t9
	dNksUVKxE4vWPKKN0pfkdNvMjGadFAsLAucDT7lWDgUjXtN2fAurs11GjG4SsaFb
	4d5VSun5AOUeKU6IoL65fgo77p6jlB+vMsHkSGZPISXK8CGzbaYhhjRtTgom2YYX
	FmX0aqO5UD+Q5CE6LQ/EwDBxiqjiswmSggaboV8+trVAVXmz22a8EukWSdmbnhLH
	a2Zfy+vlPHfc7Yw6GRrKcCUXw3UdP3y1f78F3Doh0IxuOUdfw3hMSg6pM/vn+47l
	HM/T44CYjvXHPM3ToYlkr3lTvegCqxlFJeOXHRROHUsUzEo0MxN9L2QjM03O9B/A
	aB18XQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0s9t1e8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 20:40:13 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3821eb27024so350814eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 12:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794948012; x=1795552812; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6EdTFJwYriIb4IdCOT1qSEgGV4PWIdtBBRJW54ecre8=;
        b=MzG2pNFJo1It8ahZ+O6/s9JYiQwlaofOdeWjUDblebIs8a6m1nWqCeB9p6yU1KVccy
         mCrKscI/Q/0QKl+8A6vVl2Z8w3tSYEiphLQRW2tFJ9l4NyXcrMj82Ba25guvci9nAghO
         Kp5ybRlXz8Sbou8y3JCg0gG+j10LPFQ0fjkSIdgzainrrJeC//99nJ+fr050bG2s3zyx
         UWu9wD7fuYTViFq79qgYEd/+cRzIdn88ZfWjuTdes66wNbiwpZEqojLPh2pLgj/f/bQ9
         fzVD1YgiT4PtUhJXN1hUzvgGzsfm43wKwYvlog46NLRE87+ltaFMpk55ZTj33ANU9TwI
         iHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794948012; x=1795552812;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6EdTFJwYriIb4IdCOT1qSEgGV4PWIdtBBRJW54ecre8=;
        b=l93m2qExd+bgpgN9O3pKDaBUoJPkfum5wKb8i89mHTF4duCmJ1fzNLCDeWhujg6/9I
         1II9CNHJXBnXPsbgyPfRLOp5LbTcJX2I9M98OPw3gqGtelvC09skmNWAd3wbuei30WHK
         UqtYiV9uKxv/zbu/cjmrLKhlGR43MC1N72lpucrXPecBtyOSvrSL9A7ABwiEoSmaV32T
         T5aL1Sy9Yce36ndCtF7uYi+BM/BMAbe2tb0QyEFNMeLeAm3FXUE6vbLStRTFn81Df1mV
         m7RA0gSlmWRuVvvZb8uQmF1M94yPMKrGwphsjzS5Zw/4kTv8aQ9C6p4JDxxxN+cfLlLo
         HbmQ==
X-Gm-Message-State: APuU4Z/Thsb6XwWx45Cbu2hbhy9iJBanBXfU291+3Bwa7XjwbO5p+wiz
	JUYFwg94i8fjEvcLWM711+1IQjOsJtnCbmr+WEmx1HJ28SaMv9Qpl0EFkxYPeEgvUejfTPT5phM
	ifMs55eqsiVi/oYc4vd+3lZCorRu0rvGivR1HhUFY+fbPDGOSCsn/MobGdpHeDcd+c8zW
X-Gm-Gg: AZFdTZdI4MfjDIykOyyjzBoxMbQLOR/31sG96K//A80kguiGKbsQGD2+z8DHDLIcJD5
	2nlcDub6s2mQQ8R/0+kXphqYCcmNDnYqArTJcxUbFkh2TP+4noq2lPMo4Jomfc0TbHvGoI4ZT1X
	CtS3rTXN6deHOnFduUjd9lNCI5wvOBqQ98LXi8e5O5AouTd2FPJBJGOJA8VoC/LdkmSgI5DfNJe
	QdAOCK1+G0MaV/1BzdoqP2tpjsJYMvOyRQdw+UDpsDnVh0tEdGwUNa27a+RO6Iqzoa9Hm933Njf
	1hOSq6QAWWCtzoiA/ho/wsnd7G9WldPrBNwD+CjCAl78lm+jxpcrIMmwwlyd2ShQwKNeNXG4i6Y
	+5L9rDhDSzj7oHSa0Ow4JY1yhRNw3x2iHBOwmp5pyYY17cgzM+d8BY/rETrtSoDY0gObSVbFunm
	HkeePfACbLONGAo2rSXHAkbA==
X-Received: by 2002:a05:7300:de4c:b0:36a:1f4f:3e9 with SMTP id 5a478bee46e88-3828101de20mr538646eec.20.1794948012312;
        Tue, 17 Nov 2026 12:40:12 -0800 (PST)
X-Received: by 2002:a05:7300:de4c:b0:36a:1f4f:3e9 with SMTP id 5a478bee46e88-3828101de20mr538610eec.20.1794948011623;
        Tue, 17 Nov 2026 12:40:11 -0800 (PST)
Received: from [10.73.198.203] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6304ff2sm456352eec.6.2026.11.17.12.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 12:40:11 -0800 (PST)
Message-ID: <c3a45db8-43a5-4aaa-9251-5f6231e83d59@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 12:40:10 -0800
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
Subject: Re: [PATCH] phy: qualcomm: qmp-combo: Differentiate clocks related to
 the USB block
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, jason.pettit@oss.qualcomm.com
References: <20260930-qmp_phy_usb_clks_v1-v1-1-d4dccc9eb263@oss.qualcomm.com>
 <c1abd9d4-98ef-4469-b4f3-94a8dcad9d0b@oss.qualcomm.com>
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <c1abd9d4-98ef-4469-b4f3-94a8dcad9d0b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HLxuoKq-c2lJvzcT_dG8X4Oqc4JsDnM8
X-Proofpoint-GUID: HLxuoKq-c2lJvzcT_dG8X4Oqc4JsDnM8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA4MiBTYWx0ZWRfXwzK75oYX0hyr
 yfckiYKqwaVRbgsIbfVzo4HchtnXeIiT/xZfuPPL9jAHrmb6ufyL2+pT6ORJZq0CpmQ/DbRHnnB
 stV9Qr9Z75ZEHmM9lujTKXtIZfvYOAV4i6e6uR8jicg+DMSJzkRODI8yaCCJDmw4Jz46QMVv154
 hW72e4SlEcuioxErwkHJuVgy6H9wzknwY/BSBCLeO0dt5gX03losKbluzPuD9Osarfbbxl2biXQ
 v4RuEqmTKNMFQF6HepWoFVNoybyCCdHyDwhMaaIBiJJT7/WF6Y15n33GzdDYm8IqZX0T0OJHuQo
 NTZrheVt4WEoHD17RXhB7njd0mGfEyAtd8G6alliZQnwp9kivCkH4DETmCGLOV2TVssdeUNZd5J
 y6+mua7UZ0o082ivRCblaz2YxSGvlx+C/C14kgqNwJy2yI6ZhtINDUtig7Hs2r3JEjYkcLiP6yo
 jfpXedmm0nsYzMZok6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA4MiBTYWx0ZWRfX20P8IEmHbg4z
 DOAHsrj4ClgLUy0wss36QW7eOfGFbRMZb+F/Ngz3TCDX3Tym6Jxd+wo34Sdg8SjIgr5gyGiBQ/F
 q/MnF7Rur/B81w1cUeehMA37GR1PqI4=
X-Authority-Analysis: v=2.4 cv=d5xgWhjE c=1 sm=1 tr=0 ts=6afcbbad cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=_nty3mnF_QhVk_yABmMA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170082



On 10/16/2026 5:13 AM, Konrad Dybcio wrote:
> On 10/1/26 3:16 AM, Wesley Cheng wrote:
>> The Qualcomm QMP combo PHY has a USB and Displayport block that is
>> sourced with different clocks.  In situations where the USB path is not
>> utilized, and only Displayport is active, unnecessary clocks are enabled
>> and not used.  Split the current clock list into USB specific clocks,
>> which will be enabled whenever the USB initialization routine is
>> executed.
>>
>> In addition, move autonomous mode control specifically when USB is
>> active, as its primary purpose is to detect RX detection and LFPS
>> signals, which occurs only when USB is active.
>>
>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>> ---
> 
> GPT has the following concerns:
> 
> [P1] Don't disable USB clocks that USB init didn't acquire
> drivers/phy/qualcomm/phy-qcom-qmp-combo.c: USB init/runtime suspend
> 
> When USB4 is active, `qmp_combo_usb_init()` takes its early return and
> increments `usb_init_count` before the new clock-enable call. Runtime
> suspend then uses that count to disable `usb_clks`, although that path
> didn't acquire them. This can unbalance clock references; the count
> needs to reflect actual clock ownership, or the USB4 case needs
> separate handling.
> 
> => the USB4 state machinery is a bit fragile.. but perhaps an if or
>     two will solve things

Sorry, didn't get back to you in a long time.  I think this should be fine 
once I add the proper enable path in the USB4 init routine as well, since 
it is required for USB4 to work.  So now, when usb4 init runs, the usb_clks 
are enabled.

> 
> [P2] Unwind clocks if USB-clock resume fails
> drivers/phy/qualcomm/phy-qcom-qmp-combo.c: runtime resume
> 
> The patch enables the common clocks and `pipe_clk` before enabling
> `usb_clks`. If the latter enable fails, it returns without disabling
> the earlier clocks, leaving them enabled after a failed resume.

ACK.

Thanks
Wesley Cheng

