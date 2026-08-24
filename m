Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDBD3EC82E
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787555488; cv=none; b=JR2pH59P5fqmST6BGRYqBGQTg1JmL5IDvALK+4wdWGZ4RxZPs6srHDruaCkgGL0TYkEay5BGB389ndc1RcjNahzx8btGaJRdW1SUhQm1fqr7fykmFUV/Ewhu2G+fzMwLFLwO+XpKkB5Shk+1ZtDNvb7AmXeqad6nO+Z/Bot2Fqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787555488; c=relaxed/simple;
	bh=FrdPFkyHggmSRx+RzuZb5WT8yJ1zubNcZiIbwDqt6mg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TAZa4RwGJ/s23UccpkU/xz/2k75BxLKRn1dd3ENWhV5QXAHg0auNM2hRUanQHtWVt3XF+nmiXraKXJA7/V4cpEsl0GWZi2WKN9QK9Kmwif9Kxo5aZ4GZ/1y1KIIF1Av3tJ1c9qMhCcM9Ril0RmTlm/d7QusYdCITpRztH9Emo7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oIl0hdXR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X9zRBGnx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oIl0hdXR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X9zRBGnx"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5R9he1937604
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ds5lI+oACc5DuEDOT144k75RF4KIpDN8t6w5EHUqSmU=; b=oIl0hdXRkdkFIAQ3
	tPaV6B4H45/ZoRwErpK7NiDGYPpcZWMO4++UOPa3RMAMCdCtGdAFh7Iob8nVeeeX
	q3bQ0As6z0h+DuH0mu8JvVLLqH2xOLIoepKrat6vFESRokV7GWF3QlzbPhwXVMPW
	R2oVnzOWuxXrNP6ggIv/dGMb70Yrn4Qrp91TRQlxTPY/AaHMsIq6GWE5EsguFM0k
	EKATdl7LPEeI0AUIu3U5viR3IIvVBbxS+vc56AUZRmGUYGi46VNMce86/rxcCAMr
	XhUSLPnp//cd6e13bbmzsAv4cyyJepdj+HAD2gk1zWKFtEt5LxXXFbKiU77gcv9u
	spAu/A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g741qww6s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:11:22 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84c4cd31b51so5000664b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 00:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787555482; x=1788160282; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ds5lI+oACc5DuEDOT144k75RF4KIpDN8t6w5EHUqSmU=;
        b=X9zRBGnx2pYbsDUCW5PAVgGlagxq94yi3CXXbPXyM/dCXth7LtzTzXq4LOp/TTLTfH
         sSVdx6ObRASboQ+FZTxwK7ikrF2MgBwPHavuSUTqarFHYXMQk+hmWGA8Rvd647n/T7zz
         5UDyTK+HMiBYYUcwJAW7tcvhb7ThlOWuPVrGFiX9tjGGtpanM46owKrlRtNSsHzsAG6a
         rBxaqwewQbPlCrfUdBDOUYWsEPOje7KPIaecIv5Ikyx0IhYeyGvfoBt8ayXgmVD5eTC0
         nE5KGs5+e569ceDqmP3gTaTRNPmCaV6A7qoIvelIfnhBo2kZDAfIhz1tiURb5ydqk6ry
         KdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787555482; x=1788160282;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ds5lI+oACc5DuEDOT144k75RF4KIpDN8t6w5EHUqSmU=;
        b=EgJRPAKNFHDL9wEkSD61NGhP3HNqbdwHiV88L518q5P3R0gwy8Fqbv3jweUSVqa35v
         CmNJH/f/YMrI2rPdTWyPGIfDxPx516b9G+4xy7No6TPjOrsJBWmIfyn2ZAU3tcL0Hm1h
         WI9/r/gVKl70RlUzmnizGDwabd8Ww8mzMrpTdpBXPxfwqFLIL+jTPdCvRfAu+900BnEx
         g49FgdOeMG/zJ6+/bxyvStB/94vaEGnAI8sz5z8l3UrNEM2Yd5GpkihgCmP6tLlsD0CJ
         pamAHyieK8W9zHNHpv1f35rCzTutQHme00yTrOFHDFspg28+qmg1LNJEa5boZustb4qt
         bavg==
