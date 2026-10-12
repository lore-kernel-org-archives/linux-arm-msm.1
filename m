Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E0F4A43EB
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819085; cv=none; b=YelBTHp1ivxS6Ma/vgnIVlPAEmXBTbN2IQ8wjnJ0ZsaGDpQ7BZHyyJvZ3u+KBANLZ4zAbkQO8/vzXH0wDzrYkT1LoQauS6Qa8uLPjgJ297Iln1LltL88wNE5lfV0nlIYJMsy2HB1prXe5i1kovwCKAGtPiTdpxHsre3PYneBXm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819085; c=relaxed/simple;
	bh=E0eYBDH6q7otgv3NMgyjKsx25BJurQD4IFX7mtGQkVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sgZsNa/nmcKOgV3TDz/puj5m26snxe9Bqm/dMuFn61PYFQCAm6EPtryQdkUZdULeBOo+gF9YUL5Cu1jCy+Ex8TOLpStiUP4v/ZuoAw1DYtCEFN52zSQNYqyEZuV9+cQO3h3Hqnv1tlYalSIR2QfyOC1yZMkE29pY8btWEELtG44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W+8J477D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Efquzgui; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W+8J477D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Efquzgui"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC09XJ1405420
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:31:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6RgNgtTktLuBEblMjoU/JvQyqD2FuH3FkedFx5A5/o0=; b=W+8J477D190EFoGe
	43EH0L4j6qMk4NZI9vhWnH7ftVzxgKDm258BJB3026WyOO0gWBykyX+J3ZzuLnNc
	zKPVEGVdWDDC3hQ94WoUhS7y4w6SS8cO63I5Ff1bG5rU8KhuGdre6GfKi26i19GD
	zt32WNsJIWo6slJkKfybksb9O5ae0eKb4nh+LAQTuZqq7ZEambZFQJ40eP/shdZm
	MSQP/1VfWEGaQccXRCy79IA/lMxBuCsANFqKJyTohNHBKmwA1ZVRhy59MhHDyG5Y
	AtdFteeAqZ2s2APMxNH6FasEp+2v49HGomQb4KCFwm7auQ3ksjai7ALsfUyU/yUm
	3lBsvQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8v7kstmc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:31:23 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c274c15c90so38849137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791819082; x=1792423882; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6RgNgtTktLuBEblMjoU/JvQyqD2FuH3FkedFx5A5/o0=;
        b=EfquzguiL2OlRTEL28y/I8LKNTTedcrOYpUCpExzd9EWbga+Rmo4fS/6Naa+jiI7R7
         FlAEHnbUFL9M7z870OIvcSAkF9U6slNwnuE/IZFJVTXdwqUc9V4CjGNQdOf5Zud4Kcp0
         FvSeofMiEfdONi6TpdhdL66cge8mpDEF3CIvqBcV6v6lHl2kfEpLm/hGmk3S/XjVXkFO
         bL98trl9gSbS2n3jd/bTgmDLbZhzI8SU//5+QoIOmW/B33abRNoHnwI3lFWFGBE/h1LM
         OSh0CdRFOBhdaeAATnCkXg2kdbxCtmEYo7FTwKBLsKAVVf7IEfmIjswdGbIh9vzTrpR4
         FdDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819082; x=1792423882;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6RgNgtTktLuBEblMjoU/JvQyqD2FuH3FkedFx5A5/o0=;
        b=Nf0yzLlQuD9W+te8mZp4srMvdGLp2TzlwJE+8bsxno9Bg5i3KEhRVtGsYZ25w0WcvM
         73EzWdNLSn8Ht9qcC5W2JZvBjG4FZAG+91klH1P2wlrYWE3UhIg9rh4f3uNgSi7bWpPz
         O6ikuc9gVqQuI5UrXv44NIffPoghoAZqwFeWoNID+Oo+fZQTRCeAlz+1/bMz3qFVE1IS
         5FqWhCxf6RJ4GsFY50oKxmzhw4UW+qXc1M0/LnCRfkmJg4YiU8CdaQJfGZj2psGv4rm5
         3defXtsvBgSRenvTNQRJdB2Vli+Ey3BYgi6tNtzQ74EsbkuFyrJtO/oHjZah2S8Z8J6K
         R+PQ==
X-Forwarded-Encrypted: i=1; AKwUvBxU0DmGuD+ArCLWTeJn6AhP+dBMliRRZxUBbb/UYe6RU4hD952ZccOlD6hRU1Nz9ennJfHIBMbRZK6g4SoF@vger.kernel.org
X-Gm-Message-State: AFq9FYJIR8j1et4UEuxtpMLM9d9qiscYl1fMRKa8IWG8BUz9LxQU8bip
	g4XwmGbayHq0ETnspHnd26tWYsRqmapWNMgBtQSwo8N8zYg40R2b8mAhv1OrLMNflakvLz6q1zH
	W2fBAuzwQIn9/HK1ItEK3dnhodvtfqN9BCzlVm15fYYCcsbLy1IqUUnEZfxoCqQYV99Rl
