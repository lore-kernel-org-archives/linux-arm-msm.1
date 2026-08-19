Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735D2439328
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 09:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787132892; cv=none; b=DvncZ6IvWaeHNSDSo2oZwbGBUF7pUTFXPU0WFJOSsy2wNhdfdv2005BBuXDxUlXxxhkBUZGZzoRAqm2FlCetKL9dDOE7tf3F0qHWcZLvT7P9D2+kWdxF+xRECpJmTw7dLHpjsIWWpiGzgmrqUlURc2g9Vy14VjT2T952t56+PDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787132892; c=relaxed/simple;
	bh=hzjsG/UFK3xGq69qyQJ+CCQJo/ZUjvghHqH0/kNQHmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WD0Fhgk5b6M6DP1oV0QZoejDzSvoay3zcoklVtEOzxpFDOIStHEaJXKIfvmb2C6ATTRcjcCSGNFlxXL6m4Zh8ahUxbhvpG2FIur3COSkgbz66XIoSx4QLARgeMVvgwWd1eFzUv4qtKr7OiNTZ2DuPJvYSuQ/xDthsx+fWnCJ8hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OajG3Jtt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PCPXh6A0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OajG3Jtt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PCPXh6A0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J6Z3lK2728335
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 09:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z/1be8aM5TXGlubA/GJqZ/wk5hI8mCiMFIwpW4onUJ8=; b=OajG3JttXLjOZF+r
	Uqq3yyeACNN9GqZvOBefwGv3FfvcmObgobj/cdR2IDsa5YEU1V9RYPIQIfRvLK7n
	VJub765fttSMXfnjVqPedL4k+ugSFnULiggghUp8SNJFEnUys3zhm6b2Mv1RFeeI
	bgPZK8A9u+G7yVf9uM4VaoRMbIv2E2Nl+lRd38dJQkiL16c6Um5R4lZAyFpMuWca
	MrsJgYQRbGf6FeQ1m4sP/Ga+UQ4c41J4ClXAFd3PIN55IlIPT7MaOAfFHRAEQ0Qm
	iEdfRM0/tZQIDMuiAaMi3QC06npsG4blwXZeHz/H2qbcHRutQOHLYVJEhcDIPW34
	NvY4jg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfm2ge3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 09:48:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so1112440a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 02:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787132889; x=1787737689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z/1be8aM5TXGlubA/GJqZ/wk5hI8mCiMFIwpW4onUJ8=;
        b=PCPXh6A04c52HB9RrvJxNoUHRDRA+TPY9A052i3SrYVh5iQnu/VdwQhtzLYLIVJq4k
         xqTJsS+BgqmIiTaSLUJGcbQktl3sfu2K4hy+gs4ObygP34U2qeHUrb7i71K12QraAhJG
         Now0HTghQOCCVbh17BPjhNUKp0tc0AVORA5tghJ3zdcD4ql0bFslAJ9vmYfDEqxZblM/
         eppM6gpRyDAab8nbYLHTF7S8XpSDTNmt4GGpGYbglZ/sSpoaWEmZe+h9AUcW3bDO0lQH
         vPJvYqQ+gIAsz/lCTj7v/9V14eFMSZKDNBWdNogjtleyRJPrEPdmSOxOWIO1EnnXLsei
         ULBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787132889; x=1787737689;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z/1be8aM5TXGlubA/GJqZ/wk5hI8mCiMFIwpW4onUJ8=;
        b=OLknHUCosSDsQhkGiMOqOvaFyBTRHC7WLjG1N+MwN3KWCaUTv6U7rfv30OQXVrNeMp
         hxnTjQ243v+QpUiYoXFUB797vbvxKBMfE/btlvLEKb5odRigCyWTVhmW8jkpdyF1I4Rn
         gSyNQ8UKeaktqgxmysEFTytCrXc1Rc+RljbbjG5yiJzRwm48J3tITI8K/FbuurzTGsqX
         xYM/eg3cA7YYu8HTUfSQqnzfvQBLD3bhUz8o8cBLlS0N58qrZE23FQH6Cq3LsguKQQLd
         wiR9Zo3S/bBX2mylmXKmldFb3iJsiXSDkSIxf/URvgeUb0mP18Kv0UYl+dNktmzy4SbO
         v4wA==
