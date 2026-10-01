Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2253A4C226E
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 10:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790850416; cv=none; b=Sx9JZDaM9jx01sgO9FZ3vhziOf7dZnnpWzFt3gW3eV6L/udPX9R0Xu4donGZ7p5+klN9XmdUMi+4xue/Pa0gPLykhj8uIPCu6L/cYlPC8taGP3+J1Tk2dUch6fK0GyHUIZ1lRZoLYM3EZnB25r7C1c9QiSIyQ0uGnvPo9I/C6/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790850416; c=relaxed/simple;
	bh=eohuNh6KlNYRYQy/h/SpErgS+IhO/ceGUJkjacyVjMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k8eK2B3OE4bxnu4QD7bUtITufsEfe2+BgZsI/GFpleMR4Sw3aM100S2X9zMuJkWtiG7Cz69K4UJolSFBEWxypiY+lCMXMY1ibWd59YThuGZnA6jAsy4uFitwXJNmkYZEAvSSZLekgSxH+IypdO29UQo1M04CaTFroQwSpdSBrTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aA5UQrzl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ISOAK7VN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aA5UQrzl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ISOAK7VN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xN7H1062190
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 10:26:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LGpC/EhxnEGpBcoNZ1aQac6B
	F248lrL0gT0U/t6mP1o=; b=aA5UQrzlLnoThkJhlyAMOr2bKa4Rm5K5KhoElpQM
	Xe/ATA06pFATQKQZSTHfQ1uIpU+8Y0JPAirK4ObY5jERCFoh4gVFarcsNMXgCC7I
	eLCs1Nc62gtxYKIYbftuJ8sZyyN0D/zOSrxQuuI+4UztlPvAyrS/L2omqGY/E9pU
	PNBvFfQZWwPgdFF04Bi6MkjBDcVKv6nM3VCyhcsjJKe/M7M/OvMt9kEnyI7dRb87
	u+0RkOk0KW6oXEezcChrYoZhztxYV4DC+o+halPYYxz82erLNeLJ0rXj5uacwz9o
	lI7ymwrSqF7pZQ58DWZpxXx4Y49zxo9Ng4fJRqO76HkHvA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17mvuc3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 10:26:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939f3426a7cso1402721885a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 03:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790850413; x=1791455213; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LGpC/EhxnEGpBcoNZ1aQac6BF248lrL0gT0U/t6mP1o=;
        b=ISOAK7VNrbOzhd6swgQd0Am6QNcO4rG4FKbSwZT6G5PizxnkRQKOuv/V20Yu+UXami
         3Y1RWvM4fdl/80nChBHhX5UMQdZWp78yCDesc4bRkDy7qQS8scxUofLB+nZKmFTm0C+r
         tbsFxerZ0Wklt1OkQxb0FPSGTNG7LOwLnkEAuwoqe7m+23herQK79gpKOfKsnv4k7a7/
         2FwnZKt1/JBf5Sj9rkWsPvhocazXVKbHzLLTzdE41AiHeHOQxXCtUMhcWe/Oh4f9sGuO
         nyOunKpF/7hiCy0Uuz1rQZ/ylOcdlNxuyTVAJudn9xaRuj3SJ5Trps44wVx2T1FZWxEO
         cq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790850413; x=1791455213;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LGpC/EhxnEGpBcoNZ1aQac6BF248lrL0gT0U/t6mP1o=;
        b=iEfXtMkUhtuMcKmOg6V7rRW9LVaf4GcZ2/CPVJMTDIXysNjp+be9lIhyONEubbag3z
         ZGzVlCYPtKt76IkWcAxkjhWUpARtBGWgfIGRGnvaLn3gE0CiDKF+vryxrQYUeRPh6pZO
         WntiHd3FASVxcVj+spFs0sbcj0QWMubLEQAY8Eh5No25l+9WV/yQrCJZINbe+XdmPraN
         79myT24W0zcFwV3vQ7uMwArIKt7Ck19GwzciUhi9LyCbEsOoX2dAU8mWL6KTraqB1nwF
         YGIDqnawdM0WXqEN/dwYNenNyDz04H3TgyZksejTYL2iHJyae4OQbTF7eAd9y0O8PI6B
         SzmA==
X-Forwarded-Encrypted: i=1; AKwUvBz4B6w5Kxt6tldKvRnRQTs1w1Ucw0LwMtB97lnOPQGjrn8ANCfeo1RyIQnmzZMhpGaSumTRrj86vPjbXGKO@vger.kernel.org
X-Gm-Message-State: AFuF++miDng2Qc0YRHjaG2F5dAGBT26qTKOrPzcSLMuW2iA16NgyhAXa
	Ba6sfxqubOM/E6zPbYL1MAu+DV/vjIqGKDC6Re+UdH2KEhoX1BhzVQpRy/NHm7FwGbwjPukdVS7
	xZII4rSDOmIzyYqwv9lqzPqQsuK/R+uitSaXJ23OCgVTPX2BH39ZPYu1rCWqMrcIW3B9j
