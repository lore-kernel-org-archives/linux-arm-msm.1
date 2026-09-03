Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6CC3A1683
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 09:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427196; cv=none; b=QBP/QfWbN4wPRjVOxKFTjXHQcFAgHu76355Wn9rpJLoFoQ0dPG+5VOM/1af/sT6AXDnyslxntERBxy6ZapGui9geHIPlZIOdqeNY4FgGx3G92O+dIm2XBSA6wX0COqai8qxslKndIcf50oGrEDmCqeHcsC1AG+W6rSBeR7E7i5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427196; c=relaxed/simple;
	bh=4dMNKcjwNAJVD8eJ1dCKkT2t5k2LSNFyce/zltu/jt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sgahAFw6MNF72lar2mAXmD/7xPjTLcVqwHzjIPq4xzySzFwHZx0XUlTTbPwHrg2dTTPeZXDBldqw27oe7QSAJ2QiHDTaOci+He6q6VMLnkSFoIUnN3j4m7VWHA33We8ZHSZdpY1+x18EsthViDNQhgFr2HrDgE2UoEi4/L/v90M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OPZp4N6v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y8qd7Zts; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OPZp4N6v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y8qd7Zts"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68392Ajm1158710
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 09:19:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iHKDoa8Z/DIcsHPCK975kS74
	m2aQbfHxcRJjEXuiJgM=; b=OPZp4N6vd2A+AOF+1f1iPndJXGWoz/D0BQkFLLhn
	vDXvPZPjkkYy+cANcEeMKxiWZuee48HtIRkR9KJ208k+TWLfXIhivadMShLMSb32
	JruaJpDM0L7CZ4zNvbUvjSNHyANXOE10GBtPLUOYwGHAuIUO626+yiTEb5DnZNPO
	6V89rDvdIx4aExrxDkkhLZ9ivDOHf1rguSPnYsBpdPyfI7AfiO4GXWoiAsbSF8xf
	b7NsmP0pKscte3B1Bz93AMv3u5ck5uPwPLIr4Dc5+sP49KrBi1KoRMAHQr8aqvYz
	WBRrjNs6Kqn5Kvqxvocq3iiXeyL5310ZHUw2IwoPeNJ6Cw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrnm9nf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 09:19:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939694871aaso239940285a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 02:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788427189; x=1789031989; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iHKDoa8Z/DIcsHPCK975kS74m2aQbfHxcRJjEXuiJgM=;
        b=Y8qd7ZtsicgBmlCNA/ymThZu5gf3Ds/SRF4Cv0Q3IGM7wvrzTW6q2GtUJ8QcTAaL2W
         6EbghxLJDytSY+JmVgZvlpYnG27XNoaNfogOMfpWRJEj8t4ruClBv/6TdyX2BJv3WseJ
         00M4dJJC1Z3JsTzB7VSqBmFHQ8kORGckntK1dYiulttkUIzEm8E2Cy5Bk2OaFD+wTGNu
         s3v7F819Pm6qrn0TePqaZt2jTGjBBGOnfXozu6uSVNnhK4FCTiujizCqplb0edMu+4yh
         NGI6EvgJnhvfTfZfmBe1umuuQ9bf0XIm0vgsRejINpnK1i3rBRTx+tOaC3sLUVuCsJeF
         MspQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427189; x=1789031989;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iHKDoa8Z/DIcsHPCK975kS74m2aQbfHxcRJjEXuiJgM=;
        b=ls5UVU8qcfaqjETyrk1zHs9RDGaAB+9OWccBJlOseCyyoLO+XE2uAcP1OYBi+31NlH
         aiN2pS0l+nA8D6PtZ/cZCoXmgmTaj3jilA6sh73IQ+4fVML1WcteQ9Px08zGfYQM3h/O
         N81RF1OhK5qUQl4kcDBAKTxN3J9a/A7iGgTJPXKkQZUsyeX1Aw+uGZpjJBsIOCloff0t
         gg+Cf43lUBtgStk1BRgLAgpTeZ80MQ56yyhNVmuv8BS+e1ksA6EzdNczNw/U7HDetEqE
         alzi/W2QATtFQc/E4aecfLLtymlAnG9Ql6374CUMdU+T/i0SawIUs/9OogFp1MZRDHep
         Lj4g==
X-Forwarded-Encrypted: i=1; AKwUvByoxe3m+haJ159TRuX+owvGATJ9JXb68hzRwa4E6WH7Wir3+XPR1vXG3Fycq6ufE5oa0oi+9rHCN0vf+qg6@vger.kernel.org
X-Gm-Message-State: AFuF++lxQctlTOhgqBVm4MfY+0T1DESEUiIX7aAVE461BN2CHzjXsCgb
	8pXAcP5DZBgJO/T1MsfxcDTWdH2PZJfZxDNRrFeGv33lSzWhNcd41F4fz74bMN8m2JDn2te6sT7
	xiVkF04MpfX8ZRhlfskD6HYWkqg9DYmiy7g2PVIGgKsfpW7XfMP1h6vtWX5PZlkl3z8Jf
X-Gm-Gg: AYBFou11oWogmgs9mHBYcOY0t5I0/fylVXElpdoXHySRmuVeB3pOT6lhtxnHeENV2b3
	BwKM/5nb/FB3wctqO2EiaOIHFmoxu1sFYBUuuYqZkUZfGbYFdsF9pSWUpIgdVK+inUQhR9n2T8m
	Z5IhkzRLEIWpX/B2waU0nvSU/TdPk07lZtfkUUVyxwEssVL5SfcUyCrmKvNm9MhVE6+MzEyU71g
	MmwAvwvv+n6z6uHkHt/We7zdnCc+Dwr3kbmtvZnFtWoY4ag4xHveCKquc2Xr9xccNI0Xp1Z+wy6
	g4FXRhx+Ez/PGxyTaYqrwkwW8/E/VBr4qZvaY9WVHnaVdzNRkXMWzznJzT/s7nCWdOWx83KYxvw
	cQ2ydg889EpkT/Q==
X-Received: by 2002:a05:620a:19a4:b0:936:ca57:25da with SMTP id af79cd13be357-93960fb0a7emr1141584785a.37.1788427188927;
        Thu, 03 Sep 2026 02:19:48 -0700 (PDT)
X-Received: by 2002:a05:620a:19a4:b0:936:ca57:25da with SMTP id af79cd13be357-93960fb0a7emr1141580885a.37.1788427188279;
        Thu, 03 Sep 2026 02:19:48 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm12265237f8f.16.2026.09.03.02.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:19:47 -0700 (PDT)
Date: Thu, 3 Sep 2026 12:19:45 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] remoteproc: qcom_q6v5_pas: propagate
 dev_pm_genpd_set_performance_state() errors
Message-ID: <3kulhbkdqqexdl2fflc7ci44mvfzjjpqhcorg7epdc2atlwee3@tj5mpzdsir44>
References: <20260902204334.2061226-1-mukesh.ojha@oss.qualcomm.com>
 <20260902204334.2061226-2-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902204334.2061226-2-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-GUID: nQ-EJ07pXv3Vn-BCxKYjTFl4zMZUvG4T
X-Proofpoint-ORIG-GUID: nQ-EJ07pXv3Vn-BCxKYjTFl4zMZUvG4T
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=6a993bb6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=4mQfpWPmsH_nVP9DenEA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4MCBTYWx0ZWRfXyScqKVclIskA
 ORcUTufx3HAheRK4kD9WyPg764kQqThwnp8LvW7cmWLwzNkY3q2MPmBaO8COciatURu1DCI1Qcf
 ZIKtfy13haGnqochhBpygdVhInfE+z06BfnNIw/ZE+8G/IDTUbl2Bs2i4KUKgGkE0DkIRqBbkMa
 gevtRhCkZdi5DEQFnp7ctsOPtgzae3qyvFgNG1YYUyGqvMe88JjdXTnoF9lGeSXTJdeT6X2Eftt
 eyzXHMCICjbKagmIS14WNkTj6Rkpk0qpN/GsdgVBdbyZib2veuKk4NhQJ2BGhQxt4SkGdnevnVG
 gfRZS40i2GWkG3IFtpu0fLEFET8V7cA/V1/VqpVDVvQ6it+BkaR++0Awjac3R7S85XuUHY6fzvI
 EpbfJwx1MlvFHmtIjlZj4imxIDHiOHkQFksB7cHnEADMx60nS59HiJW7kXNVFQLCZ520+0Rhh4N
 k9zXxb74pIqb61g6lBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4MCBTYWx0ZWRfXxEEZggPPTuU7
 nAR5OeIDFS0zGx5E0iwiwUdokGY4q4MZ1V2qqi/iINhXBpkMlpAx4bZWfqlA9Wi+5YSoN6qnyqO
 g+WomIapoqoSK8NvDidfCVddvweze2o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030080

On 26-09-03 02:13:32, Mukesh Ojha wrote:
> The proxy power domain enable path discards the return value of
> dev_pm_genpd_set_performance_state(), masking failures silently.
> When the call fails the performance state is not applied, yet
> firmware load proceeds without any indication of the problem.
> 
> Capture the return value and emit a warning on failure. Firmware
> load continues regardless a performance state failure is non-fatal
> but the warning provides a visible signal for debugging.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

With Dmitry's and Konrad's suggestion addressed:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
