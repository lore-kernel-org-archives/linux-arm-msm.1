Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3634D0A05
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 13:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158627; cv=none; b=r4mDA5HB9u0FxzwWrLv1jOSYVOYDebzN2a9QALTG6yldwf9Z4I3KHoNbsHqMTdftfJJ8elMdyvsXVhh03xlFYPEIY8X2knA1MsGNA4LB078ce0ACBPqqnllhwKBcewYy8oEaXJkhhknJB09IBoxcNbqlYakDVMg1zmlbW8yj554=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158627; c=relaxed/simple;
	bh=89kIaJQIhInjaSQR0lqJ3W6rutg+Bsi+y79NZy3l+b8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FbFhW25MBNmrxppSHQvl7SZP0DPN6LwHfVOo5Z2wQ4M/pKhAtC9J263a7ygi0AJPrdmmw6jbJQA3DARjEtpg46qi8mdeRcnEC0/wFdzsaFUbWcyw4pEFne+6uca824BDjD7Xs+rolrdUP3eZzR+d2U/kkDSbjc4Uu4TEu6Zowwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CPy++eUk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iZVRSsyQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CPy++eUk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iZVRSsyQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAA6YU1983108
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 13:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8J69GrorV8UxiOdAkDTkS3PdkrKWbjG4R8mGsVT26FM=; b=CPy++eUkBDzE98Hs
	lGliouZvZ56v7lf3I92N+p8zcEsUqiaYIKcfh5k2xdyfFtac731HMM0rbc3DvXTQ
	W699YuD85lBRPz7Aqk7yOVkVPd9xU6lX2dB4li2EDNVgqFNZ+cGHbgjEfu43VGkA
	ZfoXlOVYb5YbWjdoBGW3CFKDCTEb1bj+9+CA+41bKox9+ZEnsIOhcSU76jbwkeuI
	G50cyDc+HbXLWfQWRV6Ze/qcf3lucG+V0JbOAf3IDUoKdAhylxzZMmw8dSACYBmx
	DJbzz2KGJC/hiljZMSuxyj1vUd+xLaSeR1Q1eZxxptwGismvsoAnTl/pVL1Nj7Z7
	ID5IPA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8a8aw9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 13:50:25 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5e97167fb2eso108095e0c.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 06:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792158624; x=1792763424; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8J69GrorV8UxiOdAkDTkS3PdkrKWbjG4R8mGsVT26FM=;
        b=iZVRSsyQioUfZwIKqY03F1hUOZlrhus1Fs1LY701K0wei7z0shl9WKxTOqK/SKvs4p
         ZO4dPYVNulx6PcgiGFLPexoycb3hMcE2Z0FCcUJTXFUW2e0XNZtnSPXLMZH0PBTqH1a3
         tUVgyyhmW6ISpcQOJYW5MqvzTRXnCeUepai9VjOoRNfMXdl0OQ16/vLZOnt8Y3Psky78
         9xHcwnyWFZYoRKwKs3fdjgBcXKhd9eMj888HRTUKcIZJeoO89zSnm59KXoz0dQ5b8890
         gXlFJIi7HqgIJ5PKeSS1e7KfqNZJNz6nxjzIYz8/iNck/Z5ru3Y3kKLo5KS3FN8wSw4N
         xZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158624; x=1792763424;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8J69GrorV8UxiOdAkDTkS3PdkrKWbjG4R8mGsVT26FM=;
        b=dngfjPghZe8B/nWONYEJVcfxNDKNfwVeXVNKK4Atw03Ud0DuHBhp0TnquZmhLddPS4
         Mco5ER6OHcmCQEg4vrQH7fTot3wfy/PAqiM5PV2243YMX9nlJtXejdLY3TVJ3KHtsa7t
         HYWZeDbfPXsk9VwqRH2APtmn45TSt+bZlngvpWhxZixvXsH9UmGw4Mia//JYAKfxmKh8
         qIXKoEOMto00niPlmtti8sIFKfyoQ7mhuyKPC2T2OXZbgrbN2algYidjmEPlCyJLqjT5
         DKkPwtcEhqBnVGVYkc337xmrYq4GWLJLqwc80TxkKAPJ9vlu6TCAcF3J9vtB55/cbga6
         C6YQ==
X-Forwarded-Encrypted: i=1; AKwUvBwH6fcQhD+BkGxF3DtuRdCK8SOkBhvgvquF64twBM/7uNh27hsjc8nm8yLPB2TnR+iORJ8cRDvilbALWGMr@vger.kernel.org
X-Gm-Message-State: AFq9FYKXnjtZM+nYyNksgsEqeYQhDATUVAe3Tb/xDZRY76ZwrK7XMVOz
	NJKvS0ZaS5Ew/y6+xIscvfi6K+FlaE501op8j08SCe2blULPCIP3vleSWh+llfpzE2yOWn/l7eA
	KMzfNHvQhrquvElIC6YrEi7NOjytLZAHGn6xGLpfBIc5lOuHYR33fG2zcSikuIP4KXbJv
