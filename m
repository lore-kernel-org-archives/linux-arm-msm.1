Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930820;
	b=wRskS3araEWGsQ1fnJogTXwzz5OuBvL7TZyMw519GSB5OwIAkwsRBWaOE7mCt/ciA7tV
	 vmCSSSZqRsA/Oa0/5X1ZpDFbtW8SyO45GCbL/r9udugYvUgKT/Q6wLrO8QvGzbowkIzv5
	 dLfzyMSB7qTH6UDK0sBlwiO+f9t91EWXqkSrMTxR708J4fYIlaeDbODc+awROGUuZbFjk
	 CMFQjtcyV6ZA7igO3849nXb3JS2dptR1R8pD5B34s9NqH84ITre4Mu7hTyFbIMZre1riA
	 liWUCZ9JVEfKAvw4Pr25ikwkX9cyaOvxZFziZvuCqgpfixk0MVgGsVhO53JhgwBqziQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930820;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bZ1zWBA9tA8t4f4f40scSE62yaKcTCU2KrPmKEa3n+k=;
	b=T6pokDrcQfzxdsd3iAMcC/0QiNmJrVXVZWJuin/IE0lZxn+UP3VSgayESUSBwro5xkhn
	 TI84sUzS0FFtGP4b0YMlPx+KcSz7JAAJV4TSlX4JdC/mgMUoprbcAiykQQpGbrWTSckvh
	 n6V5jwvl0yE2IxcwTLw5Fm4r2FAbNrFcTJYdUEmw03I7y7FUV4IvskoGcx2JRgh932h/m
	 I/QySblStPjJGr7K//sBnO6ImKkkS8Xx1jvne1S4yVlxYznvvbrmd5ozAX5goWAlww+N6
	 p/1oysIGSgWxKHa1FjGez0k2bp88V1cDfuj8KJ1SqreZGZQ7bf7+K731eT5apErzz9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I9TG3SCW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hQupmvvD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B32C606A32A
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 15:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B32C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I9TG3SCW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hQupmvvD
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHFQlMr3208032
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 15:53:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bZ1zWBA9tA8t4f4f40scSE62yaKcTCU2KrPmKEa3n+k=; b=I9TG3SCWJ6lkD1NR
	pUxWMa9d0lcG2X6bj2TbToPcltL1ru8l452fZfi4Erb8sl/1l8pQEACc9xQSrIQW
	ekDh0qCEb0cgMl42yqXr/te5CS9YWlhGBWGcIcTZErGDYkdZUOiocd+DlGq/28xG
	D6LdlMHPELugGS7gN6BxduVu3nmcZCZGvDJuDUh2COwd5kY7tuwoNhU8s0ZvcyFR
	K4e+N3H86zyCS5OCaDntRfREwKYVlT5/pI84NiobWRewqyNe8q3T0TQ4xD3p4K3J
	tNcUarnBm6uVkaf6yMEkiiDygKa/A651EU4ci5clv+qrDzpuer8Dv9AOS4/g6HRk
	ohxwPA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0fjujrb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 15:53:38 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eae4d7ebd2so243239e0c.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 07:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794930817; x=1795535617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZ1zWBA9tA8t4f4f40scSE62yaKcTCU2KrPmKEa3n+k=;
        b=hQupmvvDAJprboKE2LVbSve/UblItP7k0XZxgQ+qkx0Hdls1xquejs9fgOwwwJd71s
         59Pt3XoNbd8+n/D1WJ42FoIjct4v9HPDz0oxjZY0gQrlq4LhAtKkFGAmbdiN8+h3u7BI
         fwXb4WQhjuhurkxeJoizLS2K3AIQzimlf+2YOy6qzXebToAezc2jeul0+7OE5jyF17Dk
         ikM1VwpiSJFTFDA4x4jLbnpni6QqHnE92EE+ysG5jXxK5Rdtq+FfF6B4eMCHwQ6ff7/3
         8SeYOGH8ir/TkXMPD9AcIbvAA7ZEFPdhnSpbiwsZ2vHzvhZuWtgahsd8nnTgeyog44wd
         DqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794930817; x=1795535617;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bZ1zWBA9tA8t4f4f40scSE62yaKcTCU2KrPmKEa3n+k=;
        b=ZsI2Bzb7vzs/kG5h1m+bF14rfamYXLeHnqfwQCyfDvdVm2HlCXoFjBWLqj1Pth83EL
         QA1HSpIKCeGFa9kVe5IzsLriKSJ5ASeVhI/9eawDVZhoiwnfDiN0Tq+4TxGKK2N7O382
         JU4l5gtV1mFm49dD18LRuhmGLbdxg7ZlXfLgjA6Cr0a0WUS03VxHPfe4mEmZ9LlC4m2k
         zKKan83w2Z85lMN7izwmrz87CyNa2JY9hts3/IgXFseTIBTIbRnDDoSnto6pnKTgE09m
         UW417JSI8xrxPgpMpKkZaaE8Cg35L7eeMtONOf74lIhjqsaQo/cJ3NIIyWs5kB9dOWf1
         xg5w==
X-Gm-Message-State: APuU4Z8cJ69CUsVyynBHaRZkV6nc+2objMhvPYCSoX8iusHkeSNC4Brf
	Z2aA18iv8NvlGrUMXW0RHBdK6Mb9mwxzV2C6ikeFtQMUtUwbGAOxpyBaLU4kKWru9XODxxnaGRR
	CeKxXawRVWihNqXYdu4oetPS1Lfs0Tdqh2c6gmOvQaQ5dulkn1lMmr/AmHCS4RB1EnNK2
