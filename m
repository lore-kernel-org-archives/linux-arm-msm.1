Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4790A38238F
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784701664; cv=none; b=ODi7HuNp58h9PpvRFw9og4Ya+Mhjt1RwFEo6dmLsTQQYJ/+16s0J0twGvxvg/wQt2jifvpXBDQiB4JVrcLMdtfyYo4PYw8aNJcehboRGI7ykXCM5znY/ugMfNS/qEF4sVv7U2sh4ccGIy4vaSWCp9tEcqLNJ9pcdRjb4UeD/r+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784701664; c=relaxed/simple;
	bh=M6WYDLfeOUBBXgMsP6wOPCILnO8oRhz06ehXWlYrbAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rlhp5Ls8X9KFnf6aHgxD1tTa7FPy4x16mXvN03xUoGJrYvjN0G4Lo0e0PXoXBkDm8FctDSNyqgOagXd9JGdaQhG8ZtXQuAy6VZpJELYBnVtGofxUmJH1HOwGCgTgROBQ4BwapK5YrtaLW9XkyHnCcq40uElYVcbypRwHlwGCnAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fSNyxVgf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UzhMI1NO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fSNyxVgf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UzhMI1NO"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53tOv4027579
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:27:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CHunJNubtfq31+Afu45uxX6l
	3Vxa9lYRWxkmXwWJHSw=; b=fSNyxVgfNOiG5WOAKyJhP+lFEiEQaXQZLaL8Psjz
	IrzL8MChovu3B0S8w2sm6C0le4DE0agRkWw3/WVrHXSPuE8VG7i9Vpk/iTWCoezM
	GJnEGjO3YXCa13SQGtbI31nCrHO+CKbvMWHtpSrwFUl9SfMnQ4x0HoC9syTjxz3P
	IL+Yc6QmBo1eWV/K7LSLTpjm1rCk6ZEVwLIRVh1csmN/DeY5BnrjMx7C4KJ/NVSZ
	DIrmLf0dqWVo1rFtT0WSjAGO+tn/4LJpV27XAUJ3qXIRvBpda+k07Y2JdoiNGv1e
	oS5E+nvf/0CoolRbag+rXWoS1hJOgVhydlbvBWHRcLesVw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9bsbuf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:27:42 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ef8249f871so232617586d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784701662; x=1785306462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CHunJNubtfq31+Afu45uxX6l3Vxa9lYRWxkmXwWJHSw=;
        b=UzhMI1NObnKG+Bo/sUQZ7fJLElvX8lI0Egmqh3c62Sa7hxsLE9+FciifURYTy3j9iW
         A5qH+bJuW1TI1n21ViVHh36rHROPG7RpC7Zv2GYq+/35dNJlIXEax920xpnYAFOjPQW1
         T/60c/FFQ0Pb8kfkus3lcslSYMWKenKoKQmfIa9xbA11u6tWptfjP0bdsNiXFom+e8W7
         X1RJzGdPeOGEIsDV2C4cPXM1ZYc4iu7KX4sOBxZ+uhDjS374C61iImVyU5TL0fmvvDjn
         MTHCKHa6zXVe2rNE3/63gu7IRPW8WgCAdYN2YjxFtqYq93JNKbCwIDpg4vUCCv6HhFxz
         ol9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784701662; x=1785306462;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CHunJNubtfq31+Afu45uxX6l3Vxa9lYRWxkmXwWJHSw=;
        b=bq+6tTgABviH8yvM/6kRzcNljKLKKWkdFbhiiaBzPQkB0pSxg7PWBRuvtSi3GITldE
         omqDP7Csh+ABad7f7BFAulaIYrLjyrH39904fY8JSViMHdobLmbMZhfIhPvCR4aLbr8c
         6QIJChKVk7Sa5JBO//ZJDFRXf2cJ/TALPBqrQ6r608UzCNjteMjzjmrXu37oJk5PNU8q
         SLXMEVmE70CLrR2oE7u8gGim0/HaZPOwnvQr1V5Gw3EQDk8cBxLSj5qxmCvye/u9FiEa
         11BU2d94rqM6WqJt0hJdPBkZjsXlFaKhsP5PCpOKiigiiTcUBl908SOA+BCVDh5h6ru5
         4Lag==
X-Forwarded-Encrypted: i=1; AHgh+RrzUXGjiM8I47lgZjx6/O4Km6982/sdh1K51BOz9mvbPQrdvQADwsj3IC65x5Y7GPZJwpvxzg8FQj4I3aye@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi0isBK8eKHxQAiR4bf8IE7zPUI895g+w9l27sr34D0GwyUYr9
	gUEVSqMWast1+TpXhJEowjqJLTHAwtuYFur6bimqKCmV/NoZH0+NBRP+5J9sUdUDRXh1D3Xjcon
	GU6B2gz21ruzOsPaHgAS58l85fAut/1IKnz85of3WTC1Ee2qdoGAw0y4YKlPusXXaKIJa
