Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95242490C14
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 11:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789471479; cv=none; b=MNJHFLcxF1Mu84NpehY4eRetldXWqFKeimOybPsmaSUBgEEPC/JTGY2tKLKU6f8xZoCwfFt/aQZPZ9ABEYk6crqIcNsJiYp9bD4aas/YOVHbgA5JuerQ0sJIH5mK9boM1QLsG6KUpoKuzgITwEy9JdhRP21qvihdpeHfGMcTDUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789471479; c=relaxed/simple;
	bh=yrTda4IGxlPJdP7jy9TCpvdj+4mLWt578NbG+mNspc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CeRT36UcsLYWQNJ22my7zyIxOzOtZM4W5s3rX6RtF3Z2YmYGTj395nDkvu0eI5frNuvTEDMkCG9rpsZGj+XS+DCSh08+sOtfOkhqkE2LrxWrp0nOOj7Ok8R527WOrZmMoJhwpHVd1iZChVTRGnV1kLo9wh4XxtYxM5xmFa/Qr1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JS/PmAip; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gIy0ezBH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JS/PmAip";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gIy0ezBH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9gvAJ2584514
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 11:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VaRSUKstZ4CTC8hksspLRm3sVDg2vrM+W5pHvrhsgG8=; b=JS/PmAipCPoTd4l5
	f/hiOFs6C1Xpl7JJ2E6ptXsUYIT6dtrkX/SLHcDhGtjfXHvzKzNERXufA2EmmPjf
	RQKzYq0za9rTZdU8Ysulio6EWP1+4Jkd1mNMg24rGPRaMNm6VQMPh5Jpgiv7CWLv
	n5YghcylImfbP2qE5FKN7FfHJx+3zfs6XeJmEJBroqvdV+xw8J4yx5tMlI/MiezB
	wQ0JoOnkY/76lICM+cW78iXZ9EW8iB+lBjqjLg8kD5DCfmddcIzLGgBfT4nVyWK+
	2Xjk2j9qsQ6iwVnSvizrTmMV8+oGRJgeu5YDpImN+U9bo0PocjNt4ac7F+MUc/la
	du79Ig==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpx4s9rmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 11:24:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6f80c76e6so81395725ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 04:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789471477; x=1790076277; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VaRSUKstZ4CTC8hksspLRm3sVDg2vrM+W5pHvrhsgG8=;
        b=gIy0ezBHv4YgKi/A7WimCbu8BaeMb/udHHzkeEioUgIYkF+hrKN78ylr9tbknUUCz/
         q7ythKLMMijg7RQxsxjqkciwl2flORnY9FIOWbsxiDlo3duHtD+tr7jOUCblwsy3Rwfp
         nIOA9qvoClVvLDPm6ZaUcdMudEI1S0URugNzSdSWM8CyQZ2d4Rz7kNbE2C0CnGq63sAl
         sIu2ZnCdOxS41ZspH60PwTeks5w4BOJqKCHUxxVsvBZeluZdNTrqtx1nd1rwn/UAm7Jd
         mQ+9S40X0IhyOfIU1fgF3madwaQKATrdg6/d04L67mVZYACr3/qASx+cXNg5gsv6jRQg
         b1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789471477; x=1790076277;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VaRSUKstZ4CTC8hksspLRm3sVDg2vrM+W5pHvrhsgG8=;
        b=UFOhNtfxOBq4p3/yaAkqYS4F1ON4H3DWcPqtzxPaujaLw9sEM3IIPjeyheQYUi7H2v
         dGakLFZdevTKwbjeoLmrwdusTXewVfA3yL6135PtPFrnIhhQX9WlAShl+qJpH1Vr3ZpE
         +i7YtQeBabjvR8/7UEQBm/cbmZMlrFwQIue2/QWK0lUFL5DdkJ4h2nFCl4weGIZq9HO9
         feRHllLCHGL43AkiGdULByXNSmzbJ3CfzEwsOvn2zbAWkr2iO7RN2Z394HCznhD6DQXt
         EEAcCS8rdQddidHZ2YxQ7ixE958jbACncXbmqf4dM8F3s30b70xL72c2fmza1x0doPgf
         y1rQ==
X-Gm-Message-State: AFuF++nuiyCu0UuV+xPzyr6FV1AmkPQ4zIwFr384VBQl1XB7nbwuKk5h
	/qiVFg342rWRrMDaxdJG/Wn1w3GxeEn9JjDD01E/ONh+DlvbKZljLnFfcm0Jyi6qTJ6teBhuiin
	uhbeOZOmLXoGQ3zZM8hXDyAlLcKVSBEWIW09JKUHHnMPVBsRYncJ1g5KiIxi4zH/1NYf/
