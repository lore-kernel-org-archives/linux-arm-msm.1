Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308BD3BD659
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 08:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789978076; cv=none; b=Exa210yBuxMHhPZRBFYdhbV9TZ2MMEEZDd0NC+voTZlWTto8ROAJ5deEFUNpIS7Rp8UyV6DENgW+3s6k8MmQQf+/BHmf4YwFzcMMHR/f8V/bw5Prdw2ImG7KWPFZIVRKUd9cqRXQ9gERpTwHx0/N3F555SuBymTDfdMo9/Gc1nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789978076; c=relaxed/simple;
	bh=cvH+3WuyEr47wv0KGVgUlCmeKmek7sC8jywD80CvJHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AYAMoIeFhQTPKu1NXIAVz5ve2GW1OLrj7Su9WpcEZNG+/RTN4aS3kOo34cva0gXoYFABcqSe2sLMjhdF7ZzTp+w2zk4jphLXiuAc9m+yAIaBgdvMY3ntGA4Gpy9SzVKcPQFeyzzqwsfMlup2X2Y2ptXRnrW37i99EyTSGDkYtfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R1/2pkcE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EORiE81N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R1/2pkcE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EORiE81N"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7F4ou957118
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 08:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/XiM1eC4dLtplLQwP0/XNULh
	NoHo+cmbZwnS6s14+1s=; b=R1/2pkcEdFJGNqDx1lYarEAxY6sVthU547XrDWWk
	RDPJJgwyk494ayoml09u/siMx4VdzTEjvj5It7Z/M75HOXMuISRVEWJQhV7UIZu2
	NHZzDYhnzszHD/19AGX5T/iYUuU8rKUj/jTrDOZD502DsulKxe+JWS+WVq1yd79H
	QcbXSVfZoD5sEdIYYnczNzcDVHbAKQXME9RsZ78MkPnnzmCNWoVpPUeSBrFFCCXD
	2Z/Dk9WpfpHLPgmzsNg9/xsZJOzZHkpQiJcR08ymHbejbB5fVmcelAT9ZNWauEaH
	3E+Su1axT86dDF6xvVL0S7KTgOJQrE+H9RJ6NOX2PdO3UQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01d06e3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 08:07:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ae8e7e546so583347185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 01:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789978073; x=1790582873; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/XiM1eC4dLtplLQwP0/XNULhNoHo+cmbZwnS6s14+1s=;
        b=EORiE81NTxYN8B34ioGpE2NrwV7fBEpfw3FOiQFM2lw/wJq8LPsdWoZ01x7vCLPL4o
         XNHMysKeaCUa6NfC1bBtJKVO7dUNuVQmq8rfv2ZNlK9bR0fKMS5IIeBbAg+ihi2L5CkZ
         0qgS59xylB9jNQNSv+J+ZtToKYIFQ3+u2oZwwrDDzdplPXEq3QBtl34J77NXR+ZShdF6
         7HMlglbxWMrkK12Muyyqmnm9Aw76cuaBTJ2asVP45eP/OgHginX6QjOLlPJkUO9EAq9O
         Fxdx8XOvwLgFFCnvFPjZJfwbCHtv2ITDsLp8jzkRMjUQDinyw1tD9XzLyLw5J2NN9SBV
         krkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789978073; x=1790582873;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/XiM1eC4dLtplLQwP0/XNULhNoHo+cmbZwnS6s14+1s=;
        b=uj9yeTGwAhPEov7G6Go4Qxp5Mo9zFEKTlwPOn7soN922KkoS0yH722FbkWHZsGcoMl
         ySkrG3FYZPSO1i0QdcXvi+Vxx4jhyFUtlchpRr4y5SVoZpFHrdgD3xRBNPibK5vGfNMG
         GCSLEFn4TpzwlFQypJmueung4/wEQUWzEcbsEd7A8M04Qqh9zcKlmYi+LhgfoTzyJ7E/
         xtkU2FiCeF7CAVmfgb4oN5WXDZmXtv9+z9GlGMACMimh5OZz1OARorGkMweSQNtUre8S
         l/wNSjvgUIzs8CCTHwezz2c04nPMhfAIjZTPdgRcRSpxpd6V1jPK6Wy/p0nDI4qKMoTC
         ybmg==
