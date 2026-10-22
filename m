Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792656815;
	b=qEEB0KHVDUFG1IF6UuikQTJo0cO4PI2/xicqftV4U68QFK41zTYm5+pIJIR7wTdUFhaa
	 XNDjtK/D14ZZsHltzKy4Cvm6Pvrsf1jcQ9+CI3TWMrHmASbvGEzdK0zHIF0je3PiVrKWX
	 n+CL5x/0eG7r32iX//jqklk2c+OqPJ2mzQ5CDW1N1w1qrIjE2GNQzYgSIzIx15R+8981w
	 Uk9lvRDgczD0fyOZjAZ89XPB+ZOeUT8vZIy1RywKH3gsgjESsMmQSPQDrUeqdCMkNDkmF
	 Vg+HMFruVjbpkQkQW8GX/JTbvHHBkGyzO2IdpqEPcKcE+CwV1lgQym5b2ROhjadM0Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656815;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iNkHRZ5hfFDedWFqZKCKcGvHGWw/t1OJip/gAUhQAUM=;
	b=yy3K/GmbYbVgBRpSkinHSH02QnW6ALI62FOs/i31FRy81YOclmhjn2pgnSIqDFl2+055
	 WxaXWxnGjbTtpN/1XvKJa5tjws5mX359Khkp+xz2fSgU8zNKS0lgGGEsc0UV8MdMLI6vT
	 S6dqA4W7pp3R0mKNSKJdj5Jt2tP/7QyOKGyJP9WlpltU848ipJ1lQVOa4ajYMO+Ft9Bpr
	 Co9ZFHI1TbDL6YGsJ/ZSC64FoQKqmINMyt4bFAU1JX2wUYo/zOWGiYlHFKxvM/pQI2l/5
	 2Qyo5YF+BsMmELthuDQYbUjhwM3evULJ9nPs7pBEPNuT980m8YYrib7f30EdzAbt/7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Os5qUXmI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EE+TvT8Z;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2ABE606A31A
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2ABE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Os5qUXmI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EE+TvT8Z
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M708KV3517483
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:13:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iNkHRZ5hfFDedWFqZKCKcGvHGWw/t1OJip/gAUhQAUM=; b=Os5qUXmIQbX3CzGJ
	FX1mxLp/kv1/u7jRnXp0HWIH6Ut24Traikrrr1Wvf5N/dydrT9MBF05BxfA6eQ0h
	fXRC6bC1bLHwGkT/z0Q6D/zCarbOttK/qmEEMmwz86q3YFE08QMvFQwbFCRrux5j
	izmxjzZntCi/J02ZPgKucRJ8mXPLESo+3gFuuHc85zZe6GhWxvxjJEZsjr34tXId
	/x6HpxgfaVbP7sEjE8Iswl42t7LEs1GLlD9CDrJQH1C827cvEZL5ce1vQ4fU5HEt
	+XSIf9q+uD4OhoTjnFMLzsiZuud2xEoZWBALdZFl24JCsgWzPBWgr/IlNzcQvYhb
	JImm3Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bhc9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:13:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-536540909e5so4470721cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 01:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792656813; x=1793261613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iNkHRZ5hfFDedWFqZKCKcGvHGWw/t1OJip/gAUhQAUM=;
        b=EE+TvT8ZP6EKprN1mWdt0LJpE1dYUwjTDnVfLveq3pDGrKEDyC0XxmF2d7csWEtPxr
         XgPSKlYrnvFqzODXJsh4JhwMFjkjf2bskamh6hTPfo21eU0pU2lNGJ0hvm9BAFxoyIHV
         srOv7ACxwrvac69E2//+1yBLU+WyNDHo4MQUDEzgQayJVui0p3M/Uu5CBpsjHiDM3i0k
         lpIY/WAlhuFcSVx0APmr1tG6oKr54tyVZsuIApbvXrekv1DGZWho7vGKIU4DLyaUG/Jq
         Wh7kp4UhhqpRXO66luDx3WVKF+qI80CE/YiBFv2qd8cQY4H+tlL9octQyOpR8Txvcw1B
         RRGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656813; x=1793261613;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNkHRZ5hfFDedWFqZKCKcGvHGWw/t1OJip/gAUhQAUM=;
        b=Y9Al4lZFh2pMiaZbft4dZGP6xCa7EarrWvvhIyOZrJRRteF4GZhdKvwGK1xQ7uYuEk
         rYy03OFdA1Drq/FfWXO7diAQTJ3/r+ia7B6myiMCbp2IKlqSxSsjWCILD8kRFx637yYa
         HsApUjijn/lAYFcvAVFk9CE4j4aGZYsTz+kQwxu29nGVJB8iFEr8vPvwn0Dxk6h0/0ng
         CwtXLodXq4zQAbC1gooukk7Y0kyqgrEIvV/g+38fr8eARGjVXHuPONJYyCqzaGtEa4jh
         1/RYr/RNFoKvccPkHr0+w4gZhYswpP7c995XrRtvcSc3N/l5jGwnq8z9JTobfVPxgmQK
         i3Nw==
