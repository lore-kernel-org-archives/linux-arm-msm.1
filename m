Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEE238332A
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 21:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789335975; cv=none; b=gYA4YFWDWEOlGFDPnjxpsveLwG7N2cYzXg5MqffeiAG/yRg0upyfbszYilr5bvJOnjvl/v+9qZAAOWe7BGWCJYS0syOC994Gg5WxIWf0/D3MLTt5VIvQTHc7sA/uiIdX+SAaLp1py9Xf+ciqsmK+Ia6wIRMosDldRSgu0hJOZh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789335975; c=relaxed/simple;
	bh=ZkAksoF7ZmwppBOX4liC5lkJMiOS/s1heEZxMpA7zt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b/Y3sgvNCjbH5lC9+vKhj4Wq3L3oIa0pi7HL2Lu0o1yJUIF/i6oTJ6oJxNHEFl59Um74r+Ff5i9U1u3890Ij1r1x82VYqYvh9NWjDklrty2/btfXdhZU+CiKoKQrXj4Rs75PBa3klANoD/v9ENjjO/Ifxej0Ya5qs8ReN0KdI2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NQ70ZX31; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YYm7J8yi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NQ70ZX31";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YYm7J8yi"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DK0f461988815
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 21:46:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vbAlXC0DW5rovY2mimpWnBtg
	9Fpne77lgrVF++LV5Ls=; b=NQ70ZX31srNGMLUNu1TbIFmX017U5TDAwdZh4+IT
	GHgBjBs6FEe4oLQwvAEt7OLthE0zK0FQRx/Tb2lmqC6xeipYB8OpoYKaK5t8gGUl
	szMg4hhlXrJXNlsLY+YOKXCsjuX66gTAxEiNMJiG+KBzxE6hdzTdfQlZexG0Wxnx
	RDAfgGPwT07AEBCJd9hR/4+sEAzV8+x+AxwD+JHhXhx1k6d4lj33Sr4HrgMS/Lid
	9ZS30EfGICfwJBPGpe9ErLt1xOVxRLvj9cJs3qUhaYwfsC6GcqZWfL7/STrTPTTV
	vTT/m40rlPjxtWX8iZUeWx2TFRw8PyO1VxHt8iir3X7O2A==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cc5vq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 21:46:12 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97e9e2deaa4so2590621241.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 14:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789335972; x=1789940772; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vbAlXC0DW5rovY2mimpWnBtg9Fpne77lgrVF++LV5Ls=;
        b=YYm7J8yihc3xe6/bhNyGQwaYNFdg2+WGN7Etp2kMFDYvYECffQ/O+dXtuuNaoGf5xC
         +porJ4xk6bB+NKmL0OvNCxxCSGZ/KAqQ3Xkr71dOT6iz5QC+NsTdFBZTcc56yPuj6awA
         eV4Q1lucn1JhWtkz5XXRaBxOxdjDjUyoopdx/XOpqEqeHpKpr+OTPv4bqVCf3ZwbsC38
         0mL65mCagAM0LTVrXsCnLr3Ep4UehOd1d2t1gY1FhnqcqfjXR/EZGoZDIV6zcxxYzgQP
         DXc4S5PUIbRvArfN9JQgMzx7DLNvLaFhacQCCoMYES6QoNMaJFPhdwSIHSk5WZXD9nPu
         SekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789335972; x=1789940772;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vbAlXC0DW5rovY2mimpWnBtg9Fpne77lgrVF++LV5Ls=;
        b=ijRFTG4QUOZTyjTOhbM2ric2YqDYbQcCFxKHPNWwUajtRdeMEE9RmXHcYsY6jMCXpg
         jfgrZoUUOSI0QdNzRaS0J1Wcxxlx0CziUkvf6h4k4nOPnlIMvv7naxIGjNg/+ilpnbAv
         TJuNQy68hsfOkBmoDfkvzjubiANJtNhB6VefMe6XwzdD+hd6C8TeJrBc5K62DGKSlgDp
         zAeBZxqy/RmZ2aKk0sUBhKPMROAKitqv2p6wLU5wyxSOzhEUIX9dAJ/1NAaR14bN48iL
         VNfOig4XQMgh/hdw/q1JX+1+rD13ivRDr+xiEg/dZeuc2rYr6PEOJCCCmyJR59Iw8wRB
         Pblg==
X-Forwarded-Encrypted: i=1; AKwUvByt70FYOCv0sv9WUFge3xZpCyTAQqHMrH9lmCCFUhP02Z56sAK5+G7xoy8ATMdDxJ7gKTcwYFttzHDdjXnl@vger.kernel.org
X-Gm-Message-State: AFuF++kVrMpYbf9YHbE+T7it0lk1x1Dk2DwI+o7/Co2SN26hFlEtDtoO
	iB9MwL4IROxHG+EYDjAzB8BjN/3eB7fAKnmKLTaD9RS5QSkIoEU5YVIE4jI7XPQfbczcCX/ukom
	dPfor4ukSuevazqwP1B98h4fftMgzknRCTXoz2UUKPpQPYsiRvjOobVTFJBzSnzaTFjLQ
