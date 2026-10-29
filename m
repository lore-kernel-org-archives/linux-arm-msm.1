Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264059;
	b=BPoORkjfIoCwNZNX8prQzXA0Xbj5UOab0v8aOmKD73RTZUx7CCN3qqj1/lf6D72oTjZ0
	 zH3sPjTEzUYn+Vk3s4ojY/m0lliLTijuYJtuZNOM8ylSa31oPC80bYre+OYSh5yHXnlOx
	 F3vEbQMyjrU50Vt5sTte2jpycXosr3XfYMbgpSVwSFF0bnwN2puTyWXmkXl8mVuuv7Gzx
	 LD9hujVVweipm4h1d1NFNjA8SqzB+2SwfMbBvlGbYXIvduQKWvqA/N687zHnTJm6iUA/Y
	 N7LWHEPMgFxHgsrgXajDG0yHCKmEqit6pM1kdNTF/sg1XgQrVh4Yv9MUkV4FWm9AMGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264059;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dwweBRTS+7n3OyBIU4sWtsH/4bvxJRwE5yb773mGS0s=;
	b=3v1ZnGJVmnn0qHDopjyKrxfIE3jb+XdJ9m6Z0n0czVBXV9UZYGbUOwInDDHpuIPM1oGL
	 vPFix1ACrsVBTY0mqSbivdMTuRKYM1cDxcorvVIH7SLSYquw0il355mp/j5uQ+r3bdYJl
	 HdrKQl2ENEDmPv30FNl0Nu1eqgh5VpB1Nl7lItr9TCyKYqFn8LMMx4xkeQkhXSs4D5ASq
	 Orh9uh1zycatp76YQTaxK3vh5eA7q0DB4B/yuFEnFTJPi8C6aHUnG2BSE5A1Ct55xyDuo
	 J9MrByd+3K4Ap+u23sLC1jdpQQT/zmpfSXCJHxs68geAnShP6kxDWcE577dSHCMQ0GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b038sWn7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jYRhpLGV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FBD606A31D
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0FBD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b038sWn7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jYRhpLGV
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5GpsE3341048
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:54:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dwweBRTS+7n3OyBIU4sWtsH/
	4bvxJRwE5yb773mGS0s=; b=b038sWn7NaK4r2tjnxS/2y8coqng+3waNaWPSOrD
	03euLFwcwxU+s4Kf/nNa7CbAWbOUzZyyfdfoIoxl56BXuoQzx/vyAwCUkx+KDxrP
	+3JESV7nkJ8ls58Q7f+/P+ZPT7bk4EL7bheUlbb8iV6GfYEpOHFJbvMwzbFvqwev
	MelzTBnGsOOZl9LVD78AK7LlvK2QT9n6SwJRQHkBZl8gqjap6ZWWEDJSDJeX43uC
	T1LWOztfd/QX8S3X3uMtZVl8DD9tFnT7OGD4pGiOb1N0mw9H0HuZjGvORkq/Kjd0
	4JUfzC2D5m/Nf4THf0EIvrIm3Rr+BLPw2wYu/jH398hYcw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkut3hj2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:54:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-533928ef33aso28156271cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 01:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264057; x=1793868857; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dwweBRTS+7n3OyBIU4sWtsH/4bvxJRwE5yb773mGS0s=;
        b=jYRhpLGV5TGm4babvH/oUfoLowBkifKBKpndMoHhg5Ax0vs+yAC0fcPaefFLbJZTxj
         W+Xl/k6z881LMuuW+TAzqy9UkISIziHwUsY2mH6KdaEcCQ8UVV9HDVlZNHQqJmLi8kPL
         A7NaRh09JpPVvdudYmCeqdlb+9dGMACfpHJdtrMCtjSw9/qO3mt7YNg3XgA4ZGFUY3GT
         FIwv13iXdZ2qNH3rOVWWjzlQ/yyuONYM3kRXc7EuIKqyNnLy6+kGz/1n7fC4oa3Uwv05
         M26xRaMwMbjmfouJ2Q8pmco0AuPh98AkkHqCfra6rU/ddKdFzHdj+FWWfBu2PFTwqLIE
         zjOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264057; x=1793868857;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dwweBRTS+7n3OyBIU4sWtsH/4bvxJRwE5yb773mGS0s=;
        b=LKZVSfSfR1e9tyZHvxg0SA8a0NlwDk2dA/vUiGeZCx4VbE8PbyaXqmdqjluFCUzic/
         vxj2FC2MF5DYNZhQ7kRERjCL1OtWiVUrNmmjM4mkVmF+9ohGTuJFQB2i/ICKojqzUbPx
         mlRMzAR5h119dBC4Z14XunTLrJ/9t4u1zXf+njfEIYPmXpTHa0I66gItfGy5zTVGm6ED
         BiWC0Uk8gV4bTHxbDNgeGov9aym1bo6BlLewTaEKtsfsW3QPShGEabI3AG8zXqsds9Dr
         iVdD7/n8vkcn/obLoHpL974YMkKHBbdy+j3kZ1bqdiaaWImtYasIbYk+ye9U+8smDhtj
         iAOA==
