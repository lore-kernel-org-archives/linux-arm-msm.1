Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461356;
	b=RUW7990SwZQLrog7Bw2mV/eifBYC9NE8q6jNNpsiTZuz4icsH8YcAti3NiTinGbe8h4W
	 Kue20Og6iCIJXVVy03+2guL49b/6a118sOeCEPM9snvoT+dmDIK0E3RS+eRV+J3fPXqxI
	 l/xko3wvJlXy9DlihFyXMW0ATisUKPiBQZZRojsiFY5tGXK/hdTBnOtTfx9QpY6uqMalx
	 WT6ryeMaDbGHrGeoQpega5fgNamBd4HrOU89o5R5FkoPL7R7A7ppflfLsCI/B1Y9fTDGW
	 VVwOS7yBgT3rrS0mVTFyTygpJQeg6DE/v7ClHHRVDyuxJ+LYejSW1BCKwXDyhGZctSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461356;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4xUTH4ApaOmDnbwbT7XFIBWNBS6WN5bAwQQKD0pEIsw=;
	b=IAmOOTUFEePwIYsMZs5t8pZDzf5z+6RCYgZVEJ9CqSbE1s2LW9ugQww91zv32NEFyyh2
	 +QSxk//2vRDZU+2sqylpUtozZb/jZUR9o96IhZ6VvqCeoJigJSdvS01l2f6jgetfn6I/t
	 8wja4TeVWBGDeJWDjxXHaye0pTm2sIfizG966G0IV02g8RT/UAxxFRwN8QJr+jgePxO5g
	 DMS3tAFcW5tvEekWWnFkZgLk8JTuzttS+R6gf1G1wJIjeVubVIeI27tRuzz3aRHeA10MK
	 qvgAyRfFjirDCMKlQtWAUI0CA1P04/S9yjR9rwwJy8VKNc0kY0jpToo+GKntn9lINaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TRApAcTf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MRH6tQJV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A97606A327
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:15:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7A97606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TRApAcTf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MRH6tQJV
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGkCK3025235
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4xUTH4ApaOmDnbwbT7XFIBWN
	BS6WN5bAwQQKD0pEIsw=; b=TRApAcTf4ULfdmdHmn30uMkdi110ZHcLQnJtIbml
	fV5gFGFK6TfcPFZf3IIVKkjVA83ikFh+hxH2Xf4biFgxWMtNHHjlfoIuAIKAbK8p
	KiLdmbYXlz9ncvVKTAB/UueK5ATElGBYUiyOwL6vPlwfBUJbPx3x0awWImhpL+h1
	ZCCWu0CLL30lZpaQvMCOEw7yDiWv3l6cGfYKEoSmiiZyIcEI05n7U0qAot1V7pDs
	p7d8odtbMgEYlriCOvahZGmFnxiyUCGZ7w2bhSJhoCcSsiW4CpDbURJlomq4xeds
	ZBwDMsS6Tyfuj8RA0+LCYbqKa4IdLagFyL2kSceC1AjBuA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pb2n5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:15:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f33438950so652983385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795461354; x=1796066154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4xUTH4ApaOmDnbwbT7XFIBWNBS6WN5bAwQQKD0pEIsw=;
        b=MRH6tQJV45ygaePeK3PfYL3UuqCfxrcilga92/QMa+CcDboVe8na0KaexonXNQUffS
         N7fN7t33L+HL3Kq6xcueE8fWDdEw75/KCnYdOaUjwRTu1uTP2PC1ivzvKpSbvQ4GpPj6
         xzTYBO7wI0Ndb4q5byzCsFaXlP8FfDLOcSp9moembeZW2/I3rYCdm0p48yeJaqi452TN
         j8GVcH1vk0iPTM0BsK6PwhYE+XZ67zX21+0NZArnjgXgh/wEeBE8fsY3fBJD6LBGY8rn
         vY9vEmWccCOLNKcmrgYM7iN7K1+QPaWbFh7XFbhS9mMWxxfqpqbaGT4gFMbsSKePI4Uw
         v2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461354; x=1796066154;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4xUTH4ApaOmDnbwbT7XFIBWNBS6WN5bAwQQKD0pEIsw=;
        b=o4hQTRZG54L8A1yLmcjIdmOXMEDIFmOPy16m2KAY2G0eQqQu0yiezTd9yi+nqhF+nm
         H2l0zBQUd/NzC7NZZkSKp+w8T0XhrLExujdb+dBMvpe6hZ5r3gWYHignO9yM22q+9AFO
         0r+A/qwfn+JgpHnTsv0hO/suEd3enkKZY35N4Q/sQdU87B5Nbsb4vCK0CW/BbbYn2QkH
         wl7UvyD0ZXQ+lpgT+wXLHiD8mu69CmHc4xeQBS5B9589QQdn4Rh8qLeAowbJJ8i90eG3
         T1sApxAJp5YTK/rhoxEIC2x3M24zEuuGeQ087MiWMofzdxe07mCSYO/nlkZ8VeZgEf64
         99lw==
