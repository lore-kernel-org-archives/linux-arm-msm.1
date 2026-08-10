Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6139E49620
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 07:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786347361; cv=none; b=WnBoXMLY9xrMWdqnjaFW9NJ2lUc1GfX+9rVybynRvPCU3rK0wPnyQeu8XOEv8dKnFmdKTD+NTFnI/4v9LbQW4RXHm0kjx/2zmshHm+AbTg1bM6yWU8nEmjBKvArjBoQlkm3CyA7v1LBtqD78P+ulznKOwfqb1+68C7bvzMA7SW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786347361; c=relaxed/simple;
	bh=/SXCCv8ETCF4P7OFRxa5o5VZwr4nXiUWimzoLomt9Es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NhpTHfOm4+bDjZKJm1zEFh4HvuBALjjDKku95vHmBkC7An/FjMY6TzFYXNS/odFkMaPiZQjoqAhq9tq+8f+ekekadXKU4Y0eOjHHwIwZaiFW+f/n9eMGdxfBkjGpFc/un62X70PD0/Bpd307J9HsYs4eLmkOyeiqy+csHtx1cKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WisU5sEm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VnCJL6ag; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WisU5sEm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VnCJL6ag"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A5qGxx679233
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 07:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+obSGFNX6eqQuHU6KiwLi2BJ
	tep59/nfGys145Wr4Ik=; b=WisU5sEmXnJbrTl03jWDV24G/jszu51jQ3TKdbO0
	piBaY3clLBSblOtpOoI17X/EBxBBby7GOgE2I/WiwHQfxdfavjx+eG69xidcyyuM
	guh7NHe4YNVueqaXo+9Rh1lF9nk+KUabemryaWLCUQpSnkY7SafqhD7jDpxUhzlB
	mGC6O9qH6SvpDyHIZg6lxYvL4AQ3s4tMUeAyF3gb1514C5BlQ18xtqNuBDG5EmQT
	EpGvBUSCot/WkRM8xXGSbjasN0+GTye7t3nxBqmnHc38n5IVqNNtEuVO0i6ddZja
	y316GZk7NJ1y4YN8IcfXH0jspBmI6YzuT/Lo+FvF0K73GQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8vhgadm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 07:35:59 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e024d2129so3294315b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 00:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786347358; x=1786952158; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+obSGFNX6eqQuHU6KiwLi2BJtep59/nfGys145Wr4Ik=;
        b=VnCJL6agPlEaAFgblqfVG1zvv7j7OlZrFoCgBboYhB4gWKfB6HgIjNEgPPTvVThj5e
         MYcKpzmAkxhBTm09RwpC2wT/IBKOrau/qnyj4EllfxvTLrEzQ9E+g+07D6EmCXvEVBtc
         oTYlje/pDffpbxs7zhCUxh8LwiI9NBQeKlbrZOXz7L2OGSUBJhhGtCxR9zRB5lj8khnM
         RErXRF8f/lHTYL0+IDN9KPdyHBqdafrmQ9pVSRN1Zk49GwekFewiERzcU4Id2pWHavlP
         j82AzFiqJIeNB5zTiTEO5bcw1vt40dGHwV3wv19TCtYjoohzlgLMBEf6gA665WRCl8wB
         dDUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786347358; x=1786952158;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+obSGFNX6eqQuHU6KiwLi2BJtep59/nfGys145Wr4Ik=;
        b=OxnZsTOFRrw6Is+xx0DnQx1k62YjFGcRrc2fynEEXlhf0jkfUXG5EPB9ue4Tz0iyeA
         /YR1EgLZmTRuf8GNjGTzxvmQF+ROIDZpZQ7qYbuuLHdWjqMQNwJWo/+RlbyfQV5b+vdo
         RpX/71kcQi3TAsS2OQotkLUuXQH4CLvrFQ3OLo4AqxtviKDLiC/HHFs4/CQ/3OL6wXkl
         6WiZF/OqO9kj5HLIG3W+pdsrrixIR+ajzLEw115spi+EZ0yUUTlLRpsybYeqPWT/ihlh
         XPlGrkIoSu3IcNPJCsQC3f0JeIgv9lwJP31fTe7KV0ztx0UowFbydnxRNe8nxXG+xoxv
         j+FQ==
X-Forwarded-Encrypted: i=1; AHgh+RroRASBpaeQ2+oY8nBlNzLpc4Mi1uwQIXEuFxLocs/iO4eTtEphWKvUyoWtQbiIbolRycij4oX2OERobZ4m@vger.kernel.org
X-Gm-Message-State: AOJu0YwoLFMw0hG6tuanTNkbfsT/smcgvOpC1LtwW/zl9FWpKnCD9AQg
	2MVU2gGXRS2K0JVKG1+3P7xAvJt7aOnJ2Svg6QJVjHZqJYsZpVvTf8mHXZnNO9yv7VAvQP3Fq27
	EXPQVpGx2tmiYUaDoRpPiUOvGx6k7YM81O7zg3xSUnGY/8Aufr7BjViD+JeR+zVYoHsse
