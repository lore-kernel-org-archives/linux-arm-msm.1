Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6D7471428
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 14:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787928062; cv=none; b=ECRjYFGPSaneyvRhwIvwS574SnaPyGmLVQI6H7Ad0K469OxpLpNpQnjEHBQ1E60UizTOZhjUHfYLZl5JBQS6estjGhqwqkaZTrq93hjDelXPsfc8N8Qi1F5FCbPUaTwNPB53b3qxkaFWvIDRZqr+v3yFiSzI77BaKWs322My5wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787928062; c=relaxed/simple;
	bh=Gp5cNpvqC7YnJtgTQ7as6KDz2NHZgVd+cRvOfbagt4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mRfcfS6NuVOMtGuvXULJXFeztib2+xbSkA4iVCy1nXHRf3FpPEX5oxy2KWEDK7G+OAbKzrJTTcA70UX18tq4aDxp7rpmNiT7vRnL6Qlz7iMljK2WjhEexsb8zInCNkYztm8ylTVuEZL4hDWublaK9ibxIJGxl5NCT5SnBKWNBMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nOwr2w0C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jEL16IB5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nOwr2w0C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jEL16IB5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDkcX93226288
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 14:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bOnsUsh8Wpvj84UUQA6eFNHOjYX12MlSNu7SoY1Zd+U=; b=nOwr2w0CXUmoTKuT
	hUt/J/AQUWqI7HpQzuuQIwfNcc00QVT88jHKRYBWipO/oYGa5hsQ5ZMwnD+CtEDt
	BNvfr+6hozp0aXCMwQw4HIFkYmw7smmiRf7ksjeBPKbg8mFSv7mNTnSlQhjh7Z6J
	U7g8E2sZdECdUNch279hX0bbGW4E4XMzoQfqVeOMIdiaXYYWPuvfVMtWVDqjcBEB
	2ee0AD6EIEON/ds6iXB4N7+51/rrmeKoby6lGQQwbJYuYIeX5mZkNM8uOE4QS+cF
	BSmoVcYba+d9ecfbEgShY1o6YRbRoii1If6TSixgkB4QUdjtEJhJjpmrVu9BK7o0
	bNWeKQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb3mxta17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 14:40:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cee1ec30f2so13983265ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 07:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787928058; x=1788532858; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bOnsUsh8Wpvj84UUQA6eFNHOjYX12MlSNu7SoY1Zd+U=;
        b=jEL16IB5/pcItpVVyD3o7Bjjjipcg1LsvtNbfXsN6+d0QD2NlXwLclBgAy4pyrWIhg
         cK029wJgvMJLMHre8NWJdK3ZzHFnVaJLimWtZI7KkWqYpq1WFKUnEKoebbzDmZkACZbt
         5B2mcKI1MTtJUPPWxiDsKxVqT1Lm74o4VDX2kY8PHqZkFphTZHCtmohqUKSYCIvmL2tK
         fq6BHU4Gs8+hpfYgEoT5nfrrtTBni48UDfh4zsjO8imAlU1yG9ga1WYXS2pFBcyBEZUq
         RpT4PzoKGLhT8/U15HA9juMKPYu8MHRW69Wp8poC0+zu76KcW5el5LMUp3AO1fh3z5/W
         MM9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787928059; x=1788532859;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bOnsUsh8Wpvj84UUQA6eFNHOjYX12MlSNu7SoY1Zd+U=;
        b=ixWR1c/x0E+suV+/XgaPWHYyAhZ/tqeKeiHIN0NN4YTWDrIC9ERT8EuwnuKN5QrzLd
         GEWpGXs6SfG9JpRi8/3Ing1ucxNf1g67qE/WRhAr8nNjLvs+misWf/BdxmoyL02KuZzY
         vbVT5XCo5db+W4cwM2y39d3QGUC5YW9yQmWa4DGGvVKtr0ImvgArSKaRXeaT7r4nsWJE
         9pDzew7Cciz/tyHj3tFS9UgqEgBxqO6LnIl/D769GnodgvwBYgT34C69mGQ1WRynnmuC
         jfmOaHY1war1v70nsFimXD6nb85sIboPjsvgHVGrLFDe54Z55Y5w45EyKffUn39VFYEY
         67dg==
X-Gm-Message-State: AFuF++lL0r0HnxAjCKCMvAStzpyYx5XbUUgrsQ16DCIvayHs8KKZdsSF
	L8iDe/ot5M2gTdK6WOQiXUY3okDVrIHKZ5YhByyTGTreY5EhTVDXcN/p2cQwoyeEza6kRDpjyVA
	A4ckHbDZCdu75JZ5pnepPOByJiR8Zs7+CsP2VofhHpkeA6Y3mLCsYlt7gspeasNKs8H3ZQBQZKf
	E6
X-Gm-Gg: AR+sD105lUDak2TVGh1aLTQUVppjXi9y7rDvlUWhQr5vYc5IEEw3QdU6wsn/6UrhBNF
	EtFOCADNuq9+S3+wBmfXpM1DvCeEkRxmSXNmbO1yMp3resLDLtMqaY+ia0GixV3+XhEfoj64AZQ
	GU6bluk+IRhiF1MRsDZuowFWr/awH1l+itWTGxob/1HeiFSm280d6X1m7Jk1DuzktRWvCTJM0RU
	Rop2zTpZ9URIcDAWFDr8BiB3SwP3c6shgmBbyazb5NQR4RKJ71CiNj0btC38ORDV+NkTMo64YUb
	T214qTTrAzPhRfuOsfRj8pHrLipvHHZacD4zfXWKupUueQwoIgNBExYfpukCrT1wmb+TuTPH9CT
	+sUXrHzxdtwBJ3tiSsGS+AogwcnQkI7uR
