Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794245491;
	b=WoytUBeoGJ24zaFs/R0ehznQVny6CDqmquR+4qCcj5YVT2rYtUYhUKboPTC15IG/EbYh
	 BWze645IuLYpH7CpVPa+NqlCSv43s2u9vblW/lO43+51Ux8amvvKAJxV0p2fFU11hvX99
	 dQVVfmhTHtHjRJLr8boeHYUbxdMZrfH0lECczUBaYJNpEfkJNcWCIbgZPINRFR1vOnT41
	 Bt9DKukud+Aq5ylPKZ9tdzdvvsC2N9ucqu+12yfT82aL/NdIrkLmXJC/iqrsxkZSYWyDf
	 jn/DfJYCTs7yaLTmK1FDbuzR9D9VdIsJUSKdxoTiPw+DsS+TF312HOfqzevAdsBQuow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794245491;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Jba9YTfpv2o6XFwrhMZ/0GoEqiFmykqBRWRUZQ/DELo=;
	b=Z9K+Q50OuhMELan7VIFT66f+n3CbaS2sIcVIb/60tzO+blmoWPmkwGmDrI9lRH4KrUza
	 o+nwGXxB5ynlQnlDEGsWI67lux20/LGCAwOdLnsP3CsMKYHU3ExMKE+DN5pwpNDiCffDa
	 X89FlNOVsd5ZtvixX5pFx54xPZm5KEhNivdoYTL2h+mmnqWkQgjzWV0mhYIVv0vWIvqNw
	 EBp1K8SYSzT/4lGNwKVyCCV3x09Oyy8rs5ojw4JZR/Vd+XOZXqZhMWrS9NRshXbcmnSlT
	 LCbvwA/ap6lC+ytVTqOKTq0IPdHp+AAVKPy9lpAJ79uaEk4N/ce+yRT7zuvyw1FyOYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NigkGu1q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bYwL2Dag;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB778606A331
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 17:31:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB778606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NigkGu1q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bYwL2Dag
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9HHHJR4001639
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 17:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jba9YTfpv2o6XFwrhMZ/0GoEqiFmykqBRWRUZQ/DELo=; b=NigkGu1qQjA3ANzD
	/6hAxXrynh4xMsmFeYkLy1+iNeLPA3Ion7dkHS656M3psjOOTg8Z68F3UL/vmShT
	zORfzWglAV6Edd6vMHw7X2I1XRAYJHTBO5yPfwkGcvg+wGffn54JEMGgMo3p3rQm
	0gNwi+ptCQDtnMmLpuKeogqkok5wOovOvQQjvKsF9Y0+e8vEUiGlNQlT552S//Dm
	JuQuOstbv7gA7wFbdq8Z1hhCui7x1OX/dJQckDnPQlBn2wOCp9vupFA59465K1fo
	80hwbgKnbNxWn/YXMJp94HsYZXteeOdA4xa69+5RHukwwwwSZB7kAEdDoEKmemW8
	McYjSw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0rs7bn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 17:31:28 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ece7f075c4so343289e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 09:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794245488; x=1794850288; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jba9YTfpv2o6XFwrhMZ/0GoEqiFmykqBRWRUZQ/DELo=;
        b=bYwL2DagUmMF2ukutLGF2UDXAEloPVf2gTMQpmEYBeFYUL0L+lsqQ1XBEcy0Q4nzxV
         cTA+KJ+Mh6aHF2eN1cabkKuKQyru2wj0gMKVtPzp/YwuNb0ndX9C/Jeld9Drr/aITJD3
         FwbpmVkte0AvowACovZoXJgoV2i4K5JNvJUjkh8af07KAoqIFf2QUcZ3Zp8BSdq8E2Yt
         uMYmmSrYRxFheXMhAePlHOLlKpdRWqjeZNVkRZXhP7v1U3lzFG2ZhsXLvgSM6vuFzapq
         HGZ9F98DFDBmUdkP3h0DgTCrUc4pa9rKFLKwx40V7siBbwcY3RXT6DNJT3wPodT1b5GP
         ESVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794245488; x=1794850288;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jba9YTfpv2o6XFwrhMZ/0GoEqiFmykqBRWRUZQ/DELo=;
        b=XS0BrLtIRyK9BBzHbiu3EGEvrb2c7QY4B9YZsTq6hcpk0tantYaZNxuqq0S7UmQcUs
         BuiH/NysaiS29zhkF6XKYLwLSRCa8Jal7p1ny5kvD9fIm6KYgCvQFMjfxOmG2V3n+Jre
         bPjVqB5OnQN/cLztBk6sjUACEcFfqfK+qGAgJdPZZrZyWat1uekfC71TKnY6QbWkK8yf
         sKeIWUjYOdHXF/YtcDC0/F8gbhfo3vGWuiD0GAvJJRligJ+K8ypOpER+fNhCX0itctkP
         Pm07GR0gKq5C1N2ecAWjfUtxa0oXKcEbs5qkzs4nJwFbALH4riJHwcNYzm93Fzll2b70
         io7g==
