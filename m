Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795531794;
	b=DM90rMZHOjQODfu9lNh7gg7n+nFxV3AXsL/pX7xrqy8EUMVal/kufzBVKKW4EVzjEt34
	 qzDGtVbppCm/FIgvwx9Hbu5rAYn5U25X0b/VLYYr0NVKQiAKGYDTQ26tAzEmexQqwsIR+
	 DdqoMvTOmM0nBKa1TWVT+Kz4UZRJ/TLtFvBmSbRr1ppv6svCJaE9/Oq3YRyQCuI5a6bxb
	 7nURm1z8Zfc3cikrUvJAnRx5976kpX48vGv9m3Y62EUf4WIMFo1iSxblv/sLowWXgJ30s
	 EMASdVq6kFTTIk7poCiTCdiv6crChdoecjA2g/diV03amMBDCzeg8/6iInkQVU9EWAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795531794;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PGrzHmWAgrXCB3C620jp6z1AC30bEbgyxfWHGuCVEtU=;
	b=fD8Wd4uJzwDr7XFpecrSNYASPVl4GGi7x8B+pRw8WgvKqYtNy2TdRiHs6MNPqUPohEIs
	 zuMkTw0Irrj9Mm3vO4ab/npyghQgr0yWUf6NWlGtXIwv9tw2DSfPaoiy8+NOejD1s/5JF
	 mQWg0Dqx939AGdxx+EYCiB0LZku7n0P1qE4WLRqgzn1yTbT+/vLYEkVmTiXPmiYk+y4El
	 Pyx3/VgTGDqfGSzCDohfHY/djmnNz8+iNKfkwa54kbKhzbBDT/FmHGWf7WmXVnhwndOkX
	 hTkDt+wNO655KxMsepWCX5nT9J0+1p3LIRzBMKL/jRGVF8A+dPzCoNL59s99FpP1ZYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aYlU1j1z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XILWpK0p;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E925B606A321
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 14:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E925B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aYlU1j1z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XILWpK0p
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOEbqLX4027583
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 14:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PGrzHmWAgrXCB3C620jp6z1A
	C30bEbgyxfWHGuCVEtU=; b=aYlU1j1zcGa2EtTfI7LsJbCJrrS3ZN4Ee+kMv8zR
	h/Ig1saVVm33mw8dLJ+cLCHBUQxC93D80Zy17XXvv9O0fsF6XcRr8gc+my5FFGux
	6sP2oRKkJ6Ny9HN/t5d/v4BfBjHqZ3FN5/YmjT/vmhWRXR/0S8feEKI/zuXoQvf6
	Mc8BBK/QdEZ0E9dQSng8jAj41s3f3bKA+wn+GISylalh7oYbnUHIVQUkOnznZrm0
	F0iK7A4F8+mETVQ2C3GKGmF2ww0wUyRa+71gaS2apvHBSCz6AUTVxwKltiMDy8Is
	vzVgDnGpHr4HYbSfQhulH/7T9RZlS1zYlDjzJG9i2TLpFQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rha9n9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 14:49:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f37c94ceeso933416785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 06:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795531792; x=1796136592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PGrzHmWAgrXCB3C620jp6z1AC30bEbgyxfWHGuCVEtU=;
        b=XILWpK0pU2tbsp6oHgGUMXLhtjb5vGSgtN2w7GuEXSRJrkfi73xN+NjMwhuggnA+tL
         sOcLIQegMjaivw9vWCsHsGZ7zmufoBi9rQgiFQobPSaEUHi8AM0/pkGdYO+HfLT0Ck5K
         m9ezrxinRf5yE8Tz0KGjOfcAQRPz7ON/ytA6adND735QPvmf8DZUJfZ2C3n9WjlvS5jP
         0DCD6Duwp9znS1tFGm9neHBqqAnvTePuPP5G1DETmJAIlBJTdnpFwiKhmV7hlp8zyOV6
         iPmRnmwqcT983TL/SK/tiDH0rR3Rarq8+qCQsyOy+S+IEeJLYXxxqDKEWPFjtOBCXSc8
         8JKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795531792; x=1796136592;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PGrzHmWAgrXCB3C620jp6z1AC30bEbgyxfWHGuCVEtU=;
        b=eKhXKY4bnnLOZ+DH5tHV4RdvGK6iiN2QGvdVTr7eibZQnqBehKMHlyT7ih7UhHIozy
         Yzu9jc/eqInTayvuRGkWoR5WlYRa5GO/b+T89X/gDtfkGPRS5tZ3OpkbD+2YeKhelz5j
         JNQHDwSD6xFNhmufkhbtsiWuE2EkeRlBGpBXXXL25W8o/yS4qWnoQ9fIfqa9SxwUqUZw
         hJkiSeKfIEI4jGi7Oj9ty5z6Qk0n69x6JF66BV7jd4NNaQddx58HWiZNL9kXV5HekAn+
         Un9Peqy2z+bPtx5EmdxzzbCrl4VU5TcsaP/W6q8SQfR375eiuJfA9fui2Hnpkf+xvcgD
         MTqw==
