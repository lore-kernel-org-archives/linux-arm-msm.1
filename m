Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411A73DFC6B
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 10:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784541916; cv=none; b=sc1xsTNQWEBIXR+10p8NQR9e06vBS1cFxrWiRLY6mcna0QNBMPEbuQhmsO3Zu6KbFxGPuHRlCo1JPG+rkqA3URPL/jyO0GY+iHo4liwYCp+YlSyj8zeOcFz215UT69OhDXQNL7vVrdw9/82YQJ9vGrHgW/MJ7Db5CbDYXmLDwwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784541916; c=relaxed/simple;
	bh=EXKzX4auN7KbUG+4b/TU1NgR6KJj8OaFiXl704YPn4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CX3+Rzd9PfKYiG7ro1lu4pMC/TDWweXkxgORnA1fbw3cS5zpIifSpuScHOSAnLlYF1qZLixfC69+oNpXRxmILl5gVp7qAn05y9izE0H3NaI1h6Z9EW/RltJSf4r+gNxigrDLo4DiX01w8BiwpyS34IkW5wl9fMuuQDucHYBl1Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cxx75qI7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CVe6HraR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cxx75qI7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CVe6HraR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K9vTkh2282410
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 10:05:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cyGj4iSz8dg6Y4WZohMUfDMKW+MFsoJuC37oF6DP46k=; b=cxx75qI7pMirYbMs
	VHg8XFripNBKxH4gHzTdnk4XkxZkLLffFo8v6JEAdklj5NRK3r6HJiaQFm6nixy9
	+oqyxtSmK569thtVbUuG0+eHY5uCETLEqcFUs9A0D5xMO1LX5fhPqlU+44MSiBeI
	fKeiAHkWq/2GcWsN8mw8lLlzR7+nzWwbzQKjROTK7X6+9Sty7EbfwWn92Q3TiCAZ
	/qJdjL9qnjZictcRe/QNSbAazRj84XVNVZP/qqTFHqqhfHvMVlwF4dLugcydqJ5x
	ERQeU8DcNA5GoTC8e5ZdVHjc9adhXJfVS3w3U7YtHO90ChbXM7RG0VP5zAywpjAj
	PzpZZQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfvxghw6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 10:05:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e5110c89eso215352685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 03:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784541912; x=1785146712; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cyGj4iSz8dg6Y4WZohMUfDMKW+MFsoJuC37oF6DP46k=;
        b=CVe6HraRq7ULuRT/roQv2ZnazgkXhHXpr8Vmb27wl2qchLS7dns6BX8S+dOhfSohz+
         HmQQwNqDwpunT7QgEDcYmXArFVUw2J+EbTmPVfmiGZNyU7/S4wyFvPdNHAg47G6DLUHU
         rS07BJZPeaBrKrzGehSIwt7HE4ntj+L94oUF6DGfwjgP/L+VEy8TNODoWxaIy8nreuq0
         p12aoLQQ0UYq00o53n0K7fbo1aD3/XNIMjMmb/cVDf8UZR6ZEIm+QguC3UsZ4Ycs8IXh
         vMo76Q5QsAKfywj4AwedXzBmwh5f5Wsfa+mNzQg12yka0GXpbKELp9H/jjqh2tW22SYx
         qk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784541912; x=1785146712;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cyGj4iSz8dg6Y4WZohMUfDMKW+MFsoJuC37oF6DP46k=;
        b=jGLXq1mDgG5DPrDY1zBaYuBd/ICfwlGdfx/bFO+DR+0EZQ37cls86c8znIIU+j8Y1E
         CaGlWsbyrUP8M26zvRwUpoJZIZw//G4hUz2TxkBzT50snYQGuGhKKNJiaQs0olWZhjzK
         PwGTqX9T4OR/aEouacs9QjhYyRe2udgiFviwgT/aHhkA85av+p9cCmFRfw/sGjtK/qft
         fl3h5yMbbfqHH6735ypFbf7r3uwtTtJ2UWqHZcgpXMmpJyBhKnwjMfgz9i7weIl8e8ad
         sAOpjB0il1Xns5soZXCaUpQ7ipMXTLhfx573Zu0l+kXWeB7j1pPUcjZ9fh0s6qEFxf+N
         XjSA==
X-Forwarded-Encrypted: i=1; AHgh+Rpd+ZNiP39+7QThLoLSvV4L6yqarqb5aKTO+5D4VSsnwol4yTwQgMJJHl3NnTq8n3pfmJW/JipBFD2GrEto@vger.kernel.org
X-Gm-Message-State: AOJu0YzfYfoEglJBi7eeXVcruSVyEVzGm6ViiEfPcYtXO4ZPxtlythED
	dvLdRZQ276d9vhx12zXzr7cmjU0gV0WMLFYL2TQhZAr6/xvxUl1jotAhGT47YaSGVh51nWlQCHL
	InG/bHr/GbVaxIn6NAR0lrwSzErmupltrcENygBJ7bg5c9Nz6NFb01Xevna1y3revw+CU