X-Forwarded-Encrypted: i=1; AL+hErF3PWjCA4srbliplRjQddhiTZs6qSTo8Gqdyu+HUPyCowbHKOMLWy1b/a9o0lJoOMZOqelP0iWu9Rl8Tb5Z@vger.kernel.org
X-Gm-Message-State: APuU4Z/dglW+gR1iDTIAjbx6K6qlMfM1GOoEfTE6eBorlSnWAru8XqB8
	9+ck//IdWYn4xzvxathvI8VwujYb2RN0j+xVlCDX98W98xRzdb0khfxSl8kxrvtgoY2fAvtWOM3
	Urx27eH9DEVmhcQKMOAYg1a2beqr2IIUOblw7iYfaotk8u+GszRSk0Ptxft+bYOB/xR94
X-Gm-Gg: AYBFou1AU1RuKwQyrQp94yDwd2zn1fBSWzfrVCavoUW/N7oA2c+56SfNLevTYf3d9q7
	fF+ZUPZfkLYLeDkoqiOYMFKQBQ5IDYbzYOWsVTOJvZKSAOmstsZZBo5nTLWWYKAiLIJlUMmK7vi
	MUAg11dfkAIZynr1MOOWmGPTiWPGioQ4+xqA8sOJgvg1O5yRwAOSXdmlKZT5myWWne2hXvtloC0
	Ly0bGkIVe5/uPthNwLpki2pj0JepyGjPiM4ylplPvU0/cYuOpNl4aRxFFfWxiIoHLDjEPhW8iFx
	V2ESrkAPiOd5+5Nm44qjvMz9MQS4vV/scbn0yVwoxU+JwmYj1BR7W8J0hbJHW95YhPKyydUTJcR
	+Q0sIKmYTmvcBRH9ArpQH/XBo/XLaXhUIgodQFU6m+zLeXA6agzuwZUBSy81/Ib4MZDEX4Qy0j+
	jskJoiFU01vlg=
X-Received: by 2002:a05:6122:e465:b0:5ea:c11b:432c with SMTP id 71dfb90a1353d-5ece724b48dmr1768664e0c.15.1794245487947;
        Mon, 09 Nov 2026 09:31:27 -0800 (PST)
X-Received: by 2002:a05:6122:e465:b0:5ea:c11b:432c with SMTP id 71dfb90a1353d-5ece724b48dmr1768589e0c.15.1794245487449;
        Mon, 09 Nov 2026 09:31:27 -0800 (PST)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe63e6sm3867185e9.7.2026.11.09.09.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 09:31:26 -0800 (PST)
