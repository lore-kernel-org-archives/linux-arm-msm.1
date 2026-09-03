Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DB33F4DFC
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 11:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788433335; cv=none; b=ezT9eCEvFtBJfJKcqHmdiyMd7YjciKHRUE5q2bVqOmgCw8JUada6lmWvyd+KJ2J/J90eX4KY5R0V2KKPG+vki5EXlKdSwzxwEXAfx4L5zsLAFBWM9lH4QZJBslu8j3tXajD9655vP558Siubp7k2IrU4pY2stq6t4+b2Najp6ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788433335; c=relaxed/simple;
	bh=YDZo9ZYZE772bcwSFVYQA0GZbNjBirUfMskrV/SyAes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TeYvOWoXLLkJ6U571GaX6N+ZwXYu7mUwFzjI9Gtb2TxGoOrCDHSjzNNvOl0efG/G4eon4uoJkrA0u7RysKoicS1a1+qFUwZqxu/4mwESg27miTzvDn/fv7OOYQq8Z8LSKIyM8RQNjuPYDtz04Kr7PoVK7Vxj0j8B5u13mrW2qPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FwGhCqL8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ESKBF4GU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FwGhCqL8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ESKBF4GU"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AH78n1328098
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 11:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hVNPU6fgZysvc0v3TCWPIkZk
	yK6aKEYh3Zspk9Nl3dA=; b=FwGhCqL8gDoy3nnOW3pYn7MpEvH9cdUpcuicy9W4
	yu2ddue2Rl0BAB71QMNtpNLXEODgyI+KcDxPy67+wDO2laZ3NoeHmyM3PMtU0iBU
	dWWNZTfh46Tpm/NRKn490LONcWCLIhJeeGg7vVZSoCxzSZyxXMb81Wto2XLGMJJx
	ut9e+Uv4jEs4W/0c+iIETEXC1h/1fiHe+Uu14XJSG2+euq+L6QQfC7cRmsB/v+/j
	JWVoB4tkCgFCkvkUY4gyEOmDlJ1MHBh3rxy7dsTTjvWoy+6JPCkVkzPgbeenyy7M
	QS4lvlaOB422yRglPd85NZxs64uc1X/eSmQ/oOWscfTInw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrnmp3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 11:02:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92ec3146553so620385485a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 04:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788433332; x=1789038132; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hVNPU6fgZysvc0v3TCWPIkZkyK6aKEYh3Zspk9Nl3dA=;
        b=ESKBF4GURWrcnr6D3PbT4qg7C2Ff+eNUYV9QGE2kp62znYJFRdMrnhdJifxle/y15C
         mBtsxH68soBGdbZy6JtMzxQ4njQuB1D8e/2KQmxRcaYCeJHARpRjf5hBB/zNPKBY+U/2
         aXNVS2bF1N2WcSJfQoevHbUgY8ipmuHdKR6cgQeDtOYgT+YL2eF3S0ygkIcHcX+Ghnbx
         Hv+mdFEk0lVPt1Yx3OfN7ULW4JZjAoUBsjpFza5scdNRVmIb9IbgrGjsQuIhliYTMCLI
         5DGJgfVe7eut1zRRLWIOo/EoWnx3vn5cKlkBAXSiHwbd7yXu9UVbE6Vqu/IrW7UxoFid
         764g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788433332; x=1789038132;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hVNPU6fgZysvc0v3TCWPIkZkyK6aKEYh3Zspk9Nl3dA=;
        b=dTJPrxkuPxbOGP+6ZoEL8LSxJEDfiP4wpIQUxZm2y2aJr0Ch3KJcWPcxef3dX4BmcQ
         jeRqmu182Tv6d3+Env1uja3h+aI2Rwu5gP3wIpt6KXnkE58a2PhAZo+79EnjyxESXy0P
         COJMbgSxfWLYyuX8krpBCaBSSYTaETXcW6pD8C2fKJFXHa9nAS1/niYh7MXEFy3orkeQ
         GJ6zihv55zx0efnyVgnYsz3NVm8RLrYoLE99JHmWvXP6Uxncm2IOld2i4eaQBbA4NNmO
         xPiRFt3LQbnbWDUUKosJ1gYgbD3IeGKEMMdMPda8ZXzQDShzhlXYntgIr9mvnYJjfIBK
         eUCw==
X-Forwarded-Encrypted: i=1; AKwUvByNrXOQSO7Kkjn6DuVN8MH22PZIS76GFswV/N+iX5aisBi1VlxlwFNNTu1/BgKToalXciuiNiQkLTutQzGU@vger.kernel.org
X-Gm-Message-State: AFuF++kK0242VcScTcpWhsthfek3qQCO0eb4kHu4pUdtf618eXAEIgzl
	lWXGk828PinRerqggCyEtmIyXut/zb/S8OznUgiOji+l/UEN+GASDVZycVg/p7wJu4Ks4k0aTK3
	rOUsOlGWbwkKoPIKO6vRK9kxRh8vTHecRQCav1a8Qybw9SNBEHn28g2CarPV3YAyh4lpR
