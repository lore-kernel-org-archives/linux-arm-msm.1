Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579521;
	b=SkA5xyJQ4Hh79zU8XMlM5NKBrRdGXIMBTczkT2nxHyhiMHzlp6rW9KUPAVLT7E59mTQO
	 fX3UBZhwqJls+yQHcvNDfKj4rJCb5gWLbsVSy9cPUl6Ul6LYIZEtUxWPzO18KgDJsPXyB
	 rqt8CD+rHvvKzZ2JTDrMxTkOX1mrsFha6sT+twAezD1OW5fsGLOlqs1kBiL4eRUsykMWC
	 4im9M/QQisSLg9saK71E1bvGe5p62IFGndc4zVBPv6997m0yp3z7MDwMRNEIjVIIAJlbC
	 JT5kFmDjXdSvFFiWRxJY+eB/dejxq7lZ9aCwlvOSVVBg+PZvuzjYPzu4sD0LgNjvo1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579521;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Nor4mYt9+XCqCaIC8FOVwGZ+YV4SqZ7jC36z4M6cRUI=;
	b=3QV3U6sJ8gVlJhHI23Y3EAsa6J/rorRFt9g10EPDRSGVre9RnPUZjYWNPAWCmLvpjK6a
	 sNLR6HpAcxucytKEYpyN9U8E7O3CSGoZ+oyItwY1Q2F8a3ZWyKZRM2Y8dtl2yqDl/XOhz
	 OjOxrRX4yRiyYhDm886Pkuk1QpALr6pfqBl00/SIiYnWKwRFL6sOBAkxNIub2Y7kpjUQh
	 Kt18k7mKgWDcfHi7xJi2ikuK+NbBya6qrAbyJb/0lQvb87rpmWhd9+FWQEitskjgRJzHG
	 Ave+jCvubFpni/g/Rhqk7wgzyCKPjFxCs3n3ZeGRSEo0ORRX5Lp37cWnK6KdrLqzTFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pCwlGlQ7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PUXMuD0l;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72889606A319
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:45:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72889606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pCwlGlQ7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PUXMuD0l
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5fBa1356961
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nor4mYt9+XCqCaIC8FOVwGZ+YV4SqZ7jC36z4M6cRUI=; b=pCwlGlQ7TULyLQ0w
	VfK5z2loe6L1KPeaANBAJZ8pkaKWQ8R2PVuIb95CPFVTWpMnlgbuZFhAFcEayBzU
	8y6RRU4LkrO9yQ0jJUjgnqlL8lmmogBlfQxANiRSUvQjx8L/oGT/P6iB9nNCKoZO
	VDpL1BKr44Vm9cOpY2HIi4oRrjm0V3CU727M9m+lnwD0hzK8xRSEmGvXll6pk/JN
	+nf6mCGAG42up6rFCPGROMScRXJJFZX620NOavkNrr2feVs4zeWmnA6dNVLl0Fr5
	/c5sBpV7rozx+TGhL22/jvGviC/C0+yvupb+AwGCXlpeiswkjRYhus/B45mHJ8x/
	qjlBLQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4uggx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:45:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e629c7b16so14708785a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 03:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792579517; x=1793184317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nor4mYt9+XCqCaIC8FOVwGZ+YV4SqZ7jC36z4M6cRUI=;
        b=PUXMuD0l9QomEUJJvS72fqQWjQgAP5UUJwwj39WTRLDckeWSDk9MdYyuvxKJMDuO9R
         /hOABgkQSAeafB+2/lIV/SFVbyCgGfiiUzcMk7LuRpj4BnDmYrUwwrioy3Olz2eYfVTb
         aw54c9z7paUTEIqfghnTmrTPc1GbU9cH/9T3QRcDROuV1BAINtX0MDv7p5lqB0SsrTjy
         05hWs7d76hULtUFHVr+qlMdOxRwbU7vDHqJuzVenaRk9/slLAaQYXFgKKcbc9gxqlXpy
         s3nD4gHj4dJVftBY+qjzWPMmkDVScRDg5jsLlAR3Z8fMs+m08RJ1/qWc1tRw81FqvfLb
         7uZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579517; x=1793184317;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nor4mYt9+XCqCaIC8FOVwGZ+YV4SqZ7jC36z4M6cRUI=;
        b=fVCvV1vipTbaUKwX8k/QRx/XFv0OwI+iOuPbJeMhH40GNBsLd/fAI2qKTdicfG5Flt
         OpnkTIR1Wiv4lrsb1dwVLLznrTXx/E1hdVtzJVdU6VfgquAp47/KgYw+LuCi10e7OsAK
         V0eT7+TIchgC8ElzkzoELAkEIZoqdmz73v+nI5AifRErSYlfeW1p1WGoguFhArc1JTBX
         BqVhfVht6/4Hn4afQhee7P6J9kBLUgJiT5ykwWWzJ36cywTEisYOXxxUFgYzc8jLU8f3
         QdkhrTDYJ2ZiIa63UwqOcgvYG1ojXBX0KSqlVpOkC6G7IVMkPLxyJWTsn6+HTFguexUn
         63Dg==
