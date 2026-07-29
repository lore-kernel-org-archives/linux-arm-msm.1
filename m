Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A34A43B6F2
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 08:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785312199; cv=none; b=DBvIYy81cLcSe+1Xo+hqSPfQyDHGiJ7qsuzl0TIAPmG80UyIfiIw5G955rEPp4+LjaPzMRV6LVo6DyZdbP/gug8xyvrMWRsXVwklzVOFzXqAVLPdf5bv+D8RQCVCyjM0C6y2p06hUJUC6BO1uwQdWYruui02CS48n1vN7ELdg5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785312199; c=relaxed/simple;
	bh=VIXH/4wp7GDGEjcN/n0qLhwMWfSkC161PQaJIB1mta0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FqzsK4E8gzjq9QSJJtiLQJik6MpFDc8qhx0qvIyfqgTkiq/9aVUabnvzMh9hIi15DjI+XUqK25ddXZqnvvU4Sh2L15j0LamNj6gSBVY53m8w53Ceni1Ig77Ig2GM8ka84QnyGKOEoOrnwlksiGZOly7piZ4ULhayRRVpGvrfhuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DYQ+Wll5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XowlwIL6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DYQ+Wll5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XowlwIL6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7fA6f1372337
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 08:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5lBdzh8bRoeR8HuofUs5c1Q1
	lfWDYRIe765m7EVTOgI=; b=DYQ+Wll5//7/3bfEluNlFT0s8RNE1i2CWf/EqOTF
	JxOoPGqLAWPz4vkAFOPqHavzKLZb7EZBL4fFhjQgzHVDAcwKft7c3gQYWzVAXbQU
	+y/yVbstWDdGviq+ITbmwCVyhl7BXKzIA6MucRYLD1EXzkCvc3lgjQ6mw67sdNk0
	490Oiv4DSDGWs7YUW641jFQeIxEPtEaZf1GNj/n93YGkScmOmDfvA/V32UUI4XUQ
	4b22hk0BRvIU4uz9BIRnstxnsEto+mLX14FaUf+HFDwMIYaB9BiTywPV40iUAh14
	e+P7Umxp2YKlybDralLgO71es+oUTwuu6cB+GoBhzg6kUA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbmm8hjj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 08:03:09 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848474825ffso838512b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 01:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785312188; x=1785916988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5lBdzh8bRoeR8HuofUs5c1Q1lfWDYRIe765m7EVTOgI=;
        b=XowlwIL6TLJ4N9RW2RzfFlPASbqFISOou7A3RTzLatUjL//ATJFKs56DPIVMCBWnzU
         tI+OyeQ1VH6OICH+xXbpFqwwVmA0mPW3+6028jJHKyALXkoG/A0QkkQTJ55FCzjSFWjn
         TKvzDOzYjkeEgd0zVTvhUn2nAN5E32zd1Yc5iRVi6IGBcQXX8bX2KjyLCmr/d+F1t9Ih
         hV/l73dpNzYIC8Q1vqpvSO4Sq4u47XKfTIOaN1vqEyteGDl3Yyn0qctXn+IxwdVsRrXR
         OyqouGibawpwnFcV0gMZvRaQgZI53t8u/d7TuM2RCPIqftZ6UhoMMvqHbdI6atu7lA8a
         l7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785312188; x=1785916988;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5lBdzh8bRoeR8HuofUs5c1Q1lfWDYRIe765m7EVTOgI=;
        b=Em4T6edhM4DeJbE2PjuL1Cs2SrNgOtlq4Lcj9qbQKCOiRxXwHn/G7sFYuypywxyPma
         tQ2nuyor/6pj2gxM4Cuq/XwJXe6Tiqw+AGRszmMKPj9VvpP7Ddar3v7h4NDXES0QCHkz
         HjPBz/Wl5modQnH+Afv0qCH31Mq1dFlPl93Oz6mUMlA91oV6e+wGoUfeuM1w31TMNck0
         givzFq0QDUSohJ/yK1r7nRaOboeiFb5I/hsbeshhokilbeJIMOsvbqrWXN0+oR+b8A7i
         2C9ghY4MCbOnmL5v/uq9wC7GCOI4alx0NsmN41tLQtoj29KdAxgNggNa+pDsbnukvAgp
         4lyQ==
X-Forwarded-Encrypted: i=1; AHgh+RpV1cFlXwpD6uqALKzAmDe76MLeT6RvRVwzmBwdQ2WRqJpwWYcNUbHmlo06Vk8LThbBhWfzo4WNYRp2h2nk@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk1H6s0aDA/8ThFljIwxOWZYwpuJB42Ryxf+Zz8ZI3VbVR5D8t
	3NEnN7j7UcxXS/ZEPDl1BGAYzh0c8W2QWc/09IpR8vwO4r7GM832yoUpmM6CZHoBVglm/fY8C8+
	pESNkOgv9QWDZyygeXRnJmjk6glRBiZGc+TGX2hjnq4e0M+wpn9GD1tR5SLF9V+TVnX4S
