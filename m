Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831515;
	b=xCOAIXFMP23fyuIMvmhLWR20z7Lv4o8y1Hlp+Jd7WNyx8y2ou3QMFEoNC8SFprvNGtLf
	 X8hZTckNpn9Cj/iem8diPl2bzTGlyAGyS8t106dtW2x7D4uQlmlt/3e5EpiPn/YLv3Aq3
	 P09Qqhra6UtUBbnc0O3kDzc0uhbjY89UmXmx62hk4mT580iDyJyT0hNOJBNqeYWI3Saw+
	 kshtdKJezkE8JxXJsFNSzBu+SFRRRcd1o4rwk5afpcZV1di9o9KhuTNM8JeHCo8AO1vAK
	 aOczPivJ9RPCeGyWSgLvWdYqVb654YHImFvLaqmQR446ikFJNrIYnTaWZke3VU1FKew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831515;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=S4Fp7tclci1zEOeCx9GxRlSEUAEzcSmzgk0IZO9SGps=;
	b=jimJAaIxqy5z3cWKC7Yp36fkEi6qx+Nsl8cgGbhAqetsNNN1F3kIreg9JwnvXIRU5PV5
	 UxBX+zwVPhxqT3/Yg9g+k/Bupcx5lB3hMrSZBXJRWnVJq0nJcqnHdXbQ0oMzxXrQp4BHB
	 bnWSgcgcC53Hs3cLCzc7HX2vS+2skBCUQ6fPLLV4Pe0+UeCl1+U1LQIBSFvr9tY+ihZ3s
	 4FyKA96hFfIHPNj6Yf2wWhG5DoFFmxWWkvr3qpZ4rlOUqvC80igeScOGY8V5UBJF2aIM3
	 n0qKY1oq251Ql8/i1JPt4mJcczimGJCQDAWEsenHcnL3hnGnUhMle+vS7KOF0CKM/wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d1YGkDnE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gY1g7Dmz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674C8606A32A
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 12:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 674C8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d1YGkDnE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gY1g7Dmz
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC16oA3770812
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 12:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S4Fp7tclci1zEOeCx9GxRlSEUAEzcSmzgk0IZO9SGps=; b=d1YGkDnE2B1uZO6w
	EfxsjoYCvgCpxAiSilzt1FrP1sxMxee9mD5Ol3p/idGp4kiwr9VRukK2L/212BVq
	rEE+CvtXqzkRC7gWezH6YRTQl9LpBWs5ugXCOSSMxIKGd3T9UkkGQ+EQuITFChQK
	w86O5wQlmq5jjlCACS1Oz5TiwUTE0HQQn3KZe2fsnLx20bFPAhgWnHfdZsCeU0U4
	9/P5Yt1D4+k4X6NjNtRoAS/tXbehhQjbpQ011jgwYHz4XDTzYwgc+8fiZyT896yE
	Csaw+LBfxwClsI8yeBz08ON25eBpWefHH357eu3ywc+yMqinmOW/y3XPfdBU0ji2
	S+kuxw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyy6ggkmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 12:18:33 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cde00369ef5so510357a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 04:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794831512; x=1795436312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S4Fp7tclci1zEOeCx9GxRlSEUAEzcSmzgk0IZO9SGps=;
        b=gY1g7Dmz5fKSyoy7NTCR+hLfEyCJ+wzFervI2HnNSk0NFkPtqkzYt1RJxfwy0pyzYb
         jvkh7mbeZMSd8udsgLby4dA8U0UVQBYvSMneDudq35DzLCcJqt1xCPpc+1WgxvBlNoSF
         HaBrIuY0yIYABIRzDWLjVZqjhDnsuaC2Ct+kbC2Oxb5gYz1g21UNR8dUeC3/huGe0azF
         4n9/3v+ATcKWcVy7LHhLw+NbVJXcD56XPxvxiVKWAt2fBIxLYDRLJyqTGzJmqIcfbp2B
         OrKwDiuGgLi1FH0czB3nqJsIU0fi1/cXtzve1ZbbU8zvp5ipvtonKYqrj+0e1BR4lLI6
         RJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794831512; x=1795436312;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S4Fp7tclci1zEOeCx9GxRlSEUAEzcSmzgk0IZO9SGps=;
        b=RCG/4K8JfLRHJ2Q9HW1s7AOiSox5CPnRYQSjj/XLuYhv0zDd0HObuyFiAf2jKKtU/8
         +StE5kY0J1QYEZ0pj3+2fvI0Y3WtLmwLxPvvTRdMbxEMinMoGJf0J9xHlaA1zyqhUi5K
         +LdGQAEmqp7HDwCTC0XrZ+hvRjmls82p1ohKJ8BZRpujhDy/jNex4SLpoXVnL3f0i+/X
         BmDO3rXKCRvhOypJWUCk2n3v9tqm4r7aNr7z30Arpd54kAj1FTqFof5HScFHCNBYV+Rj
         lLKCE6TTASB9BaweCkxuSxVFat8ctkyFRVO2UDZZQIB2Uu365EwuAEqk5RFcoUphbQvQ
         cH8A==
