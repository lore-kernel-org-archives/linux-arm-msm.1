Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406716;
	b=hxKATQDfMQmGQTVTU+T43cwotI5IFuV8A9I3tytg7S14l1HfFlWRNgy3doXwoLdne8qT
	 riEY076NnJx57DbDXhtYHozP1koWpIjgP/cTL0e/+rUUUB6qH2qH2lUCgjy7TewQpuxiJ
	 LUYsAFhcpdAnjuIrHq+F+x0dp5wPBZWNTViCqY49b5w69shedSQEWEK4pGkq0nTkqExE2
	 lgUPE3p2OW6L2d82i7MzJOtKso+yjlrnBdgUhgJEUm3cD/Jrlml8e0UAHrw1b9lao/+J1
	 bJc0Ufz7pRh8t0qe2KNr4u18ECZZuz85fdqrqzAYs4GIN9Ze1J8MgIH3ElihZlUEZ1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406716;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=K8i3rI9wo+/NtzfyXb9aiMzzmODydmkC1k9o/9EVJ44=;
	b=VKiigYbtthXMsOsnQon/aPx9EBHzcfeeRFSlY0ZFujrQNM5W4BhW2Y1X/WzZxc9JcZ7z
	 LNmCCrD5spKJIZX1hs/b3fPF4DpRandc4xP0hRjeSISkSBT4bTnFsSZzjKyXerXe2MOEx
	 y1godfzbgKBssq/4M3v8DxfJyujiKcSH43UP5wgRdIXA0pXNw4MOg6GsuYZaLzvmj4yab
	 6yiB57Z7I/l269oK7d4dEz2Dw/cR0EnQoM7L58URi5AM7f2apjfEoR7YBwIX45ADHGWtf
	 0rQkm38GSnZGYB+YcjbtyBR0HC0ijMaThYIkIQPgAnLcW7q7R93h6ztOc017RCmm7nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oAzXh4gm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SQ31fSFE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E134606A326
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:18:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E134606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oAzXh4gm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SQ31fSFE
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABEHQrG2556248
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:18:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K8i3rI9wo+/NtzfyXb9aiMzz
	mODydmkC1k9o/9EVJ44=; b=oAzXh4gmanBkJL+B/vYcRc7TFflYOnikuLodFMi8
	v0ERCy8aDsQ/7VcVFe6M3bj6Rltxwiyl1tsbjc15YtRQVag4k4zD4DvPQGu4hzAy
	rZHi9oUViLj3NKZ6OKI68d4IKIHs8PXfztLm7Xqxr1+lSzuvlhyJKuEvANKErEtU
	t3gKVLnjchmuVbM45yL3FvSa9ujDPu5RFLRb+tX/HpJFdbs+gl6qPz9DIV6u5DVn
	dlHbIwcvawDMXtSNIghZjf4GbZsfLFs8C3nE0KlBNSeqWhwiVy2ntc84DOdMH2Rc
	10ATGrDomBF11qFXVYJqbRxXga6hD4+wUNkUq+HDcNoSiQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnmb0me-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:18:35 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ee0977403bso2511717e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 06:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794406714; x=1795011514; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K8i3rI9wo+/NtzfyXb9aiMzzmODydmkC1k9o/9EVJ44=;
        b=SQ31fSFEujEMX3ihe4CyzT2MijIPmzQYmWITVun/DhkzJu+pO1wId05s2Fe/tKcurB
         mLs8+cjmGNRKUrCukuTnlRyfyJDo+4elcRHtSpJfmiowWiin68wVO5dyMP3BmbSzfifq
         OJ43pr9bq6ydS2huCEYwuslc1Kt/oYUc9GxuIxn45k4RPcpVU2UIwxAdgWvplURPHq/3
         vKVlwPQ67Z4wPcvE/5kDKO3l2XmwEA5pyv3kte6+nK04S5GDZbT4O5TbrhEmmhaligKs
         Dvn9cL5c9hAczHtq6VmjZI4uBkYYd2uje6EQ0SRfZ0NUUdifGjFcK2annRiCHi3dTzob
         UgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406714; x=1795011514;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K8i3rI9wo+/NtzfyXb9aiMzzmODydmkC1k9o/9EVJ44=;
        b=K5HF34dFf5Zvngt+jWfH5DFXK4ho4gMO3KnJhzBbGyyibs0K/s5MMQZHzOnvaHTiqL
         668XPbQz0PX+lGweU9xbyOw5/5lTQueEiuzx6OLmT/VkbESD7+0vqAtjaixi9z4CuFQ0
         l38JmMr0zH+R65j8FV8CIewq4BXrE+vEL4NpJkmALGxFvdfvTCF2CwJSqbRjCEZKt/9b
         QT4dEWUx1ZcbJux4GP1zJuyLh/l5UK7DWKNwtXuOyo1OTfRvjkuXaqSKkmPpJBE1as0h
         fFXHT2JDBdQGjgZnrXH+L9qpyayhPvjr25te5GyafhixkdGtFxEgAXFeEkGN7kNOo65Y
         2Snw==
