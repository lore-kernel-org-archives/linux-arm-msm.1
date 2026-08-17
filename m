Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C89422531
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786971760; cv=none; b=mtAcrPUf9WBd0U8yTRz+bcI/73TlB/MZIraW9C24j+k29XqxPP8CkeFo+tNtI+9ZtQXwTbCBdhBEsWSzkHe107dWpTdfys90+57vh1YQnuoZr4IVMuYToNSHq2YF6UCCCiyTEtW5f1NMxHurjwh3EAgoKe7sXEQcaFj/6uVDzYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786971760; c=relaxed/simple;
	bh=WZFhqpM+HyJW8bjzf2eB/bviQUV8/jyq1BEy0pumb34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FIBq3tOiyrhCzd7N1VrVzNKqRLET4znJfUzvFeBe3ZCygoCQ3WYg0FkbU13wV55erwdu6XAw3GDiZxM0q7PoykonJfQBDlLnvMVrRG1n76/tsh9ubqUSmirQ91IFs2GL1bZaqBHazHeFdBG6v+K5YKfZ3gXl/hrIzhVdJ71W3bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IC8o/3cD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YlCVzQAp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IC8o/3cD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YlCVzQAp"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HCA5AO1871331
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:02:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	brnQxisoQqq1C4h3S814rEB1FOnvMnMAjV6Sjnn/F5s=; b=IC8o/3cDk/MQiIt2
	BftVcxaXC1DnR70HH4caTpyxmy4loWjwTh0fFCx3pGX1nOWoR8uTyeRUDDcr/WfK
	fYSq2TuGUgM7LIIKEn/NEEjkNXS90AG5EPdDD5BCpo8LT6CVjnivrDRMjOi8xowM
	FvH5xrVuEEdRZDf6beve/WvSFJrj+Nj5d1hx+tAckbKrdSLh/w5gQsWyJhUi7UdO
	dOLcbME1m+0m7tZhWhM8M13iJnImRvahCVNgAeHbuGQXW9ZxoJKnvTu2LC2u0sxM
	+4w0gVnWejCaxayHj38MaYWf/HA7oon3f62XR90BUt5TNDJT3EjtQDfGF0csiYqs
	66TXSw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xb1h3m8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:02:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cae7a8b9easo6473905ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 06:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786971755; x=1787576555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=brnQxisoQqq1C4h3S814rEB1FOnvMnMAjV6Sjnn/F5s=;
        b=YlCVzQAp4W85IId3HuhfWjjQwZ/CkvJ1SisMvTyNzfwM6p3mY3S2nqcDw6g5pQHa18
         6cIa1ZblnJEMJSCAHexUv7RB14BcXn2vlR7dhJlDXFzHX6COcvDlqe+bHFVKcm+OFc+S
         lJLudFckdordOkJQusRsxXnMpU3h9B/olA7f5+fRKwOJs0Hvldc5SSrouOUfaexn1rTX
         7p+yuglXjBmrwCbLQSuAfy5IBP5+0y1iXbzjzkKYZkOXifebxmReZuc34nJ8uAbNIg5F
         xUYErhQoUVOsu1fYbQGWuwvF8PZS4c+715o3bDLANnqS+fVHrKSvBOhSSZCy0SKwrF8J
         ZHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786971755; x=1787576555;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=brnQxisoQqq1C4h3S814rEB1FOnvMnMAjV6Sjnn/F5s=;
        b=bYyjdzLYocNUk1D0iAKvdk0Of1zudBB2R+qjSk+5ScXo9eX3DqsaYZCqzGdSn6wow/
         WaX6f3xXA2DVgi6WpZn5QxqiH7Ybvp8iaxrlIZKYzR1Padh178Eadp5e7zJwgnvIV9dp
         2n6fla9gJbrY945KvfDYYI0kB3G956japebF/z/qtECTUIHp0tqioXu6llhWi2bmPKeW
         4h8XrA0QSPggUJZyjIkwIrY5EOS5lD6GiA8W2hGKtOjlmuotj99SVz0YAlBSPcv3mn0k
         FEx+2nb0bC39BcZc8rFhbZZTrnhJHKLD2d6NKUxAopo5Px/HzT/a4u0xTtnmALaS8eOM
         X2IA==
X-Gm-Message-State: AOJu0YzF+MLisWgWWfGsOK/JmK1e7K3yeXqziNINQXPgbgkhPux5GF26
	Vs2jZ/fsKgDDLDbTnqwXvgjcC6LcT91EXq9NuDX8ubUUhzGyZCjjperQaSCvvZXHt1pVVB3fMaf
	zVhbWZ0Qo0oFHbBn9030VNTfF/D9b62gLHh9+mdi8ryVFbQYa+7orw9XLLhQ/OI7ClM5G
