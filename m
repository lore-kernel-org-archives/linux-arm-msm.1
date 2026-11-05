Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893291;
	b=4aqAg1sYPnzj7dplGo/zcEZDr7sOn6sg49Uei7v8c3AEV0b4RKSbEpgaSXT9kU/V6d4t
	 uM2zbo52gv9S6V3W/EnZDSGLBEbPDZu/1QTEcWox56N1obFVNJcgLsG2J8F9qkhlMWSvl
	 rLFLVuNn58KtZrSQniEHjLAM80iV4TFwcGDTg39lVrVFmkskvDpYG+R9GewOJz0P1Hu6V
	 ThWTrEp9I3JCrfP0UxKuHGqKmiExlAmExlCVWfyRaNdl7YF9eiMTLBmLNBZEUasb4IDI8
	 tzZfRJT4cTbOwOoJNHbeML4+k/Y5qTGq5/g/LBx36bhGiW68lkEDJAdIWIxff4Sq9Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893291;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Awa0wQxPvQl+swCe31Qov+6CjnZ5Z0uiEbtdtcWfOF4=;
	b=MgZ11L8SygE0y/0KEuIqy7Bc2xYaj324aNKcrh1F2DR42vXWqGozc0PThZba/BUAWpIU
	 q5rftHk8N/GEmeEWQaS3cTfXY26n15hN9IAKe25pHDCUy91GDVJfdfew3650gRtkNBOd3
	 RfNxU1iew2Kg3xow2HLpwpIj4S/jLn7zQrwSgq6E2NUd//nvv0mq1B0tEpdKGKjMWGTPD
	 E8cv/NcQ/5kcCT7JdzriyA6sAEiTfheGINgR6cJWY0x9f7TWAVuQn53nESWF4cVlJhZBY
	 8vgavXmPT6w3+1elC2d3fBiXpahG5PZMjhqYz2M031BUS1duiR/hPfmowKVhOQg+NXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jV35Qm96;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IdTZoXNu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992DC606A32D
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 15:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 992DC606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jV35Qm96;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IdTZoXNu
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQ8h54134044
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 15:41:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Awa0wQxPvQl+swCe31Qov+6CjnZ5Z0uiEbtdtcWfOF4=; b=jV35Qm96buL+DzqX
	hU43ReF0gjg3i97yPfe5frMW6EEnCnbpofopePaMSCOyDaiJETNBGcM/+LtODIPl
	+zqdPxnfpyq+015Sf3rcAs90YMRq7Pz97dxSfgyVNnksKC0FElyd2ZGfaCb4cJcV
	qoFXb1qTBaDHymbGe1SA/rM8m1Dc17aXNmOVZxx9HvZRr7gxiK/pJfPQMa3qM5t7
	l8ljIil5whHILqlMlWkLO+U0KkXJoHFjiR4a3YxplPv+NmOlIIE7Kg+Lrai/1Ujt
	QZ6MUkx21fpMEIhA+lHBME0b+1ZLfdLg5jobMLAs+ZXqfGSr/h4HVhYtGkfpE/HS
	Crv+rA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrksqaesj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 15:41:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f3960dca5so15414285a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 07:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793893289; x=1794498089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Awa0wQxPvQl+swCe31Qov+6CjnZ5Z0uiEbtdtcWfOF4=;
        b=IdTZoXNu1NdxxD4uO/gPZPpW5dNNnXrHlBhOkXkSsB7w1dE+pOaZ1HI4rRje0o7Kms
         0oBxIgGBnGExbhB1Ck9e0IRTfcyc/mHiSUhIb85mNK0c7kPC/9i3cGSoh2ToQsevTwbH
         vh6Yjg2JSJQcLOGQlrqzh2F7PUShcfkjmzru+w9qiTEJlwvrqV/lr507E1uspyrTUxJi
         l4KF+cpGIKveQww5hWQ0RmfoKEWGnD5l1CprkzruttM2SoDChBJa4FwQgLpByuwvflJO
         YmLEX9X1sirM8YiIS8dy+zLP4GDNXi39n96h9S3Ejty93Dc078Bxr6kWMlKkmd8WVYVB
         THJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793893289; x=1794498089;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Awa0wQxPvQl+swCe31Qov+6CjnZ5Z0uiEbtdtcWfOF4=;
        b=WMtczzGfU7Oo2KsRD/emuDBEJFP605nDEwI86XJiK0x1UYrBhXNLWd7z7ZWGIgDnTu
         5182HYtLQLWEjjJo7oaMDaUfA9ElCIEMy5rwcPfX4np1KwXDTy5t9J8RuGLdTQvBzz57
         iQU+zj2MzIbJkHOmciAKZrkg+GlhPy8z9TJhQsqBRTdNaHV/Nhdgh4cItRSdrWp/z/g/
         AeWCYPDRWBDwoPfvQQyGT2NMwq2rh8qGTuHw9tq8xCBWQ+8ByD91DUbqOO/BVcmPoRn2
         T5/1thyljz4B5aeKxidvZjssBpfhDEPRPqKWoEAzm0eQuokUPO5DpT+jmqNJS6mEFr67
         t6Qw==
