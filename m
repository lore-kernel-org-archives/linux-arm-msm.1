Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE6A39185E
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 03:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786679713; cv=none; b=maPjbUdGRorQbMhPBlKjTU3NbomKi1Ccxd/hVQ7kng4gBuuwjCy0yxmh4c/pk0uLwB55Pq3S6H7crgalU4lnazhKYtM8RLbX/+CWJbwRaz0nS+tFZd+FMlEg7DaWuuM93GRBNSaTVGUpy10ldCVVxXOuuPiLLC7yaPuV+qooiMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786679713; c=relaxed/simple;
	bh=o4ccvS06V2MhTeY331ntvlGHTRj2o8ia2jNaCP4OBzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=omNRY482eJrlp1eJtdnSAk86gmNw7j7R8FYVNKlWOCDlhJZHp+OhaO7w6VAwRel36jJArVWI6tPSTji6772iJWscjRb6isNjvBfWIDFxed9vsMEyyROhcTWoRETcTClnYBAzNxqwHlDUSJGJq3xElPxAPq9v6+eJ4nhPrSWnuBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m2+DFHMu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VcvmGz6T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m2+DFHMu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VcvmGz6T"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E193Ek1319177
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 03:55:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yPIzUBfzGTz6jZ+0zEOwyurU
	D5i0511kS2C5l61RL/U=; b=m2+DFHMuVs2QMuQEjm/vYW2BNWgJdRRYtN2tsljI
	3cXb7jqm4YPmyIxzhNBuvUJz2gq2rRbn2zkTwOPDT4kJwRNknRu2vlfgNUpNXJQP
	FNXmRVGImhf/tQp+6E4vLzQhKcgTYZ4KQIcaIcVFEqpm4Boa6d0eEPU986+bl98Z
	xljXnmTGBa9RdZz0B3dl16YzPZlITSz9Rr/n4vtV8y1spDKvnymzLzLiub0KKwvi
	a8Ys5yHpEC6JK3GyCQRZXVjnd2L68wtI+Rg6DWFrQQ8sy5T8WO9am8lB09mvn1Ow
	JIs+9qLpJMcnL/6+VzFAIwwOR/AJfiOXlR2CXs2msj0DyQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1j2nj41g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 03:55:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccb6823efcso6388965ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 20:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786679711; x=1787284511; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yPIzUBfzGTz6jZ+0zEOwyurUD5i0511kS2C5l61RL/U=;
        b=VcvmGz6Tn3S4Fsh2oZ2rQoecl8UAIOVx9JSeFZaQqNwHPptt6QviwlURn9WZx6lDc7
         7NZUyG7gCerf0Zg5J6aGGiF380lUxZYxlNmngO5P+PDozlcmDe0G/2p2EpGTA1n24c2y
         gQdTTZuZXFPmSnf8CnlmSJvTIU14+Ono4yx9wf/bOVdEBz2SBG5Rt1akhW5kL3+y/8gs
         /mNV9C5W1iTqoVwYQ4cV6h5khwiAhWQ1ajmM4CZvOa2Z1hN3jN0xFjOYBJh+w+AM/1j0
         ZSwrtC6Oem0ao3ZBbu0vQG+4PlkLSLpaGP8zsaJeefgJ/DOrZ93pxxrYrSxMsd5mbBrY
         jfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786679711; x=1787284511;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yPIzUBfzGTz6jZ+0zEOwyurUD5i0511kS2C5l61RL/U=;
        b=ceqmpJaw08Mr5S/9G1EATewUiis8rweWAF4gZGk/ynBxhZSdfgKj4P14W4VqzFmNhy
         VqWaaZXRSYAnGlOGIXpyTmc61s5oIiztiC+5QPT4NA83uH8K8nhp0bBJNB785E8Wt55x
         n957vp8uL98rS5B6xTLWp2fZK9kOedeFxVHoKXojZ10scv7QL0WShSpGYBalupUNr+mD
         1GtS+/COThVkik7fpn8jfsDBgnWXvfrpxeq1ubXxGg6R3nv1OUiaIjQtO9uIh/6aJnkJ
         umU30tsWJimcgwrTc6LphEFvrk7R67qQg8EYn+u/UPgwj0cDq+QofESEqH3NW+GLfFlZ
         q1PA==
X-Forwarded-Encrypted: i=1; AHgh+RpXBtR9BAlZqmrhstldeY58RSSn/nTM7i8M2y8bALKOynTp/hivy/nfBFzHEfQuJMsweCzbXjW0Urh26vdg@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9a2XkM5U+4JKdtIKEvhS6Y3bfaLcfivEAJFzwytOIDwYfYDzP
	S8eZS+Kypfks/seJU0cgoiUKQSFp3ImyZNAg7+lHkQMD/DMJgtWse0kQ3uvmKNWnHg7yJsitdPQ
	bAqx+3hGjIJVdPGJ3JM8bZv2hJNVqV/lnvS5AkrJTwmAt2nFoPxDN8xwGe9HSjGbFvCue
