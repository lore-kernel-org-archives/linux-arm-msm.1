Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681783F326F
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 10:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787653549; cv=none; b=dBqCNMnZyPlnOEiTIWZwORLLqpYW8RLh+sPSrkhEWSg5rutAH12YSwfAT+02eaUHWsbZU13ILgPDd4kLXXzaRnrydXmGybChspIxFj6qQQ1snwO3Tc8V7cIIf5XAnjceqtHEctYHtiO7Sl39/eR35ETfwUzfVIVPHtIv1r79f2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787653549; c=relaxed/simple;
	bh=pztsSdBFT/rsHTQlh1pVR3RI5X5inoPJLeKIjCKQvuE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jLGs45BDzZ20QfV1rXnR+JsuMCZNq2If8l3K9AgazDFG/8Ue6ZxIuKr3Wiep+qXPBEofVNTQ6EvE3TcMHyUOzbJSjrivpHvVwWuJx5EX0apngaVXwkNEMYzfzVlVx/1vAnq3CggDb+b5P5BQ1T/B1J4SVe8IRltiSRhSSHHUHNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=krA+tSXX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NpEARnYM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="krA+tSXX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NpEARnYM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88SDt1163466
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 10:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y73xyKKVEUBxLF0cbi7X8bA0uKTGqzBiCSugQ4EZ0Jo=; b=krA+tSXXZUDEcZVi
	TUQINnQMF5kgyFSyTojLSCOHTuVQzqExwDiN5/ojC07sQGtKTOgaPH8CbbNKlgxP
	OzfK/ZJ97PV9tnYfOI1cOBbZjQVc911QiLYbrV7Tf+iHxrDqxm5IxHCudXwwfwfa
	5acoW1KGve6loCLyCKky7aAtbzYVF4GmPFCUOstYgBEwUyPWHD+EhgiqkZP/BkK/
	sVJTh7TSs1DOmqTegb9K165R9lwUs9BIvj/5oIOkpcbpqOmzl4UkM1S4Tj3gq2gB
	ngX74E1umzjjBNjGQeHsIXmHWEdpluQ19pBY6qNWtN5vm6nR3mmtWINB19SQBeRQ
	hD7Ldg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8y5jj8ah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 10:25:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c21be5bb4so10051041cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 03:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787653546; x=1788258346; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y73xyKKVEUBxLF0cbi7X8bA0uKTGqzBiCSugQ4EZ0Jo=;
        b=NpEARnYMDfrwVusrUlnuJnapAhvG+fK91qBIRfjDAiVluVc6oZ49IcmElL7bQHvgof
         7zYwv3A1P/F1ezv+g9fCpokr6qbfsOsQH/FMTLhQgLQnZLdIu9mew84F4+jj9zyH8iRT
         /7qXV8hY261DnvaS3tzO4po694y7o6Y3eo7RVhFwKmvHGcxeUGOyY5uMpr6jxX7XxxSF
         ddV0OoHCWLiKHB8cr4hqcfTaDhlP1hRc1GADWXaYOF0M4o7xWfqCdcCUUkC/is8qcjje
         WYEYzmzGieOzTzO8G2RCGdywUZHF1Hv2fgSKjHCH6FzIawH9fv34Dselc2n0ui/hn+xC
         FDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787653546; x=1788258346;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y73xyKKVEUBxLF0cbi7X8bA0uKTGqzBiCSugQ4EZ0Jo=;
        b=ForJr74g/5GlfLleu14d37K2RQFTptTHjSbFJGtgiSpbwRkKdQXqIEeuohRaWp+YR3
         OAzEVmM5R2teNZG9TNEyJWLn2VEW+mYkRwc0ihAswMM45wK7hp0T41SUgABVELn05THk
         1gykAAaybFNE7dFLk5/P3CPX54l7f44DqozvsLbeq6mnPMyf84Yu40mrrpxh5hffe56+
         ytmXdednM4EYOMGtHR7bouKZGFieJYPDYeQy4y/j9H6Ez0XxzKRPVdmE7AUa265DgyJq
         rSTd+Fh0EyY6zoEGML1MxShgn2difx1R4vQK5FMocqhOVFnYqG5yWZc0po3j9nribtCR
         BL1A==
X-Forwarded-Encrypted: i=1; AHgh+RoTTqjlJIte3EZhKa4S4QfhvhbGukvVpB5xTdBvjRXkqviDQ8cRdFrdqXhsZFrLQj4YvKQu1JMJatjMSXT9@vger.kernel.org
X-Gm-Message-State: AFuF++kOwgAkatydFnxieXHy82WPobsfpf6rBCRoi7VIzEFtptYXHh3P
	Xj5ngnXZYEzIOYupD1qYD1kXEqtCMNZWCz5wZ0EKttDfEqqRpwEr9K/xGLzj+SVagpWlyG1S+uf
	R4j//vLYqvv1pOcBEDtwhkqUEpgjSju/8znxI8QIRiqXogwW531a7a17soKcHB2q42c3f
