Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631489;
	b=DeqZOUtlkgrHCiti9+pqYw+9s8wqzeaPCx0EIhJ1BFUlyebjTDUGduSRhbNgKcFIu9A+
	 +DWv0j9cY1dgNHMHkXFAJglrZP161v+7ntkLY170zTqBojZVlCAqHgqQZdNRaB74gVNKx
	 Ra7pfZxwiS0WTIqkk9WcfyB26oH05uM9vklAeXgiDyKv3tq/iYoGDlUfyIAKZoj8HOmzV
	 bay1+qXbqTbiIvXUpyP9vDDU9QkKjos7bkGA7FExXVAnNMbid/VY24eMWJXvkidPNObK7
	 u0SxSm/Kxoul/L2oaaQBjveE32kNfqAtQmfYyg7sy2J6GM/5iqcHJS4XNEg/Vxkyztw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631489;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uaM0xPvzi08pouY+9blUjQ3bSG/Nx8YkkJdb1uUX//w=;
	b=JVWQegAo0rZ+b4kqb7o8CB/DE9qnWh53jiMNfxFH+NETJeSEWWAQbSs1QLIkWt4GOAuT
	 KLHo5rDbHN4XlG6rjcJkoV0Jj5DNqgg+EQCpTScuy7kR0KnOfzT66SmwTRA6gKZDfRJym
	 mgJcWMZ/6a0hUzqCp0nz755FaHxDexjWr40L9zcGmLz7UGa1tSzI638f0vSIs14dH7uSH
	 do2/FOBJC0LRFu2PmB6UEnygOzEdA34klUq8mi8ZQlWi0ZIf37/eaTxxEmezThRuMrCTG
	 bAediF//3ScJZENBKAa20gQXSAN4h5xBnh4zOZ/gbXcQaj88Wjc/Nmpx814sM7OVctg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g8bNs0yY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YGL9rYoM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B17A606A5A7
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 14:58:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B17A606A5A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g8bNs0yY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YGL9rYoM
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpRjH2991954
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 14:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uaM0xPvzi08pouY+9blUjQ3bSG/Nx8YkkJdb1uUX//w=; b=g8bNs0yYCMPeTrqA
	vHdqfEBXcW9PquaRbLRVbhoa01PrbIamq8+TtTR10fbGtpzOyuXLqtaTc1jjtFSs
	r0NjiMYGT+G77bCjObzT2si6b6O2se/MpSPfIzvXJbpdE2Eq+1/T1m8TNZn3OJzM
	vnG5nVQJ2GI7d88YSEjpT7wBBL17Fx6Z8dzwcDR34UbPZgtsvgy9QWEvFINZjW1c
	R52RZ9stX0RAPaQFdBmy0A0IkaQUBuOBMWDf7jSzHIyH8GLJqdzMNQeSHQS7Z1om
	LHCf2z9DLVFuTkf/Q+g1AknyaYxD1R85AIMuJE+xYaxx8CuaiGRgATd6WeiQJCC2
	yzWNJg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsavgvjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 14:58:08 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so2947926c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 06:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793631487; x=1794236287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uaM0xPvzi08pouY+9blUjQ3bSG/Nx8YkkJdb1uUX//w=;
        b=YGL9rYoMBsno3+uLsJyqSH86Xh6P4VUIKcGdtoWptTDpmcIhny4Vfrp/ES+SV4djv/
         MgpbSlI2OzVP/OPqNUjujwbk8r1I2/W6Xg9DkzanUwAN2YPtW7xZ2W/XmD4cEBwICyRJ
         8lIF+psd74jXtKq8dGDuD4AQB4ULxQsGDT4vKEblGISgH5R6dzk1AcGLrwYRMMfuhxnk
         n4ue5791h4eGZME/1nwfjqVUofhwPiYB9l3wH7Fdsra533fBTypjh9Mub25kSbOnZueR
         rOz38mcjxVl9PUhEvVcH8CbMtP+zHwoPPN7EL7sCDoNrZodujEJCT1WbFSzMAve5gSyE
         B2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631487; x=1794236287;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uaM0xPvzi08pouY+9blUjQ3bSG/Nx8YkkJdb1uUX//w=;
        b=CIr92Fcj9r7FTsAgQD/ilQDM8DnU1JYf+pygCF3OaSKHUkgs6oq98h858yv1XODBye
         0ATrx7GRzAezyiDxFBmhiEIgBAOaV5saG7taO+NNCj3+7P4FBkshY86XTobIkR/vReWj
         734i91aFa4VH+e2E3+HXHxKCsG0ReAQAEn8DZFZ3szF26tPR/etbk336HjWuWVj0OR5S
         8KNVRjU72A5bmLM+ylLKxoqMGrFnKEPyvC9u+z+xP1wheU+LLHnha7HUsE0g5sdKkjQk
         H9e0Ha6RM+IAlNsxEd71A9tOXF3mUA559i93oVb6XJR5AvrFJ74B7TtMwiSryg1vVWRY
         ZtJg==
