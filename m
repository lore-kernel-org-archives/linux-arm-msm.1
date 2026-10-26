Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793040344;
	b=3u5+8r4KXhdURnXFjEkQ3RorQUn9FcbUBWuFCZiRFTJe88bwKyQEev027JKhOP7HRHC2
	 6KDQeTYmAsqV67pxIoWOgudqt/imx+jrVshlQp3z/cOrjTMpqyFXMsI87I3WMzOpF+uSk
	 Hkb0xF45ZaoY6eLl382MUrAlobF3hg4lvKB9bdQPDGYz97yGUGo4Df7jzSKrg9MNE0ke/
	 lrWG5DiFizui89Ac9wa2ZWQLJ2l8VSAwINRa38x/pNBENdAuv6B2+CvmDpVZ02lt9hQHQ
	 IpKyfZanmh7Ho/FEZzvvsgVfDkLcwHjbANXH0RJTqs6Rk1XxJNE8KPfadGjhilzR3oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793040344;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=s9kKn5OnW0rSv2c3iz6WM7rho6XB5fObcZeQYwnjFs0=;
	b=gg95SyLmva47WwQEmROpiGVPXHvATR9i84yM1G7BEhydX5UBZ66rr/1owqWcxmRkj4C/
	 nyWo5OrI8OEYaeSEhkegYXe4lLNUSs7SNjrbtp0lXLmlZ/TreMpRZpITsivcCI27Iu+jd
	 vDjS9DbOVAZIQf0kMYJThrrdp4E45YpmkrPxYk2ty73iNHNNw6CAOq0vMmLcQ0lkhNK2D
	 aYIncVxGD/Zx1P1rLw7ZiMEJS8P9udXOwf2PU6SPVSdsUrY0IR/yQD911TMqkkBsQfZO0
	 2odfiBfelS1zEK68wvwzWEQYFQwsokKPqYjs99fK9/wG5vMDZngk7mg7JHs9hcYoYVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sope3mTw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B8mXtiHF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CD4606A332
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 18:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70CD4606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sope3mTw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B8mXtiHF
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvpBU3268445
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 18:45:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s9kKn5OnW0rSv2c3iz6WM7rho6XB5fObcZeQYwnjFs0=; b=Sope3mTwm5HyUkLJ
	x6jQx52i9U0ecmeJZJ6qH94yFRsy11XErJh51uRDJDpuTJGrRNIViamgJHx1QiZ3
	xKfa90J6Agp3uy1aMvwH+FQtvQV2npPxF6PVJ20850ALK90sqAIb1oOO9JeUDhuH
	cPjS8l5fgbWpex089wYTcrJvNFsE0HY9ARYjwTNHJl4aLvguXECWyQ7i5U2PBcD0
	wIitKtL13jJxrPig422W669mWUtuqu7n5oL6XJdtXx5l3snNAhKxeqvHsgc7lSao
	Xzr4puP5oqAmiy3fHvDtFzHsTpiujsj21hANOW0mEZxwwSoqZO9mJ5KoBviOeYs3
	pTKiLQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cpa59t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 18:45:43 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-18b5ee75447so3278133c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793040342; x=1793645142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s9kKn5OnW0rSv2c3iz6WM7rho6XB5fObcZeQYwnjFs0=;
        b=B8mXtiHFbgXY+kZt92oZ79JerUUCf29185RekpjEMyHcTSHIchQeAQ5bsCGsDTpDBk
         gb46vI6FIuocc4+IGNuob8HxU/yUi1eFf36eZ2UdWhWCyIhYCpINY7TAHnqImJ1sN8dk
         8ECj2VcqZuXkXH7A7AQcjO8c1AX5FCKVWoF89goiJrb/wmIVhVONX0ZFnbW8rbKX0AZM
         V/ki9/Rv9TvmTqs1HaJpH0fTW1LVqIhCHYf3UXpuR7QDf+ksQvnQqsQZzfYEiC+CVPh/
         xEJgcvZfuh2dwEJiXtZf1U7zdosiRd0fBkLBVxBKNx1AW3Mh2xIH9kLwa9ILDWy5eeWc
         O9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793040342; x=1793645142;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s9kKn5OnW0rSv2c3iz6WM7rho6XB5fObcZeQYwnjFs0=;
        b=p6FV7BlQn6Ut2b9F77zdrT2SHNgmk+ASxCJnxD5VxawtNocVLW5A/cUakxgH3slMYa
         DNEqZ0sZjHXtqIDgUaXklogxoX58gDwXeZmU0hlW5U0HD+Rov6iZuh7RHF+jD1we060C
         s9+ECFAnuC9vJa2nNZg/dnBBnDEwmT1NMhnn0lQTPNKZW5qYm5Jky/9vIb8WT3xwdQVz
         SE0OHY7O2zlikuS0sR701mh9+PKa7kdC7LlpI8dLHmQdEfR5++X3jz5yHmFl7cZsPYLq
         jyVdaqklh3LZlyiVh2kAmjIPwSl9sOxHjTF/5JGnIQuDbt3RfrgXD3TL3Kkp7cGg9DN9
         yXog==
