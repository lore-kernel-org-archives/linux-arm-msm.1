Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F5C46C4C7
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784648522; cv=none; b=BKecenD5bcZSuV1liN3laDC5b0afvMivRtUn/FJE1YWo1ynOG1fhPjjQ+2mfnkxTfMCdRkt6fGIADjVQ31NPdm5ozL/uNAE3IZ0HCxNh//Eazm0cqchFOmGc79k5mPboyWiti1yLmMtROs2pK8JbpghPPm8WaWTgx6JN73tE2j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784648522; c=relaxed/simple;
	bh=nhEeOqEKgSq3GmWXx905R5Hy2j68p3z7csWzxLz4KmI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jIJzQVdL/4T7w6+E2oVtJUn7xpn4OHR0lTlrJo05NffribLIFn5plghELIP8zQYrjqsKfggNOQ4t922Ko38awJxMNJ/wZ0rGxlVITxbIkTTHfZZRdJODE//INftWppEVG4SMayqtRR/3jM3dAYqI40DyJkpOPXA9GThkenhe83c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OU26wvqG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g7KYWk0f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OU26wvqG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g7KYWk0f"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDftbK1591050
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tG+/y07EnAc+VJ+hv6KDaBBFa6O1drJ9FLrxO9bjP74=; b=OU26wvqGLRa/9VYW
	8tHHATNFsob2PR3L/qIGkbdD2gAYyWj8p5Y0SUmcQccFQBatTTntbwqLh3iylkM3
	TW1xGjc9AI1GKGV5KC+yIWs2Csh/PB1Xtq0EA0NUXsg8bKvTI/aOAvM+Qo5/Qqhw
	1ThC/T8wtuXovnppcqPXczQV2EDZAsoZmxN6Qbed5Gv+YuB7XaTTTMF+BV55hwu6
	mVYIjrhi8tn71xpc9XXTAZxdIcZqDlq4UQVH/2D+XnVjlOesGVhKPUEVGleMQwn0
	pecvWIMUCJDkkAN+YleSFl6GSpnhm8npTZ/mxP2jJAVJb4rvsCc4yBv2Ga9ZW+Ii
	nJTOdQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj0as3k3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:42:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc640dfde3so93834245ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784648520; x=1785253320; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tG+/y07EnAc+VJ+hv6KDaBBFa6O1drJ9FLrxO9bjP74=;
        b=g7KYWk0f7KQQdC+MBCM7bQtBh58YOYma5TauqF7LxGsCY/WNm2EkK2JxI2Jx6GNp17
         1ZYDhSSx6VB0l3ptvzWq66c7sz9eYtKkzxgIajINbOVY9B1umvqe+xK7/F/LCwbCtfBx
         YZYss8a1oZpxJInj7WvYa4AxBZlpcx8Mkt3EiFVqbbM9vY+vTzjfngATYi7g2gWNwj1O
         qM4vAf5kgD8OP61ayIPuv+kE6uIc9qMDNT/RxWZ8OFuMLTo10c34CoVR4JhHNK0RU8Ae
         Nzbxhsv0AVT79f/xHI+pWjDcUHpOqOwGyVj9f9R6K94Q4ctYrJND048tNv+4RSNtL+6/
         E4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784648520; x=1785253320;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tG+/y07EnAc+VJ+hv6KDaBBFa6O1drJ9FLrxO9bjP74=;
        b=WFMfakU7wVylF+bx/a3UlU3kYX+6nQiIdKZoIr1DwSwJ+dC3uW8NUIdWyRQuoccOrp
         4eAHmcKMFIOYgysxUiYusOumx8eQpr6LSAO+esu09qmw6POuowzujF6xCPVWnx4WlQiD
         8xIazcl4gf2uaNuwyYBiUAIO/d1StuR3S87WIPK/ciZuaqCfZlwRRCNT8Ogi660fS0iT
         ScezmfDtCylApFaac4kSwFFwiAHjcJZwjjLS8XVqqi4ZqDX5VnHbS6xBLQW/PRi2xG0w
         OZd/mxfhjssXWpBASiEjGnZOMT81SQ61vyh2SjESY8cd3fi3+NKcsligEeYMl33NKd2p
         fOiQ==
X-Forwarded-Encrypted: i=1; AHgh+RqC/S4F/5G7zriC1dqgGD2iFHcM1ajWDcseW4s3bZXM4+N9HUyz0XcVhJyCPQGjVv0uyhAbhF4DjUCLEVWR@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd+hmepQ3K3iUsZXBE4x/GpKOnzCbeRGlJ229/bRGhXw2GHdpY
	IKgkU3p8QjO5XtQYNPpU5ZbSLAmlzIUi5BgTYtSoDAJWozFqqDtIebM02o1w0IWkW+M8lS0dzZN
	Kb1I2o+qoG4mo7fPdZqiR5AY7gtZt6+VZ1pEAMz7bqc0u4/DDI8feJxkNquXzq8TWsYKt
