Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867395;
	b=p4NIAQWmDPCNuE00ktNhpPZCnLvF2vwNMzbk+JwXm4yaekXrCe4FGhomdsBURJ0l2EpT
	 PqeDw0vx4CDyleYAhDuV/YdnMY6dbURSLQ49nfAZQaHtx6vZlThqHkBNonZPAM47v+4sr
	 +zgEr1JfC8z4EBD7/gi4d3kc13zPknjKbMVMWvRJR/iwBo9fFNN0MRb/YtV/45hjsEQny
	 saIIYXmyoTojlTxx/YWzCmm2KWWWWDESbysRYEZfD1MmLFTNijZ0brg1v8Ql5BzfBaEXi
	 HoX0ANdixnarpDMJpSgRu9RLS9uq9s+MmEdZXjM6IE6SC1Gna0El8z0rwgoAF8KKKfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867395;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FMGEReJTj+oAHaCArndjVTrwh1iXUa0fwaYYB4jT5wI=;
	b=vetYWBrTODjW2n76B//GWVIFjwLCbVDVSu/5ZM/pdLfxguOFeOf+AVuSS0E7S0iePecI
	 5N09cJxz6jnOGuzOzqSuuyW5z6bwMEgiK1PKcmwxSKsVjIqS4piFJFk7isq4UfEi6SXv5
	 sExSoTWxqj9c7q+dpPX0XLSOw+owlm+uhQXqRmdJBoNq8HiIhdtx4MfsBZrktR7YSbCIY
	 zkQxWqsY4b1cYYTTelXIAohVQnuU5ia0GSLFbQHbSoUbicFAlpvjiv0kWoaXRLvfsP+pG
	 ehEa2Fek32F3IQCebg/pCnslNjKTa3g2+h1h5WpNcL88eRSls4lkW8L94bJC+tCKqBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p4L8Q8px;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R5vfObo0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7756606A33D
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 08:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7756606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p4L8Q8px;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R5vfObo0
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56TwFn4138303
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 08:29:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FMGEReJTj+oAHaCArndjVTrwh1iXUa0fwaYYB4jT5wI=; b=p4L8Q8pxyOPFZ+ir
	eqN/r/lNwi3swCV84aPKoqPV0iwM7IJSMMyMI8OCd1Wld/OS+BWIk6eRpz32L0hM
	1ciTqMhj3+L1LXWzOnLj6al7CGulHEnTjXJbVYkCLalyHo4VZUlsXCeifVkT8ADF
	2n0M+X2qHHnRYeNjLiBQRyWeFbZrJFPm3eKk5UJempKtHsL1VxYryR5EtFhz2bYN
	714qVSBbfHMmzzjUKAIeWSjzLChnw0JUODUcpk1m+nvPPMBrJuBAN2/o/tTPhUBQ
	w5W35zJeX+/hP5kQePdIlHv61UhWercsx9Iw4jUdgJAAArFq6XAOCBFXUy/u1M4s
	QOB+3g==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrm9v0htx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 08:29:53 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7bf3a0a498fso395573137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 00:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793867393; x=1794472193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FMGEReJTj+oAHaCArndjVTrwh1iXUa0fwaYYB4jT5wI=;
        b=R5vfObo0KF6yQfI7hbUgxpPjvH0euLzImtFk9AXBcZCv9C33dkogjgVFV/G3JiOQhf
         kPR7wCvtfq5pWBkRG0HdIRstLXXfh/dWni450ECVgTKSkUBYFyiZ3nuU8iDh6Ew2sMPN
         jNirDBwSXkatd7acwoqnigfStp4ltlX7Zn91xsW42Av1/au8NTY4RHIQCUndq5xyyn1I
         5NaBjKKIBSR8HkqqGQVx8sZPgycpIaNzGD1TSkym1WuzPWaYEpyd8iSZeldOxxaNKsrb
         T7r/SiVBXsHWUVYph3WfuI6TH0fIQNFydfAURJ8qpH1VNbw7DFZj+LDa99DanopD89N8
         vgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793867393; x=1794472193;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FMGEReJTj+oAHaCArndjVTrwh1iXUa0fwaYYB4jT5wI=;
        b=TFRgadyTCoGlmioQOki1oC+7WZ3X4fyHm5+FCN13lPpTxHvqlRInahHdzrk4yLJE19
         OpBbJnHjoEqmQGsasIdiRBouZtFzTqfq3tzeHCuyAM+8Ih+uWcBuPEZFqEqvmYH7aAfM
         SlcIV78zZfGyPHvGcZWk78xNxx6JblMnTloyp+3mUPujNf/p4lXh8flCn/Km9AZj6kql
         KLOZv9WgVu0hrs9WGnK/GCxUp2LJE9Mattq4RCAKmpAkeOwQXZOzRTunjGi/cpYICD2I
         zf8V3z208s7nyWIYwE7TSA8hiT/eq0gMGKbiL5Zv1+WEhbUvJgatE/34lqRlOJqzTFXZ
         Gqtg==
X-Forwarded-Encrypted: i=1; AKwUvBySxq9Cx6N7Pt5mes6+GhBRDStKWFyGSagoFb20nBlxeyhJRmsgNW6kHXNM/M3S/eMhbQ9SCgaxMX4u9H+7@vger.kernel.org
X-Gm-Message-State: APuU4Z/w/VwSC32iH3l+AAFa7ZYusueuU1BfxtJc8iFkkHOcBYYJWDD9
	m2X5ITHJSRWLQoOhmW0AG9UrrSSEo2LJM5NZznrle++EMIVMVw5YNG70Muy+pHit90sZv3JSpem
	7TwjSelE+jOTxBJkOr6upnTXVKtCnmc35/R5G4meREcTnwWQ7sPHpg8JvGgUf898XFUoq
