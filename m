Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699836;
	b=EFfTkfuAKGduDdQXYL0ztGt4aOioYsqqAIdDbfZLx7TjoLDqvLxhZu+MQdFYzZp0iCtK
	 YWZFpfxIwEx8JtlAbGUDxPXshU9z4RsGp9csnJbAEaW8ND2AsPYofYY9YOT3kAioUg4Sg
	 utUnz4Aoa2lTQvtjeHjwS+lvgYxFd++dnieKrg4WKOG6PCJr7kjddUVWwGFXkEWwdBuJ7
	 +k99JVa4jAukQah4GAp3MJsOzBo76xxZ4NF7QR8f0RPRZQ1LGzHLxuZPxThSn6Bm66kBe
	 rnDfxECr9oxRwiQT5EIclMD6bo/r/hnIp/Uj+PMLxvS5riVdZE6Z2a2mA4Xdg3LvkjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699836;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RUu4adMy/np/5W9QC2VHk8T5G7ZIH4XszZOFCwv2tCg=;
	b=NsFTRJ96twNLYkdR8BSCbyeXCF3wdAfOlPBAGjzMuOmOE65/YWYs+9LwtoiHYja8Hnq+
	 OBhzhMt09B9Az20LZBiRvGqGJ/Na7tM6hWCarnooEJl/X5BN7avsEyA7zu/YAfIDDpFNT
	 tcJHkXsWbVdhd2/yryr+56tLP8GvitM9eXtqMGJ7CTAQ9KdggHT0WXQH+B05zGcrjLEPW
	 +vqCkND8XhV94KZMCH61TGR9VQTs3Gj/pzCX7BzvItETomgI6+eR+MIB6oeDQcWN54hGA
	 97oI0w/1QjpfNo8eCe0/d7XnUOnIN8eqbRPKxOTJFdyQKomtmyHegWZz2U3Hcsnst4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QF6KM6m3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WbrnAYnD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18302606C51E
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 09:57:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18302606C51E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QF6KM6m3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WbrnAYnD
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A37omZT1082965
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 09:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RUu4adMy/np/5W9QC2VHk8T5
	G7ZIH4XszZOFCwv2tCg=; b=QF6KM6m3+774BxDUU1jqCPSbTY70tkIHZvdkUNu9
	JG0vw7oMLFZ0DA28G2LztQv+fViXH+2dY1brB/OagRW9DdYdLrdcvXYJjliOm0/T
	mx2pp0WTsCkNq0BT0L5HJu7efdMalYzwuixTQEo0ST9CzeHYnoO14PIuRczJ/u1h
	/lJoKvYPtu8dfTbqMQUAMrgzuGCECGN7dGHvLhmA3vxzwHR9sfKaREQilEY31MUX
	iByGJmPnsVQtcD20HhIplv4VHM0iyOZia316DFArPPftA51BOY3hzdJR+OY4bg7l
	8k+rVvKRMLkasUdRyfYleTyxZb7onEhI3G7Z8R2RDBbLNQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07r3557-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 09:57:15 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91ca3cd6071so91370586d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 01:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699834; x=1794304634; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RUu4adMy/np/5W9QC2VHk8T5G7ZIH4XszZOFCwv2tCg=;
        b=WbrnAYnDYD7k8rJ9j9fJATDeorkOKe+Ep98pedrwYMiB4+9X4wZDdGS1iMYRw84imS
         fk93CgbAyhSkV3kTl/8ZUYwSMjlw3b7dj5/7mhMdzTso7/S8PI1ClomUIZTIbc7C7UXr
         FwY9H9gc2jwF+kzjCn+G0Dli4+JV8CWl0vv9UueLuRUqzfnDNHoKyLw4cKCZBB+HO16Y
         GjAILUTGnCAdRZOSJEobxXWdsdoUYL2in5jlohz4pc3p9pb8czEQLUgoMUOC2iRPEAFX
         38AaXY/dIU9AKETHp6N4ArxZtO9vFGm4xpKHuoePTeIXd/IbvrOhR5ICfKQfP+b/8Ssi
         J02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699834; x=1794304634;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RUu4adMy/np/5W9QC2VHk8T5G7ZIH4XszZOFCwv2tCg=;
        b=vrZEbmKgO6WbkAXbLqqdtD/LqYqviAbvRz9G1bs4/XWYzQkmeaAczpIdpYqj76JhLr
         sxHKWHl4RoRsGDSEwSZEMgfkxWypdtqKILXhzi9dvXyPs8EZU5DezVDHC3Kz6TFRtzFQ
         Chco+iqW8cLwYnRly0dxyVXUqjFyoyxXOw57TS8eos97KK8L1vwbSLw8eTCWefKGHyO1
         KPDCj+Axd9PVDZstZ09E5tZO83FFBUWTZdxnOG5Acw4qQzrVTgb6GVas2fI1KOa01es7
         oa4W+G+EQ3tSSl0v8ELKmm39+DZzYyFOOWH1qgBCnQNZcwHX3Y+pCE+upHzTynWsK2oq
         Rpug==
