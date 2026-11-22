Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795374197;
	b=KzOI/VoM7raYN/ZWf3E/HzFXVw7GybCp+ivWO6T3vOnbNpICtvyb40TcQBrXrwZBTeON
	 8vHXvbcqeKdOtz4vJYs4kcdf3Hi+5+b+nWzwiggQAzuA/m+Dw6q5jFJj275vllFlqWVcj
	 D82ldvxARnWGUoZ2Hokg2wHQevsivkci63t8qRUccNUw1iPiAlGJiivQUo+3dsWgRb120
	 piclTZnF9Pfr6z3G1j8Nxs7YzZfdLTEWZx4VlL4+XkO5TE7af6doYvQivU1vpAvqhlFOW
	 T3QlGNRbnDRO67cVCwbJw/00MPXke4tHEHcGSU6evQ5YDwwKos9HuTyFSkF+OPFhLDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795374197;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kmoFusvyzW8rHvZc8KpW7XguvidS7PpWapoBiQhCE/E=;
	b=mqCXW2U84GbnXbtIj9vAYA2cnZfxG+G1yOV6twsdNY2ZM9YxAUzF8ej5JEWYDFX6yod1
	 /xQQW4OUvXUO0ZnAxcyKmsUSpn6FC9U83PmZUnDKE2XRVUmJVu+N4z1Nkb0Wvp5AxSTOk
	 tGNj9inlynTSDf8j6mbBZbfKeoiDCExjONwu+ys7DSPyWAONDqOnuz74i4Ns+j4qX/448
	 +/rCMg4Wy9/oRnq96UnQVwuKL20C+WLPQY6UcOUS3sdJwU/1wfET0xTJqVMcccbofICMd
	 JSox+7h5jyBkbGIg9STXv5jZRD294u7+DMsknfJ/tCkGcdROz8fD0wO7F3oKPpaZocA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="kflYew/k";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="F/+Shcur";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FB4606A332
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 19:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76FB4606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kflYew/k;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F/+Shcur
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGUuu93919079
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 19:03:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kmoFusvyzW8rHvZc8KpW7XguvidS7PpWapoBiQhCE/E=; b=kflYew/kyJZDMFSX
	DhVKouEskDccLqfoHH6ubTw5C7r/atRkc4tkcTKsAqr8NwvkRh0TKmro0ihGil+f
	0uTqdZoL+6hXYCaJF/mQEJjc+6wOwSX5jxyn4tyLT2TXBPm6CVqqxSLUEGBIqFy4
	zYufGWBmykxmV9NM6z211c4mCBjFbE4/zZ52SytxnPqGSfM2hEb8MpWbdzJW+Va9
	ujwTKtD4GXKSgeVpQ0SRtSncw96/Lrrpf5b5fWVtZPsiKxaWZp/C8Lu+kpvX98iT
	ymp4AzDEjkUQW62bkZ4+o1JNKjRxWX0XR4XMPK6HiFS9s3mUlSImKiDPMicj1Fag
	2o6C/Q==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33h3422j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 19:03:16 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ece7f075c4so706864e0c.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 11:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795374194; x=1795978994; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kmoFusvyzW8rHvZc8KpW7XguvidS7PpWapoBiQhCE/E=;
        b=F/+Shcuryd5jo3Ivlj6KA+o5Fzm8NgM2FBQdjegxKczN8YWEjnbdjMHA1fDhRUkveh
         MGUzXKbLiXml/UmUlZg7M8rca0POeOY2gPVT8IrKN1JZlBVPBofDD5eRxJr38YLEPYQg
         4lbZ5rQtsDhT2Z4Op65qDqueupXTtzocZ6SQZ8FFy06bh9TS1lofcDkZjU52z9JiPbWS
         ResEgGztyqeuv+gehvebJWcHxiyr8pQpVdoDg6nvwUKCVz7niEEUfbEckPffoGJn+URl
         REd1omQNOTUS4IvM42EVnweK1wDaebhoiHVFaqf4VASsrXpJiMJYiARUDmPAU7z4iqmB
         Gz0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795374194; x=1795978994;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kmoFusvyzW8rHvZc8KpW7XguvidS7PpWapoBiQhCE/E=;
        b=YeSOe4R9kpRYye5W54K64nLFEEd8v7beTf8XSY+5aAdZO63jWfmKwFCV/qUVhXhcqU
         16ZvZ50vOpZh5Rk6DCr6kCG5Tz5TRJnxBRD1HfFlo0Ih9QkslFldrsN+uPg1kiT9NMqn
         Tv9QtO608ODKasC/3y2ax84uhvHiew/zSaAWOMZsL6WikKtxEXI8oudaU0i2XAu/cqtm
         HvuMvMlrXmO1REU2TQmE1+W5C3tB2sE4y+JqQOLocox+c5lAM6TIJ0zBEFf2se8IC90D
         p2htiBDM6WPbiqzkIcPm2n4nNq/ASQUIwLPo9notRZI3fLolBLJKAnKIqEFdqbBjsAm7
         TWWQ==
