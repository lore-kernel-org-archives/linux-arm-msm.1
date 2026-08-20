Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385C441930C
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787223514; cv=none; b=SLJMtfgSf/GbxNnBA4zdg369BCVomvPADroVouMwGxKNgM6HVKiABEsWhN+9WWSiyYqH5cXOqaUl7YP7FYcrx27Nt7JlNueR3TveldN19w0INwswiD69y2YARDF6i5z73bVu4UI4/xcrcEi0j5K4+shPTk4QIbuJqGfx796baSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787223514; c=relaxed/simple;
	bh=jKc3YgPhEa2EpQmWD1Qa70r4Z/Jj2tiwn4SXN8uOZnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jprj7SK+ih9eIRtP3iZz2MyFxLBzxi7pWY+XjWDEnjGjsmVTeXZiko0xFvMSWKnVsrfO2t8d9C7/T74S3Nos9AA0fRBsCIpTu+t2ly0+c1B1+6qPb+sNgl0YWtal83zpIGLWcfPQk+5gNUkO/DnpvfY/sTYhRgVwDwkPusTpgnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KZPuYXqt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MmPLm1YH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KZPuYXqt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MmPLm1YH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K8KfUg1680231
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ad18lunExo3+fevGacHgA1VC
	mciQKe5BgYrlCv8jbsM=; b=KZPuYXqthvAZ3ZjfoPV5MArpHSQELGkco4a6UIR8
	zMsm/gAXFCK08ceSAWiqUf3EniX/T1+gLIdg3SLU2FNqiO5z0jlpXXKbyeBaQ9BL
	NJDcVpA+a4+3vdxZDLgmj7mzG941GTzKySeYl5O80vX/td/wJzwcHPwLBWMFVAQ6
	GPN968nXdQngwUY6fRwBNSFffPAWyqZU5Nde34SNLmkSTyGDNBKondEvjN0H5lvQ
	Gv3jwVm2iTq/+jdu96RsGj8bsmEemkTCxZWaJIdZcEQZjGO8sOkOEKSN9J400X1J
	77vLdRJYsLdr9RYdaaW7UUzdi0blEKQT7IrfMSaUiVjgJQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5x05rkgm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:58:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936cadb0e8bso178052585a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 03:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787223509; x=1787828309; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ad18lunExo3+fevGacHgA1VCmciQKe5BgYrlCv8jbsM=;
        b=MmPLm1YHruZCaCIq9Ksgd0fRCUeRjxCvX/geWADYOpv3MbNgpU+823mlMH6wBCe2/P
         eJKG2Ois3QlgTBTfDO5DGisZkyvYv/5wK57aNDpvunfqVHhnEClqzIE66i1xoWtFQGbL
         CJvcJ2MNrwS0wCUTr5qrE1Nvl6oeeJhX7biUh0swYbpFr4hmqd9UxehOamigkj9vN6ox
         NjTA6dInZTHhgvOB+2R+zGaFmTvZhazB9upgC0mKD0wVneUxBi3x5iIwgCSHD5vDYA1f
         jBjLRLP/Ekx63L+bvHw31mrbTb/kwroULXvUDS0rcyGTqtjKkxiyZASmeW6KoG8jI+Qc
         4Y2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787223509; x=1787828309;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ad18lunExo3+fevGacHgA1VCmciQKe5BgYrlCv8jbsM=;
        b=KtKsdcH8FM9CqYAOvT0KvXLuAmepq4L3X6CACv3zw/3Y3OJLAp0dv/FHCHq7ByvYY6
         GG9+SqlpreJuSsnGWV7rhjlTMn6itmaGAeVvUGrbO5FCvexGXYd9WRAc8Or8cxaNh8DT
         zJ7J7+J8+lMiU7cBMB8cAkb8YONQ/xWvKfJtORScZpAueOJMKRD6KfiL0ogN5ssuxavQ
         B8YrXNKb1e5vjiIwb7jHVXyiJDy3g1zf85zPBCmbBq/zJq+G6pkTPe7/pJ4+q0qPvGX/
         1Cu8TInWWrIKn7mAXtWgaBUb3JJuveRSZuqkuJAjU7rGFiMtc105n7BRptHN4sXtuoDU
         Sj4A==
X-Forwarded-Encrypted: i=1; AHgh+Ro1vQE2c9QhmKZlccu8Ws5c8RlPeiHYsdLN51h8ak2fI77ABEYHTck/rotSCEbwbEu6xOGrkdD7BQ05WGP9@vger.kernel.org
X-Gm-Message-State: AOJu0YyQtPlzfPqYgDoEG+JjVJebJCvWd0vqv791WEHKMdLjC4W0FO9R
	Xlc0DanPXk5qk09SlKzVSby1MHRZXvn6hEmLqTQYMEDhxcfF7aaDWuw3GcBT2aDwgdWw74Du4Tf
	/SrAdKK4z7h2qc5EIULu6A+q0vTikKtOVGRyxWUeiaSLw9a/Qk3RDKA3bOILkLTJsxL1W
