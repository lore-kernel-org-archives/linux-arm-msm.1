Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644AA248880
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 14:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790517678; cv=none; b=kZRXQ47v3uev4ShdPtduZnmXK3pvPYbPTTMjSyrtYHbEa3eDSu9lu4CAIkj9eXxmkEXMTAmxDY5clKo7npIkZhQEYFMRuruibDvDcwBeWp798V1LJZ3Y74EqIUhrdzsP82Qsgu5s1Tkgpgb+2kuDSOfqJq7Vx9cykOf8spGCte0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790517678; c=relaxed/simple;
	bh=Zsk8ft04qdvSEdnEA4d3lHI/L+Z01W2/XK/UnHgaOSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qTkVZubiLO7m7OK4PgaeRZKPSaiO5XVLUNVyoUb7wOltyFIPll+qEsqn6RzQuxLAIlf5LcgqTnDoPzsPqyn2Lkn/8EKu0dDEPPDB5CDgc/9SCwh0CsSsug+AFL+XeQ9FPHoYNk5j7dEgbi1Oxx3ygdrMHYh81lE0xOdthq2bcHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JjNyiWAO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JglR0gEv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JjNyiWAO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JglR0gEv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QGxUWB4013973
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 14:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	32qSM6gqzXQy8rRCohGgscYGvz9tnM3yqJODoCorV24=; b=JjNyiWAOByR6I3a0
	891btXWw6iBzW1HUOVP2jwu42IVDOUz+PvRzocEzuPCJzovQidketxQn8gmwEik3
	TWuOJDp40dyQTqwNh3tz1j0HAlFz3Yef5qI3/ZlYRC8x05VS7Lc36FSUi0xOU324
	LERLxFnE9du5IhdTys6KRp9lViyhAPtUnXe5NjTOp05jvOQn6ZqiFhJ9NiNAnH0P
	UVdLJmdpfcM7BZFZMY4bQPQOLD6BkeXMDsfRJAzle+oaCirE8sBfPK90YcDdk8PX
	FrMZIcXxQQvcGz8qI2NySX557IWKBJ2v6RSQuV1hBPfcrUOjBSdDVz7+fox+C+fq
	/hW3DA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx6tejys2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 14:01:16 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3437d0cc8c7so2058851eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 07:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790517676; x=1791122476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=32qSM6gqzXQy8rRCohGgscYGvz9tnM3yqJODoCorV24=;
        b=JglR0gEvcysi3rUV5lOU39IquC0z+1JSE+IVTDMbslANpOLWd4dbOdsJ3uUBbCUfP1
         cVcUulVl+CG5AjyX/+SqQGxKiUjlm9Ir3B8i4ergHlX9vOdYT+uVibj90cNruQ5DpyuF
         PsE0zpp2LkD+VkDUMyCjOv6gNeQtPRGco/Tign+z+EfBHkpSAti0gp53Fu9X7f6HNo/h
         /dY88sshumIZQnLJ4jRE+lXbB2XIvVIAXOD4gLHq+V9QsffwxqONHeiPuk/R8eATrlVV
         8ad6VZFcT4jL9UzOSWB4wqljRlkSJXo/fxphrRZ7gxaPYqrjCRUlGqtHO9xz1fvrN0VG
         F+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790517676; x=1791122476;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=32qSM6gqzXQy8rRCohGgscYGvz9tnM3yqJODoCorV24=;
        b=2c2BpZFz5sFGntVwOO26He5E5XuJd94iKj81iY4/RJtJdSCaYrrjUpUNJRSiuuC2Ai
         oQd5sEZ50SyTFvDR5WBKGRNQXulHLJaFIN3RbQru91pisjoAOWQZ02dL36XyXPF/7+eI
         GgCK7mT4xSJgvYjGFNqyYyWtEVjBJBK8C1fDAaaj/Pcg1Bis5unEca8mii+Jic9C9DTh
         D90Qm3P2tMFTeCRE8BbMdEVRv+6jsyxxCaoo7WxRddZaga7J9mUyt0nafadMOq8+6evr
         69Ky3mzd6xh+QWMEigeHFIhVzAYG8zwU0k0GtaaGQNMyvGbLHgbQQ0ACx0iMvZztJpe/
         j3Cw==
X-Forwarded-Encrypted: i=1; AKwUvBzN5KqwhclwYkQmqzrpYhH0yr4I9HYbYF6kUBMMYCABXrKm/oEFi756tptL8NPyjnctS7vOnGZMclDUkg6Y@vger.kernel.org
X-Gm-Message-State: AFq9FYKpJEpXs1O/wm5Y4euKcV8qvZAiONNqvQoXklYZWrc/y2TXf3oe
	dsR0Q2tGcl+DSAKqUetdqHirS9DZPqOZPUT7sDd6sSZS+BLVGC7xdYER5UrtgMdp7RW0VXXLmWr
	tIO39NIPh9GeZAzOcFe4gXoj0kCyh8dH9m3NsGumUSaPbB5QK1BP6R9Y2S22mXAgkuBK9Mtz6Oj
	/S
