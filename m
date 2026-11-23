Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462882;
	b=URxAwCe4AFs3a+KKu7jKOlHmCjqsDgRxkKawCPgQj05vLLdT+QQeJp5nI8tpmRXhxZQJ
	 o2JtqwU9fy3BloigIVpvza+bm8Np9XiMzH2CCN8a3NAaYW7rFAufpACRj6t3E84n0KClq
	 ip2qwWZ37F2CDLoTHQAJkwNeckr/8ZmXQCDeIbIPoVudzQBjIhSJqyII55Ls9j2cNH9VP
	 cOVbXKZ+fI04ydIu1h/LsnOkaoH4lDDopobze1FRwdpR1KQH4xzTviKDkVxLXb1McoVBo
	 8ZLXGX8XEjplmX9bJ2xoX06CgN52Blve0lotFanajKle7wwbGx3uMwJ3kGASCDGk6kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462882;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vUxC6ouspxhWBpss9anyN8/bpVZ3ii1paTC8Jy1Fd2E=;
	b=E0KwaxY+ynXHZztREe+q00iZg5LF69RYWySxhoITSGsPkSI19yq9iLZAFEm7NsPGy77a
	 9YP0vD6/9shPaq1cLowwifWUpjYPf8cTNvJOd68OvCvfJ5f+HsEpH+XJHO7NpmcHWUuIM
	 fxV+/eMKqwhoId8FsCy8MEbEKAHtb11Hl2qfFoQhNv/1qcHnvLMpEdpWGYM+qhX6L0zLq
	 Wi9gGuqQTmJLCTNutVhNB+Vtvt3Aix+aOZUhXMaVUtu+CjEQSguyBxCrn47sfpx1eXn+S
	 PY2JJXniV2TJPHzktDwIPfWW/CpLjR/jhYaS4wRBi119KgNZ5+D0MIytyyQzMAfbZZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gwmsFTUb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PNEm+xyY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89755606A327
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:41:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89755606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gwmsFTUb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PNEm+xyY
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH96d3475364
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vUxC6ouspxhWBpss9anyN8/b
	pVZ3ii1paTC8Jy1Fd2E=; b=gwmsFTUb59Zlc/gg1IMdg77AcKGA2SPYuhe1s2Nl
	e00LRSFZUHuu92szoKHByqwXiKxGIB4AQNljm3o49yyhK8/9ImAeHMGZcLVvkmiM
	ti6br/HGCe5iVbeQ7ldCmOhUUxf6v/MZlWhkgSRGoOlB5hYQFQisbuj2GVIZvjxS
	C4HaAFhERQAAYk2ktkBBn2itn2sydqBOzcNvDrN/t0X3n0EzYiesLa3uVmxIiN7o
	XjaNwU8jKPfBwO1DMbNj5DZ4PzBDla/MFvne+J/fZyYgUHEvqbT0NQ7NoE++VACe
	I2GHZuAK+4p4lNdv90dhhaBhJ5FnFinUWCFrJtnKJ+9VNw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7ttgy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:41:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94961511b61so623434985a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462880; x=1796067680; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vUxC6ouspxhWBpss9anyN8/bpVZ3ii1paTC8Jy1Fd2E=;
        b=PNEm+xyYtYD3WYMLO4JiGXPnu//+YIHMGSP6TKR7ESKmlF++vtlKuz549mAwXbkDK8
         /Q3S2UbOeR2y0qgJq/fBTE2orlnkvvBK+qmzFc9oJv66PZ7cAbuKT1wsD69oc5ic0EI/
         18wuE5btsqgKpHHxD3aYzIlbzE1GKZbBdBe8DVSjzLOC70vbEPmPJhB3k29RsBASh5B9
         dFmBlPdA8/vmHN++i5wJu4Ynzs0TLmMqcPwf4SjC7amcNEJ+KCfdjXg++UNDJwtBbXo2
         XgXD+JPbYEXJQClqP9awtz71jEl0pxcimi4BypKXPfVCuo5rWvn7Ce/nJanM1fnvCsh3
         09Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462880; x=1796067680;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vUxC6ouspxhWBpss9anyN8/bpVZ3ii1paTC8Jy1Fd2E=;
        b=AHPVh15mpi1pFvWpFzYKz0yiedb9mRWJX9WXOuNpAaEx8afKeU7XgDZZpqPWj5qrCP
         xZx5FGi3qFyuAbtkX4KbiHAd4GMoIG2v1xsULhoQp7Y8xP6XyobhGvcpL2Ivmw6qZ4Ug
         clo1ZubexL/WSwxT5U1UXQjQ9bGTjjgwzk2LLUMBGVjNeNLD0GybDA//QJ0UlOQLUIOG
         2l9drgVXYtXjMCfXZHbpYxmkwiOsbFqi0+1qB/oLSN1404+LjoM2FZUCVvXr6bUNJ28q
         Yrg29bpnH+yOnkUjVG1TplGV9lnYo6EKHM2ySCE0IPU3Ak7Jwxtu4jdim2GrqW5fRMGc
         S6lw==
