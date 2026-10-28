Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190909;
	b=JBVtAwRUUzxvdxQFgxPXp1bUr/Pq50/IV/wfNaLerDsVeDzUKNudWO0D7qYwlfIFtrv8
	 VllXwhGbD2JB5wAhFYjz0XXMlYSd30nbhJshdqt+7GSh3buCsKL3S1uM0Zba2PdFdBP56
	 vtfyf4pz6yqY6JPwdW1MiIDnCOv1iaJwBPcRBKLTOh5MjIlOE+XmCOpCe7SQqA4duWmYR
	 M2IYaVMz1IQVeU8scauRbRIO9jQjbGAADRJbyjjUSarR4rcWTqBO9XtFHQIyeuYZ25NGG
	 2vxXZsFGUT+2Hw+Yc1L6VnSSte7iw+PutFYp794Dex1GY9sWLZhMkExDTdn17a9kcIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190909;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FWMtzSvdd8NrJA4whQuRX82CTRfD/nN3EiWL1j0NOgQ=;
	b=bkRH+ZEsaGYDju1bMBXHvGve5KQSBOQDdaIIAU2YUHybGoTR7eteb1VnU8Z4KrTNW1aL
	 9BGoNt9eqTcPfmCTnCQ9V1q+q6x2CWb85WYG32NLXH1pa3GqTuYwW56yXKtDeSK5A6z4p
	 SrUn6GKqtB9YRNXd++6UCO67WnmSwkqxS5WEg40LDVHWgSztarZczF55E6Yh5KeKzGcz2
	 Z4HRShV7zTbyytzmZDtV1deVI7SeoV0tY+x9FU4pYrFkOw0kM+w1ndAKo6H2PXDz8IbwW
	 6vdTZ3XdrG1TvW2SMQ81KiVKkoQxAsVztXNALQbwGXl509p663ZRKd3Jjyd8DyK/mkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bwc1LhZH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A0wFTqm7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA6B606A31D
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:35:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FA6B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bwc1LhZH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A0wFTqm7
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe9sX994831
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:35:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FWMtzSvdd8NrJA4whQuRX82CTRfD/nN3EiWL1j0NOgQ=; b=bwc1LhZH42cw8Pod
	f/hrDrg+ZPh576kYlnJOIdh97mX4G4bjwj1+8t2nJa0bJFPHwwktQwrXoVznJ1Y2
	UtDYYgnyHtyHuUTUZkLD6jgObTrvyXW0EIJUOH6No8DGWQCfNVTRJ0cMTiXzI4mO
	HnVdUtPsR4a6VxwoxdxAfue/CRlki3JB7LS7JuzgTWrqTeXeBdPKb5ScD0lfuIfb
	DTL70WnpTvnkFmsWm18U2UNqhKGrs+FIIv6yJz9kHLz5Ds4kmA8WE1feLy7rIyKN
	R9Oc7nME1izXfF8JSXcROZ3MGPQCH3vhI0Lj9mUpfqpNkrxciMOlWy5Z6dilZGVP
	hahW8Q==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk82tt23f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:35:07 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5caeeb345c7so51799e0c.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 05:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793190907; x=1793795707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FWMtzSvdd8NrJA4whQuRX82CTRfD/nN3EiWL1j0NOgQ=;
        b=A0wFTqm7P6zGBoFvzCF3hlZibrIFa0JqTR4RAxVIUnpsBOADslurzJzCXSKgHvhS1f
         bODpYknziYOKgwiF5KVYvVGeutkeJyM1kNyc/kzy57qXguGR69kFOgeEp9xsgz4e189H
         s0C6CfJcDnq2scQKMS+nqC0/RmKnzUuxS9p2awiWg+cjfuWPdxA5VTSq4jcKZ1c3rPig
         haHg9vQemkno6bcAsqedYLKw6+52bQ5oO1QdZvfqS9PqNpQojqv1fjLoDumKmQTWkJYS
         mMhuBzzYn/x9eI0/iYM8aSJciAiGfRyswfEKAScDEvTgoMXU5dZYKDtTULUyTuRDwApL
         aBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793190907; x=1793795707;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FWMtzSvdd8NrJA4whQuRX82CTRfD/nN3EiWL1j0NOgQ=;
        b=DxfkeoPnKHP48sje7wLR0+644Z5+s01BxI9RrkVeAQPZFu/u9d2F94fp27kp6t7rSQ
         EMIgof9iIVcvEXVS735df66yJ96mTy9wQ206xrmOvtcfphJkgL/y5K8WJftrV1AV1eCH
         qVHwn6xGBIc3pstJ+mfURRxRtKXrbVfm8BdIlzSQrZ15/KHXoc+gPfp+ZZg5bhzM7S+7
         G7ET+NVXim9WSMeiNvkWr3RxWLaI59ZW8nwXbBMh2EGiB0RaQAOn56BrF+TPThfeSS+m
         XTJGgsKLjKejilvTn9Ps2BMh1RNdmT39Wj2qhIQWoSzc8Nv4Y/id4e7SaLjiGHedJfJO
         xdyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzL5YDTJpJxO6if2KRbOyy22jWmNohPajWE0xPcXCVqVdDyFKhPU6Dj5qx24gKOrl8awEM3M9jbdQh4Ini9@vger.kernel.org
