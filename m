Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00515431A22
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784223613; cv=none; b=W8w2lJMqw5ri55qeYYezriyAeaVPf7MgIz7NyYRHOc26ThmojZIoyUont/x0UJCa8Y7uzUnnAOLAy+90PhaLNqTI6GbqaSAvBYe8TrjkuMifRRw6LWg8Ww9w2/VRNyAeDIoy7cFpxtm7wIAPRFhwZtZaDC/3uH/SEQUWF8SMiX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784223613; c=relaxed/simple;
	bh=tHg/hS1FOCKbvzI4sWSTLObFyPXHnoqWeIz2PSSrQ7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pSKZfzZbovXYm8CnS+aEIDu7v6DwSKLH5fhP4QpAilwamj0um8u1xz4xAzUW/hjXZeRMJ0QP8LZ9IgmnzJHJ79v3rPEq/nwTuvhJr97Q8EPcANvI96FK58VOIVakI8rD8yKUQj3noZs+1sx/i5lpE2pY8KiVe/BAkIO+3WM5VmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C1OAL6mE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BgqvuUcK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C1OAL6mE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BgqvuUcK"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GHZQmo385140
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:40:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LCSRMiF4nIJHNbUTEtJBqhr+y0/E4MsHaB8wOacNdYc=; b=C1OAL6mEGviuEAxs
	qPhC7CeJo41meC73MTRrgJ5xqJZqKndArGpkOia3oXRu8UZzVAmQ5d5lY0IBG+NJ
	/2dBEHsbOuEt6lbTx5PJzGiWfuA8CBmIYvib5IqqbhE6rtmkqsIiqb+hPDJKgVWl
	t6bUUsTXmaIEG+kg4V9vTUr42dRFq4JWrm7yMr392GjpVhXnDWlpxyn7ys20/7QJ
	76yxYzfgWL9mYuI+Qy51T8k9JEgLN//W16KqnBUgTYqzkGLhPerJdhHb+7Ds4CJj
	D5nJhngaXK77joPRTDmLAwZWD7K1uJvspbzERYn2VC16jOWD1gt96NO0pgShto2w
	l7Drkg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u6g0kx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:40:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92eebb130dcso139691085a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 10:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784223610; x=1784828410; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LCSRMiF4nIJHNbUTEtJBqhr+y0/E4MsHaB8wOacNdYc=;
        b=BgqvuUcKViIPA3nL6+fgfSbcx6AhZMatlg/je+BFKgNdOe8UVFBXoGsmi1r61p9VJR
         8LbhOXfL24OZqkka+fZYxgvztub0XGFdHh2k24xfPtROe2GseBvo2ZBDSYbwU42UwCIh
         XwALw7CXBBAbH12pVLmUasMREFx/sfknA4aTMl8CJrTEgNIVOz5QLb5KZrYo2ZYCQv1j
         qb8UZ/DO4BRtM0j0xDYhgI+2stKi+gzkHuFmhFWIwu/pCKrEfkaRQrlE/0TRLexq03xV
         hF+sEc6EuSzvrmo0VVhWf5X7lC/mdDs2Fo51y4uXvERGKUrfGmfSFwRruoZTTA6knVCW
         6E6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784223610; x=1784828410;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LCSRMiF4nIJHNbUTEtJBqhr+y0/E4MsHaB8wOacNdYc=;
        b=Jurrl4Ae+vbcF69tdE8UuzzNqrNwIwYRAYAvTmuQCZegkEgAQysswWqA/kaCiFktj7
         5LMQM5pcTz7pwg0tkD+d7znr30eFXjnVXoDk0nGaPOX0dEwzmdlq+3JGLgGVeshArXSr
         PSwgG32KN4VXSrcCpdCFkcplgkxyZEJPI124mZdFCfIBfW5JyUWJVhEzsalRDULdWmL9
         FmnabVT1kqFb7Mn5+XA7b1mbLgKisQokKf9J9lG7ZyksTAbRhfLEonBlNyziBO2HJ/hq
         jFk1738ZGUdLMWE234y13VnM3/9URiyuCWOqDL09RkYOjB1xxnQtZdLfcsFSrqJJWNnr
         NA6w==
X-Gm-Message-State: AOJu0Yx6/9GByEuS+1h1lkd7d+66DUbwGD6Xv6O86PhCeJMuat2mHcgX
	dxfUNjFVoMNxOSSHfVrpkvsx+aupsIr7/QzDmV/ODHuog6spoV5Nj1rzfiDa9QC4fGyXU27g0GS
	iQH+IY+qLhCj6J1pg43PTuNP0sbVU43rpRt5vgF8qT8dmDreBZgqJMlCuBqyuFsPyAuJh
