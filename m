Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9435235839C
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 22:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788476367; cv=none; b=GPstl2VkgmM2VFZ64ZjcUOmaqZocQUbGYdGenVt+LdcHTQof/iFnRY0QYbg+10LmnhAs42+t4vSEXZXjzcR+ajjER88F5ffTa8GbDPQmlssKbIwcod2t4Nb8295yNXPEZjGCe3zFK8PsQhN7T3RdZtYjMWSAmyIn770mEVy8w7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788476367; c=relaxed/simple;
	bh=DjTEYnpP7rgYZKq0d+Xm4fTUHqJTEn+5T2hH0DXzXCI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uunsSCxVyruUKJGBtoyUN3n8WumWTVigrxdPmTg1AmW+NHF5LwNIuUTgBPr57IZZvZu4E6CPH1SHk7bIcnImxauwAS2YhbKXzIyxswEGSksAvaAtttJpirX4xxlWb47uF3o248Tie1HMkmEm0v94M6ZdGml6YqD3QHEt+kRCB1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=STqPdUcL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uvgdn9JO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="STqPdUcL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uvgdn9JO"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683Jh5kW1693527
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 22:59:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4U5NGX176yuVJugiJ7gMbzhIMBNpr8RvpY4VyiFmbTE=; b=STqPdUcL/VuSJedq
	gAU3oNowGaTacVfcmzIp7lfywwGfsyCGOByLY1AiAU+r3FtrjNtKLH8MWGFEAPdJ
	t7JpUWNkbCAoxsWSroUCxhu9G5Ib3QT29+jWZyAlhlenjJiKINqPuld9k/euRapH
	W1rxhPBd1aYJGZu5P/P4buiLAtKOoWLKcCD+2es1sKYpOqpEE9iK4UW9eZk70ffK
	XqUK9Blxn8tUgURz421KIKT3LvSE2hs/oE3d9QP8b2aj3POhXXRGL62fPJF/3789
	G3b6J6bJ0alILR4WX9aO5vX4WeDU7UzNSgOTNce+q/XuKNlARBhpmvDKucEKidmp
	MoZPAA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6p73c5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 22:59:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-385d2703b64so1689831a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 15:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788476363; x=1789081163; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4U5NGX176yuVJugiJ7gMbzhIMBNpr8RvpY4VyiFmbTE=;
        b=Uvgdn9JOgdHUa05niMgvSWtKckaQhAoL2IP7hw/vbAwz0LgUd7M0kwr+quWwEb5Wh5
         ciO6jLuIkkqWjGTo8aiBGPA861mytTufoYcz6kck5oQW4jrirdp+i1BpzStCrD6SbQwt
         Ih6vriMtjp3iVZZj743XvVvo5ziLpERLSyexC2kluaSDrVEuKWfUIAielXAzBoND6Rmi
         +ggOec9CI7uv1DJcXfUtl4lPDcGq6TZuRdwcRegpsMexQvlFSp43htVy4sKZMpUNX/SW
         bU9AK9lWVS6oRFEOcIjmAkdSaLxA0UbY4/sWmF1dBaexZ7no6Fa6M/sVCBuKIgDlkGjO
         mFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788476363; x=1789081163;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4U5NGX176yuVJugiJ7gMbzhIMBNpr8RvpY4VyiFmbTE=;
        b=b3T5ytmqtEI4hnCswVsUYawGA+GMSNIhyYx7q70mf/7Q1HwwFoHaHvkjFaBv0g2BCJ
         dHTnKVkb/+Fv2GdCsuHosIq/CizO0Dl9FPK7FCLlVrQV5uLnzzyuKlPLMP8IPJ+GoVif
         fuyB0WSjV2Cx5qGuz6VJMJNNRnOWYMjHtIigYAMWJhfo62YMpaVYbwnynuE8MNy9gscX
         t1s2r2KbE4dLN+Kisk5ItswwNizxye3c6JsqBsPUgRaqIndGWyOXXBUOyyBLGESe2sc+
         ETqT4QTWs5xWZO6kCZSJQSaGM+gIjcob0i5qY9mUFfYeNnv23TxdlQ6BCj1ZglGxK2VZ
         qZPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpfC0RNhEnqrSn7QdIhcRU6SfWaEJNYbFF6PgGG7JGJQXiTyBuXFcd12S0RzwfwAMiOyGE0udQ45kU0HMq@vger.kernel.org
