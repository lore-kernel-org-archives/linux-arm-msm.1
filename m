Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793367938;
	b=0gTMz8RopPa303IU2Vx69gQSMqjPkekj0XMsQaQvjwrxoiFFWMX3sBSF2HQphuQ2codz
	 lJ9xtC9hSifx2HEUcQWTz0GqGxjCunNNA+1J1uD8IgWEmQfNmztIrOQrPwEhjgWQP6CNW
	 6gAaj7AjZC5HAqs/wokqgAaUEzR06QVenU3ZHXfL2w1hCoh5iVBxjxeUoWuS60WcO6ljz
	 OXg9eZV9kM57tFcIlWWvu59+kukbrLrzPGpRXv7VS3qD+g+PSB16DO/wW1pVDkab7sJzb
	 R/kpY+TwZVmsEbVbQGxfDKhlDEDNavdqg7Izc1VAG2+jBfFSWP0qZq6aQeRUO0OFLLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793367938;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Z7RefKSkci+uXJgzjfw4jQaFdMnrtYZxZse0l14l6vk=;
	b=oLJIVD72O6yC4YGIwvUxVmsB5ers23IGkdPTLFj1lJ1RNms5YhpfKPK+TPVC9vA8r89F
	 q2Ehh3uQw4QdZJLZwxUGf6giRyO2c67YUBC/L3lcDS79I+EFg23uGjK2M/GALJw6F/vmw
	 oXms/L+XY5ZilfWQuGte9f8V71imONg5rr18Y/jjDz4UHqpq0jjV0AxqyTX15p5Up1lrl
	 il0gJBy8me3brBza4qnm6Nuh4ccZl9pc0505jXu8J9GJpD2arK6+bpfop3vtfNG1GgaGO
	 cZyLDZa7ctBEZrpzEe3WZcl/kaEBJBUSRfZVooPIJeg5IgV4vAPouxjSgbfMuWYiroQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=maEvt2lI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LDbQkm3j;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FE1606A31D
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 13:45:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2FE1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=maEvt2lI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LDbQkm3j
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBFugg4116358
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 13:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z7RefKSkci+uXJgzjfw4jQaFdMnrtYZxZse0l14l6vk=; b=maEvt2lI8k4WY84L
	2oduaH3eiBaN1PC8OirEJ8hnzMjqnOyAuNt+MLUTGW98VT5Z67r1tGFybH85QFO9
	ALwXULMC3HpNpDZ02BRx2IHct13LbBeq/C1526AP7zf1fX+cjmmziAOYZIHxuuwX
	ImJAG0dApv5lzacusWc5COfnRIzX4mh/pllhp87To4Qsib6jBHuTnPX/Kc2h1Wzn
	Lvm1azLIYh4tm3+oG8L5GaaZgT8yCDJvDw4nkAlJfI6PZbKflo+PkUuIH4v01QF5
	H0jp+1zXjSinDYbqQ/z/4Mnzv4jwN1ewQKZ5k8jRAdWvr/gBjUPR0ZBwOiqc/9Vt
	R3oVfA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6rkcts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 13:45:36 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc0e22fe64so23965137.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 06:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793367933; x=1793972733; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z7RefKSkci+uXJgzjfw4jQaFdMnrtYZxZse0l14l6vk=;
        b=LDbQkm3jsyYymYWU8Z3kDiCmc6yYp2ZbT4MndaJX+vassacSsUAlM/O1s7mexxjUUv
         /N39WoyA5tiXTDhEnjGF0z5Xi1oPOb0ZWwjODPUiUz8JCEYjHrjMyYxWUwu42otO/9uk
         h20WPKdtnbAS/3AVhLGXKYroXX98D1L6F1VCJlIoUyGIPrgj/La0TvptPiTLaztcTyJl
         MBwxfcV7PBTWJKjUIBCg8OXoOr1kSy/e/BM6+okklatRQORrmdXbU6cFzFhBugMI6x4L
         3do0RzmOImDvZ5ZWObTP9LHUzx+dzB09BxYGfS9uieTYYtMyvm+3IRPoEDXlixZOTd+F
         aiQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793367933; x=1793972733;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z7RefKSkci+uXJgzjfw4jQaFdMnrtYZxZse0l14l6vk=;
        b=pESAzaW/erKcP0kthxS7wpfIaDGO4t6dFcc3cxge/fqiCxzJe88YdjsXP8AtZ2+wAA
         UW/WvEr/BkdxpgdscK5ynPvTZVPvWHcQzXFmPhlv2UUUKB/xTF6kx3SFnyYQ9kYN1Cy8
         AGo6LOFRYsRIK0EaFgkKV1VkOdd2YPO3cW+2xlWKtAkgOvCn5J+WzJnHmsNwNEP/0Iii
         mVajSnB83jBz3DqjetdfgGFsdK2OwPokulMCJkqA9N9dvX3qBzJEepjosRKxGBdNobaw
         9e8DEE0RqYGIfdsKGyOLogudzDwwyaGIulHUEk0Ln9Z52b1E/OIIT3uzZC1BFLo63TPg
         EOog==
