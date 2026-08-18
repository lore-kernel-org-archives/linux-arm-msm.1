Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A7A370D6D
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 22:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787092922; cv=none; b=Oy6A/5pFxCfnRTJ0HMU0XGVMGUFBbgi2L1bwweryfsJQFntw9qgNrS4RqnraT/7f1uLcJ3bdLvmNTwjvjdE9FeisYSbo8AMp7SNKQtonzQUrO6Xi90wdyv/8VnZJnNscu4YOn+WGNuiFt/4kZBwYPCP0ADvaznXwGkDJxlAmOao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787092922; c=relaxed/simple;
	bh=NTUPCBP65ZWZouPN9n+ceWmfignTvfSu1xDUbhAbOao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AWQtN0ZIeOM2ZxlEkOwmDGTcJ7wXNJYQGMau4jGu7iYwntCt5973zQVrRZ1C3hgf6uQ6ofuXqCyFs2Q7algxHlwWTNWwoKbXSmSRU6txYjDCs3FJ7nPnoTbUfMMpwtQk/YGx2Sq2G3wAxLMPdVxU2Kf0L1i1kXRplT5H1g1kk8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WYl5F9s1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E2gQZPed; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WYl5F9s1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E2gQZPed"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ILbs573055178
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 22:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/yRlrnObyZVQZ6C9IVOv5MrA
	73SMWTeXgv9J+GAmLS4=; b=WYl5F9s1Iumfd4gRKetAhFo+BZBWrMBEvt6pkNPj
	lW2eGkLQ7lRDLw+DgoXIfThARjvKfFO/PGl+O1j2tfG71UyeRmC8ZdW8T39adBPF
	8rJ38J1yJOhIph7Xy9DX0glhlOyQWPnSWw+s0uprZQ+8oIH8o3HTI73mwilaUN8/
	vhSaFBl7TYnUNPS4R72euofbzGQKvtTYBTgqgeEwjacI/HSMBUflpB9T6A3WFDNE
	IrcXgKEsTs+fWQ4Cdcq6awL1wlQKnjmBf93iXOLfGYdLomD8WO+2POk6uXnWT7eW
	+sxrP5NIHe0uJSsxRZ4ued7KycnJdde/+N/JIZBy9z5xNg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfpr6r6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 22:42:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930b6bdcb4fso57371985a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 15:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787092919; x=1787697719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/yRlrnObyZVQZ6C9IVOv5MrA73SMWTeXgv9J+GAmLS4=;
        b=E2gQZPedybRWzUDXnIzWZjxFYQ7b7YDabzDQ4z3N2AkntdFO4xfX51ujVHUUdReSoz
         Z3AMUY4Hz4ZucGrNUOag9/0yHekxfLuFPBwFzb1xJ2urGa1DmiLURSPFD4F6ORuW6KpG
         QkyP2Uja04bvFiamE5PgASRhtM5XlN35DxVxU73L9DyVqY4s51T16QWJEYjseX94BYQK
         Gyx8y0OrT8Bp4lH+FfDJBLjoGuapqljSkvB1E85Ai9Xvfrc32MjVfspd4cR0j6vYwnDq
         8UAMSmbC2HFec+RdYh/LEx+2ffmGfvAww7zIIBD7VfEhbzguEwBwW4lIBK3d+By1f1r5
         iKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787092919; x=1787697719;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/yRlrnObyZVQZ6C9IVOv5MrA73SMWTeXgv9J+GAmLS4=;
        b=Vn8XFAKcir1wOVQ78dFNpsNjweEzYC9sEhA0J0euiYNWPi7qs2jVAnGuTCHCtvDcDY
         wQj9/C7SGH6Epkic8uy4PKYU2ID4ZNsDeC83QnYJyoEISDpdByEGxpjSxHoPi+3R5Y87
         CUVJAFd8gG7PG21Mnh7yQWfjFzDahbcv7F+btz50waV38w+u5xwFQ58uv3NbeoWATYMp
         Y9k2em7VWdXwsp7nuUInspd/b6/Meo8lkJVycr1TKpFp2SB/wuPhxItOIsspnlsjHggH
         YUPUHiiKxFIU+3HfapObt5Rz1oF2n+URZxSO84I94AVMGIZ36guLyVujkBRGUpTkM5ws
         3sMQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpx6mtBy6Sx9Qzq4oPrGDAJX7PEAF/cLToe6u0nX6zpug02bocFmwFiSzGBKf3iUcIhRWINvo5/U31L6PL/@vger.kernel.org
X-Gm-Message-State: AOJu0YyUp7fSkQBBfo38cpkm+OzQnzb2atlVqR+A0cjw2jZ1XfaPhouZ
	zU3+2SHBPKlTRAtong7krj+3CHKWcVl1z6nVvdS7nJ4ugcRRaUAd+fKLbr0Wy+YEVNQXz2VaQ9J
	jsHryKeUDXDpVV6YGtj6Tv5FNGnnUHyRjmABKz2uLNj3k+Pr2qt8VjnCOEAPDh/sz9vEf
