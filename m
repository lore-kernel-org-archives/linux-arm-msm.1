Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B25317D6
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 12:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787662703; cv=none; b=OAUsP5fxVnti5YRvHnXt9XVlxFzcrEi3YHG+pf1ZioBqgTPuBqDnYYC6KyEoIyIw6TSIjWNWVLUlibL3VaGfOnSITuDHdnjl8k8NF2haNPSQ5CI2Vdy8DnXLs/8yj0iROAuot4zF+qrTCO9x7ImYUkKHYhrIQWb05/xqHUC5P1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787662703; c=relaxed/simple;
	bh=7lrzW3e9+VzyOzJ+S098R/p2dFVHXPOXBuZx2rcpeyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K/GXIZ6GKnkI2BEizeUdNzlzreWcp5R2HtIk11n6o0MMHr3JFgeNUryDsL8P7Fx+vGam7MzTsjdcGsX4bgaZ+susmT98/AoV7a8BuNzJGY0NNqE6/lS3GwE0F7TLyt0Bn5jji1cduaQ9znFu/IBULIVbcrS+qsm/x463im3kW+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mGAfDb7m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RX8P30XA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mGAfDb7m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RX8P30XA"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PAv68k1761469
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 12:58:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G3ifIdPdT99rwneLSkbnF3VT5njC7knW/MddlD9ny2s=; b=mGAfDb7mOADjtpDo
	RBPniUWqvV6pIO0mDRcbfNN5bTRHFUmfheDRIHRROJJkeBdWj/I8n4yDB/arSwW1
	4SoVmtz4JMoMBNh1+vhnzmkGDVH07p/tHv4po57FoC7yYo69bmdXE/OJeFnJbksX
	+4Rw/KwIXQwt8bwCdyk1GXPAM7YB2+AcM/CW+S4k1IpVxq5Y5macXYSPecRKX38s
	fKTBzkDXDWbNL6cPyJyypPLz9bV2TLqVncGCeuk9uz5QmLlutvFKtQdwzoBr+n1F
	wWp7g9XO0k5sUaNYXU0Wye3Dp4c/JjmqCBRWtefIEwt7HGsSJvfIs3rfIQnRdjrg
	zQcU2Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g96abse30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 12:58:20 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e11baa66eso7049940a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 05:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787662700; x=1788267500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G3ifIdPdT99rwneLSkbnF3VT5njC7knW/MddlD9ny2s=;
        b=RX8P30XAXk8C9qtsYaPQEDN9yvOCQGhzjXIpca3P+jDh4VUT5sqXIzQB/pmqpjdlp9
         tT2wQz9gpr8HRFteqaUC3W+KzwemLaVedEgKSDoqBAJb+9iaHYnPTKRK/BzQ2HnAIJIe
         +UtQmK4iR6TONh7SstC1LXbWL2Jde976GMde6Uxu/5oQngahkMmFnvSBv9jrqD8IyhQr
         4u3rKYnzERgHG/OpWFiSMfxdz5PdZvFl0AvtkBz1vf0GxEJOqkL3Jx9oDcLAakpQpqPe
         rJK0W0pYT3vLcreFQ6LrVGl+ZIACk4DJussQpzuDPqlMIDeo5y3WcBLcx+hLoHQ1W4kJ
         HN7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787662700; x=1788267500;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G3ifIdPdT99rwneLSkbnF3VT5njC7knW/MddlD9ny2s=;
        b=qe4U0qh4ERuYXT+JOiwMaVOxaxFGe8HBIFxaAJZdgk0reHN8x3B+r65adzQF42RQv/
         WdMIEZTeO6Ae3uAU0uaqxq3x4MVD75SqvA6hy3ykZUpDrgzNXugylVafgT7MxMZzCA3g
         qdI7CFFmdvISACIajklCvxgRSaR4mH5FCS78KT1aWuOGFIxb0NF1o8KslbkIOINhJpKJ
         HTdKA7MPGBbVikLUUnw865OOX1E0l26gIH80M1sl9EzMh0dDs9eSS4XeWjncgzJTYlss
         3GoXF0wmwbBSu0eNpqR5D1g+h4FxeRHlr1xh2ZeWq19M+9+GuCG4nLINcah6/T1LRxyl
         I3kw==
X-Gm-Message-State: AFuF++lbkPwhKDVNK3wFNT5aaNhjC6aeV64QTG371vLevi7F7csEz8gP
	o0SRKbqeXiPoskzAFxxU257rSp3YB0oe8WNPR7BWgoCf6J9DAXoBofkNy/FolJRJ5Rxb9qVmbxA
	Y1IvupsN37ecBBH4vO9ewpL+MX4tp4xdKRxNslYoYhjZa+OodgpzUezsqqwXZAz0nIJWC