X-Forwarded-Encrypted: i=1; AKwUvByxGcc55Oee0yzdtYo/MaHnydtAXXtjZ//ulyJpdo9hYr4O6XWAUJ44h3KSuAp/Itxd9iy9l0o1Z8wYO2Ci@vger.kernel.org
X-Gm-Message-State: AFq9FYJrq1ST7iEP61OEU9ZbqHrlUBLVHFSq+w42SAXGIwgPXwkV9F2T
	8cf8hOz0Fzyh3UXNeb8otNgcIUklFPhgqJbTXh1TS2O7joIOfWUa9ozXM+MfGNZr04E8UWQ1aoo
	UuM7VZIXrH0R9I0QONPLIDp+Yay8Il/3wP9o8Dz8xs+03BQQhhIN8wZZ/coLrqf7Up5/9
X-Gm-Gg: AYBFou2xL0EjTk2Uy9hvVylI00/vEW7zmUUWI7cpaoU9scRhi86UDLVTv2XLzraQLv1
	vYPvirlsfG3FwHDAeScR06BG/AeixL2eQIdjWRWDHa3o+34dxJHEu/jzgZqElKJWYg9FG79m4Tw
	rUH53EgVIFHW8DtmF6MfXwVgiL3YP0HV6uQU7gd4Nr/uOJgT2PYiiVFCIsjvP9IwxWmD2PE4UYX
	MB25AH3q0UupyC9p9pSTXZ7o62OQQg50/1c+qe1wdyTEFrk0B43QEgdV7zUVko50WhiCacUR2Rv
	lWNMHtyrcmrl323XAljy5w4UjQsYJJud7CTWw3e/96AqshAgVBRRc8BRwAmalgvBQca/bgt4mg5
	cLM1CL7V3tOHTNeGmzgq5j6uyDgu4gZXOr6u5LbsdYdQzpZ0u+vsTRPJm7s5IY+G1AB1bhBo0yQ
	q2FlM2YNI=
X-Received: by 2002:a05:7023:a85:b0:18c:ad6d:b790 with SMTP id a92af1059eb24-1993f6d3884mr12734018c88.45.1793040342121;
        Mon, 26 Oct 2026 11:45:42 -0700 (PDT)
X-Received: by 2002:a05:7023:a85:b0:18c:ad6d:b790 with SMTP id a92af1059eb24-1993f6d3884mr12733961c88.45.1793040341387;
        Mon, 26 Oct 2026 11:45:41 -0700 (PDT)
