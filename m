Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82EC433BA8
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 09:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784626984; cv=none; b=NOp1O3a/t06V8BttdjSD7rY9UhdZtQ8ORHuUdiqs9LU2E0dl2M9LZcX0ejEQqCibvUX4baikM42x1jjLjRmXLnNk2hu/6S8GTm7lrTMNaYH0Heqjz0/9MIOABlO5dPBPCMIEzHr0P7vke1vyiQ9vCz8QQWLbXW22C/pHfhCso4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784626984; c=relaxed/simple;
	bh=382s2GHsbvemZhVH0WPznSW6AFhA4JiuqW98dHEwEH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hm2YH+2GtSeuucF+rbUTujQgkPsEUhEGZgp4GxEPMuTk1t3nQJtmWoIUYepyM2sXdJEx9fyfnp1/7sq8YBBT6MKA/Ly4tve2SF6ZKhUHOJvGquZphuLkK6KXra/UD61Olv8gJsZAoDf5etXJIbjsAz9igB9DgvaGVHnEYIf6O04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ge3RaMSv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iLeRQE/l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ge3RaMSv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iLeRQE/l"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L8np1k038450
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 09:43:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RB2W/6cFo1kyrM8hohHMIH1y
	Ve7PnX0DShuvEwbYNg4=; b=Ge3RaMSvTCjW/GSrDtUCeAP5TFYkvoh9NIKJRry3
	+mvsEwRRSmuMXUrc+ckGaHvYznTUQjSxteGj3KwqJrLBaIIUfJPaTPika5oyQpjy
	96sVMDKmpnfJDry0v3YQzTWQ3YDkkVtNpb2bgnJE6+Di8qJVS/xpxsvDIkddIgLK
	b1r+4a8c27aNlA8PxEcaW3DshlQKVKb9KYyZsh4nSroSZwAill9kz2Vp434hrXDB
	sdHddggerM6uJQCjrrTyHBdZtRMEDpkbF5imB5i7iCyqHT9ammdBSG/HBuG1mHN1
	abkNM2VEXaeuLQSo+5s8s2qUsavWcxNc2PMkzlz+5n++rw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1es1jq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 09:43:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfe3fa93bso227695841cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 02:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784626981; x=1785231781; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RB2W/6cFo1kyrM8hohHMIH1yVe7PnX0DShuvEwbYNg4=;
        b=iLeRQE/lqyvssgQ5uH9NHfW/krCORcDqTfQ95ShykkWvHbIl1ES6Y75rLerl8hqafP
         ouBu7Ez9xJfdubwK5LQQ0fZ/tiWu20toU3zFi1rYmC19IexRvOt/iNLsTb843+MCF+EV
         NmYz+wMaI14V+8wtq+TRWC7loiurGyrhdnWbL9bQQzVpOPVQvSv2WEDwN/R0Qu9+DDLI
         r9rTvDFi5ZsC7ZUr6hi8QlSpzB42ykZm8QA7aYBzW53lIExqDSMNuWWTzvpBhjD6JQe+
         f5tJb2pVhRfW6JliRBMMbsCmOseB5o/QobHell5YCqK0FCDoguO9O0JdYPZqEwqJuX27
         k6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784626981; x=1785231781;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RB2W/6cFo1kyrM8hohHMIH1yVe7PnX0DShuvEwbYNg4=;
        b=rFm4TEhgRDML9YKTL4/ulTWKacPaSqPXoBdsXnqhy6n4kK4jXOKfLpNvQVzLMtXku6
         YSj2v1/opT9LOhJtxQBJ7QJL3AADDzr2LUQQaLvzLtGqxaathYxup7l+lyGMD+Up1xGq
         bObxihlb//mldlU0wQNb3m0hJT3djhfGd380jJmRuAwXsG79LrQozJnceSR7dsYrUgER
         iYVEfcjPVvyk7OeynVt84r+8ONvjkBZOtMh85M1NrZT4406AYhwBYtGoU0FoTKqAOlDV
         23ghOlCXuMs471lnFg6/JKqrntP72PCyTuZeMWhdnQWdlayrSRgvet35r1qpPWf+CbqE
         4jIw==
X-Forwarded-Encrypted: i=1; AHgh+Rqdf/ifH8kmTXZwNwVjmFqSOTrsEOhrcEUD1MUeGhhpJCxUNZEgBu7LLE+kfxu1GEj1D33eHaDUQtFOp59+@vger.kernel.org
X-Gm-Message-State: AOJu0YxAXaWIudak5c1nrQKJ2Crpb+399kevOg+sA0E3nsLR4/qBdFCd
	BUQ+W5FDnjD6UKi9Xzb73jo3eUY2Urv2Ls0PJVUPbNW5NcwDrfMTonyoSwillUP+KaFLef79/7d
	Zv66wYXLa2aeqXBca3GypgXn/8pYQlOMLggZHLlIPA7T9k1XQEH7SHZ0v8gVcXAdIre+k
