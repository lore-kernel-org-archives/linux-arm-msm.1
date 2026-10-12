Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DBC46C830
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 09:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798321; cv=none; b=WGQKwzKOo2fkYD/kNVbqOE7+0y1HT++Gf5TZgKe7CduUfaMOfkCr4sr66zWW9pXFBG8zuYOZ40yxTSRvgiLohc2qGNTmo6TqO4nYtogPj1LatEfW958ZYpAX9ST0caAmYrAUo/MlSrxFkFkLn/X0pRDnpqZW9NgODOeIy8SDSDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798321; c=relaxed/simple;
	bh=fBVkiEo0lmz4W4b+TPHdkvDruTk6CvZhhfO3wDZi8IY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DJGZ6CLEqQx+6rI8pumkdW+mIsSAw5j9DJ6iCuaN/i1Q4mYqQPOgSJZ0SrjpjNERJO+AAxVg50QEfVPp/23QIJj0PqeCcckGHWMAG1317Re2RzfyXKYxHi9zBb+7OBYh1FX4Z9k1CvjNJhROnGhvoox3vzrQ8m1tf18D+OfHWBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e+R1im6n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aP8+0oAH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e+R1im6n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aP8+0oAH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8Klv42181459
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 09:45:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hGtCNZ4UOOWqf7HnzftzRzSNN1uF1K70PGOPcNQI8Xg=; b=e+R1im6nSBfgZvwo
	gFVO9HSnJq3nv+S72lUMy8HKZHl6LIpmNiS3YK9x8eFPmm1MJ2W0Fv6RoPVVrxAh
	7RT4fNUiGl2xJpc4heOb7+hGfux8kP9wb5/q05Zy6p6+RE2UYq49BNL4vMfENtQi
	xm5Ml6CNaaDiPYG6kaSGYOnF41HtTcCk32wBBW845ynHwqEXPa08SmnbpJ2+qReo
	BTChexx0V4Qf6ysLW+b7xzgw+YH2YnpcCNf+iy+mCcoQXEsHQLj678cYfA/YPk7L
	AEDBDpIVh3S+5gjGGI5aWKOWDSUfbOReAlbfRtwB1YaMS4PIOafFNGM3U8jWZXQj
	8hVJiQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sd1s487-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 09:45:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39deda201bcso2557973a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 02:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791798317; x=1792403117; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hGtCNZ4UOOWqf7HnzftzRzSNN1uF1K70PGOPcNQI8Xg=;
        b=aP8+0oAHBp/oWMMrRsfviqWPL0JxRHqTG0iKg9rZ44+gUwtZs15oM1ft4K4O/K+OXS
         w73KSWLjhV1ol1jlkKlh4q6sGCmF+Yh6KE1iO0k75toxdIvSAh6yu8sAQ6vNzLMh5aE2
         VUxiGdG2DpeobROp2ULFW+OQ8pWFXBK2yVXRuGS2mwAHYYAWPGPUlkywJbC2vQQ/rtX5
         DHq2JRkv1A9BZkZ9C6QdYCgfPsRQGE3Mf63PSNA+y/dagRgZAwfwazludNSV+CBHyWaD
         hirfqVg6pkjPex6VX6gj7PHl64DJUOKyTlHGXpg9Qk+7GZNlbo6DLx5wbSMs04Te+LDY
         VWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791798317; x=1792403117;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hGtCNZ4UOOWqf7HnzftzRzSNN1uF1K70PGOPcNQI8Xg=;
        b=fRm5bEbbgvODTb3EIDRvYLyenZMxxhNnoRrnM67bI2g/b4PEkTUi4Sieuppq5htfdM
         2UCBzCsRULEGAwYSgWOjR7VZFqay1MyhS5rvpTSUuJlQMMb5WquUsFaHpW7XMVrfrJAX
         H7PSEfdIRzYaWrjBGv3KERmKhHzcWdfz9j9Lvs7ZkL9EyNHRkrIDZkQbw44ge6gp++TM
         QkdpIozVD1dzJpfrEuc9/Pd2m1iEMLUbjCu87pjN97084T/v1/LInZp3msqusbbrYfY7
         Tzc4CuZyJhNi7/yP4z6t4o/5VmrDZB0aP71ZY+VXdgUmGGPr3OxcHl7i3mRJR1qkepBG
         s9sA==
