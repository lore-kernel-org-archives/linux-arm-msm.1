Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916073B9DA2
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 06:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439979; cv=none; b=j7PKiecP010/80ZIQIae/d8/devau28lP/SBy6/cAESSRNZM8TOl8hxj+V7PxCx5KNPhP3NoTrjqpalgXbugrHnkAyaiVX+fNEFw2bwNvh+A88kxGy2+/EtSHuRFiAKRni7qbqGZLdBwfNW8sGayTnJf7n6xxelc1KYkfdxpx9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439979; c=relaxed/simple;
	bh=waeWroeP4xKtFKOgISd7hpP9YrbNnTVkhGw0oIV3/fQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XtnZ2QZJTJZEaITnDrwrrxdJYEcpzy+XBnWJOo9hbhJgmL9bboNWDe3RiCqRHIN6YW+KYf71CsCTSr0WSffY7seHk/YiJrRhXtIsMrEQZTfZd0XyLE162kdSGhh7sgBpo9V+Tv8/3LiKu0WZQ7vWvUbCb5AcOuvRReTyYUlsDx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VtR08Tba; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jLUOKf1L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VtR08Tba";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jLUOKf1L"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984CHjm930695
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 06:12:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h0f3SYb/QaHvXkN8gz/IfSSHe6Mh2Mxm/hOMkaVJ0nM=; b=VtR08Tba7WqHucVJ
	U+8Piw0OWr+jbsezrQNyIh+WTA8mRVuCxJKaCAnhZaW7jDJZjS9zb8aYltomoOjB
	f1TRxxShskiEx7Y7pO8QBE9CNOsDIKyIPjZ2OsDPE9M14lTX6y7pmKvdpd1gneNb
	n3peM54vp25KmPCBwuOUt4S0ipcKYwPVjSwtvSM+BVaahFh2H7fK+cydpoWHJevR
	5j3HLah8P72wZ31tdbKUfFInHCOLHV9oSh3v7dlvjfr4r+gdGtlTi4cAkdw8mxze
	IaeWTNCzKodKhMCk3nHrxxds76tD/diHUVPrVsvHKVeIM7OCowGBglaTH7ku6e5z
	nf4QIg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2sdbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 06:12:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e46c120dfso538642685a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 23:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791439975; x=1792044775; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h0f3SYb/QaHvXkN8gz/IfSSHe6Mh2Mxm/hOMkaVJ0nM=;
        b=jLUOKf1L97xPrK/9oVhVKoMC9r8VAjY5yJXrKLros3qaRSiY0goNcb4lTYzuXVZh47
         hCrKV66U/sqORdDqlpc5iB9ChrVc9V4SOcuJ3XG8Ly8Ar3GblVN8kIH7Xv48tmbiktS4
         Vh06alZim2HnHcPQX/kLuFpdqNpmqKC9Nyt82vyyKHBhPu8Qg6Tp3CcC1O9KpSChqpBq
         O18495dvCf0cTuiIqBLVYh1Cf/Lm2yQPdSNq80ZJO+hw5PWLFYgP/sJKhw17MsoiRBPS
         m/TMCjxeLKr27cEXi1yO7pGJUG7SUuaoMcY8kmHvyI6srPfnFvPkrImGa9JiPrik7cwz
         x2QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439975; x=1792044775;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h0f3SYb/QaHvXkN8gz/IfSSHe6Mh2Mxm/hOMkaVJ0nM=;
        b=uox4tkfNhNCkeiT6xd/kMNMGx13zB5hua/u9ICJTM7t95asc/zG1IWmxwKDXs0cDXG
         SMHlOnZQjLGk+8wBVinzGWwfnDPI6byldq+CJKwrfuh2Bi0LNXqZGV+7feqt8jkacn1k
         e1rNpfDQ6UOGLBIT9A8tijxUVDRZVJMk9QqL4M0ZO5OZ0V36u9Yj3wAAMkRqBAKXUj9i
         4dpU4QGLHFkhKutxjom7KxEuTpztvIG7lon5otCH998iGZiHu+TQFv21lpyw8eZjuwsq
         MuXQTV54If+EnvSQ2gmgElVIrjntJu6XWbj9gefoh2a4+lzF+8MghhE4GwDY4TbFs3Ma
         z14g==
X-Forwarded-Encrypted: i=1; AKwUvBzPPABbUiIy2jPg+ACFvPHopZFNMV2ppQ/e5dyrxNxMi8CcMe59NZRXgcdrVr9k62nFCguYH1LEIcuNwEVO@vger.kernel.org
X-Gm-Message-State: AFuF++nWahYXye1sueNUzdGFTwVd0nUpiWzTgodbfImS0OAES1iQy4z1
	FS/Y7CZ7aEYPXIxSK8Y4gqGRUTDr6wiOwjDLAi/2OI8Jv8XzSdzUuwLvyXiCHCf8v7TEiTvixJM
	8uTFLuRRBMWxRcdwUqRB5Mm4WEjUnGxJGdto3owKCPRykfppFcjmlKDw2f9eQOKOKygs8
