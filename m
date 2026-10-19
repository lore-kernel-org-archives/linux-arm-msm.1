Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4F54E2F0D
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 13:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415562; cv=none; b=MkIIfPUGPtIRO8Z5RP03HpnVZwK1o+qQpPtZ45qvv2x3DiAEr9XaJe+woVtNim7va8omAORrTK5OXV3RGaWfwf1lAfbWMrV8cCYApdmZNdS8GrFnMbygPBVycUo5Xb9WHtFRK7DdMTniRjpKla3PSDV0S3yr8gYYQd0uQEe/188=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415562; c=relaxed/simple;
	bh=GvswLeoPMq9qUuYxNaLFi9EH86eoSCSL4PfQ/S5C3S8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IbwTO5hjMv0D/ZQG9y/vvo5xyA66VDUN+aC2MCzbE/n71cjKLS337S0zcgIYbnoZmtQgyp6R4qUIQmwgiJzrHxgFdZx6HMncvCeyhFAxecqIf20cRDCUs6OKP88F4VkLLATdF8u9CSaPuXHD+cvhC5x/F3kgfDU5CexddrBlN+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i9nUne6v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GicOWVTK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i9nUne6v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GicOWVTK"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Oq2Z3256584
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 13:12:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/qNr5y4ZAaHaRtm/DLNxynk27BAss8MqyZxIcCw0oJY=; b=i9nUne6vhgE41aXf
	lSkrffUUfuRxkHp+gVA599Dd9cZ6xzZdCAQaOMZ9WHyyaXG6Ws602kjBjePooA2l
	Epg4wreDPVh2RFlOdHr3XDcSQ92z0Jf+0ibFsS0HUF2qnHGRaqF2Q+UnYfJ2BfBk
	kham9SHdLrcRxej7OsfBtZ8CXavt9x20hlnTwptzX3KBZWJp97VpmeRGOCyH4hJb
	GHyok9sQhrb+hNPHah+0QGlQNnPpit00diYem2TbNTclbQbJPdhn59CC3fA4uhlO
	E6tw77sEpXtXgDOxfy2dA10OiyyXIl/NcAAvWAHATKSZbiLiB2nxZ2OmWG3MV7F1
	ELq/4w==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3f97hf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 13:12:39 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eacd73e83bso22861e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 06:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792415559; x=1793020359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/qNr5y4ZAaHaRtm/DLNxynk27BAss8MqyZxIcCw0oJY=;
        b=GicOWVTK8fmEkH56PzBamDYN7P+iHKnSkAhyOYmo5JLBjE/bu97IkD3IdIGVWqphyF
         RTbREIOYhSFWgfbJwv/TnSYscnOAvAhfDqD+7Ukr5B1OOBYh32aGGwy4ES/EJMXagcME
         0LiN4IckL5kABMPE7HIMqTKB22p3Xg0wT/9RVPEWwW2WO4FBo/xbJJeCiXYPN6qZBUJ6
         g8ZVjvnZkJgpv20Y8xooTF4NJiHh2xpboUrgNp5/I4nWrQR1PZuzJehxggYpwin2DIba
         HDiwt6UJSNHpp2JB63YqJUvsm9tikAqlc4/jXWXr/675vdFC7GPDBVXHdS/H9JSNDqxf
         qqSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792415559; x=1793020359;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/qNr5y4ZAaHaRtm/DLNxynk27BAss8MqyZxIcCw0oJY=;
        b=iYtgb147bpbCF885PwgFq2/XEgSt9tO0317vO/xJANkS6AKDpQENLwKtC/4vhL2erv
         oTShbGRmVr4NAijHCK1IHwKHORkQ9wI5FH8PG/SL//3tHP3hKGz8lvM2s/xX01R7IoD+
         YJ1zk4oCm/t233EIuFiEaWS4AW8VIRSo6iZFnPnAVqyFytMKkd5PKgk5j85XQKVIGOCm
         2f31NIl9TD8VoXAYoyDrVr4K2pGy+erifD0IrA9GMW7XtE9OD3KC9PgkOM2buwUr421R
         ClhxzmmpuJr9I4QJEgiuI4m9+8HLQgETay1l2dmkzIFpwHe40vcc6U3z23Zf/3Fc/imN
         xllA==
X-Gm-Message-State: AFq9FYJYPGTzMmYn5+O7bBSfkRCrxflm36YZOTIN6qoFM7qO+21tryDy
	ihm5ME5rAveJ1jEsW9dMaHvuLdBKv0ojsXH/DGsLTBRRmh3UQUCdfmS3UlMbr6cDQi021Z4Kcwg
	HJtMNL0m7bzi88pOb4qEf4vqT5xgnVNLQPi/b/py9sxSoYvKLGBMDpfl2Xf5yIcLIWQvg
X-Gm-Gg: AYBFou0WaU64onexpmPovdvxr68aWk3hGwaONdqOJwJNK6fqg3KfdE3bLm4ITAmArrH
	czIXdN/sl3DBIjzbTkTG5V4rxvFowW7umNp3c58Zt9+xljtIOeVFmUc7puozXWgecCJD9jJ4PBh
	Kr/pftqIw/rC9dGaJoiKXBDGe2mfSV3R++eSyXQsmSm/unm2lsg4tuQE8nQNluybu4MYgEMcgPw
	IAnGKepMk7Mgzvak4OqYNCW4hvO+EhAktOX8+qGkTVCY8NXnoVxSy1mjbt8tX6fgVbakTsxbm8i
	wS0J2Evm1blavRpnpfelFSf9MBhqikpxDtfLdyGh0eDwLYRIemXSmo48f7rjs7O2x+qwlMWJm8u
	/ZcPeDiiVfRAa+eXkNM70UA==