X-Gm-Message-State: AFq9FYKkyM0zgRl8FPuIjU1b31+ofJ2+Reb0BRXqHy2XX4t67IIfjiON
	v9nFi7++KBGhzqXV8LW2Ikbj/atHBboX4lvQfCwxn9Zs+E4UnXg1zZqQua4urC2ODgTisFeQwoM
	HwkSU/U3Hppue1SHSd8E9zznrv/yg7YWso0EtFqJX9an66XaiwQ/Cdrk5T6yhrQCZJ5gB
X-Gm-Gg: AYBFou0EPXXcNJYecvc3mbH9V+ou2ULq4NBwYch77V9r5Co/nx6ofTyn0AZNoUV71q2
	LjVdt4+H32JxOWTKWkQleVImyqUGAQPaVH54ZA0iRjrkLaRyPsfX/ySDYGIyaF9tylyIA3CLuw2
	mQUFw2pWCZKZpC+FXDRpfXp6XBdebmUmmvJInT22zmZy1Q5PeGJQHY8xrGJ7uY1niB3WhYty2Bn
	A/4nk5r3HTolRVJMG2B73nVF0hk+NvkOogZCBKG8AjKNUXCEZU1NyS9QV4v8lMeL1poOeOtcfYF
	RVkcTKO9xCFqvvJM8CooS+AS8qQ5wyGGIFHaV2TaDtXogzTDzejX3EAng6npJftcBtqhITkV54d
	KtikxFYTHGXyQNtU3HBRG8vopl0/+0XH5lqMo1k9vuy0iLOBhiPTJ9rtbZfxHf6AfVCWdtd4=
X-Received: by 2002:a05:6122:4a51:20b0:5ea:a8cc:e6fa with SMTP id 71dfb90a1353d-5ec4cc4da04mr663981e0c.4.1793190907381;
        Wed, 28 Oct 2026 05:35:07 -0700 (PDT)
X-Received: by 2002:a05:6122:4a51:20b0:5ea:a8cc:e6fa with SMTP id 71dfb90a1353d-5ec4cc4da04mr663963e0c.4.1793190906915;
        Wed, 28 Oct 2026 05:35:06 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd649f69sm594674166b.43.2026.10.28.05.35.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:35:06 -0700 (PDT)
Message-ID: <132b9b95-6788-4147-9b0e-3b31af80a60b@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 13:35:04 +0100
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
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add Xiaomi Poco M3
To: Amir Hanip <killdeath104@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261027205146.16384-1-killdeath104@gmail.com>
 <20261027205146.16384-3-killdeath104@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027205146.16384-3-killdeath104@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iday6E7itpLoZVYrZCtfne_kNFuDfLmi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX1dyaLHA/4bnw
 TiL6tRQh8yK0Qhq9Rc8XpnmBRAGEEbygKzRTKGP5DOktLxQ5lznhDS0DFHSfFM+bVBeXW5pEvoP
 sObkzw2lwbMDgdz8Kdalvs6Ypwahb6A=
X-Authority-Analysis: v=2.4 cv=Tr1zFzXh c=1 sm=1 tr=0 ts=6ae1ebfb cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=jaAT0nVXb5hwA9ITj8wA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: iday6E7itpLoZVYrZCtfne_kNFuDfLmi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX39Q/DwWydy+z
 zl92XlVmRGVPTR+knGm6PXTe18+n7ExaBRYzxPRpKTNlG053UnWtvGOHbWe3CXsp0CroSElwSZh
 7/mF/LattYJe9YEvNdup8ENVHiqiUrIfjcWre9m5YHDAL40vpjXqAyG1oWwoSXdCp1c9yyx/fwc
 mQ+AC0IERXicsvWhXKiRWHzMjBJF32stUwhKpsopQ+9fGR40khkVljg/mM5S6fm2xWoCtdKgtZN
 36Fn7kOV643BfcmtpOHZyPw4fjoPV30Pz3PivxhS/OREJqTNh9tAlrIOJx7I3wqtVk3dYEGk0Hu
 +MP0+fDvZHoeld8Lfd15sfQCQxmDQ+FeTf3YSuwH1WzroTS0eZTCK56LfLw4NeT3itCUmY/CBgu
 rOIVLw9CQDbGks3gFGPtZqhx3wwHjXxkEa7QJgb2oxyxl70Ib2+nbatzFpnVv3tKwK2SH9fhts0
 AzaYr17/cxgiNV/0OwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280050

On 10/27/26 9:51 PM, Amir Hanip wrote:
> Add initial device tree for the Xiaomi Poco M3 (codename citrus),
> based on the Qualcomm Snapdragon 662 (SM6115) SoC.
> 
> Currently working:
> - UFS and microSD
> - USB host (OTG)
> - WiFi
> - Bluetooth
> - Remoteprocs (ADSP, CDSP and modem)
> 
> WiFi, Bluetooth and the remoteprocs need device-specific firmware,
> which is not part of this series. WiFi additionally needs qrtr,
> tqftpserv and rmtfs running in userspace, and the Bluetooth
> controller needs its BD address set from userspace.
> 
> Display panel, touchscreen, and the GPU display pipeline will
> be added later, so the display is currently only available through
> simple-framebuffer.
> 
> Signed-off-by: Amir Hanip <killdeath104@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
