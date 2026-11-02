Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617267;
	b=LfnXFyf5l0b0UKJ0sfAOtqjGzIvEnnpirKfcDFK5mcsY5e+mM6IuPLQPy9XrsbD1UxYw
	 jipleRaVpDzVdjO57VDHwo9Fo2lD4EVyUlCazJv2ahVSbt6DCHz1/K9pZrEYYJmIh/Yb5
	 zUe4rTUVBYOn5gxRWliXOgxUNqTXmq3vXI1qq+wyuDbNprRS1WEJGwUAA2h0iwaD0OgOR
	 Dzznc11MZQ3U0DunM8qYYDvqqAmyfwVWOVCB23dmjnkEEDh1wuyC/+0LTBjg7MkZIL2lj
	 kG2WcpqN98eLQmWkMKV9v1OajFEubRPYqvBhJf3jBf7kvyVIgcdu+V2pIZiiyxi6fcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617267;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=n2aoPRaI6Tsd3u4ZnDOGAFl6UV/fLTbgUJivdgoh8aw=;
	b=Bu5e6Vrju27z9BG4raXUWGmdkKayAx/hOKRAeUDJtzABvPTt86efvH/2VyF0EB9rWpJ7
	 ZHDykywgEYfYidzptwqUbhNPxgjEeq8UaZAGFKkgWn2Vryp/UpOqGjr1ach8Gr+lDGEoj
	 vh2JWO+VQE+l+ShDHJr3PBq70M2EBiAoW1ocBx4URCup3Cu7OwB0cufZHU6sJ1OpvUygu
	 zQmZuP6xd5DamqAouxH40qTytxf6AxfkRBzcCZ/TCpI/b0QMupgBz6GaJ7TZphru7Otew
	 x5s/8Bnv5OBH4C2cWByO1wzRiQwJAyrwhl2vKnPGrKBcl9BO7B1McV0nB7atYINu1ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VXwguMPS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jj4eolDR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD19606A338
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 11:01:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DD19606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VXwguMPS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jj4eolDR
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29ALED4039632
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 11:01:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n2aoPRaI6Tsd3u4ZnDOGAFl6UV/fLTbgUJivdgoh8aw=; b=VXwguMPStlKTKDs/
	RJCUy0czi/rIxTpAeFen7Tn/Ch7F/g/ZwWvzOi6jpTBdRUXVC68vwzvw8TYshZtP
	b9rTkENozyhWn3s0RpEqigKuiTrRhJyw4wh//6cOS0OtlZhyOb/mmZqz6PAJx5Fl
	SGSpAFjHJT4Ma96omIX/O7ta52bffIU9lNIYwo8y6z6w+hOkSBIrfxpqlbQslukP
	gz+ZNsDFDvdKbN0QdyyH0vHSBRu43moVt6op0bBEohnRCXyYSYVsKpwNrxIi+lhh
	4e1mpU4/0yJTFKw1ONMq5G6UaLgF5hR+VWdFuLx+LoTQ1YBxrLgXzy3P3duCvlhi
	8mCdCw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph18sk7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 11:01:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1f1f2ecfso48152285a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 03:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793617262; x=1794222062; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n2aoPRaI6Tsd3u4ZnDOGAFl6UV/fLTbgUJivdgoh8aw=;
        b=jj4eolDR3uq4eO2MWNPpMHgkDmMufgmJO14a5ujSkitRqZDPtO9KouAcdysaAQIdnR
         pIquAAMKuw4dylvXVRXnIBVFrenjsvjdqqJjswL0ufjHkEBvGq5QRa6dOkh3pLhCLNdd
         8Kri6EEDE6DBRDYQBk3Gthk7jlKFeOpA/439bVzsmVvBBYJMkEr1YlWiKN4voDIS0E51
         cserY19sG2Pah69TP4D1jvoTsC6MYVy+I2QVxh2pKreRJxE7RPmqnWjgSA3VuyxneKgY
         sPfZ0h/dTy9SqAQ/tg3MS3zP4id1GLfOJnOmI8nM22KKDJvqE1TDfO1D9BPc+Nqq1CpW
         I+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793617262; x=1794222062;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n2aoPRaI6Tsd3u4ZnDOGAFl6UV/fLTbgUJivdgoh8aw=;
        b=bSl7cKI+2eKthuDl0UO/b7NuOfeHNHOgkF6aBZHZuKBQlL70KFoFtUtbcVZ5ofi/ts
         I4+r2hd8YT1AMy75g+zhpORApsWPaCIrwflXOg7lUPF8Flxs9doyiYumYzkSFXIpcHf8
         1YHJeRTMUTt3DqOaPlahZSvZqBruJyh0l4dCE3AeCQnQ1pti53ZliTlGN+PZK71ff4HS
         RBxuEC5tSUrKmknF1JmT90R32zZm+Y0ncrQzenpNBdZP4inncHxYV5btdy+rr4GnI0gv
         DeWqK5ko8F3aQdnO5Kn383tXMFyABgzaSjhnGhyEUsHa9qmN6yG83oiTHVMkvrR5y73F
         sDYg==