X-Forwarded-Encrypted: i=1; AHgh+RpOqhlVkrkKaiWWEzb12Guo2GR5hlrjD4sI3VMsEjicfZ4BFk1GG7oiy4fdWqqkYcgC7Xjuhgz/k5+ysyzB@vger.kernel.org
X-Gm-Message-State: AFuF++n/SBMskJeDVhQPLoSCNHgWIq2OWvdfErdkFTcMSfOdFU9AJVUs
	Ve9bszVYrUJRD6ahIv3lGN72o8Zene4VviFrb5x1E+v9kxjskqHoqwW0gbzEEFmhkONj7IfHHrN
	EpkAHNdHwq1hR14VImXrim/yTMHjOuQ11mCNXz4C9TKHy64jtDh8j+Rval43BuT14gCxP
X-Gm-Gg: AR+sD113OG4cUApuahUO/tOXVdy/bbdl4eVV6g+o2SpoNejHIumE2IgUo8xUsFP7lwX
	Eud/e+rE7KbrA+zIuyqx+yoVJePRHIjY9tdblkoEYEsYmIspUApvn6CCDuOUZ24ElBjInzdUgM3
	zYHOfkvj3kQ8LJnyxoI7h+BPSCERV2HumP63vMAtiKxdUeehewnKbEOXek2CFzsOxF5wUyuMNR/
	PQjxmhKfIL118iCOU46ngOIRZctSx3nvSMDs4kY3CDcb1poKsAzMEJvY2i58sal2z1fkJPd/Ypy
	6Viv2CXjYK83I3YTowZFwonHzKQSj1MMpN0mEoBhfI9AUP349K30wVeT6wUA9Qzroq+vd4N/BCO
	4CVR28yUunmolfOeRmhCOf9KjbI48cnY0n2A=
X-Received: by 2002:a05:6a00:2443:b0:84e:354:422b with SMTP id d2e1a72fcca58-851f9fa4beamr20152381b3a.2.1787555481785;
        Mon, 24 Aug 2026 00:11:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:2443:b0:84e:354:422b with SMTP id d2e1a72fcca58-851f9fa4beamr20152323b3a.2.1787555481299;
        Mon, 24 Aug 2026 00:11:21 -0700 (PDT)
Received: from [10.217.218.158] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520f03b065sm1605045b3a.32.2026.08.24.00.11.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 00:11:20 -0700 (PDT)
Message-ID: <7222e72f-e618-4a78-8b48-1e712b9beba5@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 12:41:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] i2c: qcom-geni: Add dynamic transfer timeout based
 on transfer length and frequency
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260813-master-v7-0-3f9010cf9229@oss.qualcomm.com>
 <20260813-master-v7-2-3f9010cf9229@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260813-master-v7-2-3f9010cf9229@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2MiBTYWx0ZWRfX+BLFleswxD8T
 I1qGWNLhmh79bdjcABQisps5cQXmw5IM2iJ6EoRZH+EouMg3Hn9cQhHi9y6c/Ggts0pyQKd+zB8
 rm+OpJCpgGdmzfpN+hxWRmCsYKTUiNIHOLN0gRx3Ixh/PYkI1G11oOqhVq5mRX7TfnW7zQp5O6r
 IZZRbAvnEXFzHzs8zEKrOHU+0CrW/h0EH/VpXxRdle42scWozlnytSlp+EXKC+sFWJdNsONIxEO
 ds9Lpmi9YYJxSq75djjthjIcElwepdWl/vGIN/MJY+QvZUY4HALozb84kQDkTtAaWylJjUQMJwG
 S3Yc8jPybS7acQ4OrEba9pFNRyYggUW3NfjFF447v3BuD5XotGB0sP7e1H7YZyrJHy+Dbs3394L
 NLna0adHpzAOrPn+4t58I+sQoVtpJbSPM3CdntX5Y3sFG0KzM/c246/s3/qmqM0IQBv+DudjcnO
 3CK0i9LlfnKrvRX0dww==
