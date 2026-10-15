Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2D84A8A1C
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 08:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792051255; cv=none; b=rP+jCtViOgDeE6jTQZ6ws4VkGEs9gXwH7kyf3wgCCh4mREY50mg/ozE8l2lhjz+qubJvMlE637hYKpsAcOh9GSJPzpExKJ5DrUooOleN1gVNDy3g9T5URnoknIK6+49By1LRKshkl/64MsrVqaHbq05trzLcDrGKgCPlPPGJX1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792051255; c=relaxed/simple;
	bh=TPM8vV1gQRN8XJNOlZ+IplrwPVMUQQzVkBEfIEJ+9VU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NruJJ3ZAgqm8k3/rqiqjSiBxRioiYCXqzNFwEsR+LI0E+IhaxINEVlaS6hFNuJ5WlCZqqMCM63kQvgeaPqguR9T8grfPhoh+aaY5fuNgPmQH1lOJWB5/HrKD2k+uaadjeGb8wMKX/kyZIJfH1oqJxo+m3J5EPRkuc7UCyDFYscQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FS+kVGG1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VqhfhTCh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FS+kVGG1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VqhfhTCh"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F78RPO1672397
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 08:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QbaMbpddYF5G4M9nlH6IkfXgYjjKMVVez32pIFxAdeQ=; b=FS+kVGG1XCEMD6WM
	vXF0wtZKd5kBwyLLp/PcXY8KPaac6MgH4yyxlcGdBN5l0sbxoT47xZbWtS9CY9vQ
	jDyR4PRWZcsnyrDWKqszPmApWndQhXmMZAeTW/CEqKDor/1Zw5T8ed+scuYXbH5k
	uIMdDilaSlzeX1sqmZWBRdRKeyZ+P0TNt9MnXrunYBxoLFgUuzH5qjXdxUhFtyG+
	jeII7YSwVcbSeWdtG5rJB48jijsHFlyTHAO28xzDeODVr2LNUrP9yMYqCFYm8H1E
	5PeNHqJ46Ugk/PDa6aDU7rqFAXjK+hFBjAFxX+P4OhO/BTiTo1oDwRjP9934Q/Zi
	nOmhMw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacrhb8wx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 08:00:53 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9106bb33cdfso13227636d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 01:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792051253; x=1792656053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QbaMbpddYF5G4M9nlH6IkfXgYjjKMVVez32pIFxAdeQ=;
        b=VqhfhTChHDA7UZblIciHT8Oy7HFnZWFjp3+ywaORlDunWAblAZYi/ae7xRTJxy3qBJ
         YN/TJnn/9jg4VTzJQOFPoUiKivyktalvo35YNI5AI/4ofgdlzbt9oZVAHw/WD0NuAhB+
         DUbeNWrFqEXF7aajXHsoIxqf6SatImg5iy8xXgO3VDDVmSBSnFTpXbZ/AhgvFuYDkyTf
         NyB6VE2wN739GjFjo8EeLtqhaAZRcPA3veM4tZeK1cd+URKMWFx3UJh1FojbBnhD1cgp
         Jwz5aEkcM7l+pRmhRb5wOt/GjO0hyOimWT/VJls33lO6kfqeuAnDUPvrxRanRqvhHmTs
         XCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792051253; x=1792656053;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QbaMbpddYF5G4M9nlH6IkfXgYjjKMVVez32pIFxAdeQ=;
        b=JRZShOS0oNJ2+1YHbYopNK8YmjpDQsqWt9RhXNqce7+CkUuwCejuOVroevzeQiEAZw
         eG5obJh7qDT0AAwayTy4JhYl1glr+YWYgwdKDZ3O6CHwRVfGJnhfabhOCspYEesaNjCq
         1YRFXHlwl0S9QGSVZQZio3rcMSVpoOmzhfkPJ8imrWeXsMsL+BvzHt0z0IOVzCHeHCuh
         UbHnCfh9GgXXin3HbBd2958a96y5JP2Nsq9fSUCZPLARRaK7m03tHJl7O4G0wqESC0dm
         eDK8PCRs2iE89Nt+NeL/zyrQ7i/jqznW1A7IznMicY9JBENsvfT6LOdRHX/vIhtBo0AL
         t01g==
X-Forwarded-Encrypted: i=1; AKwUvBypj6gpN4oXvBjaQwcJq+DG7NpvNL7xH/Gh5O9gkMRGMFvuYEX81O9lIvBEdGKIP26F3bIwUEDODvGLCNP+@vger.kernel.org
X-Gm-Message-State: AFq9FYKue6+SLrbyGoCJIp75XQoAexDnflIrkWcMKgMc3/LO4giwKwDg
	OfJ7M0MY6IA65pwQX+fOebs8+yfCoX0x+B4a8hDd2za27LSkO8j6MfXrBP8fPTGHlhiH5VxcKh6
	HjsNiCeEPVLVl+kJxHMdr8Q/K0t1h/0f413BcTGx6uCOe5uh2mt5HEuli2P7ezTd8G0GURS5i4r
	hE
