Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579812;
	b=Qposz8fT3a5lRkQmRe1oKHofM1o2nBX2M6kdxe6U6eU32MfMIzKKrc3073xOFFptIikF
	 hP8sbkUFRx91Rb92dbp5Dao4cx9rGn2CBsU/djKVD9Fo2CudPi5nSlXFZI+EPpM1eB5bj
	 XASzKroSNslFq7nutGfXitgi7PRhEjky5mT9j/2AayQGU8sNt+1PpDyGbPZr3Cdi+/K1l
	 atira59Yiv9zTtEdrNLrakcp1TFmkzH9w9UJbUC/ooKAXgy0jOEKi6eWpU7AKpqW1jWXI
	 lfW0iIB+Zlzk1EybSlHwK5ldjLlwv3p4B5v4GUHJJJfgBFemGvE46MZR6h0MX+fnccQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579812;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WZtrC5nd7BZCveHlYloTin8bDZimwFGqn4L+Odkt4EU=;
	b=qJkqy/qxySr17yhWNKBIcc8v1y5/FFTro7dKGaqCAnV6hrqOpXb0QFeyR50UHYHmncAa
	 tbwugC7Qsv3y2HIoXNySzHW+Jvr1iyP98PJSxk9fPoICJKFPCUSzkKd5Y8CTXxnBkmAg2
	 xBN6+1uyhQazV8kdlcg6CsmWqaMtSl01nCIoqcfvWewNwaTFClnfPK8Z/oM6SSYjcZRf2
	 PbPiWD1BbmLS9f5OWg71fk1Ik7qVjbMHDqf9IsS2dKmBKKD+hWOFnO+tdneYDsjGNN5CF
	 czVdMyYpxO9dX8pfbMS1KLMl/cW+/Id1nTgtGF9zEEE7YDbKQcGgE/xKkatgTWc2dAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gOvB7Cz+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=djoZ8q4a;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1E8606A31B
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:50:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D1E8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gOvB7Cz+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=djoZ8q4a
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA6SFY282300
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WZtrC5nd7BZCveHlYloTin8bDZimwFGqn4L+Odkt4EU=; b=gOvB7Cz+BSjlKchn
	+/DMyddnSv/zRS+MZoIq+be5fOe9LrmjkfxKGqTPQf/DTg3Jo9augIWMf1UspFbE
	YDWhW4WhBvi5nhMqosfj/1EHpgWMv73UEtJ6VAXrp5BRS3Y9FU0GrZkyY4E1DFn6
	06mTUFggqB1K3y9AcXzyhnF2jdMkWn09Ks9frBrCAkCp1pCWC568LgzAcVbjp1IF
	PL/kJpOyU7GWDoQHRB7z806270lY2krZ6FV7FVRowxWORIzRGdQA4qngt8lMTxrU
	4jcKiv+ypULQEBwFTcW4GLnv8rINRRYkcymkgMS+Zr2K+eTo9ObyecxxSgyDrFoz
	OZ1P/Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r2mnr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:50:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2bdebfc5so16938085a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 03:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792579810; x=1793184610; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZtrC5nd7BZCveHlYloTin8bDZimwFGqn4L+Odkt4EU=;
        b=djoZ8q4aZ2Fuvobh8SIlW3ExonrwDMlsYpvwbkZAshytj1nQh5IoeDewmPsPB77lHU
         s/3iZzovP1hujUzpOr0KDZV6sNr5z5mdZC3Fqa2T4J2HbUgUXpgWkp1SeeXLEJHA0Rcf
         bVvEONJEV1Ewu4Je2y8IjNwGChgFIbLAOZ102cLiKL+MkNxZXC5AgjG8ud8rQ9gVZcRh
         KqGMGEM4+3C5Wv21TE6WliOlzhjWHduvL7nUUW18Hb/cVn1TnAZEFbU5PNq1HhPbs8Yd
         zp8lJNmo8W5jeqh8nIvz0Ieha5qitmQUa+ZSFwpGMR+zfFcJ7J13U7vCLV1ENvYpwk9C
         Ks9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579810; x=1793184610;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WZtrC5nd7BZCveHlYloTin8bDZimwFGqn4L+Odkt4EU=;
        b=t4zYT0qJcCwqy9yIE9abY9rW11WNcruJMV1hxiTuJ070cNxkpB3ZhH+LbJxiK1tbmP
         XXzlJF1H0RoRtWGsp7EkCtbhEntMCSDbttB7D0myIb3quK8br4sCEPMiYK3K+TmpbZ18
         iIJeQ2VLnKODzfpH1b0iV9DBsQnrm/bitNB0R6puedKSvOOxGjWND8IuWtb/6dMseIt3
         2PX+EhfCxcOqwdjU9UPHRnLdbpuHebcsFamRPOZsIP6YE8+3j5QZfdvIkaTIv37n3f3h
         lew7lTcCeOpednc92eQR7vZFmC2uIvfYFaCmseYb4OVxTQ5umNjoBVe62lPNenGFKwHx
         BIqw==