X-Gm-Gg: AYBFou3qddpnb8rFT7htNGaGusvaL/apvPrAPxmzwsrocO0zLcIHh5JgkpDJLDGI5Ga
	Zq/2GImeQd+322jO2K1bQ7PtjFvJlMg3hldrZrt8nBE+6WSTZ7l2FGCHeMAsMZwrHq0QcSoxlRr
	eAy3hbQBhGhcJEK4Hb5NlmHXeGCl5+wwGNSNSku/R238+fohJa8g/5nH89BveAQg5rO2MY3Ob63
	ImW1Z1Sa2z+oH1lehDt9bci1hpT4sqQQHpbMxDEAPKniZBNB8hSlGuqjXHOlYYBO8O0Eyt8Yfw0
	yq3bYcUjVxX+LwPBCZmrU3YF46cvWPbXEkKJF+q6StRDIOqdPbN3Zu3SkR3Hqi2LLuPTYkVRfdG
	9HiUM1YFOKw0bHw3rqmSFZS8SQAcyZWDa8rO5y20=
X-Received: by 2002:a05:620a:1d0d:b0:939:93a1:1383 with SMTP id af79cd13be357-93e9b75cba8mr846472685a.32.1791439974552;
        Wed, 07 Oct 2026 23:12:54 -0700 (PDT)
X-Received: by 2002:a05:620a:1d0d:b0:939:93a1:1383 with SMTP id af79cd13be357-93e9b75cba8mr846468785a.32.1791439974060;
        Wed, 07 Oct 2026 23:12:54 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c75b4e399sm8112748f8f.56.2026.10.07.23.12.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 23:12:53 -0700 (PDT)
Message-ID: <2b5c6895-58df-4fae-8d65-24806cea35c3@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 09:12:50 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 35/74] media: qcom: camss: vfe: Add helper
 __vfe_pix_format_is_raw
To: Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Keke Li <keke.li@amlogic.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Hans Verkuil
 <hverkuil@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>,
        Robert Foss
 <rfoss@kernel.org>,
        Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
 <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-35-ed985aefd611@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-35-ed985aefd611@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfXzH8M+3r7lqW+
 o0j2BaMv0TGel+50k5TOeivXIwJUCa6S0YJKv33vvpCMKgrKvmw5KVPnNgRQBXafvaY/ZlEdISs
 MFhO2Mv0siZG2BsGigju9OXMkX+N8JU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX/8e4iUCGaRsR
 4EyHFo1v81+PVuYij5atg4pAeZWLSz2WZ3JgFIKAjI6N04ow5+bG78EPqSC6/mpWuG8qttWG+nJ
 MeqhrC+5X8bE292OW030TlpL7F5VPBFSJAeK3oklyCEqKzwynfLYtOGa4p/7xkjmUzhEnN11xVP
 vjRA/oVLi6LY5/lxYOPA1kXi94BNQODuM9AY2E4Wui029KB9YvSkafUcsLRN3ys/N18AvJpmSmM
 EQ9NuJuoTwyI8TxoQV059IRsr8xJG/90bdcIAyu0Fkc6U7GsOaBYsIDGCkJeee7sxyCTiJFIUY5
 9llIdAavejfndS01ZQ4zVqXjFfb0vpSgezxg4oCg6/M5kU+x3ewYKF83Rqoi/78Ev3Hqfph6n/j
 NQsh4VrnJkdO+Fc8a9JqnodymL/p7rueYCeUI3FOqMhUhdbrMs2Yd1IHg7rvhcmnfkW2TNLd9AG
 PYDeqhuTnKNPSm8Mrgg==
X-Proofpoint-ORIG-GUID: bB7IArpnjBrqlygbBKJY9abQ1HYLHDbp
X-Proofpoint-GUID: bB7IArpnjBrqlygbBKJY9abQ1HYLHDbp
X-Authority-Analysis: v=2.4 cv=CIm/zhrD c=1 sm=1 tr=0 ts=6ac73469 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=STDLOB1srjojY5QKT3EA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080024

Hi Bryan,

On 10/5/2026 8:14 PM, Bryan O'Donoghue wrote:
> It does exactly what it says on the tin.

I dont think it does exact what it says, my comments inline,

> 
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 9793df66b4149..43c91ec8db494 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -340,6 +340,18 @@ static const struct camss_format_info formats_pix_8x96[] = {
>  	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
>  };
>  
> +static bool __vfe_pix_fmt_is_raw(const struct camss_formats *fmts, u32 code)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < fmts->nformats; i++) {
> +		if (fmts->formats[i].code == code)
> +			return true;
> +	}

This function checks whether there is code present in the formats, it can be raw/yuv anything
why is called is_raw? Can it be is_mbus_code_supported? Or something similar?

~Gjorgji


