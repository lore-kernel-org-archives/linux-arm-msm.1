Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F05A42E41C
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 07:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791444955; cv=none; b=LnDOR6Pm37+Hy2sLf2nBuEprVXlFaeYLeYDLgpjeoEPqg2n/p40hDazIJSs18A7Ol8U1+dmO8fyl+DJZIaXVuCtRgQ3MRa5igdl7Ul0CAdMVp5tirNo+b6pwxhOqDVWfjXSh+tZkFob4yy+B+0aXqOFt9dosNNUCGDeH1dKNdhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791444955; c=relaxed/simple;
	bh=99wYJp3NJ81UB0rpFIJF2rUNHd+EgUyr1j9RtWZwtoY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m7Q/rGQIwEdU+Pf/GcyJxXVSE9VIVWdE5qlF+mwpI8ndHIU1pc87M3XbvS/RQ4Xsnd9+mXHzDplw9FUnPaNjYYXBMst9xP/h+ffrLjhdzN+ODuoqwPXEu8GWSOBGoAbK14MuAw01rKDpCtW96qmtfdjrotz2iezsGID4iDrJtRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XCuej6+K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IZWPq7TN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XCuej6+K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IZWPq7TN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987K8jN1341890
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 07:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6E7f87W/XyZ40GqugjOqDeLHSs71iH9JyYqCBHkyOGw=; b=XCuej6+KqJJ7L0Kq
	2mw5AHEGCBDCt1Lv5Z2m/TzLxn8Ph6oU/8yqSzzacoiJpijkNCi+hC5uqds3f067
	N6XoeoWGMhq+NCUKkX7OkZRTPKkTHI81O79OEIM/6aEEDZUVXBla/9zj+KM5/Qkn
	Bc9bQfjVyeN55hsCoBghkqg1x9cXoGJLqVS2eSRb6KxHrkHwnmRR56OXEReTzojH
	LW6e0BiTmFxcXVkFgRUuJyAzYACvOqMxNiiXzKsLYkof3HnYLCi99UYgiglX2x8K
	uO21LGM2+JQxbK6behqGMq1ehu+3B2wGDYhRREb53omb5k8JmZEnAgdv9Ib3E8v0
	vrXo8Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2sr46-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 07:35:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a85a33333cso2591940a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 00:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791444949; x=1792049749; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6E7f87W/XyZ40GqugjOqDeLHSs71iH9JyYqCBHkyOGw=;
        b=IZWPq7TNYbxXeeEXFaCFUvVY9Cl4nPLT6KiuwsdQB9nLTyw6Bya2KANIPY4l7wQsv3
         896f9KVCG4TQ4pG838/ZoqjRzBezipIJq/AXPwyjvVaaFVF4dbs1iPDXhsofxqHpp9bA
         FsH2569fhpevdgU4Xx3R20GJA+HFYPzpt0Ilp8eNDCEjjXNPeojBeXYPOqwcssLrNR/U
         S8f/uBqUgn082a/07ImhU3fKebfuq9vTuX5QCs5FqfTTrrw50wHOPaWPoElQLEt0pS+r
         8D07WzRml1FNaoaTIYJV4xG2oeoiqqYSWI9j9P3JjCvoSrR+nG3SqGW8ZSpm1kHjCrvH
         xg4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791444949; x=1792049749;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6E7f87W/XyZ40GqugjOqDeLHSs71iH9JyYqCBHkyOGw=;
        b=GzVq+h5YAyuqBPCKBpCKuBux0HIuGj1A08thvhx7UxDFVk7U53Ltd2QAqFLfNZjgaA
         IeIJY1sfxLBqpujDJUKc7TQ/myw4CvB1Fqn5oa9tJtS91r5lkFDZ8ybi6kgICj7HP3Us
         JiYqood/9Mgh5Uowc3475m5lsZukdAxbNuUnZX+hoqss+05QVbuo+yhATHsTodgQzrS6
         WUE6Hn9/4RtFudGhRqymHJDcLSPt1/cvRyHuof3FQL2woHlg8HzWYQaCkaY/lc1rH9cz
         hAMBVMA/GSAo4IIP3Olws8cwtjIqoJ7uyQ/K/EezAOMaqHUup0NlQZI0uNjFUqYqAmDx
         TAjw==
X-Forwarded-Encrypted: i=1; AKwUvByITtdT7KBDWRc6I3CXIi1bDOSb+tTD6PAQtdOKbTYKnPPGeScSaLpDAXlFdeXq2/2coJs5VaVeTbdxWb/d@vger.kernel.org
X-Gm-Message-State: AFq9FYJAui7VVz1q/GYs0DoiJuBYyBl8mEOEQdv7U7+LVf5/UlAig3GY
	tjT4uT6tV0Wf8TgKQOxt2Wd0kK5AK9v7EOMFith+20fpk9z8BbmCeew86eyQhOvsukS5Rzm+JpM
	Pl6XqkvmN/C03/7by4u5BCTBrGY1x1WFDCEaQ6TBluxfeij+glkom6ocM9EDXvRAPB9o7USBu0y
	Zy