X-Gm-Message-State: AFuF++ms6KFFkRaoNoWpgGlC6uWPBRV+jZl66IjTqguhGJPe3gTib7Gj
	u22m2GjxlsWf5S0h73b77fs28vUQWDvxv/QSrIJRZX8yXXEAVLT7dPmeib9r1x+AyR6Ppmk3b8Y
	E3vennH5Za6dzSK/IECLq4nK0POpG4OXyzUvFp0lTr+kwKyGh+tNArpRH8I7RvDSmKG82
X-Gm-Gg: AYBFou0KZzgPOz/kE5YmPS4BjBqiAb8v8PTutkqHzxYFqoaa00p0x1pGxKrc3HcVyi2
	z98RTBD+4uUttAn+rpJ8aVPRzc++n8067qCg7tZ13jLjHXCgjbdk6OXoPog8PS1+753U/JVrlWI
	wsaW0vSbUYnTUqMcthvJbb+7m+EnFYshH/jM/qPT/kA5TwUL5+pUNHC0HoBE//8MMcOaM2+sl3x
	Hg4ulokhYFBM6XZ3ZHLoBDH/Ej6ldQO5ufaYcTqaMo9S2eIZy3BBa5jc67+tgaW5Zbe3BmNts2b
	Jg4gkC/eFMh/X8A4VccNhhMgwsT9UhJowOwRcZ/B6g1owhgWcsbJyqBgjgdjqZ9pkYsQQ15DWUV
	Ayz/A/Mk1xkahvb9Ax4VP8eQSig==
X-Received: by 2002:a17:90b:4988:b0:398:ceed:b903 with SMTP id 98e67ed59e1d1-39b080364famr10264916a91.11.1788476363091;
        Thu, 03 Sep 2026 15:59:23 -0700 (PDT)
X-Received: by 2002:a17:90b:4988:b0:398:ceed:b903 with SMTP id 98e67ed59e1d1-39b080364famr10264870a91.11.1788476362465;
        Thu, 03 Sep 2026 15:59:22 -0700 (PDT)
