Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924934AFE2B
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 12:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155338; cv=none; b=aQg025I2cjOTGlfGylKHQjYal/a/rYWscFFLQSTdnIV7IZ0fZsLCZSNIhQwM/k/8sdaoGRdXZ3f0S/appu0YWO6EcW4DLcZhD36tXVYE6IR3Lpmg12qW7vW2wJ5X39vfuVx5BjM6IPxJYyQ5vjc17At8iOYOn1Hi+3ByjRFOwyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155338; c=relaxed/simple;
	bh=wYA6+QG4gqtKsAXq1l8c19NwZl8PIpQBydrd2KKUXEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R77Ct8LCJNMNS+1m4lNuoj+kGiHnqEQVLDLECCPuVa6hAkUC904isH3fRqNLlIYBxxKYYaw0Bgb9P7EjxKB4T0Xpjtlz9eQFNHfQni+eGmYvEwUe7b98vgJmaKVStkLbj1yVqilTVWcMQFc4uZ8Xv8pU0EajsvUEQJz374BVLZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JPrvZbRD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iV6Xo8MQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JPrvZbRD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iV6Xo8MQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAARj4488928
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 12:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q3YW7DvRD8yt6RfBklKs77Vve2cfD+JOKZ+SXC0k2aI=; b=JPrvZbRDIGXb6JGz
	3WVyb/mnYH58OAhTU6zQwLuA6QX1Wa17NYSkB1FpCmwmyxTZ0QWoYZuonkKkDHy/
	kVRL4lh0jb9HZ3R0rABNIaPC/U4qu05pgRI6BzPiqbocG2sZbKWcUOhaAtTDzeU9
	cAfLGGwVg5WKtlQqt2zY3nye0S0esCmHLzuzLCfmVePfMVbwkANyWKO2fUiBh1NK
	pRSIJybFladMyQmV4VFD5VeNrWY2PstZ0KPL6shcfe5wxzf+1Lh9Fsypda795xrz
	K7khOwhtYdCJoYz0xZ5jReywFH8np1rxz/5vBI0bKHEx287xXp2qGLoAIY5AuQdO
	WVB2tw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbcjt9w5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 12:55:35 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3510d0baf63so9240171eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 05:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792155335; x=1792760135; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q3YW7DvRD8yt6RfBklKs77Vve2cfD+JOKZ+SXC0k2aI=;
        b=iV6Xo8MQi1HLWBFrmGffi3OHW4CDLRs+eYmJlrmGFc5ggasj6jtomMc6Gsu93GL/Sl
         hJoLVNN2BemZVa/rBvHCVqKINeqn9YGQaBQODqOo6NqmIGI3PDRKfALAyxIAsa240YOW
         3ts58xgb9DR78PhbqRty89LD78tZVdSHvnpHAnW5Uc90Wixq4E1BDYH1xVFtuJY7omyq
         3JV6jPLjrBin3b6V1pTqc+FnRaAb0a24piDl+IJxrCWdXrTMkeqA7uImG0ni1NJW413x
         WvBEm6arCYRp6/OK2yx+0qIR+NIA0+pVsYGlBgeBt26/GXV4EVwrMYxErG4smeGcnGcE
         zwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792155335; x=1792760135;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q3YW7DvRD8yt6RfBklKs77Vve2cfD+JOKZ+SXC0k2aI=;
        b=QjY1ieXtYh2yqayQ1jsZ0pkIU6Rzmlam8iiWLpSkzDZKswHe51wvTAhTP4YZ8jaQlf
         deTPXQgAfVuCpLIGNFnpsjq5UHVYCOH7XOMTMsZvKm1YXPHGr+imtSo6khxERCtBFha+
         CBExFOTvefYAMGfvFA/3oFFfZVxZInkZuZHuJr1HpWk8GJAVkagJeWQIJRt8OhzIgWn+
         X57umFh+Q3EPIKopFp7ZSVMpNpfHiNnZMca4thW/Qi5lFZYld28h1aUXzbj24++9C6o0
         lXqZzhbFToCDT5KZWxKxnI/RKP/tt9pWqJHy2NK3RNOKQTpwtlXxlmk3vcrNEesV1Oqs
         To0g==
X-Forwarded-Encrypted: i=1; AKwUvBxEef2RCs2QDHlReyc/+k41MgjGt4rXvTbGp0Yf5qZjLUZGw+oPn5xulYsbz7eZgM3kmpaDr0YHR9VNiaj+@vger.kernel.org
X-Gm-Message-State: AFq9FYJkk5UYY2ZW3rWSAfvBF+/uNCpiug9tFGzphMUGWGBAET+Mk4E1
	AkykVQhTpcOhiyXAj+1rHoVn3BQu+IG+WKukVCfsmk6CPn6pFfpvRu6nH7Plvqi/GbQxUBvdFMC
	PZv/4SZ8RvQRHZQx+uFFT0lEDxwUOYng3oDuxRGvE5FV/7qMm9U7nCk6ceHQUrT2SN1Vs