X-Forwarded-Encrypted: i=1; AHgh+RpM7YVuiWhRJPgLsX2k4c1R4Tn4hc3wViyegRV0R5mtHJzWGgJVtku63xlwczxzxAvBXk2+kcaomwzPiIWg@vger.kernel.org
X-Gm-Message-State: AFuF++kmfHlmoPyR2j0C43GiLXsqIsmjBWrCwT0FRqG/EB0TiiNCHcbG
	pylyyQOC1jiM5wV0aiTL1094MHOKVJy3uQ8JuiciiHJT/k/2z4W3SPWnPRABZBhZj9PkLD8bhlQ
	uAplnX3SbLRxhq107EMLWvCpaaAsTO3MHaBlYosknEIKINfrQSWL+0/3K6P8dUhwsBWBy
X-Gm-Gg: AR+sD13jwTSZKVem/+7EkUna28W2dDjQJD13ET3bJd+PoZAsxqWVJx7H77HNJ52fefS
	OTxNxEiVerGPf3Sjwvts2K5VaHN6sVSvhOCj903FgGkyDzdcU8Ymg/theqn6laj2WD2tGuR5fhl
	dzJyHipFTFmOgrTKWP5Uw07Sq59THpknRaTa71VkiKDU50ArBQQLofN3d5QQf1eXgZToJ7PtaYQ
	PJO9cvFEeu/j/DCHyGf2XorSezn+XcTZAq5GZ1nm/cPbqZ+Hr/dv1eL5zcfcCk0VNkkp4xl4I5P
	sQgK7+4s/jDPjFcIU4+eW8bVLG+GVNn4Ah2BSJeihLxBtrQGSWZatnT1lxBd3Vtc8vQMO2IswN0
	oSnegcJ9qHHayaMD4aiTRNF12IVBTfA==
X-Received: by 2002:a17:90a:d60d:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-3958146f387mr6302034a91.13.1787132888796;
        Wed, 19 Aug 2026 02:48:08 -0700 (PDT)
X-Received: by 2002:a17:90a:d60d:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-3958146f387mr6301962a91.13.1787132888341;
        Wed, 19 Aug 2026 02:48:08 -0700 (PDT)
Received: from [10.217.216.255] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb304easm2033003a91.14.2026.08.19.02.48.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 02:48:07 -0700 (PDT)
Message-ID: <3dad5ae0-d5ff-4de5-9d02-2ccfd2a10127@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:18:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] bus: mhi: host: clients: Add loopback driver with
 sysfs interface
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
References: <20260817-loopback_mhi-v5-0-50efc7360b7f@oss.qualcomm.com>
 <20260817-loopback_mhi-v5-1-50efc7360b7f@oss.qualcomm.com>
 <aoQbo-k7QA5YpUNm@monoceros>
Content-Language: en-US
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
In-Reply-To: <aoQbo-k7QA5YpUNm@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9O_QPsFkv7wuPMlTSW4ajR_rkRuBLEy1
X-Authority-Analysis: v=2.4 cv=bth8wkai c=1 sm=1 tr=0 ts=6a857bd9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=UIBoQwfrnP7GMt42N9QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 9O_QPsFkv7wuPMlTSW4ajR_rkRuBLEy1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA3NCBTYWx0ZWRfX0aC/6BR9pFKE
 DBpQpjxj5szxgyjnVJYOyWz6DQx9dWh6Rdne5ELpqLB0mzMgnDahX9T16VZYcrCpD5tMpD/BOyn
 S9hK/lW4KcMrMO14VzIZ2bGgEsQthovOE/ZNFzUp3XDe+g/lArKm72D4nhZjiA/lHYElR/Tpk2+
 glgB0erFhK1dsiiP9991pMWH0Xp2yfCAMYkB90HfYjeadzbaSjX6zbVkg8EibYPW8oiyUs/Ooxi
 sYkJqptTP2XBKa9rFeHvCZElJ1YgA1UfhyKSU/i6ybEhhQM5ttCGiZR9ivqCY278PD7nhZKs46M
 PrlCc2c3votg2PRfYGkoDGoUtNpOg1xqb5jVe92ViU//qzzQkFakmjCySs2KdsZG3KwIJcVlF8E
 FY4/JsGWSct2pDfCRvHG7MEcHLM2oDOmb4fzBeigrpmPKk/uKLTxlcsudfdocj8/JWDsp2u7lc7
 f7yEc/6IXgz9AwuWaYA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA3NCBTYWx0ZWRfX++4TuSuP8Ou1
 7Do8LjAqaOERDPm9hw91FN2xAx4nfwahx//jRZ4QY93EVg/jnAiWdTNZpmX3R4Zmlh0iOdaon/w
 bJIUpYszocXI9WJSN5yZS0FLAbAGjm8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190074



