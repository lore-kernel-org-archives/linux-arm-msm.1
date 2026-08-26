Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571D93EC6B9
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787741402; cv=none; b=mKmIWJr3nHPB6EdQqSFQv2J1rbAvggcyYvjHHDKAgUsGy0q0MVMKQW09DnU3hLdUp1gu1Lmc8jJ9iO5RZvSNRvc0F21zbAd2fVesHbXT+YSnd0SUxZUJIvRkYGg2dqX67+GCJ4Xl0ZIttYNasJ+9EHRDe1FcSALvN4vHhp8GsF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787741402; c=relaxed/simple;
	bh=nZkidUX7PKFxWF21ow8FBNHtL1dqbqLe7NvSwvJ9yDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DjGhiquQ2VGulCYHCXUDg/Aymln3eT597FKafYRaGJr7nGl7ms3YgIS9k03U97GtdmvTB8b6JQsY9Bg8gx3kD+BuUgVBb8beaZ4OxaU8Bkef4sUlgvNDJ8zwA73Yrl6In4GRC3E8wvNw2LnHTHnIfbnBdBSCuVfugSG2k4WuXyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OLNu6Er2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S9Hqo80O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OLNu6Er2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S9Hqo80O"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGpiA107560
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vx6C7ipB5WA39lhIIfpl0O9RzJDFwU/g+feUIT3tbfU=; b=OLNu6Er2CRbax7m6
	IGapxI77FUfv6LciGe92fw8Z5Aq9Gf5CheLTJfk87tcmL2puL2yci7viSzDs4QKg
	e0E6fhLUoL+JCwrmRLCZtn7tsy8G0XmrK1B3dwjNwHjoiURb3hfE6UBQBN0wlajD
	8sWfamyv4rHPIIJgsW0m8rEKFj4QffjOlZFLcqp88nbDDUUqhTH/K8LySTtD5tzp
	c06UE21BN+tc3DmRi+JlegrQfcQkIHE3yANOIagkxzYAplxmPMlDSi2YMZYWYsHt
	H5HkDBDp7e2dFkjr20RtGjzn4VfFX4TuWp7kjVpvVcsbclvPUkLwdtMUeYAlX1sp
	cs0uww==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9s9g9efd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:49:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dde0df80bso1139111a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 03:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787741377; x=1788346177; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vx6C7ipB5WA39lhIIfpl0O9RzJDFwU/g+feUIT3tbfU=;
        b=S9Hqo80OFUG2DFmA8B2GqvQDRG7K/yuXqjbbDVa+WYWCO91Knb3ssuyk2v5aL/O0Y1
         8yLrD1GjzTZNSyfjrPsUShMlVyupDFVj/N83dWCXYTklaNMkLXgOYO/6WAjw0vYN6yNZ
         Wpt6qalfgk1oTfCmy22qXMSWPCLNkJ5m0UPLMzLxQH+lCeksECWWe7lxA4f2nw/XLJBU
         5M6mcGnQ0HZ9YrN86UwZfAkNBagAaDvd/D/iypbgxHuzKHTykTeSWyC3qjjRgVTyAse2
         dWqiumZIaCKnCTwQ9HdCogsVv0zSGfuZEr/6WaFuRT3TVUTEkls7BBXWsIP8+WX9Vj2A
         hiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787741377; x=1788346177;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vx6C7ipB5WA39lhIIfpl0O9RzJDFwU/g+feUIT3tbfU=;
        b=BcIc2VfQUm5rX0rJr1BqkWLWGsdJMq+H304dswaq5ucmLj3vb/1NLkeyYAnWYciIp0
         vfeZV7aWBXm70VJRm25lLUyMin+R5AatdjvIj4jygDnnig20Wg1GrpElN4DdofWQrI+g
         sGNtXlKYxsEc2GXOmVJZ34owj/O3mTtCAugB33689x4aQMzbv9fKm1IRrUTeqiGAKpEM
         +8xDaS3YgFcY62mLmlu8C2t+O0efRORUG0rOJ7OpqozkYaXGlJt12iu5hmr2Mw4/veRZ
         rpkBzmpwnxrFbd85PXzFamGXBxgev0wu6j0ntaQStEX4zj5N+423MH3IZA3704osJa7B
         Q8TQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro1sAbHYZEm1Nj9YOoPTssQDuMBeqJ2m+BLa00Gpj50S+PkMSc+Gy6FVFRWfj4ppIVFEZ6eF5v658siv+Rz@vger.kernel.org