X-Forwarded-Encrypted: i=1; AKwUvBzUsTrnIQ30v1CXTz/RdiwASJ8KrQMd6Glh2iYb3IMAypNbWQM1vm+fmxQpah8kegjuNEkFulAe2kq+tHYm@vger.kernel.org
X-Gm-Message-State: AFq9FYLggUY4u4dv++6ouS/rguhfNe3uIHToIRxw0uaDbmJ4cwif6d68
	cnMBzH/xGicvMZT2Kj8Xa1JFdJoIucm136aCt8JmKTSB4YakwCjbVlrq+1G7okcso6OI7wx5mW9
	BNZKqQwMOdz3lwb/nFW4eHhqV9pP/W8fVUSf7m0MWFxrsYypaEK4JR42aqjqEjqcwc1vm
X-Gm-Gg: AYBFou0HdgT89EwnbsxS5BkMOjr3b4MpMob2KA1RyM7k33FBvSBRYmLYp8fOcoFzahJ
	zaBbrrF7QYzE/hpC7jj4uPgmexW1v/n47yinI8po8JAjNhysJ7caRGuDHQI865CL8IPXWyguRKb
	hncHhfH+5XsmbkwQUuokL8qr+hK+mbVGLVFyx36Fzwuy9jwCNPOM4seee30Hxidl9/rHcFhoVoF
	mAtk+SmbzMTtBhTKD6s9tBRBO4nVQOCrIywXNBnaWwRsPDVFcQasmSj/k/ekxp+h/VQpa5oD4W6
	awIl19vbzyVWU/r6s+GjBPlak35svggXt2d06Mg3rQLUL2xgWWqQWX5ZT8dXxVPFebI6eR+n2W2
	DaFpQy8XJyy1W0/Q+JvGkwGWtc2QtSw==
X-Received: by 2002:a17:90b:5486:b0:39e:6a7f:1dcd with SMTP id 98e67ed59e1d1-3ab3ab1d56cmr8087595a91.41.1791798317383;
        Mon, 12 Oct 2026 02:45:17 -0700 (PDT)
X-Received: by 2002:a17:90b:5486:b0:39e:6a7f:1dcd with SMTP id 98e67ed59e1d1-3ab3ab1d56cmr8087568a91.41.1791798316854;
        Mon, 12 Oct 2026 02:45:16 -0700 (PDT)
Received: from [192.168.29.10] ([49.37.155.134])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36f8277bsm15560286a91.11.2026.10.12.02.45.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 02:45:16 -0700 (PDT)
Message-ID: <447d71bd-b9fe-44c5-b4ac-375661bbbd92@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 15:15:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] tee: Export uuidv5 generation for TEE backends
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20261006-qcom_uefisecapp_migrate_qcomtee-v4-0-bf1c8e2a64ab@oss.qualcomm.com>
 <20261006-qcom_uefisecapp_migrate_qcomtee-v4-4-bf1c8e2a64ab@oss.qualcomm.com>
 <4b5d8ee4-4927-4932-963c-19eb76a8f67d@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Organization: Qualcomm
In-Reply-To: <4b5d8ee4-4927-4932-963c-19eb76a8f67d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XGLA3vt3ewhsFrRD0CZs2pIkx8Owcl-D
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzOCBTYWx0ZWRfX2/P9hN+q2a6/
 Nqp6eTMiyY15B3+eig/Mqg7EJc5SGfLpTHdmcBlFQmusiDq1dfKEDIw4uD5kAMrXC06O1xDHTiZ
 lkT8HOjvXp/vyKP68HKup1qC2DYKeV4=
X-Authority-Analysis: v=2.4 cv=QtHLTlyd c=1 sm=1 tr=0 ts=6accac2e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ivpbP8R7Mhpy7qfOLL/Q+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=HvXYQvMWAyfQ06qojRcA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: XGLA3vt3ewhsFrRD0CZs2pIkx8Owcl-D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzOCBTYWx0ZWRfXzWVE9pcIzcys
 +sWGA87xfwfDz2iIOQ6vJUQTB2r8eUuYkhz+FXrXoGGOTrE9oEKyAOka7NOCn4606PlM5W8TynH
 6S8XZy1X3bz7kyNDAaCT+I+HOsU7THJCRFWpe9d6WXa+zHW4mza6UrEjKP7K/KZoyDo7o4v/8n5
 liX5HK1vFGsagnrGNsHjeNUhrGVoOAX1JfwGkYsZvOSo9I5WJV6FSAss5dbE582c1pwNQu4cPyX
 gz08xvRa86kM0BSu12z0q/oQcdNdAJiPJQe2oAFebcJMuJqlzwnfUMlbSHTaRIRGlt3bGlST10d
 zzqtSqVZ/nsXMG6lO95Zh0p59mn1ktCDR+ZGRWyxZwOVuDAD5Dyobq0+T2SYnbSalzw9ghntXRI
 jxJM0GHuU8QbCSzJN6MWm5bCAKKrXvmzf66CGWyuY6o69ou9qpI704xZQREwVLYz8JHrTlQBJpG
 KaxiLW3KIp0CA3C5vTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120038

