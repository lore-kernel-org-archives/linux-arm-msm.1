Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE8E4BD79E
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 15:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789487387; cv=none; b=Tg1QwlLqadD/WoiXhHn9pb2tiKUPz0ksvAa9mUh1RHlgCnEujFmJJrH16RtKv069G56tQW0UVqvKieswE7bPBDoafmnFIreQv4FeAZnOzuFDQCAfBM9XkDAiK6BilkFowPY9ikig3QfPxVWn1Qa5WhhEApSORfj+UHs9zEZWk2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789487387; c=relaxed/simple;
	bh=4ei91b2R3LhpqavB/TmX7B5aep0BPPMa3xpepuWnm3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lvAhFe62VdrDGoCNYnIgIE2jM5nWED8VVg7bqJj3+YzeRJ5F1NULT3VJfAakye/HfZqugohxkEt+RJIsR8T/rgl2sG5xokdYm0QF+/ZXn1FegcPAAtW3nF7moq0TapqUb8CDyrBhIaZAkWbnrUrkMLbpT1tdSumEosGCXIowYXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h6Rg5v5F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Un9nBENj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h6Rg5v5F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Un9nBENj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFATgi4176129
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 15:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EaIdKmli7v2LIFD3GMLQcKRecXvx+ZCUfvZafIxPoyo=; b=h6Rg5v5FSw/YNtTU
	vroXO3zDJH9SA1yOYDyj3IVvfIBTQ9lrDeBr6d0zGrmPT2nAiFPEF/p2VlTOTb4M
	Cjao1j3rFUPIjobRMHQiAXDxhVtGwVXD2anwGZvxoklUYzWZPUdahvwu2mLWKRM2
	wGyXwkIUZ8ANcEaTL3+lISNjixWZxrYN+Sn3zoGc3jj0x3iEJTByKMx9PLYeraD3
	b6nnUhtAV+UgtAdptqN5XW18hhCvbDuHrJZQ0SRXvX0XCdW6FfCLQswuzfEUuS8h
	L/PCdbqGVNh7JvWG+B5nsxCKtJ1V2bMo1UMvbtkSUr0UzN/I/xgabZjSprGJJZWx
	UyBrqA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3hc2522-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 15:49:44 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39533bb224cso5976009a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 08:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789487384; x=1790092184; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EaIdKmli7v2LIFD3GMLQcKRecXvx+ZCUfvZafIxPoyo=;
        b=Un9nBENjl+gtMN8FS8w1CAMgtVO0hPSffRcdY8fonRLBHOdKUQrOXjfEllXyGHwpSf
         LEcOEv8xvbDpQyN49J3S5K0/qwR+Ovwf861gTxfLDksOFEpjGpMk0zswwDxVD8vTGK1s
         qzL1MDBoHaHqpeg3sA0XjmTHgansInLhU+oQIFHoUE+2eJtbNqnob049xZcxAwOPeMjH
         yArR3UmvYhT9voZtkkadG5Oo4PUJJ1FFtM85JCxY4x3nA6Gu2pUzS11y9OydBMPre4Xh
         JZ3pgkXDnc3tR0J6wYfnoJInHZU1ufDKz/F/P4jP5R9I2T7ig8MkvLOmD+TPRNi2hYmC
         vNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789487384; x=1790092184;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EaIdKmli7v2LIFD3GMLQcKRecXvx+ZCUfvZafIxPoyo=;
        b=C9kJPtApoehfMppAy5m32v/q+buB5u3nd7RnlMBEFqNTWNHiSLR/QY+3l4ra7yXaE9
         Pvy9Kj2ylE0+zUABhELDh0e3kmMYfRk4lWt2f02yjEKVQRegLirKZv4c02WUN1dK8mK0
         VUreivJKRkXtg5g0HOVwP7jIsVw7YSHz2jEk/88ehkpMt1HNCR9AXM7JQLHfGh1aMaZI
         RoMW5IQ5dTUfqPXbgB9ADOWm+CAGXd1DakqIikseicWXuo26h+5VqZ7pzDeBwOAEpiBg
         LDyWansxR9eY1vIuKkaIhQeJYml8hA7hUXEaJBtnxFuoC76Pn3sx3Gdv1wiUGQQcbvpb
         9K7w==
X-Forwarded-Encrypted: i=1; AKwUvBwYY5wcE0qK3+B8oc9uphAIED7fuWB2drBnhHckIVmn3raoqT/7+HqDLocEKn7qftrZor73fYdHXOHxIPb9@vger.kernel.org
X-Gm-Message-State: AFuF++mRFTcmq9amESnFh2B4dBg19JeHDqJA+7JcxHKtQlLqV2QKRQvX
	RTuYZeMvfhGWJidrmr9yfOAfLxBbyLIVRepZ8IqVB+evAXm3Ymmx9pfdN8sA4N5zopcjUzbSMhO
	aHSUkLG91sLnfqtdKBXh3d7vNSHmAukA/VMF5RDz9tOugUffCZFpplq++y0xfeSEGQybKaIRUrv
	JF
