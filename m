Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820663D8903
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 11:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498060; cv=none; b=tY9/5+nrdGUHT61+L6HMbiNzqYqjDjnRPzbMZAxdL+ywo5hUMLypzceyhLQIOK72hZCFt2oLkhvEiY6/6pdO9jVXL2ZREaFJIqhw71VcnahKuZPhLwlcGLYo/NGnKf2GJVFbOe3nSSv/tba3oXmORAB+/M/FFcxR2c5Eqspyd+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498060; c=relaxed/simple;
	bh=5yUznAelfeq0vWs9CLhFYrQ/dKHAJEYsEMNEVqvx1y8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cboDBSdvcUAJ7iBYejKDOzH82ohKCnfx+kh20rJeUcsCUPZK6sPqOWogMdOV1FmPIONHy6aDfUSuKm9VqlfRXxrYWUFT9hVpZHyRquluZH5tSarwu7ceGwFe70dOeNqktHBLwcNzHt3YoNb15R1PfX2pl9aH1NvVL1l0lX8Xfjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D2/QgbVc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h9cEbd7S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D2/QgbVc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h9cEbd7S"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBelBk892298
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 11:40:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ry1zHYNDTsQJF9OfZEXfWbGzxNquqJ4GTL12C5DsHAE=; b=D2/QgbVc1RVpLrOv
	teDMoIixayPd5zdIQ7GSZmc4xWdrDeI1ulvmznu2Ln2D2lGVQgkUiOB7CyW/Xa0W
	cImuA3ictvd+3+eH0paO8mmP0QiXcA0K/xQ3HFvFFyBB+9KqxYOyYEdVm2cGTrDH
	wkQg9Chc6O1rNLLZgfdw57Fy8LsrSewWVDdtfTr/eIURoVD8PSn+NLrtU/UlObI1
	dm6DNhobYNZC5b2DQp3pnp+pgUr9d4Z9iZbvp0ra5g/3sTS9YwStFHcEKDA4WjmK
	jblxDVE4LUgioNJUZN40ElDAA4Kg0F6E0Pt5W67Ds+RTBmlgu8i4kOKvoKfGqzcT
	44RzCw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru1x8017-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 11:40:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c9e97b626so1521881cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 04:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785498056; x=1786102856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ry1zHYNDTsQJF9OfZEXfWbGzxNquqJ4GTL12C5DsHAE=;
        b=h9cEbd7SMZgiEOTt46RpYlyFs4bzj0IV6Yh5KYZ2meMCshF72nLlQDd+WCi3Ansg7e
         oDDVWVIu3C20jvEyRrOQZX3o6nId6YHA/j6dj2XRF8Vgxuz2LCLayGuFgvr7OG0IHYuv
         acuECooinu0Ck8Q8UAUu3Oww6mJ1RbEwJBlK61+ze4LV2mhtGU6Uj+wNu32x8yJjGmx7
         p8Cte8x1JPSrfR+ex7jcocPNBy0F9zWQGIcQqQXl3rK4pMyRMF2lmYDM2tswix9VSV37
         3KeSK0kdO2VjarwrCNPcDpCW5lqSANwbG9OKQZPxaeoH/NbZSOeR8HcLq8JB1NMJS7Tz
         LrAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785498056; x=1786102856;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ry1zHYNDTsQJF9OfZEXfWbGzxNquqJ4GTL12C5DsHAE=;
        b=mi2aSp1bQvP0DqJ6BEVfUo39asGkiUNHcMsLancGVpN6lZjxAzHyT9PwSWqJDt1Mk+
         ww6l5hqJ8CwU8tBq/5y07EXbnxeqkgadsl4YM2PMkBPW2qJqmSJhm+JwBKlEtXkU3lY5
         fcQca7UUPB+aX0peKo8m5RnFZwOs0FADtFmBASWwpy1tt+hxmk074WiBMQj3hbmgJ2FB
         AuFHuH6wCnvUykVpAZBSa9kLrQp2QkS/aFh4tigD0KrDfrVU8KR518Iu210LfVGNWZ/T
         QSDpgkh8SWp/WXv7j4mlM6NDZ87aaD8dd/AS64FugKCuqAS2yNTsAIEGfbSN22cla7IF
         1WaQ==
X-Forwarded-Encrypted: i=1; AHgh+RoM7i8GQKRYR47gx0b7L8kB+xsqqNUS53UqVT3J4xryxLGw8lUY1tlwKv3cxQDc+FgittaIzr4Yano2F2u1@vger.kernel.org
X-Gm-Message-State: AOJu0YzF402vX1ECRmSwG9L1sB/BYtsys0hCjVVgCKVsOsuIRjmWcomI
	jNxXFYshiRQ43TznYrn3QWfQMBeu+yN6KhcmAHDFCIxFhqVaT7AQppxrrGNl3+bfvt3Yu+Q+lm7
	u+WVmK7wh48xDlXd/UfR/oUkpRcuXJV4XXST+u8F1yPNPOSRM+ZJZN619Rx67AM51U2fW
