Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFB531A07F
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 09:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339704; cv=none; b=iY+wV43Cv7kQPKgiVA2ZpBgn+jBWPmG6CUw6mrYNrwEUGtWnwDSnYobJNhboTQktLoE2OLyTTxFafnHoxs7pXuia0W2sHDIQIduPXyztckHKgs/LI2m37rXgQvCCPfKQoVF/Y1GnEqe5uYiKqtSpeNm2ii/R7CqJP/4d7z4AZgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339704; c=relaxed/simple;
	bh=eB/Bh653xAWzA4PtfQ6Jt/DwbaWdTnThPhgF8M4tAvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m1zLCpmiAK9t90wS0wA5njH+0cwcBJzPDcg/PHaZLwmAIL84ZjdK9c32nd48ZR5pJniJXBZBoz2g26cYoWTNevQFlcJR9uYYg48iMe1F2tiDJMvOpAXHciamaq5wekR5gi6RwSOyHqtPLPRH2EYs96L5kGve/hh8P7xXLBD3jHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UzuAVyeh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ARZSB6HV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UzuAVyeh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ARZSB6HV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826VlIb205043
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 09:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bg7g3Rb4CxJ6KDsirvNiFlqw
	jHr1Y19jqJWdobxDWFc=; b=UzuAVyehZgQf6psj7mtIXh6yzPkgopoyRJJAXrdS
	ZXkOZ8QeVVcxUo91qKnBGLiELpvpjXvjIhgfeyDY6Jk7uYsjUEZW9fQCU3x5hitc
	WRwJPhTmXNyHcPQpkiZ3mNizsr+yls4bMPWPhQt7ubVA0RnZ7RGnmQ4/FI3Lmq4H
	dM/f+CWm9XEX3wW4X0h9Ycs24X2mgJ3mBOTIerRy3wFXoad/GyXXVHFymzMT+tik
	cI5ZNorHP2N4wq33sNsaIGU4HGLESfoODxleY5Hs6sLTw6BecVLxDR6bPwuh3dPN
	1fPLK41NNhssIrk87QRA38rgWY6u5PSn4rWr7+kW5nubCQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge1wpbk4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 09:01:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936aa34873bso133143785a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 02:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788339701; x=1788944501; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bg7g3Rb4CxJ6KDsirvNiFlqwjHr1Y19jqJWdobxDWFc=;
        b=ARZSB6HVrkQq0+2uxG27ukpsBn39YlSK03d2DQDxj1PTtsDVmVG+cn969aKJDPSf01
         dLWGrdpVZBVsGuFlp8qGiXZatTfpeG7ICzTzmW+fwZBP3/nlQBU0CqodB4PFE+hEYB0h
         h1jIMDULIKsb9JvtKsS233CGONhDJA2V2Vcd+yJuznBy3UQiFHuOgH4pYvqvFnVXOPJr
         3kRLquC+A1uP24PPhO1ogoOQyJF0svnJc/dVO6URkNZNQ5Hk6JDFzHFqkQRBkaFvE48g
         coQQGEuLYJAsPpF9aMhrIp/h998kwq3ldqwU43gMfKAiqPwdUtLbUI4kITzn+0HTEjqa
         hoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788339701; x=1788944501;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bg7g3Rb4CxJ6KDsirvNiFlqwjHr1Y19jqJWdobxDWFc=;
        b=LvXJIYM450DkQgoRN9Fqw3AJkBij+zl43gAir0dET9WqSB9/jik/3TCJIzDajxxqhN
         CGxxcZz7LB0+gW6+qGlH/pu1/bQbBQE27iv5fSKKgqjQGkHH9OgnYVbcnda2kCyltJGl
         gKVp2mM1p8HrW+XZ39W8wlaYzVaUfslpyRYo4G83Y/8ZRUHGmwJeyBtru2/d/yDKK0fl
         KY0YAU70D0cLfIjli74nGRn3ueifQAyaLElEcZz/2k4s2IgfjrFSSNRqjdmui58Sf6bf
         wMO1qXu64v2Dfz5/KguuiW0Gz4MNT5N3g1kROabG2nvu/6XlqdSfhF8378HSMjBgBGg1
         fjWw==
X-Forwarded-Encrypted: i=1; AHgh+RqhX4K66FCWW7IId1E/R8FmMvt0QZwUX2x70ZU2VsGcDeO9qe/mZn3tqaBGg7R5DXLIrRvUM+6Zj+pBrU7M@vger.kernel.org
X-Gm-Message-State: AFuF++nVoT3B8rgW6Fo9RDRPTRjq30VqYRvYM8rJ/1Ej7naBe+cc9IUI
	MKXeLg0S7E36FFhM7t+roCF4WRKDawt4z9q+Vtctzm1D4a6zWKgq5WBNpYwxh3naH8Pi/El65qn
	hYokctOZPidF8fS9PlQOrqzxrih+uAH+orKX8F2gxvTHs2SJiaLFNU3a2X6o1UNVnPPd0
