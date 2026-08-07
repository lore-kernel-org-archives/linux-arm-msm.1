Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED593D646E
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 09:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786095617; cv=none; b=SffxMOjKXs1UpxfrMU2a9TdFCUgnAS+vP3FGcrnmvAI7DpVwvS6VclgdYPeff/TfyJX2OTlqdWV0DTHM1BVXkId59h1yFQSTfIGBy4v57buVXSzQrZcGOGxNmPyZgMSt3bLuNR3Tg0+MQUe6IQMTzQ/pnED7Mn6hGd5u7MADQ4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786095617; c=relaxed/simple;
	bh=jHjE0fv6zFeXLSeP0ciuZ6zHV8wXDQFqjkZLZqhT2R4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EHr5vXVac9Uk0aaNKJeTPxgoJZsVp/4BPr1WeXXo4VTAinMz2TLSoJ8jbmirw6FBFfJ5IDKr9kMLU+G60mAveRdnkOlmiSH6UZ8qfWlf+sLqWNbbVurWEpnVnBtOc3imhdVuuSjYvVo+VtvKB0Dojps2Wae/ssCLXOTOwqIHSO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a0kWnM21; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OcqR9Wro; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a0kWnM21";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OcqR9Wro"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777iQkX3533333
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 09:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QUy93ZzZ1r7ECGsel26PzCavsKQDhoSI+BvI0PuXz8Q=; b=a0kWnM21jkfBu19M
	AVT7GVsBzX9TjGg/PD8VotnCtOy3qyc33SaUnryeZtPSq16Q6Jw0LAwnQ6QU/bi0
	CC61zRikVcdnQFHSdlNbYYLiFGYwvvwBb65BpdvET9+nv5IQW5iDiMAhr4//cdro
	eEqbarsdlqchY8RSGOvV5KCJLGKicmGvo7caajTK29vs5Wch6HZsdfMjGoccu9fi
	Pp/cV86qfmkIJoMhrG5WO3XakjSxEDQVVoM3FtJq3jwKQXWUHWHy96mqm+Z7Y71k
	p8UtJpbuv++qub4sxKR8gdmYpNY4q5mQ6s01J626aIRrvof4oqlW9wgNs41/Aiox
	toZzqQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6fucg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 09:40:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52b4f6ac06aso50380881cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 02:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786095612; x=1786700412; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QUy93ZzZ1r7ECGsel26PzCavsKQDhoSI+BvI0PuXz8Q=;
        b=OcqR9WromtxlhIm3LR88W/vRoU250S3WGFtVC3ssx46+e1vQIGWthRxo+RKGO9HMKo
         qhA21tsd7Sxi21BWfyBw69zwcmkXJBDPj3d0Z8WgM0i+AMiY9CzknyDxfjvb97s7tyOD
         NHa4ko3cE9J/v52cW5OrNYBSu6R1QLvoeYXCdQi8sPy3KITvo3kDqahOQrirRSyJCzAO
         id9zDbPFyUYjuj4UXzu6Mvqv9HL87/ytNOxHRBVeNiD2QsLpHQqfAi1+KwsZwZNDCXS5
         WFlB3JaY3wyP54Ny+bdhpuL7r3ew/trnbH81+gAMA9YjA1USieMJA/HoGHCUa21NClxN
         Jtxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786095612; x=1786700412;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QUy93ZzZ1r7ECGsel26PzCavsKQDhoSI+BvI0PuXz8Q=;
        b=A8sRsskmlZhIjVxHlOlafLJa3orInzqr+V+zGUNgyc5M8LBsaz0Rx19wS+tJDC2pe1
         UHWabzt2ulGmqNUxmdVxq3qxaEP3kurN3Irx9Dm62MkNrF1c8sCNTxNYOT940DzZGt69
         i3S/oEVyjCvYFbvvwotbJnXdDy/0MAB4P9jTynTsGU3x5wEDtWnI3PxccjDE91yKIyao
         fSjkBQ1Tm4VroMypGWWPXcrrW47ZfOakpDKXrBEdbgD0kg4a1Z5O/R/nVNpYMaI9d7PL
         6JAwjwP/7T8HRTCFGw+Ce9dw39j8y9binj0uPta06MMuPE2N8htd3CTCWGkIIflMPdQ4
         L0Yg==
X-Forwarded-Encrypted: i=1; AHgh+Rq392YNZK+lKgYZPUH7cdOFrCJf+jyEYHnLHMrXgwzS2EaBxbM1hwB2If/FRzL7qNDyS9f4vqP9hI6XdLzR@vger.kernel.org
X-Gm-Message-State: AOJu0YyhNyShynp3himS3b0P4is/ee4QUVcokI0MmboMr6Iy5JG45QdY
	IQJYcGjr9nYdncjH9l6kXpuF6Qnm8tZXD6xfOUdTP9bCjNNKwQu1k3WagkMHz2S20MdtYTFsqDn
	1U39cnyUIIlx4T7evb80n4HT1dycK/ycx/h5S2y1DsfT3OvJ4mZmf3b59Nl28bEgBTL1W