X-Gm-Gg: AfdE7clPbEmR8DCEHamu/Vv91ic/wRsWRyyPfiNIScnaT6kBMchIfs4GzlzzcTs0MAc
	4K3c2DeQhn1v9ug429IvO2rtv1IPMXC93qTde39GeVqwTSX4t4bTDUhJcIvKtp/dyBtuXscQfRl
	/Y8/riHy4s+1/JeB89fdRTh4SJPwxcXfjSzd6c3TcTMca4hK8HiL4bQ+rIOAyEay47pcQXn8kbu
	QaKSiDc3tik0G6tYHCEguePXvY2ahE/Wg2pS94kjLA8J9ApsAVHko4o902J7Fns7WkWR00ylro6
	ZEzCoN0WUJrrRRWQmd6LUaT2VJzRboYRqIP3xkj0Ai0R/LZvQXWZaVgIeke4kN47rIPc9kCQ3I7
	GPNPXVxWZaexhLu7AatCQY4E1
X-Received: by 2002:a05:620a:1992:b0:90d:11b2:80f3 with SMTP id af79cd13be357-92ef2c4c04bmr1857740385a.7.1784223610117;
        Thu, 16 Jul 2026 10:40:10 -0700 (PDT)
X-Received: by 2002:a05:620a:1992:b0:90d:11b2:80f3 with SMTP id af79cd13be357-92ef2c4c04bmr1857737585a.7.1784223609678;
        Thu, 16 Jul 2026 10:40:09 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1687125a5esm254590466b.8.2026.07.16.10.40.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 10:40:08 -0700 (PDT)
Message-ID: <606db992-446c-4601-805a-d86d0fb74110@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 19:40:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: Enable USB controllers on Shikra
 IQS platform
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260716-shikra-usb-dt-v3-v3-0-13f73a0571bb@oss.qualcomm.com>
 <20260716-shikra-usb-dt-v3-v3-4-13f73a0571bb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260716-shikra-usb-dt-v3-v3-4-13f73a0571bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE4MCBTYWx0ZWRfXzbQmaAnDm8Ks
 Dkt3ohQtRpdIRwgF0P3kb0VA1UF8lfmdnFk2DQoB+JQ6O9IlSGw3EBL5t+9/tiFjjpLRHPANFav
 EQwmZSBZ5AkktcAVirfxyw+67uArjkK39ERxcahvhtkn7XCzK2645SOacSIgOnkzQzd7uAgRrjo
 jC9YbWoW56DEJFZCMVbkfVqXV6EHPSuMh1vp7XizU6elnX4GJokzP+IRFaa1ekv74RNbOOoBtlV
 S3bWmP1n1R5DCrK9KdRzD0VRgvhaa6nB9idAn7Gi8XmMRNHkFXvf61Qcx5zirhOOsqv3kMNP+y7
 hyLNTsHEb5m7ySG1uM9wwEE+tWPeuUaFP6Kl08EPg+kqU/9aUW93ZZXY9eMEZ0c2DNHeUD4cBf9
 FaSYsuN597W0+ZuSo7ZTJbSahkhoTVkJamNjZgFZZP/dblHVYn0beVnlXUFtTBL6nBH2oZsGrQV
 7cM+i5FFgOXXmj49j6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE4MCBTYWx0ZWRfX+mp5006Kq+JB
 3yW/aQhene+g7uITMk4GggWV/ptN0Zt+RXLdjjMejBZDaYnqdU8ACi5zvrIhH6b5/ByiyJ8mhsk
 33Fne35E0OG3t/wT95gDZ9Y2VkAbxxQ=
X-Authority-Analysis: v=2.4 cv=DYMnbPtW c=1 sm=1 tr=0 ts=6a59177b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=NKjDTbTdbK9Woghm1DYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: NHae9opxDE7rodyfwhSQG70RNC4twg90
X-Proofpoint-ORIG-GUID: NHae9opxDE7rodyfwhSQG70RNC4twg90
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160180

On 7/16/26 6:29 PM, Krishna Kurapati wrote:
> Enable both usb controllers in device mode on Shikra IQS platform.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 35 +++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> index 3003a47bd759..2d4e34ec3b82 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> @@ -38,3 +38,38 @@ &sdhc_1 {
>  
>  	status = "okay";
>  };
> +
> +&usb_1 {
> +	dr_mode = "peripheral";

Why does this one have to be peripheral if the other boards are otg?

[...]

> +&usb_2 {
> +	dr_mode = "peripheral";
> +
> +	status = "okay";

And why do the other boards lack the secondary USB?

Konrad
