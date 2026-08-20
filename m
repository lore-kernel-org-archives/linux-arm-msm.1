Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A064F484257
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 17:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787248789; cv=pass; b=rfaJGPKE1SCgajOLn2G1vdK1pyFlGFu9+ssoo/wI+LIWdkUa89rZPwTynADPLIMo1Fv3fxjwaq97nMJxxWbzUOS68Pm+vDyJNbQP5Dm9GWwpogR8L55PZvYix6LxiHcl+VY22u8iyAilDFqC/1CER1WP7HM3g9agd2/KQa/w1SI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787248789; c=relaxed/simple;
	bh=QFdxtm41wVDEsAP+K+yhfE0hkJ/8UD9Q8TAdZcZFzEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GbLZHRndDV71mVEhFy0HdazdBiWMqiyoJDVbECLQ6fPavAOYJANjSzD9HOEK7J4rYU+IGyFOm96/X9PZ9OyI1hYQK58ZYJHX+ZnwZNKVlkXs4umDojLnG1r9zU+qUzLnE60Y288RfIIzB/L8XyvaIXuHB9jEubWGHZeG/yd11VQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HQ8/tyTp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QXEofP4F; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HQ8/tyTp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QXEofP4F"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KG8BDE3492395
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 17:59:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QFdxtm41wVDEsAP+K+yhfE0hkJ/8UD9Q8TAdZcZFzEU=; b=HQ8/tyTp1N8lZXAI
	n56VZ/6sTM5fPrLrBAnAkhRJCpXBa+kO1jkpNIQ/Qwx6XN5H1yhfEspZq5hN0hun
	AHJf2x61xcubSNZ4LqSXU4ZPlXMyggQyJFOw7oLLB+FzJaKl2h4lHO37PXZ9JJ5s
	oY5wWTmsVXeQ5c4t3Iv5Dn+ufy3+mD6yIWlnaTxFvz08IUMEA4H5a+2NRNxgIvp/
	LlujvrKGgikT6i8hpiwoL5t3i6UvxS1s4aSijuxc+sp+Q4ZrqMwIJGXb2apVHfL4
	55D0uO6RZp6POwxLKSOGxpZkd1TOwB9b4yiiM5g0hCE/4WHV8ZlWFhLMFY1l/Rae
	0snVsQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5x29jj29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 17:59:46 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97c475ef060so84369241.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:59:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787248786; cv=none;
        d=google.com; s=arc-20260327;
        b=iRjZ7Hm1VpLL3N58y+MJ66/nhlffQtLZuGD6z71JaI76m2IpW+7Gg+LOyFZT5vSeL/
         CphZQoHe6/XHKCmLweQUgG6NO0fRac/h8fQn8NgHru9ePCbGfCDE3zsJivK0dlNGR4cJ
         JtkSRJmafnnmV111vsaiXfDDlApKKbq9lzH39Wmla4dym7Kno0AepBFC2M3xN0eNTXrd
         R1ph4PEWHEHien3qRqwmPal/tOXa63OtsEhSZswjFbkbWXuwz53/C5ECmGG2mgDybk0i
         3kz8AEe7xZFhNs76qR0bQAJvq4QLuHVDbfwGZEPMMgw4WTsKABOaufEVwWzbQ/WR3DJ9
         BzhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QFdxtm41wVDEsAP+K+yhfE0hkJ/8UD9Q8TAdZcZFzEU=;
        fh=6BCycx0n9ZkNeAjbElKUjvEU6rVjhXWV/7SlI5w5Ssc=;
        b=eYcXJgMUhPW3XEEB3LopqYurmLzmVOOyMAL1DWgzBtuj3ZRkVc5Nw7aK/e9XU+1rO8
         k3+pX/HxsqSC4/fz/QeWf5sgtsMuGwRONlgXL6Bux0NB4J156DVx93MWP1QgoHDqm2XX
         yCbSliG3aWSwAb+SWgUYTmtUkVAwBcKYAqgGziVXiPomRbPH+hRCjQ+9CYxZ9sJWwG+0
         KrCGfdOpWldTdiP5o8galbi7719ii/GLByVm9Lh0DXJQl1+4OJUS4cvgkArknSM5HLTU
         aNs/1907A+l7niAJD3L0RgswZyVifdGmUlETnIQd5tMvpKRe5g0LalAjllKl+gpIe4Zw
         IEMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787248786; x=1787853586; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QFdxtm41wVDEsAP+K+yhfE0hkJ/8UD9Q8TAdZcZFzEU=;
        b=QXEofP4Fmv6mc+U2Wgq4DlEvVTsPYKd+ecxGVcHNWiiScmQAkIiaZVKTR2VGN54zLq
         u/XMS5x3clhEOdEAvRtdPcG5BLyFyLRbEXJe44kIwTZarokXNJ4ex95X1yB7jYuLTug3
         7pYGlwZnl0zyh9uysOtFacbvvMzCIz6/IQmzG9F1cltlUaSzmVFNxpWJKu5WjBSfO/rj
         NlCyCJJVvI1TRaRWOnZWpFZ0t7Y0/MzTNTzsMTEz9NnIeHTpxosVzXeIBPkCyvCHP7kj
         K9d97Eh5B3NT16SwzjyK5lovzQ6Ulb+CA1nKc8ZHf5vqk6Ofzeby4c14twDWfKN4rEYe
         5erw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787248786; x=1787853586;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QFdxtm41wVDEsAP+K+yhfE0hkJ/8UD9Q8TAdZcZFzEU=;
        b=MxcbvvhhuZjXJmJEbklKlnAAy+mnn6EuOWhpsWgHu9xKQ+5Mt+TI/f5sez9ohiQb5q
         Cl6+XSAwURVcY/ER9vLT4/HbWZgEjT2XGum3MCVZe6HIbQR/hlbiAMMepSAT9gGdlrPP
         bd/aZZ0hU4JClNw/KCSLHn+NCwUeKB08PAUiQ+azLkQAe5zgfNqsVtRcTObygY/lJQ93
         cSKmoAKmdrm8crxtB6OYCQX+vdeH4TlT9I0ygfy1Bp9nJbv73yKt9rgbHkEdL8aod0R/
         niDmzRZgndGBmo4AI0yMqLfWbMnRV2ZW61IaX093VswXSlf7tCVQoMf67BqsbFnfJAvV
         s7mw==
