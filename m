Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793914294;
	b=XRE6r3qVLW9HBfTlaNRsVYO6VPnSC1MZnSm3BZqNRVcNz985ZludrC7KD5aWySKil8xn
	 mTycKccKMsnzL9REwP8SKashoGCxSG29utW1TeG3PaWlQXPAbv08Siu3+zTZZaEFWW/9A
	 ilz3UVDOVAmxYjYUFIw6GVHlRTMAA1gMRSJa0rguRfEXuraja4lsX1rgJyDvAG3j1zYe2
	 hH/b5Tdf9of9LQYacezq5zdLAVcYmedYjG7B68/yMChfg4Esta7wnpMwj7/1y9gPlD/NG
	 6T5GtVP0GHHjDR+a79RzPapfMqjrmbiHzVsf97Pk6/KtUwpyQlcBBPzaXW92wjrkmhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793914294;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=K+yyAmjtjcPT4PKxalvzle5QlVUS80uiwYOMk1MKomU=;
	b=jIu6EUymF+Fqsqi4NmdTbfO+f0p5WTXLeYc9GHM9dhR2V/aY8/GnBCXX0UvhniSDAWs5
	 7CbeOm9MjS9I6R4+8NjIAT1aB8bCM/iu1y59K4hr0HMeEUzBRu89PCUvA+xWrRm2DOkFo
	 IT7OEboqh7GVYNS/VW/x5UBCOb1f9tOyXkx3aO89npw0G/b7pvru/IYv8fqj3eqRkNYVF
	 qfXw2rM9v8GpneN0Cyi2uhTlTylpbKhNeira/JSMNNurSBQr5fGwgc5SPCzlftjJ7BaWL
	 ikk9Dn21ET3hBEbZZQgkV66WD3ZIgL1R2nIarGtgOZ+PwJpMbjPEslIYz5LYCzNKFJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="d/anUTjw";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GpW3OVkl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E90606A329
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 21:31:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90E90606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d/anUTjw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GpW3OVkl
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5L6EF9844795
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 21:31:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K+yyAmjtjcPT4PKxalvzle5QlVUS80uiwYOMk1MKomU=; b=d/anUTjw0BuTJt7B
	8gBjnXaoMWgDu8QzI+gZ+BtVULG5BC9iZfDsLJSsKUvDQx58nJFGtxoYm1L8vvZS
	M2/DvdygoaY4vDVmmnwbiej+1s65CqAAay9veESKqyzmVsuYmzLovulsSpHOh+K1
	sEZkYUes1mhsGt/BYQAAJOfuthQphFhDT7XdoWe+thdzTzosplJ1dWYmCVu9LH9I
	jj6W3QZU9ckKRJrZNtjYR5JdUZDWtxJbI4DhAwR7sWEukkHxO5ryqokCpSLnSc76
	+AxSN9zZiCXDx2TQxCAnydo2SVrJsKFA0qVaP2TXeJiQ9IXRhGHfX55+hRT37iRj
	VHn+Cw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hryvv0hm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 21:31:32 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36cec75d8caso1292eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 13:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793914291; x=1794519091; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K+yyAmjtjcPT4PKxalvzle5QlVUS80uiwYOMk1MKomU=;
        b=GpW3OVkljH8hcMpsrayYKHOH+Sh3IBPspFKdPkbssr6+Zp/p9GjlaAwAMnh3naK/yj
         U74qNhtThYLhgSDMH9T+hvHEKDarU2bueT4viaaYSMKlPuJzzywaKX8/FbzZdPs4Ou4W
         pAr/x+a/bnSGOLV7WgTOnjuAwibyi5/rsVgyJCAIIJCsxiw70K79TSF7vDqLbm8FYBw4
         a2yycKzjS70Mf9jco8wsfFV0dpsy2f/wQsGefCq8ifOjYjb8pib6sVgxn43psPf/KeKD
         JzVQHMnL1VnjfwKC6QJ8kDlFe3pqpLeEZuIP9+V5eGG/Efk291/kvKIqg8AEp7fnjsg3
         AQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793914291; x=1794519091;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K+yyAmjtjcPT4PKxalvzle5QlVUS80uiwYOMk1MKomU=;
        b=WDMJDmdkE4gruRI8HrQyGuth12hJ6xSnX2yCILyL0anZ1z/hY9G1EGDkTD/seAtdSE
         gfwI/BbB6ZPnyht3KXNu7OYKvADyDjSB6zDXmHrEdXATCoxydcnAa3hwbeUDTlZmu701
         XC7TqDaQeIjS4ycbeSepkCX0hfXw883Dejx1CFTZ06N4U2AF9DxYEtTYA6zGwx0BrrLc
         9UpPRXyEATb7JLRz10YMQ7WmcS57nshuBHSU16BSg4AEelAZNJ486pv602orMgfqeAJl
         U0CCbQXyMQ0l2DYIqf0BHsMTbhkMz6Ujo38ywgPY1HlpaLGnZj3N0DTL5K5E3823Ci6w
         KAww==
