Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5563A2574
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 09:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788945512; cv=none; b=e2k/JEKhDnl+gbONf7Uv897fKggvM22pdhaiLcq9srHY8vN6l4UaY7jOGtNYgii1Scjjv+YCtGLgNR+FvyKb5L+qcdzSrBrilUN5wdFdDPWcPNXgBNMS41dltpS+xACNTY8ANe5d0hIBSuFzObniGat+xQGyYU+FiVFGf7HTpFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788945512; c=relaxed/simple;
	bh=SxRyqWCBHjHzWDAjeyEn+IJRbAXN37BviQxJFqbg22Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CgQVXesCbWO8PDbLuDQ8ulxoNwfnwAABZK0Fh325DdCZuQ7MULFroB1gpSVfw4s/60VhS5MP5lgjH2l2GHxrSEt1k+6Rr+pSyyDb7Apb1Idc2ITkHb0/zxrY8ZJjO+sFYnbycDoeKJKWwnbaYmjAL8i8pnSypf/vcMcwkwHmmDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lqg5tL40; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IuslRkkP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lqg5tL40";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IuslRkkP"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6893oxbd3771165
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 09:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4tTCnaPUXZPu+u+JFAUI2y1je+qTRzz+PfxElcpWic8=; b=lqg5tL40txC/Nobn
	gCWxF8hRx8Xb0YbEHSOoOMxpknm5kSJAdUL0Xy4CwRn5PXKmZpzbSwne/dYEYviV
	q40zad8lV008uaQ0Ki50CHqmMAO3q6ABB976fJ7lSwiSIX7TnBkSqyqaTC998QNR
	KVXoajZ576ZZXraSR8UL7+Q+AFaFTWfuMBO/6+DG65IMUQiiR4KFu7RnmP7fbKw0
	GjvUuQlJk4aoh0d9xXoz2+Of/yKH3OCHbiCtdOeCzTGzp51IuBATViO/FKAk0yxo
	F+ZNu3/TOsD9DVCMrN/yuVNn2PcDttfOxkjKiWdcmD1UusJE2WYrCxyy/j+v/s56
	w2oCVg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjywr17kr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 09:18:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9390890ae83so70808785a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 02:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788945507; x=1789550307; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4tTCnaPUXZPu+u+JFAUI2y1je+qTRzz+PfxElcpWic8=;
        b=IuslRkkP4Y9ub5qkkFUM10clvhf0ayNRZWsG60kkAVckEIwNfrw94iJ9k7yN+LH7bd
         8Zqyaac2hoijJB1krVPKUKL2j816SJv3VJ9VMw43vpERGXVmHvMr6in/Adzjkkckx2j6
         5rVPUYc7Xv0/HuqUzeQJqjaJxeMInjho0gUjvG2AVKHmtLrFnR+C1Exv6DaIQjSJmPLM
         t5b07EfOYXq6ve+x6y8gA33C8SE3tO8Zdr3nlLHykR/32dQSiVuLYJD2h+B5TFQ01Ojp
         z14b12ZdJsKcC446v2LBf9SxW4CYR3xDfOuHuwEj/e2GRRtgNx3uLWvphZrKBE+kS/3r
         ESew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788945507; x=1789550307;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4tTCnaPUXZPu+u+JFAUI2y1je+qTRzz+PfxElcpWic8=;
        b=QUyQn8aPaUOo+I3GhDZTo/8OuuaBMBht8DUcW0gDJgxxOmNs+Rf7Wx37Z9d6/F79fB
         ba1JpTuJraytClsvxeHEHn1CV5vIgrDTlTbwaCygxyPkjkAZpp3q6tKJkXzA2h7Cfx2u
         JnMBV0iTcn0RQMlGbLYhdXdynzsobFseGsGjrpXqedWALryIPLzVVytkUMiTPhkUWot+
         SlziVlloLv7OHUzZWE/xblgBOI5rtJjSDjkvA5n2BK3zFyIW24hmJ1+V+dlS5BAzgyQZ
         cJO3eG8aX1STbq8V8YzIFV0OytgcBPBamttiOniasvBbNK7pKlAL34W/pQ7MJB6HqVRz
         McIA==
X-Gm-Message-State: AFuF++kGG/Msio4SEger6fAlME3V4h87U3UAZWQft1UASE++wO9WkUUV
	lTb/RQyiL6LD75pw1tXdfaa5Cc+ZUvbyqBtmyTB9497USdMOoz3Fh2uMLsyapx+7vDxoZtV49cn
	QdhMAzILUMjuLIJRX10BHBlCs4vyRoCoV62lIsba0m//B26HphpietSp9rHZXVFrNV7sh