X-Gm-Gg: AR+sD11iVp36+zCI9PZu5VpziBDIS9OA64hh5M3TxrdPZS2M1fSCRQTVmz/Au2rBKdY
	CadpDnNM/pc81tr9anMwZm8y1MFIv6jnUpTn9MTb9pM3JKYP2d/yTsl0n4X8LwthwSVTgD1zUsM
	iXizQV0OUV9/2b/+7PrPtUSpzXTOR6tvOzECQMrP3LXdG+J4qrEes+PvmvC15i7Dg+K92PX6mIk
	Zc2RLWEGcMsWutSob4jAKsK50/reIRXgQQUFrL0XmrKxO18OYF3xF15H3N+y3QB6x996Y6qMiZU
	l8no/o6jprBSgGeEqID+WDQJVzfrS0F5meRw8Y5cutduGd6QKOXSnhBYApBKhZV65oP9Y/6pEr7
	LVoACJg2Bu316nQhWYj4fMQtine8fOqQcWPuz1xd1LnWpP6pmvUa6OcbwoKQ0rcEC4SkBoyEMmz
	TQR9+g2sYM7uzgKw==
X-Received: by 2002:a05:6214:3187:b0:8f2:1d56:3e8c with SMTP id 6a1803df08f44-907783913acmr228719566d6.29.1784701661620;
        Tue, 21 Jul 2026 23:27:41 -0700 (PDT)
X-Received: by 2002:a05:6214:3187:b0:8f2:1d56:3e8c with SMTP id 6a1803df08f44-907783913acmr228719126d6.29.1784701660781;
        Tue, 21 Jul 2026 23:27:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef68bc347sm2908631fa.16.2026.07.21.23.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:27:38 -0700 (PDT)
Date: Wed, 22 Jul 2026 09:27:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 6/7] media: qcom: iris: Add missing break in
 iris_hfi_gen2_session_set_codec()
Message-ID: <sbjyp2jkzry4hsk6daea5kiqhhw56po5xoi3ahgemctkx4s5vp@m2qrpdkulglb>
References: <20260721-iris-code-improvement-v4-0-4395bd8acfbb@oss.qualcomm.com>
 <20260721-iris-code-improvement-v4-6-4395bd8acfbb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-iris-code-improvement-v4-6-4395bd8acfbb@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: jF7F-6rb1DXnZ0aqqzJATflfCmgPOgZ4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA1OCBTYWx0ZWRfX7fx79+26dBdN
 5hZKYb9RaflBrC0JZUFAJJmwuFSVuzZiYU6WbMyQXgzmvXlefe7C8quyXH7H9pL/PHN4ttOMtEf
 aUrsWt19BiiDak0yYCbayJ+LSL3Cal2QAQzaIDkxe6WTJPB1wFK+Zx7S6XPE0s4f6pAwayaYqfb
 ceuYQaP73gr8qezr5EzrNEV5mfEfYwKhXzYePhIjg5D6yY56iNu3/4N5h607o7EFO7Zus0QLc7B
 IazrXdnQdOn3EoaI7vDcgMgyjzAL/LR89aDL+X/1wynBw+5UyU5w2Wz1LtzzsmK7CVROBoLQl4L
 soKaM/MZVDL7pIxJfCE+99H0uUl44QeCaMU5Ts+S9/NHSyGHP2GWBQng0rxKTIwEjjux6UFEgNF
 sCbVks72TF6vybb2idKTaA3Wee1+Eot5MdAkLHogKf7wpmIwUy+UvUIWq7V00vb5K43xz455RtC
 Oj8jg6wCAvpgWlWSDLg==
X-Proofpoint-GUID: jF7F-6rb1DXnZ0aqqzJATflfCmgPOgZ4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA1OCBTYWx0ZWRfX+now4ELTYDvB
 +khvbEzEJMcKVrfU3dI9PMjDyERSizMNdu+WEZwSFIaa5ifVBrvbA6ryOOhfhI3tdqFPQd4J3j1
 oh6Ek2UkU9Pd9NLMK0WhSzt/a2BWNJM=
X-Authority-Analysis: v=2.4 cv=QK1YgALL c=1 sm=1 tr=0 ts=6a6062de cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=_sPD0ODq2fXVNPqTC0EA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220058

On Tue, Jul 21, 2026 at 07:50:39AM +0530, Vishnu Reddy wrote:
> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> 
> Without the break the AV1 case falls through, risking unintended behaviour
> if new cases are added after it.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
