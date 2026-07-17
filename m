Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3734C367B74
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 08:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784277743; cv=none; b=q1s9mOLpt1tr7J+vTwbMOLf8gXdu7fy2rVh4rJS3+e3H4dM3H5k31f5U+xuDeM/u+agdHBpiAucvGK2X3VzIlE766Ev1K7Uf+ycNvokPY/BxexGyzNNq9iOafnlSD9NW89/d138GywIGESZ/JLxM+IQ/KBqUVehLSjMt4XcHWRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784277743; c=relaxed/simple;
	bh=Ug5IfIufd/F8tkTog7HZS//RCKPr5VJhuqnbPh/oOpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VzlzTc2LlPg9PohrG7zcTHXqLoa166I6E2RPFa3MKqeIWuW6HR0ZqcLhKIOk+OIzxkYEamNPlqAGVxqzhBVeCVirdJVvfHldSoj/buSjcta6wk/N2YqPW4jd9xW+h7N2xfvyJq7MDNoxJVmSBGLnTY9QQ4jKriAsdEad3s6z/no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eIZHdiNU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=avmWu92p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eIZHdiNU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="avmWu92p"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6ciIW1078396
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 08:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tDAoFsXchHDGsLbGyYQzswa5
	qoUFHTIgk2f6OWlaAgU=; b=eIZHdiNUDtmqDPqlnC7dOjYQmR0Up8wHDOCGLJ0j
	YzKTxWqHJupJAMcNu46AWaJP8muFExEX8KOUcPvYqJYJX1gsBOSbG7qH0/9pC4Ic
	qlXNK2deFdKzJfn/7UMRvFVfDShDRY9KqGtLRYWdJYldXNiO0xKcO96UMBmwRo2I
	M8Btaf/42gkLmcdsYOWUpNZEQbYMfPGxy6+tlJf/Q6pk2NC6wRE7lD5064+se31t
	a9isTctfSyz+TJqBDfQaWZSPOtRb+FVQOwoDXL0BjOMwbmgZvg+YFnYJTdC2xStJ
	HOh+w/XRqkReWwlkeya75k9EVtxRYgSKFtQz1tmFsupLcA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feym1c84m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 08:42:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc86a9ef97so163712165ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 01:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784277739; x=1784882539; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tDAoFsXchHDGsLbGyYQzswa5qoUFHTIgk2f6OWlaAgU=;
        b=avmWu92pKXQLX6kHJlzRyFvc5hA8rLcbvEUPtY2nZ8nRy35yj/6V/NK2AOP6CfrLPL
         X4z9XpVxXZc3/74OXXyaZpAkv4H6yWU0boxGYAUwCYWfhdS2//C1Ucrcz/dlrusU4jeB
         +voS1CI/lHCqUvVNLvnJiyPUh4Ldt5IVx2LyMBBzaN8H6S0DtQYTiDXtD2Jd8ZC+vAfL
         S738/V3Y6tom4PwdX3hUvCU8QgS6yaVquejlS3K+FJml+RutX6/pATKDp2iCRfNqbokx
         eEV0n9YEzqBtQskGnC/Xng75gmYls7wfMIV9AaYk2WjrsgCo2fdb9zg/ZXU5jSSNnG8p
         m7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277739; x=1784882539;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tDAoFsXchHDGsLbGyYQzswa5qoUFHTIgk2f6OWlaAgU=;
        b=bC3PmFZSrfiEz4EurUcU2K7kSDvLOwCJiT9cQ6/zstgTHrgEwIZMxR92dEq7eH9ZNX
         BMnHgljOYD7N0I+br3BsTmkzPKDXnvk0DjzG+ANLmZ0A+hoGkZ1gB+0F7BmCH4EfgI1c
         6T1Ys7gLv7m2hVbfNE+GhTYTU0hSbQ61IqTYT8NlCvnX7Azv/6Uf8UzmjJ8f35+B8pOI
         baV0xWnwVRJIi60qfLry1bbm5wRKuPHz/jWKITWXLtUSyyOpgAwo9zwSflFssS5MoS3v
         VuonQKgNZ0tOg5EGFyFtSMLDIoVgF71CwVuILLa4v6Z/Gw1rVspTlr3oAKNg9UzXqqBH
         9v2g==
X-Forwarded-Encrypted: i=1; AHgh+Rrm+QDRDuhjDjd+S7VEGVOiqFukDpojGoySKxtmvMrs/XiD3lY/5Ineyjof+WJ1SK8QyikfK719VgfmkZEb@vger.kernel.org
X-Gm-Message-State: AOJu0YyXftdUh8EgTJb0PuvxJqcIxj2ykgIz/+sKEGJi9my/E1VHHoYI
	ua2gUcxUCK6TSZD/FF0mA4l7UMhp1c9HhEpzhxNbiHVh+/PIK7NYaNKpd3LDPtiuTIW0jjKiroO
	eExZJSkMWAbVk/Q3A2z7imjGuR0ZNUlKiBh2hpkUwDkUDFKvMacmHouoEvbj4V63GdNfj