X-Gm-Gg: AYBFou1SMjJ46IbNb4eSXPFlY2hCip+qDY2vVDPJMubWOeppq0MJcCWWE884mWRPFJe
	fI4v7YItMimyBCTdOowrmPQQZnFXl808e0pA8wSLaZe1bJdHRMRPC9OjwhiWU+Ri7CBkWq0jPbR
	t9EVERrZdplRHF2BIgtZdrD0QnSo3LptEB5FVVOylasFzKIZhyaRjXCd/OuOgyt52gue3LOBOyF
	W5OWSCTmn+WzniKEXpw+gejfPNtJMdl7f2nYQgY3u2Yqe27tNOraXc7LbN3fCJC1Bds94SCMi5U
	KHVODOjq5RXFGac3mbnS9NCnVN6uoy3DiQf1uRRd6jWkkhhY7WXKkKNfz/UMMC+JL7LNARdni1p
	IaB9nvvvq05UGInAH4g3xSw==
X-Received: by 2002:a05:620a:1a06:b0:934:95d9:85fe with SMTP id af79cd13be357-9399180ba67mr2231700485a.3.1788945507403;
        Wed, 09 Sep 2026 02:18:27 -0700 (PDT)
X-Received: by 2002:a05:620a:1a06:b0:934:95d9:85fe with SMTP id af79cd13be357-9399180ba67mr2231675485a.3.1788945502185;
        Wed, 09 Sep 2026 02:18:22 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c261e24a9e0sm680491466b.4.2026.09.09.02.18.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 02:18:21 -0700 (PDT)
Message-ID: <9db74716-b0f7-4560-a5ed-9ecaca6a31b8@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 11:18:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] backlight: qcom-wled: Fix unbalanced OVP IRQ enable at
 probe
To: david@ixit.cz, Lee Jones <lee@kernel.org>,
        Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Marco Mattiolo <marco.mattiolo@hotmail.it>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, stable@vger.kernel.org
References: <20260908-qcom-wled-backlight-v1-1-c4dd4eabda07@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260908-qcom-wled-backlight-v1-1-c4dd4eabda07@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a4YAM0SF c=1 sm=1 tr=0 ts=6aa12464 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=FSV59ufblPRWrHBwF98A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEwMyBTYWx0ZWRfX5nBamubAB3Un
 HPNq9pqYCvd7YSiSV2gHokogfkitG7ZcXAWYm2PO6rhd1+mrC/TjH0ZRzMX2gXSu+dm/Vsg/Fy1
 94c4eYznmuh9VFpEuKZ4YjLOqEVbfuO0HP+LGGz12+JnIzzAm2DPHQKYaYglpOs9xvlL3dPS+qK
 aZ6VjJUnG6B6Aan09A6Ma6xUyqNl++2yEZ9Il27A8kHQxrXgfD97KiwEWg6YZVWQhuCIN7nEXZN
 DgkOhDa+EN9DWSFnFP/cOz8e4CoEeVkjAcCe/33YkAarlgTFY1T0QlkeA5fNJ2bcLb2+sUoxEz/
 QRhPCm2xv2EZDY44PIBCXp4ANJc/EOobXo7+Nv95QLt58V0jGeC1XUHWDAagktBSzzBmAQU+B5L
 fl7tQaZ8N6iXs6UM2svAtgtDleXlFxhpDicu1NpCY5fJYgVqgzfr+gX9J/vTZAzqo9HMnNUXWH6
 baRdT3HbRlZVFCFEN0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEwMyBTYWx0ZWRfXwB70OIlVfO2e
 T401MfmdvjuudXle56T1RTwFPg+1MN6vPWeW6kN7FiJp8F0glOWGsd23enB2Lu++zzL+tNNt1XI
 O1ywGPW8r/G1qxo/MNZGVAj96k9QX/g=
X-Proofpoint-ORIG-GUID: sD-f7TlE5eNlU9TMdJ_dSnGcjiCnxX5w
X-Proofpoint-GUID: sD-f7TlE5eNlU9TMdJ_dSnGcjiCnxX5w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090103

On 9/8/26 10:53 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> wled_configure_ovp_irq() derives the initial state of the OVP interrupt
> from the hardware:

[...]

> +	val = WLED_DEFAULT_BRIGHTNESS;
> +	of_property_read_u32(pdev->dev.of_node, "default-brightness", &val);
> +
> +	/*
> +	 * The module may already be enabled, either by a bootloader that left
> +	 * the backlight lit or by the setup above. Record that, so that the
> +	 * first brightness update does not enable an already enabled module,
> +	 * and so that the OVP irq is armed from probe rather than from that
> +	 * first update.
> +	 */
> +	rc = regmap_read(wled->regmap, wled->ctrl_addr + WLED3_CTRL_REG_MOD_EN,
> +			 &mod_en);
> +	if (rc < 0)
> +		return rc;
> +
> +	if (mod_en & WLED3_CTRL_REG_MOD_EN_MASK)
> +		wled->brightness = val;

This won't work for WLED5, you can implement backlight_ops.get_brightness()
and take advantage of having that function pointer

Otherwise I believe what this patch is good

Konrad
