Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080CE3F1045
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371550; cv=none; b=uUQrdHeQsL4lILrg9pb2JH7geZ+PYg51cMMRCZKpOJbjDUlieL9n9DvCjFNuMXa49EEkRfkOtUkgze4NkWs5Is8S6h+cpdCK8CqfHf1o7izu3pSeJKCQvSp+921yHnpfuSKdUWxWb6d0JggKLsSq4JMnhdSev1jk5yV5RUuTAR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371550; c=relaxed/simple;
	bh=h+JU6UTNI+N15kkZy39dX21ROFBFk5dWP/GVLMUZJ0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fUculh1AQQveTz3hppctEGy3Nwz4jx+/d5gNAbYhjnH6Ed45sQtru9krfw/6YOLpOuWvjzBVl6C4M3yKuTqK5vK52sDpo3wBjOQrQCoPsdyUtHhf1bBgdmYAuZEDdddaaAaLzFyGOAYu67MJKwQS8WF5qA9gvHrEJLbY6wa7bok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jfTN+u7S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RNHYO8oI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jfTN+u7S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RNHYO8oI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5iwG53739615
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IXK1/kL2U0HScIthPTsqaR/1KhHLZK14qm7gOn1yzQo=; b=jfTN+u7S6s8Kygfv
	0tQlYEdwyKq8ulo4jCKxzfpCIEIokRYe67J1CXZq2zfbGPmL8hsEUcBco582PNp8
	1zYSZfZNhKI97emj/ts84LZXDvpvzHX/6rJUppL0yKTC5J3wGOgimLHKeRsthC51
	PzDrO6MAF7kEk+5xCOjqW8WLB6s0hW7itvI8yROr4s5vy1q7gZYtpw9ptSDp0ASM
	dPAjafj/jl/zCsj/qMZ6aAB+j8Hg/JFfMxZiYvJd9yb9GZ9QeP0x6DcTZ1FtZJpX
	CDY2HucOfa4tuFIkz1OmtBCbNSBdEuG3yU1L6ZIRljjWUpewpggZrUQQRzZ30+Ma
	f8MYPw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9ddjes-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:39:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939fc317691so48154585a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371547; x=1789976347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IXK1/kL2U0HScIthPTsqaR/1KhHLZK14qm7gOn1yzQo=;
        b=RNHYO8oI8JW/ibXZaCnTWEA+qs0YOb52iaZnMYca6zZauq41vxx9mkrIR84s0uqv+S
         UwzTPMJ99VSrJ+OLntE8262Lrs2LAIWac98VM8agNAcf0jUxjdU34x5Rw+LRK56VfV8H
         xB0avop1Pctuftqi25AK4beLhEWHEGDnVWzz6yrMX2m4iEvr6ROv7lyZzfbtQDo/DNIh
         QqrZtIqMK+6cM3C2hiD65EKnG6gmHOfWSfTr/AL+YxJYJLQEqA6Aekd2CMEPlXJJFKgh
         EyA3jXb9S/aeB8tXk7i51lduRX5I5svIpqPuj/tHGI6Vy7saz/qBnp2ag9cHtMboeCVQ
         XrYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371547; x=1789976347;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IXK1/kL2U0HScIthPTsqaR/1KhHLZK14qm7gOn1yzQo=;
        b=J9JNIo+vimiGVaT3iDlpPAVfl5EHq8bmdcKzEtWY1CV6anwdyGRSPmIR8wg33yO5EZ
         otuFI0vaIkXR7qlVWZkKhO7ScjUyMVHA7Bapj5ZCPYH910bP+m/v8qm6xbCuoG2sNpW9
         wgRgLBWPD6U1ka58DnjeOlX9OA7NZtVf3Y7M5UUEFWiNBRVV0ii2JE9taNRFmPf7SZb1
         T2Mss63qpMImVeVBirqLIPDFCpqTeJFkkZBqca5T0e4oZMMVmjmNvUiUDBYunbWueM6D
         7FLf06fEpYy80v+/rv0+tVoPNqZFd9hsDf2vPVgwq9W6VQxXCatMLSogSFd5znWNswRr
         9HwQ==
