Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560733CF1E1
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784536191; cv=none; b=cJGuaRUjJ/q3bCe1yocFlV6WxW1DOAqDBM3EY5H2PnHdVIThCNWFcM4X1BATUbLAapMTEFzXT9o83vJk5Ew0Aw+aKMMmZxFmDRoCdjqIfHEzu9W0uBv3kG2l/NsH/o1I2DfGUKmY3HLHmhY5rozLNpqHrW7wt5MsDa4otRv1pwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784536191; c=relaxed/simple;
	bh=HI2Kle/O/7od0kN24XinLjdCJprWHronJHrirEXxHWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e6MYLVahq1ilZKCgP12TT1+2B/GwAfKVMfjcDb/mbDCOf+/nPZ53pjFwzNfqh5/b4zdQnwdGkCtUYzdok2/7nojkYBNF8kKc//Yrx3/8FgAlxa4xUNYiIrTCyqfrykhKWUqQgBdeqn74Mla3Uqr0ELpQlH+avumZ4FoZtFyqtWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cq1bfko5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CSAo5YUH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cq1bfko5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CSAo5YUH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RVCg1420176
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:29:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rikuGpGfzrAX7InZWl2qF4GcA2A0r2MSevuAd9tWZOU=; b=cq1bfko5ALB7iqcJ
	d5rLXlUFnpgUruVa/tx4dG9gl/RDZDVDiYivn6ebgnNX45PEn40vB5Jg9ai+XrCv
	naTJKF8FO7Dnd0StU7CmzkhUBr1zamkCN4hejbxB+bhEYpTdIig0dIyZCs9ojfu3
	gmcsbOl7aobCmEx4VswjLXcumkzvsua4IrFFpeNQqifq+q9+BBpNYtMd2sQpoA+o
	qLDvy7M4VP9qGen1JW7kKpzmnRfLRlwZHOuUkMVsiNZrZOL7FoMtAZJEI3t1pXeG
	vzVDz458OvExKfL/N6ErnttqoSt/MTImGvnZRRQfTE4HYWazgxMWnp27NBEqec9Z
	uZZQAA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2s7w4pq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:29:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfd1772d8so16372281cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 01:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784536189; x=1785140989; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rikuGpGfzrAX7InZWl2qF4GcA2A0r2MSevuAd9tWZOU=;
        b=CSAo5YUHQNE3JqmdUmOIDTOvE9lAJWr041aN3KPA2WOx939T73MXwnUnKnADVm5lib
         LlFqYlE54dPD+gURFcLmmDSUr5zbRmJ5t3L957MvMvDIkoHrDSaIXWwHCZiOvRr2jRkv
         Zg2hFq58DU1CbrR1fiQvfe2LqTT+PofJ/d6bAT1Zttkn9KNeUv9h7UnYGHDSttoPD9zM
         U4SP8JycInSHqYF1d4X1ZxKmfRJmyBZTjnmztdTK9Yi7MVjV6mABTQZXrSUgC8ZEpZ8q
         XjO1l8EloL5OZkpnfRcfaZOKLhG21419elajuz4b+O2y/BqP6guzsA2yt943jEm/Otqi
         z5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784536189; x=1785140989;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rikuGpGfzrAX7InZWl2qF4GcA2A0r2MSevuAd9tWZOU=;
        b=mD/5uJ/WT/xX3+qhD+/NduHG2SW5wT9XN98LQpqIkeny/cyEt4OaOyHEuRCmmwyiXh
         gfhmFfBK5tajUIKyvwDnLKD+6a7hFbsyeyCal2CVs/MWNchvfPDo+8ivuugP6M0/oaUt
         qrtKKGPuRbnKkTbzp3k0nO22jQm/llB2J42IJS0ljDmgEXVEfkJcjOyVKwjZEJAtLSE0
         ACdCWdQ2MMqJ3WVO8QmYgPpHFtzACwvXAMnCvhh6+X5akE4mgDDhAvFF0LST6ZVTPNxI
         wdi8UlmSSINtNIAHJPDc930A07QBrTQeDfJ903aLKfkM7U6VbhQG9DxjM6XSmT/v9wou
         xrvg==
X-Gm-Message-State: AOJu0Yzp1bCpYEE1JDRILMZqKpDwt+G7RPOsvsjjgzgFHoeRtXQseuPj
	too2Obgu4urffbmaU4s9H08pVbjX3nPu5gxNVPN1NDdZc6NKONVzdd5KzP2ZSFxvXvdau5X/y3x
	mPv1D1JOng/IczYD8AZrS+HMZbwKiJXORqqbKZTCCSxKKhtzlBGSnZ3oyS5JnA/UdQaoo
