Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB3F526A82
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688032; cv=none; b=osBPCQ6G5Cmb19JsIx/gZc6x+DW0N2AhoQfCmDcI39h1vFl4vnSArhz8FDpUvsEb9GfqJz1hQncmIv4Atu/WrrzQ+Br2EhPWgd+4NYlCXlKsATKw2x12T4awxZBOZtphDrNc03WvHLAltZ2XNMZi6cQR2GHEEEhwzJn8IIeFGkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688032; c=relaxed/simple;
	bh=32Y3KM5bCP1SDuaXQ/j9zM68Tajy2ksHRzCJwpZJBxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nd12f/uXbjeJ5E94VVZZiTfHQc+WkBtsOiqkVkYMBlLKwoY1LJAkkcZ2M6qSAVJWMEfxCH4dL4xr0Z9PI6QubiJFfUvYlmAMwKCCGnkvrZIaFyJo7JncfYwlAe0N8eI6OTvdnk7goLn/be1FqMS1SWAR3rJ2ECBV+/51S0JWEn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cp/W5y/o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fyrlQr9D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cp/W5y/o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fyrlQr9D"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqfm4611555
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2T5RkWVrZxsjtjTmZsWjGyBA
	n0522HCwfBHwVcNib0U=; b=Cp/W5y/o/+r6C9nXhvcXSn/xELYr389Kp79ZmxpG
	2NuxYC2uWb3p4qnbwPzT9BaoPfJI6QJ86QPZUdWbHY8+CXI9EOBx0DosSa3FFGPp
	MCogYlNViyzj8W2bhLfan3joyFqF+yFUoISr/VUpl/RGAi0Y4RtQQJNADArUvzhy
	dq/1yoUcTbw5wCW3wuV20yx5ur0F1GSUTkB8QC0Iug4Q3tVQpt2J341kSeiGUEl0
	13+PVopSgwLyNDyRwv4f5Oku8S7emz+aoURwVpSzUl7kZ1UCw0e8guoUjHkhuxLx
	q6RtxJlTFRkezp25r7t/eeQWMkgtpPy5BcrJlb/XnLUa0Q==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4u8b8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:20:30 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-988bc0ef0easo159880241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 06:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790688029; x=1791292829; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2T5RkWVrZxsjtjTmZsWjGyBAn0522HCwfBHwVcNib0U=;
        b=fyrlQr9DW4UYSXutxL0alABk0SWZkkD/q9WRzIRJWwkC2syBOsksAluOKYFTNiZDpl
         w1HZhsNvyNZcX4+T60zSwUo+qvOeq2KU47SJvXNSFccEDkEmlmdzcm4YnikVuxSEjIV2
         FHSYyRiCfYbCZURWk9bAqiHPhmKGnl8W1+QRdepEymd9Z7isFgh+dAmAZmF9IGUMxn8K
         lh1qYiMjlcNJE5BBGwjvm9USa/a9U9YDe9ZGaB1RhzJmD50nzfwfcH49+oWqO3xKLW8t
         WOZOgbutr3eyP/NYWnoSxp2extLeNx6yeeaH9sgHtq8gN7qhORpKur64TV6KjklHDJtb
         cw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790688029; x=1791292829;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2T5RkWVrZxsjtjTmZsWjGyBAn0522HCwfBHwVcNib0U=;
        b=n7fbJQpR68cRhwOAZrBk52u/LxB4kpC9ghTT8AurAPYvrOJDzkYaLNFB6F+5pnI3yq
         HkeNb5Yx3mbFUqvP11fVu19FhBYQpUfRZfe8/RyLrQhlc0PA+z+VGqNDJDu2Y9SaUd3p
         ldfdCflzgNX2gO0+oXima3NQS8aZNg3lLTi8pCeO6YBHboEYJtiaH84GXOdEg8PQZQub
         Ap3E/FAscqM8G8GOlrfAL7NM551e6qidjVXKuCWG/6kxulI3OJQ6rhfLfdBpE8ZYRpKN
         vT/Bj1ea3Ci2QGKi0GBsmo4DuznqD9TLn/k9C8B39dpuuCxPciayDRiVr1Gc7y6vidoQ
         WHmA==
