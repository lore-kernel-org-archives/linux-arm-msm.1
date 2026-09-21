Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CE13AF66F
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 20:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790022500; cv=none; b=igVlDVKZ+QkZxaw0ktQMpOLVakb4WiMIK7jFcNEEVViIdO+1TJ4/alfXwMQSjVhchmUhEhAQ1GZjO/O9xYdmu0SeQ3afEc2mNYvxEdd19IDoXnW9ll+lbjnOj6uhNUGvU0jFY/GADfzKw957PE7nkHoTZlY2zGxXCsiht1Cw+jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790022500; c=relaxed/simple;
	bh=eFvMaJSP9NxzdmA5FpGFNUYIPQE1wmkjcWoOgddyaEw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=G23EJ7R28LIJ6iO4D4GtBdBbpQiXP+AfNhMhj9CHlq9Bcl9CN2XhuVA4CHNWoROWrVOMgTbnOt+5jK7ptILvvnTSIjCdvoZ/1ApO/vUWS1cg5HmlylS6ujgEYrW6noyI0YIqBOH6zmjLNuWcirJsmQEZj9NIRFEtR6FBdTEOSsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jH4Ft6Tm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HlFz2tdJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jH4Ft6Tm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HlFz2tdJ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LHNAT11313576
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 20:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lUxMPqFTkctfTM0ny6G3bUl1Gi6PHwngLAZs5CaMeMI=; b=jH4Ft6TmxNUtpqz3
	GFzeyGCZQLrHj2pW+G4INc88sXK8cm36ZPUPS5XFm4mv7IqOeGooKJr9bsDHli1o
	GZ0MslftByyfTEmaquzDtVWs+nf3NhbAoRr/2iSByYgajXyXEw3TtgFHR4qyxNeL
	WUSAo5QyQVRwgOIUJI8vU01W8GTuroNzrExRD2NtwNttTLopFXuHCm8H0VmR3t4a
	NkKRglJm0AIfmzVgdKhudJZUU998774x2dE31/PFrKGEksBYA1vu1h+x08mVcKbX
	TfjMD0qsn82xfc16IXgSsbP1Q+vfkr3Wu8ll38FhM3wVKi0XyTe6gegc2QQt9PZN
	76Umcw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8xerpy6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 20:28:15 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso4517542a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 13:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790022493; x=1790627293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lUxMPqFTkctfTM0ny6G3bUl1Gi6PHwngLAZs5CaMeMI=;
        b=HlFz2tdJCc8aTBWBhH/1UjBlf1SlDefpbXdtga9ogcg++xV7ZJxg5bKFuO91g/mLHT
         SjZP+fbsbXzaemXXtRfpLXcR5e6URXwRn8oJb50orYN+hpojlTyjalJMF2ULl50duugP
         opCNwt2Oe5VbbDbGU0fgiyOw1eHX9CaDxxFo0H9/G0y+U5pfs8hIZw1xrXhuod6XxNlT
         rJvGcbKa9ogvPYzddxnVswzwRZem4Kdjq34p/GO3srxZvNyp5x6tlBoBCKw2mAH0Hn8M
         U1CI+14Xq/ZCS3j3UTTb2XQsX0+WqGxJXUbFjVgtH8ZDhRLAFkBgzlsqmj+YNWJQtdNp
         TFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790022493; x=1790627293;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lUxMPqFTkctfTM0ny6G3bUl1Gi6PHwngLAZs5CaMeMI=;
        b=rI1QKvwZPDbGi0uFJ5qxT8o82RgDTkOh3mOwSI5zflY7PsmculuzCkGHjoDMW4JEJM
         21DrICVs2blMRn6VgsB8zFIKlz5ob4G09FEX+sL9Cg/Dlzgt7zqjas7w6+uwfinqLGCI
         D4G/tecr/TuYjQV+rnV8MS7wHIUeQqT77zsD0taseyAQPzRRU5eBJuQaUM7MRTnZfcn5
         qwkis0QIK/xEjJju3IpOSmJe6k3lA8PyELLkwC/OIeqUS0aQpJ/UCJZnRBBm0Xba6WD4
         guIEBVHYhhCuOt4PtYQb84m7djbbfCMPTcUAg4zfF195U3ciI/Ew4VuI2ZwaStKzpnhi
         +xAw==
X-Forwarded-Encrypted: i=1; AKwUvBwKp3iPd7cTT2HQyFLJhdv06gqz0ttg3tD3LZW0seohrrSz7qUkbIH9hmOr3/Q1cxGjMM7aH/tT85oX2ENs@vger.kernel.org
X-Gm-Message-State: AFuF++ncjGQRnHuCT4y0S4hNma+103ohg9Z8EQIsZDcoLUP58/OxarN6
	8LW3nJ+JwPMAq031FD7Pni6b1zinmZl94pMgaXEo+pJhxnS+BkjP/U402hQPwB6Ai/edNZuhLwo
	GeTwdx1EeXdZay+r9Gy2FrtZXOeT2IDJI8/cVXd9yoGIn0w0ikMRQKVgEov6Dx6IDqwrB