X-Gm-Message-State: APuU4Z+alpMHayCzFHdCpIJkpAe9Q30ExnjIyrfjfu2eo4yLpKck/NVm
	tbpZLGNZwPVk9jCVThgVIwrvybTb+GN9VH+hrIRU2a9/kj94+XNwTRbsc8bCYWp7AEt/B+ktPvD
	3W7fxbKcoQnjKbYW0A4td0fXTy5H69x039PTUn2k//7W4a8DiUj067dqLDP/AfmHNq1Mh
X-Gm-Gg: AYBFou1wESoWaF8hHQTVw428XA3Nx1jTI42KwLdO445YGpU91BpzN5ZpcIXqphbpEfK
	M6hdlqqlozNv3dxT5c6yHt7b/TCJhAbvFXAiE221seGz0X5Fp5me7Migfb8tdnglTIslftj73iW
	YGE8SJe+r/jKsOWRFRT8lqpL9RF13qLr4XVBhLJlF9mETfS538dIxmbI+Imy9BkzGGCWQovC38x
	iu1YtdzntAsXc4NeegK6pO8ESMZnzHghpqq7H7SqYZJIAg7p9xJyq+fW0u4vnSeL+Fqit8x2XY3
	r+bCPIeauRhjqAXRwuwELNIaDyKbWvXw15WhEloaB4MZbtLAJ9jR1GPOAKezVGMFaUBkOd4bHaY
	oQWmSKeupOOpuG8/nhyj7Pqowrt3JA7KbkP+S9HYcMadxcHJG1OqNyL10jfAQX1GKif65ML8WUl
	6i6xRRIUdrks6HjzWSM5VRCFb2nl6UrxuJM3S2rFo1rsL6eN/N4hKdGczpuxd5SQ==
X-Received: by 2002:a05:6122:1825:b0:5d0:1207:b693 with SMTP id 71dfb90a1353d-5ee1c2c2c00mr973623e0c.1.1794406714507;
        Wed, 11 Nov 2026 06:18:34 -0800 (PST)
X-Received: by 2002:a05:6122:1825:b0:5d0:1207:b693 with SMTP id 71dfb90a1353d-5ee1c2c2c00mr973609e0c.1.1794406713974;
        Wed, 11 Nov 2026 06:18:33 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae09172986sm11882611fa.2.2026.11.11.06.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:18:32 -0800 (PST)
Date: Wed, 11 Nov 2026 16:18:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm8750: describe all MDSS block
 resets
Message-ID: <fglkl4ksxin2citf44fvrjrqupz2a7asbuwxmkja6dbgu5stcx@uyjfipsp2njl>
References: <20261102055026.438521-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261102055026.438521-4-xiaqinghuan@mail.ustc.edu.cn>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102055026.438521-4-xiaqinghuan@mail.ustc.edu.cn>
X-Proofpoint-ORIG-GUID: juxOYu7pSNgHFDBZYZKj4cv7sFyV3Sjs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfXwiq0hXdnUaqn
 gkUbjfOn45WmYoqqqwlWfWN9Bvd/zTUKDAZYgjUfNbAxYA0HEZQR3TV90DdabynQHiVzMUwRqYi
 fP+9bLjdh9vj5+MVil7LZ6SYTB3dbw8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX5zYD5h+eOzNW
 QpFIRva9S4UpH+FZrQ6yFgA2cHuNojhz4FzxWhWM8UlyWC0CmYLtYIbhYDCfotw9CHgleY+aqbL
 OP+ovoaxwD20syTsnUYYzNVxxtAoXT8EPM3/DqmNtTjwELbdVVUHne6mx56jHQUptfzYJGQxYl/
 WAcWaMb2txCXMxWchsY2C2n6jFwFEphz1DluDFrtcC6KHU1rtHFRKB0UvSmrxNb1ZQnT7N7DBeR
 0GmPAncLyXFwVQ0f588c9d7srfKvLJF3lWoKh1IyIqZ5iEoY76ehsPYldRy6yBTuUmohRQq9aAM
 /GOg1v123EBhRfvaCQ8TBw4WvOSbfkyrvhm4EQJsBv7clOkP4fwqVBJKl15ZTQlQFircaMDnfx+
 d5ZdrkAB8D3kM0j6P7tl9vTXITs1fhKWNlFTv/k81elyYqbefWViPTZtwxCS4C2zT7D/QnBZswh
 5tIiDo/Fj0pdqPnxBvw==
X-Proofpoint-GUID: juxOYu7pSNgHFDBZYZKj4cv7sFyV3Sjs
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af4793b cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=NzLwe9Gq4q7PvPqZN-MA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_03,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110056

On Mon, Nov 02, 2026 at 01:50:26PM +0800, Qianhui Xu wrote:
> The SM8750 display clock controller provides, beside the MDSS core
> reset, a block reset for the MDSS core INT2 interrupt controller.  On
> devices whose bootloader hands over with the display block still active,
> the kernel so far reset only the MDSS core and left the INT2 block in
> the state left behind by the bootloader; command-mode panel
> initialisation then fails with command DMA timeouts and the display
> comes up as backlight only, without a DRM device.
> 
> Describe both block resets so that the MDSS reset returns the MDSS
> blocks to a known state before any display hardware is programmed.
> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
