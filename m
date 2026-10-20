Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792499838;
	b=cC8hBWNG31EtmZrfs5puXsFkhwJfQbLpgK3DSBJMqGQnRrFC3KVyboE2qoUwS5X87Vaq
	 SiLQOq4fr9x1Jib4Kcmz0uF4r7aNJswKhRILVHUYckSJPjbgC4v2SVQGRNW9p9NVSwcWY
	 1qjVllczsOBO0EgBznwjBkH5Yx48jPp2/JAPPJgDNM04o2IY1m+fI0H82w90D2zZhFw3N
	 IduFacIRgcsJghfpvBXfB7LBoVb8dfQSXN7KiyKf1RovoN77tJ2k4xt7m+TLWJF2Fv+7X
	 e/fN2zIMGOwo3uZumZwAk+7XafgM8N1hKzW7gbnEfAmsSS2IoUY5DsgQuRDL5JXwMVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499838;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=V9/5S0k+CnWnpz/HcX+zG/F9NBsY/HCPRA/q3uYgiUU=;
	b=TW+v+fp8x7ax+KmlxrTjM+HPYDFNlLHcUc1y1dWkKz1QMbjOdGmM5PB0FXpu/+5xhMOz
	 PSH6kIfS0+j0PzHRVUEyfoANXAyGBcH9nxQ1v1qlrz47dZHOdCR3vdDJoV0RTr79tyeON
	 wYr6nWAjANy/TylVVh7cwk2dmYP5LgGa/ipUe4Y/UM7Sam26VokAKW0ENnwy2MC1WKrDM
	 4mfgOltFGXql8R/6A21gjylcO39qgRIj/EiwU4HemI7xaGbsgHmQj8wc7r8q03qDfmMV7
	 aIuYjHhDBnvhef3ncxqyjlLWpZsWxZ2xOqSOidxzzzCpNZk6OLHUYrIhP8jS4/YLxKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="YyX/vk8w";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VZ3PBRO6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA94B606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:37:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA94B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YyX/vk8w;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VZ3PBRO6
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAxHk71292864
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:37:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V9/5S0k+CnWnpz/HcX+zG/F9
	NBsY/HCPRA/q3uYgiUU=; b=YyX/vk8wC1kHa9ETiDE14KStwzhsHnaxA9nuhlCy
	QxeEoRqD3VxV1KiNNtONMHSVnfLebHKFXQ60axbPnRXTjEOL8MQM44goE7PWKdjQ
	GRuT0shOvzwlOPuo3NAWdZjKeovgpxidjCzUpRaUF0QfhhZ30SEmFpaM69ZWk1Ct
	+pbNg2z6BNuDU42Qqa/pPOX7y5FAeyRQdwkfZz79Kva+oIbpB7g2N98/1MbehiRY
	DXTl8Dy+e2iZx1jIrrJTEScnZ49YjHKyo2WY9wot+Iu64mOxJrY+vcF0UZks7hy4
	EmUVaQw3qD71xKOFiaqjSCFP1OZpSZc1bYdo54O927hXng==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2fh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:37:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a082c014aso149868085a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 05:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792499835; x=1793104635; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V9/5S0k+CnWnpz/HcX+zG/F9NBsY/HCPRA/q3uYgiUU=;
        b=VZ3PBRO6uSVr02WhAd1n/MfngZxWDxJ89lZPGiuA3Q58S87hSVXjnccNb4fBpwJxS+
         nK9SgAHW9ZRng0gY5r3sWBJcSLhZtFbs3lRaclzJneu558ZejdvyZeQWp0XGyaoF2XZD
         YSJc6wnKfmW+R1ZDzM9BWYJBjc4BkDrZj36RV9RNYSHoJA5dlQej7FRi3Stgzo5lOiZ5
         2bTcV8UsUPy5BCo5Jd5jigbV6ude4S4JP63FjMg4zP7hLEIXUhHgNWMiPslkJg5syw/I
         kcgw0BlKPZCvtQCeaXeHYeaN8Nt9aXEWzTez456KDUx9vqUCAJ0fozGXZiMOFKCuwTyl
         UN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499835; x=1793104635;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V9/5S0k+CnWnpz/HcX+zG/F9NBsY/HCPRA/q3uYgiUU=;
        b=CkWfoHtIyTGaffag8uFw4SiL/EnEcu8YyZpmjXpga1+CgqqszHLHi4XsbbDoixG59X
         TJWUJjrndF5aJ/Y7i10esJVDfBqAy3yaiJKsaGBtXLXuix651lO5N9fW7fK/34TCNnz4
         vp3fKlrJ3ORnZzIA7oEkfP/4BH3axg4OoXEJcF4yCJThmrE10IWNLtZKVwGo2ht7r+M5
         hHmCbce1y7lkK2cy4KADTKfXvcpmLWTQ+/EibPL0HM1V/F8x9xqJSSd7EkFDIKotlilR
         7/ivdfYprzmtbnkqrfaUCDtusaCJo4QvF2bwW3kk5YUX1aqm/6DuBYpDQzWjx4S2y46z
         mzKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxI2v8dDqOl3fomoJI+OnFOG3ji3IjTsshiTDV/4z5ztgmWXGAiC/EuXF9fX6r9xbLfcaOAblW8ZLNku6o1@vger.kernel.org