X-Forwarded-Encrypted: i=1; AKwUvBw/BfF3kkpvtyFI0r6SRy+mUkyg1oKKZT5yFStsNrK8TysBPm8Gv5/AUBPZSZJj2fqpeHuFxaGfKwBFvpnU@vger.kernel.org
X-Gm-Message-State: AFq9FYJXEBcqdC8emZ31AzYSPAXvlORpVwAP/DodLcOFqRoAwQNkgDym
	kxiFwgR1zr6ZKmSnOqGDK54fTTC/VK1KZh1uLMAx3BTweX6LrjjGF+EN+uDpnHgZRHZd4a6q4mB
	aBTAW/Odd+znE/AodgxIkryUWqzJA3jCa5/puzOq3yB0XqhTOcU4ompA4hq3mOaPRlxRW
X-Gm-Gg: AYBFou0kW725lZxeHraYblZSx2ZouHCa4uAEJuzk5XAm3yE6CT8sQPSRfTJnR2CuFrC
	xUHOVBxs2pFiSLSSOfo97pTm2aCye/PMR04YNYXrLqDWP2/ci2XJJ3VaX93RELSJZYBXTbKMMq1
	Q4r3cSeHGjCFHcxa4cc277HOe7klA9M7hHCUJ+Ibk5Yzm8iAR4Z0eoxDSs+VkBG//cbkuWq+d0L
	NOGFp06ZHCeK+kw3oLVBe086TOmVSOt2HJVwAmYdOvVpBo/M/rDHlivGSp4rXt4nO3gkBEsMYVD
	V6RuGb8puAyA/PDA7iF7WblczIy5I9ACdhx7xreUfrUzl5rGxgCYmT1D/Gr9UjZluvjaHf6rg5r
	RNYZORRwZRa6Wrng=
X-Received: by 2002:a05:6102:4186:b0:7b5:7cd5:2a1b with SMTP id ada2fe7eead31-7b57cd52fccmr1747286137.10.1790688029377;
        Tue, 29 Sep 2026 06:20:29 -0700 (PDT)
X-Received: by 2002:a05:6102:4186:b0:7b5:7cd5:2a1b with SMTP id ada2fe7eead31-7b57cd52fccmr1747265137.10.1790688028694;
        Tue, 29 Sep 2026 06:20:28 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfec770sm82731695e9.8.2026.09.29.06.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:20:28 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:20:26 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH v3 08/12] arm64: dts: qcom: pm8550: Enable BCL sensor node
Message-ID: <kab7u3u7mtadzvnmknprujtjszdryurwjbwqgyr3aovzobumtu@y43okjkpzupz>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-8-f5ca00889cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-8-f5ca00889cf7@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MyBTYWx0ZWRfXwrVEPw9f0mT9
 3KURjbXanp0YzYbqr/kDEGOC82cu6Zxvjbtlykx2ESsl7l/mw4TKRLPmwkSkd6OVwRo3t3OXX1s
 w4bd6L6Y/GYmJFYJArxgmeHunlVTaw4=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abbbb1e cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=X6Y4kDKz15hUnpVYhMEA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MyBTYWx0ZWRfX1z4ab0eRiBio
 q7wDcA1PGL3y24m3scMbPvRGpJ7X05f8GkAJRkzSA7kYpUsmKPZrqRuMKqJj9h8jzREHPbVkAjc
 URwEAU8kReaIj+69d4XWvTH7wqp2Mh+X0cFJb8XLOoGWySrvP7xvxZmeZ5AOrsj1UEawpyj3YA7
 5UxVJBcnToh7oXL9zLgnsagLfiGlLqluQcizckm6PzYRPw0EWOqE93xKxKHwiTF7dQgsMH8ilVj
 jOegao2UY3wH3zmLQcBgOiADDxBuxvXf2OtxfrzSxDeqLcfGQjjVcuYE3zLBlgVdjQvUvcG1fAj
 MqFvyLsRYt7Upq7BIaM9NEXcn4W2YkKrHL42QlJuquTkIOxeCuH+JP52dzvD3/9aKLA93ZxCcUf
 ub08An7KKWPyf/AcBAx/6rwb9clB0sIJy52Bdk9TX+0qA/nrtt91lsKunfAbiRCjHH/qggscz1V
 Xb+1/vnQI8a5byrr34Q==
X-Proofpoint-GUID: 4nu_Q_JhO22XXtSwT_e8zkt7O6D6YKKK
X-Proofpoint-ORIG-GUID: 4nu_Q_JhO22XXtSwT_e8zkt7O6D6YKKK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290053

On 26-09-29 18:39:40, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pm8550
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
