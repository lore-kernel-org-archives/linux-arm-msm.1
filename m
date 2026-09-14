Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F387441A766
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789384048; cv=none; b=iXFS49UPTo8Bhr19Scou8bOKdzo7xJgRBpQi4WEpAltPn7j2+Ew5oA/pKtzh+NZWsvspsCZjeFWxfahMEBdpvVlrjq7SAdm24VQsLjRiy3otoSXkxuI70sACUrdTdXRyNpNNSYElEYJPtVz744v08x8dIH7GWJ7RWLnE4NMEtlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789384048; c=relaxed/simple;
	bh=xYsLDYHzX3vjcXE15qP88OPePOGOo8XHzB7bDzWf8KI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F86VotZGFWH4cYxTy+C28zYjKJf0dKIdzyD+fCuuL0d+cq16gbXfYz+hiUyaDFjrVhlz1bl9fYiS6LhOCGfZrWInRqtBm7JldCY1o7OB0+XMWkGQM3SJgav7/8z60bUDkRxUrGopaqRpd5fS6vv6XNjvbhkLijC1o2lE7lqk/0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=byBNS3s5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TEE7ZiD7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="byBNS3s5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TEE7ZiD7"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm9q3377811
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:07:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iVmNbZXZqwHQu9GXVO2u+sF0wdZLciwJFvqeKGxeNv8=; b=byBNS3s5SujcMjbb
	HUssKUkGExzh/rGvdqT75AHs2YHG5ClgioucHDKX1dX8Qja+bVAAeBc8Uln3x3WY
	enlOMwBzBRtEKQDWgu/mjjsshNlWGGhHui6MMODyJ4ucIwUbsYuLQ/DHVqsqzlr6
	zRs1hqZv562dAjdwIdsYpMVSJpH6ZI0+wraPjbRNlWdsDwDMR8aJ/Be1cPLqU25E
	gcny96dfgm0Pb7SaiqVT3OUJrFDX0Qn6BBM8lnVD70pWsT3MewNWxvRLwNvTAcwo
	ri0jNWgZ4m3gYJoZO9tfnTXzHtpgtYCLa6gcWM7dk5zLxZ/d6lKjiRRYtJXj/euL
	H/mFjg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpecs8cm7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:07:26 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9106d577ac5so7474826d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 04:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789384045; x=1789988845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iVmNbZXZqwHQu9GXVO2u+sF0wdZLciwJFvqeKGxeNv8=;
        b=TEE7ZiD7nijcQ4C+VTwYmc0UIksxU1bCVr7cNOhMk4k5+7Ks7Vxiqghc4S/HgeN7zq
         tnTuEEhycl72XjeyJMppc8CkHg0RA9/P2VEGxErSUxb7s5MDLNh1h7Cfhxnj66foJAo+
         J5MPMXDKc/LyJsOhT6dMg1WHAUfWV0qIq68ltrFUS7RRZ0g0W+us7ONMTed4ohxuw5N0
         wSgE1EWALuSEtINXUYbQb2Q3vGk1xmUzIJzcTWpgoS1eua3/iBr0BqzpDEaabDNoJCAw
         7hvqHlNf33sr9Yo7dzDnQut9MIF2xkosC8RkfBK69oVKzsX/KdKXUcwQiiztSDQdnhwC
         0BDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789384045; x=1789988845;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iVmNbZXZqwHQu9GXVO2u+sF0wdZLciwJFvqeKGxeNv8=;
        b=AZ/n8i17+Bx2cK1795pHzOWuOzaXl7zQpea3/M7isqfIQyRoguQfSGvrMOiLjg6SG8
         I58iPdEt3+r5Kh8M+W6XWV2lCNZGDpIZNVrPIJ8RO63EEUrw8cmwP9fZSHfrflmqVij6
         cjRiezP4INgIRGkD4jgtloHW+c2NmTzeEGbXNd+IJGOosKxZmvZ9m2GY0sPOytpMJxnX
         4pCr8wub3f1L/BAttdktPL4ivkSgqEMPOK4SU5yWld71FGGgrT9NANCjVCXllgpsHmEz
         ub6M1+SVDpL7DrCnl8/+XWcP0+NcxMumgFw39GEDd/67cgVgjwpNVgRTB5Qpz4a9Pgvz
         2GLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYy1Z8oE4Tr2JDyoMRvOgcVorjhfM7ykllG4v8NYqdm0p22iv5fLGpd8wcv059swPdRGzduVaIFSSmEZhk@vger.kernel.org
X-Gm-Message-State: AFuF++mxNcc92Ia1A4eh4C+z9gZBEQpHdVrehI/5xoav1QNQUwn/kL3h
	wJI1IlcavqTDgElDsSBsOIOC/j3hLTPECUvLaaSGBVZh/7jnUWj687eEiF8pJWhBzgpnX7vKaMg
	kLeGwiZoVF2ihwX2sFz7GE3MhTUJ8hRDrY1FUOrnqsI8EV2sMHaCM8e4gbBD1M4rUqbcC