X-Forwarded-Encrypted: i=1; AKwUvBwKCwEdLlTY3uqixBOuJZDD6yQSjdRaVXyoIdM7Dho88jN1QC+Vnfa5jjhXMBstuWIY5WCrMLicOWPke7WO@vger.kernel.org
X-Gm-Message-State: AFq9FYJYQU+RO3oHO6ylSMuPDRovO/6Rl2Cxwy/PrRT6H74KvS/6zVz4
	TfPpCGmSDOSzdh9DjnFdRGsBBhX44Gjj6HIFaDUzyRhDdnFlVT0dfyjWbVyRWmnTeMvswq1keUN
	NEDjnCr1AeJbN7cQ1QFGNs0fIK6qqB7MryZMrJcrVXwqYe9z5YKYJHIvgWjDWMwNvnL3y
X-Gm-Gg: AYBFou2ceAtow2Qu5t2i/z5LXxjiiiMPkefcPYp+np1hhervHND3umxtPIRtKUqMm5i
	/M5yj0Y2I+b15WOhvZBMnGCMTU+XttorAdXzWlXKcwjPLzYQ3WmCfmQnT2yLc80Eq6yyJbZvH6A
	T6btzOCsvBM2yXXlNohj9v0GDyanliG4XHVF0YWxzMe3EFHNEysFIwi24+9YGkc+pL6F61wBHrO
	Ck85/fyPTxHH1O3W1jSo1HTGXuIREbqpvyTQa/tgdFIiX8Tk724Q5th3Vtkx/+PCB0rsH6UCQE7
	MA14m93jPXjO24nDcroNo4VivLGFVR5KuRe4tNho0W/UW0vDJMa6KlLBeLUQry1B3coYQSZ+LFy
	uKaxlHB04Fw+Df6l64NG73DdfypbxLQ6vifhp1qNnz6j7qiQDxGKiuWKrdfx3ZcxpLw72joc=
X-Received: by 2002:a05:620a:2004:b0:93f:a34:d9fa with SMTP id af79cd13be357-944215b51e5mr1674201385a.1.1793617261385;
        Mon, 02 Nov 2026 03:01:01 -0800 (PST)
X-Received: by 2002:a05:620a:2004:b0:93f:a34:d9fa with SMTP id af79cd13be357-944215b51e5mr1674193085a.1.1793617260644;
        Mon, 02 Nov 2026 03:01:00 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9fc668sm3157671a12.15.2026.11.02.03.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:00:59 -0800 (PST)
Message-ID: <b20d98d0-566c-406e-918a-730eeb21fe25@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:00:57 +0100
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
Subject: Re: [PATCH] pinctrl: qcom: sc7280-lpass-lpi: add ext_mclk1_c function
To: Suraj Sonawane <surajsonawane0215@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261101100030.15744-1-surajsonawane0215@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261101100030.15744-1-surajsonawane0215@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hXZlYDbGXGTn0IAMT6hKI6nSsnZXmg6E
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae86d72 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=chyuMTtChKMO7gno4G8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: hXZlYDbGXGTn0IAMT6hKI6nSsnZXmg6E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MyBTYWx0ZWRfXyO0bkoRFsL1L
 cDwQAQfXGXbmcqUq5YYA40Hsg3qm782y96V2CJKNUdtRLw3xjTYrZrY0U7ufWgWVD1vJqa5c9N2
 hU8QVGn3k4T1mGTpY3TIDgpi1hBgf12YBftf5HpZQndk35ePLclxpZtrGv0FJVRm8ICu4u0tV8W
 jG2EikkaEeqfD2IK0FYaYS+VVuNqjrbFvZx7ECd0MfkwjIYFV4rjujj2XJCwrDhHCHIqH6i6iEg
 hyTXdjYWVmJgboGaDkE9OXTXzUw8YKQY8FJW2P+2+kAPy0Tl+y64mcy3cm1UryHbfzrpV7GnVNX
 kEaMCLvymk98SVmPsP36NV+sonvnsFILusEHbk3rzCPYC6mkK8Re7wjVp5UJHopBLV7MgA1FAJb
 p0Skm07NlsRAc8lLOsUXQOdy/1NmEJvPWuGkXT0tOGMl4YlV5IqHzBSLOlxaFquU4vR4RvYVLcF
 FYDNOtMlnSXcsuQR8wQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MyBTYWx0ZWRfX/T67dElCcAV2
 VnjVe5j5rP7/ghF1ymroQRKYY+c3qsV+ZiN6o8IcEEYynnaG1orX4En5GX4lpAxStPuNRX3H2oy
 /JjN13sgBSsi4Z1foe4xmTIdx4VQ55w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020043

On 11/1/26 11:00 AM, Suraj Sonawane wrote:
> LPASS LPI gpio5 can mux EXT_MCLK1_C, but that function slot is left
> unnamed, so a device tree cannot select it. SC8280XP already names the
> same slot ext_mclk1_c.
> 
> Name the slot on SC7280 and assign it to gpio5. The third slot stays
> empty; on SC8280XP it is qua_mi2s_data.
> 
> This file also provides the SM8350 LPASS LPI driver, which uses the
> same pin table, so the function becomes available on SM8350 as well.
> 
> Tested on the Vicharak Axon Mini (QCS6490): selecting this mux slot
> drives the codec master clock, and ES8388 playback and headset capture
> work. Not tested on SM8350.
> 
> Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> index a61df10d4..278d5fac8 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> @@ -34,6 +34,7 @@ enum lpass_lpi_functions {
>  	LPI_MUX_swr_tx_data,
>  	LPI_MUX_wsa_swr_clk,
>  	LPI_MUX_wsa_swr_data,
> +	LPI_MUX_ext_mclk1_c,

This name happens to match the kodiak hw specification too

FWIW you need to update the dt-bindings to accomodate it

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
