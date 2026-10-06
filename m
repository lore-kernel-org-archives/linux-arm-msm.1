Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74801C28E
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 08:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791273928; cv=none; b=gs3iDygkvHD7EU3BjpZ7AyvjuPBzaBwUSDWAaI7lg82EJK64IkXnwxZaHcjFmFMmQW5xaCds8ndsG3nR5kL1y9vGlZ2XmfbpVvqCdelzT8YeiXtu+TDerENeNZsP8vZ4vtghRBFVlaw1nqTrSNNLs2OSLDylbpPHpSMgcEzEyeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791273928; c=relaxed/simple;
	bh=an7AD84YEqSWy0+GaKfNOntzEi/eymuo4+6S8jm/oYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DTayqJRhAiJt9ivUT0Ko6dWZnhdScleyFoagW9w1xZZAsVUX1qmVX9H8LN9B/5vw98P5k6tMEWWP+VJaNHos2LC+5CIaeaTlhKy85IdFnDfEl6XnmVL+uUUqc+AiBrEfeXal2sAHXwoFjJsgyBHjcCUE7/qG2TqFXCMIppboxLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cBhM/mnK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zts8dxmy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cBhM/mnK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zts8dxmy"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966eARC3269398
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 08:05:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	niUOktxfv6lCEuldcUQGp27a7uDOXnZEa5jZNiVgcHc=; b=cBhM/mnKr7Jl1cfn
	SEoU1cpHwy9i97HxZoDoyVjH2fFvFoaOFkXOU+QhOCo6MrbKOU20YhaxTAlxjbZc
	9xWxfyIvRiLhqKAEZc/CVH3gCVEs7ltDzzTe+Ek/Eha1EdnKdNwcNn7TdsGqtSoo
	oyD7tWvsiU7TupXFpS7KNYomMsNKTRDyLfodz068IYRH7vaXdE8WlKqtpB+AQPfr
	ehHhCqEGK9LpVaFAo96GcEP39MH7PkAnMqZ/xkP+r+o/3AJoAcZPMZM/+YoRVjFq
	1oMiYN3gfQAOjAGcirOToxzuTvraoXmtDx8m2S2hLHZ50i69YcrdCCQv4R/CyhrO
	7tgGkg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4fkujydr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 08:05:25 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917a2de2cc1so36025376d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 01:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791273925; x=1791878725; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=niUOktxfv6lCEuldcUQGp27a7uDOXnZEa5jZNiVgcHc=;
        b=Zts8dxmyC49ZJinwP/BSsLYCSd1qO9OmnvBU4QGsqUXSWrIorCFSIYmPl5lDWgfqoz
         Va0zaPHq2UP7eY+aEVZAaYeaWxCTCili7Di4BWtLKyb4MeC3WH093moCa15mr49650Xy
         2Lsb8sWbc2OJsHqwynsI1HuNHbKKKJZsqvstj/RnwfPXVpuWZsB9n1Cvr4PD+2j6bRlD
         7Lvy8mZyqc6GGEj1c5JW+YU0sBF+6izdTiuz6EbpzX0hly9FPIOMjwlYundXBFjq4xK3
         A+ObqGGcj4jtfrOpn73JujGni4UDlWd/bPU9a24k4oKezdZpW8WZqgZDSOGjzhfnq0a1
         VIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791273925; x=1791878725;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=niUOktxfv6lCEuldcUQGp27a7uDOXnZEa5jZNiVgcHc=;
        b=jqUmdYy85zm4E2zJJw/eQi13mampcrq9pvP9qQb+qjY7cZVK3G73HyvPbuyiamhi53
         nppTvg5AVJtfQzuPaqVnzugIL6Yx6jwnCaXzKkFoq6rcLKfeTIxYS6XjSnERcrGrEdCc
         4fp4kJ0cVfOf9eDnBGgevvXnl65aMDB3DOsyz59Y0nuN6gM0VU7LS9lANPrr14+gdKbt
         3mCOB0JvLZaOf7CXN3TOE7hdDErSCpyZV6ex7icfGvROqUVjCPMtLGLT0RgftgrDj4EY
         CSG87y9NUDy+fk4lO1SD18WV9EKbbkcn2wRTh/ssll6MFVMXVeUSqEqJ+5SQaBTwtGfk
         tYrw==
X-Forwarded-Encrypted: i=1; AKwUvByyNPiyYGVqXCb35XGKiNsK7TaLem/3FAefzkJZyxYz3+iXf3oL+00ceze/hVvQ4i8G9vcVOp2m2NenCxCB@vger.kernel.org
X-Gm-Message-State: AFuF++kAmsScBggLzn+6H0Fco2XGFw0v2c+fkAWW8oXSJw981AXH84jh
	FquvbpX/Asv/D6kezJEw86gpZZEuRcfE8T1R5Fj6DdL2aeMYN3TWR8ZMoxlfj3PRcilH8VHzuq1
	rYB7JI0ZviQawZAQsMTPr2AigUyZN4YnHfgDOq+/asAFwCiCRVXNVwY3rkwvQcRr7rjFe
