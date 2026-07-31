Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C1D37EFFC
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 11:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498459; cv=none; b=kO8uDvaBeUaqvkjwhKoDvprvfHPdlfg9Yr2NJLdEYWgP+AAzrrfv2I4BVSYGPkAYEQFV0zFprO2ODRwCL351vekraPu0sdzn0GCAvQiMGCZ/hfmGbd7Jcyp5Z2yCRAssICeKAzl32EoQLN8esh5PEgl8ZvZXE7xtMmpNI9XwKps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498459; c=relaxed/simple;
	bh=DnhkgYMHfvCFu2QJMFO5Znf+coywQ8Bi1E6oL5tojWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PU+p7J+AxXFton/SyxmPe8YctUWqJUlZa3kaHITx9CDKR7tTUoHbcCLpiJYmvGLo+uwMy2doFLE8da+a/XS16LVQXi9tod4NJZxWssBR/bv1BkMBTDSfD1xvjyrpQ88c53zhitgV2l6GpRGljHGkyYApTcDDXEYm5RqSKb8mhw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ie0J/QDU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U2N8/qzw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ie0J/QDU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U2N8/qzw"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBa1CR3742200
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 11:47:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DVtpalNU2+7OReB55Y0D7oXXvik1+l9HeGh0NADjc0w=; b=Ie0J/QDUSkrKCND2
	U31C008YtRYBOsu4hPT1zMqNx9Pw3SMjhw6XuL/Ea2fkJortvIbxgiXxmwdOiRBo
	GzFx069oSRe/CfpJSgjnW9pQcVZyw8J5fndZbpmubkTvMO0PsWwBsO54t4+cjDhp
	UAGvYEHC5RHr7x+wayBDdIMgDKDiTt7qQat4kopXRBpH6gUyxJTfVRys1IN18Tsb
	eN2c3NuJ1GNRZNxYonRi7PntPV92CDHCmehSnSGGGsWwZUV4x0ywS7hFzXJfYFzZ
	CcSmtgD9qU8B6hQK+tAUICse4bp3vty0uZ51dm6xsybBlmfH9N2kYLfZHY7qjAtU
	HEvC/A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frtyqg1er-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 11:47:35 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f21e4e8b66so2040386d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 04:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785498455; x=1786103255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DVtpalNU2+7OReB55Y0D7oXXvik1+l9HeGh0NADjc0w=;
        b=U2N8/qzwsp1AHiZESctiJc0AQIPvZj7Ati/q6RzFAYc5JKZOTl+nc0o78j7DG0cSmT
         rk73M+S2cSzKilHCHi6W8Svnl+DprxjyVvyinvqXU8XY5+TPWgvc+LKfxkQTUx8Dr19m
         H/FfyCwXkmSFvFEp4eqx/k3NsrABk+yMsHg0tPXuIWVwFNX4FQOPZMEIj+payN07NsjP
         iooDf6QTi2tywJsegHF4Go1SrvtR/efHdW1N2u8C6oYrdO2v4YHyzfVUXapOnTOJfe6G
         oulA4haF0difAsdyotQK6eMq/2TCPBScQsumpEqEltAXnbpoVynvhBSx9ZAmqvvH0U+m
         tu+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785498455; x=1786103255;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DVtpalNU2+7OReB55Y0D7oXXvik1+l9HeGh0NADjc0w=;
        b=sGQCiYHfciBG5JMn/wDNsCw/3ro0YeEAgj7dkNUdeaTyMBZg6w/YOgW43FHzSeooqo
         A4YENhhUD1L1nhY0451vcND+YD3uMqyBrTD/4dXvzpA9flBrTf5XZ/EedOt6AUhgx1LU
         Mf2bU+Dh0nb8QmkXbKqH4fLnXq6ChJC6LWz1yxb6ASSAElknnvexMS+IctB7dtXdRzQF
         UVwPMqMoHrF3bY9gRzVQ0BFzvldOh/ysgs+l3bHAKyPi8OlTbIKyXgHH4Dy+EJDBm71P
         8vxBQmLQZ14vtHOFhwD7fHIrgb6I5IlW82yg1Ffhh4kCS6CX87lWKE36pUIhS2IdT/mb
         Hj7Q==
X-Forwarded-Encrypted: i=1; AHgh+RpSoI/RgxnEN7eAUYoeRR51GZApfY/wZG3UNQd8HE+tknAz9se1aKCnmfbW6+/oByJ0cSXHt6ar5go6XEDf@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ2ITSmiQUXLchU3nvzEkI66ZnIfBkKHnigd6ds2OMeyhhfJYj
	BLzwf3sLEw16h4ina9F/pmr0oTJvXNkJYOEO00eId5AfJ3rWUy8qTGWdNWeItd4xk3aV33+m/Ym
	tbZunk+BIJ5IcsDRI2aJrnj1DIkzqyAaQs/PopS/JHP87HqGhnKL5Dldl8zd85bflJ+zc