X-Gm-Message-State: AFq9FYIqeeugEaNvv7hn+fkdj8u/2rgzhy/nmHFryJNfPXT1ugZPk/Ui
	iLIvNoGeuBhZykoAzkyc+syahhDJgzlGpOGYODwlx11up5J+toPEqUxb3H/EQV7svszUU4C09yi
	ZNUMS7UjFzSp1uIMb41jBnnMJXBMXopxNgo64Qgviqu9BkBewuMWQbH+88+/I3rRP8mvm
X-Gm-Gg: AYBFou0DqtlsQVA20QuDf5dVjv+ryI4mCXZce4TynopUMwHlIbgON+jtkYoARJ0Q3oa
	oC3eEr76OtrCc8zIDaLPNuKquRst/ni+Sv/W49x077QRoJShBHgBFaiRht5YNeRsk9/tqPCbwAd
	EGQLhV7ck0OxQlg3TK4Mt5MaNIdr9dB8Uh3Oyc46wg9oiy87Anaws16hgEZb6UNtI5er1m0aT4Z
	g7pAYy4qx57TFafjoPAjPrxdssf+oQk8Ifxgb3+aqRjqVNSpi6iLi/ZU/m5R05LwJHvyvpxAsEj
	wYIk09v2MuI7Gy7mgTSCU3d9KhOAINWp2HvH1zkFNztSmtuJzy/f1aUvc2O8JfcX1nDI9VsSfYJ
	ydvyABiObOuuA6iBz
X-Received: by 2002:a05:620a:2788:b0:93c:891b:90f1 with SMTP id af79cd13be357-93f4c7882a9mr276510885a.26.1792499835025;
        Tue, 20 Oct 2026 05:37:15 -0700 (PDT)
X-Received: by 2002:a05:620a:2788:b0:93c:891b:90f1 with SMTP id af79cd13be357-93f4c7882a9mr276505885a.26.1792499834370;
        Tue, 20 Oct 2026 05:37:14 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1e0632fcsm5146180f8f.0.2026.10.20.05.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:37:13 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:37:11 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: redducc <sushmit718@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] clk: qcom: gcc-sm8450: Parent the eUSB3 clkref to
 bi_tcxo
Message-ID: <2gpomabi43eos2aprz7red3m2cmdif5srdq2eg7c3o35pp3y44@cfhcrixurzs2>
References: <20261019161740.2384-1-sushmit718@gmail.com>
 <20261019161740.2384-2-sushmit718@gmail.com>
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
In-Reply-To: <20261019161740.2384-2-sushmit718@gmail.com>
X-Proofpoint-GUID: D9JOyX-3TKq7Ibcn6BHRx0mi-crTLA_k
X-Proofpoint-ORIG-GUID: D9JOyX-3TKq7Ibcn6BHRx0mi-crTLA_k
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad7607b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=KyWEcasX42xTa70S7QMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MCBTYWx0ZWRfXzX1EizZPMPTr
 WDOG32xB5sA86nh9EwPGHnXu4QF5qOEWCNyTFgXL/MB+q0O64OtKXB7isIypFbJHKstmjxDFztt
 CGacIG5LEhRmx0+WTQyXxoHeHE05d3B2X1iv/ICyvjDUd/nYSWp2zIbhNOcBpqNqCZoHFdFI7hD
 6Qse5XNRxB0dq8XvECFZ2P/dxVoCqd6CZPY8kLbOidUN/iUQC2nkqYWWj95a2U/6TjQ7PRhkMHH
 LWzFsoBQZMNFN2YWo1gu36aNpvXmAi4d8jk+ORq+DJoiSlMAbMBwqXDEvL1D0X280x+qpu7fkL1
 8TLYE57JMVh9qgeDt6AZ6bYUETxTWRWaXL1znW+ikKXZJS5ioJrgUYSDvNohYpxB5dzfbpcyOec
 +z2XjAfN/FsjUEl3LpZ2p4brjugn6/btTvghrCaTZVVkEKz1h9ukjotAli5ywsl/5yaBuyxZPcV
 48MMbL9PwoBse7ux34A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MCBTYWx0ZWRfX51VYevAW6LQY
 yQ5rH9BgHebdjNA38MoDZQhcGFcJoGIeXHGywlXrud/sYZmShrAcX2LWBu+jx5JgMzV0q5+K9UE
 /MrnwA8K84peg3tuUZuc6yRS/mV7n6k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200050

On 26-10-19 16:17:38, redducc wrote:
> gcc_eusb3_0_clkref_en gates the XO reference to the eUSB2 PHY, but it
> has no parent, so its rate reads as 0. On SM8475 the SNPS eUSB2 PHY
> takes this clock as its reference and rejects a 0 Hz rate as
> unsupported, so USB doesn't probe.
> 
> Parent it to bi_tcxo, as tcsrcc-sm8550 does for its clkref branches.
> 
> Fixes: db0c944ee92b ("clk: qcom: Add clock driver for SM8450")
> Assisted-by: LLM
> Signed-off-by: redducc <sushmit718@gmail.com>

Full name here please.

See:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin
