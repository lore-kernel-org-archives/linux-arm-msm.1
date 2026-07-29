Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB77F3AAF74
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785339179; cv=none; b=BCahaaYcSw9i6Keu81w3SLH2iFdTSnNYHIz0pfCD9eBTzSXGIwCXjgWKq99//M7fORziTD9+BAIM1ZWov+wc0TXIak71sbuR2PBnnADyR8EGQx+b3j9wkoKIQCVp7m3XLpM5S3ARsLwoZ6sM2SCUD437+HjZzBt/8/0GJ6zeP+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785339179; c=relaxed/simple;
	bh=yfrsC50ioGPIMFrNhawpkz8O61LnsoDnGzPO6q6DRQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y60QeVmefrWS8lAQMuUdXFV720gGIv6iyIX6TjskHTBBC513kRTuEob1ShtLzQhqVfiGt31xeuG+AZpCvlskCowxEy3qylkrewZ/+EznxHmJ2hK6jX6xRiJIgJQep1uUG8nAXrX45uJcCpy/BpxbKyLz1aRNwBIb4LFPSpFDPoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b4Mtw74K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M+Xh5W0/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b4Mtw74K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M+Xh5W0/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF3qbb2413097
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yoh+63SttaOY9zCSusjP2waN
	JNCY11RiLRNnfqSUL5Y=; b=b4Mtw74Knj8bjb3cqtocKVGS+Excgkj2UhNKT3vP
	1APzxR86R2TYk/YbG+ThF+rRPJN6LI/7PyviOP9OC0GLbtmSme0Uw69qVrMk7Gcf
	3fPQfTPNKocTd3Nd5xBWbX2rPN6LWDLVQWFuLbtIDXeNEqENT1ONWhmcfiTJ3uvQ
	tMqfX7/NWnvZyhcNNAjFIfYyjkO9yKreTrDe8UrcVahi2HvmZywrhP+hN+YjyjrV
	reWQ/qQhsLBS8cgKwC+wQKYWVx3jMdfPMBNHCNYm88Q5BV5n6aymLzVI/2OS33Ar
	YrUQYkmBqt5Jfc8CsIhs6LVXYtbELRsR4fcA4+4syKampA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqh3gh21n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:32:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-522de3c645dso20781821cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 08:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785339173; x=1785943973; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yoh+63SttaOY9zCSusjP2waNJNCY11RiLRNnfqSUL5Y=;
        b=M+Xh5W0/hNwkBR15gsO7C9ayAXb5YUcpW+p5L+S0uE1wkKQQupgKjnZQMcanU84VKj
         aza5OZHHBJO5Bk3bIyDcZOD4sk9KUWnz3MjPhFweal58S8EKTP90MgULGblbkUowsCSA
         D4pJCPr1OrROJqqt2Re++uihjyIaQpiZc+DDYLURQm7Sw9wJxq1+0JbGRu1MTchFHPY+
         mAs2SSRr35MoQTl4OvCbNxUD6eLEpU0KsjDQZDhLgLEb96AuIi6fAbg/vdpyIhD7YM4/
         PqtzAZlOaJ+AiPvmyYbL8eHsBfFqEw0ydzYxhFi+7jx5whUrouycXvs4+PFaRzbwkTkD
         FbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785339173; x=1785943973;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yoh+63SttaOY9zCSusjP2waNJNCY11RiLRNnfqSUL5Y=;
        b=PgKEedRasVR9rnKNruQXg138dP747FoNUYw7VKc8VpRmdqtuKlm7Hu6Pe+4/Ionvgz
         7GcVrw/EX7CO0tSQfQHnLZvgG/TIeEC4s1lI2F71kpE+YxagY4Vqjj2EhGehX3cLMrry
         pydEkz8N727nS7bEZXEPOyRmvF8uZdoBlZVtvaC1z03a/WBsaUxqU9mxwboddmLZPfN0
         eMpPDMKL3J/GkqUk6/Hzz2dXrOsEiceLfBttUYBxFhsJjSoYi4ROMiYskXofhTlrWRfQ
         KUlYxNERJXef8w0tYq3DlnOw5FxesKC6+UUKC9t8GtPuRy4tnnKDjTmpJ/22FqZwofn9
         hXyg==
X-Forwarded-Encrypted: i=1; AHgh+RqJgItn4y3F/3Ops9x1PfUpKu92a6FdAD3/s57W7pwlp0ZT2mMbLGTkuhyi5FoEH4WmfaK5fQqZvzlgrg08@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkw6uz4yOhAiu2tr2ZQMjwOCj2R6eSBI5UqXHeR5yjyClQyggk
	+L+JCb+XnQw3BPTPFU/FNBIrYOB5pXqVdAcAgIq1ni1xp3QnqBQdvBP0OLhX8K0eD5mT0KKp5b7
	cK6H1QBpVLwZg/2AewY47vykCudy4Z9rG4f9/XLB02fN8EIdpTFeES+yuo76VVsTRFGsV
