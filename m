Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7D947F770
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888121; cv=none; b=Wrr1ZYmFQYflmKkYYb5tLUas5Ar9wVuAMnBNrJ+ZI9kDbMz5f9n/g+R/bAHulLwvxf6v5SlD1obdw+v+MP2KdRZxX2oe0ErNhv5EbPYI1MjPntZ42C2miJ5hVpfI+4vRvFjIO2caXGLlqXkc0xv4E27mNbSbjMqUkTyp/L8k/l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888121; c=relaxed/simple;
	bh=25t5Shm8jjOBY7bq5UJ8UnAaGLeRkAXQC+r0by3Ebbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AniVXGn5AcVNvnK8yQJFlspk7sCRLHKh95RVX6vkhGa3s2ALK4/YWTPYDFqFjqF5wx05PO3vI4uojPhcadB4jdGph08Utjl5OSkPWvwYAzR3coVIL1uatlIk9mtoxstZQ6uxAdFIg23Hwq17t6dyf+mR0oO7BV7qHDd03I6ho00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f3c4v/xm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z/rCz8CI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f3c4v/xm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z/rCz8CI"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8PCto3054908
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hYm7ffZ6kkZ9ZrD23lf7fbY8mVfzcRmka0qHDZVc8vQ=; b=f3c4v/xmL9JnOCRG
	vrDzx9NatQFDk3vf6tHQu8PFSkZXjNMjFpHg5tbvt4OWdCznRP3FZuWe+ALXl8YI
	SLAhZJCEV8EmC4q+aUI4KpspOqC9Q4j+MTj9R2AJnTiIvGmXbb1GAaRHrb9VWs7k
	AnxX/NvEL8YGLzizBrhQks/+T9AzWtpeJgJB9gskD0f2Bq/hrImUSeWBVSHws98O
	u76kbfNQCGxF0RV4HvhKaZSFl5KDC2N0qtm5nBjIHupM9+ngZ0APaBrbL2Rj0Ect
	Uh7uXfTIBnHcZRXJeiz5EMKWEZ8YyR7lEo9W0xzYsFgguM3X4z+NNrv7hQrpcvrw
	yaDqcg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h93aeuux8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:41:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5350d8a2368so6263481cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 03:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791888119; x=1792492919; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hYm7ffZ6kkZ9ZrD23lf7fbY8mVfzcRmka0qHDZVc8vQ=;
        b=Z/rCz8CIvF+PmFQKxMMejblCAGIwRfa3+dZ7KisDWaD2Js/XLQjlq+5VgrBq8qBskm
         vgter0chsXQOblfT51l/bg9paOqRW/bV29m5xQHGfnK5yjeda6paGgwL+DdTrZe2Qt5p
         QvE+aRSImuSkyc6s/wfIHrB1NXJs26No0IxVlUiHg5N+9pm3cqSxRSX28DlB0abYWsyO
         Y4VmKxlXl6DgksuoywPGbnAbZvpllkEuqd8m+RKRfPKNH7bbU0IcMSR7l0ijjn1vPB/s
         fYLnYt6nHAew5aTstrskn4Znni4My4IrCvYwOdwbHtkYurmHRJWvH3FDa3modJGeKDZa
         dVvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791888119; x=1792492919;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hYm7ffZ6kkZ9ZrD23lf7fbY8mVfzcRmka0qHDZVc8vQ=;
        b=W8l/U1/yCnOcGIjHVAFCB0F02wG2G6M1iq78l2huXYtLd2pcnqZ0r5npaPKgUs3zal
         jK0dxZyWWq7s50qqST5pcm+P/Yj0Gw2kvMI6WO57/oGlcpcQrL72+ux8vkFDBgOUumBd
         dVU1oeSOdNjInP3L6OB6uMQIxK/zfZLwCaYIk4AvMBOG4N36e+2eJSnvk3MN7kJBylra
         oVuhTFFBEveuCpKTeL2dzi+ZLjTsgtqM+TOV6XnMi29ps9SEEktZP0HxYjtxKcrOlGiS
         SzjUL7Qnjqco/1Scf2mmBgrQQ3iwEw84mrNSBvhFQbt08FWBP9xr8irn9msWbTMrVNUL
         YFXA==
X-Forwarded-Encrypted: i=1; AKwUvBwEa1vxRz2K7DRMFrlnHtxoxNl+fiM8PdrKUkYepZfOX3Rr+LRwFNq+3jEZ8Tn8b+j79v8IQxRBrxc6fy3R@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3c+rnmViMdeQ4jbtd31XvN7s6SNiDngnNpsdYJBOyGNE2KrFk
	GDb31hd4h67OQrbqiz37j/t+JUXq5K49GSZfRMqHFgrycIiu057zhD6qeheetBrHQZxjogfOSML
	F44ftOcA7vqTt2flKHLtEyYQxKG1+CfsLl/9Z8MFVkUAqNclcqU3nfbNRKAFO+QEmari9
