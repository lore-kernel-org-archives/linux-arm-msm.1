Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B3339768D
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 10:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540693; cv=none; b=gGPkNVp2c4ktG5pOrjpxzF9mrG08oI/QVvSuNXj9KWSYy4L9e1Y0r8GxyrEDE9Irz86c3sDx4dsphh9TuKXd9xD412/DNmb/WcOhyoqHK0XSwmXHQtHT7GYI3eQ5H3Sz6Exec/EBebSmgN+NGW1GMJdQMH2HnBsxObpfyn7QkMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540693; c=relaxed/simple;
	bh=PJiCTK+xZkgf4C9ajys4XEZDwBELG3C+cWgGLnRSAMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eZADZUQU6dO/l7ZO5Y3rUiij6W16zvfxrqLPVCWeAc2S4hiC7/x7++4Cz7t7coPP5/E1sZAYNBeQYbTOMDzUSeGHZ6PGXrc80GD7w9KIuLmBnY1+N+4eeHmeeXCe3h+Ffateh3PfnCFMxUTA8+sYrom50IG+pKqqy8IlqmmSRKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B0Es9AhR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fXVZ7D0H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B0Es9AhR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fXVZ7D0H"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KOTa3977816
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 10:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9hWw6ijG79i9KKO/GsUNkSlod/iFx3QaGdrECeuKXoE=; b=B0Es9AhRU0OYIAlk
	2jrbzCTxp6K0FjJNYQif3bdLi3/+BMe/Plku3+XP1/VCNoEFxdZMLIUDK5BqBu1h
	N8OJd9XcXIiD5s3jifoP5H7gtBCHDfrE3waSj9uJ75COUzY+wJOy6w0d+Ji4e5bK
	efGGqeu01JuV4zwRNbFGRNXnXkKhcPtp4dZ3UQ9pQuXx8ur/BMRSLJJvQEOqYJ/v
	8zRTvbvdsu7lCX6N1+8rVq8glc7zeCWqMUnZQ39LqYBOsXMJ7LHvrSTmYQZ4PGUJ
	qf/zeCWMgD7LkRrSOO1pkPdghqxpNi4FkHOGwflHQEw8n3ed71QowJs0xypoqVT8
	qMcx2w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ev5bb1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 10:11:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39deda201bcso9570915a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 03:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791540690; x=1792145490; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9hWw6ijG79i9KKO/GsUNkSlod/iFx3QaGdrECeuKXoE=;
        b=fXVZ7D0HQ9WE61nGBcOPLo4AW1aCA7AdQi91XCa19zD8NbHJwD/yUJ8uZgYGhBUG9n
         i6Y31mGUF9D+Yt7eA4u4ic4dMgdj0eHjQ1Uu5dGzAvQ1+50H23ChYrJDjCqt2j0X/Ceb
         g5S82OyssgPjGBwOjfnM6TrqUaVuArImoI6tHrFHlk7f57ipNnVgcZJJntkiCUbEPAss
         UhiXcMrSHsLQVFi3EyIQ6TPMV0DaUlyW0f1q5ZpfeZ/xJo+wBxZTn5qlrSYWJeLVe6ZG
         B3+gY1PAz5jozftnul6LfWMjgldD3/V1OfkpblvMte2NlsHKg1JX2kmr5KiZC5xR3p2i
         Ycnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540690; x=1792145490;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9hWw6ijG79i9KKO/GsUNkSlod/iFx3QaGdrECeuKXoE=;
        b=n9jXnPulhtNUaTHh7QyWXk/Wi/pAfzov6twXU1HckdhP8UDYblnza1nA19cjCyk9V1
         eN4xSGJGeL1H5vTj+zBh249YERe/nAEBDwls8bdp2r/V3GJdi8HncYSeY/1G2wzkF0aD
         2nh60SDnG5QwJ7YJ2OwY3BqHuwfAQ7Tk5rbuvZflnwNgSNJdVIg18YArATm8PL/XFF2r
         751/H71V6W61j8m5FKqkXjEv8B+QHcYrFrjNBJ+y3fhai6hvmAYLaOhC2rKssP0HjnFN
         CSr5NB3xT806Y1iL1kjfE4LagTMIxVr4QtNw162cR92Qbl7BwlAJdEpVoiW64e/cePNY
         9IGQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+8BPT2vUFQ0LKJsqfczBO9y5aO86GASMwGs2bRx6xc98U/9OMhuvvKM5uxXIFTDG5SUZaY/JLo0VBIpPm@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9u31FDoyZHGoMRyWh4XJKVi8zEy+UfSKWZ2J3JLp9N7lpN7tN
	TId6HjFtLO/BIrO1UfCDLQfoyqP3BjufE5h6GV33P1ysg8VcitrS2PRoSAGZYYMJ3XRqEx/n+vi
	Ki7JF/1x0dVYGTR1MkEgRQT2fr33Cay6q2aNPrmdGULuGS7R0PyuWoCb4xv+oNgmTwI3U
X-Gm-Gg: AYBFou2Dj7q7sCLu3NqPM2RPY2mmqAOOjJtUEdssVSAiNNfhONrbFYbqx3r2N4uCOb0
	FHAoLyGPYd9IYG+Ty4V2bpWXNlamdDSNRN9GmWs+3iG8ZvaXaly3MKzwL7mcwztYfm5ZA5qCbQn
	UKtRjtFkONFNotn/PgQU1ElpU0QSYTnETB9I8HKgPQOAaGkFdLODOZOE/19RKg+H6MrH/IHCtGV
	sFylvCOsIikGE5gQ3grXWjJHbuZPGtp8CyIq0WlJD6eeu3QitCBNyfVAttk/iOW4X89gPez8P3z
	+T114yNA2c6EXeH/eCnHOm/4R1gJvHY3qEhhwECPpZAZYJPasxdGseR/KUWAdMNF/6Q1ZGUKj6+
	IXvOUEyvQcZ5LtXrZ012tRQ3txVhNz5Yq
X-Received: by 2002:a17:90b:5887:b0:3a4:a383:f9cf with SMTP id 98e67ed59e1d1-3ab3a9a78f8mr1583039a91.38.1791540690343;
        Fri, 09 Oct 2026 03:11:30 -0700 (PDT)
X-Received: by 2002:a17:90b:5887:b0:3a4:a383:f9cf with SMTP id 98e67ed59e1d1-3ab3a9a78f8mr1583010a91.38.1791540689904;
        Fri, 09 Oct 2026 03:11:29 -0700 (PDT)
Received: from [10.218.39.50] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38fc9e52sm2744168a91.13.2026.10.09.03.11.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 03:11:29 -0700 (PDT)
Message-ID: <40fc4ba7-c016-4b91-afdd-5443869a4b4b@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 15:41:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] iommu/io-pgtable-arm: Add support for contiguous hint
 bit
To: Jason Gunthorpe <jgg@ziepe.ca>, Daniel Mentz <danielmentz@google.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>
References: <20260921-iommu_contig_hint-v5-1-e7fbd1c3774d@oss.qualcomm.com>
 <CAE2F3rAMAnV9+WNLZtGQX6cHPsZ6wbfRJ1Z3d5mF1+8WHL-uMA@mail.gmail.com>
 <20260924225534.GD16465@ziepe.ca>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <20260924225534.GD16465@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0MCBTYWx0ZWRfX67QkPsU1+mP8
 W4f4p4LzYAqPL42OgAXWmm8JTw/7loYGGMd5LNWtIRpizDG0/J+plFebq/X0oBz5CT2okW1ky/g
 ZHZK4LRtRLJCfr3jwpis+EbOgkN/uUg=
X-Authority-Analysis: v=2.4 cv=MMT1C8Zl c=1 sm=1 tr=0 ts=6ac8bdd3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=_TL2m7dhMTXhWvRYaIYA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 2uf7dehPX-eiHCCxmTe1p_Vt5Lv6D9HF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0MCBTYWx0ZWRfX6STrNzLk9ckH
 MpFoIxzRIZ8QeX83skukM0Ftg9Pkvt6J/odq60K6e5GRQNyFksWthusbaTOE2ixiZF5ss9hHSxM
 aTf84XGtW3FKyETELWNk4fx0TqrmYKbc/+uFbDzj3q/G5IAExDMe9OpPsepd/moMp+ieZ7TLVZF
 tsajPHb2xvy+PntacE9EsuEZXBjKGrbVyFDmh6ab18xjOyMth0jtTJa2kkDvkAcgfkk5YulXqda
 msStkI7zV4XYQewtkCNSkQ7RvvSb3++iWg3JQ8bBBY1NLFi+CL4P7Ze/6AjuOmnTmmuP51jNRat
 sj8z0hoYKIUF/UpqhRH+3qCP0tAX8GBxVlNL2bhKw5TxKuYYeZsNixKWq3DyrYdhvX+H9UkSxBh
 WJ1/2GhYv1D9SgLn55YEb6a/QKGDVBX4YeGzHswri8b10pO3q2MXXEXuilAty94V+GlKa/fvKqq
 Xdo4poGHUPJmX/6/6aA==
X-Proofpoint-ORIG-GUID: 2uf7dehPX-eiHCCxmTe1p_Vt5Lv6D9HF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090040



On 9/25/2026 4:25 AM, Jason Gunthorpe wrote:
> On Thu, Sep 24, 2026 at 01:36:12PM -0700, Daniel Mentz wrote:
> 
>> Interaction with Hardware Dirty Tracking (IO_PGTABLE_QUIRK_ARM_HD)
>>
>> When Hardware Dirty Tracking (ARM_LPAE_PTE_DBM) is enabled on Stage-1 tables:
>>  * In visit_dirty() / arm_lpae_read_and_clear_dirty(), dirty bits are
>> queried and cleared on a page-by-page granularity
>> (iopte_set_writeable_clean(ptep)).
>>  * If a single 4KB page within a 64KB CONT group is marked clean while
>> neighboring pages remain marked dirty/writeable, the descriptors in
>> that group will differ in access permissions (AP[2]).
>>  * According to Arm ARM D8.3.1, all descriptors in a contiguous block
>> must share identical permissions and attributes. If dirty tracking is
>> active on a domain, consider whether IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT
>> should be set or whether CONT sizes should be suppressed when
>> IO_PGTABLE_QUIRK_ARM_HD is active.
> 
> This is right, handling dirty and CONT together is a PITA. You should
> probably make them exclusive for this simplified implementation.
> 
> SMMUv3 is the only user of dirty and it will switch to iommupt which
> does all this right.
> 
> Jason

Sure, I'll set IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT when IO_PGTABLE_QUIRK_ARM_HD is supported.
