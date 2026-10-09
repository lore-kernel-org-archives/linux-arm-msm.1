Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F24841D22B
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 06:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526701; cv=none; b=VXjzsrWqRDuGh3rX/XWD/qR5Og2mSPWiS6z5MQ1ARvUq8XX78eBdwhnjlK+jLPWj6uP+DfHtJpbFh+P9aZMBiqIpkl/9u7nfLNPxbP6iP7RBSrTVaPAzsvi1psXBamAanyA+YBGrUhFt9TY0HX9iTEhzPvCaeRpNIgg2EDMaItg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526701; c=relaxed/simple;
	bh=rCY7+48PTkAn540OrQ61wjv1+BXj1jS0fk3ADRA/nqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O9IOyVJeMQnet96eH9guo42+yB+uBVCtGtquKuyfr5DcpoQRFiW34v+OmqQLm+4BRmyn3riUsmuzgWP5y+95aPm6edyVYDW4EqQIN97/sf9oz/kREZLVq+6FXod7uFexoxA3Wqe8GwAtpYjlkf459ain6gtUFkNf5Izdty/qH3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nj4wJ++A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AszfUC0W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nj4wJ++A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AszfUC0W"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HCVa1712604
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 06:18:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C+cpcIHle0L9Ji+owdA1hX6Vn5Za9wzxxI+3oH/nAuU=; b=Nj4wJ++AJBKvafj7
	36sQsQxQuxtaZbp8bb2yzXlY2MXYJanP8gNDkUYvsE6JGP+yHihygc7EvOdNV2Na
	qEU6Ov1gqEei1UIuYuo9fNTUp0fxHWVneHFhIZB7MDIpwb//rYXmKQWQUvRQCFsS
	vOPkWhunL1aChSmVhB8Qfk30t6CURg+GRip0mBUUpFG4mZUFVkXzRXTA4jlfy8p5
	Ov1ikNuMTN/WaS09IaGuWR0Ij3YvA4LUqSaSp+yHbWdvCEp06GpbuBSDfKeWGpAF
	jPB7C7g4MbzyVimmRz+m4cQN74VfRf+4A9m3IACyT2uevUBM137hy5uCc2YgeFB/
	lE3oXw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxwa7g1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 06:18:19 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso11523438eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 23:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791526699; x=1792131499; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C+cpcIHle0L9Ji+owdA1hX6Vn5Za9wzxxI+3oH/nAuU=;
        b=AszfUC0WvUKqh5j/jlBf0dGnbxc3ptsb/5gPykrItSlCtT2lJDEYIjSWZ6nV8i5Rzy
         RVFgtqrwuBKfgOHtUto/QXKwAO2GdTW0Oa0cto64LgzMhZJzbVEwCgi7zCQzyDk8k88t
         HTi+M465J2EkH6T8oMzDkcUbyjsInHwigO4SsfhBLhzpJP22Mm6lzWCb9ItbSmDHWqZp
         1v8D55HpyEhmHyAPzBmT1HC1akJ4U5VfTapA5sSy59BJDinKRA58oQI76WWNSF23pVIY
         MpdQrJMcZUxr367Cm5qUov+qOc2uXtEKsBFrTYck7VrKcU2qkrRqy14PYdnQWpTR39QV
         qyGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791526699; x=1792131499;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C+cpcIHle0L9Ji+owdA1hX6Vn5Za9wzxxI+3oH/nAuU=;
        b=l1wOF3/TOd/gJiN75IbRcwjgklIaCQ075QtcSWfRJbf4k2nPaOE/kd8H/aXDQk0MHD
         HeTv1sBDnFmJYcxzoOIdJOSXqe1eLrqH+mxCHOP7Q6D1QHPnn9mRSMJchhsHweYs/oZp
         EZDjRIrrxIjGUSMPnKK+0LGqWwGVHTGQEsTh7jzyzyp/M7urRgQp8ZRumDXkz6Pyv1Cm
         6Q6qmREovpi50cgqmlAKbZ2HTzR2suICAph+wdeLCF4yz1ThUwrdH/Cc/IAeNEZI2rNE
         PUPALRaBllN2PvQjEdYl9zWr5WAKCrVyd8QdbP4lh0i6zbcHISveMiDhuaJzAtcYDDme
         piQA==
X-Forwarded-Encrypted: i=1; AKwUvBwe2SofsV0C1asDzII9jztkrGo7wNLu0kVMVomBjcu3Chet/0sS5xSG9Mc0V814lwK45zRgUqFdvdb5nvTf@vger.kernel.org
X-Gm-Message-State: AFuF++ntdCNVDqIGTXNfoDR0IjmUDo/LbrWFajbgvRyI+7Y6tFFKhvCt
	PH1SE0v2SZ4YGwPrC3ViDWePOU7j7rDWEgZC2LwJYmiDDIydFzX8ySMsG6kizCqSt2ubFiuR6Ed
	ooYFJgVkFPHv2WwHBuk1il7DxBYvj42urWIJBw0+yfhnxAdWwmJZtNgIXLJhWkGOYYozK
