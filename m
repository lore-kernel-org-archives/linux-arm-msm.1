Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792992756;
	b=gf1LaVE4moHGwaN/IgeDMnyhLdhJkhVnMVf1k1NYJC66hwsRRWg4DIAS8eo3uYu5TAtW
	 OFV6W2zgRpT+KDg/Zmwvt/SQJf3rrjEkWqUHDJ84CO8+rkJ71zY6nEtpJvpY/wEISIkY9
	 u1NQRnBtZCyLehOaeWwPazaUlfqg3KzSoKdxY/Pg6nO69ped9Y/aLxNyZUM7Ds7YP++ma
	 kTLzi5xcVSCUy0u0ZP7x01ClbBxXHzz/uHegJ4Mds0x2p1nkraSIP7m/WCj2RX3vjXs8s
	 WJkwQyUTskXfvkl1i3CS0QJAanvdGURjuvnG8x9elmh3JZo1deJn+Z/+OD+dlTLQ6Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792992756;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pW1samNYYT64bJe09RAe2TapYHj86RTpjxKKlwrWwCk=;
	b=qlxtFe2j8welEZjlaWNSCYP69E5ijS0OLVZfQbWaVmNbZNjo1RkjmlMyFttBWGODd8DA
	 YVVQr/Gg+c4LxM9bfWOcS04c6DJEE7p4rFr+iwCkUUoVOlP3XCnXKQdTBCvnCVqzM2r1l
	 dmeXKJmPPQHecIhexFyTZF+Z60ypsK0l071OFgMUzOjAuU2GlFt0+RvFFU941B6NPyYkj
	 9VrNqeqibl3fAtaApRfLDQquPt04nxCLEPC/dAVDHHQQ5Gwe/7cJpqmklunkCPcSZ5PCY
	 9qRS99AO3dCV7oTikrnMZ3N+IbXxhaHOdv5bx1uhwwQ5u86AyiCrWJMOn8O0R9PN8Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=laYZx0k5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SjuJLAi0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C39606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 05:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0C39606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=laYZx0k5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SjuJLAi0
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4arjD3303594
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 05:32:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pW1samNYYT64bJe09RAe2TapYHj86RTpjxKKlwrWwCk=; b=laYZx0k5KqM6PnvO
	RGu6cyNnyeLJgzKwlDEdTnQgcq/Y4sjc4sRnknyRgAc9JYmnd1p8XBqr9xZK+PV1
	8vx/RKGXni6cpjgJyURTz9ejj0SrHBiWab0RQ5Y4VakrKH+BCXCrLjTVUx5xnV5p
	CyMvwkBTuWFo33OMcQAHgPw/wYY/divzGgo4Urrs6NNb78aEoslHtqrW5xEw5Ud7
	gAmOwlepjnUHb5KtqdpgsGkHCn3hneaCQtcX6D8KK/zNye1k7HwOpEWPzoRN5uoW
	p2VL3tmvv1Wci4tfQabZx9CbiPSJWAKyJifwfxrHhO0KkhuoWKc36w9OuJnl80eU
	Hk/E8Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkmscywq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 05:32:34 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a05b68f851so3318562b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 22:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792992754; x=1793597554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pW1samNYYT64bJe09RAe2TapYHj86RTpjxKKlwrWwCk=;
        b=SjuJLAi0cAf07GR+2YrNmh0X3mhGa8B80I6X+2VDBcEGwSkFGzrWVSWmjHY/qo7E5T
         zyOPnEh6pOM5pRvMURhZVDDTYXUh427CN3jSfbfaVMeN0dlLZwMuhf9kSLZE+SIZG2Bc
         TJDLGOVB69bb9GdmEPtY6AtMa93lo8QLM85D2OvfhC0gWRAcZECEONkc53ZFmvUMA9n5
         fjyiWSaFJRUNMEBTGQIXjjd1nZOdsGjIOkqrPQ4v54e+hgFOaaXE0HFOA8yW767VaYIO
         T19hqX1b9z3KjvpAhAgpM5obIyo+RCJxDCmpH22F1eqrjMe2iIR7eeMEzr9ezNoWAGdA
         socA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792992754; x=1793597554;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pW1samNYYT64bJe09RAe2TapYHj86RTpjxKKlwrWwCk=;
        b=18qwmwNh/DV5Abi3vkCm8IGmdyIHClhcvuSseVN8lCRI48Ind42Q6t6j+h4DSdad1I
         VS41qCYcVtA2UGC/7pVaeIYLSpF+DtxiuJZQisT7nJ23NARdfIR7YUkxUrImIPmbpexs
         mSIfCOxi5KYcP0BL4UClkbgDS1aNZXU6bNmjBGCy/uGb/VHv4IL6H4DxZiXPhJHJxzIJ
         4nlKy3UvSd5iz61ZcFoncq0QkhRV+dO4OD6iZ7kZfXAdifa6TwSD0LiVIz80IZGJdhVu
         60evkYeT+qH6i9IeGb3swIN3xVhwk8jCy1+7tYEGYIChqsgYAUzXbQFtbhUfCzL1wR4a
         ZCrg==