On 8/18/2026 2:20 PM, Uwe Kleine-König wrote:
> Hello,
>
> On Mon, Aug 17, 2026 at 03:44:34PM +0530, Sumit Kumar wrote:
>> +#include <linux/mhi.h>
>> +#include <linux/mod_devicetable.h>
> Please rely on <linux/mhi.h> to provide mhi_device_id and drop the
> inclusion for <linux/mod_devicetable.h>. The latter header is ugly and
> should go away soon.
thanks, Will rebase and fix it
>
>> [...]
>> +static struct attribute *mhi_loopback_attrs[] = {
>> +	&dev_attr_tre_size.attr,
>> +	&dev_attr_max_tre_size.attr,
>> +	&dev_attr_num_tre.attr,
>> +	&dev_attr_start.attr,
>> +	NULL,
> Please no , after sentinel entries.
Acknowledged, will remove it.
>
>> +};
>> +
>> +static const struct attribute_group mhi_loopback_group = {
>> +	.attrs = mhi_loopback_attrs,
>> +};
>> +
>> +static int mhi_loopback_probe(struct mhi_device *mhi_dev,
>> +			      const struct mhi_device_id *id)
>> +{
>> +	struct mhi_loopback *loopback;
>> +	int ret;
>> +
>> +	loopback = devm_kzalloc(&mhi_dev->dev, sizeof(*loopback), GFP_KERNEL);
>> +	if (!loopback)
>> +		return -ENOMEM;
>> +
>> +	loopback->mdev = mhi_dev;
>> +	loopback->tre_size = MHI_LOOPBACK_DEFAULT_TRE_SIZE;
>> +	loopback->num_tre = MHI_LOOPBACK_DEFAULT_NUM_TRE;
>> +
>> +	mutex_init(&loopback->lb_mutex);
>> +	init_completion(&loopback->comp);
>> +
>> +	dev_set_drvdata(&mhi_dev->dev, loopback);
>> +
>> +	ret = mhi_prepare_for_transfer(mhi_dev);
>> +	if (ret) {
>> +		dev_err(&mhi_dev->dev, "Failed to prepare for transfers: %d\n", ret);
> dev_err_probe() please.
Sure.
>
>> +		return ret;
>> +	}
>> +
>> +	ret = sysfs_create_group(&mhi_dev->dev.kobj, &mhi_loopback_group);
>> +	if (ret) {
>> +		dev_err(&mhi_dev->dev, "Failed to create sysfs attributes: %d\n", ret);
>> +		mhi_unprepare_from_transfer(mhi_dev);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void mhi_loopback_remove(struct mhi_device *mhi_dev)
>> +{
>> +	/* Blocks until any in-progress store() has returned */
>> +	sysfs_remove_group(&mhi_dev->dev.kobj, &mhi_loopback_group);
>> +	mhi_unprepare_from_transfer(mhi_dev);
>> +}
>> +
>> +static const struct mhi_device_id mhi_loopback_id_table[] = {
>> +	{ .chan = "LOOPBACK"},
>> +	{}
> { } (i.e. a space between the curly braces) is the more common way to
> write that. Please also add a space before the closing } in the line
> above.
Will fix this too.
>
>> +};
>> +MODULE_DEVICE_TABLE(mhi, mhi_loopback_id_table);
> Best regards
> Uwe