X-Gm-Gg: AR+sD11VBujWii8vGTugSdxWsL6KpoyLqpM3+wupBZ+xvYK62d0FyhE2jzJwz8vuUIg
	j5JuQlYIepOqOdRxHx2U9FRYLiopmXrtKP4WU+lsBv1gyE8L1Qd2KjAKJmlelSANhcXbn6oozNu
	ETEi7iovpic9oIf3512/SeRWIF0WXIRkOOUGm8CkuwD6GNRRbzDe3zNnmbhzxGPA72FseCdB8+W
	b8Z6Gz1BU6xiLfdUBoWTSgbEL5w4VRiQKomaxoEv/cOd3e+7cTtqUlttRCe8PN04THxwsy79DGl
	+BMhI/4oDW9OJQC5fjGQ0zPt+w0SwK0NyMkHXOt+zbUyinOTCUaNB8DBtUAwk5tygYsu3o25Eug
	Osx7oo4MlrAAB2A3HWvP758vYepW20TriUcKFXW3VKF66nCc=
X-Received: by 2002:aa7:8c18:0:b0:848:7bcf:9a9a with SMTP id d2e1a72fcca58-84ea7949e47mr1014511b3a.1.1785312188108;
        Wed, 29 Jul 2026 01:03:08 -0700 (PDT)
X-Received: by 2002:aa7:8c18:0:b0:848:7bcf:9a9a with SMTP id d2e1a72fcca58-84ea7949e47mr1014478b3a.1.1785312187664;
        Wed, 29 Jul 2026 01:03:07 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea03d3182sm965815b3a.54.2026.07.29.01.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 01:03:07 -0700 (PDT)
Date: Wed, 29 Jul 2026 01:03:05 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom: Move x1e80100 TCSR to own
 binding
Message-ID: <ammzueQdjCXTOMUH@hu-qianyu-lv.qualcomm.com>
References: <20260714-hamoa_tcsr_qref_0714_2-v1-0-13047922a376@oss.qualcomm.com>
 <20260714-hamoa_tcsr_qref_0714_2-v1-1-13047922a376@oss.qualcomm.com>
 <20260721-tactful-cerulean-shrew-120a9c@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-tactful-cerulean-shrew-120a9c@quoll>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA2NCBTYWx0ZWRfX4oASJsxpGCwv
 Yahtd9eQNKMprGftI5IGapCLwMpFEQGd/TRvq2PZbc9fPcwPUegrsHip1WRRwR84ZiKTi2UXaU6
 l54Ay6Cf6AE6RrCcbrcfz3Vetrlb7dw=
X-Authority-Analysis: v=2.4 cv=L7ktheT8 c=1 sm=1 tr=0 ts=6a69b3bd cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=u6tME7obI1wO0-EO1nUA:9 a=CjuIK1q_8ugA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: et5qq3Nnd3Ev6-mG51u4obrfw-3Ca6tx
X-Proofpoint-ORIG-GUID: et5qq3Nnd3Ev6-mG51u4obrfw-3Ca6tx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA2NCBTYWx0ZWRfX2ZBr5ppvVDeS
 DABtWg8FVxj7tBfn0HBfjd/ZPgsD/sNRQeOmnxCugA1g0x7PguZUOoUq3iodxL9AuE5p0ylEv6Y
 Lm7og2/0lx3T9uvlN1FDSG7kKPGrAP+vqGfocFNwNQlnsactVDUK2lcJhbeLquvuvry5/pjtbbI
 llj8uXGofnaUebb+ltRhNB+NtQnQgNOQY8OApX1xveJ1kLbPHWcVX78BX8UldioxBovA1aEl/eL
 2E9CjAcSRligRb2HkIls4dklvhk0jQux73hpkcWVCxMjs6Ad6JSWykny2HfP+NUZ1HuQCRwzj9+
 JWbxYSPK2CPkXkHAgaJJ2ntX2ClhSR0x3tMYTWXDriihgqoMruMrE9bMELMzhAGTVygSfu4Uukh
 303BzlTU6vKZmkfGVF+8FKCwJjUptJRpjf3wmVQyJytJcCmoucBIthGj64n35NH89UYzdo9ocMp
 gD7Hk8JyH3+QIWIsH3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290064

On Tue, Jul 21, 2026 at 11:52:52AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Jul 14, 2026 at 07:40:41PM -0700, Qiang Yu wrote:
> > +required:
> > +  - compatible
> > +  - clocks
> > +  - vdda-qrefrpt0-0p9-supply
> > +  - vdda-qrefrpt1-0p9-supply
> > +  - vdda-qrefrpt2-0p9-supply
> > +  - vdda-qrefrpt3-0p9-supply
> > +  - vdda-qrefrpt4-0p9-supply
> > +  - vdda-qrefrx0-0p9-supply
> > +  - vdda-qrefrx1-0p9-supply
> > +  - vdda-qrefrx2-0p9-supply
> > +  - vdda-qrefrx3-0p9-supply
> > +  - vdda-qrefrx4-0p9-supply
> > +  - vdda-qreftx0-0p9-supply
> > +  - vdda-qreftx0-1p2-supply
> > +  - vdda-qreftx1-0p9-supply
> > +  - vdda-qreftx1-1p2-supply
> > +  - vdda-refgen0-0p9-supply
> > +  - vdda-refgen0-1p2-supply
> > +  - vdda-refgen2-0p9-supply
> > +  - vdda-refgen2-1p2-supply
> 
> This looks like ABI break without any explanation.

Okay, will add below description in commit msg.

These LDOs are required by QREF to provide a stable reference clock, 
otherwise the USB/PCIe/eDP PHYs cannot work properly.

- Qiang Yu
> The dependency here makes it also non-testable by toolset.
