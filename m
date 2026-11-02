Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625211;
	b=xGfAIBLWsQ/nE9OvEYcHq+QpWudSWUwIAK3+J+VR/tmMk33TO9QZIfUjgHSaEO0xyhYi
	 dHQ4y9dO+x/B13zMr4VpZ2TNZWSvcblMI1WBfG1KuCy+K+6a3YV6F0+2QLAnqbzuZ8wuL
	 +Axl334eXkt6nyF2POAH20EIl/rL3JMpt2bNg1fpDmUSKY/24K7c0hsIvjIZ0u3m8wFbi
	 HudE1aLYWHosdtzjvh7SQwlrz0cxpZnLu2HB8axC1psz9NSZ+8OemW3+8+4f7S4FnTVtc
	 v69MYIV2oeugyTc+Hc61U4ptBWLCemgGIR9Wr9CptO0iRWfUB0LZ/u0EJ0QUlvuDnmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625211;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Wp+lhaUnMTSGPW1szcEhAQq0bMP12m/9abUxOwHRyG4=;
	b=XoPPPQJOgB541oV0XjVZxsQYaVMIJh/UnVejKXevck/w06IFfTSUotetbh4w2OIp0C0w
	 0p0sfNPguqTlSWttkV2HU6sVNfJrPukBl6+nQfxP8dtJyx2UYbr5RqqquOZztJPv3PSOT
	 YpEB85lo4x5SlllpiCkUQXYq+wVbummtXdm3Iuj5GQpguDDC0/bgwM5j5CyUP65zy+ahW
	 si4RFB97MQ3qNWizgb1fZiNc10kQZsB5yvQ8hTblcbl3qPBlWkEXskoEtWR1FZH7q5/iP
	 lAhoO1l9qA2wGMbCYBGljoPfbwlhYki6QkRgWXWfDtePPYSORUwUdtLokmXE/PHnNQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I3RD+cyc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D4oz5r7H;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC743606A32D
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 13:13:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC743606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I3RD+cyc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D4oz5r7H
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAepO3982070
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 13:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Wp+lhaUnMTSGPW1szcEhAQq0
	bMP12m/9abUxOwHRyG4=; b=I3RD+cycL3qy/LFE+BsqgbT71D/EuBIQn1kBU/nM
	X5Tk5DvC98AtPQckTevOlH8myLqVvwrzyhOkF7CYj+tVGct3U21o4QDsZjDrLiu0
	CU5mwSjfHwPgs8VndJZHVfJAhbK4f8L9Xntv6oN3l93WuXXYer66qJDZs2K5uSS0
	IaQ8BlrYKXHhOCzQ8OLIVMbl3f9/Brsp+FYnkgUQaFz3m5IldySuJcugIICeR2aT
	ysT13DZDdhxyWOvDt6vd6gR14ye1ptZsTf67VM7S+tWCqEY7hg6O8c8hiDX3KmMg
	VD+Zen/BnI8yqqWecEochHcNucnKjDYTe0MkDFqCY/Utlw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpss5gbfv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 13:13:29 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-98c73709b84so2338898241.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 05:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793625209; x=1794230009; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wp+lhaUnMTSGPW1szcEhAQq0bMP12m/9abUxOwHRyG4=;
        b=D4oz5r7H1iEBqmXjwmB83YBWfm6dl/7ovO7D7BUGZUSxA5jwmVDEtjNESZheUwL7cM
         mY33xsUyGkm/2ohlkxsaiboBYBkJQba6rsMJ2I8lmiBDWrZk0dPCm28Esq28RNjpew37
         vVoFKhnDKGgJtw7gqbB3pCNpFB8FbCmpffE9WSGiJGiGRVqPIxTvHXNJNA8XGtq/eB0q
         BI3IxsCdRbeM9GgcrYrS3liu8ag/XfQ9TsqF5AR0mpEwPAw5KMw3LIBmhW+W0bHwvuHu
         BSeGtBHaXLj+vjSFpsMYnOWv4JoHgUlHC3aw4ZkB9Xi77j47ulWXu6j7pQfJnJPPS/Tz
         rgnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625209; x=1794230009;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wp+lhaUnMTSGPW1szcEhAQq0bMP12m/9abUxOwHRyG4=;
        b=vbfIL5Ww/Jc2+9qbiZYNujfpQ0KEOILF3ADl7SMj2J4ogXrjBrqcudJ15i4AIrhLWO
         luI6l+7NAqRUbMZGQI195oB+AKY5lRfku9SrDpBhyowvHUFRElL/GOp8rX6cbN3iQrbT
         01XoQhUCYHz3PfGUv6TFpXv02rfwAni9A6EIjsOmpUQUBrCP5alHhaET+mQCc7yqKm6u
         hqvhG1dkq04TNQzd/Wf59NdmTZOc/bGW7viFjCKKeA7yiMxicR3yMiBhC2apaqwh8SD/
         1b3MkIVK9TamI4e0+OjCe17nqFET3AArys2YQzzuJVFvSGFOKUsdfa6sYltkcDbmPLrG
         AfPg==