X-Gm-Gg: AYBFou0aSKkvgr0C/nEerRMV26fjWq/cD2PVUCWwRtr+6qd65bF+xsEQaVm8jw1E1rl
	LqTndmZ+5Yjbz4dAqPROplXf/JvD3XJ/6hee9fDPqtHXd+Kr9bpMbBN+qNw+bt/mzhv70epfas1
	CKkFeEDNIGWWzLbeT17wyKJPZ4wG+xKCZsiK35rmGM5JacdoXwtQRW5Wh2JKarGY5Fd+8qRUHxM
	KmoqLHO8DGXNDJ5h1LN6Z/Szt22y8JUmHeYw8oCb4a9s6SiYcAK2rr7In/GKsjL4budA2mntVsi
	2JhaDgHqFTHMwFMuhEE3ZQNb6NJY4p2ks/qI3bz9ItxAiB1At1HaJAo0WC40UlJL1LDuV/awnlK
	eednByLmZNcAXB7hSvWYmvg==
X-Received: by 2002:a05:620a:19a2:b0:93e:54d2:2283 with SMTP id af79cd13be357-93ebd2955edmr2149896085a.6.1791888118808;
        Tue, 13 Oct 2026 03:41:58 -0700 (PDT)
X-Received: by 2002:a05:620a:19a2:b0:93e:54d2:2283 with SMTP id af79cd13be357-93ebd2955edmr2149893285a.6.1791888118286;
        Tue, 13 Oct 2026 03:41:58 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34001fbda1sm293208166b.66.2026.10.13.03.41.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:41:57 -0700 (PDT)
Message-ID: <ff148816-f24b-476f-ae79-5161a8e7d8eb@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:41:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] scsi: ufs: ufs-qcom: Don't define variable in the
 middle of the code
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Martin K. Petersen (Oracle)" <mkp@kernel.org>,
        Can Guo <can.guo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
References: <20261013095924.959455-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261013095924.959455-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: buCDL7P5TjNUyTUGm8sjpq75NDhYzB2g
X-Authority-Analysis: v=2.4 cv=JJuuIMKb c=1 sm=1 tr=0 ts=6ace0af7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=bd1Yv5s-Whjvz_XX:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=bLk-5xynAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=LrPPbbfl5yCxfJx9f8QA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=zSyb8xVVt2t83sZkrLMb:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MiBTYWx0ZWRfX51AHuGPw8qPJ
 qlBamwhB3/Rl0aKp8ObAbs83aAlnyoXBiSag4Yfky7Hxcx4umCLgaVxjBiRWtEgOy+TaJP5ltyP
 ac+LLfjuG62x0YbtEqV7Gmo5YhAH9es=
X-Proofpoint-ORIG-GUID: buCDL7P5TjNUyTUGm8sjpq75NDhYzB2g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MiBTYWx0ZWRfX2xO0VIj6mj9Q
 hLt9nK0OfoCXLSysD4pM5w+b+bRhzqju6n9X3XcW7I4EmJ0vU6UCHX//JDOepFAos+gQoRZA3ac
 EkVRH1vPVleAmaiD2mSeotk//QLQ3K5Z4q0Od1CLvcE3XlK3CsZkpdb4d6bBad+LdyaxkPXJ72s
 JIyw8RuN8goHfGBp3oPOiysj+6mS4mRqmi+ViAB9h+KM1CMysTyBJZ3oM2OM9YOGv4XVYlQvCJ6
 +UareO4H0Cf48tybL/gzU56yyZFBiNHp2Mxk3LL5LDH2W5+Va6k9adPwgq5B9rBjyrGBfiNf1WC
 HxPOC+pJsgJiEtOPLl1ch+9qnenzzcLNA0a+2YlAQuGn+wljdn+r9so6VI6NgqpptrWbBykcB4L
 ofUZGvQ0y0C+qRCmrwnAwQeBoerGvLq974vx5bQlOyCPZek5IJqbyQCKh1aNFwEiCXTEljmU9fB
 d0iB0POf8YbJkOS8o0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130042

On 10/13/26 11:59 AM, Andy Shevchenko wrote:
> While the C11 allows us to define variables in the code, we do not
> do this style (see more at [1]). Move the declaration to the top of
> the function.
> 
> Link: https://lore.kernel.org/lkml/58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com/ [1]
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
