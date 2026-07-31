Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92BE24676D
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785481069; cv=none; b=lbFrElJqLG6ygn+WzK58kH+fCYPYRNaflvbvRcegqPd6zVISX9gxjBEFquTzxNf76ZOoxww+o8rIvQd+PdS1D3PfBcVw3m61mvHDiQGHxnQVAA0WOpWc2ENv+V/SU6/hhzOJB0yjnR1fNsHJXLhzUtbxguF8Z0rxwh3cHlT4hAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785481069; c=relaxed/simple;
	bh=4X0qE/+9EobLoj7t9ZV5NPVCQRMDrDTS6U+ANhwEI9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a1uRDfk2n4YPiVlVAA/Avo5x3j1QM8FKwuS2HtT5KkCRyrr2IHScsQjGlKM5HjoPjoBoP0qzLaFvxm7IvxEq72bOSkjlfbjYJA3VtEu1b8FuvNMpbGuGsSNk9F6ArwTuu0YhhXYRGGFzcjtP34pI0PrSngfaM8cAsH3z4pWpTI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o6LWjhQk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XcqGoUzW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o6LWjhQk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XcqGoUzW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V67UES3010617
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RW2EpvqwX1vlL0MuccoDS45n
	AqMv7kF87jFgmJz7eFo=; b=o6LWjhQkZmZe/Nl6BjDgfotR8kSvo/aZKdgSksPC
	a4qLGp6ZajDyCzcPebe05kOaun2vaKLzsNfEgMDXlUL1D+1JKqKkxQCcgepLVjay
	J1a/sMNuy4r0e72hh8vPv48d3W7ETAwfT++j/7sugXKRfsGdfej+Xj3z5ErIcmWi
	COU/18RD9ZN3H4NN+6JOoudY54ABg3qi0aqgNm1dhcACEpQ8q6/R1x+yJ3m+0oji
	izHOEJ4OhR1raWMdo50wEPpgjlH4LHtvJSEjMULwJt9NBlpedd6UqgmOI0njXY+1
	Rr89oFTBe6VSM5HYk8kdeGvyW+JFCD2ZfBeH+U3zhgsIkA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frp5n86pn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:57:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bff5c7035so12349271cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785481065; x=1786085865; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RW2EpvqwX1vlL0MuccoDS45nAqMv7kF87jFgmJz7eFo=;
        b=XcqGoUzW92/uLTojSueKOsFHL9pTBbz931ckuJRYSrvRr9izHkfcg3V8CDaZLDtuUQ
         oVwgbMk1F08rtWMVFKJ2fYJLl+LdMgKj4fUeZ7xZXTv04lEVCC5wYVd6ksrm1aeLTG9r
         TjxlfL4nyaiyY0g5zg0nAuA+SJEJx91umShTnePuQyaUA4sn2PS2uNUvyARvRtOBYcoj
         Cmd+tb5yjTf+EtDAp2fXr24eUmof6nP4uuCPLVt/kywdplHG9zOlHF6nLMeScsoVO1nr
         XSo44V1qen3tZkgran+I9Lo7AnA58EK5BpfZ/5+APr4nn3oC3J8yMe5NX8xYyRGrmbWx
         U1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785481065; x=1786085865;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RW2EpvqwX1vlL0MuccoDS45nAqMv7kF87jFgmJz7eFo=;
        b=IIQustm7iNEcVS9wVod+MIxK56OgjTQivJhw0zafBDCe7a2nQtxadPtnXCpb1E9cR2
         1H7oTruSdeElsX6gC0zSXIDgJO0eZI9w2elFvvdP8f8stOeyL0ki9oZMJM+q2uiegV7x
         h4Ns9yuB/yg7Lbtn6BztD473USRjCyTbo5ftvXtplXW4KYflfJ9TI5b84X3aTY3URt5Q
         0g5L6iD4+55DrWmSRcQJ6MlonxdBjN6TUYQHnOFmDI6LF0EvQpEemrbIOauYwUxJNAjq
         aMQ8VjglLoOfauT2VFmqNfWqGTQBZts9WANuLwQajse6nMfDR5zhK2Ajp3F6FztdKuhu
         30lQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq1fQcla1xIpkgWgntZ3jfPdYzLoQrtfsSeeOWXbjNKHGoGA6y4ltvx1OvDppjcoy5liQ0aGtXc7QlEslpm@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi2fjp9FJp2/2IKRnys1+0fbekQ/PZ6dUp2xI5QtuvUgUXtVhM
	Y8FgrSaZzneGF1SNeL4+C2BrEj43vuzsUK0EF89ZOnvxmMvgVbSlpivasYy+ZRezIz+2PigjbHL
	SL96I2FzdFKJx+bxqpiKQELiaUTPelj8EoMTkQZMVoDIAn5ySfDn0gboDAJJxdGfaePXZ
X-Gm-Gg: AR+sD10twGHy4ExMmXVrK7oxn3bihXN1WVme/mMUmtRvX2VzR12Wx2CgU+Ax76I2lYU
	d5mknNMRVeHdc4xIDR5bk5UkI/DqVjMCa4P7tT4MUz9Ur2M4GHjwvCJSxxnLnH98kGI0LeGJrfl
	FqLplyDv/vFK+HTJcrq32SgTlWeI3jh48SO99gvTOCtErPtZhI4Syob4sIhETXd9XxnBN7mmGsi
	y1QO5XsIGAxa/uKFuVysT28FocNMkHICdSSsu4hH4/JjNZ+Ocgd+TWn2uIgNqBU86t0yba/gBEV
	TRA43P9Ki8hFXEByEIRF6R77axu4ctBYcZBk1nJtuB1ELbTo0eW40smDyGrAYG8e+jYDYFTAmkm
	VbZCAA+okQERoAe8=