Message-ID: <93c00a19-9d6c-4a51-91df-ae75ef112cb4@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 19:31:25 +0200
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
Subject: Re: [PATCH v3 00/11] Add SOF sequence logic
To: bryan.odonoghue@linaro.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UK0vTebx1ZuARJ7MJyS4MenDhiiaN8A4
X-Authority-Analysis: v=2.4 cv=MpfHeGae c=1 sm=1 tr=0 ts=6af20370 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=5jSOgbY-jEdhu9h03aEA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2OSBTYWx0ZWRfXwzvMz+w3fHwf
 kKPx+REHoksCF/gSnOsUT3QZywznCUeNGx+YGiZXAa+AE1fyCMgHb/xqIOSwVlPhPaw+J0lCvb4
 W+JM/n9PQ7WT2HxSPEgkXfHDKirCiRrCCW30bLRMHNvfD9339l51rEHFw2jSIT7CKnMad0d1I7B
 P6G4Cf0QfB+kSyQNO8E9y3iHmOH9rOEm8PwXE32dh+MDucO3U8gVSp5BpQYGuh9a9sy1Un99CbQ
 7BCGTX7/WUuM38tCiklt1ebGhyhos+f2BjJ+2TrBe8C3SoEF2oOBmw7uWYRtoXBudvbAUJlJVrJ
 lxPugVqRPT19xbEslvgmBJ22A/9XMwznBt8/RVvgyCWN7RbW5YfCpNDzu8s/ExDFz96ttqqRKUH
 uwOJrJM4LQYRRFPvCf8yctsGdNWnI2uJvSYFX0BhZE/yaUmAJEPcd8W8GXsSEVQ6uBTCKwDpeZP
 55IRbQ9OndH4+KPM/Ow==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2OSBTYWx0ZWRfXyhZrAtoZfvyK
 XUhvfCzGPknB1JLiM04hs3P1z1dw8HvUMVSoy53JYnUH4tvYaWe6FjcwUSgkawkLdV4prPzfHiX
 BeAUBQ3vGjLC0GnU10nBLyiQeKTracI=
X-Proofpoint-ORIG-GUID: UK0vTebx1ZuARJ7MJyS4MenDhiiaN8A4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090069

Hi Bryan,

The whole series were verified on RB8 board (SA8775P).

Tested-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

~Gjorgji