X-Gm-Gg: AR+sD11ijTif51FdXIz7jDWSdqQixGS+fTOeNIhTPxcwTPIivt9zOKpT62BUzROrgWw
	XOMTaFH6h/Sn46Cos4IIKx7jhbz26FNKGdoznpiRDQ3aEQ6wYakFVp0wisEvJZyoJN7gMJVEXak
	ubXZCAdEkcHsaZLKidx/eY5iV+VFARVY7RxukHBsv3oOqfWaV5G//txL+flwisZGe+/Bhd3I+K5
	+odUGC/gUuWDxJvbGOALEWMphxAfz/+xBE/IN8OYFhfQinV1SwVMiLgBIBBsmTZTKx03FD1H67E
	+X/54RAficatuhtipNCInhnl57poL1xdmOE5QiMCusOZsjxq1GWafQjkQde8rkT5Vh1h4Na2e2w
	W0g3o6DeHMhbvYRM3GaANwNRhMZoCNWzlUL3B0gBol/yryDzDZwl3BxXkVthS/XY6lbimK09rkT
	FbBA2nVOxRSJKUxw==
X-Received: by 2002:a05:622a:c83:b0:51c:22c5:daf5 with SMTP id d75a77b69052e-52d0b281f3cmr88517101cf.38.1786095612362;
        Fri, 07 Aug 2026 02:40:12 -0700 (PDT)
X-Received: by 2002:a05:622a:c83:b0:51c:22c5:daf5 with SMTP id d75a77b69052e-52d0b281f3cmr88516781cf.38.1786095611923;
        Fri, 07 Aug 2026 02:40:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fdda9ebbdsm2217531fa.17.2026.08.07.02.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 02:40:10 -0700 (PDT)
Date: Fri, 7 Aug 2026 12:40:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Rahul Samana <rahul.samana@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com, quic_anubhavg@quicinc.com
Subject: Re: [PATCH v2 1/6] dt-bindings: bluetooth: qca: add QCC2072
Message-ID: <2iymaoj6ryayvsyfnrkwf6ldq57lkitoyqrazytxh7wxnpeoeo@vg6q35cua2oy>
References: <c1875dd6-fe3a-4a69-a6fd-b461c8fba6e4@kernel.org>
 <6d6465bb-47ac-464c-af4e-0ca72325705f@oss.qualcomm.com>
 <8a388310-d3cc-4d02-abb6-0eb98c24cfce@kernel.org>
 <4523441f-498a-4bbd-80f3-97a7a9206c00@oss.qualcomm.com>
 <6e0b9e79-ccd4-4689-9a6b-9b4fc556d5e4@kernel.org>
 <gfhlyvoefcsvtjuxfo75qeham272cc5g2r3npjenzs5esjifiy@ro7dtkpxwizk>
 <8ab6c26f-b648-447c-9fdd-f1424beb44f4@kernel.org>
 <sewfntbhqtj2apfdi4ouan27artvj4lyxqizvinsvzltbofqu2@riuoo3fmczff>
 <768142f0-2638-41f3-a34f-dc80bb99eb7f@kernel.org>
 <5tkajres2vjkt436teaujcqyc3mjqr65rsfvwhjbmlk3fc3gpt@j6ozyfattae3>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5tkajres2vjkt436teaujcqyc3mjqr65rsfvwhjbmlk3fc3gpt@j6ozyfattae3>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA3MiBTYWx0ZWRfXyNGJlFP5YTcV
 V9kQlgPfBGk2i7Wl4JKrkpoq3C1k2wrWnS3HLTHydeZkqlk4l7iPqlvQpimYFdbVu3snk+6qpTn
 JZH1wdD64E9lipA/DuOQ56U3ttU+E99uGab+or+WGbx+TCQV5jXbPoALWGJNcO6rzbcpDymPS6K
 PRNsOyYm5TmjP750mkZNQ5DzSfzjlac9ftGr1seYF3iwQf/Op5hakGTn10SxkxAO9ykQxU7ESro
 tMqvEbAJeDSotQ6ldvmjiu6+TZ8TOjstFnsUqF5ldfD9xZ69FC5kVan7LbXPN6orQx/vY0UE+eu
 8czRbI7vyrpdqBNAUoYi/IN4vDAxs7MBgeO/5TpRz0TrOR5kcbx+syTYZco7JU7KKZF2wwzUbA7
 SMqjjJHbR1gpHppwtWmqzuYGhjazWiK/NN2TdUX1z99lLEFikdEwCRpmDI5UstFrZdlPuQNLxOn
 958aryo0tOPjIr13Zyw==