X-Gm-Gg: AR+sD109/0GYN96Am2iPRMXFZJ0dS/a4zd3u4DcGx+zLBKKVASm6rQBYKPS1vnmzvm8
	+3gv7Sb280hkeC+llfUkbxGkkWoBzkF0Vn5QZ2rjzCvMRWEYys/VyRAmBHogt0ttXwEhpRLuGRm
	1ajStZIv1YuPfOX0Y5rQYTHSc5YhA70V7ZzkBm7pdbTAlcZvd+uif+G1QbHLRiGF4OY4XFPm97X
	8JF2Vnq9OFXYBw4vgO5qt/SuSKGA13g3LG68ElNGKFGxGHezc6Obrwuhumc+24RpOH2SUCrSQ02
	bErdbFnKcbIDneJcriP/ZWkatPgifkCGMS+GLt4MsGM2IetNLIX78A7S713OtnAsATFcrBa/g80
	3AWRsQ+MRq+cbjr+pLzsFSbxnJZzakwB5cAE=
X-Received: by 2002:a17:90b:4c81:b0:380:f85c:94b4 with SMTP id 98e67ed59e1d1-396463e4314mr11898991a91.7.1787662699793;
        Tue, 25 Aug 2026 05:58:19 -0700 (PDT)
X-Received: by 2002:a17:90b:4c81:b0:380:f85c:94b4 with SMTP id 98e67ed59e1d1-396463e4314mr11898862a91.7.1787662699236;
        Tue, 25 Aug 2026 05:58:19 -0700 (PDT)
Received: from [10.217.218.158] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396420aa1c2sm1125110a91.0.2026.08.25.05.58.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:58:18 -0700 (PDT)
Message-ID: <545f5ba3-6d6f-4652-9fce-262eed393a73@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 18:28:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: qcom-geni: rename setup_fifo_params() to
 setup_spi_params() and make it void
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260824-spi-qcom-geni-cleanup-setup-fifo-params-v1-1-bdf98ae62953@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260824-spi-qcom-geni-cleanup-setup-fifo-params-v1-1-bdf98ae62953@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDExMCBTYWx0ZWRfX4RvfDXUNcvtS
 tZH0noHYzDUBRHP//gsrquFEETu3Gregniq6BLTk7a9uauIATt+g589GCioo2sRmKDE4jdPrtIL
 oUpwbUtyTE+MZsiwqhn+t0Gy8XRMk2JjWrAlNL+mRpjDsMgvi+d1UW8KM9ryTcrDdaQ95hBzGBB
 0V9pk0WPKZXhPCaKrMoZTcwo0IcPpRi9p50Br1WoaMx3IQhXUPKnQGpRE+DpDnp9OL6TBrAkFJ2
 MTpXelXfq5CBrz8BDyncj0miFEco6qGCEjgdpmeq8TAxfmXwm9gZmoJxopIkOABe87SPMnlmXOy
 Dp0M6NhKthNAH+THrlpNS63NnNOjqnvL7w9+dszuraJmMyPpTcMbWcTPu4HGkU42MD/x2+BQqf0
 g0vOCyiZbWhyZFdJtJfC7xHZkx1NDW3/JkIrhzyt8VeijrYGeB43yJgRsAPMr38E8e30yPh4YQ9
 n/AH2TAY5GsXZenCDvw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDExMCBTYWx0ZWRfXyTplSP8sKoMK
 +isAT/E/yN7lJcKjAsO0zWH8VOnqGzNKPMiNRIGagQNueURUXLBLjHH+3FHULAut21js4bHAe+A
 NSDXyup/T+KcYnbJhheZ1bMfsKCXU/I=
X-Proofpoint-GUID: DaJROHe3QDkNR20fya_HlYsY5IbiMqfo
X-Proofpoint-ORIG-GUID: DaJROHe3QDkNR20fya_HlYsY5IbiMqfo
X-Authority-Analysis: v=2.4 cv=SaHHsPRu c=1 sm=1 tr=0 ts=6a8d916c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=pkmFLQsO-xIKxrFyL9MA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250110



On 8/24/2026 3:43 PM, Viken Dadhaniya wrote:
> The function always returned 0 and had no error paths, so change its
> return type to void. Drop the now-dead ret variable and error check
> in spi_geni_prepare_message().
> 
> setup_fifo_params() is called for both GENI_SE_FIFO and GENI_SE_DMA
> modes, so the "fifo" in the name is misleading. Rename it to
> setup_spi_params() to better reflect its purpose of configuring SPI
> mode parameters (CS, CPHA, CPOL, loopback, LSB-first).
> 
> No functional change.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
