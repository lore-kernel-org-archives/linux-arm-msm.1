Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101969;
	b=W2L3eB8rezeVkr8OlhzEuma2TU8XkCJWtPE4gcz8q1kG8Xq9zVwkHCospZDl1PF3aXwi
	 e56gImYA8OIcXtp0dpPTMJHir4lnhDlm2wc4jY2r2S6TV/2nQVIrwxlJyyUDrZK818OpA
	 WyfsO5rSlAcflfhsWBr8qTgHnsgYfUMWxielDlAWm7elHg186hu4R1nNuDYRBCg7HGzXD
	 Y9Bu+chNTu/B6EXb7hYLj9XUZMAPTofhxkhWOMYv9+rGTPJ1jPpZdg5RW8Ax2TMpiF8x9
	 pK6HLVK1n5KtZaztuG1TwBkTnHZIuo3xWXxbsp6L/mcJsdJ2HFGNrvQNzvvcDJabhSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101969;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=evLAp26msHZa21KMXu+YtqFBUAj1Nw5xOqezOiL4fU0=;
	b=dKnzzo5iIPQPkC7C90Nao5T6P3Dlr73l09SYBNFM6JtIXD1OerCX4yH1u0s2Q/tKH0d3
	 iGb1iYgR1zVqcVpA1KXLfLz2fChp0K1pU+Jguj+HICnmDiNAJQDmES0lE0NRVcBmh/MI+
	 J25B7uWalkTZ4M8hIGwKqKf1RV8EHsZZcs1lErgVeigeYr8Eabv3Zq17z/LnwBoWZMdfa
	 pLyqdxMjYA/08lbzPtgxifYj5IodLWSIsZWSh3vpYLD6pojL4lSDLe/Ccb6Ihjr+qNH09
	 9lziV/D7JecIKD71Qyfo6nNMaNWB2/0myoG6Uzbh8PM5VeOuyse3qu2KLkBFKVAlR+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fasM1xdz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B8pKnWBS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D45B606A31B
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D45B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fasM1xdz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B8pKnWBS
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdx7l2458143
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	evLAp26msHZa21KMXu+YtqFBUAj1Nw5xOqezOiL4fU0=; b=fasM1xdz0MyUUFOZ
	xH6XddfJHYYVTiZEoEDgJWzfuI8aOY/Wk303Futj5BVx2N/rqRmSfsVHa/ugEirn
	4se8DNJTIK3GqrYnLNfCgUDcuZXTEN4SKSYyrNhv/LVQvrUg1+q5fdZagUmMutTC
	A7MyD8StpX4ZttfOL9IC+bXpzVqPZhPpPXxOzIyk7kX+CgyjhMILOxE9hNyc4NIq
	C+ccOi68UibZOU5Kb3bkdXkBwyu4UxuZ52DA5YEQNl2uJeuSocYIM/kzx1W3N+r1
	EVl1NcVLgk8Z/GkknyWSzZwCfrldQCXcIWwUIY7eoP7u0dLun8aqkyjbDrvoAjO+
	taksPg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbta3v3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:52:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93df7a9466bso46415385a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793101968; x=1793706768; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=evLAp26msHZa21KMXu+YtqFBUAj1Nw5xOqezOiL4fU0=;
        b=B8pKnWBS9b5Z91QC8E10urXyTHj0I3dCpVM8a0mhX+cHPF9cvrGYyBqJ2VCmGh5iZC
         TEvrnEZqhNVsEWJl2wPJYLYTgPt+Py9ZA06sETLF1G9tDyaQT27eOEHL7gVOJy2u1oPD
         8xgpGfMM+qISLIEw4wYXUHUL9jF5YMwkRNg+ZPyZBC7SiI7K+q/IjCnorwrc60UENthS
         9UpzfsuVW66BWmcrvAMWplqm8DS1A+vszMVxtIE2mS07oIKbxCLmbQa99R/Du0rVUHKI
         dLz1v5oJkW1CP7Xfpz6CaxdQNh1/0O/XvWMv9ne7zIOr3rOxXjom2Y5InkPHvp2uGPNa
         yjPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101968; x=1793706768;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=evLAp26msHZa21KMXu+YtqFBUAj1Nw5xOqezOiL4fU0=;
        b=uC03I9oyseKy4FL/3nAUdJr2+zDLjycx2Sp2YvT7LWVIK2LvRCCVFVURt5gK0zWY+f
         rQz28s+7g3XRdA6AM8OKQ2bT3xFulnUlqO1CPISvB2uU8EbV4si4yssfBbSfxlNEOpyl
         sFDuu1fZz6JoYBR+T608l+8VGqHGucUutQ6+HVktL1xdQtBHcAnwdGGJ6JIrW8HlZn6h
         mcPCz1voX8SrtkSy5Dvy68PMHujfNlX7hvyFKZP6FBiHCOPxhjHiw0Nt9tgdppIphg71
         N71Bj1vwxbbzgwv+rbo/THVo2RoVHfagZbeBTnWKhK3zYwfN7WFgTlzA9eqZRKCWByzO
         IVtw==