X-Gm-Gg: AYBFou2kiAs+p3ILPpGFLQyQyAKgLHPgt2/CqxyzF1SFU/r/S0Hzk3OpxghvtNRovIJ
	zlIN97tt5XpnzOHKgodVuCWESQoNpOcw8AoZV5cN/ae4cRUgr7mVDjw6TA9KhDUTGZrm5Qp/Fz4
	hmSBNTD0+oBtJM/BUDy0sRx+3M9K3MFIFIl7hxcPXouyYvsebzeGV6JTNgzsEMwOuuEXwrjhtxs
	Ok0o0P0M+XzPnSmg2agTkmC3mjumI8gxR7nAFAB9B9BYtv6ItigXZkQ3vMdPsHY07IIukm84gvb
	5hn0tDn1kyTPKF2DY0o1RTtHt2hE5WzaLc3CndTt7nKwKASvtSvy6tWjE4LudWERwniUYbpJ+Qv
	xac6xNWiVyKTWD/iAWwXdmuod7wR0IlAAXGQEsMg0LdIG48yy0IrSIVV0bHdC9F/ombqqu11Xl8
	K04lw=
X-Received: by 2002:a05:6122:c2c5:20b0:5ec:e2a2:b70e with SMTP id 71dfb90a1353d-5ee34a7da4emr5532920e0c.4.1794930817539;
        Tue, 17 Nov 2026 07:53:37 -0800 (PST)
X-Received: by 2002:a05:6122:c2c5:20b0:5ec:e2a2:b70e with SMTP id 71dfb90a1353d-5ee34a7da4emr5532897e0c.4.1794930817117;
        Tue, 17 Nov 2026 07:53:37 -0800 (PST)
Received: from [172.20.97.52] ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad9430asm47416065e9.15.2026.11.17.07.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 07:53:36 -0800 (PST)
Message-ID: <079897df-fa2c-4ba0-bd45-7b357783b0a8@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 16:53:34 +0100
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
Subject: Re: [PATCH 1/3] drm/msm/a3xx: report CP protected mode faults
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261111-a3xx-fix-me-v1-0-d81f50f1ba1e@oss.qualcomm.com>
 <20261111-a3xx-fix-me-v1-1-d81f50f1ba1e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261111-a3xx-fix-me-v1-1-d81f50f1ba1e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2MyBTYWx0ZWRfX0lIY0C9PewF7
 e4h1XWvNL8AC+qugY8gAAnP6gg5WSgAgp95rGEzU+pLBMAKrZA6Pa+M+JAJ4hlLQBvYE8So0X+Q
 dggyPkKSBknQaCka8IUqLqegWZG5b7sBAMRHmEFJNmtsnY7kZ4RtqGdPWK/KKUReotT8wAuvfb2
 2GikI1aeKP3k7vjxAORFALoz3Jj282apLyLO5GV4qXimFlkXJ+xPt5YhNBq5zu2w96UHJFJ34+b
 lvLFKxGES0y/AFF8AsX6cMRLRb9YcWaKy7ll6sOpckyFYRrnz9bA8g2KBn57Z3Vop2VwM4IZwKu
 xon2Q0pVPKlK1KKW0Lv5vvRWX3c65BWoCWCW9uwjQ7uxKq9S26kc5dbbYeUUp9qoHTBmi31P5AO
 GkP8OM43ttaGyV0cGxONRA6a7/09ZJzZe2aZLnvFp7gDl447G4wSWwszlYfemC6jJRnQqHDTy18
 04yh/Tz7btCqORKhDwg==
X-Authority-Analysis: v=2.4 cv=JfIpPkKV c=1 sm=1 tr=0 ts=6afc7882 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Pyg9J2lIzH036oXokOIA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: 1HK0UHnS3SO5pSRZtd4Wt8vLovUfW_jn
X-Proofpoint-GUID: 1HK0UHnS3SO5pSRZtd4Wt8vLovUfW_jn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2MyBTYWx0ZWRfX5ujSPXq6Svdn
 9eB1Q5dADO9FCe6V6oJw2y+tkfNz1LKX3n25V6o01+Op2IAgp3Kj7CiO2e/rbaRdP+SOlKktMUT
 I6pOY0BAhXfAkN+Edk1L1JFWMIE/Ebk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170063



On 11-Nov-26 14:05, Dmitry Baryshkov wrote:
> a3xx_irq() acks every interrupt without looking at it, so a write to a
> protected register shows up only as a hangcheck timeout with no hint of
> which register was hit. Print the faulting address the way a4xx and a5xx
> already do.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> index 160d302e16a3..7e03b7305493 100644
> --- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> @@ -419,7 +419,14 @@ static irqreturn_t a3xx_irq(struct msm_gpu *gpu)
>  	status = gpu_read(gpu, REG_A3XX_RBBM_INT_0_STATUS);
>  	DBG("%s: %08x", gpu->name, status);
>  
> -	// TODO
> +	if (status & A3XX_INT0_CP_REG_PROTECT_FAULT) {
> +		u32 val = gpu_read(gpu, REG_A3XX_CP_PROTECT_STATUS);
> +
> +		dev_err_ratelimited(gpu->dev->dev,
> +			"CP | protected mode error | %s | addr=0x%8.8X | status=0x%8.8X\n",
> +			val & (1 << 24) ? "WRITE" : "READ",
> +			(val & 0xFFFFF) >> 2, val);

I would really like BIT/GENMASK here..

Konrad