X-Received: by 2002:a05:622a:1aa0:b0:51c:19af:6330 with SMTP id d75a77b69052e-52b4b001ac3mr9750161cf.36.1785481064865;
        Thu, 30 Jul 2026 23:57:44 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa0:b0:51c:19af:6330 with SMTP id d75a77b69052e-52b4b001ac3mr9749791cf.36.1785481064373;
        Thu, 30 Jul 2026 23:57:44 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458ea4asm1206691f8f.31.2026.07.30.23.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 23:57:43 -0700 (PDT)
Date: Fri, 31 Jul 2026 09:57:41 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] remoteproc: qcom: q6v5_pas: Fix unbalanced handover
 IRQ enable on attach
Message-ID: <x2wm2xdearpzyuvu533big3sv4iiwl6oayjwiospivuikygcny@ftdamvzu73ky>
References: <20260731025655.2642860-1-shengchao.guo@oss.qualcomm.com>
 <20260731025655.2642860-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731025655.2642860-2-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: zxOXHp7QyO-GM-Rwl0Zx_uNm3jAksIQv
X-Proofpoint-ORIG-GUID: zxOXHp7QyO-GM-Rwl0Zx_uNm3jAksIQv
X-Authority-Analysis: v=2.4 cv=bKwm5v+Z c=1 sm=1 tr=0 ts=6a6c4769 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=CQgz1JFcaKPrw9c0m9QA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0NyBTYWx0ZWRfX2McKFz+Qv9/w
 GXli6MU1Y5xYAN3+3z1QgvmSGPXJYj47vic5/OyZgOqKOX1kXk/v3pvPQA9gUUmQy4VfYgsixHs
 36xL1S72/X/toC9NK0kRMzxqw+R/UcPEv+7NQWvCIo7NGWkkUWNIZUS5yxlWKIxS7Xzpvy3cgXu
 rUuzEQnuy9iK1r08xS27GQyruLPaTdTXid5ihTT9niDC/qgjnVysQJtcoX81UOeD7rfd0fevuRb
 ZwyMEfI6++fjfMxusxa58kuVw2uyoP2ZHveIxewuW0uDE49XFp1GbOKw1CTWLf9s8wFUmmKuci/
 nJJXB8jyOEv9PI60SAV5JeU5Jvuvsun4xHRmdEY9yxf1sstE/uy2zfE/OwcZyNoso3ZzSk2sTtZ
 psfvjI9C7qnYDRqQw+xzK/IyQqLF6MFIHzfQ7xrmOvsq6Jdjb8NxdBMS5h/56OGkyCgUkI/trJQ
 wTUmQnmbSOv8Yhh+GFw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0NyBTYWx0ZWRfX58Vha0/NNBM4
 cgQOW0Rkz17OGFnKGonnbyIKrkDANHohcdfdOPq1YbpIwqQLcyzwo9ZQs9Wpbp2FM+DzAAOr9IL
 oJ55Hpe+Mc9u58AGfVwarhMTYA4iV8E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310047

On 26-07-31 10:56:53, Shawn Guo wrote:
> commit bb7c5d6f5b41 ("remoteproc: qcom: q6v5: Make handover IRQ
> one-shot") introduced tracked, idempotent enable/disable helpers for
> the handover IRQ, gated on a new q6v5->handover_irq_enabled flag. It
> converted qcom_q6v5_prepare()/unprepare() and the handover ISR to use
> these helpers, but missed qcom_pas_attach(), which still toggles the
> IRQ directly via enable_irq()/disable_irq() without updating the
> tracked state.
> 
> This desyncs the real IRQ enable depth from handover_irq_enabled for
> any remoteproc that boots up already attached (e.g. ADSP started by
> the bootloader). qcom_pas_attach()'s raw enable_irq() leaves the IRQ
> enabled while handover_irq_enabled stays false, so a subsequent
> stop's qcom_q6v5_unprepare() sees the flag as false and skips
> disabling the IRQ. The next start's qcom_q6v5_prepare() then calls
> enable_irq() on an IRQ that was never disabled, producing:
> 
>   WARNING: Unbalanced enable for IRQ ...
> 
> Additionally, any handover interrupt latched by hardware before probe
> and delivered once qcom_pas_attach() unmasks it is no longer
> suppressed (the ISR's early-return-if-already-issued guard was
> replaced by irq disable-after-first-fire), so it runs the handover
> callback and disables proxy power-domains/clocks that attach() never
> enabled, causing genpd runtime PM usage-count underflow warnings.
> 
> Route qcom_pas_attach()'s IRQ handling through the same
> qcom_q6v5_handover_irq_enable()/qcom_q6v5_handover_irq_disable()
> helpers (now exported) used elsewhere, keeping handover_irq_enabled
> in sync with the real IRQ state.
> 
> Fixes: bb7c5d6f5b41 ("remoteproc: qcom: q6v5: Make handover IRQ one-shot")
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Thanks for fixing this. I should've caught this on Glymur.

The fix looks sane to me, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
