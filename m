Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86FD4AEBD9
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 13:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788442072; cv=none; b=Mn6ecFEYGb+3JxftkMEYQsaEyodbvXt13AIMxGDWDLkHZevBrct1duyZDG+zZVBr+1Fm1qynxFIFwKKonj5h+6ogrsTas8rWHveu4dNBUt66kUvrutK1+8au5cmvADgshQvU2IEq35ogyiqrKCdCj895CCph9oOXuU+Idu7YAm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788442072; c=relaxed/simple;
	bh=NCh13W8voqbqpBRjojfXEI4cZ+RsIKEu4Bx8jRwHtqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ISxHBNHSzc3Pz6zf4qpR5YmpZ8mVwLyqxahThsOqKupxBtmvXi0ojK+H5HIQ01LYC7Y1/+nzfdrvbJve3Mvzw9BjUTy5AaCuNi140mE3ODGwKZONuCdC/V8kMf8FAsJcdj9M8DP6EYeRjcn8uZ2LO/VmCaxeqsoG9aNwXlFW7B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FDq7yuNR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HWx55Zpo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FDq7yuNR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HWx55Zpo"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAcg7822657
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 13:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d3RaRG9uz14aExbdtz5RMduc
	WGOR/YOY//yVm2WHhY0=; b=FDq7yuNRsBxxCzfElqk2kfYKwBz3uzwKCQrlRQ2G
	FzSjynD8d8ryoTi39sinU9aqSVbK/zAOmU9cjgWdW4pe15ZTmGcd3NACrPKrEz+8
	GU5UAw46YaOfU1YZhI6R7mz6ESzEc+CbEaNooWe7XurqXz6BUiMmARYqA6OK/pws
	ww2XkvMZwmBAoQRAqbdpXd0ijDO6IMEob7cTH+JqJJ/XhX9kjfJolPws5DoR9wwC
	O02ZJd+liJ+wQRXC7kGK/shnvYe8XS1CrjYWVxsw48p615iREHbIY+SdwHZ9Eqzx
	p/7f6aEk6tb32OsFFzF/1umMkHsDpwF14lxaZOL9Z3XigQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6p70uaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 13:27:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93494cce712so437272885a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 06:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788442058; x=1789046858; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d3RaRG9uz14aExbdtz5RMducWGOR/YOY//yVm2WHhY0=;
        b=HWx55ZpooMCubZlh4zOduESNK/WsGbTb1wryZ8YkIYfpJa0LaWNkAUTGpkAclN0WzQ
         +u9WDWBXib5kPMj6ovqoI3WpbFZYf9SXu8EuP3EFokD6ISefc2/K3v5+qNITK4avPrUV
         zC+/con/RbcxCy5PyZlZPThOFcjef9kFqpsIYEexrI9gYvlAOoUSQxmw7fYJKmRaWhFN
         OiNt25uGUJimBu1ho1ZlU2zE4dOXqVZVAK46mUWeM2SL2GnGbKIYYUbwzQxjGvfiKxHl
         NsLTuL0TgbzQv5HSow+sZiPTn7bFrdI47ocb/MV8MCuMYdevo8ntUCmFbKHHB79db/Me
         9x1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788442058; x=1789046858;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d3RaRG9uz14aExbdtz5RMducWGOR/YOY//yVm2WHhY0=;
        b=p9S4h0iNjBtOWQSR/3m3l0b8XSN/E9bultqAkw6cBJKcT47BwwiW/wMLujc/g5UYCN
         5HjlIxLZPtaxYkfTqyzDtz8otVxlI+5J3p7PTQH9pI7WF8mD64PxwDuA0xN0v1ecx0wE
         fdJ18BeZV1VEY9X/BIXq+9KvepC7Exb1HpeiBuleAZKWARjJGYmdiUsbVbugWei7CbIV
         DEJz04nvqvYc9XkVYwiTY/vj8NrZL+S0vRhrhsd8qa9N1SPNMnPSK471draVFfkesC0A
         9htI47JN86mcsYP+gmajyrq7dAnI8wgf31mMmNm4/JxWd/Gj1N1CF2n8I0or7K13TUHF
         l2Lg==
X-Forwarded-Encrypted: i=1; AKwUvByaYGdg+rnPxwpbWGsWTqPO5kEt3jXVcuju8pCNPOwoB61vuyWF9juZ5DiyXo5UGPhr8fP7+FmfDkM3yDkz@vger.kernel.org
X-Gm-Message-State: AFuF++mDbs8m+UB2T2VglXTjFTCsmO9x6/mxHre/A6nx71rFWBSYBYAc
	WBurlESqwsvdmKiunYMnziI6KPoPr6ymoL5VHIwqN8Y/l2md8DcCLYZ0N8fA8281DJBcxk+hP3M
	/1PlF3a1LxfVSyBZJiV3ys0sYEBik1DieMrWieadGDZGwZtUZXV0e6FbiXS2ZWl/b4x5w
