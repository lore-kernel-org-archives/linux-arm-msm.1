Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007634;
	b=x/7E1Ybf1WmeLdOxf2FCJ1d+RU5uNh6v8zRMo10nFDxzwBXt8Xbun9dn9vaVMuoJI2Ga
	 8fJ2VWxr0sTmPYTC9XnkTPObJUG2e6aeCNe3m/JOMN4VQ0q+CuMK2J1SaAdEDs/kVDPOH
	 /3Rt+eo3rtdKgAq41Zf0EPa/jRZZ8+79wRjdUBZebhVeuPs2BAuxervZ40wDYFA3wtOli
	 c0mXTsNvrWW5VezPYksQeO3pfmDjNsc3RabjHzruGaabS4Dunt+7gBfTBArXAgxKBbvI8
	 0beGIof/6QgNQS8s6sbhLMGOKziY03YeKIRV5tNe8kYOxiO/ePKRTfIa7h1vbICujMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007634;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OcTBksbIW2mgBaa78YQJkuMhgafx6BdMoS+/otq+mGA=;
	b=SoEfOOT2mMvZCBEx/ulrMp/atErdulzNBMobw4xqBZaN7tg04uBKYI2FtcHN8PH/1kg/
	 m+mrRs9SuuHxrgWJsPTzeJPqRK6JwBf9T+X/EchF7JcQZ+u2hnufp5/PDeB6S0Ha/Mm/y
	 CbYqj/yRNLyk1SiIDyXtVA2pG17rCOCzZuI7dVJu2AUOTm/mJULWEMw8XXH7fH69zjaDM
	 mrBJOfuBxqkK08ZivuLF7LfbbG5hmGln70ARoYpP10FiqwLxYFEaUoKWrtANlUYHso2bJ
	 M5Ce/aYl93MkaapMsnQNzY6WYOC7S91wyeeok/BJ52iua7lRTsNBz6sf3gQidVHv7eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IJTvIbc4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kRYHzBzX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BDD606A31B
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:40:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5BDD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IJTvIbc4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kRYHzBzX
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q8xZta1912229
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OcTBksbIW2mgBaa78YQJkuMhgafx6BdMoS+/otq+mGA=; b=IJTvIbc44rF5CL39
	Dl/OAuV0Pu4/t2JqcNSgZ8FgEH5YHfDNzAoTj1m6HyEwm/976G785vA1nB9G/KWG
	BVMCXYSejpmXkTLUFhQcFXpHxMSIr4bpVpd2tUMHRQJgb+vcLHCTbbloGhZzEBJV
	hRsagjmw5WTcY9ZkE8UF+T1gwIgJjtBMx7SjeiJJYVc8ReFj2bawChK/SPQmmOuC
	rY8XC6X3DZkd5gp60d0uuqdgAPixY4JoJ/Oypwj40+FttqVdbCeqXVMa3npiPcrc
	Ocr1J8ZzzEa/1tV0bVwNczkAT5ZFDXUfyWBOgttaIU+Ma0Nkt62t8+KQS5U62YeL
	MV3Ftw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u604w5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:40:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc50fb0d2so44257785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 02:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793007632; x=1793612432; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OcTBksbIW2mgBaa78YQJkuMhgafx6BdMoS+/otq+mGA=;
        b=kRYHzBzXKTfQZLrRNsgkhxqY7r2FZsijVhP1FSh4qh9jH7lcZoeDTSfc+ssE7WSrj4
         JEcgtCOicmxc7UdJKpeABnVZb4JnfNtGOspeCCDGddeuYr1AJ8fOHYkrV9KA+ivewW+X
         ZNwGSsrY0KzXOg4NFXnwULckp57tsA6GyREJm6J0bRt1PYs1q/IjRyE21NW4UWVBO5Ep
         og6WeOJ1ppUNbApG2Gjpisw6nEryoctIaMZEKNaQOgbYK88mYnFiRG3TWKsrd/52ozgc
         RYzb9ThF7GFN79gxaDRF0Vbenq3YY617qFq1KM/LDHy2yWNk0Niq4CZnVbID064FztO/
         4ekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007632; x=1793612432;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OcTBksbIW2mgBaa78YQJkuMhgafx6BdMoS+/otq+mGA=;
        b=IuPtfrqYN1qYVV7W+aAowl8o9wnBynsf/87eRHPaiRba/aj6R2Iha+dk/+98Wc2no4
         RxyPkMtpQwTCvF5U0WL+3+ZBzHcXo5+E9utvr5g4mfvHhUyLCf+mgO8a4WYgVXlSSGLS
         eudtBz35zlz+ulsz1skwefTw0QXxVNikzRv3vcUM5hLW/PHSe3cfIoE4MQdJwe1Y8Zlw
         AdxwlSIRuKWXa81BBR9nG9uRJhhkVYG5YLLWgq/qS8rEPELdL09NHHSIL1v7F4oDjtPH
         +F7RJqxGzNXtgfO2yQ57DM5rXpk6GAIfy19sHAM0URbK3pJYDP0TrmPBGWfkvUiGO3nw
         s12w==
