Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497117;
	b=mk+oNSZNeMVyskkUNu2B7kRVDjPd+3fXZm1/7XYw/NF8V7pm2Rjqbiw8V8Qvy9hhT5yU
	 m9K6IDl/lrq78+i539n9sRmOKylS7JguTBOihrwQV6lZJOkTAjSbLRQv7tZVAqeZkxgxP
	 QECIFSCbzDEnt+/v8Y0Sl8tMzH5aHVa2r7Tx3AUXmaCMY/EiiFk0Zf7xAOyJSfcig0tLA
	 2LRQwLZLhLt8xWl/domGdioc366PUWK6ZDxe+jSb/IDYf6pJgyfig/vqmHI3Prv/VYHmh
	 DEnY3Fk5qiAYnOamQoNzDCgdMOA0YvkWLq+XtKiRyCvTSafLeSKlNMvEar/JOsLzmfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497117;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bIxwVXRS1NEi0AR3IRYPkDzEWOJgCJswm/SJxzIhjy4=;
	b=s2j6vvY0md1a2YoE+SXdIT5SbRFvph6hj89dw/iiB/KT8h71zstjV24/ZS4bXrBr3Xac
	 ess4ERfcne9UqaaEWYZfcmF+RAxo6VJuta7Uio7LsoTW2JP62OiezTafd7Ku1ii5jJpyf
	 /sJe17CO+jlKGPhNIaH4aJsB+08L8m/UWaGEBTFcJnwlxviWby1tH+JXyP5ily0xfJNXI
	 NzxO21FOJ2redSBMeWdH5TBiCV8HJgzLPHZ+LyxrfffOHeV8ZYzbhw+qpNgtUwZW6CZhX
	 uSJvFZP1+lei0VnG7hreeD4LbnNkYoHqeym+jDVYzkA6EnNXeYnS9uPwNSx4nsImzsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OXBI4RDV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j1CfymQj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BEA606A322
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 11:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91BEA606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OXBI4RDV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j1CfymQj
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAx6Vu599804
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 11:51:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bIxwVXRS1NEi0AR3IRYPkDzEWOJgCJswm/SJxzIhjy4=; b=OXBI4RDVrMIHXvsv
	UER2PYbOqCXNRRkkNoJEkFVWQp/oA+UcFK0H4qVFv22FG7ECbZKiJGWibfdRUh8f
	vh0v6TBM8sic6kqWNiWTtJ3mp6SSEb8a/jTKwc+uuZHeET/y7sFSFJ3FCfzNMJJ/
	wjyGdtsUCDmmO2Qp+070aCX52rWdPa9S0K9nVBo0xHZhzHUyJDGC1V0WyO08W2gq
	VXAwKR4pY5G05lporJzV5KHVAA/imLqO4V88he+vdzByvnXVHZiIHY/1f7Yl69F5
	CzM5RTCv+Rg/G2v49UZgQtECaewTgLv9t6M3y+7UTeW2PbfICFEDXZlD+AO0tykS
	FydWHg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2a0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 11:51:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea6b66e53so65096685a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 04:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792497110; x=1793101910; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bIxwVXRS1NEi0AR3IRYPkDzEWOJgCJswm/SJxzIhjy4=;
        b=j1CfymQjJMTU2zsjSk2+ozhq9e16+313e5JQHYpV1iEfMMW0FMeB+ItuexTIxkYuiF
         thwwBlnIsF5Pf0ZDvDZ3H8m5feW+lg0xiu8ZQRTrCL3xkT6Rdh0VCBa+xCZV65PALDVz
         bqTJ5XJb+s0i3ELmGE+FHRILBDa3h8AeRi6+8eaKEMZwOoxHb4xyxLf5nybnXn5pJEWR
         afX2akrNtTesYUjmOX0Obf9DXl1jpxR21V0CB9evWLt5qMsSalj+7qMOnWmonYfoAAYj
         h+lEuCOnS1Bnuqc138KUjDq9dP8sGueUmfj4W1/tSt0rHECg8vVpdUnRj3TWoMhWlv5c
         Jpww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792497110; x=1793101910;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bIxwVXRS1NEi0AR3IRYPkDzEWOJgCJswm/SJxzIhjy4=;
        b=po7MjzynxdF4392UM7TmkjaS2u1GKfTSZy83cWYmludP7jBTALk6yaTtfVel2444Yr
         5eytr5HpOqA3QEl17HyD/df1Yai6lUNdAEGge5AdcUVczDSZQgP1ahBn66ZO4D0a0d+w
         B0BYz3Gs5GTAWqisOVHQBpck1cPJ7O4UNiaVL+mfWR4kRUwMbt9BFmZ+nnbCEBbIODwc
         Q1gz8kLxpbB67R6CvPJDgHwcSvJa0mDjHa9DyeD8ls8SPlUZ+ji8y77+A50VwgZnCW4a
         SuuHWRvFWpDbyYHkqyyDB5ApQXSnfQ2WYspd5ZidwnKddjGCi533SV754BfXk69f6Cbs
         S85g==
X-Gm-Message-State: AFq9FYIew382EY0xmMC89sPheZzr1K0gAAhNR0Stbo5lmp9fcku+Ig39
	n2KS8ldX3U9BrHHuCyeptOHJEEsUgcpW6/UdvAY0bB9Gx/o7ydk8nn48bFBf1y6RPP8ADUcRi4i
	qvRFzhyC0BXuBn8Xoo+sa57dyo7tENMTffN0pJ8oWdeFLUHZrlSwl03vjhPPbLMZ6stwh
X-Gm-Gg: AYBFou02UNgC63UNVWJgmV//3xZSNpEZTWDhoiI4fMJJFuh1Gq7RIDLi52KFf6sYvjS
	iWbF4BiIinq+ARlJ70hcBH2idVUebQpG+nFeslq9ziUu57rjYHK+QGVOCpg4FcMHdYVU7bolwvf
	6KM+JY8mUfAePJTyJ2LxiBq8EXgiOpue4ryU78I/E/ypNydklZ+tozaocmjT5EZi1uZL5WeeGtl
	CbLZy1x6XlY1jlufXIWGrTfSDqm6d90k75cjheHc5MLdBrK8BJph6usWF++xlhmulfm+cHvunnY
	DnFL1d/D6qoYyGbfc2jjp0uH4jpdpZDc0lmUeOr2nSXfiJv4gUu/6iVoeH+qJsml3yVV5vO5/l0
	GeWU3SAuzK+9KFGLRbfCnTw==
X-Received: by 2002:a05:620a:3904:b0:93f:977:5d9 with SMTP id af79cd13be357-93f29a13be3mr1863473485a.0.1792497109879;
        Tue, 20 Oct 2026 04:51:49 -0700 (PDT)
X-Received: by 2002:a05:620a:3904:b0:93f:977:5d9 with SMTP id af79cd13be357-93f29a13be3mr1863468685a.0.1792497109274;
        Tue, 20 Oct 2026 04:51:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1e9da2sm5439285a12.31.2026.10.20.04.51.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 04:51:47 -0700 (PDT)
Message-ID: <0ae678fe-716a-4d1b-9809-f106f9fe6199@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 13:51:43 +0200
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
Subject: Re: [PATCH v3] arm64: dts: qcom: shikra-evk: Add GPIO expanders
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
References: <20261001-shikra-gpio-expander-v3-1-d30c1e8067db@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261001-shikra-gpio-expander-v3-1-d30c1e8067db@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aIplOr9m c=1 sm=1 tr=0 ts=6ad755d6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=X5NsFxh-qW33anU7_OQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0NyBTYWx0ZWRfXyJhMKyxldQkQ
 2eerHsAvYv1tNyef+k48saCW2uZIJWiauxEqKKnKr1RhjX72ljow8fSGy2qnBQZWTwtFXbH56kp
 v0CRDT5DUime64dSd8PsdDus/yhrukU=
X-Proofpoint-GUID: CUaSCl9Q-_9cKjkTK_kw-J1QfUmHq0yD
X-Proofpoint-ORIG-GUID: CUaSCl9Q-_9cKjkTK_kw-J1QfUmHq0yD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0NyBTYWx0ZWRfX/bMjNrD4Pwwh
 0F/0joz2WC2QUxMfo5FwxItI8ZT/v8K7YHOHMXPr4zDr5NHtAllMB9Mb/v8vFnPjmbSUY1lkZU2
 ogNH2AuPBwgVK0mVW4hKQjlsDORJeXlNfHDZJbanYtGW0dO6eFLpyQQEx7FgcifLpx1VoFdminq
 qhv2+asraCdvBaD746dVx3BKJGIzjZUVb6svFvEeza58h2m4Kisd6cI0RGhFF8Xy8iUUrFR8h2y
 hLKZgHUcEPJ5aXzIL3tFR4FR6QuWDocEJrYtkB6OqJbRu4mF2jKbu4S72lxiFWaYk87l84BS8r8
 O2zLvUNv0fo/lDh0Ay9oNF1nvaewRy0h/j02eOidWzuLRP6Ri4wft5PR4GnHUONMJysF5DEa0Nz
 gJosJkhMgftyB1eRChpUN2DTgdhSWTerD5oUbo/Txb65KEgeZDuWyCVB3gIM39PcIbFKWZWtJ48
 a+WHd9+nF8R7ZFjTSuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200047

On 10/1/26 3:49 PM, Komal Bajaj wrote:
> Add the EVK GPIO expander definitions on the I2C3 bus. Describe the
> TCA9538 and TCA9539 expanders used by EVK boards.
> 
> Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad> 
> ---
> base-commit: 6c2cb8b8b843d216ab549b678a0d8831c43153e0
> change-id: 20260924-shikra-gpio-expander-25ff4a29c848
> 
> Best regards,