X-Gm-Gg: AR+sD108mZVJod0rPuJozjWGP/PyhdyF8zr2CoOSDM8aiWn2cBW5qn6vHcXO8S76Mna
	zCWw3i+j+aK8HvswypIvOHFjUDlYIotQ1WUivnbQvx06UPOhdHLas+W44uVf2mWpkoGYh7uKIwP
	+Un7p1Jx31PI4TnUhWLU5XuTgKnGgQdjR15OgK+1tuvZ1JTrZ7vOVsLgyrGfapNsaSU+A7pNWas
	sieJpBxPQ3fyelyYqSvejay9dioW4o6cUANNsjSVp6rgjBH/WQh+R6Zp7PmLqUFncWR7FUURLi/
	NtjzwFGgZWCCnAM10b2xIVbIBRAHT9cMhuzQPuC+VfY0XKdB3SuWxlmQ/zHNIFmFSIJbLcft3Ru
	VsVDOQd7m5f8hs1zQNzsq0Im5
X-Received: by 2002:a17:903:4585:b0:2cf:9e90:8be with SMTP id d9443c01a7336-2d3b0cd96a6mr227811795ad.4.1786971753698;
        Mon, 17 Aug 2026 06:02:33 -0700 (PDT)
X-Received: by 2002:a17:903:4585:b0:2cf:9e90:8be with SMTP id d9443c01a7336-2d3b0cd96a6mr227810995ad.4.1786971753199;
        Mon, 17 Aug 2026 06:02:33 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d85886bcsm706570a12.16.2026.08.17.06.02.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 06:02:32 -0700 (PDT)
Message-ID: <dcf5fb6a-5d41-4fbe-a22a-39280337cf42@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 15:02:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: talos-evk-som: Add firmware-name to
 QUPv3 nodes
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260805-talos-evk-qupv3-firmware-name-v1-1-3ebd5e5578bd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260805-talos-evk-qupv3-firmware-name-v1-1-3ebd5e5578bd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ua9hjqSN c=1 sm=1 tr=0 ts=6a83066b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=B4HikTB3W-0rk1GVoTwA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: TDMscyL1YDVPbL6sJI0dzZ69B6qEtQvy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA5OSBTYWx0ZWRfXyDmz0LJ/2+Qk
 Ovc1f7pqoTjLs2k2asvq+smfmT8k0uUoCVSzqr891YHmtxHdAkoJFZ5PRxornIeNDUUhK0QPqdv
 ehbY59Hl1uqiE0m8YMEgfao7T76TxWgSMq3/cG0SqAq8Hau+i+d3LjOTyoq8IkFJN+WvfhhEeYC
 duMYqN3GjUQjxl6I9duBToGm7oyxW43J2B0WG6Z13gFKTUtXw9l/nosN+h3vA5uKCLT1dkyUXpx
 mUtwkrfz+Wjr8z3slGgZY4MNIE25ObNnUihXcbQDxoXtXqZnG58KSdupEVs8ltYDjwhenBe36ii
 NyLviErIJViVf5Cix9yShNSWPtoDbWpplpi2BKKWF606MRZUxYD1z6BBFgJlXopahatRvR+zc7s
 soDPA+ZyokEP3mBnTM/hwLfKQucq4W0kfrg/cb/W2aPI+9oZinPtpS9alZOETPGA/zzhjSpPKdR
 tW4ulA9n4t2ZK4G6ZjQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA5OSBTYWx0ZWRfX1BRz8xPDU5Gh
 GABem3Ok7WXu+k8GnMKXZZ9sTNNQV/xramQiKWhiXXf8wJI0GHGNZ4bUMcoGEMl7pQ/n3/zPPQF
 Xe2ZCvpoFEnJBptH5GuOI2dPJoE2M0Q=
X-Proofpoint-ORIG-GUID: TDMscyL1YDVPbL6sJI0dzZ69B6qEtQvy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170099

On 8/5/26 1:27 PM, Viken Dadhaniya wrote:
> Traditionally, firmware loading for Serial Engines (SE) in the QUP hardware
> of Qualcomm SoCs has been managed by TrustZone (TZ). While this approach
> ensures secure SE assignment and access control, it limits flexibility for
> developers who need to enable various protocols on different SEs.
> 
> Add the firmware-name property to QUPv3 nodes in the device tree to enable
> firmware loading from the Linux environment. Handle SE assignments and
> access control permissions directly within Linux, removing the dependency
> on TrustZone.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