X-Forwarded-Encrypted: i=1; AHgh+Ro2ZKVKAjivMztohuuduZTMXhr3fqhuLLIBonkCgfGh8dOippZBm+r04w6wH9rdD8EetLsWC15rAKCflhaY@vger.kernel.org
X-Gm-Message-State: AOJu0YyuKqm9PQo2PLKr82JcOY5NYIRYLR/2riOnmC3KtvBqzwYGsP8v
	idd01m9WSAfgB1Ol5MGinCw16WpzLNpjEfMZPrWY+tpbvrPcsRQvdQt/+QFeet7OfNfmd0juXA1
	0K5fJrnim3+1UOQfIri3E5dXVzACm6sHcgyZnDQuNuJUcZ2l87gIp7R3c4MORUEwXh6iC1VbrcZ
	lcP03pGT5QEhHoBX37Q7KmPCm0wRoNE8Dhjzk15YtQjxc=
X-Gm-Gg: AR+sD12EaWFNl9UYT4qWhGgFie+uwQonX+XRS3O2T9cMH0AuDlUSoMnLsziUisEuI0T
	boEcT66Q7n7uS31tmokUsOLWtsBiHmK99/bF7QSGljpcT/t4jASSbTXrmoU1ocGJHDAlFO2MtH3
	qJu+6PXxwylIVo16IsYH2hvBeV0RaclKdzGLh3f2H3rfafarrM11TRdfIJnw==
X-Received: by 2002:a05:6102:3f86:b0:729:affa:70fd with SMTP id ada2fe7eead31-77a63448e0amr337883137.8.1787248785683;
        Thu, 20 Aug 2026 10:59:45 -0700 (PDT)
X-Received: by 2002:a05:6102:3f86:b0:729:affa:70fd with SMTP id
 ada2fe7eead31-77a63448e0amr337818137.8.1787248784750; Thu, 20 Aug 2026
 10:59:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806051915.2234481-1-pravinku@quicinc.com>
In-Reply-To: <20260806051915.2234481-1-pravinku@quicinc.com>
From: Pravin Kumar Ravi <pravin.ravi@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 10:59:34 -0700
X-Gm-Features: AcwNN1WF_dUI9wIt0GRHRzqxRaap9sD1gWktU2w2B0QM4QA3qSEnyqDEX6FnY4A
Message-ID: <CAPd7Qn3QYyrzBFFjB4+M9Je7uykYgxHiM+vh-mNVJ16QaoPkJA@mail.gmail.com>
Subject: Re: [RFC] Synx: A global synchronization framework
To: christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-accel@vger.kernel.org, sumit.semwal@linaro.org,
        andersson@kernel.org, mathieu.poirier@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: X4-iiemrT73kUpnbWVPfGqBcw0R3MRPE