X-Authority-Analysis: v=2.4 cv=GvNyPE1C c=1 sm=1 tr=0 ts=6a8bee9a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=XKFieZ_GiUe8G3MB0dMA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: ABOqjwQItW0hEyj60egkGd1ste3LLFVV
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2MiBTYWx0ZWRfXxjBf98iLNQkq
 dWJdR0rzdOpF6S4waxtOpE17fr/4J5N1YzUfQ24mUTfaJlMN00CD3fxRpmBekwWt3wFvB6PlmBD
 0U7aMS1TbihKeh41ZMlLOxFv3yXJwDQ=
X-Proofpoint-GUID: ABOqjwQItW0hEyj60egkGd1ste3LLFVV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240062



On 8/13/2026 11:15 AM, Aniket Randive wrote:

[...]

>   static int geni_i2c_gpi_multi_xfer_timeout_handler(struct device *dev,
>   						   struct geni_i2c_gpi_multi_desc_xfer *multi_xfer,
> -						   u32 transfer_timeout_msecs,
> +						   unsigned long timeout_jiffies,
>   						   struct completion *transfer_comp)
>   {
>   	int i;
> -	u32 time_left;
> +	unsigned long time_left;
>   
>   	for (i = 0; i < multi_xfer->msg_idx_cnt - 1; i++) {
>   		reinit_completion(transfer_comp);
>   
>   		if (multi_xfer->msg_idx_cnt != multi_xfer->irq_cnt) {
>   			time_left = wait_for_completion_timeout(transfer_comp,
> -								transfer_timeout_msecs);
> +								timeout_jiffies);
>   			if (!time_left) {
>   				dev_err(dev, "%s: Transfer timeout\n", __func__);
>   				return -ETIMEDOUT;
> @@ -778,8 +787,22 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
>   		dma_async_issue_pending(gi2c->tx_c);
>   
>   		if ((msg_idx == (gi2c->num_msgs - 1)) || flags & DMA_PREP_INTERRUPT) {
> +			size_t max_len = 0;
> +			int j;
> +
> +			/*
> +			 * Use the longest message as the timeout base: one completion
> +			 * covers the whole BEI batch, so the budget must fit the worst
> +			 * case single-message wire time.
> +			 */

Using only the longest message length may under-estimate the required 
Timeout.

> +			for (j = 0; j < gi2c->num_msgs; j++)
> +				max_len = max_t(size_t, max_len, msgs[j].len);
can we use sum(msgs[i].len) instead of max() ?> +		 
i2c_update_timeout(&gi2c->adap, gi2c->clk_freq_out, max_len,
> +					   I2C_TIMEOUT_SAFETY_COEFFICIENT,
> +					   I2C_TIMEOUT_MIN_USEC);
>   			ret = geni_i2c_gpi_multi_xfer_timeout_handler(gi2c->se.dev, gi2c_gpi_xfer,
> -								      XFER_TIMEOUT, &gi2c->done);
> +								      gi2c->adap.timeout,
> +								      &gi2c->done);
>   			if (ret) {
>   				dev_err(gi2c->se.dev,
>   					"I2C multi write msg transfer timeout: %d\n",
> @@ -899,7 +922,10 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>   
>   		if (!gi2c->is_tx_multi_desc_xfer) {
>   			dma_async_issue_pending(gi2c->tx_c);
> -			time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
> +			i2c_update_timeout(&gi2c->adap, gi2c->clk_freq_out, msgs[i].len,
> +					   I2C_TIMEOUT_SAFETY_COEFFICIENT,
> +					   I2C_TIMEOUT_MIN_USEC);
> +			time_left = wait_for_completion_timeout(&gi2c->done, gi2c->adap.timeout);
>   			if (!time_left) {
>   				dev_err(gi2c->se.dev, "%s:I2C timeout\n", __func__);
>   				gi2c->err = -ETIMEDOUT;
> 