X-Gm-Gg: AR+sD119IEyijIlwlHKxE3e3QsjkaX8wNDVbR9tUf29M8hg9/OHypK9ujS2c7LfD+Y6
	eZHKXyY/dS6rw6K7EpFfLkM3+f6pD4YQhWXR21sLN77+lnnbuiLPhQrKCvAM/U0ZPl0DmrfJqho
	6F9KIBgzsiV4xyUNm0qrtNAlUoBSTf818s1tYu20NKo0WBF3KRhawaR2YfsbGV4Y/QL2+Up1CAL
	JaH66BV6Y/E6vd2AAPQSxfnSDj4qP5KT5yEIS2Lsxv/sXmNLgjxYhdj/3UqjrNfIWMQiSJUPnUI
	6Y1hRzhvnrtFuWeqdih09XZnkXc/EuJdpTPKJLvnZeu19e1C7HXHhDVSQ5hjiGJWW1nYFg361LE
	YGMhu1VtJRNUb6ctKPABBwcQna7tUrtYiLTLgrjPHAdrhXc58pHiBC8rRXFRfg1HjE7K0/bAVIa
	IYNf0HQFM9fWIW
X-Received: by 2002:a05:620a:4107:b0:92e:9d63:a6f6 with SMTP id af79cd13be357-9371e23b73bmr72754185a.17.1787092919081;
        Tue, 18 Aug 2026 15:41:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4107:b0:92e:9d63:a6f6 with SMTP id af79cd13be357-9371e23b73bmr72751885a.17.1787092918639;
        Tue, 18 Aug 2026 15:41:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4788d9288sm30212e87.38.2026.08.18.15.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 15:41:56 -0700 (PDT)
Date: Wed, 19 Aug 2026 01:41:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/5] media: iris: Add dma sync calls for input and
 output buffers
Message-ID: <235vlp2bxpqpvgtcqlj3gyh2akclnit4p5lo2boagn4xsgzfeo@qnehnkaye2ru>
References: <20260818-iris-fixes-dma-pseq-fint-v2-0-8dc8c4b3880e@oss.qualcomm.com>
 <20260818-iris-fixes-dma-pseq-fint-v2-1-8dc8c4b3880e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818-iris-fixes-dma-pseq-fint-v2-1-8dc8c4b3880e@oss.qualcomm.com>
X-Proofpoint-GUID: byBIvWBBRBHlDQvliIpwYAgcEcMo3otq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDE2NyBTYWx0ZWRfX4ETd7yka1JIX
 vJouibeAratQ4N0QhaogBKWadd4uDO+H+XYt58PgeXVTD+xoOH5jMSqig5QxT9dSKpl6RG/DBWL
 3/5oxQZr70ao79LeYz2OLPx1jgIzApx0vO6qxHIV2o0n5d45iyFumCfj/U9+X/Abo7XQLFt7ewq
 nAgEzQlmECJ6nbYLOahM/KIO5eXgbmtfqSFtJF3IFcRAxcyJ7Io48wwA8q1vt1WYN7WoGjTG5rZ
 demwe7QzzbxEUvIXQW0JM87c/qxcB7LL/NhyrcCGtmKUNCc7nEos0OqMuT1lvjVVgVtNJ4eD85C
 Y44b2lf3v+ZF2jC+D9+J56s22ymj1vKtbyIcRmlmN0lmJFrTYrtSUa3Yx8H3Ja2Bcl5BkqwWwRf
 RuSIwJ/WWTa3dyOoIVdUlUvNHrhopjjDckS9GrazRbiB17wjLcivxxYjkPbViM16RFsnLjBtr7u
 cix3hnKI+dG8zDrX7Zg==
X-Authority-Analysis: v=2.4 cv=aMrAb79m c=1 sm=1 tr=0 ts=6a84dfb8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=bEbGTSNP0X9rcrhJXtEA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: byBIvWBBRBHlDQvliIpwYAgcEcMo3otq
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDE2NyBTYWx0ZWRfX8dtNs767zcrX
 m8BAniCTMWkYZvQBnVx/rEe79l2iH+0GZv7dzSU7udJ4x98tMJbwRPe7GKSdFbZhfuHiN4atNqT
 uqctBtOmwyXgSo24PonYGyxHa4b2WRg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_04,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180167

On Tue, Aug 18, 2026 at 09:24:14PM +0530, Vishnu Reddy wrote:
> While testing with some higher resolution clips, the venus hardware
> triggers a fault due to wrong input data being received. Corruption
> was also observed in the captured output when the client dumped it
> to a file.
> 
> On debugging, found that DMA buffers shared between the CPU and the
> venus video hardware/controller are not in sync. CPU writes to an input
> buffer can remain in CPU cache without being visible to the video
> hardware when it reads the same buffer, so the hardware receives input
> data that does not match what the CPU wrote. Likewise, on the capture
> path, data written by the video hardware to the output buffer may not
> be visible to the CPU, so the client reads stale or partial data,
> resulting in corruption.
> 
> Add dma sync API calls to synchronize the data between the CPU cache
> and the venus hardware/controller.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Missing Fixes tag

-- 
With best wishes
Dmitry
