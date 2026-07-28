Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E843D3D02
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 07:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785225281; cv=none; b=im3ZRpF8lkAp5Ckn9CCyVrGUy70z4FChTYQXsQTJgLVarR2VQDJa0M2SeP1NH4bEfCW8eZRuJdq8aqocc2ofy6zfose5ZC5Xbcb/Hoo7k9HXgyC2sjST2S9TP9jRnbMO+48VjgM/1RZqeDCOhnO4Y1Ck3sIfjWKXhHcNz06fMSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785225281; c=relaxed/simple;
	bh=pUwZj3vTPPUB5YGZNu/KNjnYLMEWdsjbulEY/qIVSLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lw5sPc8wBVtX0pXqPUNqnOZ0csKESO/h/eqwwIL3RM0dGe/IG+4BVUrW2ca6uqskMpg2GWW0b/gRCJNqYpq53GcOW4UQM55opToUbGk0kCVlGzxvktLf8Ei2WkXATMYduX1yHMWWpvDLSSPWPkxBepfxGTyaYjmyQrFpdhMLv4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=An+mrTvK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X5YRlT2p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="An+mrTvK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X5YRlT2p"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S6Ynak1824298
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 07:54:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zBpfESMG3qqDC6aNXptuBRVnUpj9dxKdWNsD0cmSmN8=; b=An+mrTvK42x4FtPS
	Vn+0Ha4YFt9KcX5I6O1wkDY59Mxbq/bBr0o3kwB/uBvQO5/7lZIk76YKG4DLxmgr
	fj6T0bIuuaMopTPxr8gFQD6SWdock29SK4lDp5fyHsWqsPUmcIOsFFlruUU1nVlQ
	kXAwVdNUXxoZlqYALgqmAV/e+MQSi0sOv9dq7xGHOFO4AHPaB+ccNRzeT+dN8YbO
	Cp3YQFMGydBzhEPMoM9GwqOE5qlfhKpUk8dIe5+TozgAZvbob/dHNQXctXhssF1R
	ocFEv0LTGDa4C8hkw7RVp//Zm/lpD+DGKpTjfFUZ93NMdOHY8u7eR0/bQ6EPHb/E
	exrTBg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpq9hgaeh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 07:54:39 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8fd356ee3a4so1470176d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 00:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785225279; x=1785830079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zBpfESMG3qqDC6aNXptuBRVnUpj9dxKdWNsD0cmSmN8=;
        b=X5YRlT2phJ1I/pBbJCDMFO6LVSPPopn6iIKmHQ3RY3u6+WyIhCO07O91ew3mBdLnVc
         +LzGUh7HjHZnKBhTX2RFlzpq8bCVOkF3FOQPVl++QY0T+LpcNY0MV9DTNlQHF9ViY/22
         P91AWiOVFjtVlGCn7/68pg8HbcQBrXk7dZxc+eX0Bc34WmGsZBTEOvE/RkZ/rOKTmOLY
         O/SHRUFNF+yxwS4T+dv0kmSjZ1F/EUgXdbHQE2OrRcjvUCFmg9JbU31m7Moxh/zf6Ypj
         ej7ExV9YcbtKt4yF1seUhv7gFO3L8rCnjaUDUJr9TmNJzjKNXLwBMlHTotsMgFPhHgBd
         o+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785225279; x=1785830079;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zBpfESMG3qqDC6aNXptuBRVnUpj9dxKdWNsD0cmSmN8=;
        b=EiRIgv13s0ILg2JE46kMhHzmuBDziBxocDDtfuIhUhWJHt42fnOtwnBro2iOgHQHdv
         1NRp6mUxBQpfFRcbE3/Rqghk0zJxAnvT4K+iIJ5o52L72bGR7nW2wcIrM7Q48wuJAttG
         PRXSbKHgj6hlPuM/9Du5MnnnzLLm/t0LJ/qEvCVDQ2d95nYTp3fQ94UPyjWjT++pKfhP
         U89thezK/dOMBewwdchPa5MmhfZIocpK3qFes9JlW3U25ED0Dg1nVj/ul225HCsySDmw
         KAqA568yLNk3S/stFAjkBTvRhiUD4IbC8nDejl2/Qbt5aYhXiKDStaAjtp0GjA8KNxaS
         KHiA==