X-Gm-Gg: AYBFou394gYUHGPaBUNHp6j8/v+GQ7JJUcOdfMZ0imCIL0P+bLXzbWk0lesdpYW3JcA
	El9huIVmaMm1t+i40EuvNmh6tyeZHLOeXrBH5QL5ue6bWxkUUKx2ZmunMG2A4LDSsxvTm8WM8Km
	0x9HQ74/mTtJYAK+LKrru7Uzk/ZNEy2wDPYk/LN6+FfQhd9hg9saDgWBPshpqzFvSt/IhNOWVO7
	E79GgtA9Hpd9nKtvTJb/QZMNln921KagvzG7nkPKHcrxo41m5asvrBshJ9NeX3mHaCQXbyri1Hy
	0urscTNyAUCshiMLe8rqVHij9DIIAToEEfXpi7QiGB7kzZu8z8JxRf+/JictixJwT2RoEumCOCN
	bQerybWNWQbZyL7RkF6UInsji7RZ2nDZGfeR3Uw==
X-Received: by 2002:a05:701b:4349:b0:15c:20b8:796e with SMTP id a92af1059eb24-16a5f112b00mr1097361c88.22.1791526699071;
        Thu, 08 Oct 2026 23:18:19 -0700 (PDT)
X-Received: by 2002:a05:701b:4349:b0:15c:20b8:796e with SMTP id a92af1059eb24-16a5f112b00mr1097280c88.22.1791526697566;
        Thu, 08 Oct 2026 23:18:17 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a31f6be0sm7716862c88.13.2026.10.08.23.18.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 23:18:17 -0700 (PDT)
Message-ID: <394cbef8-e993-4741-819b-bb074d4c0d33@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 11:48:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] ASoC: qcom: Add Nord audio support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261008-nord-asoc-driver-support-v2-v2-0-0b6f7e94060d@oss.qualcomm.com>
 <ashIbH52KeAcHeML@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <ashIbH52KeAcHeML@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAyNCBTYWx0ZWRfX9YazfhklQ/uA
 xSj5YsbIdtI36nfN5rPx1n0MWaNGhyeawGWnIm09pQ5aPuw7qPI1AZhEHYpejWVnEM/eAa1JVCt
 hibRA7UNsGpqB81FfYX8ie/n4LFVd9NqBnhhYlMuSD4ugcAOqMYRImhkctVQtyLebg/sPC8gKLa
 lQ9z45hbcYIrbExwRc5hFdr2Vo7dNh42NDUpAGKUPPa5XMGBQMxJkj8UDOI4XM3vwYuWZRb6xyZ
 nUdnJoxoND712TWAFW4y9wYuYZbF3UPDrrNkh0+R9kEewvJ4oObsh6rFfMHkuQGKZkBx0sxFTjV
 2+aFwdUMIbAXVb1YdcmzWqaBUAp27a1SEfhaS1XPlPhiUvOm0d2REhCbVxQGtF6Il/OuqalTKxa
 7biIhcHiPNSdWMr/jbqyG6M4dm75p4BZpkZWsTlsRvGaQcj92p+ptWHstjYrFuZzaEvx2/4hOsL
 mQivILb6fQG/jfXWcSg==
X-Proofpoint-GUID: prNku5IqbVEGm2wNAhipcwEhn8-aPl9Z
X-Authority-Analysis: v=2.4 cv=cMB1IVeN c=1 sm=1 tr=0 ts=6ac8872b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=5CsdgRGpw5DW-Y5J6h4A:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAyNCBTYWx0ZWRfX4cO65Lzud0IA
 z1fZJqyTIxSdDLaovrmfeplqiqU36F2SGP9GrR1d5+KSkSjD4Sy+TetVvmZNpP68mXi39wqxqBy
 04q2xmU9vQryux9UjKwJJqxpIqljInM=
X-Proofpoint-ORIG-GUID: prNku5IqbVEGm2wNAhipcwEhn8-aPl9Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090024



On 10/9/2026 7:20 AM, Shawn Guo wrote:
> On Thu, Oct 08, 2026 at 04:36:40PM +0530, Mohammad Rafi Shaik wrote:
>> This series adds audio support for the Qualcomm Nord Ride and
>> RRD boards and includes the required machine driver, device tree
>> binding updates, and codec improvements needed for the board's
>> external audio codec configuration.
>>
>> Nord Ride uses a PCM1681 DAC for playback and an ADAU1979 ADC for capture.
>> Compared to other SC8280XP based platforms, Nord Ride requires
>> board-specific DAI format and codec clock configuration to support
>> the external PCM1681 DAC and ADAU1979 ADC.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Dropped patch 1 from v1, as the ADAU1979 codec change has already been applied.
>> - Moved the compatible string from the board-specific file to the SoC file, as suggested by Shawn.
>> - Added runtime PM support to the PCM1681 codec to manage the SCK clock sequence.
>> - Added TDM support to the PCM1681 codec.
>> - Added the required POR delay to the PCM1681 codec, as suggested by Mark Brown.
>> - Replaced LPASS DAI IDs with QAIF DAI IDs.
>> - Link to v1: https://patch.msgid.link/20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com
> 
> I expect some PCM1681 driver changes in v2 to address Konrad's
> comment [1]. Or do I miss something?
> 

Thanks for pointing out.

i missed this since comment in Device tree. Will fix in next revision.

Best Regards,
Rafi.


> Shawn
> 
> [1] https://lore.kernel.org/all/d2d2feff-4823-43dc-9014-099e69195280@oss.qualcomm.com/