X-Gm-Gg: AfdE7ckEgjaJ2GdSwXvLTNmO4+7SD7OBniVPy9mnen+iwUkjH9dWsvjcx1ls+SWdIf1
	a8r4vZdmhQYQQLTlBCJUQFofzNylFybiHznf3RQJcFPEyC7oaveQBFK9GEY29rgYwaalQRI+8FN
	nQp7CRjsgD78KKvOSVBC3VkshEaxF+1QQc7Fk7YvkvCVRMegCIkMUDfrMOiGtpeWpIbvM0v32zq
	PnLNEtU2ws2XlI/EtfJ0/M7ESKzcFNUOIySFkicyRe8ZNBbaRVYYG7jiYra0M5ZrfySJpEw/87m
	jnDR+9RYCRctZV07N8Islysuu6H+BWvsjeR39Hs6VcSYpkrGE989DJ3EZr7J+44rA2tTWKyErEx
	+J+6sP4zbmjvFHzZWB7b0whFw
X-Received: by 2002:a05:622a:791a:10b0:51a:8d32:f796 with SMTP id d75a77b69052e-52138ec38fbmr75708611cf.0.1784536188872;
        Mon, 20 Jul 2026 01:29:48 -0700 (PDT)
X-Received: by 2002:a05:622a:791a:10b0:51a:8d32:f796 with SMTP id d75a77b69052e-52138ec38fbmr75708511cf.0.1784536188467;
        Mon, 20 Jul 2026 01:29:48 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c17009adfffsm425952366b.11.2026.07.20.01.29.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 01:29:47 -0700 (PDT)
Message-ID: <9ca46685-cd1c-40d3-9de5-65e57621bfae@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:29:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] pinctrl: qcom: ipq806x: mark gpio as a GPIO pin
 function
To: Hans Ulli Kroll <linux@ulli-kroll.de>, Linus Walleij <linusw@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260719134548.8830-1-linux@ulli-kroll.de>
 <20260719134548.8830-2-linux@ulli-kroll.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260719134548.8830-2-linux@ulli-kroll.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5MyBTYWx0ZWRfX35l387ucfSbs
 qh5naYsvfZR9HU8Rfrts6v6RVNVwTEGxyf+FfcP3pV/IC5QqCOyRkclKmWmPD236ZE+G12bD32G
 VQpWoK1qmHGYPaiP+0K6MXWgIogi+tTu3gU/qPNP+XopHFcvf0P2Fo3U/TTtZTph97ttFc8jxOz
 G01GY/mygQItg3yS01rSNNoBF2jmuJoChnmLBQIN+PaUIpgN7aGTCfwbAtPZcxp9x82LH8u5EeZ
 IEUVBlwbzfE/oHIR+QmwUaPSlAI8TLEwccEu8iW1KQxWTynO6SKWI4kXO5kUCtrA0jUjDciQfP6
 XO+Kvz/muE+7ltT7NNBbQI6vcbLjH1Rdvw2vMAoNQ4VFRNGItBjz/vLPi+CinIQ1Na8inop0d3z
 eslfRIgDK+1lEE3d4IU6gsFiC1eHKssMPo6ajcs3olqWaI3AMsXymsQyu8wyZSbg8B+aT5AoSMe
 +GLrEKDBVScoWbORYqg==
X-Authority-Analysis: v=2.4 cv=eKsjSnp1 c=1 sm=1 tr=0 ts=6a5ddc7d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=xhfSZxL3de18q6pc5_wA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: DnDhX--vOkV6amxpTCUfY6VPvZUUrD0h
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5MyBTYWx0ZWRfX5julmJ49y1dA
 z0df4faw8e/5qEJlOxkgpU69X38QInwD73zaH4wdZnUg3Uu8IUgWmsUyYjN6DojLb+s+l6NUnk+
 /YnnVZNBJpxJ1KewnqfENk+S1KQizDQ=
X-Proofpoint-GUID: DnDhX--vOkV6amxpTCUfY6VPvZUUrD0h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200093

On 7/19/26 3:35 PM, Hans Ulli Kroll wrote:
> The qcom pinctrl core supports marking functions that represent GPIO mode
> via PINCTRL_GPIO_PINFUNCTION(), so that strict pinmuxing does not reject
> GPIO requests for pins that are muxed to the GPIO function.
> 
> Add a IPQ_GPIO_PIN_FUNCTION() helper and use it for the ipq806x gpio
> function, matching how the msm-based qcom drivers handle this.
> 
> This allows ipq806x to keep the GPIO-related configuration in DTS
> without tripping over strict pinmux ownership
> checks.
> 
> Fixes: cc85cb96e2e4 ("pinctrl: qcom: make the pinmuxing strict")
> Signed-off-by: Hans Ulli Kroll <linux@ulli-kroll.de>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
