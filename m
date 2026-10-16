Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85DA2773D
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 12:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792152813; cv=none; b=TsaByehR01eZOs58IIJk8Tb+RQ/BVBmZef+WgleGG0wCLkkHo4ILPr876w5Fgu5RPGHm4MLf+okbw9VM0WvlIevLjwTJG7OL5TM0s0TUvHUap2RzEF/NOKky8Zks4Fcnx3qYnfgdsZQqN6rgu0AV9qqN/qvXVJs63XTDD9uB73A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792152813; c=relaxed/simple;
	bh=Hx+kasX757nKJIHFXkZ8sY5/J1mcVKzN1Gb/FSM58J4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O6YX0cyKOP0oMR8hhLCG+ybafLdl4oJDa0GvyjLuxfITeoXdYLvadCnyOL5ukkdxVzVhRKTvF4jj1nhWR63bfYe72Pgk5N70PcMiZblBfK0BVPmoZUcTIdKSX6aYzneaB2IhRUB04K04Y2Y4UkPPFQ28aurH+i4NOwV43dMbMpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mOZBAvNq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=On+VGYgA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mOZBAvNq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="On+VGYgA"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GBTvpN1276901
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 12:13:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2ftWXraDk9QDVAMxNPvnX3+vFGzgyBKZIXYyP3mhWOg=; b=mOZBAvNqrETlTo5t
	oLXQdt8d3iOaBaEl1nkvyHEMF4pAOblVuA/fagfV2eefOEmZsSNV3zGcfF3FyOHE
	MQQWf6qOJ3OkhTsPhs13Q0VSwi8lTZdUGA8VTjIyIbC2dRB7MBNgLIlvTHaeSdYZ
	oWjQCE4TImGjAQnCXRg23KtSPXJzIBxf7omIeKiWtDQFDRfaWk9KTfhLdCRVfsKL
	fVwFCEEdvRp87bb6noRdrMXrkX/yRWR7m1WQoC6uefKkZN+OR3HukJXwEJ0C76Ol
	GfjDngAV/FBpbQDlTtdRaxnuriCAmxLzjPsikQefDXAfB9J03TgN075A5x9S3klV
	GYVg3A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbk3v04d0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 12:13:31 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91b561a5ca4so14237266d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 05:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792152811; x=1792757611; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ftWXraDk9QDVAMxNPvnX3+vFGzgyBKZIXYyP3mhWOg=;
        b=On+VGYgAKKhbA2Ug1qo9vhrLTYUmKiLKzcB0ajp8yugEdU+2VWikVTWjAKnEbggceB
         Qah+mjRFrn5jPHPTyPtugGiv3MMcayBsAutMCltXw61U812kV77no9FDzuc2U6ME3hcY
         6bPgiZ8AzrXggYIvpxM9mU8xh2or0skrHGJ6Eec6fOlbtmZEUpEE2t61yDHts+aJxZjB
         Q1BYpCkF2eWitd1NZe6qMLU07Qf/QE9PUWCLvnuLJcrFsZG0oj+Cde9wRVcfFxh1xjm9
         Ut4y1SpFgcTcB6BE9L+KqRvozX030yi+APPloF267lfiBGxsWOT3UGSqnzykeZnT7XnC
         eNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792152811; x=1792757611;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ftWXraDk9QDVAMxNPvnX3+vFGzgyBKZIXYyP3mhWOg=;
        b=oZe+tL2k9b173w7JqQDSbZ2ZyRAQRytHKSGFRBnvXcJ5H7FePwgSsXxQBpGaGuxOuZ
         XN2CADkQSIb2nkLAfcOvKJhWeaXMKd73HspmzClBxMTanGuXD8v1XiJdbItkMe/me3v0
         /VVHbhrumY9MzT9iWC5ocKvzrTiZJahtc6nYfh9j4l3CCpFPUz1iZBxhhk+TbzEOrPHg
         Iowfci/pA/duIig7O1M8TAi+wWL2VNyL6N1BrNYMhH27lE6jTPKe6PIKJsK1ffnOP1kb
         xbOkOTJO/birqmPVUHXZVMK6ZIcUs4rwH03PykGWozd8+V5I634Sah6qK31H/k/LNz6d
         aPsw==
X-Gm-Message-State: AFq9FYLf4zh6G/9fDtQlY2sbdG4XxMbt0PDYrMiypimiu6PhT+flobcR
	ASl+Gc+W4KhyxEkIU5ngo4tcFPxJX0ZOfAl6zbL9TE4lDncQY+8l4D1qPBOxDjM1mEsQZO19sjJ
	2XurtW8T+L4Fm3gvccDcWPXlU8bmHWEiyaVHRvaIXSfcOy7M4R5BA1YWgPERqNIb5yJmu