X-Gm-Gg: AR+sD13oq3JG+SZgYHaBfFyXL0mD89Os2+kCAMQvbvA0RWAWVxBGOmhCQbWdkErO2kA
	E2ocBpaoNDelBGzSHH85nCwvcXmDmC9pwYXtDiujXVLMdeJf3mO8z/ySjtbKrq8KuN/UO+nAMEV
	d7OOPtJNdYmMIbst9ts6pCe3j/A6Gor8zSvhvqFMqdZmBj/vM7udsNw4X7LTTx76AXhkItJE9w2
	VByMF8OFpQ0K/oXnEN5YGggdp5DHhuMkh6JBFT9TaK5ntco9OBKWLNC3wzNIb5meV4hSiicbHDn
	XkvPcX2h5eg1LyvX0AbDrKaemAjPqd3B4OjhRIFn8CMBvIwCocW0TZxp+35zLRtGnrhjUb2d+8m
	420WT+OoN+arewZJd2VwtO/Bt
X-Received: by 2002:ac8:7f05:0:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-52e306cfca8mr35824011cf.0.1787653546629;
        Tue, 25 Aug 2026 03:25:46 -0700 (PDT)
X-Received: by 2002:ac8:7f05:0:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-52e306cfca8mr35823791cf.0.1787653546279;
        Tue, 25 Aug 2026 03:25:46 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249685ab3csm1765173766b.49.2026.08.25.03.25.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 03:25:45 -0700 (PDT)
Message-ID: <beaa6a82-12c7-49cc-b79b-b4db5819b95e@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 12:25:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: Add Retroid Pocket Nova
To: webgeek1234@gmail.com, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260820-rp-qcs8550-v2-0-d4ce78fe9385@gmail.com>
 <20260820-rp-qcs8550-v2-4-d4ce78fe9385@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260820-rp-qcs8550-v2-4-d4ce78fe9385@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O5QJeh9W c=1 sm=1 tr=0 ts=6a8d6dab cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=blwB5C5By4wrLRVlGroA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA4NyBTYWx0ZWRfX9RA+IjWfrTaY
 9/JJKGfA223+kvAniB5kk5Zq/+NEM3W9H0+KJsgc5lIsMM0wOZp+E+oCD4SZyt5/cyZ99DTDJZs
 ADdGc3+Z9nQN1dj8RPrE1uJzgs6y39uKZn4TXoNcgO/Jz5xQLvvzk2PMq3vKpZOgEomleRx2IBb
 vGjvRJPdFonao2VQxl6U7Xs0Hg/DLuKHUOJa+O1bqmkX+EbTUawJ+2+IXsY6/JlxzLKuRR/pEXX
 B1/0ga4Q+XGD6Q1hqAUBTLB1lRX8hFcnnwomekYhyREYUEpR0G/aLuWVCmeeH8huXkIIFxzUYGg
 OJZPZgIVE0DqKAOB5oAvMj8zFEOrMMVYQR8TG3nLvdb5sTPhx/z3l8pidkBejg+zX/lJ+wIZmXY
 LZA7RzRtjr8Dy1ZudVNx6ArbNvF2JGf4Pt4fQZp869/sLOze9oRBJke6qxwnPezBdZ60QOiDoii
 OSNqqUNpBzKY4UsnirA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA4NyBTYWx0ZWRfX1G1+n6DWhi0i
 F3DntIX7YLKKtASNy7nfCNVYsr90AjAKpkcoNpzG1rvwXXceaHzoKOtJEnmSepxCHOx7kjjYP0S
 pvvNiygdsRZv3wr8MrVX/+HD4OglE0I=
X-Proofpoint-GUID: JPkc-q7ni1bnRprtXfS0aYgHx65q0FlQ
X-Proofpoint-ORIG-GUID: JPkc-q7ni1bnRprtXfS0aYgHx65q0FlQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250087

On 8/21/26 5:30 AM, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> The Retroid Pocket Nova is a high-performance Android-based handheld
> gaming console powered by the Qualcomm Snapdragon 8 Gen 2 processor
> featuring a 4.5-inch 4:3 AMOLED touchscreen.

[...]

> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pmk8550_pwm 0 860000>;
> +		brightness-levels = <1023 0>;
> +		num-interpolated-steps = <1023>;
> +		default-brightness-level = <600>;
> +		power-supply = <&vph_pwr>;
> +		enable-gpios = <&pmk8550_gpios 5 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&pwm_backlight_default>;
> +		pinctrl-names = "default";
> +
> +		status = "okay";

Likewise

Konrad
