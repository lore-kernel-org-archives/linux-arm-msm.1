Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA01C3B0AE2
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881319; cv=none; b=IqKuFNKKeqf3ifohcShszORRmxIWAElgZI7s3YBu2BgA6kCgp3Kknf/oVCb5P4/UJ3d/x6BEKUXww+eGQEGOM37M2hMp0mPCQf1BnkIZ1bNvTGMtA/+sI6/a7twzOrKpdVecXHJsJZU01TI08gyq1dGIsVZA6UjCcPR3O3ZMQF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881319; c=relaxed/simple;
	bh=Rha8+JpITTfvtyZu4IitLdjdf+kx7e/IzzC6ZH+57RE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=itTCpox3AGGo6Gy9Ea9MIP6XuCc7/nM4rlK3gs3V9ptNPJdpIo6KYevDla5nXJYLHnYTS+RMVSzDXm3eJV8HvYH+MQKQGcZVMyXALrHD7KZdEbt4Z87JdItXKi+KteXRyMIaWTWwr6rLQWLTno4sASUfXd7l87cRgs9nUmiIllY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N1fQoYH7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YkIoUNPt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N1fQoYH7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YkIoUNPt"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8bEQO302956
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:48:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rha8+JpITTfvtyZu4IitLdjdf+kx7e/IzzC6ZH+57RE=; b=N1fQoYH754tUxWIe
	vRzsEUvObZj9pY05lkTTTbFXlYwbtpDTS8M0XWu4Mh/FpKHMf2POz8NQ7HvsTz4h
	O54KR1ezuEMSc8mVgfSDv5OCfWfeQFYJ2NW1PKPyardkT6TT1OAfIMmKHbqTl/mK
	A7IBEk89eHG/A8yGtI+1jaYGP7lGYxtfpfonE3u3uytXLJPl0mMpXX0fl5wDF9Sq
	LGgRkX2vJQULjuiZpQiLMieHISByRQfz4qRoy7NydA8k/wZFaE8xEx2yc1i3eFvi
	3P6Y+KrylK+CYEa6+Fldp4Zwm4jf9xh66rjBBiM4uhgwJE5SjFCyyOLapGRSrPX2
	WMM5ZQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98sq9xmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:48:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cac495d99so15796585a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 01:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791881316; x=1792486116; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rha8+JpITTfvtyZu4IitLdjdf+kx7e/IzzC6ZH+57RE=;
        b=YkIoUNPtCxbhIHJC+YdARX5lOBUhRlBuf22ayUkM/hLGFRsYw6ldaYEN2F/UnA43bg
         u+tvZzifm6edgNvT9wnECV9CRVz35fEgk8luaBfnxrz8jGRGZK1OZ8pityEfRw67hJoc
         ch9ayjN/ShzRUT31KqT5Id7NMAZZx4qJruvaHvAAjIhKCb9xNxEDaQsCar5Q8Pk28njU
         FRJbghUW5Okui8Eq/DuJoRA2eJpN4CahEz0+47XmauxCMzMvemNtxPL6YJw8uUCISnGA
         OZqI6QtT/ihwHZgNLN2fwwoAUMiYC+ngJmemRVR35ew7p9FrCVSy0M82vXGoivyyH07T
         O2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881316; x=1792486116;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rha8+JpITTfvtyZu4IitLdjdf+kx7e/IzzC6ZH+57RE=;
        b=Q2ZH0GYg/N0if9I6cRYSkFi3bqj4+ZRdqSiWJ5cJoDwbRBbW1fB0TEOL2Fd1nBoSoB
         rYg/aWTZUuWsZgZEiCXM0ZOH4sPhxl8sLBEj7liPtaY2BNJCcDClsT2hdZeE4YrrXpC5
         jVXiyzRsqBDaLjUd7wstIuCyZbybC0YtFn7JPCzLlW7J6nCtmYENvIPn973CoOP8elTk
         L2LL3jn6shopzjMC4OpS/vOR0/nX1NymhNe41KfONP8NYfA4dkfvXmd64MjjpgVzPYxX
         14tEEgHrjMDNVYd5ZLM9A1iJuJltyxdmsUUIjZSriZLsDVQ4OPhzeMOpR8X0DGxt8Y4x
         mnbw==
X-Forwarded-Encrypted: i=1; AKwUvBzfhpJFEkCnAUFTjuY/0dxLvtl686ZXfwvYAbFTB/aRfyIinlGBiAqAhaDfoVhQA9bIKL0JW7jhDD5QR5LS@vger.kernel.org
X-Gm-Message-State: AFq9FYIdgJN3coNI3oI1XneOYXwaKyjr30/k1T+7BPbauz5+npxyXWEN
	NAem9Vo/RI8Gp3srUfYnJ2eMH4hGqmtfP7YThTLKnWpAr9KvlSG+j3Hyhp1Hne4vWC3QDw7x2xU
	xiSdu3GXSEI3FI5Ka7PguP2X7ccvNDvYP/4TxAuRg6KGcopwKJfC1vdnng4zj00awe6pK