Received: from [192.168.1.2] ([106.222.233.247])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f27d5bf8sm25283040eec.4.2026.10.26.11.45.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 11:45:38 -0700 (PDT)
Message-ID: <1360aff0-d738-441c-a631-0d2998889057@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 00:15:33 +0530
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
Subject: Re: [PATCH 1/2] i2c: qcom-geni: Add shutdown callback to quiesce
 hardware on reboot
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260818-add-shutdown-and-panic-notifier-for-i2c-v1-0-9f31b5fae5f6@oss.qualcomm.com>
 <20260818-add-shutdown-and-panic-notifier-for-i2c-v1-1-9f31b5fae5f6@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260818-add-shutdown-and-panic-notifier-for-i2c-v1-1-9f31b5fae5f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA3NCBTYWx0ZWRfX53uwd5W88yti
 Qwm0zf7RG+WTXhvSYcwOqUGwNtmge1i/3YnIUyE8K7zjIr46PZn9djzXZKHBH7Yis5DebiEljdl
 X8WfxiSLcI10sH7RnmCQM+mQw+ZGATxdoCaaqHeoOxlM7Ew8hCj+ss51j1DJeHrHBMsPyc54wud
 udxf8drfl0sg4UWhS+HmKadaGSqio6/m70hWjtzaA29zoTAIkDiguUZQodI4xAOZhtErs1GSO+c
 I7nLFJzlyzA2TFjQklYP1mleYKNe0/0RAgAFtynhjcjOLjsRo7UM59z2hkllslkfz0YIwufvLqO
 CBMrPeg3htl3vAaYSG9zmI2salTtlms0q5cO9M08GG8oRSUpFhnqz36IfJd1uqLtRIfggijvtq1
 f7hLBNhHNx9vEM0SQ/f3o+sNm4AMJmMJxxGYUSrJqhUFV8golv2DaS4KAkmXMHYqsSrNT1wPPaV
 IOGkLUOr/TfI/M0ouew==
X-Proofpoint-GUID: xZvCSmGI8aelM1appQjOY20qcF4huCgp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA3NCBTYWx0ZWRfX7lXacsKR2uN3
 SGuhB4Yo9WtBi50yjdlKSXe92BSWi5cVo4/SjdmSMVMWp3i4NJwDXnfUP4N2WXXNwofQMezRlf2
 ChTfNhpMbFWiK6qyil41OK+T/XD9iG0=
X-Proofpoint-ORIG-GUID: xZvCSmGI8aelM1appQjOY20qcF4huCgp
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf9fd7 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=5/Y9Gi2N1OwmQbPtUd2E/A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=hUR4YRKjZVNWWFvtt-oA:9 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260074



On 8/18/2026 10:31 AM, Praveen Talari wrote:
[...]> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 51 ++++++++++++++++++++++++++++++++++++--
>   1 file changed, 49 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 658636c1ee0e..10c6a4b0b825 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c

[...]

> +	geni_se_abort_m_cmd(&gi2c->se);
> +
> +	if (!readl_poll_timeout_atomic(base + SE_GENI_M_IRQ_STATUS, val,
> +				       val & M_CMD_ABORT_EN, 10, 200000))
> +		writel_relaxed(M_CMD_ABORT_EN, base + SE_GENI_M_IRQ_CLEAR);
> +
> +	if (readl_relaxed(base + SE_GENI_DMA_MODE_EN)) {
> +		writel_relaxed(1, base + SE_DMA_TX_FSM_RST);
> +		readl_poll_timeout_atomic(base + SE_DMA_TX_IRQ_STAT, val,
> +					  val & TX_RESET_DONE, 10, 50000);
Any error log to print if times out ?

if (ret)
	dev_err(gi2c->se.dev, "Timeout resetting TX DMA FSM\n");
else
	writel_relaxed(TX_RESET_DONE, base + SE_DMA_TX_IRQ_CLR);

> +		writel_relaxed(val, base + SE_DMA_TX_IRQ_CLR);
> +
> +		writel_relaxed(1, base + SE_DMA_RX_FSM_RST);
> +		readl_poll_timeout_atomic(base + SE_DMA_RX_IRQ_STAT, val,
> +					  val & RX_RESET_DONE, 10, 50000);
Any error log to print if times out ?

> +		writel_relaxed(val, base + SE_DMA_RX_IRQ_CLR);
> +	}
> +}
> +
>   static int geni_i2c_init(struct geni_i2c_dev *gi2c)
>   {
>   	u32 proto, tx_depth;
> @@ -1209,8 +1257,7 @@ static void geni_i2c_shutdown(struct platform_device *pdev)
>   {
>   	struct geni_i2c_dev *gi2c = platform_get_drvdata(pdev);
>   
> -	/* Make client i2c transfers start failing */
> -	i2c_mark_adapter_suspended(&gi2c->adap);
> +	geni_i2c_quiesce(gi2c);
>   }
>   
>   static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
> 