X-Forwarded-Encrypted: i=1; AKwUvBxlCaygRdh3hVIj+/P/m2zEVC1TC21cISpKd16ooYFGNwAN2qS/+//5hazegV0CcUqiF+hr9mUFYcJ0L1jF@vger.kernel.org
X-Gm-Message-State: AFq9FYIvian0OLKcK2EHoGRad3iY5B8srqwUK4FKTJpR1nHPx1F2oHTO
	RLDKohbhmqI4qeV8HllJKDudRj1vInEjXMRIE5AOasw9uoodDTffmJSuzaPQUzAOCSUcBs071Q7
	XIqVHm9siT9VsccCcjZoWZ66QWJlzbIxQVuYtzrcT5D0tDvPXBRRor/pP+FEzQEFa7FGK
X-Gm-Gg: AYBFou29ciNjrK01M+FBFwtTmKRosXyT5C7JlWwjPMMQaMSQab2uF6wNiHAAvzFhgP8
	yd6hYntGu9AE+vH1lbRx1ZuUc+e6r3pehZS2ccEEFrYveyMb007JfXY+J7w5p3sDx/7dwiy7W1U
	p3i8Nu31d75xPEojzSnm8E4PBjZpM67guS7pkMrdI0UkQrIkss4Z3NCigEodk6cvxmdqfluEJQf
	O/TgCOLU5T/Ap6J2cLdbkZiENYprzBN4cYb+7c12SGCX1vTXaNhYztEwRRFEje0O3hFT2lQuXJW
	F8p8zGdpc3uWSHouByPRVdI70jBtHbsuY9iW7BFjlXbebzgmccuWQcu+c7DCtc2lGR6Zs89Or8U
	q2FxpqpxeXp6KiFDXujepQcQSOwqC
X-Received: by 2002:a05:6a20:548d:b0:3e1:d72f:4128 with SMTP id adf61e73a8af0-3e7c0f3df1amr4025290637.32.1792992754223;
        Sun, 25 Oct 2026 22:32:34 -0700 (PDT)
X-Received: by 2002:a05:6a20:548d:b0:3e1:d72f:4128 with SMTP id adf61e73a8af0-3e7c0f3df1amr4025281637.32.1792992753812;
        Sun, 25 Oct 2026 22:32:33 -0700 (PDT)
Received: from [10.219.57.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8cccde306sm1046860a12.30.2026.10.25.22.32.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 22:32:33 -0700 (PDT)
Message-ID: <594e0a9b-32cf-4b0b-99ce-a8e92cef580f@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:02:28 +0530
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
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: sdm630: Remove FastRPC compute
 CB9 entry
To: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@vger.kernel.org
References: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
 <20261023090308.2898683-6-abhinav.parihar@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261023090308.2898683-6-abhinav.parihar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: htsVVIUJS-Pd__y8t90aMge6nLAOIPI9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyMSBTYWx0ZWRfX8yBNizggKfSZ
 3GRrCwEQFmxhul6SQVl58mnI7iT6cV55NObDeQjVQPB+Wi1E2DWTeobwToTzdIcvPdrK7sB8rT5
 F6wcPd3T3CHRWZgjc+ye2aJFJkP8+StgcKF7XPSyqv1AJCEe/la1qxWuH907sXIM4YyAoVp/x00
 4aUFA0QWHK4Ab4ZbEhv73g3oqhnttYH/7MArToFd/lOktkEfCRCBJyIVWbeEWS1Z8bBZcX953Vy
 qewoWJQuE+20/hKwvZZajQ+yRAJxkBqYzcQcwqwxpFBVgw8PMbvBAXa2z+XEpmQ7FtIundYFRGz
 li0osnQgV6NW3HGKsjPalyFuKFn+Ml0jPXfq8nN1yJNAmzl79AI6s3AwIEJSIZsW1AdAhsLJ8WR
 w8qpiinHUoR6UYhc54blBGkPNcm7Y3Bli4aP+h98iKGtBrsA7VFuS7WIyUSeL4MlbzcAAsDatTP
 Zq+E6amc2J74JkWsGvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyMSBTYWx0ZWRfXwLnOG7iDHbhD
 9Y1DbZJiO6BJaFExSRggc1nOT5Vn9JbFhP57WTEeDRfzsE7dprLraEqrkhua/mzeYLIrVb7iM9N
 AkyxLFl4vSU2XdBzFPooX6o95f+qxu8=
X-Authority-Analysis: v=2.4 cv=UqX2pOwB c=1 sm=1 tr=0 ts=6adee5f2 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3XWmBZFTJKG1aVtgwM0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: htsVVIUJS-Pd__y8t90aMge6nLAOIPI9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260021

On 23-10-2026 14:33, Abhinav Parihar wrote:
> Remove the compute-cb@9 nodes from sdm630 device tree to
> prevent clients from selecting a secure context bank for normal FastRPC
> workloads.
> 
> Secure use case support is not currently implemented upstream.
> 
> Fixes: e8e1fb5c703f ("arm64: dts: qcom: sdm630: set adsp compute-cbs' regs properly")
> Cc: stable@vger.kernel.org
> Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