X-Gm-Gg: AYBFou2XYwrG8XINUiq46UORIurb0lAQAhjHyXmlPm3zY/0ZN7/tBHd3yZda1wEt5Vc
	RjSfY67vkbc+jbM1hwA2r1qZzk/LnGglMXN3Dy2KPq0XdNX4NPqfzg0JmeKiIGK4puTe+fYapRk
	Vy6qlfgWYK5V3iWjHu6+kgA6xM9LeI1ezfUngTj4kSvbcva2z8iUTfI75SX1pAwAWna149Sbel/
	RZiGX/ljfHW4Unb2fC2DEA1K9C8lCcNQ0INtWP76aWHYJPJCzln+nJqTne3UacOClBsK9sCey56
	eKmqWrGKNZMiaNgQmghvWZBxJuMg2IwgfmEQ5FIpDcDQjxT8d0vqZqK/b2OKccgm2wuWNhqxm5p
	5Eb0rRKMWhpeqjKPwTcZEYZA2upCQ8TNPYpM3MudlS+iijPaYX/jOSCOCh398zNX8NOIUZy1GYQ
	==
X-Received: by 2002:a05:6102:a181:10b0:7d2:8735:49f6 with SMTP id ada2fe7eead31-7d287354e7cmr708753137.42.1793867392575;
        Thu, 05 Nov 2026 00:29:52 -0800 (PST)
X-Received: by 2002:a05:6102:a181:10b0:7d2:8735:49f6 with SMTP id ada2fe7eead31-7d287354e7cmr708746137.42.1793867392116;
        Thu, 05 Nov 2026 00:29:52 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecf8ef85sm9375427f8f.27.2026.11.05.00.29.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 00:29:51 -0800 (PST)
Message-ID: <5de385e0-1ed7-470f-a172-bc7c8762e0f0@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 09:29:48 +0100
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
Subject: Re: [PATCH 1/2] arm64: dts: qcom: msm8994-octagon: Fix side touch
 interrupts
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Gustave Monce
 <gustave.monce@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
References: <20261104191700.676773-3-krzysztof.kozlowski@oss.qualcomm.com>
 <31d38c50-665c-4f1d-b191-55ce5d38660d@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <31d38c50-665c-4f1d-b191-55ce5d38660d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMyBTYWx0ZWRfX/+EcZFLWJ/Dh
 nTLBqytgXHA4PO7M8aUEq032wJ7YbvECtDGfRwNN7b/xqoCkIrSqlaDh1RhEAzg8KFDiiAKXAr2
 U/Z8koELzHJG7jU+TbRmOapT78eWQ/w=
X-Authority-Analysis: v=2.4 cv=KrHYSmWN c=1 sm=1 tr=0 ts=6aec3e81 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1eH2j9bIuW7Q0crD8LEA:9
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMyBTYWx0ZWRfX0KsCO5UljIIu
 I1lGAaJTbiTbmRwKCDC+LwC0GNAk1SLEytzX5+qzunsshglc0+pBi4f9YIT2v3sceMIUi5OQboW
 cVbwQt7AtkwCtrEW6zh2bMM6whiayVhYSrUBwzgm0WkJnR4lUa6JGCHg2MFkJz9iUGfs3wFX8eT
 bLqfg89Qw+CDbk1USixeqVwjIPT+uRPKgPaKk4E14s7oaPgACzDh6d2UFPXHNDbfkiNFKucm2eS
 mQXoE1pqk+9+1xrrT14Kmme3KlwZtbW5oOrL5e6rzctrHg/q2RT5an9gDcKqx/N8//zuZlC9K1t
 Mdq5G7UfX6dk05QAI6gu+uKcZ8sogwNdkZqcHLLlcdQqy4/fzDPw5mPdWiAZq5uwT2AXT6wavXK
 k1Q0vsz0gT+oDXNEHAkU3WK/5lZoJKrBNDKOznIiP96wk98jVk7XfQzt70zDZYZ/rQ4hsmCeMhQ
 ILOVK6JPT5aq63HsLyw==
X-Proofpoint-GUID: Wo8m4o-zk_eefVFWsKAl_dabvJSr_g3d
X-Proofpoint-ORIG-GUID: Wo8m4o-zk_eefVFWsKAl_dabvJSr_g3d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050033

On 05/11/2026 09:07, Konrad Dybcio wrote:
> On 11/4/26 8:17 PM, Krzysztof Kozlowski wrote:
>> Interrupts property takes a number, not a phandle.  Passing the TLMM
>> phandle made most likely the interrupt as broken, which could affect
>> touch operation.
>>
>> Reported-by: Sashiko <sashiko-bot@kernel.org>
>> Closes: https://sashiko.dev/#/bug/linux-759fcb27-d081-4ec4-9683-6667b54fa3dc
>> Fixes: c636eeb751f6 ("arm64: dts: qcom: msm8994-octagon: Add AD7147 and APDS9930 sensors")
>> Cc: <stable@vger.kernel.org>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
> 
> fwiw
> 
> https://lore.kernel.org/linux-arm-msm/20260911-topic-lumia_drop_captouch-v1-1-6f92f1f3c6d3@oss.qualcomm.com/

This solves the problem :)

Best regards,
Krzysztof