X-Gm-Gg: AR+sD10YIx5hDfsAw03aXLlLwX+LdPsVR2IkVM7zjK1NLzSfrFnQTAyxE+MITEexC7n
	lT+Y54cN4YumALY++qCyvFHO0K541FOpBV/q/06xB6b5SM2JMO1fZoOnBUMkjvxN+w0MHkGK/rw
	neRjoygnY0D9lee7iU+QSpVLgxtU9mLfmKY63UGGENI5JcQgMu40SODNWFfPxjThTR4k2iSOobK
	xxDClSOdZWJSblwZSf1wIiWAS1QIFgCDdcMV9Nng7xHg3B44zeHVMkhOWYP37qoczyLsptyKv/h
	CbHC7VdBLJJ+vEX8so8JvbMbShRKw9rFeHCltSAjOnta678OrELh4lzrGMCerYeiu/QnW037GLN
	PmYz9PM3tT4ptH9GAssn0yD5WvCCBa/BZ3iy2DsZY0DAhIrc=
X-Received: by 2002:a17:902:f786:b0:2cf:a108:7605 with SMTP id d9443c01a7336-2d3b0eec68fmr33027675ad.11.1786679710578;
        Thu, 13 Aug 2026 20:55:10 -0700 (PDT)
X-Received: by 2002:a17:902:f786:b0:2cf:a108:7605 with SMTP id d9443c01a7336-2d3b0eec68fmr33027225ad.11.1786679710060;
        Thu, 13 Aug 2026 20:55:10 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc39de5sm13076707eec.22.2026.08.13.20.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 20:55:09 -0700 (PDT)
Date: Thu, 13 Aug 2026 20:55:07 -0700
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
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: qcom: Move x1e80100 TCSR to
 own binding
Message-ID: <an6Rm1Mkpo0cHfgc@hu-qianyu-lv.qualcomm.com>
References: <20260812-hamoa_tcsr_qref_0812-v3-0-dc7627169c6d@oss.qualcomm.com>
 <20260812-hamoa_tcsr_qref_0812-v3-1-dc7627169c6d@oss.qualcomm.com>
 <20260812-lively-determined-loon-31f65e@quoll>
 <an1qXeZoTdzrXqVx@hu-qianyu-lv.qualcomm.com>
 <323c7e9b-0ee4-42e8-bd15-b64c61723130@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <323c7e9b-0ee4-42e8-bd15-b64c61723130@kernel.org>
X-Authority-Analysis: v=2.4 cv=ApXeGu9P c=1 sm=1 tr=0 ts=6a7e919f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Ze9qwfLbtIFlt0bMIQkA:9 a=CjuIK1q_8ugA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: sBBKbkJBYRvQ-KWI8BGr6K9i8sIrBL-r
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDAyOCBTYWx0ZWRfX6WMZ6MwL003y
 kNLaIc5enX/EqT+YGPnoNB6/06wJuYO7AfQknnzO3jOpVrL0fu8BH7jMpKyA1pyTKnYcGPOkoh/
 A1I+NgGkEl84FtOVRSVVc7AaHwD7X6A=
X-Proofpoint-GUID: sBBKbkJBYRvQ-KWI8BGr6K9i8sIrBL-r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDAyOCBTYWx0ZWRfX22aGXpOaiskF
 j4dFVKwHPYQjPHH5RQw43FkpAvbeshiDRA0rkF3dLXk+0pm6VPaNEDGdaSedTMvC+yzqNbOPlYf
 o5mDXzompq7rrLipoXwqztH2EHCbRzxKxv2UaVZJNB/o9OheZNDWaYvJgKj1okKEVtmNnogs6P8
 56+b8m6a8HXY+Xbw/T3o+Ei/UHfFnjAlELgfNwdMQVZ8GbIMFMEaXlaynxzOl8g7FSI6xP1EdKy
 r/GTNJPliy3pYSBqvSnLcTAn0u2ITCil0PmXE5W2WWVQX/IDTesZckVrhuis9mP9Z8uEETA4+DO
 aEya0nqw+m5klhhfd0EV/n/13ZvU6fxa3vFawG14jW6qP6iCOE6Y8RAC5sVU9knAgDFdp1WG1v0
 9MXlIH2glwBSqmjYunEZ6RIgT6FGkmSw6TYcBqTKJScZ37pCUJirBSnqVDkvpmSKopAwe+Al6md
 LwkhX6qJvCA0hDe/zfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140028

On Thu, Aug 13, 2026 at 09:38:36AM +0200, Krzysztof Kozlowski wrote:
> On 13/08/2026 08:55, Qiang Yu wrote:
> >>> +required:
> >>> +  - compatible
> >>> +  - clocks
> >>> +  - '#clock-cells'
> >>> +  - '#reset-cells'
> >>
> >> This is unexplained ABI change. When you are asked, you need to address
> >> feedback from LLM, not blindly implement it without checking its
> >> validity.
> >>
> > After adding these two properties to the required list, I ran a dtb
> > check and saw no related errors or warnings. But I overlooked one
> > thing: my dtb check was against the current tree only. This change
> > could make dtb checks fail for historical TCSR DT nodes that did not
> > have these two properties. So to be safe, I don't think they should be
> > added to the required list.
> 
> Did you change the driver code to fail when DTS is not having these?

No, the driver logic is unchanged.

For #clock-cells: I did not add any failure path, but a missing
#clock-cells already makes consumers fail to get their clocks --
of_parse_phandle_with_args() returns -EINVAL when the provider lacks
the cells property, so of_clk_get() fails. This is enforced by the OF
core, not by this driver.

For #reset-cells: the TCSR does not provide any reset and no consumer
gets a reset from it, so there is nothing that would fail.

- Qiang Yu