X-Gm-Gg: AYBFou1nSAGpWHb+VxWd0byS8k7qLDg7mz+UYMNodn1BACAoAdTwMJuEpj5F7wiT8iN
	5ZHv2AFgJmFUvdzoOwBGvECHPnILqNXbZIjJX78KjN7AyqJPD51tC7wfNyp9WjUmZmRoeRIyUsB
	ZR3GJK0Tvb1mK0Mxz1dJwm5uX547orxZ1yTzr7fxf+/aMJ+ksISpAHKwymYVzby0dp0621eLRY2
	XeV91CWjy6f4RLVdhcvubwe1TaP+qdFWYa9xtYFYo11lEZxN5ww7O+c7obb0HdjnQH+HuKpVLuP
	6H8QSFt/vFbmQuB3batwcZ5FgnScexARDMx9j6eZE0k7y/kCTpqr9BUTMr1bSXq/gDYRC3o1uTx
	FP2TVHY5knF92nEbB5NguxQ==
X-Received: by 2002:a05:620a:8017:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93ebcd2bc8fmr2038960585a.0.1791881316171;
        Tue, 13 Oct 2026 01:48:36 -0700 (PDT)
X-Received: by 2002:a05:620a:8017:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93ebcd2bc8fmr2038957485a.0.1791881315427;
        Tue, 13 Oct 2026 01:48:35 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1ce47f8acsm1792713a12.24.2026.10.13.01.48.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 01:48:34 -0700 (PDT)
Message-ID: <cca9b4fc-bfb3-405f-b818-b8b6c0278b3e@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 10:48:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: ipq5018: replace gcc_plltest with pwm2 on
 gpio12
To: Adriel Santos <adriel@adriel.eu>, Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Gilberto Conde <gilbertorconde@gmail.com>,
        George Moussalem <george.moussalem@outlook.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261002160958.908424-1-adriel@adriel.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261002160958.908424-1-adriel@adriel.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX4OGjGbAQe68v
 Qqu1tqrLKtw/PPvkBChUspAcx6adbZYpxZJuhpqF7Lw5OpRzP58L8zG+aLH3Nv7XktzUMi1tBsK
 mkRNIJPbo0Qtt4+TLfdCa1JzF5gqB1F6bxLa4RbNdAWVi6taYDhQ/X6miHnT+7nUaG2fcBQ8J97
 g/mFNVgtVGdfCauUNIt5AnJjeeGzPhFlRfzIk91+9AKO3GrNzPhlrK8KwPuHrZJtXOwBH0rZA+e
 efM9shnsK+S/4OKiFtcy8GgkrpY3eNBzaI+iBaZZcmnPQj+007U6YNzCQSL32Mr9rtvE7C1dZgn
 hTGjVvyipk14jidO00Y4h8Gg1BV+YyOunhr0G5wkW2QXCbb9WhRZGaMybOv5jYd6KR5SkPNedA+
 K5/ywnkcf97jvYEYqiy+ZvqUX0kzeiFp9eg+HKC7jwXsuxoTKfBCWM3nSkrXOUCYfeBeKx7yONA
 eOBmVk4gsjjkJWXa9lg==
X-Authority-Analysis: v=2.4 cv=JN+uIMKb c=1 sm=1 tr=0 ts=6acdf064 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=gsNUEyUwMFFXpnDrQ7IA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfXzqdqb7wl8wSf
 eo/3zhazzSxwsXfiMp0x+O7i3mnodfWgSZfJoeuy6+G36cY8EehSNW9vh7Zg4lcwkJ/YBlhIMyW
 jF1LrS6BTamYyQyQWPisUOucquy61R0=
X-Proofpoint-ORIG-GUID: WLIbcM_vxsPTgUY2lB627AzOW0UU6wO3
X-Proofpoint-GUID: WLIbcM_vxsPTgUY2lB627AzOW0UU6wO3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130034

On 10/2/26 6:09 PM, Adriel Santos wrote:
> The pingroup table has gcc_plltest at function 5 of gpio12 and does not
> offer pwm2 on that pin, so the pinmux core rejects a request for pwm2 on
> gpio12 as an invalid group. On the hardware, function 5 of gpio12
> carries the PWM2 output: the Xiaomi AX3000T v2 drives its blue status
> LED from PWM2 on gpio12.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