X-Gm-Gg: AYBFou3B4Ci1dTCSEQVDLkYYrvGdB6PqftmVczyLWl7oQOp0ofVS7B+YQMOw0WLEobH
	7r+WRraQ4oMLYSrXfBzd/DEU8Iovnt6mVcLarAA/o47uAHu2Bu2aWSvP0Y2qguavSMhct91bbDH
	+9hoaJ5LAThqBdMaER8QusOXYGi7O0krqduu92NsCTifKfBGoquHoARM072bdjv017FH0wuI1CO
	8vMRNqALAxt3m20xSIJyr1KhdkaFi1gCC9nVVOs7/EhxymF/ScuoGEbrbSe7eJvbs3C3aVn3C05
	zzvr1xYfIVLCQVZ2TwWHE60oqxQ5AYb8Ym9YgMXWDkeVWRXnhALonqa412FEHcPCzoHSOSpApOX
	L1vhjVuv7Be5QriDHlDQ42w==
X-Received: by 2002:a05:620a:458f:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ebd0a3722mr3603728485a.1.1792051252320;
        Thu, 15 Oct 2026 01:00:52 -0700 (PDT)
X-Received: by 2002:a05:620a:458f:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ebd0a3722mr3603715685a.1.1792051251455;
        Thu, 15 Oct 2026 01:00:51 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda044aabsm91788766b.57.2026.10.15.01.00.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 01:00:49 -0700 (PDT)
Message-ID: <6610c1a0-05fa-49e6-8c17-8846afd312fc@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 10:00:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] arm64: dts: qcom: glymur: Make the ADSP remote
 heap no-map
To: Jianping Li <jianping.li@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
References: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
 <20261015071511.977-3-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015071511.977-3-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rgsd4oR_BpKbqNBToE8Kbzt-DjtHNG31
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzMSBTYWx0ZWRfX6btjhV3h7u4W
 kyG1xcaplsaX4zmsGb5iKp8xzFmemeqiRjf8b6mixmYlLpy0sqDiYxDtSEG7Ph8BBJfsVlKeUOj
 lmhhip6C0GFE52wvb4EK+Jgy93XJayY=
X-Proofpoint-GUID: rgsd4oR_BpKbqNBToE8Kbzt-DjtHNG31
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzMSBTYWx0ZWRfX93VljSc/Fu7D
 ZejIckT97UNlkPqCAJW0C9ETCraXAKuCYYJxiSczFiINrzeUM/TwjJyRyQgjDddyN9byCDGK/nG
 w2lf31h4vGVXhi/VTzwb+YtvoB4z4yBtgaJwY2eXED5JnWKhQCAQMX4jWZLvH6/IWeTHflZl0HH
 HF4JPV29Xgxjh3NBD4db78Q8AP+tI0n0WoFTICQaGXzd3+AQjhdoxLwN117Zo/U3+bpjRJJ12K2
 VklNIQvz4Kfdr4kWqXPjhQB3nhcPEr7S6zyM+nALFnGIG7H9GsCcioSuDXXHgGrZmCzK7/QKaIG
 2U+zmOY+fzcno7aeHdtTXPizX0tRzDHbJL5zC3+fQZ1kDaSb002sbdFdMmw11wMi1ywFJqGFzAK
 IQI6NB9b9ywxDpVth5Ot+K1bURpXwvJvlWi3Mb4IrWb48ptFLvOLK0gfFafBYD5JKhykFx8Pf7S
 Cl12OtZeDFJCSIBm3dg==
X-Authority-Analysis: v=2.4 cv=SYZi5fRu c=1 sm=1 tr=0 ts=6ad08835 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CjiZw0He1JKpzbGRn1AA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150031

On 10/15/26 9:15 AM, Jianping Li wrote:
> The ADSP remote heap is declared as a reusable shared DMA pool.
> Allowing the kernel to reuse this region is incompatible with handing
> the entire region over to the DSP, as HLOS allocations may then access
> memory for which HLOS no longer has access permissions.
> 
> The same configuration has caused synchronous external aborts on
> other platforms when the kernel accesses pages within the ADSP remote
> heap.
> 
> Replace reusable with no-map to keep the region reserved for the DSP
> and exclude it from the kernel's standard memory mapping.
> 
> Fixes: 67641246eabd0 ("arm64: dts: qcom: glymur: Add memory-region for audio PD")
> Link: https://lore.kernel.org/all/20260701-glymur-audio-v1-1-2c3862d95a09@oss.qualcomm.com/
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
