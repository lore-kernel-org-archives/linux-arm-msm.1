Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DCB501F4F
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059359; cv=none; b=DNe/RoELOQXqAtzNekLsfuk2++B5N3kxtlPVnp7+7t/ZkVv3he9PCoFu50rWBzkgRZHV23qBiMJ+p5j2OO6Ha6stDSbm5QijZmY7Njl7XYW4yNSgRotItk/eHdtqxjO3imMPKjtu1u7N9L4cIjdpRxalpBqbmqwZas1ccuB8YfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059359; c=relaxed/simple;
	bh=shdhjPkvDR57kNHeQ4WOOkF93PcSzZ6NOlgi8C/r/gQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PEqcuRE+lmQB/Kk8mHGmc7EKDqlpoTprjBcysCkcKP7zmmJWSH/ckRv2+m27T2IYtqAyZxgUs39Bdaj/BFJXXIRmNaaLuBozT9WPNcNoz+Szdbqi2IUUT2s6ujg5PRX+yThgiSZL27u8/xD3RmdUvUxP2nVSHY26djBUYue9iGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iSJ3TO7c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J8c6ZUBd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iSJ3TO7c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J8c6ZUBd"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9kK8O2999352
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:15:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	shdhjPkvDR57kNHeQ4WOOkF93PcSzZ6NOlgi8C/r/gQ=; b=iSJ3TO7ckDsZiDha
	vTyozSoJSqmBjxWVultHkFGd8ojNNXSzxnN+tY6pEBDnWMWwiJ1A0YP2CgA4hcpo
	xeT1kAQU4wwKk3dyOvNN8I2U/VqYyY0ooEdJJ0oGstvIcruijG3B+r/HuciccY9v
	OLKDFocGjHXAderIRhlalYRIRJkxWCZ+wxekt4FhoTc/6+8aCXw4w3hPE1Izps0B
	fVdWILymgBZTuH9Up9dHLobMN1L1ja4ak1WKAY/dLSDPWSwzmnabCU6gZIuzeh0u
	MB18l7+H7ZTABqnXAl71uO4FFZQe/mC/3cijRwlhTsSjsS/TQff8A8hH0MugTNM4
	AiKJSA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hausm0csv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:15:57 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9179ef12a03so17308856d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 03:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792059356; x=1792664156; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=shdhjPkvDR57kNHeQ4WOOkF93PcSzZ6NOlgi8C/r/gQ=;
        b=J8c6ZUBd/N2XEsv8lya2PICzxrNVoImFYNqerGKiIlYugQbVpq2KOZk8pvRCxjskjp
         lKpTJwZkz0ZMS3ge3Og0Tb0X+QULs3bxrAlvWOApvvwY2PBl6rK/Yhz/NVqes6rslY70
         PxMA29ZpGs5eFTq7Fa4nxKMTCEjxTBp2nrcsmMDh6GgixInQxYziz39R6Bag4UJqHLJ6
         qfh2nk2fu0jOvxjDR66Uuos6Hw4OFFJotQ30Y0sJabHlJ12ugQRpVDMpI+1O556al2R1
         PJrN/wjNlLdapHi8fDJcRKGhGD8HdNmBeVTiYqbBpIrq1QVe+UduJyi3T2Tj2IVF2AxN
         4rSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059356; x=1792664156;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=shdhjPkvDR57kNHeQ4WOOkF93PcSzZ6NOlgi8C/r/gQ=;
        b=iG8Xfkm3G2aniRURz6X9Fo2AvgO3v9wIywGGiVC0LZVlhfVI4xoU5VOdJz4t6sR4Dz
         wCDjtnr6tFL8ZeirrHi5iUJTFCjYI5UfF5xk/wGjju6Kr8PdJh1QzRTyqzgS8B5ZARHm
         jWg6PcVohpZHUq+wOCIX8tFutEH7Hmw03FJ/We9dcLvIHWw4BP73rROSQ9mIO7KM/dzF
         Qwn+eUB6lV6fnDICcu9x8/S5LInPMFlJqE/kumMyPkhFw0OYd/6eqTEmzCz1PvOVAMyO
         m3GeTCY/Ph6RyGfg2I/mKuvLzto68gf1JsIjw9PJcZOyStmqMz2PwZY2ZZk8IKVfxt/I
         2/3Q==
X-Forwarded-Encrypted: i=1; AKwUvByB8m4Wqrxgb7hhOHHfPYAyQBucr4w1lWrqvvQlyAcCglPCkJ5yXbrm9ohXEY6rVw3dBX4isx2FRkutLJNR@vger.kernel.org
X-Gm-Message-State: AFq9FYJrw3sMZALpHxeDQGcJAduapJv3E+7e8ecgwXcltzo60Erk5tde
	ndGNbSGAlAmJEeYb1aO/3UlHHcSTikAxMHVqQj2jFR1Ux+5iIlCFBaVwVxe/xjNABcnShTLxK+U
	jP0f6dQUFo8rYWKT7RuaOfgplYJ1u/VGMT68XnJHGnA55pTSCEf6UzLHxmNt4pvE3hjsx