X-Forwarded-Encrypted: i=1; AL+hErGPWGKBfZm2P5Ps6ZvG8YsfkrWuSBatYuXg4NlMWNrDSheGP+rTSHhsfzfd1pZEZht5LThwpQ8ZMX5zUPOq@vger.kernel.org
X-Gm-Message-State: APuU4Z+FgU0gwfNpb1AJxtWrKqAlDgO18wXG2qMEtk6U3gTbyAIWVj6G
	T/4x/7xAlwmG0PkyRrMXgdTNyOHupINKESewokMZgFvcKXPR8xjnhtO6ZikCP68Nral2wEsXrqA
	1LjTHx0pQMngDi3xlV1YUHAvQTaZ38aMRF7fhzl7wDZ1BLBweZWo5IYtiCniP9uN2B6Af
X-Gm-Gg: AZFdTZft5IlelMmRg+1sJEw9GXejvJelVSOhpHmlRBwKCGYPs5LSW3A4rCNSTY4vQxd
	nEq3xXnqgWNzivJpddTm6LC6sBrUjaipE2ATCe0yJ8yHmYRmjxe17KEfWwg1V2/L2zz5CSO4N95
	8Byjfvqi+WzLK/KfZ5Ect+GzXL615/oHnCOVgJRTR5Nu1d/g+2jIK74BdUZoa5IMQapABhnbAgA
	EPABYtbKz69DHLl2xwrwn1UW86q+cpQA0twf3G1XWuTUkh3gombSigqMsBMfdyQErVhjTZVC0Q/
	NbVp9gyGbgRnJxRbYh/UAL2f5PLkRDSZ6lSo2nt5Ci8QnUi6ivPMu2XYA5qjZkgEgIvH43hJ+Ty
	/txFoAsowAED+St9DzqW5dNltQEvzpMuidfpbpktxIrzaxiZIyWPtxuD09ktBUCnQ
X-Received: by 2002:a05:620a:3914:b0:949:7acd:3c43 with SMTP id af79cd13be357-949ba7cbbf8mr1832793485a.3.1795462879613;
        Mon, 23 Nov 2026 11:41:19 -0800 (PST)
X-Received: by 2002:a05:620a:3914:b0:949:7acd:3c43 with SMTP id af79cd13be357-949ba7cbbf8mr1832790585a.3.1795462879048;
        Mon, 23 Nov 2026 11:41:19 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm23327384f8f.20.2026.11.23.11.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:41:18 -0800 (PST)
Date: Mon, 23 Nov 2026 21:41:16 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND v4 13/20] arm64: dts: qcom: sm8550: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <ytqrakhhpmy6zdsdpqglpkm657ymg35xuhnmukifcwzowdokqg@2c3dewjxefcm>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-13-be30526391d9@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-smmu_interconnect_addition-v4-13-be30526391d9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b0496e0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=jAy75CqWmSRsgNc4pWAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX3kiYsogLKFkE
 ADprpr+0jG4oylBWFSK7F+WqOMoKvUyynZ9P/WL0vlxjTT33fMo3k5LmhmBEgYURRHmsu8/c7zk
 v1z6kkRjv1niYxF9QwogPsGwSRGHMIWYlNOl4i7fZqOV0CsdYVR3UKHdzlpLf6HKcLtJB/7200O
 pC/xyQmdlnbA14/RtIwtZsvz0rPPSwpGpaP0ACZJgqSltgGq/1muF8/taomSQ/cUm78MdeiZNSv
 1G7sXIZPrPcgW4NIEH+eC1MDUa6FtBbjfVRGasDtShWXPCBrsq6KLANM11hPWXkoYYwj7BANFuu
 DAXD2zltBBqIX7c1y8TpLNNAH0T6JurXoCUblq81xLpm08IyjxUw+z3OI9fAeXdkMKpM5vNOq7K
 LeMhfpX4bRYDv/g8NfLCBD9d1nbHIEzDdd2xAka8wbCGLMz0VqOh9VE6qmSeCCzuHxPwP7s3YEF
 R3XvHtqBDlNx4xRhMhw==
X-Proofpoint-GUID: dRqeA_UOxyF68L3N8J6R1nqhICqLSndE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXy4pwtPmfN+eQ
 r24p+SOSYunZ8o+xhIqEn1/B7jgk5pLgkvNfGaNykC0uUHXf8e2VXVoIg6n2dRqmrBAw4a36cVN
 2itI42wYPoDL74EDGlOEPM8Rff5qCVM=
X-Proofpoint-ORIG-GUID: dRqeA_UOxyF68L3N8J6R1nqhICqLSndE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230078

On 26-11-20 19:11:44, Bibek Kumar Patro wrote:
> On SM8550 the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