X-Gm-Gg: AR+sD13KIAnA/GZ5+oFCo8CXdbMG/+hYy8tkBDjppUzp8s1McYJjggDBUccP9WEYoLS
	ekvkBDD12td9ht7qe4Hrav8TaxX0IcBfkN5YSV7mTSVUSxIsdX8P4DzJhlv8Y9z8sGg7vPRWHCN
	At9d3waMzODWAYPuV2ToOwwOHYofYWd0G4n/RBg4aW6Ry5LD0lroX48vC7PNIWfOWcg+lxy2hsI
	d45cEK7AQp7XoRLDoylHvuFsP/IyLQ7im10UNYGiPGNbntTok6wuuBBup0kAlBoIbh3e6Gs68qD
	Pu4EyvKYdIkXQckvnHS6DhHknD33DhC8+heKsuWhZWsCJNyN78krhX0sNR7iLj69OTzWIO3PNEY
	Jys/jDz+1sMhZqajpIlyNWNfk
X-Received: by 2002:a05:622a:578e:b0:51c:2101:f0 with SMTP id d75a77b69052e-52b4aee606cmr23337371cf.2.1785498055674;
        Fri, 31 Jul 2026 04:40:55 -0700 (PDT)
X-Received: by 2002:a05:622a:578e:b0:51c:2101:f0 with SMTP id d75a77b69052e-52b4aee606cmr23336971cf.2.1785498055318;
        Fri, 31 Jul 2026 04:40:55 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd44e9ff0sm105675666b.42.2026.07.31.04.40.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 04:40:54 -0700 (PDT)
Message-ID: <0767fcef-7f54-4035-9e19-421d6c8d5cb7@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 13:40:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] media: iris: take core lock when scanning the
 instance list
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260731-iris-fixes-v2-0-94c002016a09@oss.qualcomm.com>
 <20260731-iris-fixes-v2-2-94c002016a09@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260731-iris-fixes-v2-2-94c002016a09@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA4OCBTYWx0ZWRfXwifDjP2wxUaz
 lINnkKsrfzN0gR+poJfw81ML2ZyoVvLnVj9slUp7iURrad5W25/wy4q6mIWE8uCejbUVa6cdcTu
 MxwHQO9Lvh037jrh+/iaxT7Pkew45U8=
X-Authority-Analysis: v=2.4 cv=GpByPE1C c=1 sm=1 tr=0 ts=6a6c89c8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=cRjjd2jNw_HWXnLK9NUA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA4OCBTYWx0ZWRfXwbwN+qTXsXmK
 BmRyfbDCmdKtNCjZJcwZoYwpr2/In1n0ZXI8p+IW0D5+M74N+HebFUtEwLaRVDFjCJZisjUrpc0
 0A9hKTRSr1z9iD1SMX5d4YUaOJQOdee/37UYQmSVaWJg3q8CXvYCCQaRO/7M4k6HoYLDePA3Qc4
 8+Lf+iUXmUYIOKYUKe1noVZvrA63vchbl6TMdqrLge+Ja3NIfZ3+cO87AyHi6bNSYulqhgk//47
 0WtqIef4iVi3n48j3pfFljuTRaW/JthvcnFJJXQfFccPFwQBNXhjYZjKMi7wEMFAMcD1FPNWLFW
 w9n6J7ZZgeedKOW/xYtcQUV0p24IMmVfki1RDabROwRL/KrhW0bVULudYJ3JNxS4ctu83otqoAm
 So45UMTDJmMpJQgtrBtwvuHhmrXNLc/pcOXxo5HqFmSj8ONrp2bKJGV0gdoOOuol5WhLQYUshiH
 MQB7y8Gu730uppjIRVA==
X-Proofpoint-ORIG-GUID: 3cITL1qV5b9qXLTv53byGGWGjH0NLPzG
X-Proofpoint-GUID: 3cITL1qV5b9qXLTv53byGGWGjH0NLPzG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310088

On 7/31/26 2:31 AM, Dmitry Baryshkov wrote:
> iris_check_session_supported() walks core->instances to confirm the
> current instance is registered, but does so without holding core->lock.
> A concurrent iris_close() takes core->lock and removes a (possibly
> different) instance from the list via list_del_init() before freeing it,
> so the lockless traversal can follow a freed pointer and dereference it,
> resulting in a use-after-free.
> 
> Hold core->lock across the list traversal, matching the other iterators
> over core->instances such as iris_check_core_mbpf(). The lock is dropped
> before iris_check_core_mbpf() is called so the nesting is unchanged.
> 
> Fixes: bdbe1cac0c10 ("media: iris: add check whether the video session is supported or not")
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

we also have:

iris_check_core_load()
iris_get_required_freq()
iris_vpu36_get_required_freq()
iris_vpu36_check_core_load()

that traverse the lsit and actually end up being called with
the lock, but only implicitly - perhaps a lockdep hint could
be useful there?

Konrad