X-Received: by 2002:a05:6102:26d2:b0:7c3:83a9:edc9 with SMTP id ada2fe7eead31-7cc367447afmr1369841137.1.1792415558858;
        Mon, 19 Oct 2026 06:12:38 -0700 (PDT)
X-Received: by 2002:a05:6102:26d2:b0:7c3:83a9:edc9 with SMTP id ada2fe7eead31-7cc367447afmr1369837137.1.1792415558381;
        Mon, 19 Oct 2026 06:12:38 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dcf100sm353774066b.15.2026.10.19.06.12.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 06:12:37 -0700 (PDT)
Message-ID: <9a058856-2dbb-4ea6-93f0-ed4d2ccd3ba7@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 15:12:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/msm/a6xx: Program the PDC sequencer on Adreno 620
To: patches@brar.si, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016-adreno-a620-v1-0-4a7ed6210d7d@brar.si>
 <20261016-adreno-a620-v1-3-4a7ed6210d7d@brar.si>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-adreno-a620-v1-3-4a7ed6210d7d@brar.si>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: u_sdMzpCdRoVGp0J3in9NNJg3k7plSPt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1MiBTYWx0ZWRfX1WFA+BY6nNI7
 JP0cC3ojpOckaJxM42KrU3DvqvA7NFaNDyfNhoB3eAsFD3YScBe3FfA4IB/XirJQBKscATAwb/K
 KFl/iQovdcjsCce6+i1eey6a5zQdIe+kW1sT1+Sfv/L98gH4J9O8NvU/CahpSBXHIUKMEZK1j1U
 60ejlL+c1DFK+GpbClKqqPNBpNahihIPgM7isIhCxF7uAbiYrFrbxZG/ME2K4lL8zOMh0kwNR4w
 WT5iPXZwnPmM2u4QSCbJMMSv17po3z4tBHBeJf9TmmLNT4mG+kOfWuUuHPWInw4I3JNbAxE7zqt
 qHYUVBqx+IBvJwBdf3bTUESciC+1YGPmQ5igIk0Y1T8cA5NYGgeZrG7X1FcGJjkgs8c0Tu9x+fM
 HwBeihwqiIlig0BIgu5+sCzFF6GHjTiWNpyvvikzFvW332viSw1ZFuvdiyE4VxqCTP6UpsjRJOs
 xIYadnp6OzDq1bBt46Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1MiBTYWx0ZWRfX2joTowx0k5NW
 X9GgTvmhTS9+Sp26TEzOuiqwrGHHAf2bGj595h8PwKqlIWG7P1rndvGO41VuVMTy5WQKZp4mWRF
 ft893eeyl+u+3mzATOEE387UAq54afg=
X-Proofpoint-GUID: u_sdMzpCdRoVGp0J3in9NNJg3k7plSPt
X-Authority-Analysis: v=2.4 cv=OaANnRTY c=1 sm=1 tr=0 ts=6ad61748 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=ODsmY_3wxSbvKopP8XUA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190052

On 10/16/26 2:53 PM, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> Unlike the rest of the A650 family, the A620 does not get its PDC set up
> by AOP (the downstream devicetree has no pdc_in_aop for it). Without the
> sequence, the RSC never acks the second power-up ("Unable to power on
> the GPU RSC") and the device hangs.
> 
> Program the sequence from the driver, taking the xo, mx and cx resource
> addresses from cmd-db instead of the hardcoded ones.
> 
> Assisted-by: Claude
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---

There's also this hunk in kgsl:

    _regwrite(cfg, PDC_GPU_TCS1_CMD0_ADDR + PDC_CMD_OFFSET * 2,
                        xo_resource_addr);

        _regwrite(cfg, PDC_GPU_TCS1_CMD0_DATA + PDC_CMD_OFFSET * 2, 0x0);


====
        if (vrm_resource_addr && adreno_is_a620(adreno_dev)) {
                _regwrite(cfg, PDC_GPU_TCS1_CMD0_MSGID + PDC_CMD_OFFSET * 3,
                                0x10108);
                _regwrite(cfg, PDC_GPU_TCS1_CMD0_ADDR + PDC_CMD_OFFSET * 3,
                                vrm_resource_addr + 0x4);
                _regwrite(cfg, PDC_GPU_TCS1_CMD0_DATA + PDC_CMD_OFFSET * 3,
                                0x0);
        }
====

        _regwrite(cfg, PDC_GPU_TCS3_CMD_ENABLE_BANK, 7);
        _regwrite(cfg, PDC_GPU_TCS3_CMD_WAIT_FOR_CMPL_BANK, 0);
        _regwrite(cfg, PDC_GPU_TCS3_CONTROL, 0);
        _regwrite(cfg, PDC_GPU_TCS3_CMD0_MSGID, 0x10108);


if vrm.soc exists (presumably because a620 shipped on a number of socs?)

Konrad
