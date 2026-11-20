Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795206745;
	b=ZOC0dtRlX8Whl4xLZ7uilu/UZPjaqjT7kojRtkIFZ3sY1U+kcJZL1cPaKkXOjJCwwDYO
	 O2iN+3jREyiWDQuDpZQ8Jn8cp7Ec5DcxD+1fYrXaG5byea2j2afLb5U9VIFBCTl1H/McO
	 IIPoFq8tW9kADaetHZUnltFgIhdhSn8gM+EIw7VQxWbGkVRJGNwc+tYWVj7JUbCCv3R7u
	 Qkjq1tYQi4CcVyfR3UPO3RdzbHyeuC5TwBOwdykaHD98SgIGolKVkH1PNR6dZs8Hh78In
	 pvNvOwVJWqTCUjM2aLC9GMmbEWe017ogwKeyz0VtjPaLOi1a4SNAe9PLMAwTctaDXGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795206745;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lfr95e+Vt5Nz87CxVx6PR2T6GSC6EjwcQB2RMTQHCro=;
	b=Bb27CWAvgnKT6afZYKnVaPnRn8+Xbt/u9VdyVYt0ih9Y87KqLS8lMl+7mfFshgQ919qn
	 /ZH/lNCyV8ejKSadwuSwoi7frbOAg6uBOLs6agh5V/G0qYA5tUOeoNcHUGqMs2Xn6KYgO
	 7XJEUQJCi1u2Lg0Pnro9bJRGJrtpZQ4xl32qQ8KxrVAsdzfwzHjHT2Q9HvVxV13+ICkS9
	 T8Y+DxJ0Ypa9Pd/yBTem+BuWV6FLJp1gPegINvk9Eb16pdB6xNXx/Di03Cag24De3UIvP
	 7mMSYTQ9mv7mInK3/eajn9CJ2t3j0DjSdEE18Rj5jHfl0/1aDTycizOxwAoV3VBLFlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=grQGf46h;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RAZJu5Tn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33156606A331
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 20:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33156606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=grQGf46h;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RAZJu5Tn
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKJgnV82640684
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 20:32:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lfr95e+Vt5Nz87CxVx6PR2T6GSC6EjwcQB2RMTQHCro=; b=grQGf46hMGHImbdu
	EhWlXgOXKXI3Z8TtwOy2Ot4kF1tDtzThOSa64xZ+t8sA1h7bKrinQffYFNNVin8S
	KyDqGX3490BuV+7qBeLh5jyEj0N1RJY639NX875FSFWVXg7nkqDupCFISwi+eCx3
	0Wkayd/R/Os9JDj0skfSRLQ5f59v5AEzImkJeYm2krS13rmBKjd18Yvm7/mu4hsN
	Sm0+NfVr7rWci2lXuW4TUUTDa8fiqACGixKzPF4D4ywdTj7cQXjW+GrviQQboaxU
	c1dzgCaIRfQxOwrO4TcSkEPAu6Z7mygWKraWEOqjvI8Ttrb8r95c1EDrma6zuTYZ
	lq+y/g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2vkwg572-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 20:32:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2c0e6653so226492285a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 12:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795206742; x=1795811542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lfr95e+Vt5Nz87CxVx6PR2T6GSC6EjwcQB2RMTQHCro=;
        b=RAZJu5TnF9M20KUMY/Vv89HjHpOM1Xr4Hu63+XndnoR8nf8AoAuhvAZL2zTN39L589
         NCS3zZAW3WFsHel8Yhwg2y9Q18YtoBm+y4hFJarYuk99uE8rbqw7bJ6VVqLmldlra5XE
         tffnBW5uNz4qSEkNvJeXrFg7TL/aTYXQPvNTBZgmalq5qAp4pudzeEqdgjqdo5OGkgLj
         0eYl4h/JSWdGQWLPymT7CXoxNuYZDJ9rbdu7Lzmh84+q40FsP8fzQENI6pq5DU82z2s4
         AIy4LsVasBc2weBiAMkCh0vON/iEOEIQoAF/WALLU2q/dg+BOcUw2Kp8qh5mudw+echl
         2+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795206742; x=1795811542;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lfr95e+Vt5Nz87CxVx6PR2T6GSC6EjwcQB2RMTQHCro=;
        b=bM36ecJV4KUBb6RHL8hn1YoypTVxYMec6nJ2TGHSm9cUdvJqW611MImuST0h/ONvzT
         aBu0vo1oE0NfJdKY7cyKCcUosO66uB4BvWOFl8QdggPpuJ7+91xJixqo8WWZujmIw3HL
         DspNKA9emYVyrlmfNo00b+v6fPRwelWr8fsascXrm8KKVXR2mb3+wlkyb2hXegH0hA/d
         BKkBNw8N0qZgCj6zKn1dDfZqnYknOik5uutbLanWQpAb6ucksn2MwYOA3J9dphYTX/J3
         EKT0Kqe7FKqpepouzVukN6M0CtIFsDFVakBDPDA6fFyviAKtSXiuiGmtkR/FX8CCketQ
         JcGQ==
X-Forwarded-Encrypted: i=1; AL+hErFU+GI0KmsuXDqvUgTpUmP/Qdxx5HyqPqQSG2Fkc66GT5MH401KV3Ex39Yz2yx3DhgW/UAQtAqAmzgOxZw1@vger.kernel.org
X-Gm-Message-State: APuU4Z9zUTHorUgTqQVd085UBP98q9DJCtLso/7VvdzNgGwWhC3ddxCv
	tWRb134ep3dqAo/hJ5pOcDYBz2Hx73BZ9FeJzhTJMVF9T5nkNt/CxsgzW5XiRp8mGpXWXc65D2s
	Ii2VCpm8dOXzQSK+vC9v9czcc+QuByBLOmcLpElJehTsVPX0O+UdRnu8ejVpZ/3nFYR/T
X-Gm-Gg: AYBFou3x/B1GqLFpjqddQPBkzz0Lf17ATrISBCvazDdL4kXdclVZeU3FrHOxSP4MCJG
	8Y/shu4+AUwXfm9abjA7zHzfsSjAw0u17jKPYFSc/H3bHeGkm+8lgb/l+4vyC255db12tHIfevl
	oWVYDMBOcz8bEeUflR7NnrSVTSjRR9ehuDPgP8wIUu1FwDwdQeJKG8rWwmsHxYRYujDM9AoUTN+
	oh4pQ9uc01K1xfRu7NdqEzsbfS9LLRUVV3qXhi5PThB9K+G2vaLmzXSs0W7KVqXkSefaVfJn7lZ
	YF4dPu5+c1HCT/MO14gl2gzuGVJD0qWDgK4VLVKHdwR2ePjiFPlTqit/K/N9lUTYcXrc5+E/3//
	VU5JeU4pec+mEZID879DVCq+Y+LOtgIdgeXxz5iMXbJ/yUU/yznoCpSLacaCzUSIi4RprBrPNvf
	qQv2RQsxqzZ79i
X-Received: by 2002:a05:620a:649a:b0:949:752d:31e6 with SMTP id af79cd13be357-949bac8557bmr636015485a.79.1795206742005;
        Fri, 20 Nov 2026 12:32:22 -0800 (PST)
X-Received: by 2002:a05:620a:649a:b0:949:752d:31e6 with SMTP id af79cd13be357-949bac8557bmr636010885a.79.1795206741475;
        Fri, 20 Nov 2026 12:32:21 -0800 (PST)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm99765535e9.9.2026.11.20.12.32.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 12:32:20 -0800 (PST)
Message-ID: <1c642d0f-c8f8-44ba-a632-38dfc20301fb@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 22:32:19 +0200
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
Subject: Re: [PATCH 2/2] media: qcom: camss: Map each CSID to the VFE it feeds
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jesse Casco <jesse.casco@gmail.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Allan Siriani <allan@fatecpompeia.edu.br>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <cover.1795196107.git.jesse.casco@gmail.com>
 <9e5bee0dbc1c116672ba0020013ef0a346385c29.1795196107.git.jesse.casco@gmail.com>
 <CAFEp6-3cQXygekbk0wG8AcxqkW8NgbqHq80SjvPF5XnWhXMRyw@mail.gmail.com>
 <313d44f4-d4fb-4239-8bd0-66547bd5b270@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <313d44f4-d4fb-4239-8bd0-66547bd5b270@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA4MSBTYWx0ZWRfX3RMd0JASPh5o
 RGtVAng3ZquhC0c0Jmgt3nBxwDAn9EcaAVcWPDZd4QQTH9BSwxA2yZ4gyXVIALEInzgabEyyogf
 AxUiGxz1UBFkR13IA+x5oZR5AeSaMFc=
X-Authority-Analysis: v=2.4 cv=C5p8WgP+ c=1 sm=1 tr=0 ts=6b00ae57 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=AOr4cP9HA7zHa1zAR_oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: aj0EG09jkFX0EHjckBOdiX54C6_7CbUc
X-Proofpoint-ORIG-GUID: aj0EG09jkFX0EHjckBOdiX54C6_7CbUc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA4MSBTYWx0ZWRfXxoupzkyfZ3Q6
 LJppV55oinnMZ0C2SPkABPoE5r7emNtp6w12/WoJfsJBfjg0mTvYJWN1flsWBZ7d0xI4dpUy77O
 oxLuD0kvVfgC4zr0kbHptlWw7BLjYdeOrdO/rClyOpeEcZ7F2S3w4UsBBG8z+0h1oig4F3xhpLh
 +eX07LyEk09Avrsai2+B9+HoDon9KYMfKYjgdCnKPH0MTn0HEBeDWEY0PJjmJf4FxVAZD4GU6ih
 dvSW0x0f+DU5zyThJuHK3cj8Sdcvc86QXcYrTPgofdfOJzBbBRll0uc3VvbjLNb9Jlv/c5QL1D+
 +VZahxYApebH2OLS8wyQ2/xK2KZBYMKkfE2puBwTi0Qkgxwmf8UDqUOzMjhLW2GQm8Keuhk7L1v
 6e/QfE5ZOkuaYPV81jH+/u71j6SgvO+12Q5KvzHXMUzrPVVVwiN6Sjiv7XYbSO1j2fguHjhgvY0
 7EqifZu3uU8c9Z2nCFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200081



On 11/20/2026 9:56 PM, Gjorgji Rosikopulos (Consultant) wrote:
> Hi Loic,
> 
> On 11/20/2026 9:39 PM, Loic Poulain wrote:
>> Hi Jesse,
>>
>> On Fri, Nov 20, 2026 at 6:40 PM Jesse Casco <jesse.casco@gmail.com> wrote:
>>>
>>> CAMSS assumes that CSID n feeds VFE n: csid_set_power() powers the VFE
>>> with the CSID's index through parent_dev_ops, camss_buf_done() is passed
>>> a CSID index and completes the buffer on the VFE of that index, and
>>> camss_reg_update() is passed a VFE index and updates the CSID of that
>>> index.
>>>
>>> That holds as long as a SoC has the same number of full CSIDs and full
>>> VFEs, with the lite blocks after them. X1E80100 has three full CSIDs but
>>> only two full VFEs:
>>>
>>>   CSID:  0, 1, 2, LITE0 (3), LITE1 (4)
>>>   VFE:   0, 1, LITE0 (2), LITE1 (3)
>>>
>>> so CSID2 powers VFE_LITE0, CSID_LITE0 powers VFE_LITE1, and CSID_LITE1
>>> fails to stream with "Failed to power up pipeline: -22" because there is
>>> no VFE 4.
>>>
>>> Look the VFE up instead: a full CSID feeds the full VFE with the same
>>> index, and the n-th lite CSID feeds the n-th lite VFE. CSID2 has no VFE.
>>> This gives the same mapping as before on every other SoC.
>>
>> Can you also check there is no possible link in the media graph
>> between LITE and FULL CSID/VFE blocks,
> 
> For the current state of the driver maybe make sense because "v4l2_pipeline_pm_get"
> is called in prepare_streaming in camss_video, with previous state of the driver
> this call was done on video_open. 
> I think that from sub-device api point of view it is not correct s_power to fail if link is 
> not enabled, but if there is consensus for that logic i think i am also ok...

Sorry for the confusion actually checking if there is a link present (regardless of the state)
i think is ok.

> 
> ~Gjorgji
> 
>>
>>>
>>> Fixes: 1830cf0f56c3 ("media: qcom: camss: Add x1e80100 specific support")
>>> Signed-off-by: Jesse Casco <jesse.casco@gmail.com>
>>> ---
>>>  drivers/media/platform/qcom/camss/camss.c | 46 ++++++++++++++++++++---
>>>  1 file changed, 41 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>>> index 7d9622097..8020b675c 100644
>>> --- a/drivers/media/platform/qcom/camss/camss.c
>>> +++ b/drivers/media/platform/qcom/camss/camss.c
>>> @@ -4629,11 +4629,39 @@ static int camss_read_version(struct camss *camss)
>>>         return 0;
>>>  }
>>>
>>> +/*
>>> + * Return the index of the VFE fed by CSID @csid_id, or -EINVAL if it feeds
>>> + * none. A full CSID feeds the full VFE with the same index and the n-th lite
>>> + * CSID feeds the n-th lite VFE. The two only differ when a SoC has more full
>>> + * CSIDs than full VFEs, as X1E80100 does (three full CSIDs, two full VFEs).
>>> + */
>>> +static int camss_csid_to_vfe(struct camss *camss, int csid_id)
>>> +{
>>> +       const struct camss_resources *res = camss->res;
>>> +       int i, n = 0;
>>> +
>>> +       if (!res->csid_res[csid_id].csid.is_lite) {
>>> +               if (csid_id < res->vfe_num && !res->vfe_res[csid_id].vfe.is_lite)
>>> +                       return csid_id;
>>> +               return -EINVAL;
>>> +       }
>>> +
>>> +       for (i = 0; i < csid_id; i++)
>>> +               n += res->csid_res[i].csid.is_lite;
>>> +
>>> +       for (i = 0; i < res->vfe_num; i++)
>>> +               if (res->vfe_res[i].vfe.is_lite && n-- == 0)
>>> +                       return i;
>>> +
>>> +       return -EINVAL;
>>> +}
>>> +
>>>  static int vfe_parent_dev_ops_get(struct camss *camss, int id)
>>>  {
>>>         int ret = -EINVAL;
>>>
>>> -       if (id < camss->res->vfe_num) {
>>> +       id = camss_csid_to_vfe(camss, id);
>>> +       if (id >= 0 && id < camss->res->vfe_num) {
>>>                 struct vfe_device *vfe = &camss->vfe[id];
>>>
>>>                 ret = vfe_get(vfe);
>>> @@ -4644,7 +4672,8 @@ static int vfe_parent_dev_ops_get(struct camss *camss, int id)
>>>
>>>  static int vfe_parent_dev_ops_put(struct camss *camss, int id)
>>>  {
>>> -       if (id < camss->res->vfe_num) {
>>> +       id = camss_csid_to_vfe(camss, id);
>>> +       if (id >= 0 && id < camss->res->vfe_num) {
>>>                 struct vfe_device *vfe = &camss->vfe[id];
>>>
>>>                 vfe_put(vfe);
>>> @@ -5043,11 +5072,16 @@ static int camss_link_entities(struct camss *camss)
>>>  void camss_reg_update(struct camss *camss, int hw_id, int port_id, bool is_clear)
>>>  {
>>>         struct csid_device *csid;
>>> +       int i;
>>>
>>> -       if (hw_id < camss->res->csid_num) {
>>> -               csid = &camss->csid[hw_id];
>>> +       /* hw_id is a VFE index; update the CSID that feeds that VFE */
>>> +       for (i = 0; i < camss->res->csid_num; i++) {
>>> +               if (camss_csid_to_vfe(camss, i) != hw_id)
>>> +                       continue;
>>>
>>> +               csid = &camss->csid[i];
>>>                 csid->res->hw_ops->reg_update(csid, port_id, is_clear);
>>> +               return;
>>>         }
>>>  }
>>>
>>> @@ -5055,7 +5089,9 @@ void camss_buf_done(struct camss *camss, int hw_id, int port_id)
>>>  {
>>>         struct vfe_device *vfe;
>>>
>>> -       if (hw_id < camss->res->vfe_num) {
>>> +       /* hw_id is a CSID index; complete the buffer on the VFE it feeds */
>>> +       hw_id = camss_csid_to_vfe(camss, hw_id);
>>> +       if (hw_id >= 0 && hw_id < camss->res->vfe_num) {
>>>                 vfe = &camss->vfe[hw_id];
>>>
>>>                 vfe->res->hw_ops->vfe_buf_done(vfe, port_id);
>>> --
>>> 2.56.1
>>>
>>
> 