X-Forwarded-Encrypted: i=1; AKwUvBygAbN+r0j/LwGNT2OVHxmkk8Mpw+snz1em++z1WvowG6W2xvNri58JZ66ZDA7h9O56ev3LLTpLbq7ZYoO6@vger.kernel.org
X-Gm-Message-State: AFuF++kJwvQD5nDxiD+Zvkxw9k0rO/x7QAiWluuALQHsLnW176TD5YMq
	fRRuHIfod0lElhDc7eP/P09L3tT/766Zgy8smG0X9OQjhw8d7tI7b9akQtKZaeXH/93gj3KRzkI
	9okEHZ+o3qu93r5epKyu6/6dTG0Nd1q0W2qLCWY0kzYTSZ9CLVTZm1Yo37Q4FvP7n8eOZ
X-Gm-Gg: AYBFou1KwnijB0NLgCIL1AdS1fNfkLyJTaRAy+S0da4XXvgWiv3nowyD5S6vKJUYdQr
	PT5mcBgvOVrVK3hhjSxUO6yIkhI3j/O1WTtZhXmxiob1sgZWpsDEPeiwyInFfDGSXxjkm+Y3nA+
	yLLSWo3L/NntPOlNNZH7WiM16P2lW108Io0EcUkp0q/9HRD9hIaXxv3wGJtiTsxvFpqZVVJJw28
	npxbNkI9O3egFq2JONxc+TCBmGkps0MXN5FaMQSI0U4nvdHTZxae+ECmHNEVdCN20hXERXX1jFT
	BpiACLWtTTwgMIuqsZPExLwlWlwBwvVfaN0+PTrTISz/7juGPzhf3Os0oJQN30J01bAPnpd4p8c
	rhP88enC7rqxvx2qsGT8hwA==
X-Received: by 2002:a05:620a:4707:b0:939:de49:6c78 with SMTP id af79cd13be357-93a297cbe3bmr160273485a.2.1789371547011;
        Mon, 14 Sep 2026 00:39:07 -0700 (PDT)
X-Received: by 2002:a05:620a:4707:b0:939:de49:6c78 with SMTP id af79cd13be357-93a297cbe3bmr160270385a.2.1789371546524;
        Mon, 14 Sep 2026 00:39:06 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9d0ef7228sm2170656a12.9.2026.09.14.00.39.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 00:39:05 -0700 (PDT)
Message-ID: <31fa4256-f285-40a9-bb8a-0b5495badf69@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 09:39:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx+: Increase GMU FW init timeout
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Greg Ociepka <greg@ferrisoft.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20260912150915.28700-1-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260912150915.28700-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfXz5HwqAxEEiuE
 xfpzG4/XK0+/BzVdcoQPz6a1oz//y18vfdXXqBN31r8ST/Qj+cw8rIx+vp4iwaGg5A/vmu1xGb6
 qvSKd2KT08PiLx2rhCXX7c7ActDFg2B6NLbB/1nEupTK8FuUITgMG5PJIQg9yc2f/uqUWpTB22U
 PdhY4+CP6oqynrcbPNkCMyGLnf9j/tBXilFDWXPzLOEAdDDzkLhCtKePAZ3MUndK9cuZVUbZHuT
 7X1kJh3A/BlW7WupOz6N+qANgRo9fyCkA+nqJzomiMgLNpFDPx8JtHf4dC+pnUfwOU/0u49M6GW
 Ldl0hw2YRTGYQMIq452O35fy/U5OKbTAPGnRM3b0BG5d2sQSD+G2+2UPGus5bpQjZMDDQzDKI65
 sCAc4fqd1FlMdIQlA2uNk0CQ33utOOTMdJoMiYxxgkIJJDgJ/AEjhGWtggbeEdF7Q3e+szwIlic
 I5fWhcAhHkBuHL+7ctQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX4iOcMXITuRVS
 qIfRIisLzrNviIY/Tz3aJ43mXtxqarJwhaX3cftXxzB3/BiHmX/bGCDTZB8BvAytaDk9QvXOQkJ
 k8Ynk84PQy6KalRcPu90NkKtmR2Z84M=
X-Proofpoint-GUID: q73pZKUPI6pe2ROMh6bT_FZSgBvHneTO
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa7a49b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=9tEP0OE30YQ_IqY-BwIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: q73pZKUPI6pe2ROMh6bT_FZSgBvHneTO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140108

On 9/12/26 5:09 PM, Rob Clark wrote:
> We were using 10ms, kgsl uses 100ms.  In practice it is usually takes
> less than 10ms, but very occasionally goes a bit above 10ms, leading to
> a "GMU firmware inialization timed out", from which point things go
> south.
> 
> There are probably some things that could be done to speed up init, like
> increasing GMU freq.  But to be safe, increase the timeout to match
> kgsl.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