X-Gm-Gg: AfdE7cnfqw6ojVS91M8ML7491PwlcRZ/UFtBeehSSSkW62xZT9pXGwM0ZT1G2D0cUjq
	xcDJ4rbGFYbDy3QEqZDD4e16K3O/N7VkT9fbNpjQo95e2DM2/bkgnNHXXEe/4KdkbH+noQUsIHm
	PSa3z+DIKehqsRcJfEqu/8AKrspoAp4m8gKBnm0T5nSqVN8CdSvI29V3b/oYXeL8+GSeMPA591C
	6/gLjRAVRrjqObXob3teuwnbKNwcwjYT0n9NYQlw3lWgKHq9FUk40+UWlmI+TBc5+4/BzLxfUML
	GPf2LDLbMa6gasSJyc2o1qSnfLsbgR5pf9OgB22bMeH/QJbOxdyXiFVmp0hRhGvE44sV8/ALWBG
	BvE7qpHCnfRy9LwcQ8rEYzwG6rWjnUTiU
X-Received: by 2002:a05:6a20:2446:b0:3c0:9c1a:8953 with SMTP id adf61e73a8af0-3c3ada78e07mr20134624637.75.1784648519726;
        Tue, 21 Jul 2026 08:41:59 -0700 (PDT)
X-Received: by 2002:a05:6a20:2446:b0:3c0:9c1a:8953 with SMTP id adf61e73a8af0-3c3ada78e07mr20134582637.75.1784648519102;
        Tue, 21 Jul 2026 08:41:59 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1c9289sm117159eec.29.2026.07.21.08.41.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 08:41:58 -0700 (PDT)
Message-ID: <17b99e4a-2fc8-472f-8d3a-897ec4d0e2e0@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 21:11:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: iris: add Long-Term Reference control
 support for ar50lt encoder
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Gourav Kumar <gouravk@qti.qualcomm.com>
References: <20260721-shikra_ltr_support-v2-0-702842f1f3c2@oss.qualcomm.com>
 <20260721-shikra_ltr_support-v2-1-702842f1f3c2@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260721-shikra_ltr_support-v2-1-702842f1f3c2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE2NiBTYWx0ZWRfX4DiL/407Qq8g
 h7SgsmgHqKMgikAvYY6f7wWJujI9unVV6ODMYSu3M8K54neFcUMALJVx8ds6OH/HFLoqzSv6CG2
 TDIq/2D8E2prDN7AQNM6TehqgJWMCOKT55WvkFG8WrGa2VZnYLNxlPS8OfrPtFb4OV7JCBVSc8+
 Leo+ATN4G3fdc/jx4GeH/JGRnUVMTUrFmv1xskCi0dC+YAL3SLWQ2KTTesBNdDAPnGApKhwO0mM
 Wp1aXy00pMqZ2gHEsoSOzsPeJwhVZbJdGq3qgBalWBNWMq5fVK20p81ejpdefuiHx9r+43xRa0X
 W2Z4crWtDKczggrunwjPFhS8zI9sf946+uR4u6q6RTt5SgkponBsPMy+qDFd8wmQ/knQwhyOLZu
 a/Oa9OF9P5eEJEX79cfkLQuri0a0JcHYeqEzGH25y9QujwjjNgSE1O3fjDt6Jbbn4J25NRp7NoX
 uddT8zLzllIU0zHMCgw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE2NiBTYWx0ZWRfXw3vkKV0N/vis
 nityPX4U5mj/nwtIs2l3MOuIGjEJCu7EpNbTXiiWx/VOd4i3BsU6Ge2z/ZP75cCWPKV7/UnI2cU
 iT4vLpfowxL/y2UfFDEsNZbwsAV++qw=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a5f9348 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=gm-eHnAy443RRWUYm5cA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: QE3gZY733a12XM6MG4PBydvmEQ__MfcD
X-Proofpoint-ORIG-GUID: QE3gZY733a12XM6MG4PBydvmEQ__MfcD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210166


On 7/21/2026 7:06 AM, Vishnu Reddy wrote:
> From: Gourav Kumar<gouravk@qti.qualcomm.com>
> 
> Add Long-Term Reference(LTR) frame support for ar50lt gen2 encoder by
> enabling the following V4L2 controls:
> V4L2_CID_MPEG_VIDEO_LTR_COUNT
> V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES
> V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX
> The ar50lt gen2 firmware supports the corresponding LTR HFI properties.
> 
> Signed-off-by: Gourav Kumar<gouravk@qti.qualcomm.com>
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c | 30 ++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
