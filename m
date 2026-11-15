Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794780480;
	b=ORPJ2wNhYjgwSjYL+LcLur/I3UuJGysDn0t+oUnVC3DLcQ4jCiD5bfEjb4O97VZcrVFy
	 YOFOuSKW6SjKjS0cCc+YEpQunZxFJq5h9UgJT78DYE4HsA4Ssta5Oso7F41liSwcfMIBr
	 3D1JiR1bVd7YW0vWt7yOl2b5ARJET2Ab9xJ4e5D974Shtbx3sj4YZSlDrAKqx5u9Rwgmj
	 11l+oLlAvjLIv7aVSkC/HlfXOSf8i4oprQR7c0y+iVqR3zypZKn3vLlOAfP/LqobVuz5p
	 v7TlKPE4fT0gnfhrIpUXMGHDDa+bsbQssKz3XfZL+Yq0jhWM2UiDe9zlh2d9zRe9EZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794780480;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=k9dCgqBsP1JDVCF0pQxP8lz2vqJjfqt5PSS8hR4Mu/I=;
	b=5bI53tshvWFYrczD3upQt0U94jdOw2yZd9P7KrlBYnl3xuv1ye9UXKIZXYo94RIQT8mJ
	 MqUSyYTfbhQeGk7M08D9HkJ+aAqXbEUuh999vcLpwm02CED9Tb7UNJR1sp5DURSJRfq7j
	 T6c22b1r3D2C/leW/MnV/QGWeyrhMY05tQ2DtxF+qiPgP59QxJzE16Aa1zJB3ZRpR8PD8
	 1gGhuv5rBWmra8LWvJ9LGb52x7yh/qc1Ma/rmpX36jPCQYXhWJ32xmLMIlJ0IMJqPbvCX
	 J1EfqXCEuVzBkzal6JhZkfgCWOcwQwtdOaHqtIDscoKnPx+K+yHiQCEYlz1ZuFN5kQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cKU4jBb1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cwMlpBdj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C01606A323
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 22:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11C01606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cKU4jBb1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cwMlpBdj
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AFLm1mO2882954
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 22:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k9dCgqBsP1JDVCF0pQxP8lz2vqJjfqt5PSS8hR4Mu/I=; b=cKU4jBb1oLOwttr/
	x+PM/xgG4ULXw75e8nVkQtD4VZzNqylIGqUp3nRwM2qXuZQq3TQVpklLE8pDkI6J
	qFCN4F1i29jd30aKeAUAYZhlTqoGR5jUs/9Q1VIjMzqc8k/rbiueb5Soj4Fih6lz
	EODjcHq9QnuRk0dAHzcUaDUtWEwOr62PyLbjSZgBfmPO1MUPHcNSwnnSIM1LKzjQ
	BTdxvficyIc3w3j79Q6qs2d9gfpzqbzbFlm/OcwIcQ4f8vqI4S/7KnkaeRYhG0yh
	TJHKw9ln7huNRG6Qwv1SpLqTMdNX8IR4HL6kwbqN6Ar+H4TigrzLLaq0YbKWMAXG
	5jbM/Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmhku69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 22:07:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f3969a2a7so455429285a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 14:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794780478; x=1795385278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k9dCgqBsP1JDVCF0pQxP8lz2vqJjfqt5PSS8hR4Mu/I=;
        b=cwMlpBdjKKbckSpfK9lRkulNcgARW/rozdeQ0ZtTFCbnsQwe+ko5dx5br12kCcJvEZ
         EGw1vQ2BNEuo/8Z23F5j6LSgTfUfy/rXTewT2hGclNaTQFQSOkygrv57a4ZhOWNlqodz
         eOEIS+8Kbem47IxV6IKO+0uQIA1UGgrZRpSFdo6FSMI7kMfJqmLM3GOS2YsB08ELntmA
         TGE4IJ6QQVjyE69ERKrxVKzHLVt6wpS+h57bSlM0QaTGwAvk8fEzeHgHnjo4PXkLx3eV
         oGwNXhmQ2mx6XytFYXdYhTRmEzPFMhgmHmzxVnGIX7LBfeDsv5+DqvEFS6oJkJldJJH4
         q1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794780478; x=1795385278;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k9dCgqBsP1JDVCF0pQxP8lz2vqJjfqt5PSS8hR4Mu/I=;
        b=wOU43AZobn8ZCssWcM2+nzvQi+vDgXz7ZvF3nrsXHfiDJ6xbda0sqi4zfaO+d9vARm
         DUc6h/g8D7txUOYpFJ0fOMZHTQwRRvhMXEmuqAVqtGaEPsa6FgKMUZOR1QY4u81x0QzA
         7V3Ueo9Th8BkQLizADeNWMU8JbU8FLVO27bLdVNXNS1690GnzuxMPsPhzRyrJ55aBJDS
         3GrgjiXo+F57gGuo3b3ewChZtSl49uHXeGmzyS99ZxuyGTN2obIpZg6wfgr91455ySla
         jYHMxbt7trSlBFRZAFbYoOBDgXHe9YzqnTwzOt3ArOqH9nENDoeNvsGsifVW7FSCBP+b
         mlkw==