X-Authority-Analysis: v=2.4 cv=DvhmPm/+ c=1 sm=1 tr=0 ts=6a75a7fc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=OJEdAEo-X711VEBAeTEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: VDnDwvQFaITg-sSvmS9LrxDSytF4alLZ
X-Proofpoint-GUID: VDnDwvQFaITg-sSvmS9LrxDSytF4alLZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA3MiBTYWx0ZWRfX92SlU7HtCDfj
 YRANj5rKM9IswEZtx4SDYzvPOUohDbV6Blq8picRbNDDqZmW6ST5t7oi2o6EHi9M4PnfXIbU2x3
 nxZkw8bqhVjW7e1yT3xzow5lh8kZxRM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070072

On Wed, Aug 05, 2026 at 04:52:15PM +0200, Manivannan Sadhasivam wrote:
> On Wed, Aug 05, 2026 at 04:36:31PM +0200, Krzysztof Kozlowski wrote:
> > On 05/08/2026 16:12, Manivannan Sadhasivam wrote:
> > > On Wed, Aug 05, 2026 at 02:33:51PM +0200, Krzysztof Kozlowski wrote:
> > >> DT is not representation of internal device driver instantiation mechanism.
> > >>
> > > 
> > > Here, the driver is just creating compatible for a real device. What difference
> > > does it make if the BT node was defined statically in the DT vs created
> > > dynamically? Both nodes do represent a real BT device, not driver's own
> > > representation. And by the time the node was created, the device is physically
> > > attached to the system.
> > 
> > What stops this power sequencing drivers, after more driver patches, the
> > best if being part of some bigger series, to add properties like
> > "linux,name-of-driver-to-bind" or whatever other SW properties?
> > 
> > This is what happened in that linked thread:
> > https://lore.kernel.org/all/20260326-pci-m2-e-v7-8-43324a7866e6@oss.qualcomm.com/
> > The driver code is adding children under other nodes (references by
> > graph) and it is nowhere documented. Maybe bindings of these other nodes
> > allow it, maybe not. How do you even validate that?
> > 
> 
> So the concern is validating the properties that get added dynamically and I get
> that. How about inserting an overlay for the BT node instead of creating the
> node on the fly? Like, drivers/misc/lan966x_pci.dtso
> 
> This way, the overlay would be validated against a binding and the driver would
> just be inserting it.
> 
> > So answering your question - yes, there is a difference because:
> > 1. DTS we validate but whatever you add to driver code we do not and we
> > cannot,
> > 2. DTS represents hardware but whatever you do in your driver code
> > represents who knows what (maybe hardware, maybe not, can represent
> > anything)
> > 
> > And if you claim "I add hardware in the driver!", I respond - maybe
> > true, maybe not, but look at this crap:
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=687bfbba5a1cb15cee51519c210141ed1c4b0ec7
> > 
> > Since we DISALLOWED venus-decoder and venus-encoder DT nodes, what did
> > Bryan do? Squeezed via driver code fake disallowed nodes and even gave
> > them compatibles not looking like compatibles, so any regex won't work.
> > 
> > This power sequencing work here has the same problem of sneaking ABI,
> > which I pointed out here:
> > https://lore.kernel.org/all/9cc5af16-d95e-4f10-8b4a-5e29c136079c@kernel.org/
> > 
> > Look at above patch - nothing documents that ABI. The same as Bryan's
> > fake venus-decoder and encore (not only fake but actually rejected). And
> > to avoid ABI-check tools (or incoming tools), this power sequencing code
> > does not even call a "compatible" a "compatible". No, it calls it
> > "driver_data" nicely avoiding detection.
> > 
> > This is terrible practice and I feel like allowing this patch is silent
> > acknowledgment or agreement of such practice.
> > 
> > It's about basic ABI principles - if you have DT ABI, it must be both
> > clear in the drivers code and in DT bindings, instead of obfuscated
> > calling a compatible driver data. If you don't, then this is not DT ABI
> > and you are not allowed to use OF code to instantiate drivers. Use SW
> > nodes or KHO-style whatever else is there.
> > 
> 
> I did propose using SW nodes initially, but then it got changed to

If I remember previous discussions, SW nodes can be used to provide
additional information about the existing devices. They should not be
used for matching.

> OF_DYNAMIC with review from Andy. But honestly, Andy only mentioned 'DT
> Overlay' [1], and I was the one decided to use OF_DYNAMIC.
> 
> - Mani
> 
> [1] https://lore.kernel.org/all/aWSwgRiEkT9unYw9@smile.fi.intel.com
> 
> -- 
> மணிவண்ணன் சதாசிவம்

-- 
With best wishes
Dmitry
