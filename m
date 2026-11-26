Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795679061;
	b=Xt4NZKL0VnIrG9+/BVr/EPRky0XlbdQIh9Vwm8cuHHlzpdoRe6MJ3vqjU4wPJqTT66aH
	 slu6aQOhkiBIUnDzjLE9DgbtLD8J1wwWt5s4xvIAh7etLFKyoXiAGUvf7NYhMS6w1TbCA
	 LVAMv+qMvSLxDZaa8YzBxE1sQLbt0xakxzZZ7yEomVz0ZxsCM5wOrqHKth1DWAQHoiDns
	 VknWzfabN6/4mvVsZoZ7owiXA96ZejE0g+w3/3u4T0YuToGWT8IRRwglrGzSA3aaX97RX
	 3tNm/Q0C3lfdOVTwO+FIYycFvI8QE5b12jBWFrZe9/aZnRpvKSXfUmnq2+T7YWFpd5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795679061;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=G7aKyVjdYavK2ZAELbW1cotgkHAtEELC6+iiVeRDFQ4=;
	b=yNABUeFidINWjZJ0fLIeJNAFBVdTTTkRZE3WTMPWM2rImFaLY1zwxoi/lPEBsMPrrkD6
	 51DsB7FAeiOh56irgaZBcfSCSjV7hsJtJXoKnumv6pHREbhOUmX4kfwNYj/utKh7v4OQE
	 e1xLCI2d9FaAJ4gUzFSEm6L+7Psp0fRC+EyWwLhpmH9J+XobfSJhI6KtkCFhdFUBWbaBn
	 NVAl0YnZU/Wxi0VC1TXKX+fb8uIWrItA/Oy5pxXt/qwaJbNIu+rvNcRYXnb7Abo5aNA8/
	 9Jg1PZuAvDmJzc8ecjQzj/5K71C+XUicJR215d11sxyPSIlXp7HcMF2K4mXR/Q5yJOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D2I91NFM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qpc+GDZN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41768606A327
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 07:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41768606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D2I91NFM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qpc+GDZN
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7BHYk2700706
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 07:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=G7aKyVjdYavK2ZAELbW1cotg
	kHAtEELC6+iiVeRDFQ4=; b=D2I91NFMrsCgWpmcTIk+zto9ft+X0bo1UdjxwLH1
	86unbUWiUZ5NlhmZnvnO2pnnqWCwXjkU4pcsMw7ytJ6PoDmB5sUfY9b5WewhbZeV
	tJFU8Sa+fAVnp8gvjzUOcAR5g+fiOM7d+lDKMW4Af0LR28gVtthxVtjlLXw+1KeZ
	Qdl17zNAN8h0l7jqj/aSONnJ4k/j6lRwjqdfz0YF53AG8j21Yy9sYUalpwT3owCL
	/J24RdpPV2pgtPlPSeEGcRFWa5UVbQACVMYL1RL72zP6cAML0a19PP3+Mq/DRCi7
	7Q9ifxYYYtXqVDazBQjQe6RCzZPFT8HRDeKntrwpU5NkyQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhvjqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 07:44:18 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-38355b03cb8so6311848eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 23:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795679058; x=1796283858; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G7aKyVjdYavK2ZAELbW1cotgkHAtEELC6+iiVeRDFQ4=;
        b=Qpc+GDZNgG4nRVPTRMYQCDfZM3xgo0w9Z6KMAR5DlWA0unDniM/GuHb/CyhhljVfht
         0W/zWPmtJN15c/wi24UCmV1/uzz9VAIF/rOnNmsaZBoWBxHQaglSsWm01ieR53xh9P90
         47CRBdfb0dcerxCV5Mtc0IKTOTK9ecxVUCJTolUw6q036RqloBdf+3cj7lGmAEBYkIjt
         S4aVzTUHBJChXvDE9sLshZoi2XWhWg1xbz3zW6+rIlrnyLGeCrL+o+sUvJy5f8U89uwf
         0KXVCSgQsjirOFpTspa5ZtfsFRH8psZcPy5+PV3VMs8eWbZsyPfcMh9NuxTp+JAc73z/
         gRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795679058; x=1796283858;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G7aKyVjdYavK2ZAELbW1cotgkHAtEELC6+iiVeRDFQ4=;
        b=KzzL7UFxbLowRuD/tLr1leg3rVEmDfk5FWzdLp4WrJUEPlIaTOeS0IbrQb+AovBaTo
         2RUEKdD8CtLbZGSWOtKv4ipmZL497mOnQ/lh3JOUqazylaWulx7u79LUgus3p44jsv42
         lHyU75ckWsAij5CB7LNohn4vCmkls0wiC5XzkxOyhrsCzQDzRdPKkEltgkendDXHSRRx
         u6bKOJXJyFO1t/mAegKRUksY5vY6j2xS4JxcLf+NOzpUmb6EkmyOmYo2CzL6xkVC52iF
         JG3++zH9B89NEiWkCB5cyzZiE5HjmBTvZt7nczmqleXkzbN8dAwCOpWZWfddqHOf7qCi
         NFJA==
X-Forwarded-Encrypted: i=1; AL+hErGgre+2Jxq7o6TwpT4RQzkLOCmFDVvOffq2H3473UMwICUYJ4Q/wKIY+qdgI68N82wJfORTICPx6HUPzls3@vger.kernel.org
X-Gm-Message-State: APuU4Z9JMji75SSk1focI8shULQ5xX6IFwTjGaA0vzP0i3t8Q9a0zIds
	2mPlZJ1+bj5p8jHjn9e9bYReUZsYRP6DyyGkhBamwx0Di5UlSO5ovXa7NX8jaeP3uL/exO1aYG1
	b7WOu1M2ZkAPHJ/paBb9ioxlKHQWEI9tN3qWA9v0O35y1COPkSXvzUDt8nUgtvQvfmdn1