X-Gm-Message-State: AFq9FYICmgTMH0Me8reHfIjlcbvteZIezB4isAUBnDsUXxvp9s8GP02k
	Dde4KrfRrV32+IhzOlh8NZ+eR5zxcfiggNUgOkhmEPlbs6ojvSyDI97E1r7V+/mm7wccqgCBWCK
	Jnu/UKdDaWr8kWH+4M6OSS1hQMC/mC0/x+k9ueveckhhqee11Nlh3/2+D8Bgi7Wf0PWel
X-Gm-Gg: AYBFou3Q6Wqv2+4TmK+YSsvPYYgfanfTAn4ehonbKuhxZB+nJU4qDGDwFphkY0GGXwK
	oEF2hbPZ/1XFFgTfTqX7IOvKy9gj1o3j1dnwm8yoqN9aGeM1D1caSGf9dlrw+4cvrFA7XfYXNee
	ex2Oj9km9i4gPbMh0FU6V9j9u1sCLXG6w9bwFm4ftkrh920tfPRr7xa2vLzT9UHZa1ti+0TRd8J
	CI5C83VixMZ0pXSmoz+7gLIlSy1KlYtYUBTzO8khKkypzmbsVVgW2dOyrGM+lD+fOOYbKjbOgBt
	f8Th1Xh3E0ykCUMSwkfJMQa5mDqsBstD+cseyS2s1sTbVWyYVaiB04YhscIOQBrinkmbVK6Kmmm
	S6vYJfhZuMIRg7zrUP+qEcw==
X-Received: by 2002:ac8:59cc:0:b0:535:1a83:1251 with SMTP id d75a77b69052e-5369b7bec04mr85255621cf.4.1792656813213;
        Thu, 22 Oct 2026 01:13:33 -0700 (PDT)
X-Received: by 2002:ac8:59cc:0:b0:535:1a83:1251 with SMTP id d75a77b69052e-5369b7bec04mr85255271cf.4.1792656812768;
        Thu, 22 Oct 2026 01:13:32 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a5e6e33sm77669266b.75.2026.10.22.01.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:13:31 -0700 (PDT)
Message-ID: <f74579a1-11ca-4201-9bc2-369d5c2dc58b@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:13:29 +0200
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
Subject: Re: [PATCH 1/7] arm64: dts: qcom: shikra-cqm-evk, shikra-cqs-evk: Add
 HDMI overlay
To: vishnu.saini@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
 <20261021-shikra_display_overlays-v1-1-adaea735999f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-shikra_display_overlays-v1-1-adaea735999f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX92E4PJ6/ik6l
 PvNQcL/JLl6XSzNxpXLt/37J8lhUzimU2cAh047+09AqTjhotava/wtsuJhIbXPdTGItk3qn1Zb
 LpC57LvSLdWKTRR8av/1cvTCRZPLv2t2r3JgjgS/dP+EkfUVxahO3rXHyl9feXIEMLzTusRxD19
 gcgmd5vJ2oRqjWcYBE4U+jGhU1VbAE50l+MTnY9heC1E5wAa5wTmq0wJMtq4ojP6rtt4kecomW7
 eFiEPWnEbdNmufRcj6gZHhy3jOf2BwgKFHiZI2C2U6ICBd82fPz5jh44WxrNBbhUV8wPngDJ9GE
 I5biLeLq1IwBLoz89q+8EPvXs15rtAb817LYfgVTT0KvPWMXdNveeaRHs4Ox903i4+NzICDI9Qs
 x5Q5jac/s/xsXiUSfm37Dr9PJLdET7cbfGhEOQeGgttUbqmUzLs5PMYqwdMOg1JoLQa1lyTtM3K
 BxycW+8F40l/rIltAsA==
X-Proofpoint-GUID: IxDupYE-5Dg1XTLTZxEW-KwqZpDB_d1Z
X-Proofpoint-ORIG-GUID: IxDupYE-5Dg1XTLTZxEW-KwqZpDB_d1Z
X-Authority-Analysis: v=2.4 cv=CMy/zhrD c=1 sm=1 tr=0 ts=6ad9c5ad cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=SyOgNX5fRjsOj9ann1gA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX4aM2Z0eTFuU2
 v3N8xY+f4zBystrF2WDYX3f66oGgOg6ZxhDUDnzRgDaMexnOuouKed6/KHHRZEjnW+Ol8VBDGNj
 Y1rbqexzAezRwtcn2beVq/iOg3eaj6g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220032

On 10/21/26 4:21 PM, vishnu.saini@oss.qualcomm.com wrote:
> From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> 
> Add a DT overlay for CQM and CQS, to enable HDMI output when LT9611UXD
> DSI-to-HDMI daughter card connected to PDISP1 DSI0 on carrier card.
> LT9611UXD is connected through I2C4, with reset and interrupt connected
> to tlmm GPIO76 and GPIO85.

[...]


> +&mdss_dsi0 {
> +	panel@0 {
> +		status = "disabled";
> +	};
> +};

Please refer to the panel by its label directly

Konrad
