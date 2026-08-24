Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F706379988
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787558501; cv=none; b=eA9YbuqlTCymI46nmiFidI92W/jYFHm1zOYxG4BJHJb2whiYW9tEKLwkn0aILKRZJ9zL6PdFKKjMbdbKFj/+VJx6xGl2geq9Wh5Mj3XMt4qf0kR1btZD56kDyCHpQ6SimNdWGOHvi9q5gRBJJF/zqdgj56r50ofqfTtqw6IH29o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787558501; c=relaxed/simple;
	bh=vP7KFRuxv5/PvNudwnrv8A7AdwTbutFf3LNghXEf8Es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lSWE+DzL577JyCO/9jUhyJ026qVBUugdHKZ8eIjiMp57TKo1lM9HgqIngCyK529fVyJDl2+job8yBDWqv9oDIbZadoLI1WtTsZ1JOfax3hPHQ4TKWWwfwNqk58nij5T5Slb/JmolPlnKq65VxRvqxY6IAfTrCypYD2CUjlmGCMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eQWswynp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JNcHvlr+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eQWswynp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JNcHvlr+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O7Q7Uf2666596
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:01:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ukMn0O890BjOQtEZhd0gOFgJ
	Vu4vFO2RS+3Y7jP/DNA=; b=eQWswynp7awzOnk+lg3cTUgKBINakVAZYttmSMUt
	v5m7b4ljZwERwWvwgY/xuaqkz3W1YmGlUAFfajCkZYqeYBKVHVa/e5ABoFN5SMoN
	yxS3WpI4viKvcGwqP8WB4HKOhYKAxGprYK6I5lmt/OSwgCQFaj2w+rF4YzW8Lu58
	hncuzdWkMrMbK2S7DXluKW/B/HTa4LkR6VPEfAGqUoxl4sVmFq+kvtjG5h2mD0ms
	l56HNY3vHVMkiqZmEcmTkf4dKs0JTx61zgY9aEiqhW0RIjZt44Ja5tKxdu/H1trS
	b5c/9Y1vDZowrMdQkHwu2iXgPUn8utBZHy29DpYp7+bdZA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hjgr4nb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:01:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5276aa86d00so34774921cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 01:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787558497; x=1788163297; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ukMn0O890BjOQtEZhd0gOFgJVu4vFO2RS+3Y7jP/DNA=;
        b=JNcHvlr+OidnTVBZk2211x/yQ8XXRvWs1CClMbAvVVJGfkrZhMWPhNkBx+hETr3e83
         qYfMLwds5weQN67J9XuPbHYPBGSW3mUL02DRWfMe8pJdTG4Y39VAnsNfR9dVjurg0Kdd
         izLPxM6oI9WmjvdLezNBv7gP6ihV1Gs7TeMkXh/XNMZ+w4ItBHf4Q9oT6+JPnGS0UndG
         lHzwD3JuKgZhDGYMHDHKpx5EE+2vxmUc/k4byJMUAnfDvuMIY89Is5yIezWQwu/8a5AS
         KVVrzynXNS26YCf3s/WEGfdUufpIg72PJVzO0fo5BPrHXWcQ2aQJzQy3zuFdAzQgyRph
         5bKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787558497; x=1788163297;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ukMn0O890BjOQtEZhd0gOFgJVu4vFO2RS+3Y7jP/DNA=;
        b=tKPLrP5wVytAdMoCm86xJgCGw31S9AhPnmuIG8TD2kVUEn7q3GA8VBsGHIu9hZVnbG
         sHUxWUd7QMoTP7DryLJNi1vPaK1WjrgUwkoF3LJbFXpqr9vc8VwmJtrMjPb4aMP8py+5
         vGvRH1X4a6ZgiGIGPbNsNOMJ5v1HNFdLHPF0RQ5Kt2T05BLeU2WZRg5g+vhU0n8lHs7N
         PqzjMBut5Mzz65c9XB+ZUtU/Ivm4mcEAJtkTgAlUEBIAEWiJYLG9w/U3IInLv40suWy7
         EpgCTjCv5MRqC0c9xOiqRqlOa/Foh8tjgx8oSa4PI3wyYi8ddqrZejl2iVr+Ja/3QYIT
         EVAA==
X-Forwarded-Encrypted: i=1; AHgh+Ro1+CLdyrRSLGAtiDGpA7BgtI8K+d3agpsNE5xnVurllWlbVs5Yx2cZCZHR8/g6fEBjxNXtZwrUTE++e/i3@vger.kernel.org
X-Gm-Message-State: AFuF++kmj5KMDoxrBgilnf70wasJpNMtSamfHFzqeoq3uawGTz1msixE
	hTumYGHlRpXfrHeaKabrswmixpFO1OT30lkEJHT3oIYes0erTbu2nouvwRBQ+h/O4k4QkzOmVkG
	CE+idQjUK0KzhUIH0yqTqWC+GPQYbyFyZTBHXU/9B9oKEDWDp8Ra2PUhz0UVYp8WQ+stu