X-Gm-Gg: AR+sD13XHImOheWybAFbmjh1ovTnB2cxRb7yh3tejCFeSyzS+68kCZF/9sK6qv6OFl8
	8bNGQvvNwH+mLUqERW0ZoYRh7IEkvF77OaOSDd+IidNWD7AFBT/qh+kP1TFKzFZMz7LK8Yio7md
	lMbWOAnT4mHZPFwtnWqLNo/ypPJeJ1DUMTtOzVN5e7mpX/hXJ9mu0sXoHWK1whYRaDIZeo3d0DK
	YfAzU6UP9VqljFavN6/FlWk2ryWclEeaebMEab3kX/NUybu5L+y/Z77wviBr/jI/W1PPJzL7wq7
	g6boVGvnFbhcGU2nb4+1CS9wW12uY9wPPn01w6DVXnFR8Z+WJzp5hjwfVjGS6LAO9TBjDvSmZ0H
	ZEaei6EnJX3ghEmIbBbcwqYoL
X-Received: by 2002:a05:6214:258b:b0:8ef:4749:b1c9 with SMTP id 6a1803df08f44-90842433681mr23970916d6.5.1785498455020;
        Fri, 31 Jul 2026 04:47:35 -0700 (PDT)
X-Received: by 2002:a05:6214:258b:b0:8ef:4749:b1c9 with SMTP id 6a1803df08f44-90842433681mr23970466d6.5.1785498454594;
        Fri, 31 Jul 2026 04:47:34 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd452d93dsm129675566b.49.2026.07.31.04.47.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 04:47:33 -0700 (PDT)
Message-ID: <83d5818c-d764-4385-b430-ccbdb33ddb88@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 13:47:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] media: iris: reference count video instances
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260731-iris-fixes-v2-0-94c002016a09@oss.qualcomm.com>
 <20260731-iris-fixes-v2-5-94c002016a09@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260731-iris-fixes-v2-5-94c002016a09@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA5MCBTYWx0ZWRfX1sIBlvzmr9zQ
 RNZf/n20kcrxzAw3boNojq/6bLDtlAOuvIqNolmcWCy/T1kwZCkoViv6+bSl/u4LVlJ9nZ9qq5r
 fvrOqpe/89fflqlnojnNCIxvst1QV/ETdwO3Mtna58vxNtpQlExQkp9rjVgipa4dQEhfG4ARIqZ
 JIlGvr/rBKXJqaUys/bD7KxcAo15KAodbNFOJ6SrhLAmTZHOat5j92QCbM9sEuiYCtC2oyUtbxC
 vUBPPxADefi+NxkUr1g2gZimw4mOydj6fwC3cKuoPvwPV7nznqqZ8Wo/g3ercs2GzrSdQMFofhf
 0TWZEwapnh4nlVo8yQTTi//WV6uWHDdxUVlWzRyIMNkrVfbW5KXQWyPal1UtqetAz/1vnA137qj
 /XTxYHgKcxRIsIhBBvxNpfXPEnk78j4nmdyMDF/lwRa0PMtx3DErgrna3bvg07JMGx2vKdLJe92
 CWe1v549F1vzLT84ong==
X-Proofpoint-ORIG-GUID: QedO9ZYb4WO53FLOuyjR3dgtAvI_KQoI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA5MCBTYWx0ZWRfXxkXS3ZAsUJ0S
 rE+D27ny1KPUnFgCRJEN0l/6h4E1kzBtDA9rfqT5/GSRUUrkmoFtwwPFCfoF3NJDSZPbcgkigtf
 x/4Aq+DAZt4k0lCMA6kqQFgu7iT1bYw=
X-Authority-Analysis: v=2.4 cv=YaGNIQRf c=1 sm=1 tr=0 ts=6a6c8b57 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VHsrxQYZaTBPj5NF5iQA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: QedO9ZYb4WO53FLOuyjR3dgtAvI_KQoI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310090

On 7/31/26 2:31 AM, Dmitry Baryshkov wrote:
> iris_get_instance() looks up an instance on core->instances and returns
> it after dropping core->lock, without taking any reference. The threaded
> interrupt handler uses this to find the instance a firmware response
> belongs to and then takes inst->lock. Meanwhile userspace may close the
> same file descriptor: iris_close() removes the instance from the list,
> destroys inst->lock and frees the instance. The interrupt handler then
> operates on freed memory and a destroyed mutex, a use-after-free.

[...]

> @@ -92,6 +92,12 @@ struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id)
>  	mutex_lock(&core->lock);
>  	list_for_each_entry(inst, &core->instances, list) {
>  		if (inst->session_id == session_id) {
> +			/*
> +			 * Take a reference under core->lock, paired with
> +			 * iris_inst_put() once the caller is done, so the
> +			 * instance cannot be freed by a concurrent close().
> +			 */
> +			kref_get(&inst->kref);
>  			mutex_unlock(&core->lock);

But none of the _puts() are under the core lock?

Konrad