X-Gm-Message-State: AFuF++nWscocUDCikNa/2AC2iLjxmveXOjkSjChsEHVUUQi+gIoxoIkN
	SeWhqJmRxzdX85UFiMzXyzAOPee/K9MFNIBbIq6zcQAzA81EKexmNhcMA84Pyo1FZhGnytbfvlH
	mfd4/HwcQcMF6J4GXYA/zVPmx0ipixM2m5VnVPS5Rb68Q5Lo7ySPIwj9EqFRxt2yyDGeC
X-Gm-Gg: AR+sD12KfNQv4RO0Tv3A+7Y/UUB+6e244L7MnszmRJg944vTm2MtUo1uic4iwZYDLUB
	U83NoVSK0J1HLD7U2C4KzZzD7+A8iF14nQgzpXaOLGpf4ieyd98ntcdzDAjh5qMVs52+AbRqgOl
	lmmlTXQhqvKZ3ShaSw3KqyAGherxZaYwEYK7dm76PKfYP7rARKF9WPxaYyl8bW+yofHZPI/nQwM
	tbbxNlv6ABZHT90DCD8POS+1Yf+sanwA24iRLvzTa4KsD3z2SE95gxioJDCVZJ9m6eEqC7QSm+n
	ukBmnaK2aoNisuw1jmQ7NWsOkTkw5nB6gPpT08H7j1/49u8urRSr7phpt6w//7Cj6PwdI1ZUpoo
	qcIDzzx75iBz9AkUFb3z0MvnpZRARDwwKgw==
X-Received: by 2002:a17:90b:280a:b0:380:9f17:6df3 with SMTP id 98e67ed59e1d1-3966d1e226bmr12994634a91.4.1787741376597;
        Wed, 26 Aug 2026 03:49:36 -0700 (PDT)
X-Received: by 2002:a17:90b:280a:b0:380:9f17:6df3 with SMTP id 98e67ed59e1d1-3966d1e226bmr12994510a91.4.1787741376053;
        Wed, 26 Aug 2026 03:49:36 -0700 (PDT)
Received: from [10.217.218.252] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8eefd82sm6858176c88.2.2026.08.26.03.49.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 03:49:35 -0700 (PDT)
Message-ID: <07c22121-0a61-4445-b2ad-7bd5c46633af@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 16:19:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] i2c: qcom-geni: Add dynamic transfer timeout based
 on transfer length and frequency
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260813-master-v7-0-3f9010cf9229@oss.qualcomm.com>
 <20260813-master-v7-2-3f9010cf9229@oss.qualcomm.com>
 <7222e72f-e618-4a78-8b48-1e712b9beba5@oss.qualcomm.com>
Content-Language: en-US
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
In-Reply-To: <7222e72f-e618-4a78-8b48-1e712b9beba5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: RyT7DtmJ28Hjn6UEHqQoKcRuAtJL8LYc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5MCBTYWx0ZWRfX0vxaSE7etG3l
 BYij84HKOKSssH+qn1/QqJW9dx7qYtosX+3fp863VaQ3EfzVToI50OwUBTMaupvLduYxj/w2n1i
 lF3hIcDhhgQsWm6Vg7KSbNiUx5t60kcwud/poRWn+fc+no/ipe3Yp2VzMN1R1TzEDuqf4vFzpPl
 4w6gSzmmYUNd8xoZK3QbNZBsUKsHCl4oAMKjVNE2dFBLLn9/7G+K43jHxtL/OzeKSkZVeO6hwxm
 tZABhuK/Eg9lOXM80H3OcRuFln2QMg1qXZPuOwv9C/aAr/+bYHmk4c2Y4DVA6yfFKf7co5YzcmB
 autk68KkoV8bwBFT3iF6DpSAF2foP5+mZKuS9gPNopc/ml+o/EBau8xa0z4s6tmWR/6sIHZ5Z06
 AQ4X9o0pV2w5p4JTnrsaT+JuacjK+WG/KQHqX24peP+nLx1gIxLyzbkQZ022KYOSWx+drc0xDUg
 hFkVXwVMpxmKDJ02U/w==
