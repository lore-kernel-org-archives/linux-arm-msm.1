Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767DC3B0ADB
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 08:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786957081; cv=none; b=tf1sndwKWWnjtmTkPDgadPgpbH3c25lrGWM+If9XPPqwVM78EwCP5I0/dN/RBggFyIrz4Pz9aBNENzF0ATVmwYzEW2uGucK8/2bqAu9r7Iq4ZcjR5YeBH55BjYxNK3M86IQ0OiJibYnulBH+XfGlg5pDoY0gjFsKzCWrscJiX3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786957081; c=relaxed/simple;
	bh=TKYBri6DKV8sd0FHZUJ9/MBE8uF7H8M8Vq8i2x3BB+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YXyILIhX2WquM+TrpDMAYVK2JLCigU+j9IJ1BKPlxGL+ZeX/NL9pSQx+epP9MmZhYvfGPKlqaYGAA/wXOtIE9HfCZR8cnqDxs9MGH5n3rqrbGGAdn9QIXkI5yJHeOn/bmNWXANdj2V/Z9uI5sZ5mtN76ymXku9MEC8kTjEYS/b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I8xXLUyl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jGTsGzNr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I8xXLUyl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jGTsGzNr"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H8Zjau1323813
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 08:57:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EKIzOLeUvxkP9Bd9XeVlmRQSirdD70I3Zyv32RkrozM=; b=I8xXLUylHIO+IF3y
	bYpPPZaFdQedENtr+C4G7nVwYMpBySKV7kzJrXFrEwprcbppltiG7M54Xgjfss9y
	sZ09pWRwhbjyto4JILoUScEP6MmwcSJqwifI0l/75URCMSTNEfrgJH+VvUyqdL8S
	cYxfb0x4jYsRsIEmJwqDH4Ccgzr8SFw4Hg38xkzJ/rYEJ8gDkua5MVs4nQ+ufof2
	LeXw8Z6sw+Z+5ihg+eR5yxAhUaUbIU9NVleVUJA7mDXHNimaU1Cdw2UUNAfx5h43
	/OV0T84GQMLM7GFGwYPbIWrr2LbPLkVZQIpFwQAMZyMx+Tar60gGhiSKLziAWko1
	gW04/A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xx7g2pe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 08:57:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52b4e315000so12052741cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 01:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786957079; x=1787561879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EKIzOLeUvxkP9Bd9XeVlmRQSirdD70I3Zyv32RkrozM=;
        b=jGTsGzNrTWFW6W426jyBQGH8Lkoz+e2WvNojgTWBDrGqaebmBnwKoTGVN+IWYpFmPR
         F2ybVVp0RBDhECVz0gh4cbZtRM7EqRKcstgCsNLdFzB3G4m9otYPAMwWrFAXtWQSP/kQ
         ES28fJv++gwq8UcM/7AM0m7u8e4Qq8eOcCPdJmNCtKPvdyAB+re9B97POWJa0+vlyHOY
         WZkImNnEm3ptNjqYZIm5P4kMNZapFH/F5xGNY7jg+6HEU3CZwdu6IjHxv9H2ya0WF+iY
         IwQqSYImnF2ZJTA3Lhn2n2tzZ9noyGx4Z3x89bKnLMVvtpyQ3CTLhIEw54zB2O+Fw8P1
         ipEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786957079; x=1787561879;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EKIzOLeUvxkP9Bd9XeVlmRQSirdD70I3Zyv32RkrozM=;
        b=el+1xYZkULFpeCY2jPI3Fte/QmpGxPKfzW1s73VH9Q+94lD3AwVA+k1+HIh4KFHL1+
         4jIjCCodiGr0TFsCwsqkWckc5zVdOL3kw5LECHufU5rfNQCB3iq55zrWFTSk2W9/gNlx
         icxHspsXg1jhaDsbc2Dfx/Nw/f/W5wES9cdgnyD7h8rdnDemuwZdPmMyZKbly95Bkh5K
         /OzZBfVAui/0PJxqKDc/NDxnUCoyi+GYwHJBzJUK1iHMUejL4GW4Kxb3YuwIxn1sfJgU
         HcsOTpJfP7bQxdgfnj7FVSyT6p3Qkwb4CFzDeIo5CaYOWrU8ybpLUzG7wPGLSbeEwhhG
         HJkg==
X-Gm-Message-State: AOJu0YzGlfUrFGtD1skSbOBSs4g/8HPA+sH9Vdf0MTkZfq+hl2zdKbMb
	DYch6OUpfnJpffazJVp1TG/iUd/SvvzaeG1FnjTQKEi9/m8X/LdyoqI5IT18bYRBBLaT3Y8SENi
	LXIcWk5c+kPa820/xTThFrOa9pAHNuDbEDcOmtduxKARGjBVQRMVz5QqHHx3hGm4/i/YQ