X-Gm-Gg: AYBFou3ILJwV2S0heZEYhgbgDtXHx6EGAbE2pQwZ0BKhdPU2mF4qN/j5uLg35nisi46
	e2tQqE4B3TgFxvZXzIw3uaUbzXIa+XTIfZPoVKbMg1wmQmSFO6C+cFkK2NHfMvpNXHg5lGhn9qN
	U0amWADKfLNCsxRXcTQoycie9jeKFOACa82X7XM6qlXA1SbTZZ2bjZqCdmdQAEWdP04HpSlBX91
	OUe/aSPTzbcO0+12aCF/Q3UgGPIqTEWh/cAfpKoKD5HoIJQBX5YA1md5toLrpK7VH0OsFWia8xG
	s7/zDxP9ISHFV9eSt8XcgC2dz1hznbPUJI29NNv6naSD+UoIw8no/iawVBN4NccfhOq9ttI6cW2
	G4+pTYGSa4ZXEf6pKFVrBqaDeNZ6g5F5oGWf7qN4sORg=
X-Received: by 2002:a05:7301:b05:b0:33b:e842:d272 with SMTP id 5a478bee46e88-342705b97f5mr6074700eec.5.1790517674498;
        Sun, 27 Sep 2026 07:01:14 -0700 (PDT)
X-Received: by 2002:a05:7301:b05:b0:33b:e842:d272 with SMTP id 5a478bee46e88-342705b97f5mr6074660eec.5.1790517673774;
        Sun, 27 Sep 2026 07:01:13 -0700 (PDT)
Received: from [192.168.1.8] ([122.164.80.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3433628f5basm12850921eec.18.2026.09.27.07.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 07:01:13 -0700 (PDT)
Message-ID: <fb7b898b-441b-41cf-89d3-1d513730a75c@oss.qualcomm.com>
Date: Sun, 27 Sep 2026 19:31:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq9574: add reset to SDHC
To: Robert Marko <robert.marko@sartura.hr>, andersson@kernel.org,
        konradybcio@kernel.org, abelvesa@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr
References: <20260925191706.1579990-1-robert.marko@sartura.hr>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260925191706.1579990-1-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDA1NSBTYWx0ZWRfX/en7yfFeBXRu
 IBH/y6opHGaxe1MP3fNCx4ZYCT/Tz6zfA7gPXKr9zFN+4f0CKa48MmlfuJrP70klxoXP6euOeeO
 18VkQIZdFdJN3Wn+A2ULukQ6UzMHeYyYoFsJ3nOVcyE7ptAJ0eTwLY83uOqmmAA5jVj03UYOT3z
 /QgO1uUyjKGy8m/G5ZeOtNY/31DS9tsXOJePWsHttkNmHftn+qaONvJ06NvT6TC4exPGlXq2abP
 8jDYUTaQLDBhuA6zm4ZF0/Lh6H6UXLzJXPxJGGPcHtXlomIzJ8s/fANSdPBytQj3xDsQglDw5Mi
 R7Rxams2dJkoRsDJyufNpUZWaN/fe9PIKh89PCUe6YnwGelSRomvtSIIPsJrBl1+FH6xR6ckiCk
 r/XktDxw8ozJullO+xwCDF0Rc5hryGf5njwHSiWLLCQfzSluCLn4kP+YBQJE2bq6o62JjzhUaS2
 COtCSZPtcwCt2PWxGUQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDA1NSBTYWx0ZWRfXwRkSBTBtONbK
 jUsifdzlUJlKsiM6JaiCUUgMxLqmjpO9+skPo9f9strzO3XPTj9SM/Y15mBXG1QJCFmh+3mIsNb
 906hb4Ylsjk6OqYn6B6iNn/EjB4hp28=
X-Proofpoint-ORIG-GUID: xvneSqR0ry3y2zQGDk98dHwo2JZsI5JO
X-Authority-Analysis: v=2.4 cv=X9LHu2Te c=1 sm=1 tr=0 ts=6ab921ac cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=M4XmOyF+KGVEWXraXaCqgQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=EPIbeGyanE4VvX7pOL0A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: xvneSqR0ry3y2zQGDk98dHwo2JZsI5JO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609270055


On 9/26/2026 12:46 AM, Robert Marko wrote:
> Add reset to SDHCI controller so it can be reset to avoid timeout issues
> after software reset due to bootloader set configuration.
>
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Reviewed-by: Kathiravan Thirumoorthy 
<kathiravan.thirumoorthy@oss.qualcomm.com>

Thanks for submitting this. Similar change is needed for other IPQ SoCs 
which is in my TODO list. I will submit those changes in the coming weeks.

> ---
>   arch/arm64/boot/dts/qcom/ipq9574.dtsi | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> index 5a5bda5f21a11..ecafd4cda6e7a 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> @@ -471,6 +471,7 @@ sdhc_1: mmc@7804000 {
>   				 <&xo_board_clk>,
>   				 <&gcc GCC_SDCC1_ICE_CORE_CLK>;
>   			clock-names = "iface", "core", "xo", "ice";
> +			resets = <&gcc GCC_SDCC_BCR>;
>   			non-removable;
>   			supports-cqe;
>   			pinctrl-0 = <&sdc_default_state>;
