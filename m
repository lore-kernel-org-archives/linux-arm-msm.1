Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A061E4779A7
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 09:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788255929; cv=none; b=oayfJOfnLoR7x5T6Z6+vWzIhjeRzApCJJ6LTVVj56iPX+GafsYTf3az/xD0LDu+58+lqtYbW2xVXMj+6PXJGFEgp123Zd+7T/Xf80ftBVBy4cRUNc80Y9Pm9POg3pA4NZ/ZBXDxLlPxl4RNLCJa2FkUCYsC2rBEHNp41PuYMYH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788255929; c=relaxed/simple;
	bh=1zi5QMlOCkuOHVQwes0TjXYaa7cgVBDSdPRT3fzLWAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SGoapdQ7CqQUEDXQAKSifGquuVPbeIWPE7rk/tkxBeadLQGudg4BzV/9cAtBw0qWeWd6gLxb5soFtJi5DWzgODZdPgF4znBWyJNyFivB1poYCrFRyqjoub9WrwR0rUCbMPO6eoK9ykxW0bc/l9kd2aE/IKsWCDT/HtAPiQf7mH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bCJaobWx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hu4aTjL5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bCJaobWx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hu4aTjL5"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179QAd1811488
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 09:45:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i0ClDBsCuyp7r5dFcBjSy61A/vo3PDsjrynZs0Zn6uI=; b=bCJaobWxg8aGVFvu
	IsHHsXDLKIsaEG8oxHChmUrDujzzzCEHGEJ2TteU9kosbNvH5pvaxYvf5ZYVGerM
	uXUs6oKD6fk8+A7AbHIAE49po80n6zPX+2l65n/rcJh3pPnAq9Mms/aMfezdYYjk
	j9s+bY0HBzo6fxvywXqp8VagroUUsgCav5uAym5ync1xo0dBTLHAQmsu0F3Sts4U
	FtcNFCTDp4bFrXEa6KrOlfOceWMwyywnn8Huny789xdRM/F0yvfK12aDj1/x63XW
	EaJh9oIM4eJ3ZQKDBLT4jzT1sfloR8JkhQxiEyYqd+P3LkjV7mr9JXPbju7dad1P
	rPX2aw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdd4dv5kc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 09:45:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-938fd633df7so117386685a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 02:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788255924; x=1788860724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i0ClDBsCuyp7r5dFcBjSy61A/vo3PDsjrynZs0Zn6uI=;
        b=Hu4aTjL5PGauqylIhBfeLAilzeUBu14t4ETSSmaC7XngLWMNsRbmVEqxcb9pEnQoQQ
         JVjDQ2vyg66tGWtlk35jSj/LWlVPdSYfFWvm4xCZuS9y2S14pbaE26ihER4BfsGBSSyu
         97R0ZxwUCDx9XWXpatNHlAT3MOWK944LadAdZDtVRQnRR3VVvWUYwSrxa7PADQgiC8Ta
         ToAXs09+w1Q9cQhHPtYqmJc+0Q1gpoIXVRVC9Jc3Fgykynd6k7zh8wziLGExtOS3iebg
         rN9ngjPS7ygHtl/i3icRfMHk+xOVQUUxG9wiW+NezcqSDJrv+6pZkDgovZcxthB+2ITb
         BvyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788255924; x=1788860724;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i0ClDBsCuyp7r5dFcBjSy61A/vo3PDsjrynZs0Zn6uI=;
        b=CiivdWt1VxyMT2h/h/NaOpe7mEo8x5GmSueokueV+YxGi+Utv0n8xQGvsTqEgFW2Ec
         01/XGFVcjwpsQtCdq99Hxb9NYzNc6MA2O/393KJ6zfj5m57r0lTF797E+3LviQLdkL2M
         PI2kQQY0sQbpycVEaB/Wih8cYjTLdQ0nnFCv1QUkXcHvuyL5Y1614cyyFA2iSQ03VGaE
         U92vGgBD1pWRq7aRe2Gm6DT3MNozoyVpZKTXbSKUuDI2u4GCa8Iiscwu8fF78i6vsC6l
         +Jw3x10XHfomtHFu/N71MKLza0LMBzIztrrN3/OrljWu50YMHgii/M8OIIFd6d0sf0hq
         QCCw==
