Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D4C51814E
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 11:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790682786; cv=none; b=dEhQUCEWrcvT6FAOmrHWXzneFRaiz+/xNe8Mz9eFd9CiC6S01/x5sqCtzI5dAGGcfsTfl8dq3PkUMb0DVZ6Y37A3VUsGCgHbFnZnv1ys5E3nFpWa6oBoBYKRanLK14WuoKgfo8Ok4aTUBbjtLQSWdpliiswymJ54LytAmQtcgD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790682786; c=relaxed/simple;
	bh=Qq4LyVpNA3VxrY74dQ66xruuSGokXlWRSJ3ANyBO3G8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hUKH9A7Z2XYpIwd/EB4ubOf8MToRkBhPB+mSyfrFrBq3JUFXVOrr8ZhghtRfrA6qQbnlGRO0pzpdhUTOkgFLmLl/qN6CcqdWK/mE4DIPPgooOqP3/5Ca3Yjad1bpjiuE+pBpuqA51B+ph261JDCJVYr55l4PyznEaz/+zcGEJAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fr/eb0uD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SnbRiSVt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fr/eb0uD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SnbRiSVt"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TAj9VJ069849
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 11:53:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wc8pBobLAB4TatrDh20UoHLU9V5aquvkKxmU9lFHUQc=; b=Fr/eb0uDuIOoxz1s
	57noKmRlC7krHWZUNMOqhCDKFgmqSrdsqW7Rt0HX6ilWZSQP+g1IJJSBPVZY4gt0
	RPfS0bjdmCIk78dBXOcDsfX+GVJ4xw1goNCNAs89N3EZqjUX6OztyzwdeN9EiGuU
	ZCBfpJCZUO5nFqy0BvqpQRNDfdOdwkZbLcRH/JYgS5mKMKoAMW42H6+m0fJxl5wP
	4XctCd3mTpEI6p3Wra8mwmi5dwvLlzyXy8L0sOGitjhqWZzMZeBPPtNko1YOxBGR
	1RTN1HGo3yU677qVXaitJ6dCpqSpximPO5VSxMeK5qNw4JXimmsYnmA9RT/Hhbkp
	LIc0+w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h01vkjm0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 11:53:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2df375fb9b2so44836775ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790682782; x=1791287582; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wc8pBobLAB4TatrDh20UoHLU9V5aquvkKxmU9lFHUQc=;
        b=SnbRiSVtmeMpb5qmiiPgIwk5tKlCxkv+Tq1YYvzom5CDJhtdw1N3C3/xqMcRumKD0D
         7xwA/1KnL3CRZsVudXg7j2yuH9du1PFhqSdEj1aTh1JqXE0FLuSx7Yk4knEn3MK4HAxG
         JsPwlovv95Tz4HVYAwotPFPnwU9oAgfsZmzOq05KGTEVtAZuc4YiZxvpGztmhOG614ok
         xB/nKFs9sizjLwYULHxBq44FaeSbp5uQnE5/9oXir4f4jG8J371fW809IWRpqafzuWbY
         WxgW7/uP9NoMu7jPkmhqf9RAJEiaic/5IqzKB1XU6su1RJ0nLUGv6FUUO9GGPyr5XZEK
         P+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790682782; x=1791287582;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wc8pBobLAB4TatrDh20UoHLU9V5aquvkKxmU9lFHUQc=;
        b=NrDGL9Bgm+Kue+IPOdeZzWu7485aCwPkRGF1K/l7L75rcQ6fxvvFSqd2SuuXrPACpV
         0Vucm0te5FHUXsiut7cSHWHXL5zRr8l+5HlJSheKiHvtiHCa+P3HMVETvhqId8Z4sEif
         Kah8DJ8tyxJJydC+DrMJCLmEoPB43iDST8si+oHVXDMxvVwJVxNwk3qV/euTsTbB24+f
         IsIFLsLYnSxFSz6ogfEb86e5hjo+HLHauv2oH0bxHQPPDKXD9V4Zt5v7t4yk60Y6ZuGu
         oPRToEHSyzrRCtn0rAcCPhXl5is5W3DwiT2IJvEyboWJgSeYJw0wjER+m6zoACEKRrqu
         f5bA==
X-Forwarded-Encrypted: i=1; AKwUvBzukQtuOXHOMr86F5CKQyrmH03sx0G5sreuqDRtX9Kqo1jGsbRaowsrluDWRcOYX3kLRpLzi2OeMcP0unCC@vger.kernel.org
X-Gm-Message-State: AFq9FYJkubxlYqdk0mD2oh88YdOzJNWq7sdO91PB6YPoDKQ3tqQhRs/j
	Gb61EHES7GSONaxSAal+NUt6DPSAWFEgTyQkmli9cpErjZ1YHMrYb4duCwrPDTxqUN6WMjuREL3
	JJmohmCQWgcmRcS8PEsQKOqUmjVTpJNqpw356AdG3ojVFARezdVqmH3wHurB0r7X73CSd
