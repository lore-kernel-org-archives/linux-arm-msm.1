Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D78144F546
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 07:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789113316; cv=none; b=BaBRkDzUo7fEJRjG5zfHWsM78SkD4xq+U+4aMiKxiC1c/lyUMUpBoLSJ25fAMlkG04e6fTuXvr1Jr2ddziO8XnrbaLU7ZJHzimVQpqVEHc3oOAqf5fQ6yz50tw6a2XLp0+m24dXafuCSDua0hEj2Hkep9NVdgKUspfBe2qck5Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789113316; c=relaxed/simple;
	bh=O34+r1YZ7TDdI1Iy7Ca4KVAKGyvasa+GgSOSDmSxYzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PbNQBaB5qgoZbGwbWQ5gqVLqxTGMjo9Dpei5950vJvEKi8kms8ESUD9jI5YuaFxJiBqtjOSfigi0GtIPMCz6NpQ8gR0+zYSZNvTCqtdTXF0T7TCnViiPmfPBVMoJvWtnbX3oZZ6SxzARvweJKyDdjVFXPXSFIdjR3R8i0VyKK68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U7t8MuX4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e37B3Qw+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U7t8MuX4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e37B3Qw+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kqjR4046277
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 07:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/EqSpgdpfU++hk6ztbTemQXV
	lN5QhkWBg4oQrvfqIUA=; b=U7t8MuX43pbI2ENtM2peEx9jKWwe0FwmPGJIsgYU
	eluk+wfLTDOzXoI7iwHrXLS+bLKEWQ3V7f1ZAWAdFtw1jd5TltiKWZRdiN11GDbu
	6TUvAMk1oK00Ir0B00mAKNWxG0U7kPT81eKTetvKKSSBK/MIh1axpMUj4a26yqPS
	7BDV/mtlvw2vlcAGem5971sOYUY01ARjHogi4MnsFvvjkdTldWoiQa/kcVUceHYP
	+jOJbDnmxY9+Gdz3qTQDPup19vfIFfmhizyzX2hcDiLEUFbk69BnGrP+ZVl8DCBt
	3nx8rKxr89CDrudKbmI6KQ/JdXAyLuePYprjj4pcqPBrqg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm2q12dgs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 07:55:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9382f9430deso107937585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 00:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789113314; x=1789718114; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/EqSpgdpfU++hk6ztbTemQXVlN5QhkWBg4oQrvfqIUA=;
        b=e37B3Qw+qVScyz1Q6NPErZFBcJ0IdLrU71r0zBGZ8yfhZs0C1QCP/295kO5kDtSrZ0
         K8KZoxVLHGbKjYjdwcZf85wrqV//8FDqmrx4yk9kc3b9TcbE/OuqAIJG2ATAvGk3mlD1
         V20vUjAZewCUH8q5bXdyB4dn4ev+f810WQy3c0ks/TP8B7Z0FGueffKD+tfngPHdfodE
         5dkIoSuVGIFXy3FfAUuR/3fYJ2GFMHCUCzceVwbwkX3+mRZPK1HUXqz3vQUGdGoIfC7K
         +Yu03ACu2y84So717hP8evpl12wbke2i+4kMJ+lnhxQYN7or4BmIYOsaL3UktVLh4Oet
         pdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789113314; x=1789718114;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/EqSpgdpfU++hk6ztbTemQXVlN5QhkWBg4oQrvfqIUA=;
        b=srtgT66AO+YvdF1jUEB210IPWMqKwCKZFdFUt2M58FIVUsVE5KAC5B+/qc55QWevia
         s+A60hZA4er31NM+illymV1P2IODPN5cwOwCwg5rM2tlgWLzhdlce6ZefxFkYsoMwKoB
         OB79jqf6kuDFMPMCqnb40xE6ehg5jtovZCbXIzvQawg798TJLSuuhqLqufbA5QsVR28Y
         zpsv+RgeKUs6Uji7T3/+Mx3x6Ou+wu7nUTp7MGleJPdTYBP44TIAuvl2cnReII3SJHX/
         ZQZjegdUnDPsfchM82dO0NhEFJlJJV/T1/6OaZBOtPdrByEVyqTFzbUcS3RjjxEOYWNq
         axCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBBc03RrIwjy9d4RUgHkCL3jUQLeh5UNJvCpwqWQKBSgRRvn1cgMCx1768Uc+GnBzpAKAhv4IrwSQOKdan@vger.kernel.org