X-Gm-Gg: AYBFou2yjx26TOrm4iNz1ZtOJ8iOX3CIIPJOYip57jd5C9HsYoR7xwYc5mzUSCvDaUV
	kOlmaDTdEDR8DEvNL7r7Sa0tJdhVa6NpumSrlEg6RcFUWfM9QWu79C69ImCcY0l8D5/savgMFlS
	wwef0XV/8mBmQADrCqAvFVVXf6D8j8tV2JB8fmRjW9kvTb5dGFsC6ukCQfX6tbK46/E0nzt+ZBX
	XQNLLAMdsGWkCdyYMR3v4kkHLJzGWJqzKwz8xHc1HcPE5xLnV66ilfRr9bJNLRIXUihIRoZhuuG
	K5UpgvAGo/17inc5XJoKe8cgqV8/ihWaMwnGitwTXV/fNQjyizTx79vxasNRxjA8ZX9OysP8bsH
	e+LRTdfykgcDX0/YwE7oDyT5GmmRMzILb
X-Received: by 2002:a17:90b:288c:b0:3a7:eb0:119f with SMTP id 98e67ed59e1d1-3a8a0f259a5mr3398857a91.43.1791444948606;
        Thu, 08 Oct 2026 00:35:48 -0700 (PDT)
X-Received: by 2002:a17:90b:288c:b0:3a7:eb0:119f with SMTP id 98e67ed59e1d1-3a8a0f259a5mr3398827a91.43.1791444948107;
        Thu, 08 Oct 2026 00:35:48 -0700 (PDT)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1bfbafasm3506674a91.11.2026.10.08.00.35.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 00:35:47 -0700 (PDT)
Message-ID: <cf4b63ca-adef-46f2-a616-01841a70b173@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 13:05:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] serial: qcom-geni: Use geni_se_set_rate() for
 source clock configuration
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-5-091697dbeb02@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-5-091697dbeb02@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzMCBTYWx0ZWRfX/yT0cg54Kwvj
 wKZATl3gnFlv8SKgJHC+832gh/sJ1zhcgFEtBHAIY/xhvYwft4IgZqL8JAyKeSHu94F4TzdbTVi
 77QXT30SwCpI1IrnD84ttRhB6EQxMLE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzMCBTYWx0ZWRfX6kGOCDZGpP0+
 wpyUzzQ9YfUUYxIyxPDadMvK4TadUNd0ouGRXpzDWrk6cxc3Uragmlcof2lu4PqvgEdkHDPtveQ
 Dwz/d+eFYuLs16OAo3sjpk2ySsej1HJv46mU6JdSlQYbt4L9E7ISlf/5cgCR8L/AYDfz4nfLjQw
 9G+BM4xjE5iIUbKeyVxgTQGzw7zHaL1QnDJ+Ls67Eko4qA62/5C3k/I5BbxO5H3HUWI45lhIIVu
 LzEMR+A317xh8SeKDamlzoUkG4jWIS1oBYK6bQ3ND1XDq018amCMvnJW/nD1sC+oWVT0uyvyMj6
 OPLB0XAIEM5xmwDZHlXN8ggNgA0gUhxUr0UnteoSKSG1IFAjyL2tqxi4LIPnVQQQ5eaUumCBdjb
 xTw/6aBLFoipHnWD33bIjSQicegFlD7eqaQUHTwi5wLDx2lWmDEHU+jDXGbjKWVlic0Yn8Zlu+y
 7g6uybBNM4AjFMwaRfw==
X-Proofpoint-ORIG-GUID: yUi54CaBffT-vU-CFAcdema26LjO14lZ
X-Proofpoint-GUID: yUi54CaBffT-vU-CFAcdema26LjO14lZ
X-Authority-Analysis: v=2.4 cv=CIm/zhrD c=1 sm=1 tr=0 ts=6ac747d5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=l2yqw8MAX8n28sf77-kA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080030



On 8/27/2026 11:29 PM, Praveen Talari wrote:

[...]> @@ -2039,15 +2041,19 @@ static void 
qcom_geni_serial_remove(struct platform_device *pdev)
>   static int __maybe_unused qcom_geni_serial_runtime_suspend(struct device *dev)
>   {
>   	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
> +	int ret;
>   
> -	return port->dev_data->power_off ?
> -	       port->dev_data->power_off(&port->se) : 0;
> +	ret = port->dev_data->power_off ?
> +	      port->dev_data->power_off(&port->se) : 0;
> +	if (ret)
> +		return ret;
> +
> +	return geni_se_set_rate(&port->se, 0);
Is there any register access happening as part of this 
geni_se_set_rate() ? i was searching but could not see after seeing 
set_rate() callback removed.>   }
>   
>   static int __maybe_unused qcom_geni_serial_runtime_resume(struct device *dev)
>   {
>   	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
> -	struct uart_port *uport = &port->uport;
>   	int ret;
>   
>   	if (port->dev_data->power_on) {
> @@ -2056,8 +2062,8 @@ static int __maybe_unused qcom_geni_serial_runtime_resume(struct device *dev)
>   			return ret;
>   	}
>   
> -	if (port->se.has_opp && port->clk_rate)
> -		return dev_pm_opp_set_rate(uport->dev, port->clk_rate);
> +	if (port->clk_rate)
> +		return geni_se_set_rate(&port->se, port->clk_rate);
>   
>   	return 0;
>   }
[...]