X-Gm-Gg: AfdE7cnpTlo9SOvm9FHsEnquFrgI1uN7mzlr0mVaxr9PXDO5+sqxNI8Q0Ql7ErqLmjZ
	MN0XtVN31zy5dFoqMnIbJFme3EXimJaYDzEkGPP3wQ7rW3mBS103yiTsab7dqWMQ12e0csMxLJ8
	sFjwWldn3dFYWYqQ3sj1bQuB8ixJNDafpuySazuprS7BNaw7vv9ti/ghsIm1daPbKRd7u/4Lcio
	wET7TQZrVmH8vP+Ji74HJGtkUjvy2sGddkRZYYHeU0cA86Z5rkNzeNtTPEllHyK/NW124AfQYbB
	s4A4ktmVyvqYhGWK4eZNk7HV0hxy4T7rziqQO0qkBgJ4YVtp2kfA4xoGJ4XEZK0qDQl7SFnCNK6
	yPolKDvRDA0FLldpOmgVltzbsgUG1H+2PP77oaRBnWpQTu1tYLA==
X-Received: by 2002:a05:6a20:9397:b0:3c3:9b44:982d with SMTP id adf61e73a8af0-3c3ad95dcecmr1670304637.42.1784277739067;
        Fri, 17 Jul 2026 01:42:19 -0700 (PDT)
X-Received: by 2002:a05:6a20:9397:b0:3c3:9b44:982d with SMTP id adf61e73a8af0-3c3ad95dcecmr1670275637.42.1784277738498;
        Fri, 17 Jul 2026 01:42:18 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce29c2a48sm2896833c88.2.2026.07.17.01.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:42:16 -0700 (PDT)
Date: Fri, 17 Jul 2026 01:42:14 -0700
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: fix SoCCP memory mappings for
 Glymur
Message-ID: <alnq5tDRRJWbloaS@hu-anancv-lv.qualcomm.com>
References: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
 <20260707-glymur-soccp-v5-2-053993f0c6fe@oss.qualcomm.com>
 <9e0ea6cf-ec91-4017-a14d-a1f7c4921f37@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e0ea6cf-ec91-4017-a14d-a1f7c4921f37@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KPRqylFo c=1 sm=1 tr=0 ts=6a59eaec cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=B7WZNfwjtREewDEN4H0A:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NSBTYWx0ZWRfX1+Zg/LLuLsyb
 0oKGI09CZNqbJ9vPNNtql7wTPVzU7wG2+TcRWHXH+YqQFYWJaTiiMt0ryfQavJrUgGvfuqMQC1W
 RGe6wnKJW+FhcBiU59phSrgaSw8xbVYOAxqmhAm8+63DRM5r2C5QPgIxeP3173lLJcWq0+qWeCe
 1QgeUghRPJleSuLTHLzx6OjuWQJqkMGZNLvQ82ZOCOXGECCJoEnqZfMQTlbOofC79LdnzBAVVTY
 blMQ+KHPnbPjEMBLwFNvZ/IXq923jlgRr4jvYztUj5/RaaMN3mr9pQnlLrlBao32Lj7aHQRz7G/
 VTjigEwO6PnqBD5HYTYPR3GBNIDCIOgYK0FMZrcErx0tO6zply5khXkWcCztKD+mX76DmWg8qwx
 sIIbGc+1wF2jUJCrys6gP9eagz6rhcRusRVZOvvQAwxuAvsSMMdatp7q/eBhl12YPcAiVlifWXU
 a5tIL9FS1MHWm+Le14g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NSBTYWx0ZWRfX/1vEMeock9pQ
 90HHNmg6NRulCY5s0khc2jJwGcGQuhsPfwg/aPg97Vbw5z9yfpe0o4Lw+UNtCxj+CIdBu40kQWr
 g7o24Pl6/v2MTKHK3HRiScQWcHXyUmM=
X-Proofpoint-GUID: YbrLn6YKaGXqAuzC2WQwg9Sr0o3vtH4-
X-Proofpoint-ORIG-GUID: YbrLn6YKaGXqAuzC2WQwg9Sr0o3vtH4-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170085

Hi Konrad,

On Thu, Jul 16, 2026 at 05:16:56PM +0200, Konrad Dybcio wrote:
> On 7/7/26 12:12 PM, Ananthu C V wrote:
> > The currently listed SoCCP and SoCCP DTB reserved memory regions
> > don't align with the memory requested by the SoCCP Firmware. Fix
> > this by updating the SoCCP/SoCCP DTB memory regions to reflect the
> > memory region requirements of the SoCCP firmware, as described in
> > the Glymur v21 memory map release.
> > 
> > Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/glymur.dtsi | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > index 20b49af7298e..9ec7c256b80a 100644
> > --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > @@ -602,13 +602,13 @@ spss_region_mem: spss@88a00000 {
> >  			no-map;
> >  		};
> >  
> > -		soccpdtb_mem: soccpdtb@892e0000 {
> > -			reg = <0x0 0x892e0000 0x0 0x20000>;
> > +		soccp_mem: soccp@88e00000 {
> > +			reg = <0x0 0x88e00000 0x0 0x400000>;
> >  			no-map;
> >  		};
> >  
> > -		soccp_mem: soccp@89300000 {
> > -			reg = <0x0 0x89300000 0x0 0x400000>;
> > +		soccpdtb_mem: soccpdtb@89200000 {
> > +			reg = <0x0 0x89200000 0x0 0x20000>;
> >  			no-map;
> >  		};
> 
> The updated regions point to "SOCCP Boot [DTB]", whereas the old
> regions point to "SOCCP [DTB]". I'm assuming HLOS potentially loading
> FW to the boot regions is fine?

The reason why there are two seperate memory regions for SoCCP is because of
some Hyper-V limitations not allowing HLOS to reuse the memory regions from
pre-HLOS context for SoCCP. This is a windows specific issue. KVM is not
limited by this, so we are able to reuse the same memory regions loaded by
the bootloader in HLOS context as well, and do not require two seperate
memory regions.

> Konrad

Best,
Ananthu
