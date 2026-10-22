Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792689782;
	b=fb0nEV1/TkenkIk8p1sw5Z4vI7Rkr188W7bayGSNlB7rdu+USs6mikw+r2A7gDUmUeZr
	 nalqsm0Ed7rKy8T3XXYcVqu3AIjuGv1uOY+iDMCHiK13pmlm8C1svOlK4J0T78jcYYfsG
	 8quSQWB6/O21PpERAG5mh7eEwCkVaGVKZGbrNoaAYCgKxhfNmLcgLfKafGKuXiPuTlkCz
	 aeanZVeHUxWJiFRIZq0JqsdKQR7Odi1QZv8M2r2XZrkJsaMzyiQDctKeogL1YELU1uW4X
	 rP60qrbp+Sh5BiMrIgvVuaq0YntfXL5RpsZx7zChrsZuWkNLiSRV/N1qGRH3XTInC9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792689782;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=w/BA3y2OoXjXB3mySNw0ub75AxUogb3EEtu7UNqKMkI=;
	b=MUIwkVlS90hfGApiJPn93OcpoRn8apaSfB73pXFWr+7MtfjTJfUojCSz94y6Zn8Gcd60
	 LEE5CkGWzPd0+tM3oiiTvrFfKTC+/RJqim2slUco4TIOb+x+z2nkAf5TzjmVtmNn2ClFO
	 1Y81lcdBP1VD+WUrESaUHoewz5AlLfJcyzL9BTGCXr7l0mmQ6tN7gLMrdyrIh42rwCyGL
	 bgpZF6dqJMU99j+phljYX9iON/cloZCqfSdjD3gMdcdkkZs1wbRl9s6J8TEAXkogoV/Je
	 0wAygY2V2z3lkx+x1ZwtgHYnKu3sDAgqiWk0zc8p6TWAkYnaCzmElnZPOO/ag/59Rrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AnJR1bnH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R0RtMfQ8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0517606A31F
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 17:23:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0517606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AnJR1bnH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R0RtMfQ8
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MH5spk249768
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 17:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w/BA3y2OoXjXB3mySNw0ub75AxUogb3EEtu7UNqKMkI=; b=AnJR1bnHub8n2Dsk
	PlaY5Er+I38a5c0bYq/NZXNjg7beJBG4/NmYYsTdv94f0/U56bmbzORFuNIni27f
	mZUqsH4R409pIXypzUTj0cix8G/DL8Jf14H8onZHRyakrjOoHAYpFR1338rkEoB9
	IK/DLvMRa5C2LGfpH6agh4GaOZtYKl2kgYkTRAe0wjwkxBI5QQ6baEehFn8yU5yu
	MWTDKXHaAQE/Lh+sPpnO8TR3v/AjgN/8cq5g9/TwqtcLb/QU533yvyIQvOEQ9IIH
	voohru8LE5vILX/FPLNiFCHOFaiBwmzUnE9H3gRl8Wdh/JEBQY015K6tMhuAaKWr
	Xj6DFg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnyw08dd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 17:23:00 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a079256596so117811b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792689780; x=1793294580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w/BA3y2OoXjXB3mySNw0ub75AxUogb3EEtu7UNqKMkI=;
        b=R0RtMfQ8VBuWu7jkxh9zApib3dMqZUz5M391YWF2iqybucubxJjHj3YWUNXO/EDlA9
         IGfEBYBC8t+Pqx6Esi7Ha6WgRBXYW1l5A/j3odKli+K2meldleYUPGNmoTRXJ7576kMY
         yh9QFcLG8zwaNS4o55x+lA+5A39tX8Mo7rFn368puOD6QuwOGqy/ApXFYn0jJHAXTlqA
         ENohKQ+UQmBxvFFBZu9Nc9aOZFDJ9H5XenA9c7KMBA53kKlIFLiWK7gBHWIV7rxemeG0
         fulYtoSWPaZwWb7WhfL4L0Z2TVOZhll8ThvvLdmch8ubKkv46KnfaTH9q/g/hDgrC+AE
         E9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792689780; x=1793294580;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w/BA3y2OoXjXB3mySNw0ub75AxUogb3EEtu7UNqKMkI=;
        b=bNEJwJwd/hR2UHc17PIbtwjg9Evk9LReGdrBOTD/FcvuWzIYpKB83xGjMdsSeAQg5N
         8tJk0/3xSFLddM/KdQN6zZg85zR120ZLI7rKAstjrKasVsgJctVuauLjxmUlp6Ij4FQV
         6vdHuZ03SPzmZN7f1rrz+3g3ybPgD28VoL4kawR4XOhk2eEhNAcN2HelxktRHo0Z5aEA
         DdMLyE/OSESnY6gS7TI4PW7rD5WCynmLEYS+x0SUduJh3HHkpd0wQjh13M1Jp5zKcbjn
         5QSqdm3h0crb92UwPK3W0r6dpRcIuH99sPSKeYaMOePO/EKzcHBOM5u4QH7IbLqOSLEr
         CvCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcd+1tRMxi4HAmAxjpmtGLQIVvl2829zaAF/xXnlP1l7H2pdxygLtsc6TJbTgGsJsF7SopgDy4jV+dB0uY@vger.kernel.org
X-Gm-Message-State: AFq9FYIZ9hb+mN8eENZwYPA9nImDGRYa/tlAh7lTvsmprIhzQDjAuqhd
	77f5kGpk64D5FJY1qIIYaoc76qDYBRHozkziVmmoN7VAxlPYVx5nUg6RnKvujjGINXhCInRJrgn
	hXcM9Zg02FrritMYu7hp+FydiTW4gwtWSBcMLPmgFcyppRdoTjqpnc+dYxmRD5QRY86ee
