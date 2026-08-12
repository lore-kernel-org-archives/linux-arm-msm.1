Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B430D348C6B
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 05:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786513346; cv=none; b=S8c9aGXB0uQJxlL6d2nZe8RkjnIXugU65fZ/LHjhW4hbyLiAQgVpXU5xyE4WX6or7eHDYPCkg4duEAmWL1DIEvt4QxErTYFaoOsaX1WD6P8tGsS7GpjlqxAqPBU9VvW9uL8rM5nSwI7Oi8QvfJRhJws6AdDRW9sPIdxmP6VbLjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786513346; c=relaxed/simple;
	bh=TJmIbi/bPbRsy1xUNDAat8Ug/Mq8nuNMjnCqm1a5qhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tvjSZ4CRqpphbs4+b98L23sgh+n4pC0DHB4o8rIKX4TibzWDXSpw66BTvdm+flcGJ94e+UAjvkfG4sAVL6mJasgUt7AKSW5YuyXmp+UziPzLU9SCB67TcEua0mAS3d8obzQ5ctQiG3gc0CSs5sD+gta7NX29DdiTR2vbH65ZVG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FJ123BgX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MnWLg8W5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FJ123BgX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MnWLg8W5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C4UjiY2449047
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 05:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LbC8YcgiRzyEWYo3Cz0Po5tJVDEpDrhaAQQ2DhHxGdc=; b=FJ123BgXaniXyG2V
	0tG2Dm0BSHHLERZZCz4VpHRCtxg499vglsky7yTX7ER0x2mmpgElVY0ckB6ueRMC
	Zwgr1qw/WOEE4zx4MM+kyzp6UrGsuHMOueg0ErqfIhKGwDWwxlPLw4SqKUG3rk6V
	PbfLV7K0gc9EJc3/Z/KgzV+xNU5PeaPlpQdTQKtI47r9sfE9BrcQDsRButNeHWyj
	RBWQ5lg1aW0Uads8wxyzaF2CQ28yOCmDzZQ9Fv2++G/B6C1CGjQorVoxlBz4W7mK
	71r7odKeImrVXlVkK4VVhdsIKu3eYdBJts7FOcEgORNaGdddypFpsBJbI0lNUG9j
	ZDmqlg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049kkpb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 05:42:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e22137fb3so808925a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 22:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786513343; x=1787118143; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LbC8YcgiRzyEWYo3Cz0Po5tJVDEpDrhaAQQ2DhHxGdc=;
        b=MnWLg8W5csOKCJJzJ8vT0o29WlBudHC/9wM2MNWk4LbBDe+LI/LDAa23gZGykYQ1Vc
         Ryda//vi5JmZmImmjVCFqhHDHnNRWNj3T2NdM8lyhRbLVFwXLSRtzaYT+PZaYt9bQ7lV
         3wGA1TE5ch6OjQso6qfMMvhMtkpicxqIVZG/6+4/U+UaF3VUz5jqoIRT54xHl8Nq1sdC
         JJJgFzl64pF5xnKlp7RUK7q2+JVOgcqVRFSk6qfDDB85XXxYWb6r6/5jJPvnkxHTS+VD
         aZZJw3DndC+2rbA37HXRGlsHyA2v5iVQusWwvaBv2DvunuGIxsDOsbrb/lWvxj7kXgEO
         Hn/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786513343; x=1787118143;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LbC8YcgiRzyEWYo3Cz0Po5tJVDEpDrhaAQQ2DhHxGdc=;
        b=Ukjnd6D4Eca2AWRwJYW2TzlsOmj7nf01wPMs2ACEUScMqDSzbn/Mx4X6cG5uqktMSz
         XOvs/K3w5ghjkvIzDhvlgrwbM9E3wLt2jK/yCuKy1Gh1YitsKa9b2sdOO1jBrVzuZ/Ag
         1thLk/uKTHSf9ysgHApARiay2q4oA4itsFTJMJpxk8gjf9pVsiySo14sXn8cJqSgT6Az
         320w1YZgAQEMcGFU0+mKKAlfuD4lVyyuVv9dvgnNjHvMA5TPBbCMxUyoVWnbK9nc2YJ9
         kYcJRHTwS2haXm1sS9woofP2dtWbxGCM3N+Vw36u6DxCbf1HQmy5laIJDckQB0ZNYXft
         BbQw==
X-Gm-Message-State: AOJu0YyIGhE1bTflBVKXYu05eFR7gm+ICb8/o7JkkebUh8UufLgY6AAV
	SuVjp3ISY1MKMoVwLKl7D8M6GhmnmR78WnUbCru0rj/sjyiAwMwoVc5HHMTe92fS6ZEpeI1MnrK
	2+7zds0rp3T0t6ThhKJhUc0TPLO4SzeCxUHgJpSdgjEj/FilAwSS/mkqpn0/rF/qUYAu+