X-Forwarded-Encrypted: i=1; AKwUvBxVjKD9JGQyTRDQj3A3VkFO8QfNqOl+0xDPrXkJQxvaFuZPnBeDijeBMinKyBqs6OO+0Bj0BFl3XhOaZHZG@vger.kernel.org
X-Gm-Message-State: AFq9FYJFUCf5M0Ro0pdpzDxXQ0cYHee6BW3Vi7qNR+XS3kDPv1hOVubz
	m0AryvBVnIRl68aj9pltkQ+rO6INQU44CVUs4ffYP1tFGoLM5qaf7XY4YhnxAzt6J/ByXxzm3gi
	geep7+dlHhW2igfV5fowh+8wEecRenxZOJWfhAHibPhOOWAvnkZc0cgsbzlbepm+wrUTX
X-Gm-Gg: AYBFou2MgR6j6S9yGe1K0mNvm307S2djIU15V1YSetNZ/tIba+YgpGHAc7DX/lD4sUC
	fRPnlz0ePDtRsh2z0b+nFEOFZCqN/uAuxD12sS9DkVSD0kC/hmeaabs9rfgtltwRIs3v2mTyJCi
	Tzd+sW7w3vGLumU2l5N008xK5/U4YKlEe8fiY1iTHpBTsOZaRwyPFi/rSG7tWbfJQ0sYdSiR0TF
	KBBwDkNvpfjO+Pf4WNqJl8qCsFUTypvD3wjdiswhlRPGPwb1eWOpE5SPHtBkHfcTEJNlGRz1jbW
	90847xua154NcnoHE21+BQsWd615SC56ZvLIKV6OoFjvgh/sby23qzhrf9cIB8hA5pr3D3IcHeE
	EiLa601isGpALvDfcp/9lgmhSz0WolMswmSa+V2h/+VauCtDxeg2apgRoyOx2n5zM
X-Received: by 2002:ac8:5cc1:0:b0:536:91b8:ab42 with SMTP id d75a77b69052e-53fccab8cd1mr79481641cf.70.1793264056769;
        Thu, 29 Oct 2026 01:54:16 -0700 (PDT)
X-Received: by 2002:ac8:5cc1:0:b0:536:91b8:ab42 with SMTP id d75a77b69052e-53fccab8cd1mr79481381cf.70.1793264056176;
        Thu, 29 Oct 2026 01:54:16 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f7f52e2sm59555365e9.9.2026.10.29.01.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:54:15 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:54:14 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Zhiyuan Sheng <zhiyuan.sheng@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, wei.deng@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com
Subject: Re: [PATCH v1] arm64: dts: qcom: eliza-evk: Fix M.2 W_DISABLE2# GPIO
 polarity
Message-ID: <dnw3tdpyfi2phqm5xjswygte35rabraz2jgprapcjlgjrwgf3p@fhfaw6pvpzc2>
References: <20261029084203.2674083-1-zhiyuan.sheng@oss.qualcomm.com>
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
In-Reply-To: <20261029084203.2674083-1-zhiyuan.sheng@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX1rl4YCgg2TP7
 Wy/+/v3ajOMqjfh2V257YtEfiKhEcSzY7LJTQUWCHNjkUOWLkrYbULnP3lSBJmmOU1zliGXfVmt
 mAA6oIaDRtqfI6O/k8NxrbDOj2A8bdU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX27bs9dvpoPBy
 r17TTEMVuBn1BgefJ039qZfV6GSY0PubWzevXWLXT6b6xDzJ8oUkyXG8/F6r+Gm9+kAuYB8pM7B
 /xub4NreI3TQTdG+ev7H5czmqShztxOIe7g4uvvBvhb9NUTLSXOctpbbrX1CQmCYMuyAsqteAas
 1+jRXGofyhuA72sEYICM/TSy4/SejDI5so7kl9knqlv3/WJ9QJNmhMywV1BV0cyaf4wVsVbfb1b
 39Gabcf22KcjDfM26zy5rnVIthswLXyVIz56RpzGwWWqxxm8mFhTPd6GQq6a/7u+BH3WbUDyPEA
 gaJlVcP0jxAk6V/bJjZV2OC7ONHVof9H1iOkvaS/0zcs2OSzlHoz0OyiDwyfVEzEmu8IfUHVUoM
 5bw0959GwD/3DMQXEFoXqOb9hE1U2IHYdYWxQyCKz4XFMw6YZISeJDNeVx9Ei7tJpUWlRsCndr6
 3rt/foeqs7mutJP8pPQ==
X-Proofpoint-ORIG-GUID: m9GG8d9uYwAUNXQSAdmYUJuDhCCCk3Mo
X-Proofpoint-GUID: m9GG8d9uYwAUNXQSAdmYUJuDhCCCk3Mo
X-Authority-Analysis: v=2.4 cv=HYSB3SE8 c=1 sm=1 tr=0 ts=6ae309b9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=TbxCw6FMqn7yvM8lpfEA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290034

On 26-10-29 16:42:03, Zhiyuan Sheng wrote:
> The W_DISABLE2# signal of the M.2 E key connector is active-low as
> defined in the PCI Express M.2 Specification. Fix the w-disable2-gpios
> polarity by using GPIO_ACTIVE_LOW instead of GPIO_ACTIVE_HIGH.
> 
> Signed-off-by: Zhiyuan Sheng <zhiyuan.sheng@oss.qualcomm.com>

With fixes tag, this looks good to me, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