X-Gm-Message-State: AFuF++mduR/i/nnlCNSygVtZV1PAu/InbNOGPUDiUBefQugTUsSPIn8l
	OKc4wt6+PVb7TGheqPCuUNvPrZrmk7Ix4gPE7KM+re4vV//qtnyuh7kBlUFTr2uJ9r7DCqDp8H3
	XXfqC5fa4qJl50iFASgHSR3nMV9srEywZzFT+LIk3jZSi4CZCm7511kiDdvrKngCLOhvT
X-Gm-Gg: AYBFou0mwgJXLkn15YHktwlFR3y/zvqFDHy9+TRZHL9MD4bfIufdcRglsztRU/y8EhC
	2qoJj6u//QGayed3J4tptmPuuE+hnRUiMyaRbDtlrpOzn5KVPryrid6AMHjgPb2Ddu24qpxIk3C
	Peg8PzGZGBsy/Y/xBPTVf2mWoRg0jQIjX0KfH0qDgWS589RXA16ZFsSMn6i2kDifn2iQVMjGVNl
	eslkHcOHpKCPE+3GQJ+/p/4Eq8x1QX2tjnK46oM3aQh2unxmlOyazwuHuEgDcs2M0WOZKmPkdAE
	c00mnjYITtmSewBpWcK6At4FELZL3vjDY6vQHE47cyUm+A0Ek7zFstuaLdL5y2MHsiToBWud/9Q
	7kVXgU1bvSwqMJg==
X-Received: by 2002:a05:620a:bd4:b0:939:d78c:eb0c with SMTP id af79cd13be357-939ea043190mr343500085a.11.1789113313802;
        Fri, 11 Sep 2026 00:55:13 -0700 (PDT)
X-Received: by 2002:a05:620a:bd4:b0:939:d78c:eb0c with SMTP id af79cd13be357-939ea043190mr343497985a.11.1789113313314;
        Fri, 11 Sep 2026 00:55:13 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a33e34sm35304905e9.0.2026.09.11.00.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 00:55:11 -0700 (PDT)
Date: Fri, 11 Sep 2026 10:55:09 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH v8 1/3] arm64: dts: qcom: shikra: sort /soc@0 nodes by
 unit address
Message-ID: <wceerxzuwlhj6qzut6lxcl7ahxygbxzyjkwp4h5olb2oenvsuo@m32szrolqkjl>
References: <20260911-usb-shikra-v7-v8-0-851ee4bc0eec@oss.qualcomm.com>
 <20260911-usb-shikra-v7-v8-1-851ee4bc0eec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-usb-shikra-v7-v8-1-851ee4bc0eec@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=d6lgWhjE c=1 sm=1 tr=0 ts=6aa3b3e2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=99Sh8nnqGf6VeWgbmrYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEwOSBTYWx0ZWRfX43epl0SW6Zvq
 0fTC5zGBnYXcp0LJxldHQY2/uE3DmogwoDbL5AEulsIVw5UTxr6aP0DXvypammi1q6/f2ProDVa
 AV4Fpuf+0VD5X8xBRlcF9VqtqRrl6/yACM7dbj6HygUyFnMOe7kaG6tRzM10VkuSNoUkLcm5ptq
 /nYv9RL0tHKdMvENYqGgiLrsppZHtvFt8zquMKL+KZrAyKOD8wNvZI4RrHRKT1qwi644FWvo6dw
 FgGDuVZfFvqvccJGG8vCWxZo1hNLYa7OlnujYEfxMhQCMCzvL3zk8je0cs1qnsfQQllxHwMfQj0
 m8B6SgcIDwXMirWqVZxUnnQXa04uURsfalRbOksxYDwzhHmtx7uSFHclGXDFdx33TpNBU1fkQjo
 e3bPrUJ/03QPI1QC+YOMqlhUT6lyr2NLTJ8BpPDqIbC+fJ2tWx2d56T/DFGPgvg6KwHKrx0IDIv
 TNHkYPOnfIWlkzjMqdQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEwOSBTYWx0ZWRfX55Qz0TBV/dUm
 8iRUyVWmARrGwotpR9+E6KeIw6iL62y5QGbF8HpWKHz/Fh465u4jhYVRDZVht29oE79976qbOuj
 y7T8aOuNF3fLhTuo1A5RcXJb5b8lCCM=
X-Proofpoint-GUID: 2uoZYaLD_UC6PKMI8OwyBZfOQXbBQu9I
X-Proofpoint-ORIG-GUID: 2uoZYaLD_UC6PKMI8OwyBZfOQXbBQu9I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110109

On 26-09-11 11:37:18, Komal Bajaj wrote:
> Sort /soc@0 subnodes in ascending order of unit address.
> Reorder the misplaced nodes so their declaration order matches
> increasing node addresses.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
