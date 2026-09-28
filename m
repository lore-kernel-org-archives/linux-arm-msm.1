Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410B2485CE7
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 08:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790585399; cv=none; b=J+TssxKMhbGPIO4vZtvq9b6qRd5AyR56O/QKJ/tnzc0hvixOOWaglIjB9Aq+3399BfLXXN6QKbTSAxyVcpC1iEVvM/b3u1yZXEWHUqSGsXzXXrSL8+i+yrNAz/BbN2ka56yyo5/KoXATwUh+rjPL/38w2CJ9hCfdIJFb5PHYIjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790585399; c=relaxed/simple;
	bh=/o9hluNrbnRR5o5W2f4eH5nfBVQOK8na//h4p2fkvKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z2sbuxoRd37A02puqQltibEOkQXZieyytBfDWxrxb5iE/XBrAHvIjr1WEi58bd+7XNuRCrODXD5xCDqbDuSYvO+CFA2H189xIzZOFGxDWR5y6ztzr+h/a/zCb+9omwAYigwT0lHC+HHDJnyMICTcJsQjKWoDhX2CEomuwWUovOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eu9iL+MB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EL5NBiEq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eu9iL+MB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EL5NBiEq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S7xMIL1010227
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 08:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NQ7ekHQSCnro0qR7M7Y4+SW7D/6YqyhuCVY6Qhj79Tw=; b=Eu9iL+MBaqjjGync
	DvtDBLN7sgL+dQxUV8oRdllt7tEf2wEGFHpMr2XmyKr8Rn7WXCZVNyEicxGwzV+w
	fI5M0ODEsevweGUae0nh5UtRISVW9EWrtotFiOaE2hkFhSn0mdlBbsg4UzBbWA7O
	1CYqRoheQtDB/Ccwzk6bxq9SJY8eyJlGReE7WmNtiz+42cvHSvZpLcHRKtcGyObU
	HqiMvHvavr/HW3s4V0/hNDZrhYhZAa6XFrEG24IkiPh23IRHZnb5aKVqD7eTxjOP
	mLsLajyizUAJT4A6E1mH0/I7gXaQX4T/E21HAQLZqa2ajL1GpCJhhIbf6mKa6Z+b
	PMB0yw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj2s0qcg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 08:49:57 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-914504d4f22so702716d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 01:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790585396; x=1791190196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NQ7ekHQSCnro0qR7M7Y4+SW7D/6YqyhuCVY6Qhj79Tw=;
        b=EL5NBiEqpcPCb+etQauCt6i6IwEOjZ/dRKyPvNhFErIvudamiM81aE8oBPoQg9j8hY
         Uk9sthXgzEI6k0PHO2087xCctawlEj8SeGpVDZdBmusTkeSKWivWaUJTsoBPu3hMJVVQ
         UZPBdCQSOF1m8keV8AMv2UrwXGVpc7b7/FoAnBw6tE93qt2F+m/8+sceSHJL8Si3d1tA
         XG3lIsTFdG24REYyPvmKgXHPnCFsAIx1IBaDThvue/GwDNFKPfJk5swFB9yxyAKQREDs
         bk0kp5piRXuGn4TCE8JgKq84R76ArvZ11xJyxJpPCfTzSWWgeoU3eoz5FnZhHwydnVDF
         q7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790585396; x=1791190196;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NQ7ekHQSCnro0qR7M7Y4+SW7D/6YqyhuCVY6Qhj79Tw=;
        b=N+Yarpi0jlEvHX3oG44FagwgFTOBexXxpCYzA7JRWuJxqRaBhcsWPuweEiXSquw5MS
         GRA4E+RcIEdKLCIP4az5QWldBzD66ghJ13DhuYrYtscFX8ubKxnaXkG9QPFZST4KC6WC
         7gWyGiINABJHtJG6DKKHvXiFqqFhCK6Yq/IqNdAlt5jRrnoJzpB7XGoqbM8BEy4WzJTh
         BQ2GDaVADFC7IPF0SJkldf1WsrZuj6r/dHCZJIw89VAXSsWo2xjbBpLQU553gwmEbodm
         lQmTxtDRghawwuBaloBQN6Cwg+TQXBjbE1+fP9OWGoIOMM1Aaf2+pDo2yCSfBiCcoKLR
         LNhQ==
X-Gm-Message-State: AFq9FYJu72gmlTAT8z8Y9pkMpvXmk4I1TH3ijUDQ4dAP3dFFJC5kMHAS
	dC+0dd8tLaF83j4IysfRQwjNNdfT45vKVp2qKSvwi+8GBqakLAF4fdizZwntff6Sopg5qrs7CTl
	ROEAwvucx7TKthHxkkGOceybbd66VPdPf8oOv21ADr22OGZ4ivLHAs9rXrrYGuUGWmzt+9hHXtw
	YM
