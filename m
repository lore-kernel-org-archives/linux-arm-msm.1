Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AD44C6520
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 11:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792408761; cv=none; b=kb2lpy2ELfcMYf0TQTqIT7SnVl/+idhKiYZYIqSI3N4zul05qaFhOJJYt17khxNFE+zTwUELCWS+pk/eJNB0VS3y6sIrr73eHnAinkZyuE/YH5f5RQow31Ox4VO/TMMxv/MRGIzvxLiKOy1D9e+jwMLsqX/UOKOz218AT/YBfK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792408761; c=relaxed/simple;
	bh=hicWBf/nVrO2B5eYi9m4lI3Q4TQg11SfjA+n7D5Muxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VyC1cE9jIT1jsR2mZOHyQWuY5rG2eeao7D0lQi9jZlHzkA7DKaW9A6l9GzPnPb8V86FIqqFrnRt/ZbcLpGw0LqYm0K+UfA3Ztdblr3bIaSt/xnss5bLnB2EQPbkuzV/fl853uCgdPNGf3IcwlR20q9Ff9Un8n6Vncoi19iMWRAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aqaz8iOU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dlfP6Nq5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aqaz8iOU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dlfP6Nq5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Os8n2752268
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 11:19:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VJwQ3LmwPXa1BUiwGt4fvNRB7J3oUm4v+8tRT0WON2s=; b=aqaz8iOU66AOsySE
	3bxvHMMq1Y3zs/8NhvncfI8jRm9FB+fixr1QBQo/JwC0L13/5QYH96xi0ABqUb1K
	gFzNpXV6yuL4gb4ThW0ufT5xXu4bCGkc9dXypvzolNN+15RAK0zJcyoaH01jGSIq
	PLwa5s3zWSmDFEZ4Ktn0L4imOQHMsDqqcKglaT+vuAp6iA/LuJeMRSUH7Hj7NkZ0
	FHmySMftoSkEDSaOowMpBb+OWesW50ipy98tsT3E8k/c3hzSwgUfxvv3h6lTGjf3
	8oFpZhFItHAVpKWAD98bzYTTQKaLMU+8uLGdc+c1AJr3G91lUTZ7uKo/oGalGBKG
	AzHPew==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48gsme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 11:19:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f3960dca5so20964685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 04:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792408754; x=1793013554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VJwQ3LmwPXa1BUiwGt4fvNRB7J3oUm4v+8tRT0WON2s=;
        b=dlfP6Nq5iMSFWE8XHX+JL6JLcXnnxdGra2J5vKF2IGk5wAZkVAvOm5nGxCowLx3RYw
         oXTfla1ZmgM5EYQIl3T1xB6FS7FRnOmqH4HlULO0utQuQNnuhxIugxz95miCyRMCvcAy
         dR7WEKkzhse+pGzfwt3WMVa7rz5X716LNSetqWtWAk/iIic8j+6UxgQ1oHGUuoTu2NGT
         ZtUTUvmnIb+ejuizcFNVUkycbyVRiUWzmJtHLhuvkVHUowO+p9UzDm1WkEXiJZMADO75
         ck0H45Qex/UstxRzcziXZdyoWyCG7ZtRRVHq2fzu9ZItA1eMMsh+w5Yi/cVtEmLv7qIr
         E7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792408754; x=1793013554;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VJwQ3LmwPXa1BUiwGt4fvNRB7J3oUm4v+8tRT0WON2s=;
        b=yOOlwA/TR3MaC5bERrFWhFIQzWJ9GILpNJ6xD0ls/E2oHTkbFs8OiTR4kxrEil1sEQ
         CiWoD/NmFQpqw76838mmYjhE81GXSEO2Vm43IDrlZQX5SBU3ROIzlKekjYB1fss3y5J0
         Yfb/jUErKhKgWuBCFVJqnl9Fo00zc8hnQvQuOFWrK1+WB4PYkPv8hW6+VlqxZbmUAzEc
         lD3vAgOXh3a+aIYL9rug2LjD1H3g+wzCXQ92M26Wi94uwPp3bSuo/IX6sLgVdugR0prw
         e0IL5217AtSJU9Ux8Lg9cgHezWnNJknBLms3i2JLwE4YtOTBz1I5iOQO8ayuMFeS9bgY
         bZxg==
