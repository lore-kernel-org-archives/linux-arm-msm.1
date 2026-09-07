Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702EF44AB8A
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 10:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788777526; cv=none; b=gLiHhxZ3M5wjhKZnuS7+PqalrOOcXABAMjlP5t4HptFKdyGZ3IKqo/UEP1fMX/b1w6DXg9IBomL/69rjnW31bQH6ktJqZEwhC0isjTx9AqTi8C1mHzHUhT/yB9VzBoHAN8el+6qZPCRiqFfy0HYd5gN0cVxDw+ymUUFMJAERjLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788777526; c=relaxed/simple;
	bh=20LrBTk7+xHKrR1eeJdTqXRkQeM8O5I2RAnmQi7GLEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NJHlpYZXM0G7ugRJI1KnHTrUnT0ytBBtNiuqm+ixRn47k4RAp0aB9qJ1nhNpv15yJ9CDTP2BYU8zzJZiFyHOw+JL1mcJQ7eqxhLBTTS70Q2J5JrVv/Q14Mfuq3PRsmJ6oomuSrUFHAdMDWNlD6H2J1Ilzo9Eqx9gMVTBYlD06Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MrY+zChE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y5mDQLQN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MrY+zChE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y5mDQLQN"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879bWj94037006
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 10:38:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=20LrBTk7+xHKrR1eeJdTqXRk
	QeM8O5I2RAnmQi7GLEw=; b=MrY+zChEQQm6qp+doFuSD5i4lPkXLV1rvUDW5aH5
	rlgfO72gukLe06Uu8jwT2Z7WUObGCbRR8q+fOleBCteaQj8pEWheGLvWGcg12OfY
	PT2RKNCF0Bc8BE98HfJA8z7ysb4N/pqzLB7GXsujDk/Mi6DkiV7hFA7IHlAMsO+C
	/6xZdYXF/YfREQEdyPLZpYeFZfRM4e6PKEgRGhPeaUIrfKTwTcV0EjgGvJsGh9Ps
	i/uETnId/zeMUZ+KmbZjmqsSDe8HgYvpPmcmTPROPABIFdCBz0hiDSd4hhQSAgYU
	r3RaWb/G4DMSZsyjdhhEZ9/eU2RHUItfck52mZv7MPdVQg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghssg0khd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 10:38:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9396e0515dcso174640785a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 03:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788777524; x=1789382324; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=20LrBTk7+xHKrR1eeJdTqXRkQeM8O5I2RAnmQi7GLEw=;
        b=Y5mDQLQN6+nPMpCXVGRBFVDONlu+HnJhYaNNCSwFG+SdbqMvLtrPPl7z0VGJcC5T7x
         3d8EQJVnhBMpMouykS55qGXB2ERn1mRJ3BbKCSCOEJCJ0IybKT3cwg+UzvC55NiD9BUJ
         OA1W0+9ffKdQ54TWY+PRCxpEvqzpo9hVg8FVWI6y2vYTJJUkp9S1ZOVhknBbZkUvHiZZ
         NB+fcxt/im5qpczX5nTcJqkw30Cjn+b5/ym0PY0iNi9ppwul7WpHDul7sdOOT88WgpD6
         oS1F1QXJgBwxpAQOdd3fpTxZ/0Q92nBHM9l7ZwzTWithYzph6UdNxJM6WdQxHET60Jov
         BzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788777524; x=1789382324;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=20LrBTk7+xHKrR1eeJdTqXRkQeM8O5I2RAnmQi7GLEw=;
        b=gV4GXlClLjHxgxb3mFiM/kofbGG6SLQQRazi2UQjRaYWu6Oi3P8P1kKvU+eQXdIPkB
         9n5rxtrTxoRuQTfamXBt+Eew3Egw8I4Omv7kXPwuc5wHilMqyEyNoS1WMirvOCdzK2kc
         98nbNyQ7vGOa2truxR/gWtGsAdw4hsMhm+A/oaTnUui0iKvOadx2LinHTKLhfJG1D2JA
         SSysTWOikolSPYBvBolQZ96JTAaY4naijoNlgd3vzq4KnvZWET/i9Rt+a+1S1O9LEQ7x
         RbOaQS5gTyjp2qig1zTtCvscvVoSmk32vZ3zBiKP7BA5XbcSJcxQWmFtG2W+QCGYxi3A
         9YWw==
X-Forwarded-Encrypted: i=1; AKwUvByGn/Mx9w0Xzonz3htN2KfrdBpBQXuDZgptZva6T2lU49xO5fsM4hijuWZxQqBopFk/9sPSEyT62MuljW+A@vger.kernel.org
X-Gm-Message-State: AFuF++k/banmhj/Op0jiYcgvVmEr/4ex5MAukCCloUYnKpXNuPQRbmbD
	0RbCDfuH2YmuaJtZDhbieLshuYtliCu/QT6NeYu3DvDQrlt3FIVB/bII2Q6s0/LO9YDBt2eUdJh
	nJOnHCJNgDhTcUWdik+PuR3BSQK5z3dSgv7NXrV3n31Om5eIE0ZWR6zywLmyynVq2IxfjrxE6X4
	qU
X-Gm-Gg: AYBFou2zgHo8t2n6eoRdehtvfBgHTOtHQKxRyJenI+tF7uv/mIDFJET69X5ls5/6moh
	eX08mWzRAUy9W+jJZdt/5cp0pc0lPinx9Do+8rauUdQfyXMB+kkh23BBgYGx4HduDHPRLlrV6zc
	4I9MwE2HkFkm8emoK0oX9r+/6VvaaQGtWOvx3e2b2sYZIZwR53rZcfzdigbvXcHYMgHX+/339TS
	wq8yQ+YG8xczFdsetLAOTfvIx+N1AVL8+U2Z/mdWVpGAnz0NRQ2hf47ouB49n+wOnwyDkJQoNfo
	Kcnsckt9+IdAIFlT3mg8Dj0QnRbNgnm6OcwnvNxby/IIjiKRgbhTVDEfTomv0w7tImIxtqhIIqc
	vOEQZkcz3DTAMsA==
X-Received: by 2002:a05:620a:aa1b:b0:937:675e:2903 with SMTP id af79cd13be357-939804018c5mr2091271585a.14.1788777523609;
        Mon, 07 Sep 2026 03:38:43 -0700 (PDT)
X-Received: by 2002:a05:620a:aa1b:b0:937:675e:2903 with SMTP id af79cd13be357-939804018c5mr2091268385a.14.1788777523097;
        Mon, 07 Sep 2026 03:38:43 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5941cb6sm1280275e9.4.2026.09.07.03.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:38:41 -0700 (PDT)
Date: Mon, 7 Sep 2026 13:38:39 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: clock: qcom: document the Nord DPRX
 Clock Controller
Message-ID: <jzc45x7mqbcxon227yv6bthbx5l7uicz7susv5kqxbaoammqf5@lr5cxiqrkrfa>
References: <20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com>
 <20260907-nords_dprx-v1-2-d472af3f01b1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-nords_dprx-v1-2-d472af3f01b1@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExNiBTYWx0ZWRfX8LMFB+v+13my
 x+8yLu/meCo8bSPUVM72Cyek/95rkN53u2SBXoUchZelBsYeSL9puvcKscju9L1wuxLKk570fVx
 gbR5y+7+yHxodH6SR4K3RJPOq7ctT4am1NCmmGxFNiPL/aOyNBsALFpjiDIZv6DbEcqmKgcMdD9
 lhKUePvXhpcEWOZgySkIHMDIVIOejZV/53cKeC3zw5J5g9QwT/jDQ1nJo/tkfvAQc6SaJTw1h2L
 sISKOI6MvH/6J5mRJC+NsL8uMHflWygK4E9B1PO1m3DxnJwRpLYIE2MGcD69G4WMkgyXXyBwho0
 Jr66qCWxS9MUiQ++Dvh7stAXf2DH8STBkKAzQuQoAEHN6lszCbXOs7n/2KwLTUJKMDayCfuYR8D
 +P90GWnF4kBCq17slnteGiasGRHUOjIs2GSbTueNfk9x+Rp4ivEGDXDSfFP0J15rgHnwH6WbvZI
 TgE1mR4uaY7RlDFW5wg==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a9e9434 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=JYGUOujTUg0PU0TV5iIA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: ZwZ1jVINTot-hDxrCrA8g-5qv_EZwg-U
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExNiBTYWx0ZWRfXytG8B1eyxawz
 ZQmpxaYqdNreVJyp1+HM0pJqZur448XyuxO9iAwH+BNIXseU7Hv9dQPtTY9U+3snJ8SubQQkuBd
 XT0EDZO37EmUJYwnOgVw5FlYYqeZrt0=
X-Proofpoint-GUID: ZwZ1jVINTot-hDxrCrA8g-5qv_EZwg-U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070116

On 26-09-07 13:56:14, Taniya Das wrote:
> Add bindings documentation for the Nord DisplayPort Receiver (DPRX) Clock Controller.

Wrap this line around, please.