X-Gm-Gg: AYBFou3KKBbwktL1X1IXQuX6PXfBdMPPdtpyECVnnY9y4FKsjHzslf2YivjE0E2w5vS
	MTDqFRHkZOcK8PvgOY1EPTqDdr6DJBMicyD5H6/V04ZsB+34RGJr5lv/rXQ+PkvJluArOXLc7M4
	/gVWcql5x6oR0kxU6x9+LLldJbk1SaUi9u4uP/aE5CLHSaJlS2RIhEaak9cnBLjwcW0H20l4qCg
	ba/fhBWff3/9miLIJVutZaL+vgj/WhKqmaFW33iMXMQjogZC6Ama45QE+WtUtQZinbJMnfx7hqt
	ZgbvBNtgZw5xie6iAy7OB8NsD1H5kthQ1yTzfiP5Et9Zn1vTkm7W4CyNulmX2B8/9mrWSTpOqCG
	UrLEMJG3W8iTO9XibCF8kPeMJ0CyR9ThW
X-Received: by 2002:a05:6a21:1b81:b0:3dd:a196:5395 with SMTP id adf61e73a8af0-3dda1965403mr11871524637.55.1790022492712;
        Mon, 21 Sep 2026 13:28:12 -0700 (PDT)
X-Received: by 2002:a05:6a21:1b81:b0:3dd:a196:5395 with SMTP id adf61e73a8af0-3dda1965403mr11871484637.55.1790022492079;
        Mon, 21 Sep 2026 13:28:12 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.229.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5eba13f5sm396926eec.10.2026.09.21.13.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 13:28:11 -0700 (PDT)
Message-ID: <c9c9c069-d8e8-4921-8007-6c6386c8da7c@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 01:58:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: i3c: Add support for Qualcomm I3C
 controller
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Frank.Li@nxp.com, wsa+renesas@sang-engineering.com,
        alok.a.tiwari@oracle.com
Cc: andersson@kernel.org, konradybcio@kernel.org
References: <20250701071852.2107800-1-mukesh.savaliya@oss.qualcomm.com>
 <20250701071852.2107800-2-mukesh.savaliya@oss.qualcomm.com>
 <ce888443-c86e-4353-a4e1-64f2cc62604a@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ce888443-c86e-4353-a4e1-64f2cc62604a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: r3TeFg3-ds8VqBGwge6Dd5pHRTMXFlYy
X-Authority-Analysis: v=2.4 cv=PZhqFShd c=1 sm=1 tr=0 ts=6ab19360 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=LKvw4eQ66EqDTtCUdPbf+g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=lq1buquVkbxOhH_QKIUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: r3TeFg3-ds8VqBGwge6Dd5pHRTMXFlYy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI5NyBTYWx0ZWRfX1oO3VQ0/lu4e
 S/+8vef2OA1UrVsCCf23bz1e/BKW+YdYEtOCPvQzbrK2sfaWyyB3oHHxFG6uRz9m00Q77auOhnD
 k69u0aCPffTjK78B96vuex7RWJTeein0HPu6tpWo9erEWT/Ekuq09ugQ0Op0EVP4Gx4MOGMpnkj
 vIOx+piAp4Kt3pIkQ5GGaRh51Kdyv9qqyzM6Qe42rKUNqarSVYUDYfWk+OXkteQE7bpycrZ9/dq
 0hQtB9Sl7RYV/qevNKmvKUASAggIBfIg27vMRJv2FqRButlzOn9lxIVFNSgQ2v3JFcDjvqehl8d
 zDviOQVLiU9/IQiv/fGcE4GTxc/NDlIoh3CdAUF56mrDfsO69HQaulRzFli3ouoxupMwmpx5C1L
 gRjPgrmd05zeXK3wNUASxvIXNI1ih1js/WIrgoaLitrAaYMuIFSvp3akluFX3W9mDb60f6G+tkA
 brnBt07Gd/+g55Rtq+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI5NyBTYWx0ZWRfX3mLRaOz15ah4
 QL4YlF/wXfCTo/ZzR5kBl9xgtdCJZUnLEFTMnRv97DBoZ4beFUCT/pvKgXnRCmpluI3i3+ZSHE4
 lxtXkZYN94BV6ow7JuvQYZdTY330oF4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210297

Hi Konrad, Apologies for the delayed response. I was waiting to verify 
the changes and ensure all the suggested updates were properly 
incorporated. The effort was further delayed due to some slave-side 
setup issues.

I have now addressed and validated all the suggested changes except one, 
which I have responded to separately below.

On 7/18/2025 2:21 AM, Konrad Dybcio wrote:
> On 7/1/25 9:18 AM, Mukesh Kumar Savaliya wrote:
>> Add device tree bindings for the Qualcomm I3C controller. This includes
>> the necessary documentation and properties required to describe the
>> hardware in the device tree.
>>
>> Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> ---
> 
> [...]
> 
>> +properties:
>> +  compatible:
>> +    const: qcom,geni-i3c
>> +
>> +  reg:
>> +    maxItems: 1
> 
> In another patchset, you expanded 'reg', can you coalesce that change
> into here, so that we don't have to worry about backwards compat?
> 
Do you mean as below ?
reg:
   minItems: 1
   maxItems: 2

I did it earlier to add support of IBI feature, but i plan to do it 
later. Right now, i only want to add plain i3c controller support 
without IBI hence.

I shall add expanded reg while adding i3c support. For now, its not 
required. Please let me know if this is fine for now.

> Konrad