X-Gm-Message-State: APuU4Z9ACL6H+wRyaMSf6h5QXDc/69zmbE2Wn9icSAzas+Ukni+hcLaT
	ugycLclXvA1TfXTd8Qd3Z52ToJqwr9akGSE5UGyoS5IHbU1SOLbXv7d5XH7GKZ3pH82EnJtbE75
	RIHsYj7A1y5Zu2lXCM9f3C/2unbj6f6CEyTy2BTRlbH5clo0hR3J3xVlKviCYMyDM5qzd
X-Gm-Gg: AYBFou33xHtl0mY1SFlTVvD5iwAbOn2iSZ77V3a8lT4QPuL93K4d9w4e4CRkgTrnJFK
	QDhsmwleea88l3F6MSmesw/VHqseZBsQKBwTC5KiuFNTTVcnlpOEO+vkOcW0a9/4bVOjidB5+f5
	8zYQXFFkEdPo0odiPZEElrV8rNVGdvM7Tgp+dvk+1e6uEC0+xSrxKWqVioo4XnnBzwP281E+QZY
	zRqjE0SiDf3bRvQTgYWNd7ju3vdrHkuTbCRvVUX4t9fEWsbFGaX897kg5IQMOY4WnDPc9OUfSC+
	/XuPIni6qZZBBjBVIBMwsYFLFLGaQF1CjcrAacaQqx/0TX+c4tyX+HykkRQhiDai5xvXFlj3IK6
	n7mRFEPw6GFo60q5GPgxak2XaO3T+u3sTxvvE8BZJL7P0ws18TTjWC34tkpfxfMQKOER2mys=
X-Received: by 2002:a05:7301:5412:b0:36d:158c:e31d with SMTP id 5a478bee46e88-36de6d4cca9mr5494583eec.18.1793914290965;
        Thu, 05 Nov 2026 13:31:30 -0800 (PST)
X-Received: by 2002:a05:7301:5412:b0:36d:158c:e31d with SMTP id 5a478bee46e88-36de6d4cca9mr5494536eec.18.1793914290179;
        Thu, 05 Nov 2026 13:31:30 -0800 (PST)
Received: from [192.168.1.9] ([106.222.231.155])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f72fbe241sm1023706eec.10.2026.11.05.13.31.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:31:29 -0800 (PST)
Message-ID: <e1c19166-9abd-4a35-b532-a3287bfe7607@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 03:01:23 +0530
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
Subject: Re: [PATCH v6 00/15] drm/msm/a8xx: GPU state capture support
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
References: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4NSBTYWx0ZWRfX0LqQ8en3PM4Z
 122MDzGVsjT4mfcB8jTZGUafHgK2p0iDBcg/HybNFvO7k8IFptkm7dG2EEXJZ+bp/DhrFe1F+Ft
 QAoAxJtRqnah9kv75do5F8dHbcL8+1A=