X-Gm-Message-State: AFq9FYJa80YPK9dDy223suV1Y1mG4jG+Uuc0ZJ/5rPx9NAybwbgHJMjm
	I1H2FPtTQOHcbfOGqEFFZ/N0J5FGdrUdggTSw2rTagLwqN90GUCUqFCb4vt4ktkrOrNyuVdbIZl
	gYOZqBxfiZDmA/AKZMaU1adMlMLtSGZ16Jz2TdmazOlu+TzwhHdZVWghsvtCyKn4gZM90
X-Gm-Gg: AYBFou18zbRl3lfdHnei7shXH9UXTjTNkpL9Yu1eT/f0dMViwYawyX6BDA2/mveCnPa
	3T+FPUTUBb/BNByH++g647hBxvJKRbLGJbEpCyjMV30RvIHdl1tw08YsMq/MUWuEb65rxbWDSxa
	CdUATRoQhv4zxPz6wetxzX1HIyUcMj7aYAQivIxUoh7ZrXqSOgicVvFeUZjQSGkDi9EPYbLmBc1
	ugpukubUiIHaHXuz00cyt8gxvkeoZ3vTtPoth3321vdJzy8vshW/WQBmVboi0dx4DctVVn+Ejg6
	XI3LUGnjSJncA16cJxqnitNzH3DXAF9ob/0d7g1fEi5EzUznIrFV0oCj6LxZFPWQ4ix49WUWa15
	We3NHqgLyibHKAcIVgfiKIw==
X-Received: by 2002:a05:620a:8794:b0:93f:43a4:a48f with SMTP id af79cd13be357-940ef96b4d0mr911111785a.5.1793007631917;
        Mon, 26 Oct 2026 02:40:31 -0700 (PDT)
X-Received: by 2002:a05:620a:8794:b0:93f:43a4:a48f with SMTP id af79cd13be357-940ef96b4d0mr911109685a.5.1793007631426;
        Mon, 26 Oct 2026 02:40:31 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd34f465sm296760466b.8.2026.10.26.02.40.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:40:30 -0700 (PDT)
Message-ID: <c3fa2f7b-42ba-4e10-af06-4cbf5676e438@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:40:28 +0100
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
Subject: Re: [PATCH v3 08/14] drm/msm/mdp4: unwind a failed mdp4_kms_init()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
 <20261024-msm-kms-destroy-fixes-v3-8-66a30120a5ea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-msm-kms-destroy-fixes-v3-8-66a30120a5ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NxYmMf0VhCd6WaQpv8UBeUaZyTG4L0FX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfXzN/rpUHNdKPg
 AvsMUCJh6ln1coKOVPLMkfY3kIsBTAoUEVFTf6iYXJp1OLfGRXZfq9Zu9vmCCudeVqc0CUzNVx9
 AJC0KxFYl5cP+LczciFkyAlYIxrJoTysSPQ0RzMqnqe6iNojB5wDAFjOHBhdhshruTqbpLQPeiA
 1AdACloYcax50qe2G1s86dmuVD99BGKutv/tWCNnj3MucDnF4jao7vhrCaHurz1S2b8n0fXv5FN
 M3PQFA1kfspxYFGvNFpRB2e0Tp3uxOdICtJcdKSl+DZMfIHBMU3bBFCkxCfo/58OXTWnCVVCZ5k
 JbwXx8msZBv8oTKgvhfzeNtgh0LqYefarUihkJhcDJpNtmr16ltSn+e9MTsIpWTmNJ1Ooyevcz+
 dOjwCCMN3vYpF6ZDMUhcOiEzepG6bgiOtn1puzj7keTAMj93Bhi2h7fv+FB6rZeP+STgnMHVuQW
 sytgpMHSdB64wGVQ0CQ==
X-Proofpoint-ORIG-GUID: NxYmMf0VhCd6WaQpv8UBeUaZyTG4L0FX
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6adf2010 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=kk-Jr0jdRmDx8_r1h5YA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX67dw0Nezfsf0
 ztr2RyuseNRhmjEnp05zQHaKiaiOd4+xx3eX8asNzZd/IPXmE3LN/eSt69FZ0gJE36CTjsR+Zsi
 7XLofCrMTqR4E89K15ukexm0dII5Nyo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260038

On 10/24/26 1:19 AM, Dmitry Baryshkov wrote:
> mdp4_kms_init() returns straight away when one of its steps fails and
> lets the ->destroy() callback, which the caller runs afterwards, clean
> up. mdp4_destroy() however dereferences mdp4_kms->dev, which is only set
> after mdp_kms_init() has succeeded, so a failure there turns into a NULL
> pointer dereference. It also leaves the vdd regulator enabled.
> 
> Set mdp4_kms->dev before anything can fail, undo the steps which have
> completed, in the reverse order, and tell the caller not to run
> ->destroy() after a failed init. Fold the hardware setup, which can't
> fail, into mdp4_kms_init().
> 
> Fixes: 93c125e4ea98 ("drm/msm: don't tear down KMS twice when KMS init fails")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