X-Gm-Gg: AYBFou33F6ELBB9UozNNDm8n0c08tYySxZ7TeHChKvkazucdjMKO+705576LEfojNzV
	uaCR14DXtR3J8xy6v6RdqyQZ0Wu/KSRBW/N4hbelLzD+oEvfr6ymIR7Sq6sYyX/3c7xufKa5Bli
	8dlLW//5sLI6WXEYONLyfdRYxQjfJChqgKkdVVEQtNGogdDTBf0Lb5NnTOtaLmWjPBfSBSaccSp
	nTGN81GvtpqzGTO/CFlEL1j27ENj9jtZlNVapFjj3DAIiLXGZ8tWvtElv7allZFdWa5CEVpWsWM
	/qVa1g2BgDDfdR0Xs8gtCsCAPoisfg0NO02XB/KtQcHJvvACwrvqEcLVyjT/nak2depXRy5VtAa
	iX2z7k8/Q9gGGsmYfzi4Ju0XrVP4dNCGsAdUOO3Fvcl+rAgGFssHJHvge7S5z80U1u7DvRuJuts
	GzjTdR4tohwN8y
X-Received: by 2002:a05:620a:6c85:b0:939:e93d:a66e with SMTP id af79cd13be357-93ca96f4d85mr760517785a.42.1790850413170;
        Thu, 01 Oct 2026 03:26:53 -0700 (PDT)
X-Received: by 2002:a05:620a:6c85:b0:939:e93d:a66e with SMTP id af79cd13be357-93ca96f4d85mr760514885a.42.1790850412679;
        Thu, 01 Oct 2026 03:26:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a7717f1983sm15528721fa.16.2026.10.01.03.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:26:51 -0700 (PDT)
Date: Thu, 1 Oct 2026 13:26:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 06/35] drm/msm/dp: add MST stream register definitions
Message-ID: <kum6ib5bbkx3whaxlhhcuoswwctyi4vj2ya56dastd46jj4cyd@hh5ygaikys7q>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
 <20260929-msm-dp-mst-v7-6-4b81473185e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-msm-dp-mst-v7-6-4b81473185e7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: uqFhb3U3cs9VmsIb9u08XL2RkIPYZeJU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0MSBTYWx0ZWRfX7zB+Z66yFqPX
 hwEIigETGUSO38ru4wG243noxmIad1Rm5BV/Oub1D8k83vfDlWBWLsMEEs6mzYZiWlSP+q6pqDk
 Q24O7XU19k6yCQBirR0NWgD7DTqLWrNTGKSWBu4QQ8RcGEpSBRxaOksnIda4ZqNlb/GeycR57gb
 kJfLi11ozy5AyiCRO1orTeNYYR0YtVscn7ekuapp8tPHejMtGi2s5aNYmJr5N5dhEYjxWOKuc4z
 yD43XJLyGTzVT8NVpCaqTF4cG3LZPDfMiNTLm78kkOsI5AgrtihRZ4uTmrZOmCBUuCmjkuAQ4Y3
 oFipCVPdUTAM8YY13Ri/H7lGLQrSPNLllZIsD8y7bmmGKTyjXd/yqpJ9FeFwCBqfyZitvuNI58b
 xQfnND5tGxahIE0OdSaR9qtvtzBw5s8XlrJftcxlcqYAWU8dX7u8zyojnptj5Tqy8lw9fPwf5Nd
 +d3P1XYv1XVlgIeIG3g==
X-Proofpoint-GUID: uqFhb3U3cs9VmsIb9u08XL2RkIPYZeJU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0MSBTYWx0ZWRfX1ZCttBYbM6zb
 FRViFKbFtDrY6v3MKkHHvh7V3Ezqi2eLX26llaIgpATFVlEP/nbkvwRHQjUU+TnNSojf1DUJTSi
 SsJKvKXCmO/6DBfpf3wiEqnUNTTAq8A=
X-Authority-Analysis: v=2.4 cv=KuvYSmWN c=1 sm=1 tr=0 ts=6abe356e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=xXsHHcRzK17jFORm5UcA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010041

On Tue, Sep 29, 2026 at 12:25:30PM +0800, Yongxing Mou wrote:
> Add the stream-1 (DP1) and MST-link register definitions together with
> msm_dp_stream_reg(), a helper that translates stream-0 register offsets
> into their stream-specific equivalents.
> 
> Keeping the register definitions and translation helper together ensures
> that all supported mappings are defined in one place.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_panel.c | 65 +++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_panel.h |  2 ++
>  drivers/gpu/drm/msm/dp/dp_reg.h   | 56 +++++++++++++++++++++++++++++++++
>  3 files changed, 123 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