On 11/7/2026 3:01 AM, bryan.odonoghue@linaro.org wrote:
> v3:
> - Added CSID-340 patches from Loic wit permission - Loic
> - Explains the initial -1. - Loic
> - Drops the .id field enumeration - Gjorgji
> - Accumulates RB as indicated.
> - Link to v2: https://patch.msgid.link/20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org
> 
> v2:
> - Amends series title to drop EOF
> - Drops EOF inclusion until we actually use it for stats production seq_no - Gjorgji, bod
> - Moves QoS into pm_runtime() callbacks - Loic
> - Switches on vb.sequence change for every SoC the silicon enabling code
>   supports - bod, Loic
> - Link to v1: https://patch.msgid.link/20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org
> 
> v1:
> 
> This series enables SOF AND EOF event tracking making use of both events.
> Whilst the code is actually very simple the functionality we want to build
> off of that simple code is not.
> 
> - SOF
>   Serves two functions. Firstly. Informing user-space of CSID SOF events.
>   Standard Linux V4L2_EVENT_FRAME_SYNC is trigger from this event.
>   User-space wants to capture this trigger because it allows user-space to
>   better align the time a frame begins to events elsewhere such as IMU
>   event timestamps.
> 
>   That functionality is directly applicable in this series.
> 
>   However we will also build on the SOF event in later patches to allow us
>   to begin programming of shadow-registers for the next camera frame.
> 
>   When the EOF event happens, we switch from one shadow bank to the next.
>   This is only possible if you have the SOF event.
> 
>   So SOF serves the immediate purpose of timestamp alignment in user-space
>   as well as the 'evil plan' to trigger off of it programming camera
>   parameters for the next frame.
> 
> - EOF
>   EOF even on its own is useful because it allows us to increment
>   vb.sequence for each frame as per the spec not just when we have
>   buffer-data.
> 
> There is another purpose to having an SOF and EOF event with sequence
> numbers and that is.
> 
> User-space submits a parameters buffer. Kernel accepts that parameters
> buffer but can make no guarantee about _when_ the entire buffer will be
> applied.
> 
> So when kernel finishes application of the entire params sequence the
> returned buffer contains the sequence number - from the EOF tracking which
> informs user-space _which_ frame vb.sequence its given params buffer was
> applied.
> 
> Similarly when kernel produces a statistics buffer that buffer will have a
> sequence number - and that sequence number will align to the frame sequence
> number that the statistics describe.
> 
> Thus SOF/EOF tracking is fundamental to passing parameters, returning
> statistics to user-space and for the IPA algorithm in user-space to
> understand which stats, params and frames are related.
> 
> The first patch in the series addresses a corner-case when a quiescent
> system can take quite a while to wake from idle, too long in fact such that
> the SOF event is effectively missed.
> 
> On 'normal' systems doing lots of things, this is not a problem we would
> see however on my test X1-CRD system running from ramdisk - there's
> basically nothing else happening and the wake-time becomes apparent.
> 
> This is not strictly speaking a bugfix since right now nothing in CAMSS
> cares about SOF or EOF so if we take an additional 2.5 ms to process a
> data-buffer on a fully quiescent system, that's not the end of the world.
> 
> OTOH as soon as you start to care about SOF/EOF then missing those events
> is no bueno.
> 
> The CPU latency value chosen is 100% stolen from IPU7 which seems like a
> good starting point - the stealing obviously - and happens to also work.
> 
> This series is really an enabling series for more work to come but even on
> its own is an improvement on the current situation.
> 
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> ---
> Bryan O'Donoghue (9):
>       media: qcom: camss: Introduce CPU latency QoS during streaming
>       media: qcom: camss: Introduce SOF sequence tracking
>       media: qcom: camss: Use SOF sequence tracking for vb.sequence
>       media: qcom: camss: csid-gen3: Enable RDI SOF driving
>       media: qcom: camss: csid-680: Enable RDI SOF tracking
>       media: qcom: camss: csid-gen2: Enable RDI SOF tracking
>       media: qcom: camss: Switch on frame_sync_en logic for csid-gen3.
>       media: qcom: camss: Switch on frame_sync_en for x1e/x2e
>       media: qcom: camss: Switch on frame_sync_en for csid-gen2
> 
> Loic Poulain (2):
>       media: qcom: camss: csid-340: Enable RDI SOF tracking
>       media: qcom: camss: Switch on frame_sync_en for csid-340
> 
>  drivers/media/platform/qcom/camss/camss-csid-340.c | 39 ++++++++++++-
>  drivers/media/platform/qcom/camss/camss-csid-680.c | 18 ++++++
>  .../media/platform/qcom/camss/camss-csid-gen2.c    | 15 +++++
>  .../media/platform/qcom/camss/camss-csid-gen3.c    | 27 +++++++++
>  drivers/media/platform/qcom/camss/camss-csid.c     | 68 +++++++++++++++++++++-
>  drivers/media/platform/qcom/camss/camss-csid.h     | 21 +++++++
>  drivers/media/platform/qcom/camss/camss-vfe-17x.c  |  5 +-
>  drivers/media/platform/qcom/camss/camss-vfe.c      |  9 ++-
>  drivers/media/platform/qcom/camss/camss-vfe.h      |  1 +
>  drivers/media/platform/qcom/camss/camss.c          | 65 ++++++++++++++++++++-
>  drivers/media/platform/qcom/camss/camss.h          |  2 +
>  11 files changed, 265 insertions(+), 5 deletions(-)
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261029-v4l2-frame-sync-0d6fb94ab6e6
> 
> Best regards,
> --  
> ---
> bod