X-Forwarded-Encrypted: i=1; AL+hErEe6LMcTl2G/XLWuVAd572ppBC9P1jbMU1FBtDeli5HOSK2dUUF4KXxGQkWMQuWqEBhbINdjnWPPqk+SKkY@vger.kernel.org
X-Gm-Message-State: APuU4Z+Uuwat8HL7litFeLZ33/DdmrTKSmua1YP0C3Q9M0+3YPKtDsR7
	5bDuto1V/WUH795jSPUEkvbHfMLNCcnrVRfhPsiqdG/nVyrJVvvkvPs8hZTJjiVADmo4Yq6do+E
	wSsolANyAOdpbrf/VjLK+teYyhJkHmAFx9vGvdNED19t3pl0eUxUuQ/zjgZoMCwxPdktm
X-Gm-Gg: AZFdTZe9B1r83uv820mIy4VRiBt9gsc06RLxrkSWx/fGY3H4vYmZEN5xuDwCZnmJRoI
	chpJZ8lesnHeC0sKyhtEW978++md9joLHHrNZ8N+e4E31hcaBAn/pBUz2WSN/CPJ2mthXPKa4D5
	CftX7uY0/elllOf5W56gov6NcsmriUhTosMyfYjYeUE90Ji4s5vPzoGxp7VIWOE98UMqSDY9jLi
	osSX1Bfzf4YZvskZXICfpSczW7d3xyA+pSIdHdFzm2q3Z0eOFa/mEkS2BW2V0SMV2zaGBuFr8NB
	ICsffr1cVUV93yIfKG1X1kuzJ3CusEVkrSwc6adaZ7ZJH4aQMTQ3Wnk9Q4kS63I8Nu0+uSlLUSM
	gaq99VstR2ojkVbCpwgBguceFXjCxq4YkmtCZaihK0oJqNrx3LHBCqE5X4ncdVCxu
X-Received: by 2002:a05:620a:1a25:b0:947:b201:faf9 with SMTP id af79cd13be357-949ba9fd705mr2093645985a.59.1795461353617;
        Mon, 23 Nov 2026 11:15:53 -0800 (PST)
X-Received: by 2002:a05:620a:1a25:b0:947:b201:faf9 with SMTP id af79cd13be357-949ba9fd705mr2093640385a.59.1795461353040;
        Mon, 23 Nov 2026 11:15:53 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm180466705e9.0.2026.11.23.11.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:15:52 -0800 (PST)
Date: Mon, 23 Nov 2026 21:15:50 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        usb4-upstream@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/4] clk: qcom: gcc-glymur: Set FORCE_MEM_ON for USB4 uC
 clocks
Message-ID: <wuw3sfmfdsheby2jx2ruy3jcyvvcmxy2dqcmvx5nju3hbf5vr3@cjzi77i63tvj>
References: <20261123-topic-usb4_clks-v1-0-531ab5635c03@oss.qualcomm.com>
 <20261123-topic-usb4_clks-v1-3-531ab5635c03@oss.qualcomm.com>
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
In-Reply-To: <20261123-topic-usb4_clks-v1-3-531ab5635c03@oss.qualcomm.com>
X-Proofpoint-GUID: olIYmt1KRmNFgvOjouuzucm1lzOwcjq-
X-Authority-Analysis: v=2.4 cv=K+O3jCWI c=1 sm=1 tr=0 ts=6b0490ea cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=CqcFnwSyEhgAIpgsV1cA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NiBTYWx0ZWRfX+ErFBFY0+UuY
 6VF+fuMCYx+rBYaDREQ+5H7s0qrhaz6JCyWjr54UGufao5jgo256KnKK4yIUeZwTDf8YaV7RcC2
 A03/ikurBWqzm0UlRdjBDpKpMAOT3cA=
X-Proofpoint-ORIG-GUID: olIYmt1KRmNFgvOjouuzucm1lzOwcjq-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NiBTYWx0ZWRfX582bZhS8ajBa
 J301IPEntacaPHOqOA9Cm0WLlKHIBTDWxGmpSShZEwbRILq/1GiJzd/mCzlSgGcqEfyRKwjlQq8
 vbbi8SDcxjpc9YrjEVGgMD4r2Hecs8jeiIIszsPq5xO9XiH1bB+USv5jAy6hvY6lodZ+HZlJmJx
 bRm3SbOTP7t9inYiTHX+mjRFxqab5dBaWpEe45sZWD81e2Udny0VzJ6v6xZuRNWg+1kffgPvD0Q
 FqwE/ZnektWZGk/S3nSICQkGQ8okbcShezrMQEEfld6+lShFFQ9fzFq2MTPI6ZQs0b7xvQcA/R6
 4HX5hvylhhgofXycgovbWKSnm9/jNrKpwFgZCQljEv7anm8SiA2nS3CQR+LpJBJ1JVSUzH0v7Ty
 DLbDNXOpZUnUxCbGj7xbxvBUFTpN9qAZR0amMyXhFr9aAy6pxkoJJFrvO1V7FzmcDxMHyt8K83m
 9oxQqwLkILmyaIIy36Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230076

On 26-11-23 19:34:33, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> On Glymur and Mahua, the USB4 uC's RAM contents may not be retained
> correctly by default. Set the corresponding signals to force it.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
