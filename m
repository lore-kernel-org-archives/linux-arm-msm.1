Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577632;
	b=AQJvxkjZ08MUJZr2+0nxaonVTKJovdtLtuNVCmYxpLdiUk8PnS0qe/w6qtvztRr0Vbhm
	 dc3MS2nIFO/gFiZkgJTzGK5qQaDkDgvVAoo2BXjHoPVSQes9fzOaVAk+Mx7IpSzp1bW8v
	 PwulfXvdP4ifk4MODaf9OSsYeHkoDYTxY+EGvsjehNfbDr7Fuif/5LbVFwRKJOJGxSfnI
	 xs1DOafy/7gesFgmlyZXx8+Q0kvz9E2ChktuEjjeEz9QIFS2ex2xj/jP+7apz2LJhattp
	 zWwotmJe8xotvdu/ZqvyhGO5lohnbyGuyJgkOF88P6kdtXJ7pHTKYWXSemfItCi6pgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577632;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DsAf1x9yGOnvdEfTkWRdjJVmWoVcIt4Ct0cvIU8vs6I=;
	b=2+RNohAyePj94xluXgSnt8Nqn57SZwp5OeY2qzL+tFDDgKd59KiHUOyLtF6uReloPvcO
	 06tl6xLbVfTgkVOyuo47I8084IAK56MTVlRKGfMGKPkfP06ygkfZEzYqbrBYIzvwUI2SO
	 Q4CsYLgN8p/0e1hcI4LkpsXNp85yVuVo86jxmy5UqCmQALQ1GRYgrtAd25WRJT38CEsFX
	 ittmLRM8VtSluwRPQnr5uroQ2F779hL43MZHXIsp9h4iaK8mBLivy5KUKXEAw2bFRjmx6
	 Y+pQVbJiocaH0sxa54i4bVnlJuSlwr5udk799kTuTVU2qbFV8dpqgXzuKOXi8o0Lv+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iVzNUnuj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WRdCIOL2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AAD606A31D
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7AAD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iVzNUnuj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WRdCIOL2
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA6R9q282252
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:13:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DsAf1x9yGOnvdEfTkWRdjJVmWoVcIt4Ct0cvIU8vs6I=; b=iVzNUnujYHA3V9R7
	hcOuAWdvNdtyjm2mjF82GXc6S3/HAqgRlEIhBzHwGMrldPe2Rg8y9hVVTLOVG/rn
	sKAyQVFsSLh+z46A8K4s2Teiwxb//N418PEZtFBUu1mwpfc2NVojXjVgl7hqwUhP
	VB/me1qJd8dZhjBtKtvMXNFScA2uA5gofh2thSqjMDKD7BFOVXxuzPXZcWffSz3b
	eKKIeCuh7HBegJk+taiZNXJXoxAoa9HQXzAw2Z1Yj+N2JaGStAJOTvRLTKymxb0c
	4z4Y9V/Mog5cym5TYrlKCOTa5hVeLHAHqdysoObK/EelBrgE1DAZT7oPsdIdOfcS
	C0JMqQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r2gyx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:13:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc50fb0d2so8988985a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 03:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792577630; x=1793182430; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DsAf1x9yGOnvdEfTkWRdjJVmWoVcIt4Ct0cvIU8vs6I=;
        b=WRdCIOL2DLoIdAdg2NhJrfORU8NKBUCbqn9NVMtLiDUA6sUZm4fZhR9rruEcGz/4Kn
         EWoxzihxfwrqnzMt5OEF+iADdp9lAYASBYv3aMvbEg/IM2/Ml3r68Db7ZZiz/po9Zqz9
         ZXEPE+4svlE3eL8imjn3jhZh1+i36cG/YVOizbT0bn3eibE4X6jsiZb7qqMk9A1NuTD7
         LvdX8ythKCWUef4g4BwPKjnjsnaGGwBSo1VSdAqVUMTEM903NjB8ctWYjwuhSjZ3Rz67
         eNV20GxqOUDihQLTSyc6OSXv362pGIBO2eaezdFFNUOwBpPZmEtbb1cHlqzJHnHps7jo
         M3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792577630; x=1793182430;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DsAf1x9yGOnvdEfTkWRdjJVmWoVcIt4Ct0cvIU8vs6I=;
        b=wBFpsj2XYISvRNYBE+e9SM9wIuasEjOBTiOLWQ36Jo/3CarA6BWAWoKEhstbIaqwh+
         VayEGNV2gGFEpYe0XTx1rrXnVvkJmN6O88VPUvoHENQmUFu23fzSG2uDlCtkMdGpjM4d
         lAtpzAZNfo54OPbmnlpfMJInz2YLyUHyybzObEbn5JbdAfukP9De9MHGwzH8SNiRB3qc
         kx7OVUhzrwQE+aGh6NrnYry038O4l2UBKTUTc/YmomgvvNUn/puzNUzH4CwcrC+ZUA+F
         0HeRuAFudSjMWh6lWXQWLn82rpmPBhRWII46dKn7tFs6LSEctiGCWVeNJxFMPAGJlyBs
         2tXA==