X-Proofpoint-GUID: fKgQxkmqk9oJKsQvyB-xeUffq89RCLWB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4NSBTYWx0ZWRfX9MMlGUt2DYz1
 Cti5GcgxdHgwVGtsPBHO27SwN0vEOu3wyZUA1WPbSrDdLPF6nZE0wDZOme8oQrfQPkpySBKvAnm
 qi52AsMZWTPkFriXnxAN2HgrpqkzhQp5S8EjnN/uPyv298azF58d5Bx+ngAtQEqbT51FO0Bekhc
 m/L1PKF8zpFJ5/5UD6PpxnFJaW7c4CAOyaJnSiE5ygod8Z6acqUCFGJ9izWkScmCbH1+moalqJm
 FZzCfLqwchltK+BA9QlgwD3MR1qdCTCAq4+tuveCpd0U1hHPtSaokr/B/qssDEI79M/ALV1yPD7
 LDrUE6GKIXr7V56pe1oO51Rq658fhrZv0A4CeClycXoInPC5tRjPBxzZsws24t1ik9yu6T85dTB
 ouyvIgXevbd8XpE+030DzTdYrsWx+v9jlGY1Dv4T3qhD5aTmoO0wI3+wAsFAVJ84r9x2x46HpmT
 cEKSP9KjU0KjAp+MAYg==
X-Authority-Analysis: v=2.4 cv=dKUzC+Zb c=1 sm=1 tr=0 ts=6aecf5b4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Hj0ah+TxS5FywmoD0uLh0Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=y5CuoXqKkQWRv-GPwuMA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: fKgQxkmqk9oJKsQvyB-xeUffq89RCLWB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050085



On 11/6/2026 1:59 AM, Rob Clark wrote:
> This series introduces gen8 devcoredump support.  Compared to previous
> gens, it:
> 
> 1. Switches to generated tables.  Compared to hand modifying headers from
>    kgsl (which were originally generated, then adjusted a bit by hand before
>    adding to kgsl tree.  And then copied to drm/msm and lightly modified
>    some more in the process).
> 
>    In the process, we also switch to generated cp_protect tables.
> 
> 2. Aligns to the "snapshot" format that kgsl/etc use for hw state capture.
>    The non-generation specific bits (SMMU fault info, capturing relevant
>    BOs, etc) still works as before.  Everything gen8 specific gets encoded
>    as "snapshot" sections, ascii85 encoded in the resulting devcoredump
>    file (similar to captured BOs).
> 
> 3. Try to make it easier to at least compare kgsl snapshot code with
>    upstream, for porting fixes/etc.  State capture is tedious and mind-
>    numbing, and the last thing you want to do when debugging a GPU hang
>    is going down the rabbit hole of having to first debug gpu state
>    capture.
> 
>    However, I don't love kgsl_snapshot_add_section().  It does avoid
>    duplicating snapshot header stuff everywhere.  But the ergonomics
>    are not great.  So instead I went with "align with what I wish kgsl
>    looked like..
> 
> The mesa/crashdec side of this is at:
> 
>    https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/45304
> 
> I'd appreciate tested-by's on Hawi, Maili, Milos, and Pakala, since I

I will help with Hawi and Maili.

-Akhil

