Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793192016;
	b=HVhkCWh+iVKOOrOYua1k/NQ5/5WmWOj6rhWHF3RLGTB99R5xYqvsvUpefB8VrHh1BNIU
	 yElmZzrg4baUqCzH+I5BxuGT87FTbD25o0agYpPFWcKoM0V4WMmvfeVF1mRt8iDdNa43A
	 vmm9ijaZ+SXkpE2l8Uvo4Q4yNMrsx1DThg10nI714h6JF4ziqcXaqssLRRV9j4zuI3tqL
	 vqW9PvoEN2KYTebZfZH4oynpXZJEbgcWxQpvRs9pwp2yC7JfAfTWd+wrklIL1CPRQg83t
	 CjmLn3mNjU4bDAudR99XAYqIjiTYXCTsz1hRJv2hcR3+j6bgeVwP0dM/FUUNOPcb2mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793192016;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zudB8ehQX5u98J8w7GI+7Vh+q5LvUPBV10Tq4giORk8=;
	b=VE7N6qrrbjq2N/TPF2A1rEDdyOFMqF2iiwmd9qYSR3OsVw2xD0Kk4MpVYH/Jm8iPT2Ij
	 JsFv0wnfYTdz62ZW41nVHwFW4bI9TLAnTJ3tQ3haqhuW3u5q+VpFELjRMdN8itHzlvfMk
	 Hb6rxP6C4qV2/wHh1gZ9D4b3xP511T/SgvopEXUtQARZ08NYjgIie/s83Clu6kl5ljqe8
	 iQOQjVHHx75HPEkvNkiShCd2gBoNJYJ24tnV5jdLBKDsGxdVxEp0Z5jJ3aIiaDkG3LJ9d
	 DTGO8FfCi9McIhqSJ3o7PUDJd6l89qkk6VDcO/UJYt0PuOilu7+pMI6l70Vhq7Gg2Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="L/rLsbvg";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=azr5quid;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE5D606A31F
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BE5D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L/rLsbvg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=azr5quid
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe2pF994555
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:53:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zudB8ehQX5u98J8w7GI+7Vh+q5LvUPBV10Tq4giORk8=; b=L/rLsbvghXlEQj4y
	Ed1psalBUQZlIh7vhy6hXbY2UnJqeW26F8Ly3gvPuIqYn0ZHnPa1f0cSDPTCH5Y5
	UEvMgWP8aZY6aIr8OWKCHgS3uhsubW8Yk7ynCKkSFfmxYJEpIS3HW7Tf2jcjEdtm
	fm4cZClVjB3yomg6zgwLpOmh6IFWWh4l3Zaip3xL1+U0TKVMJUgfRvurzUsuex7/
	Rb9DKRNr/TCfiMwUDH9KLJV6zHMImkg/gZu7Kjv1iWrsXASllN4ZXzXUk2/csR/h
	+EXLZaj6IKJ4/3p5l6/+kLnC849CwcmPWkKmMdpeu44ruF7jd4keBsP7+cfE1Sbz
	M6HNEg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk82tt46e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:53:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1440e081so20791885a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 05:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793192014; x=1793796814; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zudB8ehQX5u98J8w7GI+7Vh+q5LvUPBV10Tq4giORk8=;
        b=azr5quid1gFlhY1jw5o5dvFD4jad4PnUueRojqN1GdazpeZcf9uXoQYGsCZzYcBlb7
         KqtD8zz/WcdbUdixsaDzuk/vR7EA1kJuws14CjpaduhuvlBTidBjoYlj47WfRHuTV0Jh
         Wrooi/S5DFAQFaBNlxmm4mTPbHDbVA35NPjVptynnx6txo7k+INBGy1StlhNuq5fdvuk
         ak4xkZcmcfrJOScyiFGpbsme58ZuEr/O2w4cb3+bDzohgHkGq0UVX9wtByWpf6CWBLir
         V2veGB0nOoGTLzWRxyh4c6VwsOcXIRJ8l5fHs36zqLWhCTIdBY9NB9SsBKUuv3uE15eW
         FZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793192014; x=1793796814;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zudB8ehQX5u98J8w7GI+7Vh+q5LvUPBV10Tq4giORk8=;
        b=iE7jyO1sYVqs0Vx0aMQduv4BUtTYWiAgcXY+UHKabHIp6kHHFiY8wsxWrwaUgD2ZLj
         b9WT8M0MBIz6V1yi5cPdFEV0l+33cirrdpwB2P/+Zv6eO9ySGcXtdFtfyjLn+8SnlnO9
         kNbXQvL8dMaAiJ0ISzR0roSrhyK2tk93/TXsZ6Z0LUWWo7vuRKaVnuEyDm5VYylX8eCA
         NSlpIkSZ/lWca0TL6EwiHbFuXh1Q0Fi95+/CygY7DVJFfcvi9l0z4KRQ5vXS9RPFYW6m
         Bt4ZnnuB7CrBKncXBDQgRw76RMyPKxCytHFr6xczt6GSorM8LpuSiBz87Y0N52by5Pxz
         ExIg==
