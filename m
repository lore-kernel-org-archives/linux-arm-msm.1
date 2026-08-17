Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23F53B2FFC
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 11:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786966347; cv=none; b=DEYqVQLaornKI/g4+x9XY8/MzXSueQ8ar83pnnYEz9rTH0BQ61FAMXuA5W0Dkh7wqBVzl7EsApGm47rJWF9ryJHZ44MBlUmRfPrv5Kn+LN1TXYl/GvhtiaWmbG05zgyl9uDYoLKin34y+xhq5sZeSEWQwSbBMjXWYZplccvOEvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786966347; c=relaxed/simple;
	bh=bVPz9xwPnm8MyNGvI1t4NszlI8/kOx9b3DAwpRJ3euo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uMCortANsH0s7idkJsJRRCmsg/z+R0xNtkj8G++o+jaWvJNluoq08hNeEqDJWB+35TVKF+L6tvL1zY3J1UZf9WeP2f7bNUhE/XjkWwGmTQx5+YQGV8OBVdxAO7r0Sts4udheNcxXPsuhpxEqE++zCphi9NqgtO3I3EF+Kmxh4vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cfEuuVte; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U5DVNUpN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cfEuuVte";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U5DVNUpN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H9dd6j2470445
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 11:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UlQ3xcP5ufHpNW2/5jSWCV84GTwT/h9uzPyRS0XLkU4=; b=cfEuuVteD7DUiUkj
	p8bWG0puiWIxYMEqIgNs1ERUdO90efP1ig8Zw5KrFA/ra9NojyX7r7B8f0uOoOQC
	VBsmdfqSxRDYj+H4f4Cs5c/Zohr/DMr5eUwHfm0X7Epq/x6T5XCwo6uzE5Kpt+oR
	ub4gTxFRFkJqyfxvpAKNE/NtWvQJk3kZbaCKrI6CxnFb8Z/NIx0Mq3Hg8xFI9bf9
	wK/PnevH6nooXCWCoWRLyc0lgi+rtLrSDAj9svj8CXfoapg86gBU3Bervhzy45QB
	9viKHX4uZcuvWTgTM4M4faKHtlkpIDvfGJ1sDUi2N8OldmvUUPbPp3FyH+R1Chrz
	pRVFjw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wm7ryun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 11:32:24 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ebb599e528so8122556d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 04:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786966344; x=1787571144; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UlQ3xcP5ufHpNW2/5jSWCV84GTwT/h9uzPyRS0XLkU4=;
        b=U5DVNUpNq83ZGIBB6oWPVQIg0DkplmROaCsRAxp6OdXUYpQqtZ9Nv8qetTb/so/5rx
         HbNvKf/ZdfQheP1xKHJD66uZtn/6BFZOSmPcrMWNFx7aNXH8uUKtnt1/FQsDPUk4ouRa
         a5EobNX2EYaSDkXz4plwmW5KjOFBDpiLkB8/SToUCVeamIl/86hI5eYGh1aXgHCiod5z
         B/Ogo1bKNnxTf5TaAzYdMEFwqjUAEzeCuFMi8v9yREFJzpQbL9iAsex6/dC7AT81MjL3
         f3K/x9SqQ0TdUkcLwJT4/FAqU5PC2D/Tqif1Df2qPvWWccL8+dDx+NIBg0YWYARpCGVD
         ivHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786966344; x=1787571144;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UlQ3xcP5ufHpNW2/5jSWCV84GTwT/h9uzPyRS0XLkU4=;
        b=f5BMEgGFSbT+M8Hg/zMRfn4KpZMfvOlKg+Ymzl4HLH9JF+Rif2PlVzwmYUlq0osgZu
         M04EU2Rmh/7nL6o7qipAtqDfvi2HTCu3HZ/+0SyFDrCAH5G9mz31Mdp1gxW+C9qDhF6K
         9aJz5K+8eImGqsf4C/w3dW9/Wm8f4K6JKQh/QOVXppa7RyUOwm3kdYlyIXNlKGeMGaRY
         5WDLB4nPAMl0nP0uYQ1zDxvgMVbH48SWXC9Iz7U8hDmHW8P76D+paB3SA3pU4zSRdFC5
         HZfeFt2HAcvnGRqzRN3y932gVvs5d46o55XJbL7BBAHfs6F2zxRE7KK4PQfDgMYysK05
         8MnQ==
X-Gm-Message-State: AOJu0YxT+krLkWrj8lSu0EeaVUaC9Ah+HSgfpLSFn0Y/lnM4dJ53ZUK9
	6kSm2kv28lQyDX3PVZ0nvmhEGy8dOJuhc5X6QhRwFWqKfg9GCYwzpxXRVCquXGhrXFWQhX1UHO/
	kcVTGNGqReyKuOcHdKwgbob5gHxD1YZivMOo5BBwoO2sS+se6guv/3EXwWXLmwMqzQ8u1
X-Gm-Gg: AR+sD12EUSprGQB6VeuBvPM7FJ2qnu4svOBEL0nObUyUGltI/W2XaMBdguT6I4QsdVh
	1IlNhXMTqHmKJd+Od492EAGOYZXUtj1BX4MzjZ7mDMudzzGD90NRM4guPGZJJaNYktYxkunIs+5
	gBXO/JvI9tudPyqW2NbPbQXbKkp5ptcKjRW1nttaiGGsCs4fkrF8yoTuEpfbGZLpXY56zn4zgn3
	I6iXe+WYQWF2DKsTYqKEbC87IZZQD7Mz+5M487IXFLg85j2nqi1AjrBFVgSuQOTHeHtrCmavV5m
	xM1PMmGuLlWe3lLTHbvH4A53FDXhXEAzpMgXBIzU6/yzsmMDarl7vbB3Y3LO807/gbW3uf9uhiV
	JVZu7KwtETDkNjvhW9A+YDpMF