X-Gm-Gg: AYBFou3mIwSJRtI7tQW6tST3DftU4uX2G9m8GTWLlXPo6gy+CXJZd47qSreyKwQAZ0/
	BVvFtXzKb2GNrVKoCBMSprIpKULdERkTM8Z8ctPdtum8DsexIAFNI0oaBfxdgGzMKf5QIBqNKp1
	5iEgex2J8Gb8P+TmlP9viFkVcC83XzsuuUeV8NrvmmEmrYzlZBZ9AYDvbKPHPXToKrXQcncR+ND
	MFK4LuVtyWl/6BmmcQ34YMmuU58KoJck/LEMw5a3A/JdsyGXiJ2+JH2Ny3R0XW6L3Aar8ue9YAe
	R0jGBHBWWS/9CQvQCUH53IOwPkTtTm9BxJX6FNcTmGGkKw6YyL8PhMHJSR61187vsMyuiIoH/Yt
	FcjbhungPy3nTFdbag441+I80aExEQa73PQ9rUGo9u/KK4fpP2jGUuZlTNb11wXpnxdamTHbCVt
	7QOZHZYDSAjbslMhXgMQ==
X-Received: by 2002:a17:903:26c5:b0:2dd:c0ff:e727 with SMTP id d9443c01a7336-2df7dfd63f0mr137881795ad.57.1790682782199;
        Tue, 29 Sep 2026 04:53:02 -0700 (PDT)
X-Received: by 2002:a17:903:26c5:b0:2dd:c0ff:e727 with SMTP id d9443c01a7336-2df7dfd63f0mr137881535ad.57.1790682781734;
        Tue, 29 Sep 2026 04:53:01 -0700 (PDT)
Received: from [10.79.116.160] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9146ed7csm53972585ad.80.2026.09.29.04.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 04:53:01 -0700 (PDT)
Message-ID: <4ee090bb-b404-4b0d-a239-5eecd93263c5@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 17:22:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/14] crypto: qce - Fix crypto self-test failures
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King
 <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
References: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0NyBTYWx0ZWRfXzVTG9KnZxzc7
 xVqx5ZbOjh1pWlohW7X+gnzzNduFNn8X5OOVG4/m+wReL8+eTXvhcA125muuuCfVO9xjw+PYnJx
 BxImHx9wYBj19lHgxTAS9qrm1CW35D1HmB+Ss/2uunks+M3zwJbTQRw6c2WfMy2sP9wdeRvIxwS
 XkJURA9jL+XAV0+TSjhN7YxGzzOkr9FE49YXwx1tiZcL9jVhMrTavf0y2GeRKLLKuwk+ohBsIRP
 a4Pgo7GlZiCrcnxGdcrTUrphBxB9MCdLhWgZ35jlAWutVeYge4F530aqVwz2MjS7nWPxYbGB9r2
 nNjuWgr1RE8CWhtzj1hTHoQsVpUK77K9M1OllmVGSt1mhNuppeuI+5gOMbBrUdOb6zccAiDi2s5
 XxjAS1qY009I9p21hgSkeOvQv45PygmeZwzfMCYsPDKSrF8/dmSBrzkG6rw4CU3xd4zIe7pzmG3
 27839HBXCGXFaOQsb9Q==
X-Proofpoint-GUID: yJcFWyKpvym8PPR-X824rd6jY_5uR2gO
X-Authority-Analysis: v=2.4 cv=VcVir1p9 c=1 sm=1 tr=0 ts=6abba69f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=4UECf4yVBZO8k2hVk_IA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: yJcFWyKpvym8PPR-X824rd6jY_5uR2gO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0NyBTYWx0ZWRfX8wWLfQyemABZ
 zZLpSwl9mLRM9Pbg4BfKHJu8CoZsiEyB4vnO7y6rcF+zy1E3e89Hcc+sk39hj5FulwW+BzX4lEA
 IhdNYSzrvcIW7VbKVnqVQfgFjP7eFu0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290047

On 9/22/2026 6:27 PM, Bartosz Golaszewski wrote:
> This iteration - in addition to the previous fixes - proposes to split
> the QCE driver into a core part necessary to bind to the QCE DT node and
> enable runtime power management in order to allow to drop the
> interconnect votes, and the crypto part registering the crypto
> algorithms. The core module is then enabled in arm64 defconfig while the
> crypto part stays disabled by default. In addition: the actual
> registration of crypto algos is gated with a module parameter that
> default to false.
> 
> Note that remaining reported bugs will still be fixed in follow-up
> series. This series addresses self-tests and disables the algos by
> default.
> 
> The QCE hardware crypto engine has several limitations that cause it to
> produce incorrect results or stall on certain inputs. This series fixes
> several bugs and adds workaround allowing the deiver to pass crypto
> self-tests.
> 

Tested on Glymur-CRD, the s2r suspend blocking vote from crypto gets
removed during suspend.
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

[...]