X-Forwarded-Encrypted: i=1; AKwUvBw28KZs28NaXQqbQIiNoAih80fT8lfNt7GFstfABbYQN5jhG1CYX0Xyas9a4pSYu83i23f0oJMxtPsOwdpi@vger.kernel.org
X-Gm-Message-State: AFq9FYLPZ8RKlfY0c5i7XIwTnCfxnh6Q9g9ueASV/rJpgtT1vSlRF1KL
	VBX/vuNmB55dEVIxGM3yhhYwjwn+kOiE9djT5LDgF8YMc8JbFnqQruqn/WkBcdoXNjv4+Jv7X2a
	wYjwtckD5W4JqtnB/MDqgXKy55QcadAL6Ytjo4un17j+jqr8LaPHO1ofLlwcFls0yaIFrEU9Ia8
	vz
X-Gm-Gg: AYBFou0fyO+1SHOP3hFa69L1b8Pm6U+E0p6UloEp+CWzsaE330cjJXK3ZOUxU9k2tAz
	xkFA/fzc3ErKm/1k7KPZhIYH8B/KMrKmvCcE8XIorfMx4fwI34AXmqvK1CwcXsSRq91YYfsA9I8
	jjPokLK+9b8YT3Sd59QHX85WtIV/QPm/dquK105S5xmY6/JWEnLc748/BX2HpD8q08InwzYrxZb
	KZVdSTtzbpL1ZWOEgzCtQjzTiJkOgcC18oac5w9ciqMJFbPekXQsZziGX/E1Y1pGTYUCm6WlEAK
	pgSkO/EvbwylpXkDuAsU/fZStdtIxDpaMdwZw60gf15kuW09ZBKNj+Si0WeLQYagxZ5x/dq32Uy
	VXzyqhFLIfTCtmvrO07E/Gb/yaydQXG/+GOHfK3mAKB531iaywTMWPCxTt6z2qpXmeR5A/Iw=
X-Received: by 2002:a05:620a:a8cc:10b0:93c:61e0:81ff with SMTP id af79cd13be357-944089b232dmr292259985a.1.1793192013960;
        Wed, 28 Oct 2026 05:53:33 -0700 (PDT)
X-Received: by 2002:a05:620a:a8cc:10b0:93c:61e0:81ff with SMTP id af79cd13be357-944089b232dmr292255485a.1.1793192013511;
        Wed, 28 Oct 2026 05:53:33 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd790afasm593191366b.68.2026.10.28.05.53.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:53:32 -0700 (PDT)
Message-ID: <e45d9d36-131e-4adf-ae70-321191964d4e@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 13:53:29 +0100
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
Subject: Re: [PATCH 7/8] arm64: dts: qcom: sm8450-hdk: Add display card
 overlay
To: Vladimir Zapolskiy <vz@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Ritesh Kumar <quic_riteshk@quicinc.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
        devicetree@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org
References: <20261028095151.1682096-1-vz@kernel.org>
 <20261028095151.1682096-8-vz@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261028095151.1682096-8-vz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: y1jTMM_ehQspW39NfbuL2Ji5xKBqmVM9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MSBTYWx0ZWRfX2lCLWkIJnffU
 G8FMgigKyVW2io+PvvKVUDlHUKhkaJ0qyRIAgZSGHSV4xntDb6D8b0+zdJ4Q0cms0/Gr8zWMh1W
 P00ZSDkz2j0WaPN7fIaaaNu1pNMcT10=
X-Authority-Analysis: v=2.4 cv=Tr1zFzXh c=1 sm=1 tr=0 ts=6ae1f04e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Mi3LwBMVhOuzPUwrl_IA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: y1jTMM_ehQspW39NfbuL2Ji5xKBqmVM9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MSBTYWx0ZWRfX5Tu65wbrKWEI
 BpACV7qJ3DkqCdMCrTRtLg6s0+h6Gi9iMYvEsM7zXn4HCUbn4B4BQqqT8W3dSlW2xdXoREdbbNI
 jUDWPUa2TKbziv8A15OhO3p0Z6tayoE1rtYKtfVnCONopwcPN0LOj8eaeL6mw07uMaA7Fk+4Yhi
 kIfW7vc942zGFzngNllRTfPkL3mZLWLv5LCwtS904pcfNNZC3WLjBLMIjvK6ot9n9/Ua2O3BhRb
 TGdcMfqk6fOyFfex14W1LMdLwDmjtXE8pysJZEUzvRiGzJBEtoWrYOe4wZ8vZ1E+aCPGs8bQfWy
 uSqPRdiECb+nZoQ3GekxqDTZY4E3oU/P5mh+8TtMWcuCYZDqdzwe3ZxWi8ARjHvX4iPXQKSHPMv
 W/UCHORQBG7yIOeZZdEDGGucIdsjn8vQ0z50zzq+wjCuWe5yd7EO4qpLGVF1YI8Dju9oOsm4Hd9
 ru9wAvO6Z3RHGX9G7kw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280051

On 10/28/26 10:51 AM, Vladimir Zapolskiy wrote:
> The SM8450 HDK board can be connected to an external display card, which
> carries a 1080x2400 LCD panel module powered by the Novatek NT36672E
> display driver IC with an integrated touchscreen controller.
> 
> The panel is connected to DSI0 over a 3-trio MIPI C-PHY link, power is

Either "a trio" or "3 lanes", 3 trios would be *a lot* of bandwidth

Otherwise I think this looks good

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