X-Authority-Analysis: v=2.4 cv=Xfq5Co55 c=1 sm=1 tr=0 ts=6a8ec4c1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KXUiuOnxnqQgX43oOSUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5MCBTYWx0ZWRfX5tDb++jmVtff
 NRzP9Yz/nC5XS+XURrm3ndSWCEgq/sxlonJjl4qO5q24iWwLWUhadpPoyR1jHhX/ybmGly+SJV5
 4j5QmfwFUYh3ezg6Hn8IN8/p7U892j8=
X-Proofpoint-ORIG-GUID: RyT7DtmJ28Hjn6UEHqQoKcRuAtJL8LYc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260090

Thanks Mukesh for the review.

On 8/24/2026 12:41 PM, Mukesh Savaliya wrote:
> 
> 
> On 8/13/2026 11:15 AM, Aniket Randive wrote:
> 
> [...]
> 
>>   static int geni_i2c_gpi_multi_xfer_timeout_handler(struct device *dev,
>>                              struct geni_i2c_gpi_multi_desc_xfer 
>> *multi_xfer,
>> -                           u32 transfer_timeout_msecs,
>> +                           unsigned long timeout_jiffies,
>>                              struct completion *transfer_comp)
>>   {
>>       int i;
>> -    u32 time_left;
>> +    unsigned long time_left;
>>       for (i = 0; i < multi_xfer->msg_idx_cnt - 1; i++) {
>>           reinit_completion(transfer_comp);
>>           if (multi_xfer->msg_idx_cnt != multi_xfer->irq_cnt) {
>>               time_left = wait_for_completion_timeout(transfer_comp,
>> -                                transfer_timeout_msecs);
>> +                                timeout_jiffies);
>>               if (!time_left) {
>>                   dev_err(dev, "%s: Transfer timeout\n", __func__);
>>                   return -ETIMEDOUT;
>> @@ -778,8 +787,22 @@ static int geni_i2c_gpi(struct geni_i2c_dev 
>> *gi2c, struct i2c_msg msgs[],
>>           dma_async_issue_pending(gi2c->tx_c);
>>           if ((msg_idx == (gi2c->num_msgs - 1)) || flags & 
>> DMA_PREP_INTERRUPT) {
>> +            size_t max_len = 0;
>> +            int j;
>> +
>> +            /*
>> +             * Use the longest message as the timeout base: one 
>> completion
>> +             * covers the whole BEI batch, so the budget must fit the 
>> worst
>> +             * case single-message wire time.
>> +             */
> 
> Using only the longest message length may under-estimate the required 
> Timeout.

Yes. We can take sum of all messages in GPI multi desc path. I will do 
this change in next patch.

> 
>> +            for (j = 0; j < gi2c->num_msgs; j++)
>> +                max_len = max_t(size_t, max_len, msgs[j].len);
> can we use sum(msgs[i].len) instead of max() ?> + 
> i2c_update_timeout(&gi2c->adap, gi2c->clk_freq_out, max_len,
>> +                       I2C_TIMEOUT_SAFETY_COEFFICIENT,
>> +                       I2C_TIMEOUT_MIN_USEC);
>>               ret = geni_i2c_gpi_multi_xfer_timeout_handler(gi2c- 
>> >se.dev, gi2c_gpi_xfer,
>> -                                      XFER_TIMEOUT, &gi2c->done);
>> +                                      gi2c->adap.timeout,
>> +                                      &gi2c->done);
>>               if (ret) {
>>                   dev_err(gi2c->se.dev,
>>                       "I2C multi write msg transfer timeout: %d\n",
>> @@ -899,7 +922,10 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev 
>> *gi2c, struct i2c_msg msgs[], i
>>           if (!gi2c->is_tx_multi_desc_xfer) {
>>               dma_async_issue_pending(gi2c->tx_c);
>> -            time_left = wait_for_completion_timeout(&gi2c->done, 
>> XFER_TIMEOUT);
>> +            i2c_update_timeout(&gi2c->adap, gi2c->clk_freq_out, 
>> msgs[i].len,
>> +                       I2C_TIMEOUT_SAFETY_COEFFICIENT,
>> +                       I2C_TIMEOUT_MIN_USEC);
>> +            time_left = wait_for_completion_timeout(&gi2c->done, 
>> gi2c->adap.timeout);
>>               if (!time_left) {
>>                   dev_err(gi2c->se.dev, "%s:I2C timeout\n", __func__);
>>                   gi2c->err = -ETIMEDOUT;
>>
> 

