Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591593EC83B
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 11:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787742411; cv=none; b=edjpRk6jJi6YjAu6dmN3JgBQW6Nr1ciLSQF0/AjY51aFp4f/adk8JTApathmqko2JRXZa9dLwbdP0WoAWhcsf2SiNj1wixNFkLdnBerD/hqwY8ZkJhEO+HhcAvufqTAHRNOtXhXvPxXT17FcX5zZam4bOsWtLjkaV7FP6YNDShA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787742411; c=relaxed/simple;
	bh=QXD+KMdenghMXKt2asCQrmIZhSFh3ss1fUfzTg5sbtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c2zIAa+MiNlH4oFQpGonmv+mDv6YvCuLIcR4WlQO4rc0vW67wi5XZs/75P1MQQ/aplfKtsOiYm3HiiQ4mMJRx9LGR1OpuPq2cefjI2xvWp00tQHzyNMY7VHM+ALhgHuPlCcLfLjNuZLAPxEiHtlSXSQ6aufL+bc0HCTosvir95o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VizyG0ZA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YFnLHIVT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VizyG0ZA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YFnLHIVT"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGp3b107561
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 11:06:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3akmcxmoJl2rrZnwVhPbG7VW
	IuceBca40SU704s+Vjo=; b=VizyG0ZAQLnp/gh09NW5WeC+tMxNpzP/CBa01hSC
	iEkUEd8xrnER2mZzLqYUIdGQZKa2LBlPVWEEVeWqQQBh2o2DXSlrXDssioB7/SM0
	yOyB2XQbBJp7dFZOlh5Rr0Lwidqv5Q0iVHfNp/18kqyxSoorf0H5Wd3N6dOG7Bu3
	dd3PDI6Sel/AcUJDXOFVBCmSNNxStGQCpZnCBaLPjFvZIsWAGCUQbTWvQN7etV0t
	Yr3kfVOqZCjebTbX0YmvgroYGPJCcOna0XPFgt2kNR9HnegzXPAvCN0RiwOOgEru
	sbRYh+QLtR8Ko2TZ6yDQctphrzGadSQN9kc6DJ5wNYF+HA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9s9g9get-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 11:06:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c01ff996dso7679521cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 04:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787742401; x=1788347201; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3akmcxmoJl2rrZnwVhPbG7VWIuceBca40SU704s+Vjo=;
        b=YFnLHIVTsJwmYk/1N7Otva2/MA/oSZFMHYKBN8XIVPp0EBRD98xs+OIrAZuqfSjKw0
         RL8X5Z6jaNL2dL/mJlQk9QuCAYXjM731Uv98pyI4RpPTpQGm2/X3JAKyDXl70XZygCvZ
         q3gAXb0TIrwNGszSRB+4m1NJyMVeOfP/jjyyNAkv/w0TAT4G/H9fCYz7Dw41nkdC/qSm
         hpciw8pMxUWMT1oa+8sriJu8hFD0iGgGEzQLPOU3oFhrDAvf3XpA5sRBPdeEIriroi0s
         LAbzg8qUgzaKLocxeJ551VrDUbl8/AECmgjrDnGiiCN9MXH8ozfMJie6Cm07brLxaGKf
         tDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787742401; x=1788347201;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3akmcxmoJl2rrZnwVhPbG7VWIuceBca40SU704s+Vjo=;
        b=ZJMolgRcxORuzhcNpbykBmhEpEwtvJtrPjjDWdJR4ErmswgCbGxEeQvxe9J1Y7GF14
         R8Ex+2Tk4tbCRvLNknRPG6uPw75G4Rna/GOjXC+LXvmNXft2bWHBv27CAmQjGSiXH/aq
         8UZdd+5NNlvR5jt+roAimngn4v/UgFMVxYUyvQPdQ2Mvg4uny1sIW2IXqP1IUFCfoRXv
         QWizlNgNgx9jfUiNy6QlWKm7zdnUb9F696VLhYpO9iycxe3qL+9xxpl6M1vvNe++0DXJ
         M8zPR9nlhs6l6r5APAeuRFW+1GLioTrdkoZ9vSlEG1TzCnFQpgRYeVmMg7GRQb82IWt8
         nI5Q==
X-Forwarded-Encrypted: i=1; AHgh+RpwomQqbiczSUrNWuZFwPiXQTayCshif4G6dtL7N5Uf2odEqq3NUt6bI3rCJ1Y07/6986A0upBOQ4O0NRBN@vger.kernel.org
X-Gm-Message-State: AFuF++lf7riFYwQPQmxcr79ZKTokI/X/i+qf6lQjkfXFbsrE/AAXb6X6
	mySJ2wgz91Tt3SApgppLs1MIvaeeXXslal9vxUOCdzJG502XXX3wThDJSzhVmoGnqQWWg0aiQQN
	/zhVbSLzjAEaUfm+MuXALcFIxf9ES1Iqs6o306PX8nV+VJI4khw5pLwFkGz9MIOIDkQSM
