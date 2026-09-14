Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A53445AF4
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789389904; cv=none; b=P3zxAXpdfpUHWgArkzRU/gMQ1e0trPx3DvOlg2DZ7zCsv8VdUY9VpFL0ICjNRySeMF2bsggZglA3TOhSl86pxL6BsycfGKxM+ymo9kFNmlr7Gj6guxZqJG+nRhbjinqrzjxZccFrJOiwXY4+aGiGvM2bm8jqpjFg0h1y+NRYV7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789389904; c=relaxed/simple;
	bh=HL7cW7xm8EfCujd7ZA5FmqadaQ7C4TRhY1ufV8m/R8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AraadNAyjr1oEAUinH5Y5Zd2Q1ym2XWNMp5TR1/vJAGIe9BfxxWULsJ8po3P8cyXqiXG2lZw9ZdJ8at97X0dldHaOlGPLUess2f0NVeMMoK/DiYLEvAwQ06xpd172V1FS5LKP7ubeq3hekgK7RF6TVHo1UhUu2RYQAvJK4n5eFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pa/Y5CEm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kDJmzlr4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pa/Y5CEm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kDJmzlr4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EBRI2r406996
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:45:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rPWhR462mdcnDKwkGM4WYGff1/qnBDSiVxAAgQpd/gE=; b=Pa/Y5CEmamZvyh7b
	iYOf20KMt2Ue2cQbFlNvi1+tf1T/cXoV1be//vs9bH3/cZqNaAJX3X6w5tl00f3S
	XTgEOJGbkjJ9tpyYNQZN1715la4BQeV5MC8avCsQNJwG26xCVtblH5rYX3a7jQ6G
	M8Q01oRpb2464nph9oFcDGodLHB4KnRgqmF6ykIHO4lcc2AFV/z1/2hU+nZsJsRG
	eSh9967MkmpmPp9hTQ8xt4HOIeD/Zy0IavQhfdPUpFtk7InV0fmyFAaH3OmQ6vCg
	WvltOUFLauIcqcvroxdoCKN6t7hhbuq/voTo53YmO23FC82s+vP+cFLgQs1c/riE
	TxSE2Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2kr7qg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:45:02 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-74ab6065f97so57575137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789389899; x=1789994699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rPWhR462mdcnDKwkGM4WYGff1/qnBDSiVxAAgQpd/gE=;
        b=kDJmzlr4lqp/8EBt0VGZ9t0ncFcJU93LHLaV5WqEzC6aNEP77udbUF5duLx9QFS85Y
         zRzQqc+oM5vY0Zy9yb4ZPQ2okEGWcvUaELMhaLRR+/96D31BqEzl7S7JHgUbhJC0/kBC
         A0BCBIueWN10MCxznAs2oXprsTu3Ch8spPhpJ0Isl/62YrgQb9KfA3eCQjOvgby3Lebn
         /79V2qap+u+fnQfjBjT3vdIjeSwCTpK/XI2jpyuouTxOfqsvoasalS3lD7k5Rz9pxUGL
         hwhh9mCABHJp/erUaQr0q6MW7Zqr6+2XDLG3WEW+18GW3qxb58MLHtblCHP0Z4TRCN6T
         RAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789389899; x=1789994699;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rPWhR462mdcnDKwkGM4WYGff1/qnBDSiVxAAgQpd/gE=;
        b=sPot30aOk7Lg+6BOtEmG/NkBsghm+Zdija0tLIzytyaHubk2huLeu2i5CYnd37qYnB
         gYv3oVN2CjJfess+9yPQwlILn047BFA73YDnXd415Ihs8bFJjfaEHMUBjDF7gLJIjVGj
         0Gfa7waLprtN4nIwLmGVh1Q01l5GFDOxns21qzW9Zc7sPiNEyyvhJvaOo+e4HFUBwGns
         40t9TjYzkkkWArsMZ5sPIgdA4I0g9NG192H3JucyZ4XbktdY8eCbMlYKaVQp0J0iK4le
         BsJKOX23ihCc8oVLRe/QsdQ76ZHBn4PPCx2a9zNP4tbWSI4jzr9mnOa5XZvMnpp114dw
         gNKg==
X-Forwarded-Encrypted: i=1; AKwUvBxpMrk6FOuzDoUfkoIrdhtF+h3J4M7FNxooin+iXO95LfOBGuBsyLLNXIfYCLxqmgvZbX7eH4s7tBA/uUUf@vger.kernel.org
X-Gm-Message-State: AFuF++kdIxxxJ01IK0GRuio4CLMeV5D15dnHGhscWBos7weZSby4j622
	cDgZVWspkX76fIJ4KeyMR4491Svpl60IAsNaWykSsjjTuXq4VANO9hiDldR6E5E4SgFBo/eznoG
	X+Xt32rLmi9s/7tePYs200cDMg6kH64CTQNvAdaOkZQvrUGU0ytA5KOTl6BJ7oiPrw64JW2Ht0c
	rH