X-Gm-Gg: AYBFou2+MiH3mmiXK1BEwCpRzm1U7Tih5Ec70AJzRemugAGzaONSO3SY61ky6brMI2N
	W4cfbnMJkFz0NFYZx35DD09oL2/DGsnT5RDnmwURZhOYSBIVaANio2hI4MVPJuNBu6MtWfLis3s
	+ZIiRzHLkbaw2c6EQU3r0rCQoyosEUuaDuXECwOAnUy0+xX4XkpMT0jWX24eoAic8mGG9uOaUjA
	1LhhqbKIgSScL5TE0zKD6Czxxgx4nR0t5w0E4xDcCj/++XBZ1d1yXE2bYFA5SGwfiGBV2HfPuje
	+uPORJIRwvmDTGTrlZuRkULQKh4TWKaaJ91xqLbsA20V2cIA20Flha3XTJRniZ5ayA/aDtoI1MZ
	YoT4jmdFoYHoXduM7hIfDUF1wd03FyiylL+0zNnhZ7Q11a/jqVhFXeWscjaE3EjKu2n/4j3r6Is
	Sc9lhoqQC4DHsJ
X-Received: by 2002:a05:6102:578f:b0:79b:1b6c:4f66 with SMTP id ada2fe7eead31-79b1b6c5faemr48641137.1.1789335971771;
        Sun, 13 Sep 2026 14:46:11 -0700 (PDT)
X-Received: by 2002:a05:6102:578f:b0:79b:1b6c:4f66 with SMTP id ada2fe7eead31-79b1b6c5faemr48479137.1.1789335966559;
        Sun, 13 Sep 2026 14:46:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0474df5sm1981637e87.64.2026.09.13.14.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 14:46:04 -0700 (PDT)
Date: Mon, 14 Sep 2026 00:46:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saim Shujah <saimzst@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Paloma Arellano <quic_parellan@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: clear pending peripheral flush state
Message-ID: <skz4w7uewtxgmiuhyfav6krul6b7itlfb6io2ysmcypql4dka7@ar5hawrzijaw>
References: <20260828065440.140410-1-saimzst@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828065440.140410-1-saimzst@gmail.com>
X-Proofpoint-GUID: L38KPjbB5m02GM7M3RM_nuVuv2ZeHLHW
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa719a4 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=RN2DTS20WyuIpY-t6BoA:9 a=CjuIK1q_8ugA:10
 a=zgiPjhLxNE0A:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMxMSBTYWx0ZWRfX1UhWagdVtJZ0
 XRJyoX5g/moKTZw5PmScMW1AZQQnXmaAH8OaGUPjxzvot2QFL6ACans0ipinNlxuPzBMeYEDEGe
 8Etp/y+XBiDzh/A0fJ9EXuQy4a3ookQ=
X-Proofpoint-ORIG-GUID: L38KPjbB5m02GM7M3RM_nuVuv2ZeHLHW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMxMSBTYWx0ZWRfXw4w/RkcADJNV
 A3I3EoZZGgMEaVxcNeUQ6thGBKLk3EN1lr5CrAsNlBoRNgkROZ5bbQqC9aF3+GCfshfZ6yBlUQX
 3nRN/3q4GOLyedwSyPRKokYvtepYOXyHLE6x7CnybdVJsDDIcbOKvPYOo4ypNpLPATxqGtu60IH
 DnOQ2N0NrqXi8dlVrx+N2wqCBWiXui2mMrRM/b8XwVdS4ypNWiKA0SOMyLp0Umt629vIeIqMmQR
 jMXsFeQzwK1gmMavr7YAlqmC68LCujlKbKi0dQE/2KTaxSOi6JU6+PPu9Cn9YR+qiVgaXnqCcBL
 hEb20HWcKvOQvbtcOZk2m6kEga4vhHXtdF/hy+qj0nmMtBAvMTa+bx8vmmbb/adWM/UHWdOYuT+
 TYn0wLSF9qCLkK5w/83be21gkkVsI972Z/fOtMCGzpFQcaH9dKINsOC72tQKt0ZYvZxUzbY73tP
 hFOTUptFlHIID7BQkkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130311

On Fri, Aug 28, 2026 at 11:54:40AM +0500, Saim Shujah wrote:
> dpu_hw_ctl_clear_pending_flush() resets the cached per-block state after a
> flush transaction, but misses pending_periph_flush_mask.
> 
> The peripheral flush updater accumulates interface bits in this mask. A
> later transaction which sets the top-level peripheral flush bit can write
> stale interface bits to CTL_PERIPH_FLUSH together with the current state.
> 
> Peripheral flush support was added after the helper started clearing every
> individual pending flush mask. Clear the peripheral mask together with the
> other cached child masks.
> 
> Fixes: 64f7b81f0358 ("drm/msm/dpu: add support of new peripheral flush mechanism")
> Cc: stable@vger.kernel.org
> Signed-off-by: Saim Shujah <saimzst@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