X-Gm-Gg: AfdE7clkJXHrlnOLcA4inxi+Nn6qwjBouX81adpno96h3Dj0O7aUYuTFQ1RYA+6fg0N
	ysr7bBf5g/oyGYXhq1nNXy/IgvRQ68FZD7EYT6fXWj3U/ubB2uC7E2K4grhEtDniHPvMr8bzJmu
	BEOUn0nSVkIt/oO+bMNBVEHbpvq9Gt/QR0NCbPe5e9rMXd+S6i15FdLDneNExwG1l9y+Ldn6Crm
	KfUiG3+7yq2sec2OS6w1jM2g+SnHrRbbjsnKT7lpPzRo1f0s9pO08HU1obeIfGZhqExDYBobq6h
	B6enDMhmNfiBS2vG5TNhfVdCRJfS53PLQvjSKAWB/n7YfDfox7CvdGJq8RcZxL3u5WCPDWf6pRI
	feI8CFJ7jvKya+ylxDyhRyVbM
X-Received: by 2002:a05:620a:390a:b0:92e:705f:1626 with SMTP id af79cd13be357-930b41e4811mr1167530085a.6.1784541911689;
        Mon, 20 Jul 2026 03:05:11 -0700 (PDT)
X-Received: by 2002:a05:620a:390a:b0:92e:705f:1626 with SMTP id af79cd13be357-930b41e4811mr1167527585a.6.1784541911295;
        Mon, 20 Jul 2026 03:05:11 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c16eb80bbf8sm440292066b.0.2026.07.20.03.05.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 03:05:10 -0700 (PDT)
Message-ID: <98b7d242-95e0-417c-a9cb-74aec76dcf0f@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 12:05:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8150: Add slim nodes
To: XiaoYeZi <qaz6750@qq.com>, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org
Cc: conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <tencent_DF2E181B86AC588DD7B70DE904F6670BC207@qq.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <tencent_DF2E181B86AC588DD7B70DE904F6670BC207@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HKLz0Itv c=1 sm=1 tr=0 ts=6a5df2d8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=S4-uF_5N94cv6VFABswA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDExMiBTYWx0ZWRfXxWwKxjMTGd67
 V7fKLEwCbc4PcRlKgJi5zPuEjtArbLPRUwZDs9VSnoPpAvxCLebs10/80FIQ+PRQB071iEsQUx+
 q+kj8duUBxWKMrSLFsLtWLgKy1HIRDY=
X-Proofpoint-GUID: LQSPU9FquB6pflG73vYIUIo-wQ-ylCTM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDExMiBTYWx0ZWRfX1ABSbZEdAUyn
 7V/rTKxZuIs/+Kahhg8h5Jao8zltP2AZjsqOOGnSz+DGYZ6hZe6nNkRFYp58rp0Cysp2N2yAgNP
 YURyb1LoAdvTQeXl4fhyzb0Pw+22kLMiMdPiH94xeBUf3sTYySmVlJE6zzlvYzGMrjXabvcRew6
 bMwKuHvEVqjgG9LsMULWKwxdp5pwX0e9q2S/pbijQnLsVRCv8z9g/XLHC4Aj7V+I8Wd0VRBlyHn
 +S/Wf3924djP/36OZm0pUVIA6aK1qKul96y5jFA70JliIPl2Tr+LOPM1qcGj03WS8Bes5ts8QAj
 Ce82Jj60NesPGlqM4yGD1VSGfXh2HK8FMxfjB6gj/wfWXfpS2nEr4fuUukb6/52fa+curXM0lna
 sfNZN/Yfqc5HBE396QwRmwT539SEXn4S8eIknWEtZRF5u1G1MjCJtFogtu6UfiE0EjXUVoEU6o8
 96lEY4ASgTKsrZI6Ihw==
X-Proofpoint-ORIG-GUID: LQSPU9FquB6pflG73vYIUIo-wQ-ylCTM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200112

On 7/20/26 11:33 AM, XiaoYeZi wrote:
> The slimbus node is an important node in audio.

That is true, but this is not a great commit message. Please
check out:

https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

[...]

> +		slimbam: dma-controller@17184000 {
> +			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
> +			qcom,controlled-remotely;
> +			reg = <0 0x17184000 0 0x2c000>;
> +			num-channels = <31>;
> +			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
> +			#dma-cells = <1>;
> +			qcom,ee = <1>;
> +			qcom,num-ees = <2>;
> +			iommus = <&apps_smmu 0x1b46 0x0>;

Please assign the iommus values as the downstream kernel does, so
that all SIDs meant for the OS are assigned

Konrad