X-Forwarded-Encrypted: i=1; AL+hErF2O225gfagL2OsFDKNS8FyFmK0Jvp/sYzl4bf0kNedAX6vuKlh5TyUrvM3K42BknNxeS6i7Gdmm/7wNMcc@vger.kernel.org
X-Gm-Message-State: APuU4Z/OYUJJ4tPOCLUHDYvjvp68PvT3+H/fgnqfqd0OphLe6HWLxDzk
	Rj1wscCbpBYiAKQWd2HXde/TsNqjWm6UQxbpxgoQ6VUhwhL0fV6dMgk6Wi1XSLY1CrHxqILJI/a
	xpAfls59ux6yKRQtQ2OtHeTWiD2TxbCwmy+hq8r3+8zSaqmVk3nrVXfb+Bk+Lmvr/bW3H
X-Gm-Gg: AZFdTZcFVQf9WtgdH7Dr/njbV2RkMWVoAD1IpyVthcHx/USL2EuEPPYDmAY6/X6BliJ
	IiBUYK8o6+FUE38at6OTclRprUxNozdQRLHMJ4T3ckol046t+oe9NV2hZcCYt9VqM7ZC70nmyyx
	iIDlhDGEnGovEJx8Jy/q1OTPSzMXje/JZphEfUKqOWvjPXyUTtbibYeEbm7FRhKjljda2peTkdq
	Kou8PZXqCjA8FiES87q9b4oZL1B/RSqMt5/iNP7s80gAjGgQ0W9pTyhjo6iYbdhjU8xylwiUaO1
	gVCJ0rpffRfncr3Qg7ENEKzu51Fgqc6hTYMOCR+g/ZmPnxlS8JHgyu9INtLijB2Quja6wm58qfa
	ZQr/iKRsXQ5aA8oh1CRhLaPd54xO4yccdEUjv5AXUctqoeutsasFfLXevQ0EdxWta0xZ9Ov4O9E
	HgA8jr9CBIrbXj
X-Received: by 2002:a05:6122:46a7:b0:5ec:e522:70d9 with SMTP id 71dfb90a1353d-5ee8af2f1camr4520934e0c.16.1795374194599;
        Sun, 22 Nov 2026 11:03:14 -0800 (PST)
X-Received: by 2002:a05:6122:46a7:b0:5ec:e522:70d9 with SMTP id 71dfb90a1353d-5ee8af2f1camr4520912e0c.16.1795374194058;
        Sun, 22 Nov 2026 11:03:14 -0800 (PST)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm530661575e9.4.2026.11.22.11.03.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 11:03:13 -0800 (PST)
