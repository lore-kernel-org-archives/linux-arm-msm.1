Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B13534F49F
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 11:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787743910; cv=none; b=OqBXeJVz1DerhQvdLMeQ/aGZQljkZve1/jAVCGUs9A8WVuUuUbAm9J3Wq1/+NQU7E66RfOpo19DvyOL/DyP1wbcZBAbfSWwF+vvwH0TrIumtqFLg7Cdz3Awu6wesE01/Bmb2YOIk4Qph5qoti5cDiiAY4uOIVWfEvF4qGywpmy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787743910; c=relaxed/simple;
	bh=GotYFcE9ckPqLfQOMsleQjgOOOmVLhuIdmiHMquZQmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=COHNCzdt3PAWczV5ZKNtArSRhwNHzDmWz7E+xpUqdYT2hOqnRUr26ckkUlQ8l937XTbO+Asc4tLiMUddNdmI712302Np4a7h7cvONR/0yJYTj3ZSG7daKXaPFmk5sXztPtA/wUXWDin7d/YNRY4KYQUzZtOCZT87s7+5jSz41r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gTBzvopi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kVVf6Der; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gTBzvopi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kVVf6Der"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAH1CE517451
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 11:31:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PMZdr9ZNZ2JS5H0snA79gowx
	vmaBiJ6la7EgXhkKjAs=; b=gTBzvopibv7btSFoP/x6gu3EmLPrCsYkRZvCdIb1
	iARyMxiCp+jlb1l6cLDe8VSi4frzFpbxwXeVcK8H7fLKwX1mmDfcyhpQeNANcQtP
	G9J2SmTbIVoD2i13l5f3jZVLXt8MwqlO4QdNwTyYDSKVQtmxE9AJa0u0eBFMbTmN
	EkmUxKQ9EDEt8dVQyWRM3kvaFTpnklJCs6MKhj5F8osjX/5Zr6eZX21iqIqHrolY
	jBpkMM4kXKjQf+tZs0qrdJPt+zcXXeaRKLcRzP0bljia1yn/bawnhcx4ZgiCQ7PN
	9xezXejozCNyTIVGjHva7X0iWfYiP1KSlqsagikgdXhDog==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9x2n0a03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 11:31:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c01ff996dso7985141cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 04:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787743907; x=1788348707; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PMZdr9ZNZ2JS5H0snA79gowxvmaBiJ6la7EgXhkKjAs=;
        b=kVVf6Der28So6XScWpY1JXsfFEjHnlnLeeZEna/Up0/KE+uwsC/pLps6uklmbUqhlx
         AtLCmpNOTJD3lsxZWF3hA0kvQ//Xx7Q8fe/ljJJl2GhbRDsIBsxEpzrkjYx0kUbrUGpO
         bF4hBCkevny/fMgHHd/noARMRWFgcobykneBCbAIIylmuyzf58s+7jyujyLMYctBDO+a
         iM8AMoIxiNSpRBL0pdCXNuAmM597dYdFQfjSq7gApa65ktd+XQs9pWKFDNtz6u++Cc8i
         UeRIM5moEkCT9yRX9/2rtHfTi2pnd3ppN0yzXrPDwzKzeSC7/2CFYyjLmR+I76rrZ35q
         5XuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787743907; x=1788348707;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PMZdr9ZNZ2JS5H0snA79gowxvmaBiJ6la7EgXhkKjAs=;
        b=M/ORb6wAjgKlIq5/skb+UFM4hrgOa8IUl5wEgP8z3rTHNh1gfoprUwR4Y+d2Ideslb
         F6eqVVvft/3MFa/uP0fkvi3Qu1GUDz6Z4qrbr/qsGHhobUVoJ0XCgEhMtu3z4IfE/keS
         u9G28wx8qTgK7oeIHbpbnyygpetwJ00eaOh9+hChVsl57NVIIdmEdhGcA5y4he/bUWZJ
         K5oEUV2X9mBKjhbCY88MUOQHcXe75OMZYCtYhkcaQ6W9EiEhmQQwxcx9ErvV1VEt2ggV
         O2SUmHaBYreH04l0pBOHjHt/RQs00oNwCsTvBH5kwZXrCW0C/Ay5RaqEAcE43/Faosun
         l8MQ==
X-Forwarded-Encrypted: i=1; AHgh+RphrbBKUCzTYP99mBXFKewRqU8lfaro/wSzA88Xz7E1yY3Frx36p9S+IQHJWVwoP0ROPzodhuypyBoX8Hnr@vger.kernel.org
X-Gm-Message-State: AFuF++nDkug4wgFfcI4Q5w/i/L9whegS8VQkvWwrGBU/07SdXIs6RfRI
	yXuLt66aSuMet21e8MkaxbOssgfp3alvSX74waeueHUu58sFSXIHqtze6p6WXZJRe0PV3tcsbNk
	/xmKLeZCjmn8LrUmZD7PMnPUHl4B7rrMNUU2G223aWxA8xlUe7c47YRXwIwGqsIYq3sCO
