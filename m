Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793677781;
	b=KSgLRkkOXn8LdmXYOjOFIO388RJQg7gensQ0dHlBe9RrOeGR0EA7niRQvipEe+7xvqJc
	 49LxJ+VE/XZCpu3X/wnEjxefKhJTvTVDYzn0jvbU9Jboh7qslY0C1ZTCyYt5WoEbRoGTc
	 LbsGyS+l2PCgvPVjo+5+r/orBaSlKIQTJUZMvZN8u+b5MxDjqEYkoSXXXY4aEYzkFe0cD
	 hrEJmEwtsbf/iTLjudvTXwoUMEJhZefXwJr6mo0j6MyBM2FQYzjzWkjBMdVh46r5kWAlI
	 RAtRaf8ljLlQ8DIItT1WSEaqDJ2/0xBj9sCjowVV7MBPWqqhQ1N3GLHJlRfjy5fK+DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793677781;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DZ/NX7uo8xloLOcGc8uQxWAK76padB8qKwhdHOOlzHc=;
	b=peH0CXjcOCPCUXB+W9oAyPhDsvuN0h7KeYG0xT+F4ZijkpYZ7btjxG8F4ByBmPHjHwdh
	 4B6x23ZjegfEGJO20UEGtxK7zMeBvD8cIJavIt3YeI9vPnBn5Ubrct5Oz4fZjdl8wC6Cb
	 G/uLfnqhDzi8iCm/gW6Ad3l+bItHxAd8UsG+SxCbTzt6kz4Q9Ci1YTqehO6WXPzA3SSk8
	 u8r9lfH/vZD+OpCZAcqfBpQf6gECEowOEBMWnDRbeeha6hRvOOaLMz+F+R0531Anc3Thf
	 ghmfmY7oGpkbAOplwE1GW0+MpyjcZ0jWvjC5sDHSkNvyg3PPQDD8nYQDm6bG068KFgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jVXtSxUK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Qsd1z/Wd";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E722A606A32C
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 03:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E722A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jVXtSxUK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qsd1z/Wd
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A31eMhE1431337
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 03:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DZ/NX7uo8xloLOcGc8uQxWAK76padB8qKwhdHOOlzHc=; b=jVXtSxUKddlNgSq9
	kpw8LMVJBMHdzSvYSjLUNvlr2VLJQJas7CrSh/IMyiVlyDVcE7I843TVHxQlneGm
	GICWBw0Db7gQkK/TqffKoDX5HfoNesmgtuhz2DHLQegvBfOKI1Qorp+yN5B30qIk
	lm3oE91pt6jQ2y3z0MLuQ7IuAazgv6liCmXM81JCeX0RiiL0MfLUAN6xqy/Lwj4M
	CS580V4m1b8JsJD3xNYkQ8l18t08tRgQ8ztnEKzowDQwap2bchnfHELCk1zbJV9s
	eCzoc4pFrhoo+WlpudCjRJCzYRYF+KfiFnO+ovXCtqTMIHQ2YFSK+KwaTuoKpuuB
	Z6RW8w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq0871ry8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 03:49:39 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so8471208eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 19:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793677779; x=1794282579; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DZ/NX7uo8xloLOcGc8uQxWAK76padB8qKwhdHOOlzHc=;
        b=Qsd1z/WdOBfyrl1XEGwf+xzSOFm4T97bdfqYmNi0YCix5/NqI5m2IMwbN/jqwRHcLK
         rGxSw4wtPec8PWwkRwdZHbn9HHSkZ9oXbU8bb5bJcz6DQE+hqL/5GiuyWsvLSmcBL+1t
         kr+lyeVToLNAzXE5Ppg+UXbFA/nmXfjF0Lij+kecnhbfMk8+v75rQy6G/Jj1eIleR/jN
         LlwS3JM6p6t2T86tlQ8l2eo+lfQeWdcHawDDuDPVd0NHwP73G8UXalo1aCQ49fiAMrC7
         uQzvk3+XPH1qy9+wcz2wl7K7KeP/VgS7X2NXYr5X+xDqv9PBVzaKL1rFkwqowfpWWXoo
         81ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793677779; x=1794282579;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DZ/NX7uo8xloLOcGc8uQxWAK76padB8qKwhdHOOlzHc=;
        b=akNUnwz/IxaXjMb0Mg/+BD6u8L2PccNUbJsBQLgDVCnu4YqKvxEqH3XXA/kYvKr3H3
         AX+a7/CbAT09xsc2Hwzo8EbUkyMRyBvegXHRmQx6dKeMEoa4Pdvv1zlQHK2Zpo/X8G+b
         inCZX5QmuKT6hUEL1KmVssBSEH1P/HNBHfcIyukBwq6hW3N+HbqQTvoccC4R5ngokHcN
         SwvSwFz7xXReVTvBl/3Bzn8AwYVV4G7ibd0x2PIq8QD3UieNekRD3cFmHIBqtR0HXNcn
         YDoFTsXRTfiXpr0k8mf429jQanR7FmGvvYQUI9su6IHq12SVOUDduKkuhOM+PHsUnDJq
         36VA==