X-Received: by 2002:a17:903:1ad0:b0:2d6:f9e2:af7f with SMTP id d9443c01a7336-2d74dca2148mr159874705ad.1.1787928058405;
        Fri, 28 Aug 2026 07:40:58 -0700 (PDT)
X-Received: by 2002:a17:903:1ad0:b0:2d6:f9e2:af7f with SMTP id d9443c01a7336-2d74dca2148mr159873985ad.1.1787928057780;
        Fri, 28 Aug 2026 07:40:57 -0700 (PDT)
Received: from [192.168.0.5] ([49.204.106.185])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75986d2ebsm5934585ad.45.2026.08.28.07.40.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 07:40:57 -0700 (PDT)
Message-ID: <4368e295-c734-41a2-8725-433525b3db90@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 20:10:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] serial: qcom-geni: Fix unbalanced runtime PM resume for
 no_console_suspend
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20260828-serial-qcom-geni-fix-unbalanced-rpm-resume-v1-1-af3e5aef17a6@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <20260828-serial-qcom-geni-fix-unbalanced-rpm-resume-v1-1-af3e5aef17a6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEyNyBTYWx0ZWRfX2CUGgDphWPYH
 itidg34ZZ+niGW/T9Kj5PYM37VEIKVnlomOND8W9eUQnOj+H0CYrYV81Xk+kSMtq+7bHQJspYAT
 5RDWbfR3Vg0rQYoWOLn7cBShl3HSv3dLRqySJH27hT3+gZ87bzTFToIq8icoH4CHfYmFWYtnZ/g
 8BFWDkkMLzkyPDF82e2Er8u7jKFR91Olx59cGN/D4T46Lk1h58yuYojQ1duP6SOErRTHh84qwC8
 q4SHmtVx9w9RNqj0geAfNu3yE2bZa9XJo6wTb5aBhVcRlhd12OfpM13xEdULxughh1jWq9Mka9u
 DAChbNMyK37oPDOwYUFtPb/NuSK/Wqn6DVrbBu/af4UkPxWkUoqXgnH5MboPiVuyGx11rl4yEBG
 5r8fXlLKPmbzOFuybnHpYThxs+yq/1/oBmEM3AEHei7Zzu9uT7WUJiuja35VrYtkHcREQrL6duM
 aT4C4ArkmmOtQvQtxCg==
X-Authority-Analysis: v=2.4 cv=MONQXsZl c=1 sm=1 tr=0 ts=6a919dfb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JqI1KGPJ/fv+aVyoZTfG2w==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=D0tFkimwtIXZEwdZqEwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEyNyBTYWx0ZWRfX/nNa1BQXm7HX
 j8vgSXsHxe61ewmq6QNxagf4UlHpq6hHYVtBwAkxtzhcbv2aTCI8loENIrw1EZWYkhEQwJ5q6SM
 auGe21OAFBbfCobe80Ykt1wDQFzrnyY=
X-Proofpoint-ORIG-GUID: 3ygYPlqJo8WJxiYjYY6lsgu5wIk1FAUt
X-Proofpoint-GUID: 3ygYPlqJo8WJxiYjYY6lsgu5wIk1FAUt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280127

Hi

On 28-08-2026 20:02, Abel Vesa wrote:
> When no_console_suspend is set for the serial console, the system
> suspend callback skips pm_runtime_force_suspend() to keep the console
> active. The resume callback still unconditionally calls
> pm_runtime_force_resume(), which triggers an "Unbalanced
> pm_runtime_enable!" warning.
>
> Only force resume when the suspend callback force suspended the device.
>
> Fixes: d0cd9c8d0fd5 ("serial: qcom-geni: add force suspend/resume to system sleep callbacks")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>   drivers/tty/serial/qcom_geni_serial.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 3633723acef8..a180a00c9e23 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -2099,9 +2099,11 @@ static int qcom_geni_serial_resume(struct device *dev)
>   	struct uart_port *uport = &port->uport;
>   	struct qcom_geni_private_data *private_data = uport->private_data;
>   
> -	ret = pm_runtime_force_resume(dev);
> -	if (ret)
> -		return ret;
> +	if (console_suspend_enabled || !uart_console(uport)) {
> +		ret = pm_runtime_force_resume(dev);
> +		if (ret)
> +			return ret;
> +	}

Reviewed-by: Praveen Talari <praveen.talari@oss.qualcomm.com>

Thanks,

Praveen Talari

>   
>   	ret = uart_resume_port(private_data->drv, uport);
>   	if (uart_console(uport)) {
>
> ---
> base-commit: 3d83758432b5e6ed9507500a57efb0f3af41ee7d
> change-id: 20260828-serial-qcom-geni-fix-unbalanced-rpm-resume-814e630326b9
>
> Best regards,
> --
> Abel Vesa <abel.vesa@oss.qualcomm.com>
>