X-Forwarded-Encrypted: i=1; AKwUvBzzHzjlOtaQ3Yz6b6jMNs60O4s3DcWHzYtp2fqDFSnPjVxhx+Oxmh9Y/fNp2m8rRCO5M74/r6DBBFfI6FYy@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZiEGqonsG1GdyYZQUS8+BLVsDjhfNAmYaosQAsP947xuoBvbp
	G0x1fN8Vp3kNt/dVtvtdlJkJkmca+mhHG5zU583i7zaBfNJePr9fxaesGNkHMog+B7V8ohJospP
	3HvJhaXknBBRXhff0qE4a2bN3sou++++4poRy3RDP5iFKaA8KC4hbUi00+JXqdQIiwZtl
X-Gm-Gg: AYBFou1HHSE8vbjKDxFum4SvKIP+KfXShgfKLtogT+eLtMleBhxg143UeeYrH1wei/w
	lKTSnykHXt4mkdcTYgvyz7GAtgFyEne8bmSi1uS4hHEe4svCwtdSKFFTTl77ShE1qyU1k9rRHDL
	bYY49u6LO/aq3rYb42WpYFMT3QGefi5Q6fk6qrOhvj55aowiAXFWXaqtC3Yc2r6ZCr7H6dd2zsl
	/xFGOqQ9/5uzcUoEQQXLO3e9rLFxcEQ8/QMn9vK/c+XcwIYwG3PLZQxqSbB2ytSvlXqqHTf9nvC
	iGNLctINLV5PTR7rlxO1JFwBN6awPX5JhxjPoeCXs4EdLWN6rBqp5q5VbsqGM0vWlKrQ8bWF7aT
	7U9/LRXyorx1G4FGJdhfFI6j91Tc6AC0hxeJsspPRCJixlWXATEjbsBskdE+3PWg=
X-Received: by 2002:a05:620a:bd3:b0:93e:f9ba:690e with SMTP id af79cd13be357-944215817e4mr1946738285a.3.1793699834167;
        Tue, 03 Nov 2026 01:57:14 -0800 (PST)
X-Received: by 2002:a05:620a:bd3:b0:93e:f9ba:690e with SMTP id af79cd13be357-944215817e4mr1946735185a.3.1793699833543;
        Tue, 03 Nov 2026 01:57:13 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a96fc933sm48333425e9.11.2026.11.03.01.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:57:12 -0800 (PST)
Date: Tue, 3 Nov 2026 11:57:11 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] phy: qcom: qmp-combo: Make v4/v5 targets use the
 right clamp
Message-ID: <ekgjrfx5d2omjboiqkougpyox2vpgj7ybssjxirwrdicnpjxpu@fzwtmff544rq>
References: <20261102-topic-qmp_aon_clamp-v1-0-141c2cb6cdf6@oss.qualcomm.com>
 <20261102-topic-qmp_aon_clamp-v1-2-141c2cb6cdf6@oss.qualcomm.com>
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
In-Reply-To: <20261102-topic-qmp_aon_clamp-v1-2-141c2cb6cdf6@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: D1tBe7mIwa7Y3PiXaeEIMZedAq3jAoFP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX8q3cZ411ynhK
 +d3vtLwfnSLrR1SWSU6qThwFBbVGj0llP9r5QpZGxJXu+7+cc3QBcRxF3OpnpvRmm4ijKHytCPg
 2/0WqPTPMU5aFiI/P9o8J88DZrjGRwUp33G55njOnSUPpavdQQi9rAjQtORcG1ilStRmdQUswbo
 eJ5womVuDSXhcRlm8eYXi3aRmA4My/InBArWA2SBpYZ257kcPPwpwiBHp6CVNoNL42+BK9Nnk1I
 JxbxV7h4TWmF8NJmngP9dwue9CVK83SDyXhrhWF2P0EQ9lYJPiHzB8qCOFqVQaFDbEKvahpPPF3
 nXC36r3hxaFE/3zCnoK7eU7iqZkt/3uaiSpVrqPfWn0Jnf6T7/jztlqb1OFWABr/8pX4DYabYJn
 X1VS44wdR5xAfxpkZbyJR0WcsWE94TmesBzogdnIJfsMzBpMLNrzhGMZ1Ml7pPptdvQVUW0sj3U
 U/uCn8nbimiJx5oxDYw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX9fmswXC8RPS8
 2Hk/WTmNnmcVTYv+T4mSZV6mCGN6fD0MH5/IrpEGfg5Jrl4J1HclkPStAgrbjY0+OiLIDacgQ79
 7M2Uzni+LfQCrH9B/ua8ZbXGN9XAnwY=
X-Proofpoint-GUID: D1tBe7mIwa7Y3PiXaeEIMZedAq3jAoFP
X-Authority-Analysis: v=2.4 cv=NZlzRGD4 c=1 sm=1 tr=0 ts=6ae9affb cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=uguNxjVQdpYhtvE0XFsA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030039

On 26-11-02 14:59:33, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The clamp in PCS_MISC may or may not exist on some of these targets,
> but in any case it's not the right one to assert. Switch over to the
> one the hardware programming guide calls for.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