X-Gm-Gg: AYBFou26MFXb5epW5pyJJo1uGOh8pcyo02V46z4amuwKRvIs7Oe7KoJAGqnDmn5nmYr
	kVXpxXffpj24V4pR9uEVUHWQJkPjwgnAKrayaLZbwogvs81E1uuom2mtVN3QHYGdiQBG7DxTwN5
	pgS1GAujs7x4UUeursGUDYBHjYn47UHVMQMnWhmsUf6GH/OAMP23xAI8qywHBo7INIG72p/apUH
	Ti/nb4LAL52M5FelaZYkFCGdLtduvwhNQ7u9z4aaml+fnQDN9j6LCrH7IKM5J/rD9CnogLzEFsi
	0+JSpkuPXcuGl93DeI5Q4j3i0ew12lrSi+LxegXb4gyXDxA6M9mnlRHvWHUQF4dENa3Tf45HmjT
	6WPc2vioMyVOKmE/ryp+G5A==
X-Received: by 2002:a05:6214:1249:b0:912:311:12b6 with SMTP id 6a1803df08f44-9122e65e041mr27735536d6.3.1789384045199;
        Mon, 14 Sep 2026 04:07:25 -0700 (PDT)
X-Received: by 2002:a05:6214:1249:b0:912:311:12b6 with SMTP id 6a1803df08f44-9122e65e041mr27730436d6.3.1789384041075;
        Mon, 14 Sep 2026 04:07:21 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b594e462sm4164264a12.24.2026.09.14.04.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:07:19 -0700 (PDT)
Message-ID: <b550d226-e7ed-467a-8af9-a45bde169ecb@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:07:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: purwa-iot-evk: use on-board
 crystal for PS8830 retimers
To: Xin Liu <xin.liu@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com,
        guodong.xu@oss.qualcomm.com
References: <20260914101233.981643-1-xin.liu@oss.qualcomm.com>
 <20260914101233.981643-2-xin.liu@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914101233.981643-2-xin.liu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NyBTYWx0ZWRfX0fAR5hNwqyy+
 ewJpaH6W1ylToNpZe5M+RPU9u8rbAruTwFVe8QULxTGS8WUh5Ec5eCKJmKdgoJRwqC5ocIG5pPK
 xKOFnfwXplwjQA0F6VM6lktcrC0KNV8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NyBTYWx0ZWRfX61WudSY5Z1Mt
 7F5E2h+zDcS96qZXZJhgymC272u+K7KcpYnP4ysz4tuCpsH2ozKwwjpsp7R6ZXWprAJANyoQXf8
 rZR+aIjAGW/FqC22RKF+N8Hz8jKKmqEjUXoPT04VQQx/9xvaAzdrR8Gw2t/IlOoUoVIdOfcCauq
 sRaTEO77DH8Q5N6SkyfO0i05ZwrLfajLj5qYUgaOldLK55aaNFuIRyEFDlSSuusW69OVOLh4MYw
 kAsS2FElQ4ehppc8ISmylRbMZzk1uSJz8u/R0pS+WMxKSGHJzIoWwTMw09hgDT+Z+Mcfr/kbN0s
 men9mG8o7GhEi3o5dgC8fERGYkX/AV8Fh35Vnx2K56wt3j3lEflLgEuRNqovOxqrs3O8J4bzQ1M
 ENhocgrEc2zv6WVoFLp0GLVlZsgffThZNlkFgkdcQay2s6aSIG2qzmtWFMpoDybPCD+Ia0zYma6
 3coZ4de55DRvQO/bH0Q==
X-Proofpoint-GUID: iHaDe7TzCx051cPLPyxjjSvttECjUSI0
X-Authority-Analysis: v=2.4 cv=b/cncdGx c=1 sm=1 tr=0 ts=6aa7d56e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=D9jnvxXfBeoGJ7MCLz4A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: iHaDe7TzCx051cPLPyxjjSvttECjUSI0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140157

On 9/14/26 12:12 PM, Xin Liu wrote:
> On the Purwa IoT EVK, each PS8830 retimer has its own 25 MHz crystal
> wired to the retimer's XI/XO pins. The reference clock does not come
> from the PMIC, so the RPMH_RF_CLK4/5 references in the retimer nodes
> are wrong: they keep those RF clocks enabled for nothing and describe a
> connection that does not exist on the board.
> 
> Remove the stale "Left unused" annotation from the vreg_rtmr0 regulators
> as the retimer is actively used.
> 
> Fixes: 9ed20e877239 ("arm64: dts: qcom: Add base PURWA-IOT-EVK board")
> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