X-Gm-Message-State: AFq9FYKnnAYU5y6veY33qgY/D+01mcIzkScZWU511X4rRZZ2hjEE0TCn
	igkyEfFo0ksa7Zk56xZhYtZDsCLb01+1SC8pvaU4LD/TymfzUtjyNKGAN2cXR/hrkRlmKXLS6wZ
	FTzUJ1AYJnbqEsJnZfTEClPbiubRet+VZdNzesYf/Zhsln7HrX7zHX83Jy1OMe1x3MblqPqEopw
	Jv
X-Gm-Gg: AYBFou0G28DRPvK6Ca7K6i1KfD5VjzrtoQWrmQrFBRKKuspnb3xsotLJCe9bb4wRFGa
	Pr6mmrogmlhEwnVZwCZxp9HPV1rqkyxiXkdKPjwE295b2o12xYKgxBneZzIAyOZQbliUHo5SBX6
	Z1iFBmmwJy40pevkuX1j0zVJ7L0kHy0sz/PjA62cNJZbjcOnKt/tk6b7yw33YYOah828+3wPgj9
	DFVSbi11b/A1LmSKXtPNIuAFyWr+VMgeZMyrp2LzGQbcv2mmzy8ZAnp58viIPjbeLfHtFrOtScO
	3P53Ura+t9GggSB9ROUyQ19sLrP01pkyglaa7SCghQ04RATKc7PFMg2apJkz9iKO+Z0JwjerogL
	8S5YL3Cvr7H6JCNF3iaNG7jnxF5slOi5DbopKqdulwMGoBx9z9kmDCtiAwbbTekSf6zxt8XGphw
	ikN+w8UD2fSAJbdOuZDnep2W7HbpUoVsWK6FLYb4Jfb5aOgOLMG1+EITcNhLPxpQ==
X-Received: by 2002:a05:7022:3f0b:b0:1b1:f02b:232c with SMTP id a92af1059eb24-1b1f03a6a35mr5613118c88.29.1793631486982;
        Mon, 02 Nov 2026 06:58:06 -0800 (PST)
X-Received: by 2002:a05:7022:3f0b:b0:1b1:f02b:232c with SMTP id a92af1059eb24-1b1f03a6a35mr5613064c88.29.1793631486355;
        Mon, 02 Nov 2026 06:58:06 -0800 (PST)
