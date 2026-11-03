Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699863;
	b=p1C0YvcKOrNDwQjgg6Vv52sSEcZpnZfOl7sFo0zIT1iUfQaplxh9KHfpfZ5i7iA6NmsS
	 ZKODgEZZZmH+H9m9zOi7NCy9f7HbEMq9dE+vzAIcIvVacVHJhWSPPCsJ6YJWm+T5LA6eW
	 VBqSLySBeEiD/WqdaipdZ7xVDQZEsJ3+2lK6blvJKWIoAEEuvSk1uuS1jsLAGoCh1RC9h
	 XRV85I92ikIoVyu9asgvlhIv2bDJWqk3Dgq7zFvYN8kZuRJ6MF6bTzVdkB177+KrMhl8s
	 za0lVbKyN8xYBvsOBMxGamSSAOpELu4wHzF2tpF7jwjId3ecdwcoKYQy6fizN2SZMXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699863;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vykUFpmUN94FUZNYd6DC6+nPEP/pk2/rhE9WhU1TWoU=;
	b=xaHCv5VTNjonuPio7dTaa6WSA2qBtH+jHueoQt0BvXgmEP9t/xdycX8z5AC+J7woN2Oq
	 jABV5XR6V4zDFB0TQohgcxnrKoJoPXLP9BTGSYekx7deaPJ0S+e+O5siFxPPjVHAaJ4jV
	 BlktQmFrZStvXHabrF4q6za2WuBf2bd33LvBfgzB1kfz2bQYZvJpOMWxzY20eMUpX8/+s
	 oLOln1mfz7L+f9lsws2NiX9/ZgKbsHDGgNr7Jii7qSCGMklTocueYl8+CG/m0q48SEsU5
	 DMvPNpegN5fMO8Z6gCzuVfaHdCA/8GjAzVWCWUhs0W51z3E+7lxdk+8myP7KNMKG5Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C88IFEOp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AVjm2FOJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E21606C521
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 09:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5E21606C521
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C88IFEOp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AVjm2FOJ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A38Ghbg1433960
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 09:57:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vykUFpmUN94FUZNYd6DC6+nP
	EP/pk2/rhE9WhU1TWoU=; b=C88IFEOp4a+5FrSX4DOuIqAicz7UrZV+Mj9I9oyZ
	UWq7pYdYLu4khws/bokefYL9kiV9OUXO887kdlrQigsSFY05V8xaB70Txzrl88pr
	JJ1888e7oxFrADiI5joiW3xNwY1wPHKVhvjExyXANzLy1bPm+TCW1PiCbVZShhoU
	bLsEWzc33E86E1+1w7ELnE19+O7l1kgZvMSS1mSOIa4Exl7H4wQlSPB41H+uqe51
	xKrWCwWH9IxEJCp04r6dA3MKHz/yYx2PooQmyVTWlS3hDnH7rZ5mjjvwmFlbSrBh
	tEagi5xCVvdHhCAVU9GYcqIvVHeuTTp8sEsfpzrVEdHp4w==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq2acjj58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 09:57:41 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc10da5ad4so969890137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 01:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699861; x=1794304661; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vykUFpmUN94FUZNYd6DC6+nPEP/pk2/rhE9WhU1TWoU=;
        b=AVjm2FOJzrzT993kKQgKUKv18l3TtuLkxzhAPNnFUi1Y4STZMeCvHhjJua2y7CbtGE
         2nsU1S35yoKBSBTyrExgLDIE7+xrZfs+jr4/WHzAVdxpt11aTwngzSthfJDKvcJ1TKbd
         kVw/61AkgF41BMAvgllDgDxdIaa2bkYctbd1Q11PEamW0+WHpQ9Ha5uc0GUp3jt8pqaM
         O6aTRnr2qbwa6WZFYb/ZdcrzjH70vBbwVjuKkluJTOG99yHGNYuw57z5iIeHRTM2GlNg
         R32schtf7ZRBxPQH9QtNmwdh5u1/zhEZHOXGEh2MRtPUN+s3cX2Kfx9kqHOVuUy/61h5
         JvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699861; x=1794304661;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vykUFpmUN94FUZNYd6DC6+nPEP/pk2/rhE9WhU1TWoU=;
        b=iVbqMT3v4GWrtcCGtamjSTGY/Otg2CdQgSSeBbp+5ma80eNDdP8/URsM1E8ypwTzcg
         9phoZkAWvEF9nFrEQTmfRLG1O7UwzXtkvjormb/D0wGx9nEVhWTmWzhYoq8xHuLQox5J
         l0ibUeb4zn/qDjzoHtFnbo0g1q1/WKBjk3QFpt2oaNSnzcPi9vRlyjQAuGvHriGFUCvm
         umN+lYHmnxTeziwG1fmpAyJhzlCTxqd2AHeMu0XSvjrOYUA+Nk0bkRgv5eqCk7WrPnmA
         BOthRDALPm+CEiDbtOsNw5QzkTFglu6ZyjMOC+1V5ya+YVL78k3NiKX0L4WqGhUMEV1F
         76Aw==