X-Gm-Gg: AR+sD10gipZF3OLPiZWOjospYO3296lCY2fHnYxAgcVuGID3LJF+9p9JXUGG69LiuX4
	rjFDtfpvajMA9P7vYxtGn/IWF1zpuCkEYl9phYKUeMhb1+i6PmHikc5CNvXPDBfO5GvNGPmEzYU
	8ubdvJD28Pf844xEOhagL4ouQh2UuQ1ZG3TwqDHdusRU/DPbxC8GQDu2IxNrj8SXmXKHPf4yPgb
	bcjRN0Cer42PDk7ny6ylIXJdmCYUGfLXGSjKDMZYDsVl2Lok//NZ8yZLiZYOcs3E6fcxhh6zwVI
	JgL9loDQKdSJIGTEN/ANCb8b2EQ+PQjyAl5w0Odl2jtwXpcGjSuKN3eh4aC9TO3VWWJc/J3M5gy
	cWQxC9gkI7YBg3KJLBmjdpNoX
X-Received: by 2002:a05:622a:190a:b0:51c:2324:666 with SMTP id d75a77b69052e-52d85425e6fmr191591791cf.3.1786957078724;
        Mon, 17 Aug 2026 01:57:58 -0700 (PDT)
X-Received: by 2002:a05:622a:190a:b0:51c:2324:666 with SMTP id d75a77b69052e-52d85425e6fmr191591551cf.3.1786957078269;
        Mon, 17 Aug 2026 01:57:58 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217ff7e1a2sm24466366b.14.2026.08.17.01.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 01:57:57 -0700 (PDT)
Message-ID: <6ffd2827-71e0-4203-9dab-70437a205a72@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 10:57:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: QCOM interfaces should depend on ARCH_QCOM
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <888efe8e63b6a18fae4acd5a90a1e0e69dcdf2ca.1786012495.git.geert+renesas@glider.be>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <888efe8e63b6a18fae4acd5a90a1e0e69dcdf2ca.1786012495.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA2NiBTYWx0ZWRfXxBgvbM8VzecI
 +Izer8wCqtOjEexknhh+Z7ni9Wz8NsCskp811zLTnm8AC6y4Rmdk5D2tQ71618tAqRLQiKWWWCW
 HJqfAs8xc3YhQSS420ObATBk4zH09lo=
X-Authority-Analysis: v=2.4 cv=TK91jVla c=1 sm=1 tr=0 ts=6a82cd17 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=3ImISe4MDvEodWLrb7UA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 2lA2M1EWl4EP-nU23ai0PsXsyo4uo2J5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA2NiBTYWx0ZWRfX9Db1SqUvnw57
 NknGY22qKF8jUONAvBcv0ekgUm3R7lC+4uLRjBzFfundutz/TROY4L/9r4JbpFoLwzbTcXcffgW
 0hgZ74bCtKWQ4SSJBnR1Pcn98YEGDZMfRvI//3by8D9OtFiLp3Ejx4sLHELLMGR6gEK5/1n32kc
 b4UX33IOoTVJzWHfWesuIC3Qz6b9YyApBnwim4V3ULdFpWZSrmK1w+I/qP14EFnlv5HTomoFx9U
 IdrsDiHNJNs//ug3uWTXKMUsGOUKNg/aEgiPXN5ZmNjH+By1vUlcFfI3Z4dMw4+PUUSKfry5SBP
 3sy5mv6rLMwdvgBrvWfxiIBKTxfxZEJoDaOTMHN+BsmU8DnkSqTWdbKIBOcdRqqWczO6YPHnLH0
 8COs/Vklnp6j9bonuU4x3lD/gMAnl6Y61jdfq4QpO4ZvP27mFu3jlAz3qQT3H/7vdnskebc/j9l
 MYDmpYAvtQv5EwqZfcQ==
X-Proofpoint-ORIG-GUID: 2lA2M1EWl4EP-nU23ai0PsXsyo4uo2J5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170066

On 8/6/26 12:35 PM, Geert Uytterhoeven wrote:
> The various Qualcomm firmware interfaces are only present on Qualcomm
> systems.  Hence add dependencies on ARCH_QCOM, to prevent asking the
> user about them when configuring a kernel without Qualcomm SoC support.
> Make QCOM_PAS invisible instead, as it is already selected by its users
> when needed.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