X-Gm-Gg: AYBFou190okOIygg9Jnuhe+u8cMnTjSHC2O/71WpX0JOwXQHPjwegwJdm63H9WzsHmk
	8pM6M0TOPr9bNQ9qc9dRUa8+wAVTIMCQLH5hOC2GGtIY+9qm9l1qJJP9E5lAIXfQiOXUANsJ+6N
	mVOK9tbG2YmoDOC0z+E5wPNnH+1OySgnl0PtdL+NC1zgmYlnNVN5WHlQJfzKTat2XbWyl4nr6be
	mVE7B9MDl+5RxS8Kp2dLB4fJ1Yxl+J6QiaQxgfXmxzf2gibtWOB1X65SGla1yYeFOkKPh46w0/V
	NimUvczspb4X6ew4oATEpVbZyzd0cL0A8yQqR02lCNJObuwl/M3PiDR9CBgd1sxRSrDxClgdIsQ
	IruzIRjimk5jHtofDChKJQEY6R3o3eA==
X-Received: by 2002:a05:7300:e9d6:10b0:359:bdc8:c9d5 with SMTP id 5a478bee46e88-359bdd83104mr26473312eec.21.1792155334703;
        Fri, 16 Oct 2026 05:55:34 -0700 (PDT)
X-Received: by 2002:a05:7300:e9d6:10b0:359:bdc8:c9d5 with SMTP id 5a478bee46e88-359bdd83104mr26473199eec.21.1792155332766;
        Fri, 16 Oct 2026 05:55:32 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082a7b33bsm13434921eec.24.2026.10.16.05.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 05:55:32 -0700 (PDT)
Message-ID: <796d1de8-9c1c-426b-93f7-eeb417390f66@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 18:25:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] tee: Export uuidv5 generation for TEE backends
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
 <20261015-qcom_uefisecapp_migrate_qcomtee-v5-4-1460691b35d3@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-4-1460691b35d3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1MSBTYWx0ZWRfXyRKWZ2+W+L9m
 ThaxhJ6PYyZdr2BgJ/P42nx3IzuHC7dyA2HiSYc5Q6Pf2Ga4f8/3DLh7kOFpBxgt3GChPGNSE/x
 H2b04lXlIvd0uNgdoF8q9SPAnnOADdjlGVlo0ww7iY60hHUtjhZETqlCGqmx0cB7HJYJ1MvvyRx
 jTVDJCVNlxMJklBSCKVRLN0RsSsx3mLqtJqgmcr4Wble7+ZejQyemYUUZMZ5afvTFJsP156EMot
 2/PmM4EJh4QhoWjYpdExBKENMbXGNfigL00n/mR8pz+GDqO/L81Boq8HSdYtzGNYd0QS1ivHgf7
 BP1OlK4igqDjLaj+PoBb7vzx3pdscGJYevgtaW+log4pjiYzRXaO6vyVY8/WGbmHywnD4/BUlgM
 7Cl8swzrB4aYOJXjK4lMFVnZeNS/O+9y6wYxO3qbZj/Z9SlJkv102HC+xQm04kzrWMxytH8gPCN
 Yya48MDLjriX0Y0HZEA==
X-Proofpoint-ORIG-GUID: jwmDdfDipwAwIkYiUj_KTAaWB-A2_aik
X-Proofpoint-GUID: jwmDdfDipwAwIkYiUj_KTAaWB-A2_aik
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1MSBTYWx0ZWRfX08A7dVPka4Kj
 jcZ//GVp2p1Xww1eb3b4+DaNPof3faFs+jH4eYr+k6n8cSGO7/E8iGG6HtY56WNrFZP80kXdakQ
 PMrMlQjB/YMzSTSQAoc7s7RocFm0uUs=
X-Authority-Analysis: v=2.4 cv=VpS2kO2n c=1 sm=1 tr=0 ts=6ad21ec7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=wUKrATpdGnaYG2FsxpQA:9 a=QEXdDO2ut3YA:10
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
> Export the uuidv5() function defined in the TEE core to all TEE backends.
> This enables the TEE backend drivers to generate a UUID for identifying
> and registering their secure services on the TEE bus.
> 
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com> #on Glymur-crd

-- 
Regards
Kuldeep