X-Gm-Gg: AYBFou0hprQUdHdXBEXViLsTcMvBCKOZIwVAWxTwLYJEmLfAJMERHJnsxPmY6OyGNad
	LpCsOKs4LLY/p5Nx3rFN2OXFa1FWrSRzuDG2HLpMFAtGxErcNcoK87yMFtfIMEeA+Fxaf+SWjCS
	njadlPanL8DcJIVrvacev+9DBGabigtITHaO8koaLP6SADbAShjUCfWUl0UlMop0VnURznLz2jW
	D903AAiRD08Dc5Nu+U48nnNyLQTOvy9cufq1L9vhWokwP0nUjwgiwoKREWGUQ0P6Jby8+VvOsY3
	rVHrDCtObragdFfxRb9YGMvW0ayXHyvbpOFLd0z6h524WHe8QwPo9EC6UUXghqXN32MTZeVaSiy
	8BLAOTXrpo+CMN+QzJENIYbuhPZofnQ==
X-Received: by 2002:a05:6a20:3d12:b0:3e2:117a:62ff with SMTP id adf61e73a8af0-3e287e96620mr5159380637.61.1792689779603;
        Thu, 22 Oct 2026 10:22:59 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d12:b0:3e2:117a:62ff with SMTP id adf61e73a8af0-3e287e96620mr5159351637.61.1792689779003;
        Thu, 22 Oct 2026 10:22:59 -0700 (PDT)
Received: from [192.168.0.195] ([124.123.194.175])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895fb005sm2450502b3a.49.2026.10.22.10.22.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:22:58 -0700 (PDT)
Message-ID: <22a87c51-4f8c-49c0-a13a-c11767f10e85@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 22:52:53 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] clk: qcom: dispcc-sm8750: reset the MDSS blocks at
 probe when the bootloader left them running
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>, linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
References: <20261022140811.469417-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20261022140811.469417-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: egXT4l38Gx7FRwkH36KKl_oLgoqHU9z5
X-Proofpoint-ORIG-GUID: egXT4l38Gx7FRwkH36KKl_oLgoqHU9z5
X-Authority-Analysis: v=2.4 cv=dphOmFg4 c=1 sm=1 tr=0 ts=6ada4674 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=b4qShTKTPH0tEwh9VF2HSg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=rTHtfaqMoHADTYiKZ3YA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA2OSBTYWx0ZWRfX+OpKNjjMxRKZ
 TnH9zRC0qper/bO4RyDa6/Xej1yUs3znmqPN9B8Bt3kLET/3FkQZgkDGvnfeefjaXlQswKOWhni
 O4kpzLN9ucb9svySt8bvylwyta2phCk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA2OSBTYWx0ZWRfX+txawxKX8qt8
 3oBa+gT4tcg5Av6SZh6VHKIdzHqAIl1Mo6k29pgIgHf+xTZwFAUZRvHUD3r9S6B8lvpph1BCsKd
 kzpcTPIZilNwEzeaxyJGFqLz8aVQ0vhGogmdd3tTUTDxr5HOb9HPMdwdbzJmU4LrBA2AfQaSi92
 RUaQF7OfTPyGtG50yl3qhIkIFz5sHdr+L052IG20azo3Er/9EYLitephfWsKDGmk08wsn6Pz84U
 6Lq08eu2Imz7Bw/qIiUP0zkLXarxJ+HnOSaj5ozZl9LWgHqKEGfAy3OalSul94fx+dXjycMFIKO
 yybeAxkcQh28Xg5wPqsnTNnPi9UBSE+jZJ/eKnpZ5mZFd9nc7UBsczaAlxyKNYO1ZjtnOY3YiAy
 dLIatQkZGlzmVBZinJGXpEkagHlQyy/0VA72319mt+qd/LUESRl+pr3WruxQLSNxVZv6PgdWVPL
 RVSRcvJyhHlrH8Zx45g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220069



On 10/22/2026 7:38 PM, Qianhui Xu wrote:
>  
> +	/*
> +	 * Some bootloaders hand over with the display block still fully
> +	 * active: dispcc PLLs locked and MDSS core / core_int2 / RSCC out of
> +	 * reset. Probing on top of that live state makes the command-mode
> +	 * panel fail to initialise (command DMA timeout, panel init -EIO).
> +	 *
> +	 * Assert the three block resets and release them before the PLLs are
> +	 * configured, so the block starts from a known-zero state.
> +	 *
> +	 * Limited to Lenovo Elden for now: it is the only board where this
> +	 * handover behaviour was observed and the fix verified.
> +	 */
> +	if (of_machine_is_compatible("lenovo,elden")) {
> +		static const u16 elden_bcrs[] = {
> +			DISP_CC_MDSS_CORE_BCR,
> +			DISP_CC_MDSS_CORE_INT2_BCR,
> +			DISP_CC_MDSS_RSCC_BCR,
> +		};
> +		unsigned int reg;
> +		int i;
> +
> +		for (i = 0; i < ARRAY_SIZE(elden_bcrs); i++) {
> +			reg = disp_cc_sm8750_resets[elden_bcrs[i]].reg;
> +			regmap_write(regmap, reg, 0x1);
> +		}
> +		/* Hold for one full ~30 Hz frame before releasing. */
> +		msleep(50);
> +		for (i = ARRAY_SIZE(elden_bcrs) - 1; i >= 0; i--) {
> +			reg = disp_cc_sm8750_resets[elden_bcrs[i]].reg;
> +			regmap_write(regmap, reg, 0x0);
> +		}
> +	}
> +
These resets if required should be taken care or triggered from the
Display SW driver. It is not on to the clock driver to drive these
resets. If these are done the complete dispcc would be reset and when
the PLLs gets reconfigured there should be a flicker observed on the
display.

-- 
Thanks,
Taniya Das