X-Forwarded-Encrypted: i=1; AKwUvBzQ15Sv3YjMwa1K//n59vu8sxGIoyj5gqFtVX9osLhEZICgc1oHQSlcUtsTDZHwx53Q/6EM4pLADBKFN7TS@vger.kernel.org
X-Gm-Message-State: APuU4Z95/vurUkcWI+JrGACAEFZGC7rxrLYpcuKz+n3hDVDYPp9hnlNI
	TtE70xDnqAiiNDLqdhsyKGMXRbvJmZaUKB5rybUrs3cJlpsdczgnSqAFxCI/51iyKgGCVSJvw5G
	qnz0VzEdRrFY3gauLjIYzdI+5ljto2I8ghOBS7Ely39owJcPqB1ZGm5gEFCoQvRYBVGh5
X-Gm-Gg: AYBFou0OYfG/K+DfFNOs9fE1/BeUliiXLRE7mal3HtIdSFhript3MPOKF95IcopLz9G
	0q4/QOjQknvEPRo+9FLWeWsx9TVJzBnH8rGmsYm6vBeJ27pIwYz9g8JLl06176XSnxoh5tc+FCo
	GUSkdfRS+ysTbLLU5Stvsuppq9AG8/K5ILSyBuFKm3JdWEMGKviNakpOLCn/PElzgP2i6Bl+68g
	Hy38P4wNgLyoe/wIlfEvD+ASdOgRUagGlfXSHN9ejM48mVR7Jvmd6iLS2lTV0wCKJwyMMPdHGww
	Cb/LUrzX1uEv5oxPHOvQMnFD5rzUvT85Wpu0uHV7HjfSvjqU5gwY8tWa47rjEoUlFPq2eds8Moj
	Fg7UEy63IWEnd5yWUp0zkvNSoku8ERuxmVFw7tO3eUov2tGkD8ejayIIv3nLITNU59p8r
X-Received: by 2002:a05:620a:3c87:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-94421697192mr2911444485a.4.1793893288610;
        Thu, 05 Nov 2026 07:41:28 -0800 (PST)
X-Received: by 2002:a05:620a:3c87:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-94421697192mr2911435285a.4.1793893287451;
        Thu, 05 Nov 2026 07:41:27 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac94e8bsm1729432a12.35.2026.11.05.07.41.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:41:26 -0800 (PST)
Message-ID: <e2847855-c096-4aac-bc85-386f5502131f@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 16:41:24 +0100
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
Subject: Re: [PATCH v2] usb: dwc3: Update nominal max votes for qcom usb
To: Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261105100626.2003771-1-akash.kumar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261105100626.2003771-1-akash.kumar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2MiBTYWx0ZWRfXwK9Av7aCuiLX
 Qg65jRagL0pcxq6dFNdHexUF36KZuUylp+GLaw/cVDYzFBB8CXdolJ3wgwl0FUYu9NuowS68WOD
 8vyfscrAdb1ZqCo9RYZSa7kbR9KDtOeucYpHCHYadH74O8qYQZ4X2w58fhzjX7ygv7zPknAzZRc
 dQeYI+xZLTXd0jzcqECBDUQgkBB/sE44FsjmRmzHhxHYraPY/VkMl/VmF+o6RiRTEejOQ6IyUY0
 PX1rZ6NdFappKhSz+NSshNQrjUBA+w2ROeHK36tMyeFyhbjcmlC5OgneafcbjjGaDsrNuHyYWdh
 XG+SHLuw+KB/LLHcY9NOnMnPVuQn+sJL8lH083Smhol6dhvmMGU4/o7NqZu/1JokSGP9exBOjG6
 21UmCUEQbCu2I30fGrsGqrL6cGxQ6cF8E58C5FwWuiKz6tN44s5VAnNx+0FGuRNZs8x3fhsFsPU
 3LSJxyjYe/AyLM2RXgg==
X-Proofpoint-ORIG-GUID: xmJk6-20xflKisYqbemCNluXjXHTxdbM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2MiBTYWx0ZWRfX24WXmnAYyJzP
 VZkdNVdeEC4E6b4x4zNuHDIwv2wHZ3dO3YQx5DUuwAbSmxjGTjlu5ietT9++L9bMfD3vhSLeW0i
 mPT9tQ3qy650PMzDa6QZUsxotvb4GWc=
X-Authority-Analysis: v=2.4 cv=CIe/zhrD c=1 sm=1 tr=0 ts=6aeca3a9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=3XAOltBAYhvOEWtE0EsA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: xmJk6-20xflKisYqbemCNluXjXHTxdbM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050062

On 11/5/26 11:02 AM, Akash Kumar wrote:
> Increase the nominal max USB memory bandwidth vote to let DDR scale
> higher within its nominal corner, fixing glitches seen during
> simultaneous USB audio use cases.
> 
> USB_MEMORY_PEAK_SS_BW is raised from 2500 MB/s to 4500 MB/s (+2000
> MB/s, ~1.8x). This ICC vote does not by itself determine DDR

Can we scale this depending of the real speed of the connected
device adjusted for the real data throughput? i.e. if we walk
the tree and min/max as appropriate, we end up with say 10G
wire speed, out of which we can shave off some static overhead

4500 MB/s is 36 Gb/s which is way beyond what USB3 can do, in
any configuration.

Konrad