X-Gm-Gg: AR+sD113nBcL0BHcv58DXXMlpPVrGCjz30+VhmE1XODKgMyz4TERL39zJ8wANNzZnBR
	1+b3miyPHN/EjMdBcEce7P8XKmnjkxMDFFkxqSHFuC28oLcyk4YVD5nkli1/hgd7roscS53B0Y5
	eFypmq3dVNjvEgV34qD4jq/HIash4xmlKnbrYQdh5P5ZKwFpNvJ7ghob3ulDyYqau0df0f1R7SU
	pbuBXRvmd5qAUtYYxTvypxzh2+EPmRZHSB24aN2OXVIpL1TqZD++N9rn+50bkyYWK/RLrlviqGE
	D1L6jCGCCvSHH/XnJcSUF3nzR7AMhWdLT+HKp2ItdFFQK82+b35ssMQ94THk6MGHD/6QMP5MFzr
	dSrIKNbm2wUnhokBU/ZJAHv2PkqjscxbTOw==
X-Received: by 2002:a17:90b:17cd:b0:38e:6a30:4bbc with SMTP id 98e67ed59e1d1-393017fd780mr2505172a91.21.1786513343105;
        Tue, 11 Aug 2026 22:42:23 -0700 (PDT)
X-Received: by 2002:a17:90b:17cd:b0:38e:6a30:4bbc with SMTP id 98e67ed59e1d1-393017fd780mr2505137a91.21.1786513342679;
        Tue, 11 Aug 2026 22:42:22 -0700 (PDT)
Received: from [10.217.219.92] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f933f5e3sm2130026a91.3.2026.08.11.22.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 22:42:22 -0700 (PDT)
Message-ID: <6d56d5e6-3a4e-4f27-9337-9a9b79f16804@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 11:12:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] spi: qcom-geni: Add shutdown callback to quiesce
 hardware on reboot
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, chandana.chiluveru@oss.qualcomm.com
References: <20260805-add-shutdown-and-panic-notifier-for-spi-v1-0-b5db170d491e@oss.qualcomm.com>
 <20260805-add-shutdown-and-panic-notifier-for-spi-v1-1-b5db170d491e@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260805-add-shutdown-and-panic-notifier-for-spi-v1-1-b5db170d491e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lVEA7ouy2oZcO3xHQzKEBOG21R_9iQHN
X-Authority-Analysis: v=2.4 cv=IO4yzAvG c=1 sm=1 tr=0 ts=6a7c07bf cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ay6fHbYERNCo5qgovOYA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA0MyBTYWx0ZWRfX3/Tl5p7xuGPw
 DO8aF/T+C3NIU/T896oi2OgYD0HyTmelbvh1WZ73WDY1cSBJyk6P4YUQAcIBxfK4tj6LdNqlS7m
 gknwtT6jVpvtUvMEMioBHNCJU2Es+ArdwDbDVeXG1GU2WkkhmFqGpXG4hF/6Mhy2ailEhQAnoCf
 3qpZO8e/LmhvTITmttxXzwj+m6g71lRMbo8t/QxFZ9840BpxMUELQcn4cu+CACjJ1anljr7Cgki
 5D+xMPWWwUMyV/fy0iZ0MeVes3M/hTFSP+vUhhPsTJfnBAHWhiMByS8AZttJVwCpSFCJay53/vQ
 fSuFy1QYdrtEqjnGv07GQs6p6l1btjAevgSJOS/vtRR5XY5TiFoaza9qR27OyagN9Qna4b0ZBGV
 zwRgSBJ/Sf+HIkSAydjjz1wtcypPBuUHaqZyRv7fbbbvBKBCI8sru+lsdWFmIGAu3VMfHz26v/0
 ZgUuqTeSP5tVUSKw7sA==
X-Proofpoint-GUID: lVEA7ouy2oZcO3xHQzKEBOG21R_9iQHN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA0MyBTYWx0ZWRfX9jYeV9k7Fhd1
 fsuqoHZ8uvMZo9yMNmX/0X8AMAHIx28OSQE5tC9miLJMSJkWR8AviPJ+EOkPQeiiBkCmUqLQR9y
 BmS04Q58z3kOoKt1g+8jy6e7ZeNyttU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_01,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120043



On 8/5/2026 4:12 PM, Praveen Talari wrote:
> During system reboot, an active SPI transfer can leave the GENI Serial
> Engine in an indeterminate state. On VM-based platforms, if a DMA
> transfer is in progress when the VM is shut down, the SMMU can raise
> context faults as the DMA engine continues to access IOVAs that have
> already been invalidated during VM teardown.
> 
> Add a shutdown callback to suspend the SPI controller and abort any
> in-progress transfer, ensuring the DMA engine is idle and all IOVA
> mappings are retired before the system resets.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

Reviewed-by : Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