X-Forwarded-Encrypted: i=1; AHgh+RpzAqPOgUJrl6z9B05Ll1OO7D+KBBRdEooRAb6NXEQKeF7w4NsKACVpG29R5FCPRPWUF9cLv/Ly4VjbGWHO@vger.kernel.org
X-Gm-Message-State: AOJu0YxYwuJozbdkuBJ/9NFmNMucbfmMohrFKt8wO8iex4jrfJeERoMz
	bBeCpS1jpPq9p4c7we2BlpEadv3Q0Sq8C2865dUYDOP4JgOk3apuopMBmRX+AOTy56XahMNCS2K
	Hi/8CFMR7PurmuOP/5gXvgR6wFL3cDW9n0eDfDE6hMPZc7rRpfgl1YFiswmYHfiL1rrBN
X-Gm-Gg: AR+sD12w+zqxx8+AufSI5gPqLmW+U032hEd4yZKo0XuprK8jGhQpUoCFU7QgEwhjX6+
	KLe1SdxgdVfdPTMEkWaCTnq0DO/5LQTVJ77nYY+UGklKay9nIJ2zr6xbzF3HfBYoYs6o4nql1Fb
	0hpbVcFEBUG7dNoHk66o9/W2Wpg3Kasvv+g8+WdzPaXr7rk6bxgtdO9njWtJuyuOMGnorwpShlL
	3uXfDJAO6taQah2prOZBpOyzs8Ii/Y8BiqafOGTovQGXhC2LOZv9TGYjU6UBGeErOmLQT/CAw4B
	yrj+qNqTmvlZkHmYwlcCZDD5L6pukVcndkeOABR80zepJAvKUORGXlHHIRWErSpTev6ePgrfpZW
	kzYoKPG3CzfcBqnNoMrP2X7hl
X-Received: by 2002:a05:6214:1949:b0:907:c6bb:5d0f with SMTP id 6a1803df08f44-908170c2ec0mr20631686d6.1.1785225278767;
        Tue, 28 Jul 2026 00:54:38 -0700 (PDT)
X-Received: by 2002:a05:6214:1949:b0:907:c6bb:5d0f with SMTP id 6a1803df08f44-908170c2ec0mr20631336d6.1.1785225278304;
        Tue, 28 Jul 2026 00:54:38 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c4196ed98sm654728866b.30.2026.07.28.00.54.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 00:54:37 -0700 (PDT)
Message-ID: <3fcef71a-57fa-471d-9c91-8b2716c53bc6@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 09:54:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] irqchip/qcom: Enable compile testing for QCOM_PDC
 and QCOM_MPM
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260727-irqchip-qcom-defaults-v2-0-466f3c407937@oss.qualcomm.com>
 <20260727-irqchip-qcom-defaults-v2-1-466f3c407937@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260727-irqchip-qcom-defaults-v2-1-466f3c407937@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2NiBTYWx0ZWRfX64AZaBtegMLk
 FkFm5XwmBPQURbRycjz2bpp3Sr13ll4p5pWbzdzKAGTVyHJEaK1jhPEeBvwJptZYMFGdp/62QU6
 cvpy1wL28DqfOMDtUPg/FehXrfUVjpw=
X-Proofpoint-GUID: G6V9o1T1_p0SYV1gGKP1ELvXqKqLC73C
X-Proofpoint-ORIG-GUID: G6V9o1T1_p0SYV1gGKP1ELvXqKqLC73C
X-Authority-Analysis: v=2.4 cv=Aa6B2XXG c=1 sm=1 tr=0 ts=6a68603f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=2MkTBfida5u9ap4BuHMA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2NiBTYWx0ZWRfXybyLg6G3gLdl
 4jTHP7s65BWA43Ti401B5Dahd0L7kb3vkFz0Y+p448+606qe7T36j/qrnzYI03yNipOdsOVj0Wp
 SWG6EilfaM/f7Sq5Nu4UePZ1txayLn8tbogmd6amdpP6i/6CfC1i+QW4TzCCUMHoIwhB7ZtnrIB
 N+5N2ksvgpA3jRQGXuJ/BxYk+qXHmAaGMzr4UO7kOWC4hlAM7XS0AgKuSFKabPj5sVWk46UDN/4
 PjGLviXrpCuU98sfaAqHTjuVS7/JegBDgicd1QYcCQ3/RrDxxgiONQ0wKbMWTtyO47jjK4JA6QC
 tMT/XQx7bDJJgnPdffHcawRMMbRWf/jZE8QMY4Aka5KEk3gXp4tSSsZdXLviYF6m11L/JaR2zL5
 7jwA41bYIoElGj7r4TXPGttVo6DgEd7eubwktJ7uqHMn7VKD8HKiKwNNGoLTRq0Zpt6pavtFX8h
 Ctkz22VSxkMyGvMjyfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280066

On 7/27/26 10:01 PM, Krzysztof Kozlowski wrote:
> QCOM_PDC and QCOM_MPM do not reference any architecture code, thus
> should be compile-testable.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