X-Gm-Gg: AR+sD137exonQrlpOyKydgiCtEj77yn7ym/991Cv1wQaF1FvMSVesFiHtyLRZVa3er/
	I0cdW2+5yw/t269rF/pOvnA4pihjWp6zo2EVgANcWI0urZZHm7+1N7HriJs0TZZrXl+/TypNQq0
	ZJoDqW1dskycuJ6ighEKTOPH9HFgsooOnVGNeUhzNOZ9+aJxs+DA0kqlc2X+9PE5iF4Ve0U22Yd
	WGhw79uyUdydzG1VcVr9XbbBqa9q/7GHCkNTAfs4DPYM1I0y8u+hrcGcCag/Ke8SC78gVTT++UC
	GGGTik5kL0nz7qDQV6NO/9YxjeEZzVCnJIsdDzXwX3NuNd9TLGDW4MlXl2PgmEA8hdPEv1JtUJC
	erOZ/EuIry3Kbo14=
X-Received: by 2002:a05:620a:2716:b0:936:7a4e:db1 with SMTP id af79cd13be357-9371e6ad31dmr1113255085a.23.1787223509264;
        Thu, 20 Aug 2026 03:58:29 -0700 (PDT)
X-Received: by 2002:a05:620a:2716:b0:936:7a4e:db1 with SMTP id af79cd13be357-9371e6ad31dmr1113252385a.23.1787223508714;
        Thu, 20 Aug 2026 03:58:28 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b19dba34sm60889795e9.9.2026.08.20.03.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:58:27 -0700 (PDT)
Date: Thu, 20 Aug 2026 13:58:26 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5] arm64: dts: qcom: shikra: Add ICE, TRNG and QCE nodes
Message-ID: <lgkazrtpav55a3quzeyhj6p5au7bisr5d5ozw76oofkwo3fd3k@4zc7udbozhtp>
References: <20260820-b4-shikra_crypto_changse-v5-1-70eb4040fb25@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820-b4-shikra_crypto_changse-v5-1-70eb4040fb25@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: k0iqwu0iWt31bKUWSY9kd8zKVGsvGQeG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA4MSBTYWx0ZWRfX/AeOm5geM4Hj
 I/C2RT6vQ4riWIyes8BN+MRCv/i0FWjM/sSq5pM6gIopUYzY4K9Zk25vkDBF5IG4aq8/YdavRah
 FP6hrrhe6wAtc6W0FjwZ5XQcyOkwlwbHaCekXeqr5P8X/5797HmqHPwz+VYRJN1GGickpPKPkA1
 riio5vS8tfodXlpEM2VHqk1DMeU7G29t1Qp9zEibzGanuG+m5RqKHHWw/TzFou335k0uZnJyFox
 WQ+vda3hBtrKTKPWeHzYrRiweHkFozMUVWq9j6F5RaZ6VDmEDfonh7p8U0Bs6bktGWC2/d8rrG9
 tf2nxDduzDZOC8fg7nJPJ83Ely7LOQpTEv5mGFGSyyzIZwVd4N9PC0GWR+O8kLxx0xNw5SyA3zO
 euqPBqnlrQZzL8t6BiQiEV9GTJ08wv44TCZVhuBnI9balI01KaHZG0CxFX3/KMLttISSPJRrLAO
 WhakCKO0VyJXgccZsaA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA4MSBTYWx0ZWRfX1LwYKgiBZmbV
 US/OK+AFhUuWZAlvWmqv9HCqdkcBJAklDjBY0/DkxD13CE6uako71reNiiHJYynwDk5UVHCRj6o
 AF6C440FsMeydlo27m5/bP0AGiUafyk=
X-Authority-Analysis: v=2.4 cv=VfPH+lp9 c=1 sm=1 tr=0 ts=6a86ddd5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=MtsRB-tFAxrkV9Z_vvIA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: k0iqwu0iWt31bKUWSY9kd8zKVGsvGQeG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200081

On 26-08-20 16:23:43, Kuldeep Singh wrote:
> Add device tree nodes describing the crypto hardware blocks present
> on the Qualcomm Shikra platform:
> 
> - BAM DMA controller used by the Qualcomm crypto engine
> - QCE (crypto) engine with DMA support
> - TRNG hardware random number generator
> - Inline crypto engine (ICE)
> 
> Also connect the SDHC controller to ICE via "qcom,ice" property to
> support inline encryption.
> 
> On Shikra, different BAM pipe pairs (for example 0x84/0x94 and
> 0x86/0x96) may still resolve to the same resulting SID due SMMU-side
> optimization. They are still distinct pipe pairs and therefore require
> separate DT IOMMU entries.
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