X-Forwarded-Encrypted: i=1; AKwUvBzHw3JAJs6sbQUXKQY9hwbOndDxixRMPiFyZkngdmI5zqhyg5KZaqCNF48qE0PwjfmJ1vz7KRCzYMVTqd3x@vger.kernel.org
X-Gm-Message-State: AFq9FYL9TuY4IghRPpNkHTQF8cG0qIsTma90ZwZ5tuki0g7+dKfJg5Wz
	gLd89jUZHTvzANPTvEnLC3RazHo1f3vWDN5QP/jBSywTNbIhfU0d7Vg1KWcc5QCyUYSfedF0q5L
	6hK6QT4q8weUl/Fqy9pPhDgjD5NFFQUKjk7s1Q1KHX1nTtJwTUdBplvc6+jPwF0Z9mOp3
X-Gm-Gg: AYBFou11UxTNHzdWPvuYk7v1I677iMTsKiQd0vh8yn0MwwKnF56QGVszXgKBbsUOR2p
	RVAiIgw8Ef3aJ85nzTR1i34gPMY/mZmVvUgW+a9hvmjbpfRO3Iqa965U2Kr2P1IvhzkBdJ5/8DD
	48MqDIpVs5TQl3AYqiisUe2f33yIBAQNfiN19hLqx+9mzQ/yplR9+AoxpkRW+KQo/ZyVRYTscIR
	acvieBQep1laY8DTQEW8AYAIQ6rU+S6UUKFCyq0bLO9KVmsqkwn2TAgq73+5stqbIjwOB47elsL
	/apwsOlrxkKpjWa/4zjIKVwMhceVRE8vl4uHK/ZpBsWEkMcGoiEE2Bd8Wvj9RjwbzJxd6164UZW
	YGlgK9aa9gEER0pl23f+ti+FYHi5X5iejOBMjHcRPJULoSxsx1NqKi67ihli2a0hSf/3k0nRBV9
	vnCL7XzX9M
X-Received: by 2002:a05:7022:f115:b0:1a2:1a28:9348 with SMTP id a92af1059eb24-1ac5e22840emr15230869c88.37.1793677778580;
        Mon, 02 Nov 2026 19:49:38 -0800 (PST)
X-Received: by 2002:a05:7022:f115:b0:1a2:1a28:9348 with SMTP id a92af1059eb24-1ac5e22840emr15230837c88.37.1793677778005;
        Mon, 02 Nov 2026 19:49:38 -0800 (PST)
Received: from [192.168.1.5] ([182.65.247.97])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c27cdsm65455321c88.10.2026.11.02.19.49.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 19:49:37 -0800 (PST)
Message-ID: <dc441642-aa49-4f99-b10d-695f8d05fe2a@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 09:19:31 +0530
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
Subject: Re: [PATCH] ASoC: codec: pcm1681: Acquire sck when bound to a card
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Shenghao Ding
 <shenghao-ding@ti.com>,
        Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
        Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261021031228.2074402-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20261021031228.2074402-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAxNCBTYWx0ZWRfX4QgpacikNt0j
 haD/Umtc+4PpJizWH61U4EGQI1Z4vBzoiYWZOp9QfVmXggZszq+KHlXyAzTi7r3D6THbHJiXsEx
 6RdzlE+6riwNkaH8JqHBJr1Z0nRYHz8=