X-Gm-Gg: AYBFou37qoDrNa3inomADBuPQfXZdCsuwEo7SkxTgVQKscl9pMlkMZPt8rlLULq9+T5
	WVnw/sOJVoR0iZVmdpHS1niXetZhdckSjD2fFD94XGNpFhvyCRI8Rj0XS+VliwbegvLJ9vjYRMi
	KOT15aFkgMRQ8dkSAtJpSeqbLGAHtaTkrQrhKKPTuZlYfVx5mfSiz3I/YmFD23ieTE2wEoxVW91
	wKqSuGzBJ54uo8Yr2DCgzi6qnqsGmIau8BQRyS8K4O1/uu/EbCvNXkMpscj9qAzrAG9PTy1NF+N
	si5ojRdv4P/9nNrkcMjYv1RNNtY6zu9CtFHGZH9/muy3WB4sX+CGw7DZvo8eV2vSpWMpi3YKGUO
	VfMrQdB34AnMcl9kReFtxjQ==
X-Received: by 2002:ad4:4eab:0:b0:914:4bd3:d96f with SMTP id 6a1803df08f44-9144bd3dbf6mr119184706d6.4.1790585396434;
        Mon, 28 Sep 2026 01:49:56 -0700 (PDT)
X-Received: by 2002:ad4:4eab:0:b0:914:4bd3:d96f with SMTP id 6a1803df08f44-9144bd3dbf6mr119184486d6.4.1790585395874;
        Mon, 28 Sep 2026 01:49:55 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5dedf66sm3978860a12.23.2026.09.28.01.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 01:49:55 -0700 (PDT)
Message-ID: <18088f30-517e-4593-8ad6-3abfee23453f@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 10:49:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1-denali: Enable IRIS video codec
To: Dale Whinham <daleyo@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260925-sp11-iris-v1-1-967f1a3a6b6e@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260925-sp11-iris-v1-1-967f1a3a6b6e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzNSBTYWx0ZWRfXwCNjnu6h2KQw
 Sjwp7o+gN3s7pBI2QNtGy6MNK+x6lawXlZr5wDZb15PtczSw2kJh9NVXOD4SPZkIeEaUlKAzQUz
 dGmiILh6EdEtfMQz+NFP8ABTQ3yiueS/HWWfCSRkectnmdVr/gJkAyVh6+QGSQiJpzZd7M1Dnt5
 dgdHyaBFHqL3kwCJPLPA2GD/f5esTbOLYNi+7/mp9E+aEerx11cY08/cfzzPtvPVgJp+iD6skWN
 64hi3/zjNBKQWKLixEzUFr2/FCb5cUrebNRb4DCYkEBMzk5KsCGHcpgcKA19nCAVmtzUFntYBS1
 AIUYJwHxnns1qPimvb0JWRP+XpO7j+NRt38g4zgrmG11jM1CC6aD+8IInEsKAqdAbDugj5MDdzG
 aAxX9yC6ZGPPQrP9WIplN6YpH6xzXNOxr7XJg3tcnQLB90PL1CNB00HHfkUnSaRm183U4cAfUII
 bYI4zfJaEUgs0qSiExw==
X-Proofpoint-ORIG-GUID: cgocwVFIDGv0FqAUTU4TzNGShAX9ffAo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzNSBTYWx0ZWRfX86++3kHEPO1l
 y2565PP/dqM0JX+/yl6F6PJJ1bJiV0FCUKSQ9i4ejBG4uvOwqp4L8pu0f93jmIT2rEzEkhaMh/7
 aD/OBLgZIWHfcNicXZhfLIXNxqwFyBk=
X-Proofpoint-GUID: cgocwVFIDGv0FqAUTU4TzNGShAX9ffAo
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6aba2a35 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=gHjZUIugi9cSBFQiOBsA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280035

On 9/25/26 10:51 PM, Dale Whinham wrote:
> Enable the video codec and point it at the Denali firmware.
> 
> With the firmware in place video0 and video1 appear:
> 
> $ v4l2-ctl -d /dev/video0 --info --list-formats-out
>       Driver name      : iris_driver
>       Card type        : Iris Decoder
>       Bus info         : plat:aa00000.video-codec:dec
>       [0]: 'H264' (H.264, compressed, dyn-resolution)
>       [1]: 'HEVC' (HEVC, compressed, dyn-resolution)
>       [2]: 'VP90' (VP9, compressed, dyn-resolution)
>       [3]: 'AV01' (AV1 OBU Stream, compressed, dyn-resolution)
> 
> $ v4l2-ctl -d /dev/video1 --info --list-formats
>       Driver name      : iris_driver
>       Card type        : Iris Encoder
>       Bus info         : plat:aa00000.video-codec:enc
>       [0]: 'H264' (H.264, compressed, enc-cap-frame-interval)
>       [1]: 'HEVC' (HEVC, compressed, enc-cap-frame-interval)
> 
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