X-Authority-Analysis: v=2.4 cv=V8BNF+ni c=1 sm=1 tr=0 ts=6a874092 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=zd2uoN0lAAAA:8 a=UqCG9HQmAAAA:8
 a=7OwBbYa5yZr9SEWkKL0A:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDEzNSBTYWx0ZWRfXw0YXX+Az250o
 n677sQt3y5i6rsgm+vAQvRIvPlSkduuiVhRK2ERxSGqjVVVpkoZ9vBjbcZP824tbeI/LD3JQpJn
 a3W/ZDRKfbFyBJEbWpsuEjqIAcDvxrMPuVB7YkRebKNbEwQop6KOhGbgpKLkftrUHXNijI/K3X6
 79xwkPbsWEr2agpvgwB9qTWDqV4M63RG45uQW4u3hAPIshEpq3ig4tClu6zPj0hd2bckFUIg8Wf
 adlvFuINqnOVRndZfIZ7O4QQye05gBbXjdcSjHCNssl72pm2ItX1vMdLM356o/yQHm1/XudMvdH
 twmm+yvQ/JHqAnHN4g0Dub8f4qsAIinbU+tI6bxctIDIGCLmBv+hNdvf9QeXY6hC5hOI44t70fc
 PcchV3YLNOxY8RHnX2Hk0HDeXfuTLc7H2Npf4QwTs/9dFlIHcLUv+w2ll/mhVqDB69VHMKlDFF2
 gGARrqwAObSQpHtI9vw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDEzNSBTYWx0ZWRfX3/82D5zetqrp
 316T2dEcJ9HxIdPu+nN5kRrrIyby6SytBnIX+KNqUgUeA5REuS++lPaHynOiPs9e6V/Rs2TZsjq
 KMpNq889SE3413iskgjA6vLck4DP1kE=
X-Proofpoint-GUID: X4-iiemrT73kUpnbWVPfGqBcw0R3MRPE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_01,2026-08-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1011 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200135

Hi Christian, thank you for the pointers.

[Note: your reply (Message-ID <5f90bb35-994e-48bd-bf49-3001dcefa2ee@amd.com=
>)
is on an earlier duplicate posting of this RFC
(<BY5PR02MB6866E35A2B4241CF3A728A99D3D22@BY5PR02MB6866.namprd02.prod.outloo=
k.com>)
that went out with mangled formatting. Continuing the discussion here on
this thread instead, quoting your message below.]

On 8/6/26 13:52, Christian K=C3=B6nig wrote:
> Oh, well history repeats itself.
>
> Well to make a longer story short what you describe here was the
> original dma_fence proposal from >10 years ago. We fortunately
> rejected it already back then.
> First of all some of the stuff you suggest here go strictly against
> documented dma_fence restrictions, especially no point to point
> remote signaling! dma_fences have a huge interaction with Linux core
> memory management which makes stuff like that impossible.

Sure we'll need to be careful to not repeat seqno_fence.

Synx can be used standalone without the optional dma-fence interop.
It could have the properties of memory fences and need not satisfy the
dma-fence contracts. Here remote-to-remote signalling doesn't wake-up
the CPU.

But we have use cases with synchronization points in the synx and dma-fence
ecosystem for which we could provide synx<->dma-fence interop support
"conditionally" while meeting the dma-fence contracts. What we would
like to keep on the table is a narrower class

(1) condition to assure point-to-point signal completion : remoteproc's pat=
h
to signal must not depend on Linux memory management i.e. every buffer the
remote touches in order to reach the signal is committed before the fence i=
s
published, with no on-demand faulting and no allocation from a Linux manage=
d
pool. Wherever this does not hold, the handle must not carry a dma_fence.
This condition is what makes the amdgpu user-queue fence driver
(97ff19462539) legal: the memory firmware writes into a pinned kernel
BO allocated once at init.

(2) the condition wants to be enforced in code so that reviewer and
lockdep can check. We would make it a per-remoteproc capability and
refuse to attach a dma_fence to a handle from a remote that does not
declare it. This is how Xe refuses out-fences backed by dma-fence
for a long-running VM. Composition would follow the same rule: a merged
handle is dma_fence-capable only if every constituent is.

(3) on top of the point-to-point signal, the remoteproc's Linux driver
has the obligation to complete the dma-fence within a reasonable time.
Interop fences can't avoid CPU wake-up but standalone synx handles can.
Interop fences benefit from the low latency in point-to-point signalling.

(4) to handle remote hangs that aren't related to memory, we need a
watchdog armed at the dma-fence initialization which upon bite prevents
further submission and triggers remoteproc recovery.

Please let me know the issues in the model above.

And to extend beyond the above conditions, the following proposal
from you (which hit a deadend) seems very relevant.
"Tackling the indefinite/user DMA fence problem"
(20220502163722.3957-1-christian.koenig@amd.com)
Were/Are there any efforts to resolve the challenges that are open in
this thread?

> What you can do is to do this in userspace with DMA-buf and user
> space fences, signaling points etc... Take a look at how user space
> waits in XE work, how eventfd works and ROCm events work for an
> overview and maybe some starting ideas.
>
> We could certainly build a framework around that, especially
> eventfd sounds like a common ground to most drivers already, but
> please stay away from dma_fences when you want to do something like
> that.

These pointers are helpful and we can start looking into these.
We could keep the dma-fence interop discussion open and move ahead in the
standalone and memory fence direction. Will share the high-level design.
Please let me know if you need to focus on anything in particular.

Thanks again,
Pravin Kumar Ravi