Message-ID: <c2c2ca30-a1a1-4ac1-af52-0999e7fa8122@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 21:03:12 +0200
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
Subject: Re: [PATCH 0/3] media: qcom: camss: Two routing fixes and one tidy-up
To: bryan.odonoghue@linaro.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EsxHPicA c=1 sm=1 tr=0 ts=6b033c74 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=1TreyUIoxbpaR6lyi_gA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Myeprntr6by0HdlNyfXxSGOfft_CYwpu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3NSBTYWx0ZWRfX0lM24OGloCNV
 5BVF7HX2fxMEtjsdncKg2REem6YKeMLYKHr4SZ+fkQSLoLyDEs7qRm+5iyuIAn0evRNURIyy0jm
 tm0OlAdAgavXMpoaX2ZKxgKGpUy9Ax9N7YdRCkgQLjxO6XS2xCAr2KLBK2+i6KgeaXz9I38MHOH
 /zSfRpqJk2quC4PxGfgsRu7v1pHUAik5PTaYsq17cjVGura/OJfvTZ8TGnlowZi91myN89Tm/SS
 0gQTkNixh7zvZIAmDFGRAtXi5d17btd9fwi4kAFKGLULl4wRIne8FlUow9/n5pMp1jvL8SnDsuB
 Z38NdZTtKOH2J9Ta5XoFYzxzIK+Ba+0SzQtPUZJ7BJVf3DH9mxZZVQV98cNHW0jjhqh2qEVMDg5
 GPnEvMghBPbFdNPRFAn8d5evsX2P/tOF2WnAAfwalzEmQea8oe3YssO67Nn5/Z+/8UTIs/qlcVl
 M7ihbrZ+3uo4nsKATJQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3NSBTYWx0ZWRfX3EGNvSpbMnWI
 Fok6mZdnG6e8yGDz56XmwTCxg3irwXKPXGGTUhA24cB00I/GkKkb/s/l/0mxlJS2VeFvDEcKDD/
 MYITbiZZIeeBPl0ubOfqr+XM3xC/VLw=
X-Proofpoint-GUID: Myeprntr6by0HdlNyfXxSGOfft_CYwpu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611220075

Hi Bryan,

Thanks for the fixes.

For the whole series:

Reviewed-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

On 11/22/2026 4:10 AM, bryan.odonoghue@linaro.org wrote:
> This series lands late-enough in the kernel cycle and applies against the
> camss-next branch staging to linux-media/next.
> 
> Link: https://gitlab.freedesktop.org/linux-media/users/bodonoghue/-/tree/camss-next
> 
> First up a patch drops the declaration of CSID2 from x1e/Hamoa since this
> CSID doesn't have a corresponding VFE it is entirely useless and violates
> our 1:1 mapping between VFE and CSID. Since CSID2 routes nowhere there's no
> reason to keep it around.
> 
> Second is a fix for a longstanding error in CAMSS which as stemmed from
> the original development of post ISPIF devices. These devices have a 1:1
> mapping between CSID and VFE so the mapping we have given to user-space
> which declares each CSID as connecting to each VFE is just plain wrong on
> these devices and has always been.
> 
> So the second patch addresses that longstanding issue but, I've been
> holding off on fixing this for a while since I believed it might require
> extensive surgery, but in the end its quite simple to do.
> 
> Finally the third patch is a tidy-up patch which inverts our current logic
> of continuously adding new elements to the src_pad_code switch for new SoCs
> filtering those SoCs down to a default: statement. In fact is is the old
> SoCs which are the exceptional case so, just do the switch for the old and
> the default for the new.
> 
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> ---
> Bryan O'Donoghue (3):
>       media: qcom: camss: x1e80100: Fix CSID2 routing to nowhere
>       media: qcom: camss: Fix CSID to VFE routing for non ISPIF platforms
>       media: qcom: camss: vfe: Eliminate ever expanding src_pad_code switch logic
> 
>  drivers/media/platform/qcom/camss/camss-vfe.c | 20 +--------
>  drivers/media/platform/qcom/camss/camss.c     | 59 ++++++++++-----------------
>  2 files changed, 23 insertions(+), 56 deletions(-)
> ---
> base-commit: 2ad58ca589da80990b7afbcff018777851577f89
> change-id: 20261122-camss-routing-fixes-b178bdb84f20
> 
> Best regards,
> --  
> ---
> bod