Received: from [192.168.1.12] ([106.222.232.119])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143240d86c3sm2181400c88.0.2026.09.03.15.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 15:59:21 -0700 (PDT)
Message-ID: <30d4a7b4-1f1b-4589-b132-2115cab98b71@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 04:29:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm/msm: unrecoverable a8xx hang-recovery loop on Glymur ("cx
 gdsc didn't collapse"); killing the offending client does not stop the loop
To: Greg Ociepka <greg@ferrisoft.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20260820154428.1278@ferrisoft.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20260820154428.1278@ferrisoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xRlaZ6edABLT5YTvRvaOYHM-QLPFIrip
X-Proofpoint-ORIG-GUID: xRlaZ6edABLT5YTvRvaOYHM-QLPFIrip
X-Authority-Analysis: v=2.4 cv=OZyoyBTY c=1 sm=1 tr=0 ts=6a99fbcc cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=0ORcs9ZnJQ1kMTrlJhaeYw==:17
 a=zXLAmZJP3ypUEzgl:21 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=LTPlDgW43jYcNkZADGIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDIwMSBTYWx0ZWRfX7NDl88IBOn5L
 kYrQE11EG012iBKUjW2hAQk7CBK4WFW5zsjqMmvDuBXKlgGFAk+Kx1i+NDei0wzhuONfC9f0/x1
 pmZpwX0HABereCME0hsRjXtCz37BKjU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDIwMSBTYWx0ZWRfX+TOHcHz5v78R
 CZwxDta2XV3QOiJAYaEx3v86h/sLNXR2x5KCWEA39rGrN1m0E5/PklICeXCVkJJd39HJc9MdjYS
 uG2QfPwJKpJHefLijkoWjdTXk+/BB/AaqKj75P5oipOehtMOTHfNEm0oj0NcI5hI2zan1SPxtCD
 5sawK5Ytd0YFUXv03PG//yunrUA0bsuBVB0L9J61IzpcpryyhflDrQASjmOYhgKiB1j6ZmEzWMg
 BBMWtHY92JWWUV+E0iIQGDiLZdYCesqlpte1ZpgfDaj7f7EfU/tZQ6DtBUaJwHRIcPYnjxdP/75
 JGy8BnQOEMbhGNWSNdHoDdJapqGuJjyW9/lv0IQ4ZGYAXRS4g4+YuRpr1QeqLFMXilURdAsHAkl
 hxeP9daTbX+GxarmsA00p/UqihQBZGmeU9qFED7IyUl5DSRn2V2crq7mtApMCbIGmANelY3iDEo
 qXFunE9ucboS3ZfZPdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_06,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030201

On 8/20/2026 7:14 PM, Greg Ociepka wrote:
> Hi,
> 
> On an ASUS Zenbook A16 (UX3607OA, Snapdragon X2 Elite Extreme "Glymur", Adreno GPU, chip id 0x44070041) we are hitting an unrecoverable GPU recovery loop that, once triggered, can only be cleared by a full reboot.
> 
> Environment:
> - kernel: linux-next next-20260730, plus a handful of local patches for this laptop (USB wakeup-source/dma-coherent DTS, CPU thermal trips, an eDP link-training retry tweak and a DP debug-print ratelimit); none of them touch the GPU, GMU, GDSC or GPU clock paths
> - Mesa 26.1.5 (freedreno, a8xx)
> - GMU firmware v5.2.38 (qcom/gen80100_gmu.bin) and gen80100_sqe.fw from linux-firmware
> - niri (smithay-based Wayland compositor), ordinary desktop clients
> 
> Symptom: a regular client (rotating across sessions: chromium, firefox, Xwayland, thunderbird) eventually triggers a GPU fault. From that point recovery loops at roughly 1 Hz; every iteration logs:
> 
>   adreno 3d00000.gpu: [drm:a8xx_irq [msm]] *ERROR* gpu fault ring 2 fence 28f9c status 00880005 gfx_status 00880004
>   adreno 3d00000.gpu: [drm:a8xx_irq [msm]] *ERROR* BR: status 00880004 rb 0002/0078 ib1 0000000000000000/0000 ib2 0000000000000000/0000 ib3 0000000000000000/0000
>   adreno 3d00000.gpu: [drm:a8xx_irq [msm]] *ERROR* BV: status 00880004 rb 0000/0078 ib1 0000000000000000/0000 ib2 0000000000000000/0000 ib3 0000000000000000/0000
>   msm_dpu ae01000.display-controller: [drm:recover_worker [msm]] *ERROR* 44070041: hangcheck recover!
>   msm_dpu ae01000.display-controller: [drm:recover_worker [msm]] *ERROR* 44070041: offending task: <client>
>   adreno 3d00000.gpu: [drm:a8xx_recover [msm]] *ERROR* cx gdsc didn't collapse
> 
> Observations across four separate incidents (2026-08-09 to 2026-08-20; longest 60+ minutes; worst measured rate 161 recover cycles in 5 minutes):
> 
> 1. The reported offending client differs between incidents and can change within a single incident.
> 2. Killing the offending client does not stop the loop. We verified this explicitly: after SIGTERM-ing the reported victim the loop continued at an unchanged rate within seconds, and the next client that submitted work became the new "offending task". The corrupted state evidently survives in hardware/firmware rather than in the client.
> 3. The loop never converges on its own; only a full reboot restores the GPU. While it runs, the victim's surface stays black and the whole desktop degrades, since every recovery stalls the GPU.
> 4. Onset correlates with many clients creating GPU contexts in parallel, e.g. right after a session restore spawns half a dozen applications at once.
> 
> Since every iteration reports "cx gdsc didn't collapse", the recovery path apparently never succeeds in power-cycling the GPU, which would explain why the fault state persists across recovery attempts. Two questions this raises:
> 
> - Is the CX GDSC on Glymur shared with, or kept up by, other consumers (the display path, for instance) so that it cannot collapse while the panel is active - which would make this recovery flow structurally ineffective on this SoC?
> - Or does gen8/GMU require a different stop/reset sequence before the collapse is attempted?
> 
> We are happy to test patches, run instrumented builds, and provide full journals or devcoredumps - the machine reproduces this every couple of days under normal desktop use.

Does your tree have these fixes:
https://lore.kernel.org/lkml/06489359-1b96-43ad-a065-bfb9bee51a10@linaro.org/t/#u

Also, could you try limiting the Fmax to < 1Ghz?

-Akhil.

> 
> Thanks,
> Greg Ociepka