X-Gm-Gg: AYBFou25EtZX2Dat0GXBdQcHQP6yvY3ZJ879Az47Xb41UgUQfFa0UdZ2ZdjA9rptNac
	1pB31TP7ckFqOjNCIZEny3PlQuLSqinW1V+4Y7S2C+ZzFDdfERrV1DzUw+oj/miUu8gUhyuPM4S
	Oo2S9ccGNRfPeIUesa8UP7O51njCsh+5lN03L5JdRkQ8Tf+SeKSXuRLo20uxP1QVajIWsxQChm7
	HY4HpgCbYJQgzSDaUqjzajDiYFhfjqjoqSghCcJA8TU+OB4iDnoWtqrgbBdcaKL2HQAc+vOHYiU
	j7ngBZRgesi1hrvYONi1/AVskBPWDLfABqBcDaWFtJQt2fWvNfsH2E1Ieri8Fg1OyzXgG/eZzGB
	DTREedyihv49ivA==
X-Received: by 2002:a05:620a:8f81:b0:934:aa56:45df with SMTP id af79cd13be357-9397dd0d431mr16738185a.11.1788442057350;
        Thu, 03 Sep 2026 06:27:37 -0700 (PDT)
X-Received: by 2002:a05:620a:8f81:b0:934:aa56:45df with SMTP id af79cd13be357-9397dd0d431mr16730585a.11.1788442056748;
        Thu, 03 Sep 2026 06:27:36 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed38cfsm12846442f8f.19.2026.09.03.06.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:27:35 -0700 (PDT)
Date: Thu, 3 Sep 2026 16:27:34 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luo Jie <jie.luo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com
Subject: Re: [PATCH v3 07/12] clk: qcom: ipq-cmn-pll: Add PON reference clock
 support
Message-ID: <unzsymxiequsolb4xfafhqun5wzhk274rxcjke7s432jiae76e@tphl57sv75m3>
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-7-21c3db378611@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-7-21c3db378611@oss.qualcomm.com>
X-Proofpoint-GUID: g5az7DwtPH_0IzyjE_nUnaYSPMU5S8e3
X-Proofpoint-ORIG-GUID: g5az7DwtPH_0IzyjE_nUnaYSPMU5S8e3
X-Authority-Analysis: v=2.4 cv=OZyoyBTY c=1 sm=1 tr=0 ts=6a9975ca cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=oLdtaUtU7qxJmi1rbcYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExNyBTYWx0ZWRfXz6CnINfDiBbM
 O4U3hZz8u4Xo5yODrhxRgYewaS5OFxgwnNe7iamQmPUnKsRbh18yEcS6NAPC/6zWs1IUFZ8R/we
 B0Ldp0EtUmGFaFhAgG9xo+h2eXMS/Oo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExNyBTYWx0ZWRfX9bpoRZpTNmS3
 qdiR60Jh8uEyDJnmIgdolrv8rwWLlXHtqkuEiVwQ+Nx4VsZdrMFbG6foGodzTNNuIqTHjntHKQe
 OzsRSKU7GPslmpw8o7gPzR0uv0T8SG2Y1NTywHlI3D6mpIAcyWo8o6x26d9EY6VNNrv2smg9nMj
 89xBYKuF6iGS/JdhFcxf+BulPhsiJGwN4H3WRhOHIv7U+niylRxpHik3GujOPUDfOY+ttCXCE9T
 sq+FmBdMHyv9Q3SQoBe4F/UCsFJ60T7juGeFCmbjh4JOi789VudZg2PtrzINu1gx46gPopPvmiw
 3FiT0KQyPG6m2miEU1AS+/0XTExj8mqLfUnzkphshsM+O6x6IBrJ0zA2fiJaoDDpCOwUw2hriPA
 1jgradF5qFTsoiMdgk395qOZiSBrkviJoMPS1xkK+/BnGjU7eiTJ4sAj6Bns/U1uBSHRT3UphaF
 o7H37lX2CKnc89DBCyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030117

On 26-08-14 05:48:17, Luo Jie wrote:
> The PON (Passive Optical Network) reference clock's parent is
> cmn_pll_div2 (CMN PLL rate / 2); it is then further divided by a
> configurable 8-bit divider (1-255). The clock supports two modes:
> 
> - UNIPHY mode (CMN_PLL_PON_MODE_SEL = 0): fixed 31.25 MHz output
> - PON mode   (CMN_PLL_PON_MODE_SEL = 1): parent_rate / divider
> 
> The clock output can be independently enabled and disabled via the
> CMN_PLL_PON_EN bit.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