X-Gm-Gg: AYBFou2dSwrxX8DlFDZB9XpxeMO0khRseXqi/c4Mn5BkZ/9Qhee7TzDzsz0M5sOX1mD
	2y7KIcl5HtMDz9mrn/L/WVWi8/nPYzOjuPsiLcneA4S7SKCtZk9uJeJsI8cl++X83y7ZOwJeK+u
	RSTQc47ZrFe0n0xyqmAJ7EwuFt/3rUci18c1MN/PpOsYqVwdDVtQPNDeSXZv1WR6Ronw9iZORmM
	tSreVREOgQKKwcXTYF3jvtomV35+pYmcKlhwwV5doE24pcnmz/VKilcvlB7KssOGb/xvcowyaUT
	92YUdCalktkHhCqxiVnMf/4yW7jeaLbqEE9PZmggJwq3KY4LMA1G9kyRskfAnotq6NwBgqI0m3R
	ZHOTZpCP6HmwEffLAicaoGg==
X-Received: by 2002:a05:6102:160b:b0:78f:c6f5:27c9 with SMTP id ada2fe7eead31-79b509df7c8mr395520137.0.1789389899486;
        Mon, 14 Sep 2026 05:44:59 -0700 (PDT)
X-Received: by 2002:a05:6102:160b:b0:78f:c6f5:27c9 with SMTP id ada2fe7eead31-79b509df7c8mr395517137.0.1789389899071;
        Mon, 14 Sep 2026 05:44:59 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a04709b3sm2430850e87.57.2026.09.14.05.44.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:44:58 -0700 (PDT)
Message-ID: <e034dc1d-f612-4e23-9805-74124445bb67@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:44:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] arm64: dts: qcom: Dell Inspiron 7441 LXST2021 touchscreen
 at 0x09
To: Avalon Vargas Centeno <avalon.vargas.centeno@est.una.ac.cr>,
        linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org
References: <CAGXpr56LDenxF5hM-_gdc7suckR9P7sgC8vY4T7dcHtLK0OwVA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAGXpr56LDenxF5hM-_gdc7suckR9P7sgC8vY4T7dcHtLK0OwVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KZcGe95dkCYHFL_LZQ49G-cGysPZvFGK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX2ah44vSZxIi0
 zZKsmVgAy3nBWA+sbs8R/FKwuUYhkn3gUW2l3BX8UXDM068IRwVgKK0LaTpKTBa9soqoPt3LDfU
 hk7SVvTyxr2uo71WvUmySBpDCuHyw95U/tMrHthNXr6/nuRne5I1oVT5r6dVVw/F9AtJvTAPaa2
 9eAOI6Fe1fyrGekBdsBPFYVxSd8yLTmjwlSs6ktQEiagLIg/8JchX7pNN5jfENzrW34QHgeJ+4/
 PwibsIvTswKyixXikHNDPtYFpFs8UHOmmbdIq298v6kaUuyQs/lw5Xp+091OZJnLDnGNxfLAxJE
 gUOJTXZKS7XzOkbpXFWKmakWvC21mWtCatwdfHQZupfShJCDeveK+NVNx3y2OMe6XNsreQq4Umh
 YFhtf5geaCDy52pTYgs8gKlxC1pOzmMQSd+7wYPpQyJU/MMDM44Wzdz6m4eVlfv8lYQ/DqC6TkR
 AH2Tmng/4pQF4ijuAIg==
X-Proofpoint-GUID: KZcGe95dkCYHFL_LZQ49G-cGysPZvFGK
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa7ec4e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=22cVwcawnwk_avja69cA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX0n7brMjvyFPD
 fUWGHAMwjbeyj22Ao5yZZ5+0PS9b+vupX1Bt1pZTlGbx3GDNC0vrHVZpQpFF+qDNh1czxaZhfdS
 VjbZtVqp/3UVr/WU5FG6zWXKVyvmBts=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140182

On 9/12/26 12:06 AM, Avalon Vargas Centeno wrote:
> Hello,
> 
> My Dell Inspiron 14 Plus 7441 has an LXST2021 touchscreen that works in
> Windows and BIOS but it was not detected with the Linux Inspiron
> device tree found upstream. After working on it i found that
> changing the touchscreen address from 0x10 to 0x09 fixes the
> touchscreen on this unit.

Do we know that's because of double-sourcing, or because of a typo?

[...]

> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
> b/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
> --- a/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
> @@ -25,9 +25,10 @@
>  };
> 
>  &i2c8 {
> - touchscreen@10 {
> + /* LXST2021 */
> + touchscreen@9 {
>   compatible = "hid-over-i2c";
> - reg = <0x10>;
> + reg = <0x09>;

Please send patches, not regular emails with diffs attached, we can't
do much with these. It's easiest to use the b4 tool:

https://b4.docs.kernel.org/en/latest/

Konrad