X-Gm-Gg: AR+sD13gG2LEQtCm7csSwrzLcrCOSPizP1siVWVFEn8rAwP/Pjaop3svCzEsh5lMXp6
	FzYsTiVDuF9NIlp7OMoVaWYvVAa5dmeihL4sPyQmJgq6K2HXwEcVZeWehzzvXzDu91mGuNLsM92
	XN2i8Sx+0bW6/Ho9g+m5kKEbl9ddtmAZ1FlGCw6wZykWC2bU9BVakCgQWEogBempe0HqDiKZ1IQ
	m55JHdRRf2KehWIRhvuXQJGA8mZnL1aRyl2K0+nkwspy/tNarCb7bjIehtEn/2ujVZpJX5CbCip
	BUfbzFZOB/6hE5p1xiqUCk14kPWzg2AhoVR5kdpsh7S2/wNnVAYMzE0z322oOEuyIX0awbIU9KF
	eolT3nGXFv8L8
X-Received: by 2002:a05:622a:c5:b0:51c:f3e:7819 with SMTP id d75a77b69052e-52e423cdb0amr47535431cf.39.1787743907130;
        Wed, 26 Aug 2026 04:31:47 -0700 (PDT)
X-Received: by 2002:a05:622a:c5:b0:51c:f3e:7819 with SMTP id d75a77b69052e-52e423cdb0amr47534531cf.39.1787743906445;
        Wed, 26 Aug 2026 04:31:46 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88af72sm538823666b.36.2026.08.26.04.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:31:45 -0700 (PDT)
Date: Wed, 26 Aug 2026 14:31:44 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: common: Tune clock controller dependency
 on runtime PM framework
Message-ID: <r3nxoo4w56oiyhbs6ysdh3rzfntwwk75m4csktar2hoxdhmfmu@rh4ghbaav4lu>
References: <20260826112021.1455707-1-vladimir.zapolskiy@linaro.org>
 <20260826112021.1455707-2-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826112021.1455707-2-vladimir.zapolskiy@linaro.org>
X-Proofpoint-ORIG-GUID: HbFAX2wa3mW5ti3AM4T-KU2tJy_Hqrn9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5NiBTYWx0ZWRfX+yTQOI1HJn1j
 B9Ed+la/8cl8DMkAiCETeHQOCnrQeA1faUwNdKd7Ysesp7WEYIYqCbJLx5ZKU+g6DONdsn3SY8z
 N1CEa53m5CHKpAE9Pt6h85zTreEVXgc=
X-Proofpoint-GUID: HbFAX2wa3mW5ti3AM4T-KU2tJy_Hqrn9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5NiBTYWx0ZWRfX8Qv288h25P1x
 2RMUQ158M53oJxK3kVpfQwLc5caSpszf/vfo9AUO4hPPkCiKm3eZ/z3Bkv87YHIDrK6rIl7EYWA
 e/O2qpPrz3vKQQlfE+Waq1w6OeO2OTxBF/sWs5jJzx2pOk/qaepLIWgNOqihGXDfpJQh4npZbq+
 OeWB1+gWNDK496UXnTfATmqoPXaryloew7jZSy5sfv5uWOHrGIClJLCpaFH3C0gGEjk27u4kx1v
 pQ8OzOBhCcwOg5YjCUwj6WKN6Pse2PDqQwIVUtAODJShaMUiHUz6Znbc/wkHyOwqd8tehVSPeme
 dn9GheLb6XAJtJ6BBb2xbLYGCSlT6yhrFAfqE/SmvROJh5yGUDngQ7vsLyI1O0axlHb4nGYxF3E
 izI+SYJpdDGZY8aSaugOSrP7vfsir2ISBG9vbKPKi8UWzo8rB/5nZ9z8kgXQGT+5A6Iz/6LOJ6T
 QByYYBQz6qLaXj1Iajw==
X-Authority-Analysis: v=2.4 cv=PPQ/P/qC c=1 sm=1 tr=0 ts=6a8ecea4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=LV-RsBicAcL1o3wcaycA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260096

On 26-08-26 14:20:20, Vladimir Zapolskiy wrote:
> A clock controller driver is expected to be embedded into runtime
> PM framework iff there are specified power domains to supply the clock
> controller. If there is no power domain, then it's a noop to add
> the driver into the runtime PM framework, and if there is a power domain,
> the dependency can be considered using this fact rather than relying on
> a probably stale data from a particular clock controller device driver.
> 

I don't think this is right.

In an ideal world, maybe all controllers would work with runtime PM
enabled just because they have a PD attached. But we are far from that
world for now.

My approach right now is to go one by one for each clock controller and
make sure we don't break anything when we enable runtime PM.

Once scenario I just hit recently was CXPC not happening when you attach
PD to GCC.

So I'd vote against this. But it is up for maintainers.
