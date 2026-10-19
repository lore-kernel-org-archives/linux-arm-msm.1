Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D80D4E06C0
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 11:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792408238; cv=none; b=h1nw72+/810qrxVw6dGbqrsOm1B2JauIy+T6zD5uhoVTLmSqefmrYY+emLJZymppiE4OFFEbmukcpZY6rqGG/FyQg5obvy0svPHCQfT2Um5xh2Kj8CV3hD01cxIGv9YOUA9S6/4eSS12/i5gb8l3naqiIFlsGJqdKeIPOeBCLi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792408238; c=relaxed/simple;
	bh=eLQMV4NI0q81zowtL7rae7nja7cb7zg7erllZqXWpA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oPjN6ZIevKCccD+lNaNWcDyNCmxCCBWw4spf7MnYQIBsinuQx0bPFuXkgZYxnsLWgMeAjonr/AU7J6+XG6J93SFJhwhTNy77gIz7iquv32aF0myM/fVWxdQPttmY8LouDL6WOSXVOMxtSvTeer8TJjII16c4r6wrK9MAIaNqHkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fIvRQS+W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RCVsiV6b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fIvRQS+W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RCVsiV6b"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P1kA2042040
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 11:10:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eLQMV4NI0q81zowtL7rae7nja7cb7zg7erllZqXWpA8=; b=fIvRQS+WNTQUDsmm
	qGhbkBQxjgT2ei53rLtGJjs34jn1NgtcXRMimISptvqNAFANvFnG/mfoBilch3U+
	oUzJiR2s9MFaFVEciT3WW9f9yspFqZZ/c96u5P/I8UoptZuJlBN0yIWONS0a6YdG
	8M2XepF5mujsbIcAzggQOxq6jh/XkaRhduBdkPUg39RzaL0pbqlPuZeQeSm1VzEL
	zZfpNgb1V+ppPh9y7etWznBo9/MK3q2c/CUNbwRomOT2fS12O+27Qy3ery++wsq+
	3q1RIhxa9PqLtBtCS/Mua3wEjyMd+qsWnfV0FNcNW+0EkBxbvrKyMZxBUTpZdaTw
	oNljvQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur2dtw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 11:10:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea6b66e53so34529885a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 04:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792408236; x=1793013036; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eLQMV4NI0q81zowtL7rae7nja7cb7zg7erllZqXWpA8=;
        b=RCVsiV6bAucELPyea3z8I+O7mNMfG+HhkXN/TuI5et+AdSyYF8J6DN+ZIFaeLlAcli
         Vb7ym+hNwxzyE5mVDE6OB9g2NtzT/h8AwztvULdpwbS+lkX6J7xmxnf8qExsJqwtcsqA
         eJg0cM3ClUqVZf5J69X5gyvAhNMxqvhXtRQ6PL1GHnXpeUc1Gv9MX+mFdoNv/3jUaxjN
         MT9lNzKPILCxsJpv4AVZR+0PUsltec5thrAxeRiv2Zc3VagVnNBIjOCrjylADjjSIfr5
         C72l+2F5P6a1cynP2nme/ta2vssve2+RrpNzMeR6xcP68L9PIIOz8WYi9wKpsylZMnnS
         HNIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792408236; x=1793013036;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eLQMV4NI0q81zowtL7rae7nja7cb7zg7erllZqXWpA8=;
        b=c+a2090wBVcAAgaR8GRigs2U6TEhILe8NBodCrGKKVcM+MRyBjoZ4MclfhCAluXkeW
         syeKF1+N6aWxG/p0UiEH7FHCyQKRU7HxcuYw/EcdLiwNK1MF5WTIArr9wCMucI1oknoT
         SfREhf/B2JhY8RLqq6oVQ4EYKcPquZCMHTZ0MvGsaV21eTXgZqAi/ZHKth1RDGLmb82G
         7NGr/As4CHpjt1UKtOQyXCWTXbozYUt2tF7VdHECe8nBi/B4dGTvinMbW56YFgd37o5h
         WNAPSyzV2IcG+K2nKttgX8alfaB4YshV6kScUYI0s7uatWNJKnqW3yPLhUtcCZp5HIQv
         3/Fw==
X-Gm-Message-State: AFq9FYLVXTDOBuiqjBzID1gY/V2+dUVaA5dK1/o+XWL5AwPXmtbX6qZl
	hwWjMexuGFWSCqugF2KNRioSqXxlnSyQoKH3e2Ck5yJWnYzxQahY9RE94P48qBY5WmGC8ihwiTq
	sqzn3FGW5iDqQLQiQW6rg0mhWISlTukgGhvN5/QQAj+JQ3W6creUMd7pQP6ubHMb7caC9