X-Gm-Gg: AYBFou2CSIIIGJYn7lrJefpdHPbxvZZNmURkrvzhpBZvpw52RKGZl9QN1pxygwNiRZK
	vESZA9vVEsUwJby0QxdDn9/56TmbY+mtx2T0ki4V853ZW29JAw1ui92ubYe5I4SXRekZGH+Ch0Z
	zStZvwUJSA7sAE+vsxcA90Se0HlZ6472YF5F2cpOPlurBkdbt+6FD7Z8QCacZfDaPXHY4+udBHS
	aqxUqZjKlj7uszxIgNkSZmgR33bk2br8U5ph6BBUYY5ZZoQTxlqnDdOEDcyLszkP/jY0IMLq77O
	OfDpsnDxegG31CFvuUOPk47XFV+ICVGMs2pgPnL8n6GYeY4drHg2WcK0H5EgenuHo126JsHZtvD
	1zdH2ILR5/M3O
X-Received: by 2002:a05:620a:6f9b:20b0:939:124c:b7d1 with SMTP id af79cd13be357-93960f85fafmr1094908485a.30.1788433332517;
        Thu, 03 Sep 2026 04:02:12 -0700 (PDT)
X-Received: by 2002:a05:620a:6f9b:20b0:939:124c:b7d1 with SMTP id af79cd13be357-93960f85fafmr1094899285a.30.1788433331910;
        Thu, 03 Sep 2026 04:02:11 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5dadddsm72432615e9.9.2026.09.03.04.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 04:02:10 -0700 (PDT)
Date: Thu, 3 Sep 2026 14:02:09 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza-cqs-evk: Add power and volume
 keys
Message-ID: <ebhtzlovapjnznxk5qckfk2uoj3qqilm3rqq66skifm4tiep3q@euzv5r64kcky>
References: <20260824-dts-qcom-eliza-evk-add-volume-up-v1-1-0cee16886d43@oss.qualcomm.com>
 <bb5e86d2-2525-4abb-8ebf-75ba7780bbd5@oss.qualcomm.com>
 <nl4lhbhbz7i5pohlenlbnp2odqybcbgv5n6aeulh7hkhq7s5nn@7ylcarl2fkil>
 <e5292ac2-ed2c-4f9d-b74e-adafc0a77cbf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5292ac2-ed2c-4f9d-b74e-adafc0a77cbf@oss.qualcomm.com>
X-Proofpoint-GUID: L8KS0apKupcNcF3dHfhOL1R54ItWk655
X-Proofpoint-ORIG-GUID: L8KS0apKupcNcF3dHfhOL1R54ItWk655
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=6a9953b5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=dILcdvjvUJ3AZP_D2AkA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5NiBTYWx0ZWRfX5pGlq6U+caxJ
 4QpvH/z6u5866x9YQ6CB1cFdOfZv2n4JoJDiKZGpcGJm7ntokafbBTja7xRbunarVSpxCGEcUcp
 awjysoW4ZEKxDORznXd4FzovXiyT556IOwJL2tuadJk5AIBD5vqHX2Tl5qXFmaqIgkq4pB13Fje
 5bAhr7QygXd6BKoDGWAMsdNlLhH7WjfGJEwVREsyZvV+FtuVNTsLByior7o21chPNO1V38TQE3b
 sDgpTL3kis+0KCuBTILVin6PMhSc5BPyjLst1qi0+ngGsFqAJ+tZfLgiNTW1orUnAX14CFb6HMA
 ZfLDbx3A55YlVkO656/5tYBxTJfXcYkp/nbAnYgMp9pzjiyBwgzILoU1LJM5r5CyXyxzvWJjwrV
 EK0miaVLeELOaR2ZZV0fw2XNeQgMiTmYz1KQ2D+Cx4l7iKo/OktaLYvrmeEXFAWJGE7bvosOE0+
 fIHqozmnE90SOjwAYeA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5NiBTYWx0ZWRfXy3bUeZkfOp6E
 M1O2cwCKu/RJ4MxDFtr4awNRWSs1UkzP+btmsA55dszN8TGe/Z6HxHG8Dyai5rkO85S8y7pXXof
 L7BPVW3Y828slZxY+RBAnvyJJmeS1Ts=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030096

On 26-09-03 09:26:29, Konrad Dybcio wrote:
> On 9/2/26 10:52 AM, Abel Vesa wrote:
> > On 26-09-02 10:30:38, Konrad Dybcio wrote:
> >> On 8/24/26 3:45 PM, Abel Vesa wrote:
> >>> The Eliza CQS EVK has three tactile switches: SYS_ON, Volume Down,
> >>> and Volume Up.
> >>>
> >>> Enable the existing PMK8550 PON power and resin keys for SYS_ON and
> >>> Volume Down. Describe Volume Up, which is connected to PM7550 GPIO6.
> >>>
> >>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >>> ---
> >>
> >> Can this go to eliza-evk.dtsi instead?
> > 
> > They can, but what happens if the CQM variant remaps them to some
> > different gpio? I don't know what CQM looks like.
> 
> Can you find out?

Just discussed it with the HW engineer. It is the same on CQM.

So I'll move it to eliza-evk.dtsi instead.

Thanks for reviewing.

Abel
