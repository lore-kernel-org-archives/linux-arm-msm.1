Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5A03DA5B7
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 13:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792416468; cv=none; b=jFNGYM1nK8dpRG2DtXidwrPGKQxrBsC5Q+M+3jiAPhx7oZeOrDNACttFLFrYQZ/kXQw4F21K8ogcmFv9DpG0bTQXPC1ZushDLu2d3CFLEhYcTedcu5iwGsqe9WauTtLemMg3VIs/M27bFKbS4QqwVxbQ0UJNBnZeoWhVbMpzGPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792416468; c=relaxed/simple;
	bh=US44NmlZcVMm9a08LdXXM5xwMBLepJU1swlqY5SVK/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J+ORnYXnQ3OtBvLEjDffbJCPQy11Rl/mCWa587BwRkN5w4DPqcxSapTChCIpVqr/Bd4InSjowjKxmad0q/PKwTITOMpoxY7QlqeeCnvVSBQG/j6DVDJTBya/HNsD7QdXFMo/tc9FOZRIZHkI1JjapoXtI85ZNTsgTRfJj4IrHKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Du6rHsLa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ii6g6G2H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Du6rHsLa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ii6g6G2H"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8PCMT2193383
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 13:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VzSWM0qjlnwVL0p0Q5tt8OPvdg+HopCHeCS0win3WeQ=; b=Du6rHsLa1o+uVv4p
	avJ5ig2JCVloBqKJXUcI7LZN2UAmOs5Z9/hVLb3EY0OdtCg3r+fi7lk1QZwdkF71
	QeBQQ2UTYFWuMGPuVcm4Us8405DUS9oSO3i9s0IeSyZqar/4kxPe1VA1gxbz8rFD
	mkZFgguZ7SUc3WIpvtoiEy/R9pCtv8Sjgoejt6luPrLdExbPaOdJjQklWq9MLo5A
	oMyelj06IEX0KvKAI8q6cCuxp+bdDQhafdcMzoov3Fn8k5qRXYDWPcSOpGQtjllC
	Vrn9XfKytotRmcO1WuFYktDi/mwzdCt9Skp8635KX/odZzmBqmAoZvIjNziaB+2e
	6TQJxg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5w1aw22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 13:27:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1f1f2ecfso73681785a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 06:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792416465; x=1793021265; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VzSWM0qjlnwVL0p0Q5tt8OPvdg+HopCHeCS0win3WeQ=;
        b=ii6g6G2HJOWjSrVHjGMUv0i3o4NRCn1ZJuXAm/cRHMD4MXhCK1Mx5cBBrx8OY0bCTD
         hC43cpCIUYXYdroO/F55NLoPYptbOMjonMkDlCz6qeLsiJKGhj4HWjdrcKVFdu1CGEOI
         vojROBRcZPCi/lKsc77rond+nPOzAupxeGittE0bbOQOPwLcv40YDPBEdf3J7txHfItg
         JRCV7vdA/IxRpfDk7Xqvcwj0VxDzv6P6M/zmwQo64CtYSBVV0fF401qSyOaGtFbyM75/
         t/jIJ9mZBFZCc4JPpLlPY4duEgy/P0yt7DRiGHqb8oza3rpF+7txEsCxecKsxTDrZhVa
         80hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792416465; x=1793021265;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VzSWM0qjlnwVL0p0Q5tt8OPvdg+HopCHeCS0win3WeQ=;
        b=KZ7y0gYolQFOOeLHi5bSu9rIgzxRLwhYqyFnrRzMqWNFbAZXTohoF2uTP6VLCDeTuA
         r4WRa0GpNjs5gLj/Tds2TS2vTkc/wOZrNRw6rluq+1BXrHdv8cauNIQw2+x2Oci8jKwx
         wptLyHv66WVYZ7Ud3hwieZ/t5zjxnDiEWiXEqgW8Tipgq0GpHwN4Ez3bH8k5cmM2g90D
         IVcGsXgkCMnF9aSOrsqEoYKWDHEbqTyQarIZTic8vwB5Ml37liwrT3A90g3zEQgAsd4x
         zZqDXj6r3ykJtb+NInUdhungms+M8rjusfM37yvmNTCYBmTU1DlyVkqTtA5Dge2Sd6i4
         Dbqw==
X-Gm-Message-State: AFq9FYJ9+yQKRZ5EeNF5BfiteDN0/z8p7Rdjg0cCIqRquhbNkJlaYU++
	+84aIcMmGOZSO9XRmFwrsTWRD5G1LDpZwW16W5j7uDt9u+2F93NLs21aiJAsHF7gER2nIpM7PCF
	qSaEM8At/YWB0C5dxcGoyrE0pTY6lGAd/VmfmuPi13GVDkH9524/Pht8OlyGOjj6lLi7s