X-Gm-Gg: AR+sD10WQCHsfvaHW210vvtNjOUQuN5yk6WC2Yk8U7A1UiZ/ygyKn0GfZC0Gel4zM44
	GJomEwyw0VLPIh35WRZ3G9sGh0KjSnPwv+Tsyk9JbeZSkIcwdpykQRtIZGPOd98X/4m+ktvj3Pl
	RRPQOCRhplEZRofBJrzjp+pcxU+r/mGKJpLyjl6DUfxJs3CzFpiISwCkJlUVs5IJi8NMAMjCF1A
	+1dx0gtyaymdCBjHGRReuTgLMC9/J1vubcsmeVEphdtfWrUcwYn1ZdRvekojQmF/Ne+/QIk9PTe
	doFDuoFhDn+N8rBZ6ZR8hD5XFQn/S1hmjkZynZE6PM/SvKKc4DB84cAICWDwr0/2A5R3n2Jo99H
	54hZ0F6wMC+YQFR8TtYFGmkIlRYfU2T1BjUozrb2U5vM=
X-Received: by 2002:a05:6a00:4c96:b0:848:4424:2b8e with SMTP id d2e1a72fcca58-84f5df36a39mr26856796b3a.3.1786347358281;
        Mon, 10 Aug 2026 00:35:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c96:b0:848:4424:2b8e with SMTP id d2e1a72fcca58-84f5df36a39mr26856738b3a.3.1786347357831;
        Mon, 10 Aug 2026 00:35:57 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a51f429sm3376724b3a.34.2026.08.10.00.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 00:35:57 -0700 (PDT)
Date: Mon, 10 Aug 2026 15:35:50 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v9 3/6] arm64: dts: qcom: Add device tree for Nord
 Embedded variant
Message-ID: <anl_Vr5a62y5TMZv@QCOM-aGQu4IUr3Y>
References: <20260806081554.448531-1-shengchao.guo@oss.qualcomm.com>
 <20260806081554.448531-4-shengchao.guo@oss.qualcomm.com>
 <85e9f275-a16e-4dea-b158-3d6005a7366c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85e9f275-a16e-4dea-b158-3d6005a7366c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=MMtQXsZl c=1 sm=1 tr=0 ts=6a797f5f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Sqg8vRiKHwi1C2vNMTsA:9 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: OvhAgJ33ebSd77RghqLOxx-A4FNZtQhu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA2MyBTYWx0ZWRfX48u+N8DxNP2D
 TTS3dVh+igyTg82FzlsDXgGYGZVkqRpK55BxV0027z3C/DiNaVCbqXnduh7Oc+b1h+kOsUrS3No
 nA18f6/iRMQ9cIbY3abp4C0Lnnbt/7McKrCGHkNoQWG0lCuds+fW5LyohwM6u0cxz6l1vT0ZfDb
 DOyqC0+AgWFSPGVBSPIeyUgL2H5YWqVJZkYqqk33+F3dMWj6EjVOdR1YXOfvgUnDDXXcrnwgZ0y
 52F53ZtThwHnc39oSseVQEYKd7VFBac/x1rqiqdFCpoa5ELCJDsyW3O9lrn5zWTa9HaqLz/Jd+f
 WQI/VXIe4x/+TKJbM/m0R73U14xJWnej+yTiWf6HE3sz6++M+Wu/0dAITYOJYtUx7AdgXWrPxx3
 9L45arJ5m2O50XzdnqMWwtoTchqyT0GJGWQjiA9cab7iwB/hCPl/1I3x+7q/mAKC3GLBkx8+kgH
 sMCY135anPCXreOZ+Rg==
X-Proofpoint-GUID: OvhAgJ33ebSd77RghqLOxx-A4FNZtQhu
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA2MyBTYWx0ZWRfX52PsvUiBen3V
 dtjsjcnqRuRZ1UzPhvXWlGz/8vVOAs5vJlTOpd8QH0I1hQ3cH3chow6aKkLuTE3MXJtXUkHY45v
 k8iJTKes9XCGTWCtd1awS9xFP8kX0uw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_01,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100063

On Mon, Aug 10, 2026 at 10:43:44AM +0530, Kuldeep Singh wrote:
> > +	ice: crypto@1d48000 {
> > +		compatible = "qcom,nord-inline-crypto-engine",
> > +			     "qcom,inline-crypto-engine";
> > +		reg = <0x0 0x01d48000 0x0 0x10000>;
> 
> The size as per hardware guide is 0x18000.

Indeed! Thanks for spotting it, Kuldeep! I will fix it with v10.

Shawn

> I've fixed kodiak etc. target reg size recently.
> 
> https://lore.kernel.org/linux-arm-msm/20260402-ice_dt_reg_fix-v1-0-74e4c2129238@oss.qualcomm.com/
