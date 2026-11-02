Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631449;
	b=pkKdqI9HcUrBTkdrcJTZluAO9M8n5NW2R8eT3wwo5BaYraKpK2tYWSZ1NJDZsuDpwlgt
	 hdBamaoJJCCCE4nabZcMQjXNztQB1Riqr5fnqCLhx4/bJDY4H4svKlhCvlGSMGiAc1ZUj
	 HLP67PR0hqkMJpG0q6yBI5ytI6eVdkFVDdec27BPbsSBdpS6LdUFEr4ks6SI9I6bG3V5s
	 JQ8lQt8YLkItIu8R5yTHtfxBsPT9iZmrI9O4yJQdP6rxoq9nwSDzfG33anwOI9JQfAvJS
	 n2icrPkO2FC9iu1kbUAvX6kn+eN6bPqrKhbJrrcvqmlbNuyB8wVQNZNlrx8PGk0hT8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631449;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JXR36f4oB+4j0+bk1Hu9kxNOzkpgp6U0kS7jZZ2UGrk=;
	b=O/icB8GN2j7tKVyJfPY46nuyeS+vopeigDb7OjDvYlYf40HRH6Gzf7ETFtils23djraz
	 bjHpmUcxB5E6mOO6bhE9UHDnhw/LlW83sR6B2OP8YNWO32fPlQWwhMJv01y9ZnCNypQXL
	 obKeYg+lc6U/9/RzGDadmIDwNeso3wirzPjO8noJ/DuJfDDIHq46Knv7b8ILr8K8LLBed
	 OoRu1s3W9IQ20wDMLH7C+8IS7O4KvSJNgApZ/cZrDYI8uQndWWaDS8h83+5TnK93D08QF
	 bG+9TMerc+8Eqd8A4E2WEAfOU3kMrwkPkZniDG/Ft36wOpPVZRKiY64cZ2Tqb3DOthA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BfEndfI5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PFn22shS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED8D606A5AE
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 14:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ED8D606A5AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BfEndfI5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PFn22shS
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2Dp6ck894117
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 14:57:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JXR36f4oB+4j0+bk1Hu9kxNOzkpgp6U0kS7jZZ2UGrk=; b=BfEndfI5s7N7Rjhl
	j2Fr/oOFAWDZ9Jx/C08rPHE1OZ/BmyZR5fEGzhxB1/uqA3ZbSS5Uz07mg0C+WARn
	pjTVEFL8kBQsuColh2trHt4TMn7G4onxO8TjiY9mCpXHZoijzRNC24kwfq0IPC01
	CbTkdW+RLXEkgeijXRNPYCiXHllsY3k8eeO9EPghueJKExI2hhIbAXPgoWKXhrum
	jg6r6JWXb4W7uqP2YnK2QD71LqSRjJ95OsktLOJ6qwbLci1TBBlXsRgG5qnNUkUh
	N9nCkKQyw5qPF3qXZCClq6YGef8Kgc3HqS1ZpkJRaU+PxZcyvK8Jv0nlVw0178Uy
	DLbv7A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvsbby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 14:57:27 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc450e6e1aso119516137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 06:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793631447; x=1794236247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JXR36f4oB+4j0+bk1Hu9kxNOzkpgp6U0kS7jZZ2UGrk=;
        b=PFn22shScAkEWkTyecd96WL6oKAfoTF3/koFnFMB4IsmJJ4NXOsFVOu+6Rp94liBcP
         Z382GclK+fSt1A9kfMDlVdFYQbDxG3tkEXPbFBc/oIgryGF/VPYEFt3aY4nrQa99wnVP
         fgMvn8jZq2tJwhm4VLJ5jV99smhlXI6M2k6WfSKZiRzZKwvUZCdnvx8yq5kh5wYKetDH
         Lwwt12G3kUhhw49RqBfecok/UgLTMAzVDObgdC4tv60oy8K1KZJnlRnv09DTj6cm0PO9
         E6AfLhELMU84l9IzDpNSnRtfazs2ujjVAzT2rPUbOhfbqSes3tByDxZRD2yqyYG2mKN2
         5nqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631447; x=1794236247;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JXR36f4oB+4j0+bk1Hu9kxNOzkpgp6U0kS7jZZ2UGrk=;
        b=kulGLVVHDpDbkcUjuE5OZ+4jA6XnfbAIofmBP+Ueyg6yhqewi8Jpxvbb2K78Oe2zPG
         RlYjq/y4Os/15atX7hmMFRoxAk8S4oQ4nD3HZj/Bm4AiTe3+vYYtjZuR5prnuhW41/CD
         I+k93DN/3EJyQJxXgvQlNCQGa7vyzuwdICnT14a9zIACbk4KrOQkW+04R2vkNVazRatP
         mWpkKCeqOZjQ8y0DY79xh3ur9dLAmCtEAtegMG1CjkMPj+LFxhvwpFfcoZuExV1ZOpcF
         1T2fpm9DvK8IpAoPTFlr/NkQ0OA1MI8WLO4Q3fBd/t/KH7bq+gLimNQjqHOwMnlFX5cI
         dMbg==