X-Gm-Gg: AYBFou2yNC+ZSpJCXi2jQ6RuwO6QjTf27V0kpWp8VUiXSxJ4SIa6a8Rla3g6Wm+GBLa
	4gbAhRWpXLFKf6lG9YB4iLtYS/6kMKiDCCmHyRXmsGZLbOI0f15iroFYAmAPZD1Eq17C/gpuC6/
	cbICrWiPzaymbJ/DJfvj2SmtAftAj5/FPaDdna3/RgpTnpjpAYBw0HD0WCgMrm636dR8bq1LAmA
	ZHmTjVsRFQWWOPAbX3RwnjnMyvyIU4zw9muMAUP/GdjQrrwIF4cpM6egzs9M55OhfggufvcXOoB
	s3CSFd4va8QXFnWAI18hraDJI1sf2HLl5Qw+GC2hV2SoIEnOVfOe9ezomuTXxSMC0hpCD1+jd0I
	tu196sNE=
X-Received: by 2002:a05:620a:3904:b0:93f:977:5d9 with SMTP id af79cd13be357-93f29a13be3mr1306150385a.0.1792408235700;
        Mon, 19 Oct 2026 04:10:35 -0700 (PDT)
X-Received: by 2002:a05:620a:3904:b0:93f:977:5d9 with SMTP id af79cd13be357-93f29a13be3mr1306144385a.0.1792408235247;
        Mon, 19 Oct 2026 04:10:35 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb39a3sm348351166b.81.2026.10.19.04.10.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 04:10:34 -0700 (PDT)
Message-ID: <be076bf7-52fa-4c93-9d0f-46a8d06ae920@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 13:10:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] irqchip: irq-qcom-mpm: Register MPM with cpu_pm
 for RPM notification
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-2-ac7f1a0d5638@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-2-ac7f1a0d5638@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NCBTYWx0ZWRfX92WvTTFeBX5r
 f57zfuCLj6lZPFkwLSMMsorxPbmMR1fhXQQlBPyeGy4eHVwsxgjJtgZbxkbsDFY8LYCVF2tyRtH
 ps+14ksASErfPBY6qZqgZvb7mEhSJYo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NCBTYWx0ZWRfXwUYKwgHn5/LT
 QU4n2AKegyOwPn0MEuMm38kz6c+nxn7CPiMCG9rheypdQV6J6i9CiucdWyJI6hIzm90KUqQioj/
 DNQfrYE0v0dtaQbtBh7PsJ3DLgP7x19Xnm4f+BzpVmqW4Sy7y4vkBDuO9/nsuxYVbELzN5Jo4Ux
 mz6SzFyHwuZxuxkwDAseekwc3u/FeIhV3gujS9+bSb341Lq+OiK2soui5GnTPFrTMXy6wJynRFf
 8sODp4av5OfYqX8FeJ358505gF39e9mTyA0U4o38NGCQR8NlIuA1RTGcfrmdXBTYITLSiQ/vu6j
 BB8aUJf0K834SCL5kjHrOXhyqUIjJu0AX+XsspDPAEtt9GZwx+H2VOJcr7tsQoi2jZVMjK3fJKn
 jt17ohNNgOkz9hehTYBQy9/zqg34rx7loYWpwnIi0haGh9hv/CgQrDbCXaMJqhBn1HIauZTn4ks
 D03LUkoyPXQSoDBUDxg==
X-Proofpoint-ORIG-GUID: gQHFI-9lnWV6bsWIGnCFBrykaHTZe1yi
X-Proofpoint-GUID: gQHFI-9lnWV6bsWIGnCFBrykaHTZe1yi
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad5faac cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=qE2Ob0BFYF8f0NDtHPsA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190044

On 10/15/26 11:55 AM, Sneh Mankad wrote:
> MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
> the latest wake up capable interrupts when the CPU cluster is entering the
> deepest idle state. This is done by sending IPC interrupt to RPM and is
> implemented as .power_off() callback by registering MPM as parent power
> domain to CPU cluster.

GPT suggests to register the notifier later, so that if
mbox_request_channel() probedefers we get a clean unwinding.

It also suggests to skip pm_genpd_remove() in the non-legacy
case, but the API tolerates nullptrs (although it does return
-EINVAL, but we ignore the value)

Konrad