X-Forwarded-Encrypted: i=1; AKwUvBwXDp3MDQ5TTznViOZY+hJwcL1WEdEpzPSyrwDeO9WHsdM7kY74erhvvYl5oXxkcYP/sXhhblc+uzMp35Pu@vger.kernel.org
X-Gm-Message-State: AFq9FYKBC8MRZE3veNJWLCt2fZlGOoa3neuNKJWUvzybbruwjx1CWXiM
	MbpUB4QueaaFwRseGnl3E1Sbpd5wCbirXFxi+eClIyIEeA2DjgbXdMXlxthFjajV7dZPrgYmSMJ
	P6X+3iXsplASe1SEJvX90ST5DT5Bq6bmRBqGhQQOSjIiZgj0aUEG5+alXMOme4RZIhIqb
X-Gm-Gg: AYBFou0w6T59HReucxVwlwgcCaont7+A30ukeZBEIQZlwUTURt2GSukHl9wBtc6gmUt
	vMVmO5BcyEVO0lGmQ4dd+lMu9doq+wIhDYtmCFXrvzDB0u4Mxp90LWdtlskR2eiFA22DfCccZTr
	N7hJHDffDlcyNv/Z4ZyWg5OGiyjh/00iQneh0ZJ2oVhLxB7XfkACdWnkUDAzBT0h0WbXEmBdCbD
	o1gN8eaKbBYk3pj7f/8hzRr2HlToDA+I2Dxi+aXPFjIhm/fjzc6AruIFLHgSg/FgY2sHOCPZXJz
	bpEPtdVfpd1KiqV84OWJoPVJaf3IjrDoXIllMX3muvuOoEN7VQ0GjyFQjJHcTw+YePWuYx4vqNW
	sdioBngTeAAdOlNTZcVfdQg==
X-Received: by 2002:a05:620a:480a:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f57f87853mr411697085a.6.1792579809714;
        Wed, 21 Oct 2026 03:50:09 -0700 (PDT)
X-Received: by 2002:a05:620a:480a:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f57f87853mr411693285a.6.1792579809294;
        Wed, 21 Oct 2026 03:50:09 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b403155331sm740891a12.31.2026.10.21.03.50.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:50:08 -0700 (PDT)
Message-ID: <56569e6c-bb8a-40cf-87e0-bcdee5fdc969@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:50:06 +0200
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
Subject: Re: [PATCH v3 5/7] i2c: qcom-cci: Extend i2c read limits based on CCI
 revision
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016-cci-imp-v3-0-5ee7ec1ea1a1@oss.qualcomm.com>
 <20261016-cci-imp-v3-5-5ee7ec1ea1a1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-cci-imp-v3-5-5ee7ec1ea1a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad898e2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=vrbjsZuTOpLc0F945_kA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: wVRm8LQZjAq96StDaD3wk9YfcaMrsQCI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MyBTYWx0ZWRfXwhqBJIKfy3ys
 ivLHDKbmUjUU24N7nkvyYXfHmOIT+h0Y0+S7MaU2xX6UGlXApl9BTdQRTYt2NeH/XHE+/ALjri/
 yUc5280dkn6nj7hcyWBg4+jes5GGtcaaSEnpps1qN4bHFsxJFyfcuw4oZ3zCYJbxxGYrDvMJ5hm
 Kflxhz+jKMVSuz7pfEJlUETphTF+Lm5lJsXtIxTkofp5B6+rPuqLTu1Erc1MxQI6yrOB0ti7uan
 aG+tS87uQBc9XNgN0qAqg9N131N8Ow8rjgN87J4k1TLu9UbjFz/AE8Np/vV+2jGgGbAj4PaBzWI
 s28hLxq5PgqV+R/yfc1rDYFCeWmA8E8L8hYNBV2tG4S80Vhg9LXU/LICGu/OFnMNlSvwre2QVnV
 OdBm8uZHXTAdWt0EDFAB5WmmFmHMDEMaN3l37kheGoSMpuBBz3KsTU4rzilR8Vw4O3/uqPte5E0
 MfONICAzC80uzMNMfFQ==
X-Proofpoint-GUID: wVRm8LQZjAq96StDaD3wk9YfcaMrsQCI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MyBTYWx0ZWRfX11cV5NlnSHqQ
 sqA8uQrb5K+asaTT7dOfW/dgf7+at5xaqNzXVvpQU7Bcw7h3bbdNI0qNVqMekqyX5XYDJ1yoWoH
 sZsWlGcS0XUrU+1wDQluHTOJDaYfE/4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210043

On 10/16/26 10:00 AM, Loic Poulain wrote:
> max_read_len was hardcoded to 12 bytes for all CCI revisions, but
> this does not reflect the actual hardware limits. Depending on the
> CCI version, the maximum read size is either 14 bytes (16 - 2) or
> 254 bytes (256 - 2), corresponding to FIFO_SIZE - 2. Two FIFO
> bytes are reserved by the hardware, with the first and last bytes
> used for metadata such as slave ID/address reporting.
> 
> Add CCI_I2C_READ_MAX_LEN macro to derive max_read_len from each
> revision's FIFO size instead of hardcoding it and adjust the
> values according the hardware revisions.
> 
> Improve the FIFO read procedure, read the first word, discard
> its ID-echo byte, then drain the remaining words in a plain loop.
> Switch to readl_relaxed() for the FIFO reads, since the preceding
> wait_for_completion_timeout() already orders them against the
> hardware's completion interrupt.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
