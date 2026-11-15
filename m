Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739844;
	b=Q6/JhU7iwBej17DPWvURCcV7E583V4LPNkM25DrFdCYDb6Bv2U3k87mOo3OIqaqVxFv7
	 JVrEkZaqmtwsPesbc28XDw2lcU4Ewq8Jg/1nPN7ToUYv+YsmMq+qxtiaeTelD4xwKdPyg
	 43gzzVv2WYQgWvfDTJaphQfI7sxb01WSRgYiWhUsgP1aiv3QqYzz6blN5MyA+Dsp3TPpe
	 3u9s2C8kvdAu0TEpiDMEzOH+HW0fs1kA8B2gN8kxobHpzsZ7RhVKJxuM+K0aCXtgeJGGZ
	 rfm5tuiyS77YMW9smUnq38lKxnOL7oGOigs6MTt3Ymh8zbALqSvVAAJpzFPlTf6DbVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739844;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yop3kT58qwR/Xl9syoWFG9U+E8lkKWEQu0m0TSWLIwI=;
	b=GzrUcKYHKVtWqlAZU34dcX/y8UmUcDnAo1YfgUCBMGrBjuebBv+BaHX3iFTGn9asEkaZ
	 XoJoXYXt0ud7Voxt1co/DQkZGXYFGxzxBSgoaS/Id5PMpFPSU++q/cewo2T7KTlSgpH+v
	 D/zusV/EnTEv26BtASAwjqMsmhBomg7O20V/C4Fvl0PvuMJDVQ4oWwKeH+R7WPeToJL6i
	 DaM2BFC2rDhpiRGCC2senlOTe40hoMtnyMtxfeXXSTPQXrnyNG86KrhTkNLDtNa/oyxwD
	 9tLhkt52HtNdIOzkRBr0UTiWRd0CxXQzSEUfEmP+GM2pWqp/TRyTUNCQk6APGVAN4Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ijrvIHpc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y3Yv73kt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBE9606A323
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 10:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CBE9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ijrvIHpc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y3Yv73kt
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AF7xpbx2142872
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 10:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yop3kT58qwR/Xl9syoWFG9U+E8lkKWEQu0m0TSWLIwI=; b=ijrvIHpcx1qBsm/w
	KRn/rKQhmJIZZITCLfJn+vXLjrNa2aSnNocDk++/FFjH8WFcKFnJZmvTkHV8phHo
	yAZRwMNRh8D24gGbCJKSGCx2qfN5ykE5WBjtaONIySRe4rV8dn66JkE4coiUAhzZ
	r7uctxYvOOLF3Bm+DaVZ0IcWMtcIEMIFx0CfvnBkAf+7XXoeTB4ztux2iYFKSjoN
	C6NPO+7OQoB1srHqlrsVtKkF7JTCroj6nK7BNo47n9V3pNhnN0x36cgRf0O32VFD
	N1ioCfIXFOPcve9Ncw6f0cq7I7BXsrvfrHtPD76rptnj1/vQ0MzMKT4WI9y8DJ9C
	eDJosA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhjtw7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 10:50:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f32050e72so749916285a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 02:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794739843; x=1795344643; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yop3kT58qwR/Xl9syoWFG9U+E8lkKWEQu0m0TSWLIwI=;
        b=Y3Yv73ktyBlryfyygYNaH8G9mu7fuR/HKeKj/XBwmDXFnjO96byQy3FHuxR6xRs++2
         ts3CuhlfLUUkr9QwiXqU4FBcY2Nj5EvVAWnV4Q8Z8AEloUeYD3HjVlep4OmmoAI5TI/5
         F9TI0UzZO2VqCdQ+Gfckvwgn3F0UiGO4hxrmwmj1hQRufmZk+Phi2zYrpKP44yr2gX81
         58WC50y80efXQjIaG9lM0V2WWdNhbF5P405sU4XADsFiESbM0FrsDTP2Yrs+iHAn+6Fm
         EXu2ZE+jwhiGZlCWOEHiQOuGi7cl8R1aMgQwQnUe75amxrK1gJLrIX7mDJYUo1EPZLB5
         TtYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794739843; x=1795344643;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yop3kT58qwR/Xl9syoWFG9U+E8lkKWEQu0m0TSWLIwI=;
        b=zVIq5wuoqpt6h7eHBk1I0uLGGuZDLlsuJg+KKuQP3g30gv2k278BRo7TEAnh1PxPMF
         BNCIemEh410uhlk6KUCUagjcH16r8ZUFEef3MRG/o+R06kMBzVpQMuJwnsP5Ujjlg8Z4
         mH8rCKSWm0kOlaJjNoYixqfq3rtJYyGrjdvJel40mG4F/49tnbaHXO7FuoX4kNBzPh1s
         jQ63ImzyH4xvyK0UAcUAgku9sVIKeJTTEcImle2rAwG62ONM4EeoR3HldBiR/ovpi7us
         EsL0c6kDSbeiDTzrF1GRoFDHoWRZdn220QYI3mg4kSuiMXSvtMogH0MNojGo/dcO8Rwq
         t2sg==
X-Forwarded-Encrypted: i=1; AL+hErHK5ailJMwTIp905cL8CMsEdLH7//JuowxLWFGnKjmAM4Q9nmGvtfV7QcSnY+e/9z2RGolsS6LlJW3Mdoir@vger.kernel.org
X-Gm-Message-State: APuU4Z90W3VCb+gxib/sPmqAk61RxR/TWJRYazL7/048GeF7lRuNX4hK
	QK9PaCnqX9x+Zf/1h2qXCOPEyCkoaUyvZZyFelfvgjVQmK6f4z0zmsbT2RheXfzN6Lrzw4LJFZM
	wzbDvQtMzoNtHbJVFzAOuRSYR54VzhOp65znjDi9zQLV2bjZ6b7tA7L2IifqqvNelx3Vo