Received: from [10.50.55.14] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1a16sm31406132c88.1.2026.11.02.06.58.04
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 06:58:06 -0800 (PST)
Message-ID: <700203d7-3550-42df-bdc3-959e467ea3c8@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 20:28:02 +0530
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
Subject: Re: [PATCH] arm64: dts: qcom: mahua-t14s: Enable GPU and GMU
To: linux-arm-msm@vger.kernel.org
References: <20261102142812.1353199-1-lukas.maerdian@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20261102142812.1353199-1-lukas.maerdian@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1OSBTYWx0ZWRfX0QPA9QWVboaf
 USPa43Qb9z2HxMnsOZkpwbSSDlkmG0E/V22DmO8Du8JG/9h7DJMBCT7V4iaQaCwdZYs5Vngm3a3
 L0/gzBvcagZIvOKhAi9QZF0X5sc76yyJOU1q1naDlbMtbVc3IQ1/iqp483bcRzRpAews65Uxmla
 2A6VHycQYeO9x5mte03JQrSOz8uQxPJenEuvL2U6NBy0rXYcjTKH59try8bumq5jKF9e4BQfO0X
 J5NGgddMLud6wox3kd1WfatTTku62lqVuKaLl1ijG527RNeUMOacbkaE5fhK/MdFgeYH7trzzDh
 jdWp7GYNYenIC4atjKzQOCMvFfT1E7+TGzqYAac3kyPljtcIkdmGIxrpcaGCfsroiQ15FmAjuOW
 JGgdJ4W1WJVvykNzKViOrH4qrzgTUYyBmCooSvS++aOJ/NPMrQWnfG9rYrfVvuC0CQAyWejWqqC
 pY36//0IYMOCt/cmuwA==
X-Proofpoint-GUID: gTzN0LMRjMje472FXuoQCu9AkPbBFuI5
X-Authority-Analysis: v=2.4 cv=FZmiV5+6 c=1 sm=1 tr=0 ts=6ae8a500 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tpWDcApjDx3U_qUmb_gA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1OSBTYWx0ZWRfX05abf4Cqra7Y
 FH5pzjWAvZ794/ulujGX1PHTJjlqwDtHyViT7o526Rxu2jl8vC8Wa3XvER9lB/yxq6g9C8BLCFS
 a8fK9dH2lHnMPrYEKDxgdQtGKmG8SIw=
X-Proofpoint-ORIG-GUID: gTzN0LMRjMje472FXuoQCu9AkPbBFuI5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020059

On 11/2/2026 7:58 PM, Lukas Märdian wrote:
> The GPU and GMU were disabled when the ThinkPad T14s Gen 7 device tree
> was introduced, as the Adreno X2-85 found in the Mahua SoC was not
> supported yet. Until then, mahua.dtsi inherited the GPU and GMU nodes
> from glymur.dtsi unchanged, describing them as Glymur's larger Adreno
> X2-90, which is not what the Mahua hardware is.
> 
> Mahua's own GPU is now described: mahua.dtsi overrides the compatibles
> with "qcom,adreno-44060000" and "qcom,adreno-gmu-x285.0", and the msm
> driver carries a matching Adreno X2-85 entry. With that, the nodes
> work as-is on this laptop, so drop the board-level overrides and let
> them inherit the default enabled status.
> 
> Tested on a ThinkPad T14s Gen 7 (LCD): the GPU and GMU bind, the
> gen80100 SQE/AQE/GMU firmware loads (GMU firmware v5.2.38), and Mesa
> 26.3.0-rc2 reports "Adreno (TM) X2-85" for both OpenGL 4.6 (freedreno)
> and Vulkan (turnip).
> 
> Assisted-by: LLM
> Signed-off-by: Lukas Märdian <lukas.maerdian@oss.qualcomm.com>
> ---
> This depends on the Mahua GPU support series, specifically
> "drm/msm/a8xx: Add Mahua GPU support" and "arm64: dts: qcom: mahua:
> Support GPU and GMU", which are not merged yet:
> https://lore.kernel.org/all/20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com/
> 
>  .../dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts     | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
> index 255857cda9b..189dc3fe542 100644
> --- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
> +++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
> @@ -693,15 +693,6 @@ vreg_l4h_e0_1p2: ldo4 {
>  	};
>  };
>  
> -/* GPU/GMU not fully functional yet on this platform. */
> -&gmu {
> -	status = "disabled";
> -};
> -
> -&gpu {
> -	status = "disabled";
> -};
> -
>  &i2c0 {
>  	clock-frequency = <400000>;
>  

Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