X-Forwarded-Encrypted: i=1; AL+hErFVWzhRO2DpbmPGsyqO/5syVYahHBfTGHdhXqRQ7LE7yOYDFBdtqT3XrmQpcwpaEM80CE5pJIkNEQF3FrKt@vger.kernel.org
X-Gm-Message-State: APuU4Z+hIwkal41/CPFSRl9PHIKSIXQcazBLmZ9TGEWBySiF4+xMKv5r
	S7/XEOniOQPM8nQ3Zdn41olcwc6j3yYPSt/pp5Al8AoueA8alyOP3kxGmEaISuVhZV/iMJXm62H
	k+6mfwcUPzqgA4csvahUrYuqlDKsmajSbqO1oRkbPYhP7ugyU5ANdzpVmSdzDeFpsvBdq
X-Gm-Gg: AYBFou1o/3bRKbhWjXdfF80YxnfYTBmPxRdnGxCkDkpYszexvk+V2WrnA3bA71dl6qC
	8c0X5iHXzFsKGdsd1dnc1Oz6BFadhl4oKPrghsQc6Bc+1dx6/SKUhaT7I15zahN0DK1rN3KzuU+
	2TP1CHEqgF4Qotj4kJbSkDdtuaaLntp1bVwb+NG/nOhHWkGeH7Be4FKb3blkVtaYqwxFDKxbzc/
	RsugS7Pw89PUyCox/uGxMXaBBRetYxs9AKumpQYfjudwSMpaSfLBzycmLUE+ySJ7wqR1bgk17XM
	XJm9dIUHZ2hMStAPXJLgu+ekNZNlBVk+M77xt+wWxU+9X1BoewPy2lciJK1uA7Nvnu+F7zmVifs
	gElJfqlHguqmyS1G0S9dXOj/fmVUIZkv35SdT4GX4b6QBtStacvKkYv2ProRPjFw8uqxU/Q0Me9
	Fijg==
X-Received: by 2002:a05:6a20:9187:b0:3f2:e26d:a96b with SMTP id adf61e73a8af0-3f7a4eb9173mr10268489637.6.1794831512186;
        Mon, 16 Nov 2026 04:18:32 -0800 (PST)
X-Received: by 2002:a05:6a20:9187:b0:3f2:e26d:a96b with SMTP id adf61e73a8af0-3f7a4eb9173mr10268463637.6.1794831511749;
        Mon, 16 Nov 2026 04:18:31 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc1898afbsm4145008a12.19.2026.11.16.04.18.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 04:18:30 -0800 (PST)
Message-ID: <de0bd55f-9b80-414f-adb6-eece067d92ff@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 17:48:24 +0530
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
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: media: qcom,glymur-camss: Drop port@3
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com>
 <20261113-glymur_camss-v2-1-b1b76509c744@oss.qualcomm.com>
 <20261116-vegan-amphibian-muskox-3c8a55@quoll>
Content-Language: en-US
In-Reply-To: <20261116-vegan-amphibian-muskox-3c8a55@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0OCBTYWx0ZWRfX9UGWXefHj3uv
 Aodz7/nJahQ8UF6sfFnt5AbJEu4O39RcxpANGlsSqR0TGys7hmT+QJcEdXz9YTNbEquC0ssosO6
 SOG5spML6Nc4OnPsIfc1bC9ByLDDgMJiodqvhUbipVt09hQLYTqeBPdUEKBOvYDcDRE1z0nVX+y
 xYGIQMhbFLHu1GMPIDjeOmIij2b++OipkWRzROVJbXq6T0NR4WgFGMF5Ol1+gRkCU+aq2+pfhFz
 UwPnv/IVWzFBSmA1o2h6c7hec3cFAGJhrnw2lPI+fFwveOK2d5z/DOdx6ndnrraZAuX2AuY23/d
 573Kf1CJWMOFSzz3ioi+cHQsnq92tFTjUe4a4QRqxT+TkTwDtj7WHltCEN+a/sTRPGwamZ2XM2S
 RAgM2c8jjKwBLtXBWRFAUOoqVVuNdG7gcS1rP7PYbYaBjIFfjRgTkltEivFPjUtvuuxTT6ZPn8n
 962taysp1wobxfgpCkg==
X-Proofpoint-GUID: 2f-1xJyOfHFWgCp_DoJfNIaoq4DTG3Xj
X-Proofpoint-ORIG-GUID: 2f-1xJyOfHFWgCp_DoJfNIaoq4DTG3Xj
X-Authority-Analysis: v=2.4 cv=D/DSufRj c=1 sm=1 tr=0 ts=6afaf499 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=LbPuwnihYiX5_xJIcoMA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0OCBTYWx0ZWRfX5sdD9Sf+/t0O
 gQPWkexFFigpVu6VmqFn6O0gJE7LWjVC6RXm0jz2ZDfopa1pAP+RbXjSe0RSQxVhPRCQNABg/Yq
 V1d5yxJzUJ4gJ+sNAy8xs/58dsezrBI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160048



On 16-11-2026 17:39, Krzysztof Kozlowski wrote:
>> Glymur has only three CSI2 PHYs, so there is no port@3 in the CAMSS
>> binding.
> ... so this was never working? Or was working but you change something?

It was not used in-tree yet. The existing example was wrong; this patch
fixes it before adding the Glymur DTS.

Glymur has three CSI2 PHY connections, so the logical CAMSS input ports
are 0, 1 and 2.

-- 
Regards,
Nihal Kumar Gupta