X-Forwarded-Encrypted: i=1; AL+hErGhRUac6/ElXvcHQkm5iBdRuqcRuwy9lenYKIP2ezrYBu68FECfWUqhnGYo3Mk3B+xCVBJH/iiGTnSs8O7/@vger.kernel.org
X-Gm-Message-State: APuU4Z90QKID79UTch9PrJb8UiB1m0nknbTlp8lFAb6XqkWYUJC0rvKD
	MNjoOYW3/ImY4/Wttj1IpLwqhngMhKF6+H8PZmk4jaiTy5lYWXZbs0z8R3GKUhUM5/rEPiWTzZ2
	lulOBWzstgvVT4s1T2AjoY7Vd69dklBTtGdo/MmsLpk+Didvkv9HG9ySJ2PNrb0yLt4c3
X-Gm-Gg: AZFdTZeVVFE1lKRBXxPoufnHIyCqawrFdysD/DIeuRA/iDKY/23F+NdASoVHr2bH/W7
	dlHYa51PeeOVt3nsbIdyiezaOqQtEYwgBFaTTgEs3rVJNiEp2jHE7YFPn+gtGXwT2JIxFphDwZi
	b3+XqCG5VlMQSiksOrvfPEZXRdRb5Y++k3iEql5Dy2WD63J4M2EzJHQwEgq68zMnRuSWXtlXXNf
	MB7Cc8AdAB8yp75l7X/bBV8X5nSL8TapP/ORNFyAvQ0H5hhtEzQ1c2X72YgyGF7xSw5Na6+nQGA
	YGowIFCPv8bQjd9fI6ocyT78lIxsbTIHagjMIuH+mu6wHXAPva23qHFFlW8nA+zoYu2WDKuhu45
	x17Cpb2QnUBuUJ4TwaTQK+82HdSqNP4BAQ6VoIgjWRR4gsORW8eWV7813IyVVUf99
X-Received: by 2002:a05:620a:130d:b0:93f:231:9ff with SMTP id af79cd13be357-949b35ff0c0mr2637253185a.27.1795531792059;
        Tue, 24 Nov 2026 06:49:52 -0800 (PST)
X-Received: by 2002:a05:620a:130d:b0:93f:231:9ff with SMTP id af79cd13be357-949b35ff0c0mr2637248885a.27.1795531791484;
        Tue, 24 Nov 2026 06:49:51 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm228040425e9.0.2026.11.24.06.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:49:50 -0800 (PST)
Date: Tue, 24 Nov 2026 16:49:48 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] clk: qcom: gcc-sc8280xp: Keep USB4 uC memory powered
Message-ID: <l4wgcaciznjow767rluh43dvinr66xgouc6kzbs6rvqu2nzeqr@qoebva5eeudy>
References: <20261124-topic-8280_usb4_clks-v1-0-be083a711eb4@oss.qualcomm.com>
 <20261124-topic-8280_usb4_clks-v1-3-be083a711eb4@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124-topic-8280_usb4_clks-v1-3-be083a711eb4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=BKkmP1QG c=1 sm=1 tr=0 ts=6b05a411 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Qx1CT2emN0pV8My1H3wA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NyBTYWx0ZWRfX8rRzu1ooCLv5
 Id4FtRD75ywdFpvp/4GVlm3fDcdFy0iRGV0DCD1rq1ddPUN8sX1q7cGQvBUbmLBrTvRUTED04dE
 m6ae8bLmuUcou7NhlGbcG+Bb9eaqqTw=
X-Proofpoint-GUID: vKfsoM-qA-DzV70zK4AgC-RdzocPrHFk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NyBTYWx0ZWRfX7Y+YSS8+dlkY
 k40s9n1C3b2Fzw44m12+TMYf3DH0Pd0u9/XKWWvkfZnIKmXRi4DK7mJgQngnkdGVEjr/9apUwXL
 BFXRoqN6EpuPi33LCHG9P35lFgcEpphyfORkWULg27OaqkZUgyvBmnysl/pwtv7f85JTeOGyqbn
 Sx5zWt2xD+bRH5xF6U2Lam5JGDEaCdS5tc9vTaRKGTeCqj4UMlWuQMaj9SW/Kb6mEJRzj0/L84o
 BHhySgteotJOCC+Fo7ENDV2i9kXMSYqShrlXaGBgaFCFhC6zPPONmX4//g+jsn1XglPMFZbDLOP
 8RFuqOE0qeFIKRfoz9IT4nNV5eZWGTfUlP9jupJRXtNoJZHZUmyQtmcEkXRc8MZZ8tlvg7JfJsI
 mxe4YVHgIW+1NsVf+UafSfy0s09/oUScFv/N6GjFB4a1sOfc0sCPdhhJFvoFwdK2W10V3dpvAbI
 zE51mNj8UOJc2/jghEg==
X-Proofpoint-ORIG-GUID: vKfsoM-qA-DzV70zK4AgC-RdzocPrHFk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240057

On 26-11-24 14:30:18, Konrad Dybcio wrote:
> On SC8280XP, the USB4 uC's RAM contents may not be retained correctly
> by default. Set the corresponding signals to force it.
> 
> Fixes: d65d005f9a6c ("clk: qcom: add sc8280xp GCC driver")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