X-Gm-Message-State: AFq9FYKRIyDt4XYzeUlhUrESvcsHJQripMXhqojRAsPRnfiR4hsO3Ved
	A4gu83cApPMh0cD153uEKAwVhdViNfLyfiQ3mO/4InKXKIxSF1SKbevkuMMW3xwb5qr0OlAc9qp
	pWrI+yLU1Hd0lFnaW7oycyqSmBgwTr+qXvwtTgkksB3izURmF3jD3mAPvOgGaFNJXFOQ0
X-Gm-Gg: AYBFou0n2nZ3/OUUl081Z14NtxsTWCL/mHGBCHbROdATgMNw2nEgE7G1XjUtptGH8AF
	s2Icing59k8PXgfF+3c+gzgod5cp8Ocj/EYW8L3VW0Im6uwNW1Bps1j55EEdG2Ve/TlPIqaptWr
	iMSI73eph9DLre22shZfwqp4CTM1CRtMDzNr04Dpe26dQLnSjBS0hTtGh7NKK86XoioUgwSByeC
	B7a37Lzuad3doxl5/kR3vARStF9MqAsDkueYbozDKTq0tfl0ykgvLoJsoCL4c1nTfLC4JBqTqaz
	/0564mxE5pcGHx4NnR5hkpP0LyH9w9XssWWJ93gy8z6nMSKJwWrrI68L2WLaaQ318sycUydoN1C
	SAOu+T+oPhFxRK3n9nwyldQ==
X-Received: by 2002:a05:620a:1a15:b0:939:c7d1:7471 with SMTP id af79cd13be357-93f57f7036dmr355236685a.4.1792577629881;
        Wed, 21 Oct 2026 03:13:49 -0700 (PDT)
X-Received: by 2002:a05:620a:1a15:b0:939:c7d1:7471 with SMTP id af79cd13be357-93f57f7036dmr355233185a.4.1792577629343;
        Wed, 21 Oct 2026 03:13:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678e5a82fsm62538766b.4.2026.10.21.03.13.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:13:48 -0700 (PDT)
Message-ID: <12ea4915-5ecb-46e8-ad56-57ee989e1efc@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:13:46 +0200
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
Subject: Re: [PATCH 1/2] remoteproc: qcom_q6v5_pas: Fix 64-bit address
 truncation in dump and translation
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-0-f19b4b947bba@oss.qualcomm.com>
 <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-1-f19b4b947bba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-1-f19b4b947bba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad8905e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=1FkldgVRT0rVbtvJ3NUA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: UV0N7N6aOPXbgKYI6KVuJ_iX59f_PUvT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfXyYtkS6ZmePLU
 lmoTnldT5wMly3T4gHRhtHjatT95scpdY99Gv0X5btNtA2761srWPlOelbuPO+bstKytvqPWIWr
 ZyObceFRmnIKHa1mDJy4JHOmUOnfuUsmnUzJWziY5g7ZbLY6Vl8W9mvbp/JytTWhg9EJe2L+stV
 QwABT3U5ZGg4usjrR1YyLFXZvpO4AulRvOhGRo8j8DZUctiPIl8hg7agStzjmK+eCjcmNZz/Vou
 XEbfi3gfidYWWN5PrgWUw/JeJZKFcTx5/kNTpuIjQs2u2pEmISehKtRVvSgA0crg/SSkgrX4Poy
 MAqdpzBA558hFqPNN3Q+nIoYUMHdS/NQTkin6Py0OK//hit/Y4X0jc0Pkt14IXijJuI1mvGAh66
 aV3OrzSL2sfdXmfNmtiWTFQcvhMGkdjzqqqtWwC9qtol/jC4MIF9rxZEo24HF1XCUvNtNB/CkwT
 ls5lOhMVvBjfavjVGFA==
X-Proofpoint-GUID: UV0N7N6aOPXbgKYI6KVuJ_iX59f_PUvT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX/Oo+7YsBK895
 /wq6pI3+q43QAHqfecQqQbWABz9ak2dUguTXFY6gBF4O4ouUN7QpW3LBut3ny+Zx+2dsYFSOBeP
 iUvW8A3pAkc8dbSPWeN4W9a+JsrKfJQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210040

On 9/21/26 6:36 PM, Anup Vishwakarma wrote:
> In qcom_pas_segment_dump() and qcom_pas_da_to_va(), the offset
> calculation results are stored in signed 32-bit integers (total_offset
> and offset). On 64-bit architectures, this can truncate the 64-bit
> address arithmetic result if the subtraction or addition exceeds 2GB,
> causing erroneous bounds check failures or invalid pointer translations.
> 
> Fix this by using unsigned size_t offsets and explicit comparison-based
> bounds checking. Check that the address is above the base before
> subtracting, and use the form (len > mem_size - offset) instead of
> (offset + len > mem_size) to avoid unsigned overflow.
> 
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---

Fixes: a376c10d45a8 ("remoteproc: qcom: pas: Adjust the phys addr wrt the mem region")

Konrad