X-Forwarded-Encrypted: i=1; AL+hErGPzUVQDCFBgu/wMBkCocIlOtDvXQIzNOvjJmDztlFFSdKqQHCe4aoybSrzHonZevtEz9YXhW8ixOkDQ3pL@vger.kernel.org
X-Gm-Message-State: APuU4Z/EONmuEIw055jJ3fpFGh9jtx/FtpuGTIvrVHdyTTdHoslOpdMD
	dFkFABS1NUqbAyg2n4adqD3U/UBpSVTRP4GAgjQuQ0Rxux7gVtfKwhE27Wmt4GcOZsBAX0Gfv88
	OfK0tIBaK8dkkaGJ2S+f03heFzyy6vWCKk6LW1kpPFALrfQ85zmgDvwOXaAbCxYB1jkZS
X-Gm-Gg: AYBFou3/TtERBK+il51eQQyUaN+ilCTxdrtI9Wqos7ByCHSwlwrnLaACky5UWJ78c9p
	adR3hAoJbjaZDPu4u76J3uXC1FJs00gPw0o6R8sB/90WzI3EitwEoIgun1FabkYBTI0B4i4gbpV
	J8bAPyWUKfNABecvgeulBuxsVKGxvb4aKGjF197U/EmE6ws6menJHMOQvD4Uak6AXvi6UHCLwHX
	TR/DobhuhGxd6gwCizsGqHYlVFbvhkuDOmIcGM+ty+QlBVB72elS+2MyO7RodYFHq9jm6IysN64
	C27o6USA9vgvoPjgnsBO97RbShGXoewim5o7j9k9a67XhNnkNBQAUuEcK+20zPNbRJqCfBNLrVj
	69KCamFJNeqijAG/FRwmb7Z1H0Ht4LSkr/SB4j0LzHxmUxQzXZj1DMCRTSisQxV/YMPYoibvcwA
	gq
X-Received: by 2002:a05:620a:618e:b0:949:816f:cff1 with SMTP id af79cd13be357-949816fd194mr51588985a.7.1794780478230;
        Sun, 15 Nov 2026 14:07:58 -0800 (PST)
X-Received: by 2002:a05:620a:618e:b0:949:816f:cff1 with SMTP id af79cd13be357-949816fd194mr51586885a.7.1794780477782;
        Sun, 15 Nov 2026 14:07:57 -0800 (PST)
Received: from [172.22.9.204] ([217.110.90.56])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c608cf46dsm19639489f8f.43.2026.11.15.14.07.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 14:07:56 -0800 (PST)
Message-ID: <65e3d2b5-a48d-4ef4-ae89-68a15ae7466c@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 22:07:55 +0000
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
Subject: Re: [RFC PATCH 00/23] ASoC: qcom: AudioReach Active speaker
 protection for WSA884x
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Fabian Renn-Giles <fabian@fielding.dev>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261028163152.26892-1-fabian@fielding.dev>
 <110e1d54-347f-4186-bbe1-6aa03aa8ff3f@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <110e1d54-347f-4186-bbe1-6aa03aa8ff3f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: o1UWUrcCULnwrqtiWE-XffW47kEorunR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA4OCBTYWx0ZWRfX4RJMr3sEv4Mc
 E0dm1LGxSHfUCfcZ964Se9QLbie9A34f1pG/aXm7RNHWBEBn4uXFdFP0dhCNVp2gNIAvxhZqF1n
 JKJ6jPrK+PgKoUrn1+45AlFvY789qfg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA4OCBTYWx0ZWRfX+kaSrbWGceDI
 bdM+AzY5cw9VoblXNHiwQ2nSW5z9kukU2Srs0Nuq1wv8T70ME+sQoYuQWKMtw7OVigED62XG+sG
 /JSETQ7HEQwMktCwO8gsZotbLnUL+gu91Sr6wbxlIc0K2YIqlhVuBVINylperccoWOjnQg6ygHS
 HZbybhJd4/WbLxzwUmRYiVTvIsEdjZmSV7aDuJSe3xzfROXu+6AFy3FWYQuUoY+O7boEIDdHMaG
 wXQ0JYBvYelN0qGB1pDXu1lTcgGl/+56YgbcKe5MsiAyAO+CSZpUwShAputhEj4Lv0eVXThbnX0
 jD3vLwvk5CiWz0U+LeaMTIJDhUSJD5ebaAFUc8Ds33/jmtfUyKIj9Rage8WJD5f0f+dmtwvIThY
 PYzZ5mDb4QYMhRwi6SFVo+5Qsl5CawtrAHdYLd5F0dqztfcd1euGF5EpngIcQedrWvP6/2nZLMG
 GkbRTkScoTE5RIHm51A==
X-Authority-Analysis: v=2.4 cv=e/2T2qp/ c=1 sm=1 tr=0 ts=6afa2d3f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=hzUeyGCwRGS7WCfWEAyTKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=2dS5UIqEM45N3m7Sd7gA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: o1UWUrcCULnwrqtiWE-XffW47kEorunR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_07,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150088

On 10/28/26 9:56 PM, Srinivas Kandagatla wrote:
> 
@Fabian,
> My Next target is X1 T14s Gen6 platform, I have not tried it yet, but am
> hoping that it should work.
> 
> I will keep you posted.

I have now managed to test it on T14s Gen6, no changes to these patches
to get it working only thing that I changed is dt and tplg files.

thanks,
Srini
> 
>> The function allocates