X-Forwarded-Encrypted: i=1; AKwUvBzvqT9NWjDCdTVF047hC1oy4SsbGHvC1IjcOonWSnnZtw54vgHMzgFod/BlLgyxUTStUf8km/pirn34VKM7@vger.kernel.org
X-Gm-Message-State: APuU4Z/PrZ1EV1/i3INVk72E2pniz4KV05gGjPVbZEe13S7fTVPTiu9A
	VjTPWIUNaQh76ljhePVQ6s98u1NiIst+Y35q5viX/aGTYfEnIIlRwk+JIDuj5RVv/nwdZOeuL0u
	oipiKdOZ1TM1VBldk1fA3Q8Tx/6lDduPyjn6yxO1lHUmY1027GyNAX8h0pKPD6+lc8+TI
X-Gm-Gg: AYBFou327K82YdLbfmA6S/vyd67sapt/+mNegsGWul6GZN3Fh69gUBn59NyAlp6V7MZ
	EhEzPpYl4RLfz32qoanR5ppzcPmkUsSbZ1vTXZw7sCczN8hEbi++3ns0cU8ZvizOeIxgjywU1Ov
	0gu2U4lyJF9+KHo8ElQK76nroAs62/gGrUVnnb5l4t/H0IO8OiPOq+MPmQkly2vONSF1Mm8g7Ww
	JrXyryYxS+uiwgAVLR27IP0G2tk7jzfkFhAZnt7fy39K+uBF7JXk6HOzKPKzWk9cPfz1r1urS+z
	JNXeGxX6noGuh0LgtoD/kXgLxEc5P0HUBGWX+Mlq7xrk2rEp9nbe8G4VPFKTSnEy4Y1XtNGUa7e
	m3BgzWCFdd5+I3IR+79zzIKXNFDqAiDaVRT+apQFg2ZdTqmvjN08tJL3VX+x98wA=
X-Received: by 2002:a05:6102:809e:b0:7cc:2152:4f95 with SMTP id ada2fe7eead31-7d0727b11f1mr4320217137.3.1793699860675;
        Tue, 03 Nov 2026 01:57:40 -0800 (PST)
X-Received: by 2002:a05:6102:809e:b0:7cc:2152:4f95 with SMTP id ada2fe7eead31-7d0727b11f1mr4320205137.3.1793699860044;
        Tue, 03 Nov 2026 01:57:40 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b789c6sm25721554f8f.26.2026.11.03.01.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:57:39 -0800 (PST)
Date: Tue, 3 Nov 2026 11:57:38 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] phy: qcom: qmp-combo: Use V6 offsets for PCS-AON
 clamps
Message-ID: <3a2mxqg7u2cf2d7yqrnd6n2pkloqbmrz5h2i27haplnhb2m7j6@lulsw7nw3ojf>
References: <20261102-topic-qmp_aon_clamp-v1-0-141c2cb6cdf6@oss.qualcomm.com>
 <20261102-topic-qmp_aon_clamp-v1-3-141c2cb6cdf6@oss.qualcomm.com>
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
In-Reply-To: <20261102-topic-qmp_aon_clamp-v1-3-141c2cb6cdf6@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=T4gZ3PKQ c=1 sm=1 tr=0 ts=6ae9b015 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=SJ-188YyucC4oMBaDWIA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX3q+UogxlR4zc
 S7LIQ4EEsPKoM+0cHC0uPR+g88UA5weq/vQUAZm+909vncu8usNSM1j0UQeVCCN6lT7BU0Qd+y9
 I+Oj0ZCwcWNCuJQnhS1nwlyr1udACmeu1mtSe+rOxNNO8J4adIxaQgNguHf4GQaDYMXaHNqe5Tg
 0oEsQfN2irFrZPP2io72k8L+0S5q5McodhuOUrWhhPcjR8PampuzuSqGwckpVx5doRKjb7wo+sv
 NHsVKb58KyWb8kw6bz9cqGtAVPxZNNphiF0/TJCGdQXr+WIiLDmB9N3MSESgJlLnWkC290QIiBu
 2o+JTAC4r2xjlIdYNWHhycsrsgEjPsKCtMbG9QRrHYiYWdqqeGbF7QTdp1MDCou59OkD6pWfWsu
 gOdlnNkPh8CN5sXYn2Ou009UK8UJ6fJHsA1h0hLjClBNO0ACowOhO1tYih2g603G+4zM5ngS5wU
 1zDQStWiY1urNQmeOsw==
X-Proofpoint-GUID: RQX-N1SS_3wWjLRGMYXPG_w6hxTkVLrK
X-Proofpoint-ORIG-GUID: RQX-N1SS_3wWjLRGMYXPG_w6hxTkVLrK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX79/FAHm8XoWE
 ckQv2rFVGh89P8rMKP6NzroFfl2SHtiBEGtPt+nXPez+zB1ETY1cnR3DggKfcikpT+RVpzmNs7t
 qAjtzt4XtWN82UTx99+/ls6gJOWjTFs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030039

On 26-11-02 14:59:34, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> These V6 combo PHYs were configured with the V3 resource-offset table,
> which omits their PCS-AON window. Autonomous-mode suspend therefore
> cannot reach the HPG-required clamp register.
> 
> Select the existing V6 offsets for SAR2130P, SM8475, SM8550, and
> SM8650.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