X-Gm-Gg: AYBFou1DvVb+e1dOhpVnt4oHRt4LoFhagoUuap3AQ1Lse0ruw1Elq1pzrpb9icIQQQt
	E/3xtcyyIEDyZlwuetEIajfYD2RtAQQAkN8dExLmxc6r2ewC5fzWf4B9cdYBYEvNJ3K/vSAZer1
	6Qf7ifhvA6/u0cy+8zVOXkPjE0PFQazvteLMFc7Wth5fcAEBzCA9Jrne+qxch70M7KJhFOrlz/c
	tBHKZoSzgYR+umr2Uu8qgOgFF8xgwW5uxZ9zPTGTxgnJQPgRXQ3iAG/DhB/o/gLj2bWzeYlQ0n+
	deONDphQL6NJnqAQbD+0Q1WYqkhRI45vO4hUTZcn0k6+VCv6kLLF+kx3DLzsPcoJEOiTXfJapC/
	fUysiF03L4LVGVR5LFsWUMg3+qyA+iN8THH68HmY4U/gMWzkcSYpg2aecYBpMhJAUqU64SnmCuK
	WFuFvKdUS4mreTyEIwnw==
X-Received: by 2002:a05:620a:1a04:b0:949:74d8:4713 with SMTP id af79cd13be357-94974d84d61mr209325985a.49.1794739842843;
        Sun, 15 Nov 2026 02:50:42 -0800 (PST)
X-Received: by 2002:a05:620a:1a04:b0:949:74d8:4713 with SMTP id af79cd13be357-94974d84d61mr209323785a.49.1794739842409;
        Sun, 15 Nov 2026 02:50:42 -0800 (PST)
Received: from [172.20.10.5] (82-132-234-47.dab.02.net. [82.132.234.47])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c2361242sm3272377a12.12.2026.11.15.02.50.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 02:50:40 -0800 (PST)
Message-ID: <f8d9be2d-b8a3-4f54-803f-dd9c974280f7@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 10:50:38 +0000
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
Subject: Re: [PATCH 2/2] ASoC: qcom: audioreach: only disconnect the route a
 mixer control owns
To: marcht@proton.me, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261111-q6apm-fixes-v1-0-1beb5702b372@proton.me>
 <20261111-q6apm-fixes-v1-2-1beb5702b372@proton.me>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261111-q6apm-fixes-v1-2-1beb5702b372@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA0MyBTYWx0ZWRfXylVoGxxuxifZ
 TfEEfeIcoxkOBXQ6crRGY52Jcam3JHMBTVRmRTQGgn3Badcv5r9beyMPMjQdUxWyPsutcHuN3Uj
 RUiEemwIIL6dfjJveo3GqNBJazOcz5J7lvUo6mb0UMt61m+3fZhAbWipAkgkZAs/ywSDoPvh1+Y
 UJsBmucuLnQVbr+XFJbqScEPnLv5Bzte0SfFva+BQjq9e2O70Bdg/l+z+x0okwL/uf7+89gufOm
 jq0FZqwlS9T+UaU+2yxc9I8RqjD01UDb2aCrBBcJcz3s+5PVVmsd1HS/RN27rSJHBE2JfQQfrgr
 zCcB9FWkM8OTKCoU6Ken8ZATvR6Eiox7sqXDaKrroCVQtY66145RaT9EBqfOMBD2sm/6vZBFh+I
 u8OrPdsZ+1A6X8scaAMrYguvkyUuSadvQUFNuufG+GIr4ssyTYZKV8xztVGBQIu8a7EcGHdJzuq
 F5QFpctLsXIb5HTu/yg==
X-Proofpoint-ORIG-GUID: st_L4l5g5YxG0z10jvb0n5OQ8wDbV0cu
X-Proofpoint-GUID: st_L4l5g5YxG0z10jvb0n5OQ8wDbV0cu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA0MyBTYWx0ZWRfXyWFN4Kke82JP
 iS8Vq5u/VRXu+ZsQ0EMf6nKA76cZQsjQIDETsWnDmid7xSv6dnh0Sf0q/Un7T4us11UBvXTLTKh
 JISk4lGTNS75ENw/XTvrq9I8aO018mU=
X-Authority-Analysis: v=2.4 cv=X9rHu2Te c=1 sm=1 tr=0 ts=6af98e83 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=AI3hfGQ59aOwaD8qyfpUrw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=zknksMb4cIbI7LntptQA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150043

On 11/11/26 10:54 AM, Marc Herrero via B4 Relay wrote:
>  	if (ucontrol->value.integer.value[0]) {
>  		audioreach_connect_sub_graphs(data, scontrol, dapm_scontrol, true);
>  		snd_soc_dapm_mixer_update_power(dapm, kcontrol, 1, NULL);
> - } else {
> + } else if (audioreach_is_vmixer_connected(data, scontrol,
> dapm_scontrol)) {
>  		audioreach_connect_sub_graphs(data, scontrol, dapm_scontrol, false);

move this type of check inside the audioreach_connect_sub_graphs itself.
--srini
>  		snd_soc_dapm_mixer_update_power(dapm, kcontrol, 0, NULL);
>  	}