X-Gm-Message-State: AFq9FYJuNQEp0acCIs2Er95FZ9FhTtHwiKh0thuf+um8gxGSvcXQ3vvX
	QjoxRyl76d5SgjqVLWiMfkC2FG0kfisRlOQvQTSj+pmSxUz1G5FUOg9CqcPy0DCQEWmUgsIEm8I
	FvSj8fqlrIRqFBhV9VP1hT1t995BOK4L1C14/Z2QOnLKWxSXnZ8jCIk8laO5SHWlwvzKY
X-Gm-Gg: AYBFou2EXol/slxC9hw9iRi+90JcOoKq0sX1eCVJzB+IR79QlCOZXB3EHqyfmotOiv/
	3aPRqrgFosEZrk4DRQu1giJKlSr0qhO9p/9NEjHqfWD/eGkwIxhPxIF4WTm7WXOVmjFf7+cCAXJ
	MuzJotmRhmeCSHDzFSrOEcT0+dExMbsA2lB1VWsn6km8f0fb2HWaJ+UAibm2yruZH3bjrKqIhU3
	Lx42DqOtC2bWCb/9VkrxRBIAWroV/QePPtycGV456beYVMsiG9+h1gVqcmdJmJlRDgupZb8Tq99
	rp1dPdmSOwva38KNYsVbJFhe1pCfuPLfqESl6VUkQbSgAeP9A5oXfTc2ng32YnvNdUb2zlkL9is
	4JblLlSYrjYRSg+uSqfD8qTV1QSyAjcq3PuRvQjiUrIbtGazYzi8ZvwUsphBF+5x7Cr9ms7Ur
X-Received: by 2002:a05:6102:3570:b0:7c3:83a9:edb2 with SMTP id ada2fe7eead31-7d072756011mr1169899137.1.1793367932858;
        Fri, 30 Oct 2026 06:45:32 -0700 (PDT)
X-Received: by 2002:a05:6102:3570:b0:7c3:83a9:edb2 with SMTP id ada2fe7eead31-7d072756011mr1169877137.1.1793367932304;
        Fri, 30 Oct 2026 06:45:32 -0700 (PDT)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe4a9a1sm66267166b.58.2026.10.30.06.45.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 06:45:31 -0700 (PDT)
Message-ID: <842cc3c7-996e-4628-b5ec-736eeaab2e3b@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:45:28 +0100
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
Subject: Re: [PATCH v3 08/16] drm/msm/adreno: Fix PROTECT span length
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
 <20261029201730.151754-9-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029201730.151754-9-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qoGN769iu3XmKDwiNEfQXGG5h4TLW-jj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX9fvXDTiendZk
 7qZtcVNwsr5UIGvQxKrM3+hL/OcIGCl60p0bt9KNSimdIjZWuzDJhSxlw4JvrG0fGRngMV5n4XG
 ZnG3zdI4n4X023xadges9FhLcD7MAuo=
X-Authority-Analysis: v=2.4 cv=PIqaavqC c=1 sm=1 tr=0 ts=6ae49f81 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=5KacoALlGbuERgKT6uUA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX/dRmU/3OSJ4J
 p7RFqQfQFCwxuJ5VLN1zmXQROK8EYGkNxki+jaWxnDVp/kTOAyHfRNghnYHFff+v0tOu7cPWRbi
 2nzYJcKrp0GIZy5aU/RlVC3H83n+zmN7uuPCNFFjxJUczEHIsBtL20gQ6E1SSQTicP8QDrnMzPR
 u2N0aAwl37Cv2X2RAUDwCyFNe+1UHFZZIsuCtJDOndbVY/LHus7Nkpew0vyqqCGX8JGzjbPmiWM
 Wkdz0BDgkSvp/wc7IRHwRQ98cNtY44GgzoLIy+5P4Nxnj0CsALleNq8exWZc9Mpm+yQNKC4qhMh
 MaNO5gavgw9sDXxyuUOHz/PQR3DUoSZsOUP3f1V6f7/8+vbKdpj9hh0tzoM18bspPPheN8v8XDl
 qNkCrTMnvJc5hLwOa4e/E5EytXx2LhueXPcdoyRtls+WaKhTOTl6LdvErZKUgtcTYcChRkvoxp1
 hT0qe5HMu6Tl9ofYkWg==
X-Proofpoint-GUID: qoGN769iu3XmKDwiNEfQXGG5h4TLW-jj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300054

On 10/29/26 9:16 PM, Rob Clark wrote:
> Don't let the length bleed into b31.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
