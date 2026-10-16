Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5754734F2
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 12:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155283; cv=none; b=NTnqs78IORQA5Ji8aht13OUtw/6M2OFxbU9tvvQmGFD6QaYVXk0fqR6ZQPzFQHVbgpBHwvVbUlF0kHqFdoMrRazu1ySfGfW/CDasO9ErHM4fEswJxiiNln3uE6EfnYwWLtY8LHXd+BI7VXyGhZo0+iZ5lrVxOYpd1ZVRP9h3eko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155283; c=relaxed/simple;
	bh=x96yRi+rg72nO2L3bIVmQsQ6SzwyjfTCHUgMt0kpwJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mUVtKKF3wK3ETlGGd8UuB4yueNaI9rMuOZ1eEyL951vFRekMICsWyyIwnMeozXWQD93phPa15jat82QGfc6qgLcBBo3Ikm2AQ9WoZLx+kyuZmOqRAtFuxoqCZKBeP4llWmOA+0OHX35KJ6EjDh+z3ZEAUm2r7kiFyFbsRS9TVnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TW+N774G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KDyReAd8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TW+N774G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KDyReAd8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAAL40488576
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 12:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XO8v3O2VsXW8MiGFrpI6qTd/A+X+oiAypVl/y9s5AYQ=; b=TW+N774GsmFf3Ae0
	R7RfnvUC0izCPo03cn1m4VU5C4hu2AjW/+vvrKO6z7PGzPfOn1RwjjmUXCnCCgh/
	JCyZ+o52FRf25aAt33f+zlYKY14XDelzPEAKeWdrkg57oNUtZSvsMlwD41ZKnsDc
	NGM/gdCtmdUhJPL0ULfEPSUnfXw+SegxQWkhUBkFLTRiKurA+i67pz/nZytTKKiN
	59RfDvcl5BHOWaba0037OETWiowYuVC3fa04Y47tMuAiZ1v9j1YIv0Le+0zt8bDK
	uq+RdTcsEtOGuoTJDMHEdqwqPwMzfETJTs89hE/QO7s6+FvhoBNTa0HlR0V47JjA
	jv5v6g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbcjt9w1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 12:54:41 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3580c07911eso16586624eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 05:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792155281; x=1792760081; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XO8v3O2VsXW8MiGFrpI6qTd/A+X+oiAypVl/y9s5AYQ=;
        b=KDyReAd8Nuxch1yBO4/+t74xMLxcuUlwUGdvkitE/1qOtiMDQARU39TbbutaGxLwUc
         u9CGkGm5rn22Q01IuuWV3POQLnIDwqEIl408R4Ky44fpPfMBDl7aHtZJoOoHl+W57DOG
         TnZg/BMMaLyrcrO6R3YtW4Ddgich1j+4mdhM3XHaXVD1TMaZzhDOyP87kKM/d/FwtMRk
         CYCWjnKV3IiKbleSVLWbiuJSAUNqMOAAwRbgxa+l0nMpUBkGDOsNTJxIgxt50fAN8uf9
         6lA3UQCGv3j2ep84pxudQWR/5B7Cd+SStveAy2I0KK0BzcX6Ef9nSaTWG3OwMncyH/oe
         trVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792155281; x=1792760081;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XO8v3O2VsXW8MiGFrpI6qTd/A+X+oiAypVl/y9s5AYQ=;
        b=QRi2iyZZL0fiYi8Qz7nGsJUJrO7a9ehaRWGhrkkV/zn783xsrC9LXmpavzfzW7mMIT
         FT/6PCVQUlXsXJkS4uHZTj/A5Op+d1r/rg6b9n+lgfHR4lLzPK2nZuKCHDD66DruIHrv
         g6qA2efE/ZLMQIQlUzqEe1aV6outa0YAgEbDvu09Fug8SE/S8x5hTD8Zqo71yKjSkFIg
         p2NUxCTMxGpeZ8/s3QUn0n5LOeZ+BKrCaUzMRIjDGYRpODoOvHHgvkFV14zBE4lqQiwa
         AUqWyOI2JC75ZQ7voGHpCfXXO5zpFnSXDUgW908UVKdA630fi2tm5/P7lzl5LyDqP1u6
         oBeA==
X-Forwarded-Encrypted: i=1; AKwUvBzRRoO1vqhi3jAoL8RwXBn5fpboxKClmFSBeDpMSS73nTsNN76qFS3fTlIwyQ6Q4G4xm+8yHbcvfRzq+sgl@vger.kernel.org
X-Gm-Message-State: AFq9FYJqbn+P/RmiHVjGzTBvixAkIY0crrninUeREvwN+FSwwrVJ8rUJ
	Es0CES3H/EIUl3JjHzY+i7h35cWUryFWZPXnKHErBX7OrXEv6G1eqZk1agu690Nbi66//BrSfkE
	JX5sA3lO7S+rliZoTjpSBACj58lX2danEMbnmiNPHpr8Wur1dxrFxdDkpu61G108cssBT