X-Gm-Message-State: AFq9FYIdouRWInXvs3k7W0Jgsib2umPR6kPvZpVNSGjhxG3quMnnROrq
	0Pbt48NrcZQCIRqKCv5wcWBStu3gCzJXJJyBcHShcw11pO/7uJIJJfTCSUQ5iaezo1xDHgtC49W
	Bau/yWQaXt8CrUVkVHtfeK+TbNlF9LXBc+TmYDBhXxbMtlmmxCo/PaW22dAWaGBm96+El
X-Gm-Gg: AYBFou2r5YTtnTYZE5yKmJL6/mMMZ9az8CqTE6jBcMwrD2Sxc5BqsdeAYQCJj7mHyRM
	/1LiUe7Wki+iX2AhmC9i9ZLbV+7Pth3/kEB0EvIaOctiIpdcnqc5UhdnaJ9J64On2AO2iQnlyPJ
	+T5HGa3e5cl+6+0UOw4zonUsoM5CZgU9JES+zUVkZg4wt7+NqnUaT+WbomdzA9qIT5Lx+Ucz4Nq
	zKHtn3n+WrXMoQC/dhkh+oIt0tx1KaIsF5lECg9sS0mB+TXoRLgO88V/4LnPgtoo2KlxCyaWSW9
	zyES0GDMzZjaM4TVankiy/RfAv2kkxXyHpVvW2IZiO32aQAwJLXuTPophfqi6Hln8CQpvdCv0NC
	taSBB610FDVKJmHz8himH+g==
X-Received: by 2002:a05:620a:2948:b0:93a:1312:ff19 with SMTP id af79cd13be357-93f29dcd9cdmr1236981785a.5.1792408754596;
        Mon, 19 Oct 2026 04:19:14 -0700 (PDT)
X-Received: by 2002:a05:620a:2948:b0:93a:1312:ff19 with SMTP id af79cd13be357-93f29dcd9cdmr1236977885a.5.1792408754046;
        Mon, 19 Oct 2026 04:19:14 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1eb8dbsm3646220a12.37.2026.10.19.04.19.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 04:19:12 -0700 (PDT)
Message-ID: <d4e2fcfb-856c-4fe9-b0e7-fb8df4dbbc15@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 13:19:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] irqchip/irq-qcom-mpm: Prepare common access path
 for timer and pin regs
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-4-ac7f1a0d5638@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-4-ac7f1a0d5638@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NCBTYWx0ZWRfX2OhL+rD3KlPR
 Omoje8lZSMnJAf193oOBVn8Oce0+sJDY1Jmoq6jkwGq27p3sMrIytoCz0rj4vDJuXMn1iAgP/ra
 dtAUN7RwEg1h1j+p/uYtZrg2ubUq3UctwaE7dLPP8+rWpMlCMvXudtrHSszWippRH5kgRS4cngC
 allJxD+RND7N+OI17ggKzUclJEVPzwpzVlb6XBHQd8VVUJ95ZuordURw6PULCYL8ndCyiVN2yUR
 gIRfsqyJDbVDwptFYeN3F83M5VOKvHlUqeJMt3F6O3Wkhtps0xgm2CA1av0oYm+V0ik0guJAUwy
 WPIBshRLm170FIsOLG8MKSDRMRSFhKMZavS5KUw1yVwc9pVhwaaNzuBv6xRsXEtS9O/v6GlmGk2
 aLgmzhddq76r2g/KA9G1HmN3s5XNnly3av3w9tVO0GAElvW+YQFIiUMsKspYFyceuwPNqTlNDG5
 IM4wkP0B4XAHhX8CoZg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NCBTYWx0ZWRfX+PjOUA27jn1R
 Es8AzABS3IYqne1N+/bupGSTdTQaEtmhGRMqEsfvR21rU1L7a/CQOAiHw7gX3X1W9O02hXinL76
 A9M3PSvqCNw7ZbeyBDwqJWBbFqUCOEo=
X-Proofpoint-ORIG-GUID: ghdz0sn7GLKi2CG_ePupU2Jh6g0tw0tP
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad5fcb3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=_QkEx9C7_NLcMqeofcYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ghdz0sn7GLKi2CG_ePupU2Jh6g0tw0tP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190044

On 10/15/26 11:55 AM, Sneh Mankad wrote:
> The vMPM layout starts with two timer registers followed by pin register
> banks (ENABLE/FALLING/RISING/POLARITY/STATUS), each with reg_stride
> number of entries.
> 
> Use qcom_mpm_offset() as the common addressing helper for both timer and
> pin register accesses based on that layout.
> 
> vMPM has MPM_REG_* values represented as contiguous register IDs,
> hence replace the macros with enum qcom_mpm_reg and modify the accessor
> helpers accordingly.
> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