X-Forwarded-Encrypted: i=1; AKwUvByypCCvTz7i0j2TWTKXJ/ibP/cZKo+iZ/3lLC755NFhE6vU/C2jXZz7yw6Sa+mRjLPc17LGjjFOfQ1ouma+@vger.kernel.org
X-Gm-Message-State: AFq9FYIpkSsXZJURGVwEN/nNLy3WavGqEO0O8LA21plsjojCcKubJKhi
	ff+oLBBCunRylGlxu4xFJ2LKEF2ra1eoqKOXann/2Dd6Q71/kiZ5lmrPIBVjRw59/tIUm1OfqH4
	SgZ9W7Ql7zpyygRes+xb/TOAFUhfGWPzQ2nJjKj8DR+CO+0c2FYYHNauQE8kNFOmOjtkB
X-Gm-Gg: AYBFou2V6hFWbMPz7l0np7LDbjMyp5AkRjz21qkik0+ALQvhFNznaO/1PnNCAOHsLMb
	oPxgwvaZRUfcKjzF8gJ4krw1xpcVkug4PSx/C/TUU0m6zykP5yGpg1jLu6sCutcxnMHi8h8521B
	oTmjrXRtf3COpvp3jNyIc49TRSup2b44f1NINukAlYvKQ6XQ1C+OOUVgNnkldpqURJMtU0E/XF8
	gUX8zq13WRoFczzTbioQhl6STSOrJERex28qT8hKYEF8+mhX0FqNRdEo8lrrQKa81dWt9C790NJ
	WKWe/Kgo2yV6/aMwGgwZSl8H78B+r+aFXnXLTOHMHabiXKNrLRZdU1Pb6bfVu6AciU5ck5w7cM6
	CFzEWXOxjfvnXYwf5skTq6g==
X-Received: by 2002:a05:620a:4511:b0:93f:977:5d9 with SMTP id af79cd13be357-93f57dbe348mr398740485a.0.1792579516630;
        Wed, 21 Oct 2026 03:45:16 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:93f:977:5d9 with SMTP id af79cd13be357-93f57dbe348mr398737085a.0.1792579516230;
        Wed, 21 Oct 2026 03:45:16 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4030daedbsm741643a12.13.2026.10.21.03.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:45:15 -0700 (PDT)
Message-ID: <4c3f41c8-6974-491b-97dc-3557c0ba0c28@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:45:11 +0200
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
Subject: Re: [PATCH v3 4/7] i2c: qcom-cci: Add burst write support
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016-cci-imp-v3-0-5ee7ec1ea1a1@oss.qualcomm.com>
 <20261016-cci-imp-v3-4-5ee7ec1ea1a1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-cci-imp-v3-4-5ee7ec1ea1a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wTQVANv-yOQNjmpZkXSBc5T-WpBVKtDC
X-Proofpoint-GUID: wTQVANv-yOQNjmpZkXSBc5T-WpBVKtDC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX9EUcXqH81mmA
 8i5TzTbsVUb0jDoNVizoumjgm3jdtt+5Hn2leI8yrlQiqM3DIEkn4xQVuEhupX7Pl8IeUiVdrGp
 0TjzkOrv1nV3U3CZRvFk5NgUj+tLGUk=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad897bf cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=vtxEUVkT7waMBiOsAPUA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX8pwYHVq/gBMx
 tPYaCPvXwhJ+PB9lXsqSmxlnF9x6g9hy+YSWtIqUilJI4Yq5ckeA/M65LbB8wLbBkNFAnRd385z
 dgqQUR/dJYJxz6ljl5Wy+kbQApnTslsKw4RwQAVIvqBu8BhIg4g3+HtjUY+cdFR4gkBiyNJ7ekK
 qgV+2QkfD7PrOb/3miEo4NOPvTplZhnlw4GCssind6oQtq3wehwZPsQou++cFXeCEe0R0c2WARr
 njy124ZxWY7AguNNaoEy9OQBtnoNdKzzfZCAy3W2QxZsc5G5X1+p25TpL8tHnfwFp6khWzN9DSa
 d4+UXHAstgJkUAYHQYsSkcRnNiMNY43NWoREuJixPIS5u1APMIRu7BNkKmKu32muYpsZk49azNR
 3fHad6B0R9hG15jfGrInpx/RGboIUjsPqKiIVZX8+5FimE3G+WSHi081zd6aEWbuw8CXxzk8ULB
 s4igh2cq9XFSZlPjIwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210042

On 10/16/26 10:00 AM, Loic Poulain wrote:
> A single CCI_I2C_WRITE command can only carry up to 11 bytes,
> so every i2c write was capped at that size via i2c max_write
> quirk.
> 
> CCI v1.2 introduces burst mode support, where consecutive
> write commands (marked as burst) run back-to-back as a single
> transfer.
> 
> Use this in cci_i2c_write() to allow longer writes across the
> whole queue instead of a single command's payload, and raise
> max_write_len accordingly for every CCI revision that supports
> burst mode.
> 
> unlock/lock commands are required to ensure the commands for
> a given transfer are executed atomically.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