Hi Amir,

On 09-10-2026 06:53 am, Amirreza Zarrabi wrote:
> 
> 
> On 10/6/2026 10:33 PM, Harshal Dev wrote:
>> Export the uuidv5() function defined in the TEE core to all TEE backends.
>> This enables the TEE backend drivers to generate a UUID for identifying
>> and registering their secure services on the TEE bus.
>>
>> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> ---
>>  drivers/tee/tee_core.c   |  9 +++++----
>>  include/linux/tee_core.h | 15 +++++++++++++++
>>  2 files changed, 20 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
>> index a03a3d645dd1..2cfd302d1393 100644
>> --- a/drivers/tee/tee_core.c
>> +++ b/drivers/tee/tee_core.c
>> @@ -135,7 +135,7 @@ static int tee_release(struct inode *inode, struct file *filp)
>>  }
>>  
>>  /**
>> - * uuid_v5() - Calculate UUIDv5
>> + * tee_generate_uuid_v5() - Calculate UUIDv5
>>   * @uuid: Resulting UUID
>>   * @ns: Name space ID for UUIDv5 function
>>   * @name: Name for UUIDv5 function
>> @@ -146,8 +146,8 @@ static int tee_release(struct inode *inode, struct file *filp)
>>   * This implements section (for SHA-1):
>>   * 4.3.  Algorithm for Creating a Name-Based UUID
>>   */
>> -static void uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
>> -		    size_t size)
>> +void tee_generate_uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
>> +			  size_t size)
>>  {
>>  	unsigned char hash[SHA1_DIGEST_SIZE];
>>  	struct sha1_ctx ctx;
>> @@ -163,6 +163,7 @@ static void uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
>>  	uuid->b[6] = (hash[6] & 0x0F) | 0x50;
>>  	uuid->b[8] = (hash[8] & 0x3F) | 0x80;
>>  }
>> +EXPORT_SYMBOL_GPL(tee_generate_uuid_v5);
>>  
>>  int tee_session_calc_client_uuid(uuid_t *uuid, u32 connection_method,
>>  				 const u8 connection_data[TEE_IOCTL_UUID_LEN])
>> @@ -228,7 +229,7 @@ int tee_session_calc_client_uuid(uuid_t *uuid, u32 connection_method,
>>  		goto out_free_name;
>>  	}
>>  
>> -	uuid_v5(uuid, &tee_client_uuid_ns, name, name_len);
>> +	tee_generate_uuid_v5(uuid, &tee_client_uuid_ns, name, name_len);
>>  out_free_name:
>>  	kfree(name);
>>  
>> diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
>> index bcb5418d6fdc..a3f4f88b8423 100644
>> --- a/include/linux/tee_core.h
>> +++ b/include/linux/tee_core.h
>> @@ -272,6 +272,21 @@ void tee_device_set_dev_groups(struct tee_device *teedev,
>>  int tee_session_calc_client_uuid(uuid_t *uuid, u32 connection_method,
>>  				 const u8 connection_data[TEE_IOCTL_UUID_LEN]);
>>  
>> +/**
>> + * tee_generate_uuid_v5() - Calculate UUIDv5
>> + * @uuid: Resulting UUID
>> + * @ns: Name space ID for UUIDv5 function
>> + * @name: Name for UUIDv5 function
>> + * @size: Size of name
>> + *
>> + * UUIDv5 is specific in RFC 4122.
>> + *
>> + * This implements section (for SHA-1):
>> + * 4.3.  Algorithm for Creating a Name-Based UUID
>> + */
> 
> I think the functions in the header do not need to replicate the docs from c files.
> If you want you can remove it. Otherwise,
>

I can see that the exported function tee_session_calc_client_uuid() in the
.c file only provides the docs in the header file. Perhaps I can do the same
and remove the doc from the .c file and keep it here instead of replicating
it in both files. 
> Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>

Hope I can keep your tag with this. :)

Regards,
Harshal
 
> - Amir
> 
>> +void tee_generate_uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
>> +			  size_t size);
>> +
>>  /**
>>   * struct tee_shm_pool - shared memory pool
>>   * @ops:		operations
>>
> 