> don't have these devices at-hand to test myself.  To test devcoredump,
> you can use the msm_recovery test in igt.. or just:
> 
>   cat /sys/kernel/debug/dri/*/gpu > /dev/null
> 
> NOTE: I'm still tracking down some descrepancies compared to kgsl.  I
>       think at least we should be matching on the excluded access-
>       protected regs, so hopefully collecting a devcoredump doesn't
>       make things go boom.  Tested on glymur (windows fw) and on
>       kaanapali MTP (android fw).
> 
> NOTE: Uses $codename for generated file/table names, rather than continue
>       to perpetuate the equally meaningless gen8_x_y naming from kgsl into 
>       upstream.  At least the codenames are familiar upstream and this
>       removes an extra level of name translation.
> 
> v6:
> - Fix gx_is_on() check
> - Only capture preemption records if preemption is enabled
> - Link to v5: https://lore.kernel.org/all/20261102220405.30730-1-robin.clark@oss.qualcomm.com/
> 
> v5:
> - Fix inverted IS_ERR_OR_NULL() check
> - Drop IFPC fixes (moved to their own series)
> - Link to v4: https://lore.kernel.org/all/20261030211928.45761-1-robin.clark@oss.qualcomm.com/
> 
> v4:
> - Drop RB_GC_GMEM_PROTECT from nonctx list, now that we are computing
>   the value directly
> - Add missing 'break' in switch
> - Move RBBM_MISC_STATUS read to after we check GX is on
> - Rename sysprof_setup
> - Add cleanup.h support for disabling IFPC, and use it in debugfs
>   snapshot path
> - Collect tags
> - Link to v3: https://lore.kernel.org/all/20261029201730.151754-1-robin.clark@oss.qualcomm.com/
> 
> v3:
> - Drop generated nonctx list for now
> - Exclude access protected registers
> - Shuffle around some debugbus blocks to match kgsl
> - Use CP_PROTECT_PIPE regs to pickup the extra spans if we exceed the
>   64 CP_PROTECT_GLOBAL regs
> - Inhibit IFPC for gpu debugfs dump
> - Fix cx_dbgc capture
> - Misc other small fixes
> - Link to v2: https://lore.kernel.org/all/20261021204244.67160-1-robin.clark@oss.qualcomm.com/
> 
> v2:
> - Fix incorrect protect list for Kaanapali
> - Use __free() for snapshot_sect finalization
> - Fix missing early return error path in gen8_snapshot_mempool()
> - Fix aperture setting in gen8_legacy_snapshot_mvc()
> - Fix first_slice in gen8_snapshot_mempool()
> - Remove GBIF regs in generated nonctx list
> - Link to v1: https://lore.kernel.org/all/20261020204728.28844-1-robin.clark@oss.qualcomm.com/
> 
> Rob Clark (15):
>   drm/msm: Import adreno_snapshot.h
>   drm/msm/a8xx: Export aperture helpers
>   drm/msm/a8xx: Add a8xx_aperture_acquire_raw()
>   drm/msm/a8xx: Export slice helper
>   drm/msm/a8xx: Add missing a850 ifpc reglist entries
>   drm/msm/a8xx: Allow nonctx reglist to include GMU regs
>   drm/msm/a8xx: Stop getting GMEM_PROTECT from nonctx list
>   drm/msm/adreno: Fix PROTECT span length
>   drm/msm/adreno: add temporary __maybe_unused
>   drm/msm/a8xx: Import generated headers
>   drm/msm/a8xx: devcoredump state capture support
>   drm/msm/a8xx: Add all CP_PROTECT_PIPE to pwrup reglist
>   drm/msm/a8xx: Use CP_PROTECT_PIPE regs
>   drm/msm/a8xx: Switch to generated protect regs
>   drm/msm/adreno: Remove temporary __maybe_unused
> 
>  drivers/gpu/drm/msm/Makefile                  |    4 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |    7 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h         |   14 +-
>  drivers/gpu/drm/msm/adreno/a8xx_catalog.c     |  404 +--
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c         |   65 +-
>  drivers/gpu/drm/msm/adreno/a8xx_gpu_state.c   | 1403 ++++++++++
>  .../gpu/drm/msm/adreno/adreno_gen8_snapshot.h |  576 ++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h       |    2 +
>  drivers/gpu/drm/msm/adreno/adreno_snapshot.h  |  530 ++++
>  .../drm/msm/adreno/catalog/adreno_glymur.h    | 2307 ++++++++++++++++
>  .../gpu/drm/msm/adreno/catalog/adreno_hawi.h  | 2387 +++++++++++++++++
>  .../drm/msm/adreno/catalog/adreno_kaanapali.h | 2317 ++++++++++++++++
>  .../gpu/drm/msm/adreno/catalog/adreno_maili.h | 1882 +++++++++++++
>  .../gpu/drm/msm/adreno/catalog/adreno_milos.h | 1977 ++++++++++++++
>  .../drm/msm/adreno/catalog/adreno_pakala.h    | 2161 +++++++++++++++
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml |    4 +
>  16 files changed, 15718 insertions(+), 322 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/adreno/a8xx_gpu_state.c
>  create mode 100644 drivers/gpu/drm/msm/adreno/adreno_gen8_snapshot.h
>  create mode 100644 drivers/gpu/drm/msm/adreno/adreno_snapshot.h
>  create mode 100644 drivers/gpu/drm/msm/adreno/catalog/adreno_glymur.h
>  create mode 100644 drivers/gpu/drm/msm/adreno/catalog/adreno_hawi.h
>  create mode 100644 drivers/gpu/drm/msm/adreno/catalog/adreno_kaanapali.h
>  create mode 100644 drivers/gpu/drm/msm/adreno/catalog/adreno_maili.h
>  create mode 100644 drivers/gpu/drm/msm/adreno/catalog/adreno_milos.h
>  create mode 100644 drivers/gpu/drm/msm/adreno/catalog/adreno_pakala.h
> 