X-Gm-Gg: AR+sD10Ft5NVwMDwV6Bx8hwDuYGyB7lh5+0Kx6q4L50X20lbvTdF+yzOx/Cfnrll1yO
	AH57p73SanxI8TJFSpDleD5S0M+euhvkbKgVoel8IxLIwbKI+tjgNhxKID2RPB8b2MxkyY/vLaW
	aqHA00IZ36LwGpKx3A/4ujeQwbpXKhSQB/PT91u1XRj/3ea14GbutKDwWqD8ff1o9JzniM50Zop
	ukqnpFn2b6d6ms18AhaEyo3ujAkQH7fplxiLX/2m50EfIlU8dg7QknQl01i0Di6cDBFEFoqsuDb
	n5YBooShutZ2tS2+4+3o1w1b5MzMwCtYcqWVPhdDPKt+5z9WRTrMMTVEJYqduQDLc8LrIeP8Ny2
	7nBK0HNWr7CxXO5o=
X-Received: by 2002:a05:622a:4c0c:b0:51a:8c79:a2d with SMTP id d75a77b69052e-52df56e5052mr252527021cf.1.1787558497459;
        Mon, 24 Aug 2026 01:01:37 -0700 (PDT)
X-Received: by 2002:a05:622a:4c0c:b0:51a:8c79:a2d with SMTP id d75a77b69052e-52df56e5052mr252526211cf.1.1787558496975;
        Mon, 24 Aug 2026 01:01:36 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24962bd8fasm1736480866b.28.2026.08.24.01.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 01:01:35 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:01:32 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v12 2/6] ufs: host: Add ICE clock scaling during UFS
 clock changes
Message-ID: <v7mmy3emjbeorjy7zfrbgqmozu37whvisidk5uba4o5jeqq5t2@ntjncu6bywtx>
References: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
 <20260824-enable-ice-clock-scaling-v12-2-09271f583dc6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824-enable-ice-clock-scaling-v12-2-09271f583dc6@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3MCBTYWx0ZWRfXx+o0XLaFNLLd
 yGJY+t70Lyc4sM1nHDa9ND3mhzS+aVVQrND62Mu1T0m2cUSVicb5TAd/Dc6+dPxhMpnl9o/DGf1
 0S/MK+HdA2kAI8d+3lEtAFXK4EOJtKM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3MCBTYWx0ZWRfX8bJQ+OvpaIqX
 0dA5eII7ET1WF4ikrlbVnTetGrK5cvcTCt5LHcekA+I0zeuOpFFjB+yqOuG6xhZkf/blX4QQCCp
 MmXX30EKKCLGIA6+hL4K0mWEliJHp3qUfbAKEozhaipgND5u6PbZ5T/jqA4SD5sm5zxJpGBMn3u
 CD3sHUuvlRKAGy1tKRSMbQHYAUPTqvoY/teBwUqNIliuebsOnHbAi8A22SSqUhOu4yZrNsBFVG6
 N3Fuk1Ag0O2gxUrT0xoHNvXSlcxrtH3sfoi1zO0Ydgy+AYhSNrtJXDxjZbtnj4f39UjTNv9ZsLY
 9ag0CtR/jjI0EtRhPAzn5YNloIDwY1gPu1rOEDZ/gzxAq69+xYaP4TqXg9ydx0HelKrpMy9JPWl
 7i9khNAmyPyExihB+W0Ji4nOA+QQ5xtCqT8Wswa7SGG8f3+/9WaYwq5j+UHgZ+wWRzZqTYYDiDX
 iMwN+0E3eDbJSChdo4g==
X-Proofpoint-ORIG-GUID: 1amqDjPB7s0m5TJ90ntN-M3-qdBchXLo
X-Authority-Analysis: v=2.4 cv=CoCPtH4D c=1 sm=1 tr=0 ts=6a8bfa62 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yPCof4ZbAAAA:8 a=8RJfRLJrmUUAMqN4eEsA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 1amqDjPB7s0m5TJ90ntN-M3-qdBchXLo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240070

On 26-08-24 01:17:39, Abhinaba Rakshit wrote:
> Implement ICE (Inline Crypto Engine) clock scaling in sync with
> UFS controller clock scaling. This ensures that the ICE operates at
> an appropriate frequency when the UFS clocks are scaled up or down,
> improving performance and maintaining stability for crypto operations.
> 
> For scale_up operation ensure to pass ~round_ceil (round_floor)
> and vice-versa for scale_down operations.
> 
> In case of OPP scaling is not supported by ICE, ensure to not prevent
> devfreq for UFS, as ICE OPP-table is optional.
> 
> Acked-by: Manivannan Sadhasivam <mani@kernel.org>
> Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> Acked-by: Martin K. Petersen <martin.petersen@oracle.com>
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
