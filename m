Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD323EC687
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 11:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787742839; cv=none; b=DO0DfIGhk8h6lH16KgsAXP+3VO6VpjjhT2XXF3x9FRWbF4UgHNaxMKKLcZ1nJaPSDR5lK1NGBlkzJdB87OJczXt+82UElbeaeRHrHpRYoNNU8XZPyjoGqpu4r44xfBdVTT5vG/Cr7zGC707ojJhhjeInJrft55UhS6rTrw+uEH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787742839; c=relaxed/simple;
	bh=0D4oVtstSw8d0d+yjWQn6qWjpCP5lPtPIrP08Eo3RVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fh91IhvVPK7LTYEfRk9YixTzpCyPHkvyQLGJCSbuPUw1zrj252gbfgC9GFrw1rDNdp6FZAKjDaRjIsp7lKHUkoRQiD1HMNQc4VENLDOgHEkBjTzdXlI5DBwDaS1CkhKxhfX4N3f+4LdpgH5JFckUFYfgpjErvyxT8G2RJsfMTgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oaJG160/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=efm1hTjV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oaJG160/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="efm1hTjV"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAH4wh1210823
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 11:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=euIV9JhfpWCNoJWpkOFao7n7
	qZnXDvRXky5kFo/TpCU=; b=oaJG160/ENZlujEiOMs+77L/zH4cPim3JQr+plPo
	8L10+18mbxyfR5SXn6Ux52rMHXpGRDZsO20D54lbxzqBCm9xL+C8KUPXsfRNsOU2
	eTjNuHjR3H+8tcMt/yOKMJ7pm55i2wOJvDtQou8Gur5mvdyXQz4EtJomKKWlVGMO
	WvJNd9nu4Mw+brtyZGn+ipBr1nF+YVSbAWXZA1lFZQftKPdLN83PdbCIFS+YF+5Q
	4weqE9SDD5zgOnJC2wu6r1p01V/eInKGqb83Voq17S1yg5S3NMPt2ghKdqRC64Nf
	QEIFZI8RAs9f8LpouinksHJMYw16rr7pZf7Ke2e8koGmvA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fgxkkrf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 11:13:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0408254aso23885021cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 04:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787742829; x=1788347629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=euIV9JhfpWCNoJWpkOFao7n7qZnXDvRXky5kFo/TpCU=;
        b=efm1hTjVXSZpijzf5VCSmWpbHJq5LhJg6LfUpob41cagpN0fEb6aGOmJDbBl7W7dhZ
         bFZrR8peTh35jgt2lZCzncQk24wIkXCAARxxNa1KHXng/mHXwWUjWFNx2Tvp67V0AUZT
         zBrvb6Clv5wQwQSccumwa1BLqEzvh6ZRtQVtNlCbK80ttASY5zSDVsQkaDWpLBAIbnE9
         OpyFtnAh4Fguyv6XKCZBwu/abVQoxguzghllAZFO9w64Dq1Qz7CSsqAMKVs9sIZ+njGh
         8+2Aa7N9DI/l9mvoz0oICGWUqAWv0QTa9E+L/PtldY7uUTKthKBGl0URR7qTE8MiSzcA
         SFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787742829; x=1788347629;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=euIV9JhfpWCNoJWpkOFao7n7qZnXDvRXky5kFo/TpCU=;
        b=FA0176cKMSK4BPux2zEsatbEbcX4+5Hv6nNT70EDX3j2tP95sAb8+7M7629hYyuWgY
         4CW26GY6U6vfmbExggMZka3mZdIsaFvfVJET+CrSndKa93Pioi6CR18q8WxNJBLDHcNV
         Iyrlny68/cD51FMr0lAr/0/liyDSGRi+IkTf/erJ1ltvr8BrmsZrb8n8D9TtMSouL2n9
         9/cxKEu+Fx5Hmu9qVG0K28ZfsBdToAtBilHqSybjaVjh4+z6iIWQqq4JV4cqDusJwpFs
         7IPmUV/MqNUmh21vemmlm8zE6l8oNsU64bzQfAbzp7W4v4mMeXmZXKl3i8dl3F2CofwQ
         caOg==
X-Forwarded-Encrypted: i=1; AHgh+RpOr8u2wXKWMvGjOfhcm2WwesP3dbfbfTaQKzIXy+VsBQ9mwtdExkdoeeZttAHzHt/faq6xmjMWi1WqwGsa@vger.kernel.org
X-Gm-Message-State: AFuF++ndxl4DfTO8jwwFEKxP7WCrjRX1FsOT5cF25+2kxrPUASCdRAQV
	QvFPuN937khFZDmUO+JTABl0CepLX7ug0qZNzrsug/BQrpQaigFZQ3dU7ESUEmMO6a/5WZD4zaF
	h0mOZxynkgxcvu2NjPSU8GjtNrETKHdmo58NRXCdsLVSp5soBj0UDVm1Mhum/croyBLTo