X-Gm-Gg: AYBFou10hzRJV+2A9gcCzGcTMRM7A0xCDL2acKW5OR12E644uXFot85G5LsjjMy5uoe
	aRJGr5t9o4VV6za9h+ZFblEq6dj0YZjtyXLck0sXCjvOpxWXZ2WRmqRfrNawUa9S1z194sCwk9e
	XpnYs6cXqek1vhCtVZgMNJSRNMZ9r7zgSyA0Jzdl0jBfG318GFGvD0kXNh+GXhHMt34Y05+RQl1
	Qtg/76DUJq98AHS57TT7JIxjlo0gJBRNPyRq2gaK3DpiXiPWrqG310rIGr7ixJZubHMiKdwyOa4
	2G1/sRfdYUeLFtiI2T4eYT9R1eEUTVmeJduS6fzhsB1KuWuJeZxAoVu6jDK3c9NvhM6qU/BSKq0
	+/d0QH4ZmPmJBbTa7v1YzYaFKU75WpR/cm7zYQRES
X-Received: by 2002:a17:90b:2f0d:b0:39d:f024:c7ee with SMTP id 98e67ed59e1d1-39df024cbbfmr14331074a91.25.1789487383604;
        Tue, 15 Sep 2026 08:49:43 -0700 (PDT)
X-Received: by 2002:a17:90b:2f0d:b0:39d:f024:c7ee with SMTP id 98e67ed59e1d1-39df024cbbfmr14330999a91.25.1789487383005;
        Tue, 15 Sep 2026 08:49:43 -0700 (PDT)
Received: from [192.168.1.5] ([122.169.220.106])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfda7cc42sm6221221a91.9.2026.09.15.08.49.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 08:49:42 -0700 (PDT)
Message-ID: <bf2a490f-4bbd-4223-9cc7-685e5a90ec9d@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 21:19:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] arm64: defconfig: Enable Qualcomm PM4125 and
 WSA885X drivers
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260910231642.1794948-10-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260911-tireless-sincere-flounder-5fdfb0@quoll>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20260911-tireless-sincere-flounder-5fdfb0@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xdrmtXbr0YgIsSlAjdcXfKoWrIkKbN3x
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIzMSBTYWx0ZWRfX0kpoct1vo1DL
 Ht7gcB7JAaymh1d0+H62aqCQceoq05Safvz/Qjwaz74XhL4wAsj4Z+zHq/DB8/dgcWz7lUeJdr/
 cYAfdDOmWoKgM+2gi0RNrbbf5K0uetc=
X-Authority-Analysis: v=2.4 cv=dcUVTnXe c=1 sm=1 tr=0 ts=6aa96918 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ww153nmMuBeTcjqybhOiGw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=5zVXc8y5ZMJFenxCD80A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIzMSBTYWx0ZWRfX2KftBq8zk4h9
 oICPOX7j7q/Tbo3dIYT3jYA4ROBlSsRnybt5fPmFaCSZ8QKUXTbuDxaH//MUvTskFFJkGyTalz9
 AJBwBQ5UMtKZBbXwjTdzlFPKT28SZak/SkSvOLIILBdhUV+j2aU6Cu9KOv/MkZ12ozrMFBVkzYw
 cicWvF3vQqQ55G8gRPsmguul1nKkFx3fulchEHUAw+k9pl67bpmZmckNrTuONjJv6AfpeibIfI+
 LqNqIY1SymQT4qMiRKdBng7LJqpTQNVFnPnBpHh4fRIVHGh9gwjAanirMwjyQOyY3ONX7tJ8yUl
 vuoCCsorSEdNHXaoNl9LwvI7kddgTHhyzOTzJAB1tpQq8XqQHJPHdmcfjWkK3ExjMV/I3Z+yTNn
 d5U9dq3gKhj/BvcDJL2wuRRUARFU30Lq5ugQZayuNvv16weGE5WsR1VSIu/GeZnWcVDGYuu+9ru
 bUPVOhRys+YTtXwHOLA==
X-Proofpoint-GUID: xdrmtXbr0YgIsSlAjdcXfKoWrIkKbN3x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150231



On 9/11/2026 2:26 PM, Krzysztof Kozlowski wrote:
> On Fri, Sep 11, 2026 at 04:46:42AM +0530, Mohammad Rafi Shaik wrote:
>> Enable the PM4125 and WSA885X I2C codec as modules in
>> arm64 defconfig.
> 
> Why?
> 
> Same question as usually. I even documented it in maintainer soc
> profile. Dunno how to improve it more.
> 
> Can you tell me?
> 

I reviewed the guidance in Documentation/process/maintainer-soc.rst and 
realized that my original commit description did not sufficiently 
explain why these options should be enabled in arm64_defconfig.

I will improve the commit message to provide the board-specific 
justification, for example:

"Qualcomm Shikra CQM and CQS EVK boards use the PM4125 audio codec for 
headphone playback and capture, and the WSA8855 amplifier for speaker 
playback. Enable both drivers as modules in arm64_defconfig so that 
audio functionality is available on these boards with the default arm64 
configuration."

Thanks for pointing this out.

Best Regards,
Rafi


> Best regards,
> Krzysztof
> 