X-Gm-Gg: AYBFou1qrkhytS2BTRrs4OenassYYEz6eiMR7fJTsjlyXkjEBOsayvA7v1owIBW3UHz
	gSfqVvjSwBWlgqFBlVChrD2GdoBH+Ry60DEkTCQ67BSMn2HV2NuXMQE48i/9Kl1gkBH7Tuxl6Cq
	xKEQfxhXqEzrbbGZNVENgi7W7HM2iHjnkcYEwhqXC3z6VMX5VQ67p40BeLUhqatb/eh+G5cwZrc
	0LJaQUEdWuMWRGsgqrbLiW3kExxYXf9/4lwwrmqaKDm3iohZcSStq5Fh52PH3i4MR2+3UKv+Ohg
	eBxdfMg+uKuYAAYd44REPxVZXqocUKu1mI+eP/zOBW3rr+31u2iaugC03BTQyHN9+OgzX+YqeT+
	gWihUXFumo9faRSODC+g02g==
X-Received: by 2002:a05:620a:4402:b0:93e:508b:7800 with SMTP id af79cd13be357-93f29a21553mr1469817085a.0.1792416464292;
        Mon, 19 Oct 2026 06:27:44 -0700 (PDT)
X-Received: by 2002:a05:620a:4402:b0:93e:508b:7800 with SMTP id af79cd13be357-93f29a21553mr1469811985a.0.1792416463768;
        Mon, 19 Oct 2026 06:27:43 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b1347sm4058496a12.12.2026.10.19.06.27.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 06:27:41 -0700 (PDT)
Message-ID: <9ee7225b-588b-4253-b766-5e6ee6dffb04@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 15:27:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: keep vblank enabled when entering self
 refresh
To: =?UTF-8?B?UmFtw7NuIEplc8O6cyBNaXJhbmRh?= <ramonjesusmiranda@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261018155423.1299629-1-ramonjesusmiranda@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261018155423.1299629-1-ramonjesusmiranda@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1MyBTYWx0ZWRfX0FpCxntUh2a9
 e3Yt32gRaIzOB35cL59cPdSBc1tTnNczJZiG/BHdxhdT3L5goyVGVOx19oXY2kTXY0AcFE+hk0G
 ri0UphJ2VtVxqRie8H0Xf8RFTkIuE2s=
X-Authority-Analysis: v=2.4 cv=KuPYSmWN c=1 sm=1 tr=0 ts=6ad61ad2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=v0c-XO7ZLijyoodaFGUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1MyBTYWx0ZWRfX1h0eOfIK0wTO
 /5eAeXovjq1cyLfHvaj4VUpJrEo5YGOm14NBa6sLLr+TgAP6EYEvP6LvtkDxhxKL7F+8ashywU+
 9BiRfJSF3ShZSpSNxrHIqhO/lLba03qGxMEe5MVgl/6iBLusIMZU/j9fRD3X9Xiqa51Nru6Xzh9
 HT+cS2yZNbepHigm2q3WhSbR1nsBTUC5EcyrBrKuNaI2SszujV7qhV24xzkf27oV4JdHrSqUgBS
 JL5hslRE4h4vTPR0tbo0cATx6pMcRyN+eEo7630b/SW+HtqG+PRBu6twbZGw/GTW2fWOh4F564L
 Z9FOvubdlK8wWPLRUBXZ/92DnSj7Mt80RDyJ2t1xHr5iOQVDA3Z587YFrVVm8kkPCDRx/AZujRn
 sPlwYuegJSerCfA59DcBD9+GhzigiWnN2nGYx4zAXi3b0jrbrnbZosKsrxHBVYbNmPBw0jvzgU6
 L/n9L/LRFqc8A2NjFPA==
X-Proofpoint-ORIG-GUID: hW5JlDsvxr_8MWVVzkEh64M7TxRTNZ4d
X-Proofpoint-GUID: hW5JlDsvxr_8MWVVzkEh64M7TxRTNZ4d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190053

On 10/18/26 5:54 PM, Ramón Jesús Miranda wrote:
> When the CRTC is disabled to enter self refresh, dpu_crtc_disable() only
> checks old_crtc_state->self_refresh_active, which covers leaving self
> refresh, and calls drm_crtc_vblank_off() otherwise. The atomic helper
> then expects vblank to remain enabled for a self refresh "disable" and
> warns:
> 
>   driver disabled vblank in self-refresh
>   WARNING: drivers/gpu/drm/drm_atomic_helper.c:1296 at
>   drm_atomic_helper_commit_crtc_disable+0x1c0/0x1f8 [drm_kms_helper]
> 
> Skip drm_crtc_vblank_off() when the new state enters self refresh, as
> other drivers supporting self refresh do. drm_crtc_vblank_on() in the
> enable path is safe either way, it only drops the reference taken by
> drm_crtc_vblank_off().
> 
> Seen at every boot on a Microsoft Surface Pro 11 (X1E80100, Samsung OLED
> eDP panel) with eDP PSR enabled; with this change the warning is gone and
> self refresh keeps working.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Ramón Jesús Miranda <ramonjesusmiranda@gmail.com>
> ---

FWIW this is not enough to get self-refresh to work on the Glymur
Zenbook A16 and the 8280-based x13s, the screen stays black if
there's no updates (it worked on the latter in the past). Dmitry promised
to take a look one day.

Konrad