X-Gm-Message-State: APuU4Z90oZTeMiYxxpz7ZyAKjCJ5IaFj+U2vtEZ0Wwkif9sOHiOcMV5N
	mkvc5qF9/PO8QUGn11+OE60KXh/6nvzrjYQlxdeSwEsFizzKnD+IkP6gGRNqEgwrpgWgfJWGJ7G
	Ng8J6aALyNjG7SO6oRQhE/xFqzE+0hprnB4Bsu6dHFwKRjydx4E3ZHlQTA4Nm78WjBGlj
X-Gm-Gg: AYBFou2NsWOtXpLbDRTz3u3KZV8qR8T25ZdjfE+/MkppQjPFOci2O8EG1lYfOzfEnrJ
	HryYdzNAUz2UdDyRgKopAjXAswaNDdfi2QxXZCZJl8I8UIte0pjKQwnLFP3F0ZLVJKFXw3qGXsL
	FTTjvK7O9C2AMwQuVi1yo14qSieIpWHhDXx5W8808BuUBHbJHD2f5Okr3URdzbQ+Iwz6zY6OERU
	97argszIkQQ0MPKPUsigJuseo86fFRtrbiQLU4yIowU5tF/4JoflN9YdxOaY1CiZbF3RdlXp2MY
	A0vfZ2fw4BEZkwFaVpbqOd2VZZNp/MvolFQXDhJL2/mACMJqSsVw7sBlcFsqYln0ysDNDS9X/jV
	nPh84lydvjN7I3q5OOGWSNS/HnZz5uzRY/eArKkPuBkLYcnfu8u9lGwsPzDDAISoYzXG7cQ==
X-Received: by 2002:a05:6102:a193:10b0:7cc:174b:f7ca with SMTP id ada2fe7eead31-7d0724f26f2mr3612426137.0.1793631446578;
        Mon, 02 Nov 2026 06:57:26 -0800 (PST)
X-Received: by 2002:a05:6102:a193:10b0:7cc:174b:f7ca with SMTP id ada2fe7eead31-7d0724f26f2mr3612414137.0.1793631446121;
        Mon, 02 Nov 2026 06:57:26 -0800 (PST)
Received: from [192.168.226.93] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec91e2f2sm3411988a12.0.2026.11.02.06.57.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 06:57:24 -0800 (PST)
Message-ID: <e1657c34-201e-45f9-909e-29e536c4f616@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 15:57:21 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: Add EL2 overlay for
 hamoa-advantech-som-db5830
To: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, abelvesa@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com
References: <20261029-come_kvm-v1-1-576afbde32c4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-come_kvm-v1-1-576afbde32c4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae8a4d7 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=FdHCPVNKWVIqwBdtxFIA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: Q6eH3FkZrzqsr_F3acrUVKbgaeq9yjmZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1OSBTYWx0ZWRfXxe0oNqBkPOSb
 2+ll15dKicVnQhd1VwJVaR2hAl5VihhMFtGxabmEH0TCSYLr3RVxh1hw1XCkP9XkSPCoEP5VESK
 VmqEjFOySAHZZBXtEDqtLH6WY1Jqtn8=
X-Proofpoint-ORIG-GUID: Q6eH3FkZrzqsr_F3acrUVKbgaeq9yjmZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1OSBTYWx0ZWRfX4eVF4AzT01Zy
 W6Ux/un2qtiof1jO0IEbwiIXcLkyyvNviyC8HGTXxCVJ0gMQCLJkpTSv2DucK1W7bTr+0G9CGdl
 oWk8rhiiXbcqS7MSLT2GuJ7cgdpSGQsuAPK5o0K4Fx47s2Y/jfgggPatispEfp69NnCvj8led4v
 PnYaz3Kvp+3QvSmtZv2o3aAoq7IeP3YhV0ZzZOlzY79wi6wRtthvu8sWgvMkycWgmmyTLfQF73Q
 jFZ/uhi8hK5sb9nUfQpOz9DugnktMjlk1joxAAgOd+1/+DcY1oq8S2ue3fWDHS+w81+K673C29Y
 BvRzqf6tLetHzLrSKi5K9pMSwQIHylZcZizkBr9nyzv247zW5rawpsAyw70/2qRijNJtQXIP9eh
 EBHY1UvGVqndgzfy+5pjrbiEaRL4YdHXUsWPOmTNhleJcvwLdSKK+9ixHmFjo4kjH1c8JcoyCL1
 CFfjOhb4s26OrAFi+Kw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020059

On 10/29/26 8:55 AM, Yuanjie Yang wrote:
> Add support for building an EL2 combined DTB for the
> hamoa-advantech-som-db5830 in the Qualcomm DTS Makefile.
> 
> The new hamoa-advantech-som-db5830-el2.dtb is generated by combining
> the base hamoa-advantech-som-db5830.dtb with the x1-el2.dtbo overlay,
> enabling EL2-specific configurations required by the platform.
> 
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