X-Gm-Gg: AYBFou3+76aLbPiPZgcXBV6oj5zHO43Y6dzDigioSsoQbnV1fERQQuWH1tbO1xc2CMS
	kEiwHpfPWsSLPf8IVJs+Nu/k0QDEmKa+PorVBNkFpy4sIFO3iNLdbrSvGCxq/mPHNFPPT0aoOIv
	rPTb7o6DtMhWNoyF25IK8gIz5NsvL12kxMkahV+DfX8yRJgQzACz8WRSQplR7DhuiYzycz80Uni
	vGPV0VPWwndg6iUEt/yaDbuKx2sG+Yr930y7qTPO64SUpt91j4FtaMLtNF6FhoQidXlXhhkYkBq
	Z3k4JrU+3UN8yyUnYOIcjIfO02xGVt2wST0lxyIJa2NiVBQO2pXNM4V8aL/0NEeTZOb6fz8tXaG
	xZ4fHcQxA9ZSfXwLKdu1BQg==
X-Received: by 2002:a05:620a:27d6:b0:92e:6485:f640 with SMTP id af79cd13be357-93ebd224118mr3300568785a.4.1792059356047;
        Thu, 15 Oct 2026 03:15:56 -0700 (PDT)
X-Received: by 2002:a05:620a:27d6:b0:92e:6485:f640 with SMTP id af79cd13be357-93ebd224118mr3300565185a.4.1792059355485;
        Thu, 15 Oct 2026 03:15:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed6beaf65sm106831266b.3.2026.10.15.03.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:15:54 -0700 (PDT)
Message-ID: <e147f162-a52f-461e-9c70-4947019ca4ab@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:15:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] remoteproc: qcom: pas: Don't fail attach if the
 remote has crashed
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20261015013827.716465-1-shengchao.guo@oss.qualcomm.com>
 <20261015013827.716465-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015013827.716465-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jwVtWRjdfumHBQtB2sDATpCXsHPFUFDS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MCBTYWx0ZWRfX+Tu3BwvUPEIb
 kNwa/3xami6Dltetm3c7CiH2u/bWX6SMNfa0LysTE9I4iVAD8CMzCLj5c/TlUDyZ6qrHpTtgESD
 cifK6fTo+FtBxjKhBNB9ftPPioXo3udDu7X0JMu81gn9kdkSYDaKgGuDEPitTxfAvWighyLTxJD
 PvCfit1ScwN+w4qqJG2l1SiTnxG/2K2evFw8fSvflshwhLruYBXB/V1iUhGvA+KT/tPHJQR8a8K
 /cfmCVT7NnIu10fP1N/dXWH64V8+VKLfU5QqizJpYf7uNPWF2HF5uonO6rLGJ62w+I4BplVQJRb
 jEs3A4k/QJZWAJTRmtrBQGnenKWuEz9sJIuc7+sUZ9yvECXkFOHnW2wJ8r+ugaHvEH1zemjkX8q
 plgjY7b3BA+RjftMJAbNUxY2Oncs+vR3z9H5htzkmFGQfXsOLvTdoWJ1JMJS8UnKWbV4Unkk7xW
 AzEYlJKUvd9p621uG9Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MCBTYWx0ZWRfXw2Qn3Rtz9u/p
 XNkBtardfeRxSEZwu61i/Gpje2Nd+7TU4PQWAJAdDH3GfIj6UIeiAYtxI6nNdGc9yptzJEcHkRU
 4KoP6wZsgDiOmn7ry4Q1DJ8A+8RbStM=
X-Authority-Analysis: v=2.4 cv=Eb5d0/mC c=1 sm=1 tr=0 ts=6ad0a7dd cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=FBzCk_X8rep-KjbTXLsA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: jwVtWRjdfumHBQtB2sDATpCXsHPFUFDS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150040

On 10/15/26 3:38 AM, Shawn Guo wrote:
> When qcom_pas_attach() finds the fatal SMP2P bit already set, it reports
> a crash and then fails the attach. The core unwinds the attach while the
> crash work is queued: rproc_boot() drops the power refcount back to 0,
> and __rproc_attach()/rproc_attach() unprepare the subdevices, clean up
> the resource table and disable the IOMMU. Once rproc_boot() releases
> rproc->lock, the crash handler finds the rproc still RPROC_DETACHED,
> marks it RPROC_CRASHED and runs rproc_boot_recovery() on top of that
> torn-down state:

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