X-Gm-Gg: AfdE7cl8jKR6yUb3q5PqrfCwBl8NAMJOWV7vCkgf1RlJP7etBPI7VBNmr4GeffOV2qs
	oZQnZvoJCtABQNzdWAJEuuTcybW0lFdOKdSw4mQyHxoDFkG/QG3n7NJNV2g0l3zgJKuYHsDkNFT
	KIs7sdqt3xAWZDzi60mMnEycVQtIFUEGII+qpGK8Zk1jnZb8CmKA1R9RvwKWCPx09wuTBi9qkP4
	hOWn+wgORl9kqdBebNJnFnBh/y7o1auH+Os680YSlX9OUQCpVjqWM8nnxKRoaEx4GT+PeAJ+oga
	Supb5IoQk5YHnQFrNuo8sHQFKzpAWGl2IE0+2Muoe+128DOWVOBwpUKvpMc1bEOyFUqZsdGD2/x
	OJjEf13cNwiLW/S8=
X-Received: by 2002:a05:622a:49:b0:51c:7b13:62f6 with SMTP id d75a77b69052e-5213eb7b75amr168662281cf.76.1784626981211;
        Tue, 21 Jul 2026 02:43:01 -0700 (PDT)
X-Received: by 2002:a05:622a:49:b0:51c:7b13:62f6 with SMTP id d75a77b69052e-5213eb7b75amr168661901cf.76.1784626980305;
        Tue, 21 Jul 2026 02:43:00 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f6980582csm29681062f8f.13.2026.07.21.02.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:42:59 -0700 (PDT)
Date: Tue, 21 Jul 2026 12:42:57 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,milos-pas: Add Eliza
 CDSP compatible
Message-ID: <6tmbpelyk2ngvrfmcpb5owli7oo54u63i4w46jxbbj5g3fppv4@4amnegv2u3bs>
References: <20260714-remoteproc-eliza-cdsp-v1-0-32eb7a1f2c59@oss.qualcomm.com>
 <20260714-remoteproc-eliza-cdsp-v1-1-32eb7a1f2c59@oss.qualcomm.com>
 <20260721-benevolent-wonderful-kakapo-ca8c2c@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-benevolent-wonderful-kakapo-ca8c2c@quoll>
X-Authority-Analysis: v=2.4 cv=SPZykuvH c=1 sm=1 tr=0 ts=6a5f3f26 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=8OKT1r-RFD2mjBG_JK0A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: o2oHRmG61Ti1e-mlJNlibvMRYpQXNPxo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEwMiBTYWx0ZWRfX1ySg4xhneL8g
 ah9v9BjJPDvVZs2e7Q0v2NtpZZxOWSzdNm276Nd9XRR2LZZt4QA8A7Y5fLbcV/+/AtB+iWenly/
 48x4+v7oPkuh+mgu8MPIoaRIalM6rLyFEvMQbkclOKgJR92BKqiO0aDfLvUi9RBRE5Oz0B7pKuJ
 lTQV/SW202BQp9vD0JiwkljU8iKJV1fg63M3EcBqp9xJrm7e0qsDKYLmng1waqjJ2CJI1e/xo49
 4dzgBNgCrDWadjvUNtoZlDrZqO6MBbyOfOxrPQayw5yP2ebEqZSBdxOgtvT+bgpX4fc8s9Gvb+e
 dSLN7oufVoL/gzAibwJTZ0bHO+8xYuMAdc9ZYT5sF4uwF7d0e1xcjkS3Lxb71zvJ5GDYLKD77Nv
 JFbWCsbpQC4+Ynidt8L6GOCp4VWDpcPHBoboMYBd4Ld8qU90IhhwosjUaeAP3NLQApulAv7eU43
 8Cur6N3K3YN+xSkrjWQ==
X-Proofpoint-ORIG-GUID: o2oHRmG61Ti1e-mlJNlibvMRYpQXNPxo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEwMiBTYWx0ZWRfXzRHcL29SKGBl
 1cAysWi9joqUTP/F3g77OxcqxRrN/fVPWhFY3Jj3nn/aGDdelR+h1do4Oarj/0WyidUY5fns58L
 Sc/9vcqW6S5Ew3o7vjTB7bda/SXXIQo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210102

On 26-07-21 11:22:52, Krzysztof Kozlowski wrote:
> On Tue, Jul 14, 2026 at 03:24:01PM +0300, Abel Vesa wrote:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          enum:
> > +            - qcom,eliza-cdsp-pas
> > +    then:
> > +      properties:
> > +        power-domains:
> > +          items:
> > +            - description: CX power domain
> > +            - description: MX power domain
> > +            - description: NSP power domain
> > +        power-domain-names:
> > +          items:
> > +            - const: cx
> > +            - const: mx
> > +            - const: nsp
> 
> No, do not grow the ifs. Eliza belongs to class of SM8750, so I don't
> get why it was and it is being added here.

I'm assuming you meant SM8550 here, right?

Why does Eliza belong to SM8750 but Milos doesn't?

Was Milos also a mistake?