X-Gm-Gg: AYBFou0nVc9sgr0q9kJ+aj9CYo77rVrKWWPlJLZndIgID35OZ/adVJbN9Zlvv21QM1p
	9/Zv7KBkev0OH2qAEt/VxJ3OqNesUpOQnM3epxXonPLUwpeBZgqiceseVHI2u5CL/xo7scxzqiv
	51DjdO8x6GJ54pVHkJqSmuQVQYiAlBJHM8Lz+FDRsDrtg0GjobxYhbNaJy3lOUgUJ9qRyEJUKxg
	8uwk8XDbY0h6HqWQY/Ddk/7a7+qsk3cHx/A26TTDkCS2bqA3HpLY7cANpN+GOAep70WLSdcHJb7
	CacH1WJupC8cD7CJB75Pqq0rTD3w4qpu+jZIJkyuJz+HVC3gL7zTXN11uW+iUXErfZzwrllBS/n
	/zyMvqZtYNudbaAwzhxrpesB/GmsLVg==
X-Received: by 2002:a05:693c:8959:10b0:35b:da8b:f88c with SMTP id 5a478bee46e88-35bda8c2195mr17030971eec.41.1792155280687;
        Fri, 16 Oct 2026 05:54:40 -0700 (PDT)
X-Received: by 2002:a05:693c:8959:10b0:35b:da8b:f88c with SMTP id 5a478bee46e88-35bda8c2195mr17030931eec.41.1792155279953;
        Fri, 16 Oct 2026 05:54:39 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0d391sm7184042eec.4.2026.10.16.05.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 05:54:39 -0700 (PDT)
Message-ID: <bea6d8df-88b2-4f03-9da2-1be7d5788d1e@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 18:24:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/7] tee: Add kernel client object invoke helper
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-0-1460691b35d3@oss.qualcomm.com>
 <20261015-qcom_uefisecapp_migrate_qcomtee-v5-2-1460691b35d3@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-2-1460691b35d3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1MSBTYWx0ZWRfX14Cd9s0+DQLs
 0AbOzBvmaD5CppRpwD60HI6e+Yr8u114hxANHpTV+CXHpoE/77Hf+GypFIqBIlnyoaJiq7O++se
 Thx0DaywO2o4Lw6qI9dN9OafKoX7Sj4MyqXdwzO4wvmDHkGv6Rj3aj64ti5d1rZfh66CIrR0B1D
 Yy8rvl2b2rg0CLA175wmBzn8deYMWCUF0dGqNNtMrrvY+JUEtTJjIVNW3hJ81Jd6eTfWvqLftJJ
 hBDv7Wbk0g77FmaHRj9M+Dpc8iEVYBQYnHaaBjTFEo/zmqorkBE2FBNdrlptxknKx37ttYkV9nV
 Cc4LrOa4ns3zM1YK/fceZNhsToFcM/OXCH9ehk9yWv+Y45bm/7OJ8RSC/0yNDHSEQ71wWYCjdzO
 oS3PG15VmXgOCNhu/d/9QYL8bgr3gQ5toOAc6Cph0DNoWg2q6AKU7i/SYLziB6pwwa8sK4LBRg7
 AuHAwVnue37+1QasGqQ==
X-Proofpoint-ORIG-GUID: rcutd9gaNmvARWvjJK80o8q81mdwDfhL
X-Proofpoint-GUID: rcutd9gaNmvARWvjJK80o8q81mdwDfhL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1MSBTYWx0ZWRfX6e+k2xHXtuZJ
 Yd5qaxHy5gdWtmk1zJ8nXGoM+6J+jVEwpytRrYnb/LW9jEhRMw1nHVnv/I28XrtcznBPZdpdKse
 O+QvtCxwb+/i14w1zIkGdkqFKjvorYM=
X-Authority-Analysis: v=2.4 cv=VpS2kO2n c=1 sm=1 tr=0 ts=6ad21e91 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=IkwWU5-DNg5bmC6MlS0A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160051

On 15-10-2026 17:09, Harshal Dev wrote:
> From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> 
> Kernel clients can open a TEE context and invoke regular TA commands
> through tee_client_invoke_func(). However, there is currently no
> equivalent helper for invoking TEE objects.
> 
> Add tee_client_object_invoke_func() as a kernel client API for issuing
> object invocation requests. The helper checks that the backend provides
> object_invoke_func() before forwarding the request by setting the origin
> as TEE_OBJECT_INVOKE_KERNEL. This allows TEE backends to support
> privileged object-based calls from the kernel-space.
> 
> Co-developed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com> #on Glymur-crd

-- 
Regards
Kuldeep

