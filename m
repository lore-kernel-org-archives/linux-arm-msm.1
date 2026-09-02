Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0C14AA1E7
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 16:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366638; cv=none; b=H66oVf4A3Jw16kmZjke8w4ETV8P0/vbT9kM4NyVOAqVSwObNyXl407TjUK7TpNcKSZfeBHoLADUuanXUMtX8WSQRUvB95rDismqwM4VAtoW2kACRI1K5TaCMEayYCV9KbcSRqvxXq1oh7bTz7JjWwrwIm+wKHleqE0w48Tg/43I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366638; c=relaxed/simple;
	bh=Jm/GCgG3w1Rtf7Ytx9MV+IJejXDtp+gAXOMb3VKAutE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SQTYq8iOXVnuyex3gXSKZJR0Oc6eP8gKsa1ZclebriN/G5U5VCbpvZ9ddmVsGjpfakHP7B/4dLD3/0NVeAplk88g3pBGKm9M2VKNCkldNznXNyjXkMLQ+MVzurQVJEmXmloo8ObWtrjpW6BOZscJZuCu0lWex/jlgly1pClsa1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K4+Vtoub; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y64X2xN1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K4+Vtoub";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y64X2xN1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FZ9En1967771
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 16:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0LmumBSHjtHOWOUT98VGfXvJdSeB0SGvuhvGl274xq4=; b=K4+VtoubPjiIXRnh
	aai/86kVsfUaBNvo4dc75Qt6FnOXokWJGQqicgCX4EpUbDw1b/OTguGDjuplV+Ts
	pr7VTupcyr5pVaKDf9bJHgmOGSpLZiA1URafPwGjO+VC7tAwJSnSEiLPaBPp6TV8
	Cb12U4EaNxIt/+cKXcM/H94VX+hCuNg5VRRQ27uqikwM/xoqoU5x68H/cMp4vH5/
	gGy00yyNOzYtEpYIwrq6z+t91AlUG4PRnEyQiMyHZjh/XrGG8wtsE3Ey0jVjE0VJ
	3/vjEZFj4I5QX0TjLGMnwCix8s58aWv0L/EuLHmJ1jje1VTex+pX/0KEWaCfPo/t
	fUj7Qg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gej2c9e77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 16:30:35 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-77f133855b9so16831137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 09:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788366635; x=1788971435; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0LmumBSHjtHOWOUT98VGfXvJdSeB0SGvuhvGl274xq4=;
        b=Y64X2xN15BDxTRxKpaFdWUjMQcySFov5DCXmiVyrnQV0ZnJgPYsu4AVk2i+pKbl4+X
         2kKEtuoIkt3AWc6yIGxETsQ6TeYtuqbshW1X8kvYkuyI2PK1tYBNjZR8TAmhkuXi1/L5
         YiVAdPQc7C+YD3C3H8dEcY1qzih/PyTZwN2iz0ta/VqndNwqFl7Rtz/9WpU4vS7Gh3Pj
         pRaLAKf8H5G3hEamVk5PtHFQ7Fd9nZxQ4anAU6VTKTIjDUwKLYUnung7WjOFS/dNZDGy
         EAO6KzrWQUrDyJi+CXOijs5lJXLg4CEzTWBSQUg8da/CZn8nP2/n4LVs2JgVjU7fReP8
         5G/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788366635; x=1788971435;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0LmumBSHjtHOWOUT98VGfXvJdSeB0SGvuhvGl274xq4=;
        b=PUEzRMeWjgl7q1/S401OsxBK6svpsqg7JlGdR/YOzZRMGWr079sW4aH52LYDHD27Dz
         AmJlWmpi2sVGAnqCM1q7Zd4QMzfgGTIIW+lBhmtHg+IWT7Ftd7yfjYM5QklJVf0fE3mb
         vRUbPejdQewMIFTKXqGikC7oV9PsZSWMZwqt9ZVDucw0qy39Zm4GyT2ZVfPje1vNPV3w
         DFJkD96SPBa/hnsO+xFe9KDXU6ORao43y44cO1qE2qFigyXdCjvY7nRCpcwk3oBR1dUY
         GFtz89eq7hFsj1a9/hyJUCWzApBuCZ+/BPrHcoeYNJ1IrIzYPbeq1TAcFjftUR8Wt5ZQ
         2B1Q==
X-Gm-Message-State: AFuF++nEHljD7ad+JAVvSeXaPi28L/NT7nSoParOWmbTLTdfGedLb3PR
	yd5ePT6XjyQDrkiFRvEFlGJRk1zBTj66ho3iHKJDwFUqyMyClsUP7XUOvLIko2PwcdNAKdpZOot
	9lZmWD9mPEtr1TBhFAZDm50XpOF97H+YZYllI6ITkDIm0KOlgqIfBdam1h9T6+p0L/8lE4crfgL
	Ay