X-Gm-Gg: AZFdTZeq1kheHnJ5GtSjd0r/lrC8NIu2kVdndNmPjIg6Tqhu2oygE1VpW8J2vniL+KT
	AXRGWVwP/OY+aJZD9B3whmE+OM/Ig6YUut1XCrWz8wqpLLw421sX7dOvbwAxW411fQCy6xSbhij
	YnvPjFcZy/eAuRdIvZjun+DRE8BTR+VAcMpLw6J2PvetWfqFnThCFgdEsMAUcgQGsBlK9QGPYh7
	LCP0C9Lru/U74jtNVwpjqGMzLLE1IpdYPYmpOeQw+f5NZLhdBplxs9h2W7FnClPZgud3zCGq2IS
	TxfwxEMiKZ5bDdH9MznYEN6FMPQbeNlhfWJS/7vkTJ/ggNo/tb8wPeXs7vQxq6Rs9chjKHf9cOV
	nZB8iTiSQu93lSflVvmZ+FJbNXEPnmGog6dpX5k7piqcLH9jvGuwFPeQ3uafjzx2CUJqLEyuYxH
	Fqz3C8jNIODjgo8p+cbC4rJ+I=
X-Received: by 2002:a05:7300:cf87:b0:386:565b:4f9b with SMTP id 5a478bee46e88-386565b529dmr16390652eec.36.1795679057775;
        Wed, 25 Nov 2026 23:44:17 -0800 (PST)
X-Received: by 2002:a05:7300:cf87:b0:386:565b:4f9b with SMTP id 5a478bee46e88-386565b529dmr16390634eec.36.1795679057224;
        Wed, 25 Nov 2026 23:44:17 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm64100626eec.14.2026.11.25.23.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:44:16 -0800 (PST)
Date: Wed, 25 Nov 2026 23:44:15 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com
Subject: Re: [PATCH v5 02/11] usb: dwc3: qcom: Disarm wakeup IRQs on system
 suspend without wakeup
Message-ID: <awfjT6DQ0beqlLUn@hu-petche-lv.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
 <20261123104727.1539149-3-faisal.hassan@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123104727.1539149-3-faisal.hassan@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b07e352 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=BlGo1tluQEYad71Xd-AA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 68XN_37Zm2grJ3au-XHlN_UBL_J6CGr6
X-Proofpoint-ORIG-GUID: 68XN_37Zm2grJ3au-XHlN_UBL_J6CGr6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyOSBTYWx0ZWRfX1HbrqblRCNgW
 w2L/vQOUajh6eMZtgxQd9QRPqZTUOl/GtQuU0bzqJZJRzyhYCCpB7VmBv9H1IVC9ZlsgXkRmpuI
 6GFR4SVFrdcbwp2Z+VXCfFLXtGMEdXc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyOSBTYWx0ZWRfX3/aPPdMBb4mV
 oC6RMAvMNjpUUm9NjqnPhuX4JEmpcI2dBjsSfj/cdueRxzSamYrVKRIpbEXCZWRD7cuWoWRJH2a
 ++Tk9wIDW6qD0CgQToIDT0bWalHD60alFi9SzYZbvejjfVyrveGRhbE++NJGfuXO8cPgeJxNg4R
 KVGDZOwuQn8LCePxLZjueAko8IdY6M+a+f91grmwyjBROtloZbpsvJOFPtZiMQRche+IvAiBE1U
 mQs0yd6uAkwD9MTnIZigovQFw0eXcJ7i62SWhyZxuKYjfSpKiuxawOLgEJnlTHOYmw8Ja4IxSYT
 wkoIlJGCYsgKcBXsXDvDv9qcl3Xpdg5nfHnn/ElUw920iB0aNjF7FIgHEmOx1/1Ywisft96O7UF
 LrTUtCYvLsH3wf/w3H1KEyWnkpqjnKMUM6A7NHrMUuO+8SFpylFsxT28utNSGDeR58b8oG2dmEg
 W3lhaDixVXpDG0zJn8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260029

On 26-11-23 16:17:17, Faisal Hassan wrote:
> Runtime suspend always arms the wakeup interrupts in host mode, even if
> the device is not wakeup capable. If the controller is still runtime
> suspended when system suspend runs without wakeup enabled, the
> interrupts stay armed as wakeup sources, so they can still wake the
> system. System resume does not disarm them either, as it only does so
> when wakeup is enabled, so they remain armed after resume and the next
> runtime suspend arms them a second time.
> 
> Disarm them in system suspend when the controller is already runtime
> suspended and wakeup is not enabled, so the state matches what a system
> suspend without a preceding runtime suspend would have left.
> 
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>

Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>

Peter
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 7a7225b900b3..18db19cf2065 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -350,8 +350,16 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
>  	u32 val;
>  	int i, ret;
>  
> -	if (qcom->is_suspended)
> +	if (qcom->is_suspended) {
> +		/*
> +		 * Runtime suspend arms the wakeup interrupts in host mode
> +		 * regardless of the device wakeup setting. If system suspend
> +		 * runs without wakeup, disarm them here, as resume will not.
> +		 */
> +		if (dwc3_qcom_is_host(qcom) && !wakeup)
> +			dwc3_qcom_disable_interrupts(qcom);
>  		return 0;
> +	}
>  
>  	for (i = 0; i < qcom->num_ports; i++) {
>  		val = readl(qcom->qscratch_base + pwr_evnt_irq_stat_reg[i]);
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen
