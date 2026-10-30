Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793366752;
	b=noAhfgzVLl0pdXVCDOQQDmczQgv9BmwAIkhr4qDqx8DRhja9y8sbCLrWR1fdMuDIr8hx
	 JQu/KBrWmQq3zNfWyfwELcGHe7FeT0LZSmPsCGbd5sP75linJ3Mfp+UF2kn2Z0tQqRfPb
	 XASj+WB6eCl9ne98ugGpPOIfHJtO3NLJC7iKjMu9+Q2ZpKi0zewTeGJ/zKGfe9XpyfePn
	 bO58CQL3EpM+z+dJkxCKndCa3ulmtdtIEsnUisfw39ny5ZvfPlQtTaYdNLi9hhQyAXHk1
	 xZP5qYJE7/WfdVj6NvdNO4ABn6+Suk4p3UJG8p/0D3b/80jVZ72lAJCIiP45dNCK1hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793366752;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0yIqH8rTlsuDq51lfs3vb+Ea8wfpWG7AfZ/9AnIdEPA=;
	b=NCGUo0+e9FltrKpw+zo4nWa7pvTho32sZmjTPVZOGHdIoYwSQONA6XOYxlgfIaeZ3Uhb
	 lym5k8pItKEDqjOlLRZIHy6yPEiomV1IJ+QaoRLdXQNVBvzWAqPhQqHuwTk437PAy2Qta
	 szvvk6A1/Jbk8ZZiiyfntTY8oM5GYEHJArc1QVg4tJxVnWQsB9mCNUff/Dcql8bZNsawr
	 oc0UBNtOb/0NEsWbSTdO6tqPD6GGn/BRw/P805S+cWs9LDIp3wUXHUyk81JZSLC0GlQk0
	 unrlvbyAZbbJs05dlLcoWnt/VoBUyMn1Ju2XuOf9EiAQYOI2hHgMfU92Zr9Vq1GgYQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lqb3YdlU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wifqwb3s;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7E1606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 13:25:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F7E1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lqb3YdlU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wifqwb3s
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBG7J82541611
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 13:25:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0yIqH8rTlsuDq51lfs3vb+Ea8wfpWG7AfZ/9AnIdEPA=; b=Lqb3YdlUdtJ9/KJo
	a4yn+zoXt2PLvRgt3UPxWwqw5hDaNNs2+6xwGjoQHxn4X/mb9OdIAIICS5CKBvuG
	W1k4xI7YO+zq6xtME1jSz07aFlJ79wQHal+uGfe2kml6ZUerMadJbMQt/AQMnp9I
	TI6ewCumhvBat1zwqceQQgtDTPepv2Ho76qEKvJZfZxYJY18UNjEpEXMUlgjoNJq
	L10p4dARgs2QOfA2L473WCto3Y+k1Q2j1NNekzKfr3BuGGZLqihpGc2lWeJ7t/mw
	zQJt0eYOyXb43lxyJ0TNWmkBEm7O542o5omeC6yi3F5SmRZPh6hBYA0/SvMz2Oda
	ib2JPQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qk772-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 13:25:51 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7c100f6f8ffso19449137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 06:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793366750; x=1793971550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0yIqH8rTlsuDq51lfs3vb+Ea8wfpWG7AfZ/9AnIdEPA=;
        b=Wifqwb3s9G2m8ct1aNhSXLA7QSLcanRFP4K9/2/6EEombhyp1CC7e+xh/4suRElOoK
         Wkih8o3po4+GSSgrLdfJOHokw/N9pRdLg+jeIDG30fd9VHNymiIZ/LBOxJ6aV+yYbODa
         YjIoscZu66bP7LRdThxGLHnIjlGs74eQ0a1TzL7vAR1RyD+N6Lkc332UQh/z62Qp06nz
         evGDGZE79JZEaM/VmFTeGD0ZBQk76arTYteQImyEKvhX/rClWXsMGNNsG6E/7oKQJFQw
         i7Oq8zZMaq425N/Hl54bqMuRykfY+i1DFqYLf5j5edZnnRbjN6s2S01apDy3kgboqpG7
         IoFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793366750; x=1793971550;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0yIqH8rTlsuDq51lfs3vb+Ea8wfpWG7AfZ/9AnIdEPA=;
        b=jrKZFsdwd2KVbH3RU+UzX3iQBWpXJoHWj23a75cZtUhkwJ6g/+Rb8W9Tng5GFC4Gaz
         ek+VOQSn2+aR3twcyHeN6uFVyqox405ZNqLe1g77FnIBJun2yIKbdlsnfXXGaoysAnNZ
         WfCc2EK5StIh/ReAc1PR2hfxBDfm7LQVr4Ka7LzFN6ld5P+p7zrAYbOFbmPjAkYpxcxy
         9yTdY8gV8f/dmKIRthd7rcFvC+BTTeUTiieLmQOCgKHMP8BrcS0e4m1OUNqR54+6zt/8
         GHM5NV43qPOUGc+aox90vScyKCL/u3NVgx+wapTSbECh1bU1fX8nMAeFjnciWM1Abs5h
         orTg==
X-Gm-Message-State: AFq9FYLVRXAPA0h9tdHsLl9yUPJ3D4ZwnVSGu1j89TjxH3U1Atoozkmk
	8M7R+qEBs8qhraWcoW6OByydBmrlC6eSqsXF9KQoqMFQG9l7PWDLYV+xQFX9UGqpZRzAQrzmEMb
	VeCeSVT5nhObPCRSfGzYeYkXvjOXemaor9bwxH0nkQKxZ2IJlezWuDrVSsE1ZCufjb/tv
X-Gm-Gg: AYBFou0z4eh/cmx2z5QWQga4oW4MTRafmtbu8N2W2ion1Qq0hldhCBwtM5+fL1i/du+
	dUahn2gqbERqcWCOGYsMGg2qlD0pVC6/BgiSWQtga65W+DyNrUvU+yLFDmZBkktoGmwqHtM+Fdv
	tHzNbl8vDm4Tyq5FqlhZ9Ws9a6iUb3PV04aByRM6H66bxgyhY8ruEhpKZcHe+jAK8tKWOzuIXSc
	33dXkWmnfpZ412UnTY1Q7V4E2EZYBpF1qJKeKuAah+a7PP5i/uS37g0Mp7CYjjnZX2hOdyiUav3
	AxjoDZJPfYqF2RdzVZi4nuKCLFwrYY3Em7aUX1IsBlbg/lvE1De1bYEqAhgeqLPGGNb97tYwQo3
	l96Ap+SrsInkeZq7A2/zEqZAD5wNvobR5w7+mhHqHhRA3+YjyQNbiKNcinLft9hCycCzzZmPr
X-Received: by 2002:ac5:c7c6:0:b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ec68998269mr1126385e0c.5.1793366750316;
        Fri, 30 Oct 2026 06:25:50 -0700 (PDT)
X-Received: by 2002:ac5:c7c6:0:b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ec68998269mr1126352e0c.5.1793366749741;
        Fri, 30 Oct 2026 06:25:49 -0700 (PDT)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfdc20sm65493966b.19.2026.10.30.06.25.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 06:25:48 -0700 (PDT)
Message-ID: <70997427-6dfd-41ba-9afe-b2c556085de0@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:25:47 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] phy: qcom: qmp-combo: update offsets table for
 x1e80100
To: Tapas Rana <tapas.rana@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
References: <20261030105515.1948430-1-tapas.rana@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030105515.1948430-1-tapas.rana@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MyBTYWx0ZWRfX3ha2PrPUJdsL
 e2z+xdBdBH5FMiYBlTyRo2rPBNpohfpvSxLSFr8NmxQn32GFnJhkUCLRA6ncgB9S8nkF+qwakUf
 Yd79mXnirvUZNlIWks41E4Xa4zfnpoC2R6ko4r/duBgt+rlxuS9Pw02Eg11jtla92f8WOXbte+J
 Lh8V3K4bGSE9wl3lwiJEIv25nOGwJJESNs+imSsA/h05cYToOBIoWqa441Dr9JSTgDiEow7kALr
 FycxzFUc78lzh//3iv+JXdUTG2XGCXkPSN5MFFIXBVZ3MpIRmYaOXR3wFuA3yLnq0iHphOuXDSH
 nNd8xv0wVCsdzvnYmHHNwCc7jbMTklXubexkFwTZAqOteygL0QBDGyqpiKxlan8MkpdcGydWBrF
 JjALgY2/QZPU03Rj+ndryA0qpLknf5EEvL37I5T0l3ifbKgODVhqyPShsI3j1jHWyNKlwRvM5CJ
 h55TwM8LTFPfJhgRMQg==
X-Proofpoint-GUID: miblntAZrsP7EskGxt-Fzft-ylDTs3QD
X-Proofpoint-ORIG-GUID: miblntAZrsP7EskGxt-Fzft-ylDTs3QD
X-Authority-Analysis: v=2.4 cv=IumL47/g c=1 sm=1 tr=0 ts=6ae49adf cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=0BQXEinDYilFB-d34WMA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MyBTYWx0ZWRfX+922aqCKgaxr
 q38fzr/e6BHGrssOgkOgTjkWomAJI3xbRYfjEgF/5ulvK2uBs06qgHbVu9pYeZrun1B/tLb6FBU
 bRuprJ5SsPIOxT9cahbmhtbfJllZQfs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300053

On 10/30/26 11:54 AM, Tapas Rana wrote:
> x1e80100_usb3dpphy_cfg uses qmp_v6_n4_usb3phy_regs_layout, which
> places QPHY_PCS_CLAMP_ENABLE in the PCS_AON register space. However,
> it uses qmp_combo_offsets_v5 currently, which does not define the
> usb3_pcs_aon region. As a result, qmp->pcs_aon is not mapped and
> autonomous mode falls back to pcs_misc for clamp control.
> 
> Add a dedicated USB3+DP V6 offsets table with usb3_pcs_aon included
> and use it for x1e80100_usb3dpphy_cfg so clamp control is performed
> through the correct PCS_AON register space.
> 
> Signed-off-by: Tapas Rana <tapas.rana@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