X-Gm-Gg: AYBFou0jxM2RPlEdyjjlYsagpgLQTdq6dR/FvNxZb+xUBsr+E6mUWiBSLsUxe54bNJX
	Zk+7W5+P5gtbxn3YNvxrhBEXf68wTplSxpCsOIZd82gyIJARIlE71N2G7DEkVVC8cJVT5UthYhY
	6ZSqffX3m77Z0HmPbp1g2IxntpRQLXUtu2O3TOhMXWKaIRB+yPRTomGw2rYSPO/H0l8ed5Sx/2U
	s9EeO3Tn9pgCYH++krtjvjMsleNkbSlHNwDwHqEOQVhv75OXHmnexBrgHu7Jzhpi5iznYx2Z/bT
	7w6NoBqZYcRYl22a7nCs2FSXiT9rJKUxe7cYbO7No0d7Sn6/VvsjjzMwq2VO/UN6rxG6drhNLq2
	E8D6Vb+0tnlfXMB7xoGI5AwjiJ7pRAQ==
X-Received: by 2002:a17:902:ce0a:b0:2d7:3f6e:5cb9 with SMTP id d9443c01a7336-2dd6c5ef145mr148322625ad.8.1789471476941;
        Tue, 15 Sep 2026 04:24:36 -0700 (PDT)
X-Received: by 2002:a17:902:ce0a:b0:2d7:3f6e:5cb9 with SMTP id d9443c01a7336-2dd6c5ef145mr148321945ad.8.1789471476469;
        Tue, 15 Sep 2026 04:24:36 -0700 (PDT)
Received: from [192.168.29.80] ([49.43.225.229])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f739b5sm33036473eec.25.2026.09.15.04.24.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 04:24:35 -0700 (PDT)
Message-ID: <7a235d8b-871c-45c3-aa15-946abb6c9135@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 16:54:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: qcom_stats: Add support for NSP subsystem
 stats
To: Navya Malempati <navya.malempati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260908-nord_stats-v1-1-a55adb083d65@oss.qualcomm.com>
Content-Language: en-US
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
In-Reply-To: <20260908-nord_stats-v1-1-a55adb083d65@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE2NSBTYWx0ZWRfXwTL96oFTlezl
 WMOs2Z880wP68H0qSjMC5mGTb6dgsczPE+CvxaFs4K/MFoZfiVTUdi107KLcKyxTnviUI5kUEGQ
 7UrDzKgevqJsC9t2o54YVRfA4qvgpd0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE2NSBTYWx0ZWRfX+2Q9iEdJrtlU
 QfWe0UOA3Kpx6lZ0s06fMN5XxuhyBuk02/rZc4e1Bf09RYxWT9hULBPS6b0jfj2Q3oV3zwpvVuU
 UcrA0vqNj2sTCBrQWGGed/AZwJCzJDK+1PUQgL+ZQWgWoU7mCds8IWlfb1Evn4ApSkUB7c8WVC/
 cQNdB2cO/siD+k7u2Sx7xICpo6O+IVzBQlI3GkVTWhMt/Vwnr1E3uOf7Lu1Yd8K8fCcp0eSd/OP
 T+lKgTav6Q6GdOTpMZt0ZNAfGm4yEl6IOP/H4vQNroBQfGXjviRO4lRXCLealPc8rxju2bisLTe
 rpWM1DWMUlBGo+2rTenNUtxz9qpvqM1MMNJNvLLFQyLry4gAKHYiwV0TjGJkyDQj7sJlk7r5jv7
 AEZtrAGMGH8UXIAAh8tvnE6FcaKFg0BBE7f3/NdxeoR0JuKtx5Fbk+t02Av4t2B7Rt1PfvIXVas
 1CO5h8hK9aRF3VyupPA==
X-Authority-Analysis: v=2.4 cv=HsDjiETS c=1 sm=1 tr=0 ts=6aa92af5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=BTtvqVXTyf5R/HSe+eGPoA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=DCVHxXmDXcIwS6LAp3oA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: TJi8YN0dfWHH1BKjqxxB-K2oy3LNCdMk
X-Proofpoint-ORIG-GUID: TJi8YN0dfWHH1BKjqxxB-K2oy3LNCdMk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150165



On 08-09-2026 13:43, Navya Malempati wrote:
> Add SMEM items for four NSP subsystems stats which are present in Nord
> SoC. Rename CDSP stats as CDSP_NSP as both use same PID and SMEM item
> id. Add new entries for NSP1/2/3.

Reviewed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Thanks,
Maulik

>
> Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/qcom_stats.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
> index 06923408bfce..91f2d1293124 100644
> --- a/drivers/soc/qcom/qcom_stats.c
> +++ b/drivers/soc/qcom/qcom_stats.c
> @@ -43,8 +43,11 @@ static const struct subsystem_data subsystems[] = {
>  	{ "modem", 605, 1 },
>  	{ "wpss", 605, 13 },
>  	{ "adsp", 606, 2 },
> -	{ "cdsp", 607, 5 },
> +	{ "cdsp_nsp", 607, 5 },
>  	{ "cdsp1", 607, 12 },
> +	{ "cdsp_nsp_1", 607, 69 },
> +	{ "cdsp_nsp_2", 607, 133 },
> +	{ "cdsp_nsp_3", 607, 197 },
>  	{ "gpdsp0", 607, 17 },
>  	{ "gpdsp1", 607, 18 },
>  	{ "soccp", 607, 19 },
>
> ---
> base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
> change-id: 20260907-nord_stats-ea163d025d43
>
> Best regards,
> --  
> Navya Malempati <navya.malempati@oss.qualcomm.com>