X-Gm-Gg: AR+sD12xK+GVh0l49k4R5CwcFuMrKLVrY2GL6JPeyAX4hMaJMFEuGwahuKFTrEr6TZ5
	S6vnx49uIZJz3QdH4Hida9TKzjlnJHWcrXoONVXMHrr/rUiarytNG1uF4LebOICAhtzlHU2Wuk2
	joMBschg4baHbG/gWjbtR39bhMLSJ5hZnq8J4jidcUBr2rkKQqYYZ5qa2B24XyDgFjZZjmfiwRn
	cMrNYh/nnUSx7tKlbU+pWSOxTlZBbuVS5B514oAB6zsv4WHdbh71CYErz/fxrIvWUYknfDXYqYp
	G5tf10xZbhaDx+hBLKr4jk3PDK+H+EaCkWtQG9BmuUjJLrw12xsZOASWH5dQvART5paULGL/43s
	MsqUHkugyGl6O
X-Received: by 2002:ac8:5dc7:0:b0:517:146d:2cb5 with SMTP id d75a77b69052e-52e2ed58474mr122045481cf.20.1787742828603;
        Wed, 26 Aug 2026 04:13:48 -0700 (PDT)
X-Received: by 2002:ac8:5dc7:0:b0:517:146d:2cb5 with SMTP id d75a77b69052e-52e2ed58474mr122045101cf.20.1787742828038;
        Wed, 26 Aug 2026 04:13:48 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9b2817sm448707066b.53.2026.08.26.04.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:13:46 -0700 (PDT)
Date: Wed, 26 Aug 2026 14:13:44 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Junjie Cao <junjie.cao@linux.dev>, jesszhan0024@gmail.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        mitltlatltl@gmail.com, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] drm/panel: Add Novatek NT36532 panel driver
Message-ID: <pwpccpcrackei3zuybgog64vhafzkqdgdnp377lygksp4w63nc@6zzxwzttqidl>
References: <20260804073419.84727-1-junjie.cao@linux.dev>
 <20260804074233.85629-1-junjie.cao@linux.dev>
 <b7cf1b71-874d-45ba-8779-0eedc0e21f73@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7cf1b71-874d-45ba-8779-0eedc0e21f73@linaro.org>
X-Authority-Analysis: v=2.4 cv=MqZiLWae c=1 sm=1 tr=0 ts=6a8eca6d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=1JJ5fdCZbPhp8c8Mo1gA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: -mnJwpPHUjNZExuZDv6SnPGhDD2s-Frd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5MyBTYWx0ZWRfX7H4udRn1BQlp
 JMjG7JzCz05LdpQif8uBHfVqzKB4/RBWs+AHV6YefGN6WxkNqCPTnyEvKuTTDjvkodz5tdxi4nR
 kzQscRNLaI+DTLyMkc4f6+U2tK1yyQb4iivBv0GlwRkOnaqZQqca/fsAvm26rVvvlJ4aO8ANBBX
 617ODDK9f5XlpNFEt44Yb2aWDHZt8v6umlCPO20Mxbx7oG67UO3omm9pmmOfjopp5ILQOv3H60t
 sK3GiDMur6NI3MoVIdLU4AVZe3KjHRsK64TkC5W0VcQ4rnt5Ql/KYg4D6Q3RpnMb+ldLImHKl96
 A7QHLMJMlcG7L4AnqiLRqWx3/fjki3P4XwConlGf1kaJS66PgtSomSKUiRWELVa9Aw+Z9RzxiPc
 C+khSmcEzLyA1LAuafaCK/YiVq7vgBmJH7q2TNYvjKFErtP9GYMF2pKMW8GidHpyp7hRuWkOWt2
 fIqtPUxnAeJT/Y25oWw==
X-Proofpoint-GUID: -mnJwpPHUjNZExuZDv6SnPGhDD2s-Frd
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5MyBTYWx0ZWRfX/nBnqHC5Ongs
 Wa30hYE3kT8aI58scVzA92PO9WEIRFS9i4qDHVm6Zzd404RhnZ7B2iBLxBkWNfbulo6OgLVD9un
 /HUZESoWIjg8mmmneoAMObA2aBUtBOU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260093

On 26-08-26 12:00:46, neil.armstrong@linaro.org wrote:
> On 8/4/26 09:42, Junjie Cao wrote:
> > Add a driver for panels using the Novatek NT36532 Display Driver IC,
> > including support for the CSOT PPC100HB1-1, found in the OnePlus Pad 2
> > tablets.
> > 
> > It has been tested on the OnePlus Pad 2: the panel comes up in its native
> > 3000x2120 mode at 120Hz over dual-DSI in bonded mode with DSC, and
> > displays a stable image.
> > 
> > Signed-off-by: Junjie Cao <junjie.cao@linux.dev>

[...]

> > +
> > +static struct mipi_dsi_driver nt36532_driver = {
> > +	.probe = nt36532_probe,
> > +	.driver = {
> > +		.name = "panel-novatek-nt36532",
> > +		.of_match_table = nt36532_of_match,
> > +	},
> > +};
> > +module_mipi_dsi_driver(nt36532_driver);
> > +
> > +MODULE_AUTHOR("Junjie Cao <junjie.cao@linux.dev>");
> > +MODULE_DESCRIPTION("DRM driver for Novatek NT36532 based MIPI DSI panels");
> > +MODULE_LICENSE("GPL");
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Please trim your replies.

Scrolling all the way down for an R-b tag is not fun. :-)