X-Gm-Gg: AYBFou12BmGIlaGA9u3noggVUiFVtDV/SHkhSnXCRz4PZ2BU2Qd+kxQRrrI07iTN+qz
	uBrhNVn7K4DL9s6J7cnsJJnpr10uWfPZBgfII2cxcJq1Ph7h3JkR7EJbylERQmfJ6FqJ7dRJeZJ
	xjMY9ipb7rnuZ9KomzXeW+jj23TK5mEcRuHnjLSbSRCgPwv5eEUNBKfgV3H9S5XE7fvpZKKxos9
	OF3I+ifTbO8r4tORxVaoXgWPmbZrXfV7kpMgbHPfI8Rzczrh4V3e0x3QBsp7w7z5VOM4bbYAuMP
	WU07Cz180cEkxVjEJA5AAt6thBDRYwLeOau+jggc2oEh2un3KaEq1pW+fE0J/4MvRP58qeW9aOU
	KlsFVJlcaEYlC23oAwCpg4A==
X-Received: by 2002:a05:6102:5490:b0:789:3ef2:1da1 with SMTP id ada2fe7eead31-78a1f2db6b2mr994094137.1.1788366634500;
        Wed, 02 Sep 2026 09:30:34 -0700 (PDT)
X-Received: by 2002:a05:6102:5490:b0:789:3ef2:1da1 with SMTP id ada2fe7eead31-78a1f2db6b2mr994053137.1.1788366633931;
        Wed, 02 Sep 2026 09:30:33 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d039d2c2sm168293066b.32.2026.09.02.09.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 09:30:32 -0700 (PDT)
Message-ID: <6d4b8ced-97e9-4926-8678-39339c5303af@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 18:30:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v1 2/2] arm64: dts: qcom: lemans-evk: Add SDHCI
 support for eMMC via overlay
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>
References: <20260826113206.488991-1-monish.chunara@oss.qualcomm.com>
 <20260826113206.488991-3-monish.chunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260826113206.488991-3-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0NSBTYWx0ZWRfX20iGXrp9ggyp
 AagglKfmKaBlXyEuScD4sNrvn4dB3iUXiGbx2K6KhuNS0O6u6sU5CjMGyqJ6lWA3dreOScTMHSs
 PqQ2PIOX2auDwM16rT/HCXA96OwpgqI=
X-Authority-Analysis: v=2.4 cv=G+ss1dk5 c=1 sm=1 tr=0 ts=6a984f2b cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=sGhwJIB4vkB8Sb3_GrEA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: oqYcs8VwSewweapA8kfR2ne-8MxLWZlQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0NSBTYWx0ZWRfXyHOcXgTjf8dI
 wZwhWxkGqNYzRraoCBiMfGE+zwZHRoHeesDMtd0Avux1O/4bhdIyOMwMky3vgBcTKdTKWmGHdNY
 tUam1VF7K4BnZiLMn9fTI6gME2jm5yqYmJxyEG9QpQbCxUiwm0JOcr0Co67sE9WJxj1Qq065eJz
 ICyHo+YhYSCYK8NOvV5zA2nnlvDiFvBLTj9OoRIj7ehIF/VSvLOg1AsJQIbu5u5V6WYE6g5eQ/5
 +ZrP5qHig8NfhAFD5wrQGsAI/2r9O5fN0g4nRU5pBY47l50KmcKS3guZBwWU/ymvu8gdjv5fxMy
 3iGss+5ZmqmZ7RP62CfKIcekAixp3x1xWRAfISFWTgubGEO+GCHc+ETsFJ91YOghZEn07V3AWp1
 5ehw42rKVaYefASh2wNCPKaOBas4LqgJvabiDyX0QXFQLrpKdWoO27SFdO5LGrb3Eru0cJWUvOD
 XVafgJMpRpX0QdRuYTg==
X-Proofpoint-ORIG-GUID: oqYcs8VwSewweapA8kfR2ne-8MxLWZlQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020145

On 8/26/26 1:32 PM, Monish Chunara wrote:
> Enable the SDHCI controller for eMMC functionality on the lemans EVK
> using a device tree overlay. Configure the corresponding addresse space
> and resources for eMMC.

These are two separate changes that must be two separate patches

[...]

> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 695eae1b7256..99d21e3d7ab8 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -4300,7 +4300,9 @@ apss_tpdm2_out: endpoint {
>  
>  		sdhc: mmc@87c4000 {
>  			compatible = "qcom,sa8775p-sdhci", "qcom,sdhci-msm-v5";
> -			reg = <0x0 0x087c4000 0x0 0x1000>;
> +			reg = <0x0 0x87C4000 0x0 0x1000>,
> +			      <0x0 0x87C5000 0x0 0x1000>;

Please don't deviate from the existing style (8 lowercase hex digits,
zero-padded in the front if necessary)

Konrad