X-Forwarded-Encrypted: i=1; AKwUvBzKwfvgpYj2evFSnVQ7I63Vo8eQ48HvKgVRZ/EkH3zX+Nx1NIW/FsOMLlk/Z1hr1eoJlvKgQ93pNbVDhC59@vger.kernel.org
X-Gm-Message-State: APuU4Z9WvzpUGA/AibrG9YN3QTuoI+yG8783qaoiMJ4LgAXEtqDXiYC3
	g4ydBtQkM1XDqpzzyOQ+wP5X+dz0vIoRZsRwY9WyvK7ywQ4uDubc6SaQhaaX2oEyX1kFdJi1TaM
	zjJZPvhVmIAZax4oNkrBI1i8sYAa10Jc2Ii/f7Fs9Pl/4kGFIansXFadBWU9XvNSAXpgD
X-Gm-Gg: AYBFou1GQcx6xH979nUFeeTLtpOf12XtUrJMM5vpJ1HGxZxEO7auWP0KWf02rWP1bx1
	/4PkXGy2OVYQZLYQWIvi8REhp+/7EKmBmvAhYHzHmWXsDocqiYy2O78bdjpnmCiVH/h4oTjicy/
	Ii/VM02V/YnMEOVSyA5/33JfEpNqVQnjC4iKa/0nU2/dK2N22fZu145LwXO4Qg3PVwEm5Su+PQT
	uOuz4nolLZpR6Ae5L+2ESJh30+ddyimsdIdK2vsllAoLP0n6z1k8OW/tQuceeUFU2c+Cqo8bJ5o
	g2yxgrYc7kR6O+iV4mrx5MvR4vIkt/U0u5q6tc5giHCVZaoMURbiQU/nxZQ0eROztN6qRNhnSp3
	qtPIEC8sHCUE1NcVqUwtsyfmG7gx4Zu09TtaFtDvQ0BijYAdnFpAO/5UDVu+cgg8=
X-Received: by 2002:a05:6102:e10:b0:7cc:26e4:193e with SMTP id ada2fe7eead31-7d07274b90amr4160969137.29.1793625208752;
        Mon, 02 Nov 2026 05:13:28 -0800 (PST)
X-Received: by 2002:a05:6102:e10:b0:7cc:26e4:193e with SMTP id ada2fe7eead31-7d07274b90amr4160950137.29.1793625208162;
        Mon, 02 Nov 2026 05:13:28 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a6bsm19665390f8f.27.2026.11.02.05.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:13:27 -0800 (PST)
Date: Mon, 2 Nov 2026 15:13:25 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-glymur: Use PWRSTS_RET_ON flag for USB
 GDSCs
Message-ID: <udepf5n4d4by4b7nqlbvybmyszyoks2xeppgx4xlfbkpclifoy@xocxifqsthfp>
References: <20261016-glymur-usb-ret-on-v1-1-1790a523fd9c@oss.qualcomm.com>
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
In-Reply-To: <20261016-glymur-usb-ret-on-v1-1-1790a523fd9c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VORIDNPX c=1 sm=1 tr=0 ts=6ae88c79 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=8GfOtjjHQN1rPwiWMjMA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: iEfydBDezhAZiC3xkJYaMdyz1rs_PKm3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MiBTYWx0ZWRfX/EBZj1/dvzoc
 MRWicYdrTJ8bBbU03x6cDxZL9wPydvBWfN38+64pExEHfPyx5iKdlDlR9spR1DKCzl69/eegaEp
 3jAHv7gehHGsWqhnXaFOU4VtDRx/Zq75Os+1gJAiwrG0JiXf27CAY3FV0sOOYRU7sW1lpu+QMP7
 wA3g4x/kmRzGGKai67tu6m3kCISr8kauKprw7/CEg5yB7fVBZlGZKGg5ovPBXVIFgTdLSIQ7jjE
 a1qg+YqIV+BRchYbS6G3TraC/SWEtvYgIATsps4Bz1amUlzWJvgg+xA0fvEL2eTK3NTVxEnEk8G
 zvkpzjVtjUbBjyEr/f9O+u6XYkXgoGRqrg0PjU5+y8hGpC+TpnM/cISZiMWnGmQGVZhpNuV2uRw
 bYLDA9ztzuYoYO9Ko970G/FBMh6llB5uwZAZqCNcy7g9vYmXt/O11iZhvgJczBn6G+CUM7PZnBg
 IVbLjF9LtwXkx+EQadA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MiBTYWx0ZWRfX+CxLJdVPcuI/
 0TZSVcXH36gob2lG9Eny2+hiLYDjPKKsSzh4CEV2mfRdn24JZlSTuVRra9AT8OqA75fUXO/cMWb
 +qCWBVSjQ10GfazWnF+zq0WmBw6N00s=
X-Proofpoint-GUID: iEfydBDezhAZiC3xkJYaMdyz1rs_PKm3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020052

On 26-10-16 11:58:44, Jagadeesh Kona wrote:
> The USB GDSCs on Glymur are currently configured with PWRSTS_OFF_ON,
> which allows the GDSC framework to fully collapse these power domains
> during gdsc_disable(). When these GDSCs collapse, the corresponding USB
> configurations are not retained in USB host mode use-cases and this breaks
> the resume of USB controller from suspend.
> 
> To avoid this, configure the USB GDSC power states to PWRSTS_RET_ON. This
> prevents the GDSC from powering off during gdsc_disable(), and allows
> hardware to retain the USB configurations across USB host mode use-cases.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