X-Forwarded-Encrypted: i=1; AHgh+RrQoO30JEnbZEG5KfFzDojd9gmhF49qLHr9JfjHjUYv86G/jC9uNpclEd/UWmcd6hGA45/zNU3dSgIVy23n@vger.kernel.org
X-Gm-Message-State: AFuF++mDm7JsTTULTk5UMUU64wkjQfd1n4Mc56ORWT7ccRLJ0v4wA8uR
	p7XSKiAZvy7BFO1ubPDF2cl7/Nv/vfKs0Fs+Zw8k3UDCQBYxNBPwh7Q+cZM2Sb5nF+gnhm678gL
	uQ9aOD911htA8iggncbU3Ow8qEjO2ULjdQiQjd5JJwxOIW4aNyXh9bfWOHc/UOI3cndlL
X-Gm-Gg: AR+sD13CXvhN985uLceN9gSQjui+KVsAsffowW3IAgO9TiyZLKcYoKzkmHa3HCyrtM4
	4dID46CMSqw1Y5ya6h1h/FOkMVsQH6jzRkeCnMZ/bwH0uG1/050SFPcY10B66KeH2yw0ry7qK2J
	97aJeECt1i+pvthSQ8WNsl0s1pfu2MmMC/Q+s3l6R0+ona0fPUNAMfF8do7VCO+5hvrUc9VYuwt
	w+dWjQfDJwF63UmPoaxQ3pHsqI0p136GQXuKk9tleux0NAMPUOmJpkr34A/v7opNDyj12OuEP82
	e2uTFR2dQ5sSS3e4rsObsjlRPxRoIzckAMbWcLJisO3YUWLexjC6H6/7ekyvmhVsnARNXlSw9R8
	qUcG/qN26eb7uQOjlQ/wWwQ==
X-Received: by 2002:a05:620a:8907:b0:934:95d9:85fe with SMTP id af79cd13be357-9392877eda5mr1438612785a.3.1788255923660;
        Tue, 01 Sep 2026 02:45:23 -0700 (PDT)
X-Received: by 2002:a05:620a:8907:b0:934:95d9:85fe with SMTP id af79cd13be357-9392877eda5mr1438610385a.3.1788255923169;
        Tue, 01 Sep 2026 02:45:23 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f273e8bsm548705066b.62.2026.09.01.02.45.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 02:45:22 -0700 (PDT)
Message-ID: <5f074823-8448-449b-94cb-ee98026f2612@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 11:45:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qcom: m31: propagate reset errors
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260830131442.3025-1-pengpeng@iscas.ac.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260830131442.3025-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=b9qCJNGx c=1 sm=1 tr=0 ts=6a969eb4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=oSP5u9ADs2d8oolkbGQA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NiBTYWx0ZWRfX2Lh7pn/jz1Fj
 Mpgd6u41oIFrQyLUIs14sorEZ7D/Z98YV+xcmGRj1TbBdZvL4ctaStNohUdhw+yghayvtx3OQUh
 wsl4oAhjiWMCQV8U3kmxn5LCC9CFDAjpWtoedtN334NVohU4iYmtN4o/xoxVakKggCG2RAtHsmo
 xQUAD467LVnce0AWgSuRXIaMdzZWEPXTkPxiIY83eh8ZWXjaUTUyqrRi4vNp/J+C1GBJDVs9fUj
 grnsuODeMVDQm3pcRn8QPaa5lxGTPt3mT23fsZmwpDa1rzR5LFbLyYLATk91o9bJvELomOKhqdx
 OYoO4dR4VQ+fegREwpzd2LTZidSnZsF0VNLvSj6IZGWdbACF+NSrl/szvF/tJxJkEO/gxW/IGpZ
 /uugLfyxb6/zEWS3YowbIQEw8Kw5FATLCaobmYw5BNM37cCskpbx61aDi69oiEVUuWhnpOHvdK9
 D4Nf/cKodR0nkZ11JmQ==
X-Proofpoint-GUID: tJYdenPDcPpmTTJi67myaJQVdpUd2XpV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NiBTYWx0ZWRfXyvmx0iEOAWQp
 RHtLDmtumpOgdn6B9z0Y9QTAGRIdBzRx8t9VYiFU0O69vWl/YIZoFMaDNuV3Flpb18IsJPjIxjo
 pbSGVXpVDe5Xd4VEg+DPZB08celP4Sg=
X-Proofpoint-ORIG-GUID: tJYdenPDcPpmTTJi67myaJQVdpUd2XpV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010086

On 8/30/26 3:14 PM, Pengpeng Hou wrote:
> m31usb_phy_init() enables the regulator and clock, then performs an
> unchecked
> reset pulse before reporting that the PHY powered on.
> 
> Return reset-controller errors and release the clock and regulator that
> were
> enabled for the failed power-on attempt.
> 
> Fixes: 08e49af50701 ("phy: qcom: Introduce M31 USB PHY driver")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