X-Forwarded-Encrypted: i=1; AKwUvByLjgh/Yi5LQa8h35Z0uC215ewgXcVGN02dtcqeIemMrDTSEL5pJEsSjI41lq9tbxbAPQGLwVSYUSptEY/n@vger.kernel.org
X-Gm-Message-State: AFuF++lXIFHcQS+1k8aajPKfBldRXVTb6Pa4Ml+RZA3QaOw8e3bfwUJn
	bb8nZHW14q/FRBL9ocgmCSyK0QvfMXrbeWMr7ljNdoVUGLn18pQtnIW3+WfjPafvmzuQz3879Nq
	+YesBMLlGf4Xqua/PoRb7Drac8MnNcSTl7TX7b7rdKXo61zLnGPPVNCnKmSDdHJH1BJ0xL3ssvI
	2Y
X-Gm-Gg: AYBFou0OrxZ5SyCpoqupC9Y48ndJzhqkT3yDpXSsJm4BdaDkjP3KaO8Qhw82ga8W8py
	MW37M8Qa3fTeTvLoh0NsziYVfbu2JsGW/E882N98G0LacuPZoXMzA58g1Etvn1+y4D4z8XMYSHm
	30wHYlDQNwHzZG0p8sB3vmje8vKakcf485G28xADXKg0xY6P15oOUG/JfktWvIyfHf5uf8XFo2R
	zalRsQ9rdnoh8Tan1pkbQ8w1yNoXK8wN2nqLTJf6P51HAOd7v6wOu0n0VuqP1YoAnjVC/Zi7ca5
	PxRXHAZYtlda9RiXh0cwxniPnz0gt7Sx+W+bc8DNGmhquR2Dfjp9BUmDuD1LpqIic9BXas142zU
	dzcn7o6zrNymUZVE=
X-Received: by 2002:a05:620a:1a12:b0:939:c3e6:86d6 with SMTP id af79cd13be357-93bf5719c81mr978153985a.48.1789978073474;
        Mon, 21 Sep 2026 01:07:53 -0700 (PDT)
X-Received: by 2002:a05:620a:1a12:b0:939:c3e6:86d6 with SMTP id af79cd13be357-93bf5719c81mr978149685a.48.1789978073021;
        Mon, 21 Sep 2026 01:07:53 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc58a1176sm199397265e9.2.2026.09.21.01.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:07:52 -0700 (PDT)
Date: Mon, 21 Sep 2026 11:07:50 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: nord-ride-embedded: Enable iris
 video codec node
Message-ID: <th6om2dcxrm2a5kjn64ufunlm4zoubghdcnyvw6ll5xrszegqo@veekszeed2bo>
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
 <20260919-nord-iris-v1-3-94428761ec06@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919-nord-iris-v1-3-94428761ec06@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: -bv45MsHPnjbFrX5g39dDxxMHE2hh8O_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDExNSBTYWx0ZWRfXyJBTzfS7LEuv
 kK5mt8pxje2pB94tezgcuMOLifqmeqPobd2p6XgaevMK7b9sG7WSa7W4p/IcKERyNatWjRPFlNA
 2ThpWNL9U4lx9+A2FTwAUHwtQmcaYfM=
X-Proofpoint-GUID: -bv45MsHPnjbFrX5g39dDxxMHE2hh8O_
X-Authority-Analysis: v=2.4 cv=Ht7jiETS c=1 sm=1 tr=0 ts=6ab0e5da cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=yR8J6TAb7IqefvQR2IsA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDExNSBTYWx0ZWRfX3R8yAPx9Aoq0
 sjFa2Bdp5fbCJzeKKkTLJPd0BAxeiTJ0kT1VwPNYX6VL4mjW8ZlPF/5Bn2ZSVxPvJYckFebNlTm
 UeK+HzZxT3iSTsIEcwWiOP/xykk3oL3yAC0DtPTf6DR1LulrIU+KRYhQ0w6S2Sv2zMEVEnxTy2U
 D4O47rXtxPgSgEbMXDhGDrEgU0gFTzV01LGJpnfwxIPoiHQmSQsOskoGgs6DglyZhNWXISNzz9e
 jP/m/SM8vlASxtM1xwoCdxIOv5Gsqe/lAEb0chRJ5KCri+nITkaJqVuKYyzXPwkLAXj9/ejSO+G
 t4uuvPDLAEp7VHBM10wCaB5jkEeldYquy5KpKr16STvmSuXncUsmzKlmnOqsMgYyx6mBIV6TPB3
 nqDWVwjEYGYWn8oNBje4LtEJ5XeZDhlBRXL5okWEfNSTor5egDAqPs66qMzsN9QiFE+jmfYw/bo
 Qoyx4kjrZPuuTZAwRBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210115

On 26-09-19 10:14:57, Vishnu Reddy wrote:
> The iris hardware block is described in the nord SoC DTSI, and enabling
> it here allows the media iris driver to probe and use the video codec
> functionality.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