X-Gm-Gg: AYBFou1GYqXQmfXCRcDBguQvhoQOny2pkAC53lF6qzSuXrnp6lhcKvcyfFCRMR2vKLf
	C9q/lXaZwynTXnL1+cXSsZg50iXHrjgvISsjIoldWvzvPOOpD0HpqE11FY8KBA7SFe9USRuZW4O
	ljZd2tAQM0eq23KiboeH0Fd2Mw74y2xKk9s1Y9mLwZrxREGwfim3O7Ohj8O+SnJIpLZm0O2YFgi
	OpFxmene1NQaevNN7ZMjeQnEfAfBa7I3vp/7krxg5vFnPcHJiAsnkNkFNABhaoyJRrUfzUQyaY0
	SRB/Yc9NPB2jHiMqKWPjQo/PCG6Matw5I2F7Rz+Urcujkqtm+s67xm2HfOKGAkfF+rEcrQplfKo
	2zWkVSRSQvhcNPhyraLaDlw==
X-Received: by 2002:ac5:ce83:0:b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5e91efe58e1mr1928347e0c.0.1791819082421;
        Mon, 12 Oct 2026 08:31:22 -0700 (PDT)
X-Received: by 2002:ac5:ce83:0:b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5e91efe58e1mr1928328e0c.0.1791819081948;
        Mon, 12 Oct 2026 08:31:21 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34001fbda1sm203669366b.66.2026.10.12.08.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:31:20 -0700 (PDT)
Message-ID: <526230fa-d8cb-4e33-936b-a3b99d271026@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:31:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 26/38] arm: dts: qcom: msm8226: Align multiple property
 data
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <d9bcb8ae23ce2143e598d1dc68b1050684b22246.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d9bcb8ae23ce2143e598d1dc68b1050684b22246.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX+zuTLIQVg/As
 FTlnO+7gIXumudaWeP+89aMr9dIkBOnGiH02bAmg5JW55r0/riy1IOu0M3ZLcq01+k/aNpFvpDL
 eGIF6V0Xxp/Zu4XoFAbVslI7nC6hZP6gqILHsEMUqxV2csIPrSc+eTlTGO/7TjT9aSSBSBgk2eG
 Y/l0yVM0NCYnT+IGiOVvUxGl6TNK9TbaPjNgO4g1+CTRPJ+z5u0JzrU7+mpOz9xIcy4FnKDojVS
 N9zhdPz5ZvE81ThxVAV4AnidZ1imPvbMpMfGX/l97xkbKPqv5Yf+mrpXZ8vA1QM6zaS55OeZnXz
 Xxe1XcYMw8LYAwwF7fmA3/rQwBsfh9cWaTryckg43VNusH/i41kE4/e1Z45iua6/3SLF8BSIjyL
 lGHz4TwFyj1Xj2ySg2eFsjB7VI0vVb8cMuyJQEApHhgeo89W7+XQkoHtyQrkpVv3i3ZYjU/OpkX
 SUHV1YiBwUMf6yBbPVQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXyd/RRxVBXQaZ
 ewoK7SNwbamSCGPbkgwzQOJ98SocBzgVzEDO/zUyinU9zHkzZt56inNIRa+gf7Zk7xjUGcKfqMs
 DNgrkW0jMbPaXzjwERXI9pRyWNVlNQY=
X-Authority-Analysis: v=2.4 cv=VOtIDNPX c=1 sm=1 tr=0 ts=6accfd4b cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=3-RhneuVAAAA:8 a=IcLJOOV1pWpkvDOWcK8A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-GUID: RbuFj_ldxSenfP0Lq9E8ovWxjQfE1FcB
X-Proofpoint-ORIG-GUID: RbuFj_ldxSenfP0Lq9E8ovWxjQfE1FcB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> Multiple property data on a newline should be aligned with the first
> one. Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8226.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
> index 346aef4a1d9f5..ac18744b50924 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
> @@ -1483,12 +1483,12 @@ cpu_crit1: trip1 {
>  	timer {
>  		compatible = "arm,armv7-timer";
>  		interrupts = <GIC_PPI 2
> -				(GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>,
> +			      (GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>,
>  			     <GIC_PPI 3
> -				(GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>,
> +			      (GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>,
>  			     <GIC_PPI 4
> -				(GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>,
> +			      (GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>,
>  			     <GIC_PPI 1
> -				(GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>;
> +			      (GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>;
>  	};

Likewise, these fit into 100c

Konrad