X-Received: by 2002:a05:620a:6008:b0:92e:6071:7cc4 with SMTP id af79cd13be357-936d23a402amr1696930685a.4.1786966343882;
        Mon, 17 Aug 2026 04:32:23 -0700 (PDT)
X-Received: by 2002:a05:620a:6008:b0:92e:6071:7cc4 with SMTP id af79cd13be357-936d23a402amr1696927585a.4.1786966343412;
        Mon, 17 Aug 2026 04:32:23 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185bc66bdsm9381166b.58.2026.08.17.04.32.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 04:32:22 -0700 (PDT)
Message-ID: <7c902ab1-3b54-4718-aea4-fee9fa92c8be@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 13:32:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mailbox: qcom-cpucp: handle NULL data in send_data
 callback
To: Jia Yang <jia.yang@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, jie.gan@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rt-devel@lists.linux.dev
References: <20260806-mailbox-qcom-cpucp-preempt-rt-fix-v1-0-d302a63dfb5e@oss.qualcomm.com>
 <20260806-mailbox-qcom-cpucp-preempt-rt-fix-v1-2-d302a63dfb5e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260806-mailbox-qcom-cpucp-preempt-rt-fix-v1-2-d302a63dfb5e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gY1-FLBgKn8O_Ttga-eO7PmG2c7r2bRa
X-Proofpoint-ORIG-GUID: gY1-FLBgKn8O_Ttga-eO7PmG2c7r2bRa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA4NyBTYWx0ZWRfX7kuE5E9JcqgF
 8j9kaMXxuumb4Uv8SvuRweBxwUWxMjZ8Sg5aIk4+4EFkn144D76TV0yLES52EHwgJxoHkTxMu9k
 p5oUEbDU5Eb4fAP818gqOetquDLuhepnTq61/AdSCi8bjNZnJWS24mRLeXIhNmtE1ItVAIBM91K
 WzHT3VSjAKdic+83H49hp/wNS31WZQJtbc0FBt2VF1bmCWeosr314w62iWPkn/eYjswB9VcPjIV
 f7CjVnKR/6vH0w8eoTQJdaenfcTKvqidTvfRX/AwOHtHL41s3b4lWThcG1VcgAb7QpGfMTs7hCj
 nM6tdnQbU9YBKNOfDNIqmVuQDMlKnwNhkxf9neNJR5JJfwJzjh554BfH8HDDPhUlOE2XoHwATKu
 olCe8HQI7hw6V+vn4cc/4Ak+CljQCZxC0bx/ggpqeDILK+EB3DtBfNOrepddo4rrIcDGCd7AR7L
 8E/X71nWain88ERtjMw==
X-Authority-Analysis: v=2.4 cv=YqM/gYYX c=1 sm=1 tr=0 ts=6a82f149 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=FIVuYjU95cRvfn1gDQ0A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA4NyBTYWx0ZWRfX6XL+6cy/LzrI
 MTDQreFWgV3ZiodrGPM8Q7KzYaD92hy/4jWOaK3OJ3dFfPJ0ev/lTZLvQp9XILelGTuy7goM/Xl
 ilaOWm8rKfygXZpee7SU+5c1Gg3Cbrw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170087

On 8/6/26 9:03 AM, Jia Yang wrote:
> mailbox_clear_channel() calls mbox_send_message() with NULL data to
> notify the remote side that the RX channel has been cleared.
> qcom_cpucp_mbox_send_data() blindly dereferenced the data pointer,
> causing a NULL pointer dereference kernel panic when invoked from
> this path under PREEMPT_RT.
> 
> Add an explicit NULL check and return early without writing to the
> TX register, which is the correct behaviour for a channel-clear
> notification.
> 
> Fixes: 0e2a9a03106c ("mailbox: Add support for QTI CPUCP mailbox controller")
> Signed-off-by: Jia Yang <jia.yang@oss.qualcomm.com>
> ---
>  drivers/mailbox/qcom-cpucp-mbox.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/mailbox/qcom-cpucp-mbox.c b/drivers/mailbox/qcom-cpucp-mbox.c
> index 0f7fe189e8b1..298b357c0f9a 100644
> --- a/drivers/mailbox/qcom-cpucp-mbox.c
> +++ b/drivers/mailbox/qcom-cpucp-mbox.c
> @@ -117,6 +117,14 @@ static int qcom_cpucp_mbox_send_data(struct mbox_chan *chan, void *data)
>  	unsigned long chan_id = channel_number(chan);
>  	u32 *val = data;
>  
> +	/*
> +	 * mailbox_clear_channel() calls mbox_send_message() with NULL data to
> +	 * signal the remote side that the channel has been cleared.  Nothing
> +	 * needs to be written to the TX register in that case, so just return.
> +	 */
> +	if (!val)
> +		return 0;

Is this a bug in the scmi driver itself? Is a message with val=0 valid
as far as our mailbox is concerned?

Konrad