X-Gm-Gg: AYBFou18HG3oZR75Zs/yjr1Bh+excGC6oUz334Q9mwCs4t1qoRZ9tnN4IIJST5UpExo
	NzT3hOuorWBVGxDqtQc94kZhSmC/1rKYtr48T6id203w4a2W22hxi/uK41F34O0XKq3lzQiDgsm
	YUPon2Ei4rWL/TufJtCsHjyrzMS5yvKqg42arFxAfUeIhwO14NBJGnGRvn0N+d9zfw7bBHITbTM
	UemfHFGU0sRAJbfABUmmpZi/HxT1SyKUDJOcFFVdA/B3zwy7aq/nAO/f9VXz5xOdS5dux7kqib3
	c+ynCUxnQ5fjMgtELRu6rLkaAAKTuQWmSjd9OXUqiwRFXIk1rQP8xn8jBUjtS1cn+71w1FNX4WW
	HrzZM3FCT7rIq1lfTB6ivVg==
X-Received: by 2002:a05:6122:4fa2:b0:5ea:a8cc:e6fa with SMTP id 71dfb90a1353d-5eaaa65ac81mr10519e0c.4.1792158624114;
        Fri, 16 Oct 2026 06:50:24 -0700 (PDT)
X-Received: by 2002:a05:6122:4fa2:b0:5ea:a8cc:e6fa with SMTP id 71dfb90a1353d-5eaaa65ac81mr10500e0c.4.1792158623439;
        Fri, 16 Oct 2026 06:50:23 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dcf335sm73753066b.29.2026.10.16.06.50.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 06:50:22 -0700 (PDT)
Message-ID: <3faeade1-1bd2-4e74-95ae-7396a1ef1ce4@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 15:50:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: clk-alpha-pll: Skip Zonda PLL
 configuration if already enabled
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
 <20261007-ipq9650_apss_clk-v1-2-fd4c2b3cbdea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261007-ipq9650_apss_clk-v1-2-fd4c2b3cbdea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NSBTYWx0ZWRfX+EekAtchK4lU
 j1RbeXcCBIePvtemMsgo42iEmJosjgipTwUQMUv7dTWfHwE5EQFrAs84xtTjHR+6B5d5nIDvHNf
 JQZd/96KSuq9mpsbrLNNx78LFXYnru0=
X-Proofpoint-ORIG-GUID: nmpkm0KtvhcULch39nVpQdLV0qLnlu2I
X-Authority-Analysis: v=2.4 cv=GJadgeNK c=1 sm=1 tr=0 ts=6ad22ba1 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=RiPQFFr3Mvuh7BT_tTEA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NSBTYWx0ZWRfX/mGSEB1dazFv
 m/AKkuNiWDRt2VJeOtbSnvOwgzoxMpH0129dibYvnxd+p8w3OcTAFY2UOBVaaXyc1rwHUFrP60O
 kBsX/qzi+ZefHHyfgVot9+JZBqsfWwuKNRcB+xDL5D7uyJXWuQZaMnQY58sejrT9oz/LOsK/N8E
 zTJ+8/CVWV+t3Kmheogk+ygLeALFZnfeOuHHQf+iyzjRy0nPcOrAcMxtqMXfl4bBw6h/zKhOl9B
 O/zOQeCqVPTzLZ+Tf9K8kfjhJpNLJlD8cJ2PCUX2keMxvb7fGW2UJqtqNLVM1D0f7gkDWabAKk1
 mPhJxPPyQJEOaUnGew6qN0Gb14YOB6agmeSXgY/GmtT/XcyxTKu+pHDr5h1DCHpZ1kG9GwUqkkY
 jNg1HIRa6+ONEQqYlcj+YFd5wDMh8ZC+aEkTH/YCdCD+DOp4Pc2tswX2pApVAIltK5wDcLcjHhS
 tqNuEg29hSlSruG+T/A==
X-Proofpoint-GUID: nmpkm0KtvhcULch39nVpQdLV0qLnlu2I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160055

On 10/7/26 8:50 AM, Kathiravan Thirumoorthy wrote:
> On IPQ9650, the bootloader configures and enables the APSS Zonda PLL
> that provide the clocks for the A55 CPU cores and L3 interconnect. When
> the APSS clock driver probes, it attempts to reconfigure the already
> running PLLs. As part of the reconfiguration sequence, the PLL output is
> disabled and the PLL is placed into standby before being re-enabled.
> Since the CPUs are actively clocked from these PLLs, removing the clock
> during this window causes the system to hang.
> 
> Avoid reconfiguring PLLs that are already enabled and return early,
> similar to clk_trion_pll_configure().
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index 60173b076cc5..3641b2da92cd 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -2162,6 +2162,10 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_lucid_5lpe_ops);
>  void clk_zonda_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>  			     const struct alpha_pll_config *config)
>  {
> +	/* Check if PLL is already enabled */
> +	if (trion_pll_is_enabled(pll, regmap))
> +		return;

Please add a debug print to match the other similar calls

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
