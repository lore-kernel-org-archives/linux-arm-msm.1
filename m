Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7EE3C585B
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 09:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787044454; cv=none; b=KwWDOqIHmlyQGNgpZdxgKr6CTf6CPpDxYgatVv0Nm1snxoRdr0w2rFO3u9kj4wVMRcg4hjneMyIbS++YHwcki8o8DYMBkiny8etCZ3qhVrE5ChsZ5jh/lhCcw8xIEgiUkkanyYZsTJXND5T1ca27kUv+WQsr1QrHBWGE6c2VoXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787044454; c=relaxed/simple;
	bh=lX3E5wAWkPFI3DxEwHWwZE7cR9g3fohzftcQlYu7Sp8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XOjt83ysSU4FXCsGxuvm5nW3X0syIq068Bs5q3smjbNhmVBS27OsnuB7xukrKxHkPnP6ITshxsF27KzajlHZZs5HuZKfiK9ZjvTHQZyjH+hBC+jz8S5eFU/qtgcVZFOhXbP1Aqa/DmsizWG5eJ5t+0F4oKK/wdbXsLBOeGot9DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QFokiNcO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jc7SYTgt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QFokiNcO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jc7SYTgt"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BI3X1061678
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 09:14:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6dllsyUPTaywsZ7RJW52PKhRGxc6/NCQk4NlA+DkgnY=; b=QFokiNcOZqq4prMR
	rWT+JXWNUdAODZjG0onFW7g1Q2aYmR19GRRA7yTqCkF1veDsJ4X3tTekRp8hyq1X
	4BBYW5vK2U2k0T8VvQ4jEmMLc5R4LWFovsJlutzfT/2iuolnr+/qCGK1As5nyXSc
	tIn6y9YzcStWZNNzfuD8GECqKgFV5kuAaU+qSWCw5AOTieJrilUF1/cQIpM7NSpC
	ft4XHziTJY3T/ZlQWQj+XJsb3BRJ0Tei6i+I8oj9ZN+rX4bYCTn/4iedgUDMehYn
	2IBmYyIj/H1gN31f77M8uToVnBL12pVZB3MPvAQoYCEReh4a7+60P4X1CSe3aGil
	imCAhQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4fvp18vu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 09:14:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930bd2bfc45so121023085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 02:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787044451; x=1787649251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6dllsyUPTaywsZ7RJW52PKhRGxc6/NCQk4NlA+DkgnY=;
        b=jc7SYTgtDUHj2o3NQapevbnHobPqCzmQGoFDzYHjg/xmEes4jq3t2ZqJ6K3ur16eZH
         GaiyX2qqLAaEp58bWYNft7RiTyt6kghqUxazw2q5CuVOcbYKwayQP6SxWYz8wQhL/mms
         3/cKMRaJoo4KAQpFKXE2Gge8yWBBsbHFTH7EgdHhendVT61dO2CHOzAKhfXYyZkVQ9iP
         /Anp4l4Y9nuYkPrf0usPhQwrs7MVfcJ1+d9RfpIan6UEaCz+97Fh0fdfduFcijHy2dYV
         Y/04B9MqdC4VJ2Fg1B9Jj6ZjPX0bu7Ii7rNApJMwhCw1x+i3NJKVVQ4TTA/32NIG6oFw
         kcZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787044451; x=1787649251;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6dllsyUPTaywsZ7RJW52PKhRGxc6/NCQk4NlA+DkgnY=;
        b=hcNW828gdLFOKi07VvkG8WqxoTQR8USr9774IEcNnoterFABgq7iWEz/EqFGMPovm5
         GlziFfRzyWtqmOrINHoJz626LfXfu1c8fcL+juBoAyC+TPB0ou1/VCsdX4wrC6nIWp5z
         KakZAOIitofg8tcVGhgoF2Yz8zFV3BN7UHn1Y2fWFYOJfPRIjq+p+txjtN2qonIRXPqG
         CHCSRHc0/TlTTSKGri81Kpm55ywpNah/WokpNcyFBxch+Q73G5/dMmMMPfNQMwVhSVmj
         Y6TH+mycHx+Y1pIHVBvlpXf5Z6G9mxiKBdTYCay+JrWbGV6Krxr2kK+wmgNJlCoJ7gDL
         XSSQ==
X-Gm-Message-State: AOJu0YwjGgxe7ejmIvCxVOa84MTdblnEEQD8Nxn5efzc/R8AENtlE6S4
	+Ijf46VYn7sB0t/etqryK0CXhZG3h/z2Roe9iE7Pl8MccFvh9lybiIFtO+HlAdI0g7tsUMaTILt
	4+jZLRce5st8IYc6428dYYECsqgv4PF7Z6Ij3xfUfQ5ySuJG5s+9eM2CKd0HHUeOnCNy5