X-Authority-Analysis: v=2.4 cv=K9m3jCWI c=1 sm=1 tr=0 ts=6ae959d3 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ya3+xhBzxnqkq9vGoikweg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=k5KkOgXd54y_7d7CN8cA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAxNCBTYWx0ZWRfX3l03xkFUAI03
 FIZZpPlSLU0mgx03o4FQDnU+Nl/uTAMXIUlHBbTtGHAhOlLE5zx4bq7X0/hRpuK2Tf8M9EGkGYt
 Slhj6oOsjXoamg9cdgNKFF+yRJI045QTyzUIKgrCOKCfmRUUi1J6Ud2D7BTVMp00P6Tkwg3S0Fp
 eEx+2aB9dA7NTESfceTfh+byp05VReDE3EtzDwpDWLIx/i2UIgiTWKUJyhsFIHR1evV/2Rq0WA1
 cFxVl5OuReZ+Os1MYxGmDuHsbOrrBQLUXPgm3BkRha/5ZDckzOshkK+hs8Q/iiiwp4XZ7sNMUB+
 VpB0aZrCt92cP2uq2HZY7iayQGmmyg0qFW4Zf9NTVE+sF1+D5jukJofngRtBlOjQPUCCnjFnnUu
 pbFeWic6nYr4pL4H13uiCQ5ma14S4qOUbesSBbeUCtcF6zz60g0+rb9y2q3cJxoPfiv0MTrtLe/
 JmIPswANNGTx4qEL0xg==
X-Proofpoint-ORIG-GUID: M7-HtwYPSdcdkjT6FusseRFDqdetErGj
X-Proofpoint-GUID: M7-HtwYPSdcdkjT6FusseRFDqdetErGj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030014



On 10/21/2026 8:42 AM, Shawn Guo wrote:
> The sck clock is taken once at i2c probe and held for the lifetime of
> the device. On Qualcomm boards it is an LPASS clock exported by the
> q6prm clock controller, which lives on the DSP and is unregistered and
> registered anew whenever the ADSP is stopped and restarted. fw_devlink
> cannot tie pcm1681 to that provider, since the provider node only gets
> a device once the DSP is up, so it falls back to the remoteproc device,
> which stays bound across a DSP restart. pcm1681 is therefore never
> unbound and keeps a clk handle to the dead provider.
> 
> After an ADSP restart the first runtime resume fails with:
> 
>    pcm1681 0-004c: Failed to enable sck: -6
> 
> and there is no playback through the DAC. Even with a fresh handle the
> DAC stays silent: the new provider registers its clocks at their
> default rate (19.2 MHz), while assigned-clock-rates (12.288 MHz) was
> only applied by the i2c core at probe time.
> 
> The sound card, however, is torn down and re-created on a DSP restart.
> Move sck handling into the component probe/remove callbacks: get the
> clock, re-apply the assigned clock rates and enable it each time the
> component is bound, and release it on removal. The i2c probe now only
> sets up supplies and the regmap, keeping the cache in cache-only mode
> until the clock is running, and the cache is synced once sck is up.
> Runtime PM is enabled and disabled together with the clock.
> 
> Fixes: 8987e9a24f45 ("ASoC: codec: pcm1681: Add optional SCK clock and runtime PM support")
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

LGTM,

Reviewed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

> ---
>   sound/soc/codecs/pcm1681.c | 122 ++++++++++++++++++++++++++-----------
>   1 file changed, 88 insertions(+), 34 deletions(-)
> 
> diff --git a/sound/soc/codecs/pcm1681.c b/sound/soc/codecs/pcm1681.c
> index 6002da3a5666..2cc34561aa83 100644
> --- a/sound/soc/codecs/pcm1681.c
> +++ b/sound/soc/codecs/pcm1681.c