X-Gm-Gg: AYBFou1A+Y5TCoYb7v1W5SPqMRePkc7VIBwi20sT8JwUlV9rSXfDyR7lc2pCuXY6SeT
	eo2IIjx9DmyrQ86k6fWMkrIa83LMP+W93yd2BMelRXuZQwaBHhPhl14P/Dr16bCFTeIbliiM9jX
	CnjR6/5QgmH8GGZxRARudxkdBd1nstrC1J3c9S9FjboWLne5k6OJsh4G6r+vigOSb4I6Yv4ncaA
	btcQxmaWv8bM/QweikA6nU50aCyKYWHb9+GrgIQbEpC2qUAP+8et7X3Dui9CFobiY7dNEsP13Gu
	Ct2P8Z0PHX43f0f03rFcqjJ19FISCSuTz1tNstHs9mLc9u+9L/Vu0OTXC+SQRT7d16hb3T+aHAU
	Pk8vBfG0RTsI8D2uW/R8tfHXfw39Wc0s6UQeUyKPwhVib2A==
X-Received: by 2002:a05:620a:1722:b0:93c:7211:beee with SMTP id af79cd13be357-93e51024db5mr1593407085a.28.1791273924856;
        Tue, 06 Oct 2026 01:05:24 -0700 (PDT)
X-Received: by 2002:a05:620a:1722:b0:93c:7211:beee with SMTP id af79cd13be357-93e51024db5mr1593404485a.28.1791273924346;
        Tue, 06 Oct 2026 01:05:24 -0700 (PDT)
Received: from brgl-qcom.local (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6cd717ebsm1644791f8f.49.2026.10.06.01.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 01:05:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Adriel Santos <adriel@adriel.eu>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gilberto Conde <gilbertorconde@gmail.com>,
        George Moussalem <george.moussalem@outlook.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: ipq5018: replace gcc_plltest with pwm2 on gpio12
Date: Tue,  6 Oct 2026 10:05:21 +0200
Message-ID: <179127391265.4024.2812187587879993938.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261002160958.908424-1-adriel@adriel.eu>
References: <20261002160958.908424-1-adriel@adriel.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HtPjiETS c=1 sm=1 tr=0 ts=6ac4abc5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=zRh97aRZNhiOMYVz81Er1w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4QlCE6GJoO_CLA5tWxQA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: QoZiBPTfcAXk9Ms3CjoQ1dudRHmEP9he
X-Proofpoint-ORIG-GUID: QoZiBPTfcAXk9Ms3CjoQ1dudRHmEP9he
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzMiBTYWx0ZWRfXz4gV1H02k4I1
 Xm2j4p5h6Y+EGFWiYH+FQYM4wgZHlGouC2B81MdU3itc9D2nPqZLQY7GnCUyaqOzy6yHtMGX1SV
 yUQ/UN5a31NVyZXtRdZVx1vt5A3ajRc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzMiBTYWx0ZWRfXzirMQhsAD8Zl
 zf5rp2tl2fU6x5XjPeah/cK9Q/v2Ozdc/aBVhZ27TIzfAvtnXtx8zggYaKcJYowra8xqQ/+csRu
 IaCZJSd2pSak2btI1E4U9YpKziM3v8kCW7FJfi+9iZjokee4CyuxhqY7KJCac5jFN8JoIfkIFAd
 DoJgrCA73LCfx/FTx31t4AnA1WxOj8vKocR69pyfyl18GGyWzJom8uYreQYY8ChYw/ZYKfSVvYt
 OzZFBfZVxXA73kTW6eAzZdvK0EC6PUT7zPjg8kbF0aooKHfZECOVRu6Dsm7yE/zJW8/SFCT4Pgv
 nRg8ej56xEnEl3CkiGETVhW8YI4dOFshD6nkYLkfljHHaOhpnU9CAUXqWTYLrXgtTRVYpvmN6Dd
 TjQv+6CPfkLzx6WZdv63l6gmpn3p6WExMK9+77IELsBMaaKrjtXisjjOnzn3gLDH3jClBjlBDqG
 QCKP9TW97XtZPHh9syg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060032


On Fri, 02 Oct 2026 13:09:58 -0300, Adriel Santos wrote:
> The pingroup table has gcc_plltest at function 5 of gpio12 and does not
> offer pwm2 on that pin, so the pinmux core rejects a request for pwm2 on
> gpio12 as an invalid group. On the hardware, function 5 of gpio12
> carries the PWM2 output: the Xiaomi AX3000T v2 drives its blue status
> LED from PWM2 on gpio12.
> 
> The vendor kernel shipped on that router (Linux 4.4, stock firmware
> 2.0.28) has pwm2 in this slot. Its pingroup table, as read from the
> firmware image, lists these functions for gpio12:
> 
> [...]

Applied, thanks!

[1/1] pinctrl: qcom: ipq5018: replace gcc_plltest with pwm2 on gpio12
      https://git.kernel.org/brgl/c/709ba1c547eaf37da36ded2ecf3ea4e304cdfa9a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