X-Gm-Gg: AR+sD12lEUBVKnF/FLyoaVI4NdkVEYOq4/kG2lm+YefwbURiAnOfzoIrk93j2kbq9db
	c7Lnu4kKl/mDLGnZPOwTUBH902DpT754wWdJjd6ytjZkKWqaoml6haATBYLhuut6MZEl2doQZ1/
	/HPsdw9S2xAemKMtK+3BKjyaSI8bmJknjE7DnyRBsS+wtS4RfblPdEqM1F8f/c4tqve8e8MijbN
	aEM4KBvUlS4zPK4w5fBCk94ppT9hY2DQtURv7KgwDMnanhVzWVWzUYHiSZEQSUb00EJD26FlYLU
	vgVIvbxl4yMhUWzJSlq5D3rBCDErQrDJlwckf4CbGjKmlzN8O7LmpZsrOk6N2FxJjanyVhR4UE4
	5goq3iGGmINdSC7o=
X-Received: by 2002:ac8:7dc7:0:b0:51a:8c86:bd42 with SMTP id d75a77b69052e-529d7148884mr64378981cf.63.1785339172001;
        Wed, 29 Jul 2026 08:32:52 -0700 (PDT)
X-Received: by 2002:ac8:7dc7:0:b0:51a:8c86:bd42 with SMTP id d75a77b69052e-529d7148884mr64378391cf.63.1785339171272;
        Wed, 29 Jul 2026 08:32:51 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4976bd83fabsm66366305e9.15.2026.07.29.08.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:32:50 -0700 (PDT)
Date: Wed, 29 Jul 2026 18:32:48 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: eliza-evk: Add PCIe1 with
 TC9563 PCIe switch
Message-ID: <aajfoxioypwxysjme7wmdlkhfdvklwjc26dldvdnkp2axlizp2@df3gcwfgjadg>
References: <20260729-eliza_evk-v5-0-41790a5a24de@oss.qualcomm.com>
 <20260729-eliza_evk-v5-3-41790a5a24de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729-eliza_evk-v5-3-41790a5a24de@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNSBTYWx0ZWRfX/eVjG+E6ZHf5
 n9wSr1GP1tbQNq5o52dAoHYKGAo1iur7buUM57V9eP77lE8OlDME7B42gcCkAL/1v9LADcgBIGo
 OZjPq89BL+OvMMiWHtlHAKwe8wte3io3AJp2qOfykLb85X0mpZkukS6FZwigSrqu09NP37xR5IM
 WwI4TPF+ghTZf5IzChYqe7eLBr5gGVhsjd3Um/leX591eACEbNm021A/GH9uptSAgdqRfkWh/7a
 NjMvogDLYz/IXlulbtqZ4A+eoQc+yK0ZapwKzV366Ve5FNNHza1mlC94YupzjAptqBa7KRXEZDr
 rb6xqAROIXH2gTVEXtt7AfV2MgjhjbAUKLH/Euf/IVhkqcWJVpA/lZKuLgpg5+bQO8Mm6z1BfSo
 HG/hfwATX9/7A2LyR0dU0DuqmgRVJVz486e2iyZB7jtZ1hxhkYWuSPl/on1ktgdt2DdCEVTPAAC
 kkks8fHd+kPCU1Exs9w==
X-Proofpoint-ORIG-GUID: kk1v5b3qWFpXOvxuBXCKTpFUMjE1zdbb
X-Authority-Analysis: v=2.4 cv=EOw2FVZC c=1 sm=1 tr=0 ts=6a6a1d25 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: kk1v5b3qWFpXOvxuBXCKTpFUMjE1zdbb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNSBTYWx0ZWRfX7APQRKchtzDM
 YKr1m8Fr2hauZ3UOo2Gwtj6jCIXwSR3v0gCT4BsJ+eEHNxKEG30CSjRMrv5tqnSfGI5n9xy5mFL
 qW055DqbiIPKDTsLoyl0kE1UXdZ7Cf0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290125

On 26-07-29 20:18:38, Krishna Chaitanya Chundru wrote:
> The Eliza EVK board connects PCIe1 (8GT/s x2) to a Toshiba TC9563
> PCIe switch. Enable PCIe1 and its QMP PHY nodes.
> 
> TC9563 uses I2C (at address 0x77 on I2C4) for its management interface.
> 
> Override the base iommu-map with the expanded set covering all the
> switch's downstream ports (0x1400-0x1408 SID range).
> 
> The TC9563 RESX# and PERST# are OR-ed internally to assert reset on the
> switch. Use TC9563 RESX# pin via a TLMM GPIO and skip wiring PERST#
> from the PCIe controller.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