X-Gm-Gg: AYBFou2/GAxC0S88WZj5cCLGqPPSaMkO2I0+Q7OxYygv8vXaZzpy+NMGFqYT903fsX+
	XLpqv2nRG16hsGU3GPTJxpoc95R6EtAqFshhMN1tkCwTB78LDzZLx2lyJiJ9tExK4Igwfzl/t7h
	BNymSOhgm6cGBSFPkliNLrzL+QM8rtqdSM4CUHtPOpyCLBLZ/YusQMRLqLuDAVnx4KJsuo3q9m8
	+I9rsleQNVwy2r5FKb3sZBt+IHNnr2lr1vi0YvE3+HrC5AdsDKaXleZG76cdJ1gpT+WWArRnaMG
	RQS2b8raGyelGM2tbF9Doax0T+an2yJVb/OK+Z9LiUxhhtPxXi0JvQVuXu1O5duW9DSW5nl+2OJ
	7fHyAkF3bociTKT5rAO7Isw==
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr4177426085a.2.1792152810810;
        Fri, 16 Oct 2026 05:13:30 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr4177421185a.2.1792152810265;
        Fri, 16 Oct 2026 05:13:30 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dcf35asm65905066b.19.2026.10.16.05.13.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 05:13:29 -0700 (PDT)
Message-ID: <c1abd9d4-98ef-4469-b4f3-94a8dcad9d0b@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 14:13:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qualcomm: qmp-combo: Differentiate clocks related to
 the USB block
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, jason.pettit@oss.qualcomm.com
References: <20260930-qmp_phy_usb_clks_v1-v1-1-d4dccc9eb263@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260930-qmp_phy_usb_clks_v1-v1-1-d4dccc9eb263@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pkluZvtV2ehVFsyabayiR_pioJU7fVkK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0OCBTYWx0ZWRfX57wWI5x6xBbW
 K7+BPzJ/bdobprSA4CiWBflsOJa9IKAOvBcbGimsi0DqPS+yYtZDErVdZLhLWtdBUFmvdodY4Eb
 xYsUVg4kzAaVCk5EJDxeAxfu7HEWZvA=
X-Authority-Analysis: v=2.4 cv=BZdNQbt2 c=1 sm=1 tr=0 ts=6ad214eb cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=p9KmNGLgWT_GFA4DS74A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0OCBTYWx0ZWRfX4M9UibHP0sVL
 BsrX6cExbTcKFoAwqIyIcYUcx64GH+L4Uy7KehAK27EY6MjPsbcVJKF9hw+B+xkKbH89yGJI6Q/
 X6OO08EtUNSZLOeiJmNk0+mjj7ei4uS6dGNjhsQhaLIWjTzVkS6MshLCoqV3OGsT18pCtXo6xlQ
 Z828/pPWOq3KfSae5N503Z6rJ4AHZXRo3QSdULPFb7S0maBjKozno66lCjVl9DWVBN8xDR9JaPu
 uMAeHUR73y5i5vKgiS+jx8/R5zhdH2zyyA4BgrUoi5iYCG3Usj2txeM/8/iqWY1TmpkqSPmrkBd
 WoHiVzJmdJQ5ImrRj6/utX6WfnWTBn7gyqcBWOWZtijWKyLd6yM5hgH7QsmI4GbgBkLaLWquwb5
 pEzSqZsGWyYXO+ZN5vSA5Bs9NAq59iDBR8TaYAJ/NNcEwuwkqdaSjMSvhjg+kTlnOJUVXGlGxNw
 gyYDxrZF/Ee+3283h6g==
X-Proofpoint-ORIG-GUID: pkluZvtV2ehVFsyabayiR_pioJU7fVkK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160048

On 10/1/26 3:16 AM, Wesley Cheng wrote:
> The Qualcomm QMP combo PHY has a USB and Displayport block that is
> sourced with different clocks.  In situations where the USB path is not
> utilized, and only Displayport is active, unnecessary clocks are enabled
> and not used.  Split the current clock list into USB specific clocks,
> which will be enabled whenever the USB initialization routine is
> executed.
> 
> In addition, move autonomous mode control specifically when USB is
> active, as its primary purpose is to detect RX detection and LFPS
> signals, which occurs only when USB is active.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---

GPT has the following concerns:

[P1] Don't disable USB clocks that USB init didn't acquire
drivers/phy/qualcomm/phy-qcom-qmp-combo.c: USB init/runtime suspend

When USB4 is active, `qmp_combo_usb_init()` takes its early return and
increments `usb_init_count` before the new clock-enable call. Runtime
suspend then uses that count to disable `usb_clks`, although that path
didn't acquire them. This can unbalance clock references; the count
needs to reflect actual clock ownership, or the USB4 case needs
separate handling.

=> the USB4 state machinery is a bit fragile.. but perhaps an if or
   two will solve things

[P2] Unwind clocks if USB-clock resume fails
drivers/phy/qualcomm/phy-qcom-qmp-combo.c: runtime resume

The patch enables the common clocks and `pipe_clk` before enabling
`usb_clks`. If the latter enable fails, it returns without disabling
the earlier clocks, leaving them enabled after a failed resume.

Konrad