X-Gm-Gg: AR+sD116hB7wQhVnv2Dkjhi8yqtwuQYoG0N3HzKGjAS/XpLdv7lMlqiyer7xcu8M/o3
	EfbAFkZ5eSJR9IxIj9G7C92tNeAjfBgDZCoEVCHpJInOYIjAFppftWi72RXLjUDWOBn7G3YmMva
	vdsv0BxwBfBcldzP7HyMfcEiN014DBtZyJxFX8NiwjAiP93BkH8/kIhkXulW+ko2v6bwxDXVi8H
	HpV7VdqN/1GeE/OF1QdXhMBa3zDE9zb1DbXd1J7MQb7O4WXkj/Ddvs8Qx4JaXORimvGxrslJWdD
	t/vrvLU5wyKDsE9U5pvWdLL9IyZOTkYKDY/ps5oRBtkAjPqbY8sgcVYtpMvxP6BlsnvprqlZBor
	tOuBZoD7QfrbU//Q=
X-Received: by 2002:a05:620a:17a8:b0:939:c45:80ea with SMTP id af79cd13be357-93960f86129mr358425485a.29.1788339701140;
        Wed, 02 Sep 2026 02:01:41 -0700 (PDT)
X-Received: by 2002:a05:620a:17a8:b0:939:c45:80ea with SMTP id af79cd13be357-93960f86129mr358416285a.29.1788339700561;
        Wed, 02 Sep 2026 02:01:40 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eea468sm5188150f8f.26.2026.09.02.02.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 02:01:39 -0700 (PDT)
Date: Wed, 2 Sep 2026 12:01:38 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] regulator: qcom-rpmh: Add missing regulators in
 PM6350
Message-ID: <pbaoeou4eqcqmkz3bopkrzdcr63zb2pkg7hqw4yyg3yph3dztx@lathmqh3p54x>
References: <20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com>
 <20260901-fp4-regulator-supply-v1-3-68288ab70aee@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-fp4-regulator-supply-v1-3-68288ab70aee@fairphone.com>
X-Authority-Analysis: v=2.4 cv=F8JnsKhN c=1 sm=1 tr=0 ts=6a97e5f6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=e_63XvbMukAsnnsCD6UA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: PfYDX9OT8SG6ZaEXCsDzf889Lgk_0-rG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3OSBTYWx0ZWRfX6cOdAuk2PS5r
 db6sz9XNlwQQcgKYmqPMnJfUZSO/YKhhOlj+uYLfSJKtwVe3UpCGWKE2N5Px3YxLpNwfnLtZDp8
 BnhaClGjnq9dJBDG9PJYKApwO+5Vs0g=
X-Proofpoint-ORIG-GUID: PfYDX9OT8SG6ZaEXCsDzf889Lgk_0-rG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3OSBTYWx0ZWRfX1lGWUyWgK0Hn
 Vmn68IBdmfcJOdG7BMOqe/lLpnc/iq0u+1DlPZssQBkOp9lnit9k3/zImOlYkacw/ITgK3rq5g/
 zL7PzVo6/s7YN3ZpRkpZ98EoZApj1Omhqs94KlyzgGpD777YjCZga9YSUx68GvnPY1d6Q5+6uGH
 rZ/YQjUCIgWs1iOHFELSbIYi/4sDbmr9tZUw0QKYVnQlvPYfePtUlF/aK+7Qhvsdu+bXXzIRnoN
 4PuQWnJdOrNWlQx0FolQlkiQnfhJ4hKoyiwrxDpmyU32YvNqDBjRAdcVWO2uGCBWE+Y1SjVynTb
 o0ZG0hIf8CD1EuOQfwZBydlgONSobC8p2V2Hs3d9DB2LpZRyQeMYNryiS6BJOHxTC8K29VLJlLu
 GXBVPJjEe7vnRo7HIJMuOoctLoUVU6/qGZREubR2cYV7XI0EgUkpju5G/3B2arFfGMIdxMHhHd8
 SXuOmap7Ah0a/zt5jxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020079

On 26-09-01 10:58:58, Luca Weiss wrote:
> Add the missing smps3-6 and ldo17 definitions. While smps3/5 and ldo17
> are not used from the rpmh regulator driver on SM6350, the regulators do
> exist, so add them with the types based on the datasheet.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