X-Gm-Gg: AR+sD12i2K9nYBsTY6CD6HaoFOXpC/nS4rDgRmZp8tPAx0r4GBy0xI13jxlin8hKhcP
	HZISVIieNL3wWMpgdw92pp9MHyesZYlUZgFY17zKYRQg+fa3O7M3HJWyVqFgR77Iiv82Lyagtd+
	VRnpvgE5IHqDmCoKtgfyeoXybXNMDNj5cIzguKs+ww1hcTFJdxAjZq06hTjsOxxJdBFItMPm6ew
	LHFJQkZgw1rrmVwDtAd+Omam5xiBL0jV7SPJBGXUN/UZIfiDajS9Z8u3XBTO3BXGEuATsU9en0B
	Lqw0o0sKbj5BKGdSPxxJUV1g3AK91PGa6dcTFxpK82Q4OFdXbqW9G/ZG/r1AsJhfpkFYThAIRE8
	sEx38/8J5jFd8cQEBmso28yQD
X-Received: by 2002:a05:620a:7083:b0:930:a08c:cf9c with SMTP id af79cd13be357-936d239560dmr2241560085a.2.1787044450919;
        Tue, 18 Aug 2026 02:14:10 -0700 (PDT)
X-Received: by 2002:a05:620a:7083:b0:930:a08c:cf9c with SMTP id af79cd13be357-936d239560dmr2241555985a.2.1787044450420;
        Tue, 18 Aug 2026 02:14:10 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d8596d4csm1480609a12.22.2026.08.18.02.14.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 02:14:08 -0700 (PDT)
Message-ID: <f7bdf9aa-13d4-42a4-b12f-9ebc28552760@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:14:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: Refine device support for Xiaomi
 Redmi 5A
To: Reza Kurniawan <imkyufie@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260810105337.855546-1-imkyufie@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810105337.855546-1-imkyufie@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pK951TEdZfZqy-lvuzopu81m_I3rfHgs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2NyBTYWx0ZWRfXxBZWascuQqwc
 lpUfaJANk3YTKsP2uRUq+OZhKNxmyBr5oxfVkIyZz3YMeNipxULsi9oGftZ7yEEEVLnXg+sNi9C
 H3lAOfAl3oXoHQbMrmJXdzzKCat88Bcw7ermGGRvWVrrMZURp7m086GaFNl6vbTfZj9MiAl568r
 ZsjNATAh77sBP3EuQK0RToNa0aLgzLwnkJ3VTpKHKu8ccKSowiJ8KDJArUVNc1wKBpdl1j7W3My
 S+sK5rAapZ1hmaEfMbjNKYaVXU+g/iQ3evLyuEG30eUtxi38NZozm9sTyIQpr/aXQ/3bC3Y4Hv7
 iyJQE/oRHmNt7hvcbQH09baRy2tZI7R4aHQ/xBey5uMDkr/5nAEtBvWy5jJle5ujQ10itB3osaW
 67qojsNCsTsCnwikOjS3lodmuTtCctux/3JnYGnoVNN2yJsIjcvfMUSBv484EVIsiSWrv4MezRa
 F2Q5kqQKjLqj79QFO9g==
X-Authority-Analysis: v=2.4 cv=K/IS2SWI c=1 sm=1 tr=0 ts=6a842263 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=x_9zcg6Ql7LMdUlgRaEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2NyBTYWx0ZWRfX49gtPRADmwU2
 RD+G+YtFJhsM7PAdqXo70CAdjBTxbAS0eVgfJ4tYINVv7VtOb5yZF8A6hNBOat2XP9lUyM2phd8
 I5DbK4KYPVqtOXeFV7yvZqmghqP4fts=
X-Proofpoint-GUID: pK951TEdZfZqy-lvuzopu81m_I3rfHgs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180067

On 8/10/26 12:53 PM, Reza Kurniawan wrote:
> Thank you for the feedback. This is my first contribution and I'm not
> quite familiar with the process yet, apologies for the mistakes.
> 
> As instructed, I've added my name in the Signed-off-by field. Aside from
> that, since the changes are isolated from each other, the patch is split
> into multiple patches.

You're on good track. Please make sure all of the commits, apart from a
suitable title, also come with a commit message. This is important both
for the reviewer to more easily grok the change (or have confidence in
your understanding on the problem), as well as it brings historical
value for people that come after you - they can learn from your notes.

See: https://docs.kernel.org/process/submitting-patches.html#describe-your-changeslore

For the patch submission itself, there's a tool called b4 that takes
care of some of the headaches for you:

https://b4.docs.kernel.org/

Konrad