X-Gm-Gg: AR+sD12uuYDs2kIbFp1waIR2+KOs2tvJHgCdvFubyEWV/66/nyd8oDgzRVSEnAGD25k
	hym7PVvuuwrFvwnS22efFtKECkJVdL9FvoWFDkZq3K2XWtdy3N0yRqapx2T1MtU7lnv74GwgIos
	UO70XCoGFbHZ8w+rYD2VrwKZoeIGzZwFw+SZ4YQaAEJvTKM2hwKDWQcyCwPMp4OoZaerQVZ5MPA
	Tvx1ru2OVOkn8aAaJ9AdWwwedutDUPnsNiE6luX6spDkD/JpvBgxBmAUUDDSc79shd3NsruW5bn
	WuO9yqxqvQnVA58BguYTM0E+e13U9nPcUA377psiEiCsa+nu/Id7s4CeKKw4hlFUl0gWlOnEmA3
	ucMVelZ1kl58ZNg==
X-Received: by 2002:a05:622a:1786:b0:52d:6afd:7d9c with SMTP id d75a77b69052e-52e4236c916mr51625661cf.29.1787742400691;
        Wed, 26 Aug 2026 04:06:40 -0700 (PDT)
X-Received: by 2002:a05:622a:1786:b0:52d:6afd:7d9c with SMTP id d75a77b69052e-52e4236c916mr51624871cf.29.1787742400131;
        Wed, 26 Aug 2026 04:06:40 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ac7fsm566727466b.30.2026.08.26.04.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:06:38 -0700 (PDT)
Date: Wed, 26 Aug 2026 14:06:36 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] remoteproc: qcom: pas: Switch Nord CDSPs from MX to
 NMXC
Message-ID: <etena7qgrcb334rtkkctjdvojxeu4m2nxbhhg2tygq5wg2zmgc@5lgkk44lxgqi>
References: <20260826102746.633076-1-shengchao.guo@oss.qualcomm.com>
 <20260826102746.633076-5-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826102746.633076-5-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: u_HmGMpOza44kVcEXxhJNH2o8Df6HjoZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5MyBTYWx0ZWRfXxzoXYGQm03Om
 T7jBq31FAamyBuKWElLdLzZF8qhEElLWmcVx1C5kiKgR21MFIaeyjkVj47VaneM7srUeKZ4Lz8j
 1kqRQYHGGdKl4JbvQ7Ty+hGzda+w1xKjzURCPM7YehdDEBY9qHshDJnuGvHvYFXwDZuObnMV664
 qGeehdlsn+1JaXM8/CCeT8TSNYkKlqQp1/Z7sHdcfEqjzofiLC7gwGmm3Wyo0EU5QZAQV4+Cis+
 a3O5gosFVRgJfiArHhCvOC9we6WpapfhGhsrXfHLU/2Pt97Ia/JZCyvdqNX1A2j/szHuf0nDbPD
 SN8SqMgCBsIPoy79TUPU8ZzrxYyJJGSB0e6Bx8v6fF7hLDwAzHK4BZ8eXK2IAI6Pt+eL4HWDwhj
 iPUky77Kh7SSAFRp1V4BJ9Qv85eGgCGGPZS8MWt5ld/HoASLX0ioXGORzdF3DBHYDBkeP5vR3ZM
 bIJ7mLn5aDpt89Fo67A==
X-Authority-Analysis: v=2.4 cv=Xfq5Co55 c=1 sm=1 tr=0 ts=6a8ec8c1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=GZsi8ShKKcF_LqxBH-EA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5MyBTYWx0ZWRfXwjb+UVpISzjQ
 RVCQOTYecAXR3oBqFdEqgD4ib5i27rWkkuYAII/KBvj/gRxsq2eVsFRyGORXc2cK+h5CsKKq6Il
 LYA2tkUMRe9+LSiDhKBndrJ+pQi0iNs=
X-Proofpoint-ORIG-GUID: u_HmGMpOza44kVcEXxhJNH2o8Df6HjoZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260093

On 26-08-26 18:27:46, Shawn Guo wrote:
> From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> 
> The Nord CDSP subsystems keep their memory rail on the dedicated NMXC
> resource, not on the shared MX rail. Replace "mx" with "nmxc" in the proxy
> power domain list of all four CDSP resources so the correct rail is held
> during PAS authentication and boot.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