X-Forwarded-Encrypted: i=1; AKwUvBwMZlMpwwdQykbJNcZF2UoZ8E4geCalEjgLRj9qDjppPe/91YdQcBDBARCMOL+yS1vFGBpdlWvrrIoVOFIt@vger.kernel.org
X-Gm-Message-State: AFq9FYKEvnD+un3bnONHquWogaZykpjiesOZcHTe31D3MwvCvZeiEFN3
	9K19DD4u63VSVx77Y5RxHyXZqqczg0PhvMAcYr+YN/Hn2ePD3dQiEGxXBNeKg2noxc6lF54Cyvq
	fG9tPKe4UXHEid6O8fuDP5sUVoNLFPew3Sh06j8ks32rOPG26atbUqOXg2JypxYh1atip
X-Gm-Gg: AYBFou2hjYhEdORRW1lBroG4r/F2MRE+ZS4tR8+cDmKO4EMxwCuEPrNGMmQkpDvg6Nf
	6oGuZLm43PRuArlkmXJ20Rq+BL9pRVPj3MbTzQOEhzir+UhxHCDSu3uljuhcV3Ui6XpLiafqtun
	ae5X6urOIjzPTeHaqsbJZj9FLq9QnebgSEzIAoraJ1PWRM7HflfQmROebzmUisLKMaCGeY+k6Sk
	qB/8MSzGUDfxzC/c2SKEpTHRP4z5AzqL6hY9R0Fzw2BPciCVh6bbhLSFIi3MCf5beLOak6asmon
	LlvM3wFUtNS0owfW7w1RIGFbBgf9bMKALw/aoBwKGEV7QoD6BrxXZ49oZSIgnxgCHchqw03i9lO
	1Sajnrbe0BX2e9TshkXk16Q==
X-Received: by 2002:a05:620a:a181:20b0:936:2f59:dfe4 with SMTP id af79cd13be357-940ef67bc89mr1481929385a.0.1793101967567;
        Tue, 27 Oct 2026 04:52:47 -0700 (PDT)
X-Received: by 2002:a05:620a:a181:20b0:936:2f59:dfe4 with SMTP id af79cd13be357-940ef67bc89mr1481925985a.0.1793101966983;
        Tue, 27 Oct 2026 04:52:46 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445991af3sm5027246a12.33.2026.10.27.04.52.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 04:52:45 -0700 (PDT)
Message-ID: <1682bdbe-acc9-483b-ace8-51569cdbb3f8@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:52:42 +0100
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
Subject: Re: [PATCH] irqchip/qcom-pdc: Restore the configuration when resuming
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Thomas Gleixner
 <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261026-b4-irqchip-qcom-pdc-restore-resume-v1-1-ed6cc37816b0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261026-b4-irqchip-qcom-pdc-restore-resume-v1-1-ed6cc37816b0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX4rjvAXh9WBZx
 f2U3NEd3/GUTT+stnpENF2Rq+KFmPqUOJ43AZAAqKFHajqPlaMqEZ256ZDHatTQ70rmX9ymgZUU
 Nkid04a96XwtKLUpOq19F2Lq3sbz+1k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX+5oa3sIbd70A
 GDfSZ7NnMud5yE04CEYn4BuHi5m+z9ylABvqGwpnCJ7AzAUs9E4AwK3gvLVZao5F3esWSLe7CHg
 bF09RWtqz5SedjezKu1XWYfhc5S6w2r1s7rD7OA0RdMssj8rxsKcBHY2kbZeP9dAJIfJUbrrOQR
 2Sy0oeB7NBtemuxlZhSYlCmtGkZAz0wDbKh80FsT6saMT7bD6OsZS8ohUTPxa0m0HNpDBDvXqdk
 NzEwoLz55x4U0C+oOQgMtQV61I3381gH5p2/kZLIiEst7S8bG9IH0ztPmHq0inRZggvcA189zqF
 XZgk4ExFT26tE8PmH6cTyfMSIMpyyadc4aUdlvXBWAPIme9slv/M9mY7AqtTAImeohQUWLfjGQn
 fRDYsSN2c6vL4X7t4KxuoApM3R8G6LAU6X/kNFG0KiKkH63rPkq2oH1nJrfLiwIh83pwjb13ec6
 DO+toxxII83lAZh7BVg==
X-Proofpoint-ORIG-GUID: KpRyd7nW26C_pBQ4ffMCh35Kxoxv9ICm
X-Proofpoint-GUID: KpRyd7nW26C_pBQ4ffMCh35Kxoxv9ICm
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae09090 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=5MpwvvwstkcgiFTKn_sA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270047

On 10/26/26 5:37 PM, Abel Vesa wrote:
> A hibernation image is restored after a power cycle, and after the
> kernel that loaded the image has set the PDC up for its own
> interrupts. The restored kernel then runs with the PDC configured for
> another set of interrupts: a GPIO interrupt it uses may be disabled or
> have another type. On a Qualcomm Glymur CRD the EC interrupt, which the
> PDC detects for the TLMM, then fires forever:
> 
>   qcom-hamoa-ec 3-0076: Unknown EC event: 0
>   qcom_ec_irq: 20501 callbacks suppressed
> 
> Restoring the TLMM configuration does not help, as the trigger type
> and the enable for such a pin live in the PDC.

[...]

> +static u32 pdc_last_bank(void)
> +{
> +	u32 last = 0;
> +	int n;

You can declare the iterator as part of the loop, since you don't
you use it outside the scope anyway (also in other funcs)

Otherwise I think this looks ok

Konrad
