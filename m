Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795757890;
	b=twTS5vG1xL6pz2EkiM4s5/QtjxynOixKNDRp5yirvORH6BLIXVnJFW4B8HIaf//tEhZ7
	 Tw0RI86HPKtx+Orh1K6FpaNNgfL2nMGvWHYP+EJahJCguDe0M6uJb1v/7nN4N4nTtgJ5h
	 70RQVMDHz7jfN2xx1vgUT++knnDJGsnMiVISlsRNrlzBFi8X4m3LOA2N+tUZMNJ9wkPXw
	 r02pQ3v7d7DtCa+K4AhpVX1pmFtlCHzfBcxPTW4NtsahnUmIxFv6vZEpHh4kyF1hBaP3S
	 ZSDBzokUESrjJ4bHyPyV133UgQz1vkkXYf3qyrUk7HixJSt9qEJg5+wqpu7QEvYvVGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795757890;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Owb0SJ3ZfgyAlnfXWgWsY7QF3Ejq0OG9h/yNLoECbZs=;
	b=YQAurK4soOAmRIRos5mgymtkvrlon1+oe1UsavuK3/rQmVFRm5/sWN9bXQHVKgtRWZr7
	 l8LoXcOIkAu1HxUNe4DL6eiWZps1zztl1+guaJUmypRe6UqQTnJtyyiHoprutvblehum1
	 abwgugitlruqyIPLuCkp86gvQr/dWD5KL0Bwca4kRALH4BZDiZu+4M0zY/IsM0aeX5qOI
	 5+T5KYEN5aH/IjCi4QShr5E+S7M/XQbSK46Nve+Q+/fK7ePvG8jrVPWaVZXhlqY6DiXg1
	 +OeYaXwe2CoFHtlXq1TF/HPUBwgH9t7Hmdroy19bdtLp5lSCdEhhQTtOhBeR4VI4b4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lBaCu4fo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cZ+5j0s6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E1E606A326
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 05:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33E1E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lBaCu4fo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cZ+5j0s6
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJvuYq060708
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 05:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Owb0SJ3ZfgyAlnfXWgWsY7QF3Ejq0OG9h/yNLoECbZs=; b=lBaCu4fo6I1f0hp/
	9m0DXSBssWM1gumZcrCKWjXEhx4lFammqAoX5r5Ct6t2qWv9IvQGxqF9w1Xfp17t
	xUDN4YZCR4uz81q1x05mCTmS1BJLfO2C7Brzr0rcSh1zlmF04VKtX4eAp9gEarYj
	bqt47CE13uHX6W5bsYiXPOYTRojsS9OpyM6y7YHfUfT1VZvZWN72GFRotJBK+sxh
	zDvlqtKMtYYVh4LekXeZBVtXeYYkeOZWZtTs2deyc9oalS6j/MZ/nmC5uYcKrqc6
	Vqj2NKCFPtX88jsyFXeMqeoeaKtCmlvXPAGttztbw921f1JK/v8OdQneMeKHLE56
	G7d23A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4hse0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 05:38:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b4b76a2b95so5255940a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 21:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795757889; x=1796362689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Owb0SJ3ZfgyAlnfXWgWsY7QF3Ejq0OG9h/yNLoECbZs=;
        b=cZ+5j0s6Bw+cijAnbD/1oQ+VmctASDRDfdwOupth/TZ+ZtGDgzgC7qvLJlbL4bNHrd
         URCKP6fuj771aHw75KYZ78J8h4uj+hCIgpLiVLIlIyxJhgxTLUpSJeWyFNWh1fA3tKB6
         EY/asbP7VinEqV0ZSsM9rHuoKfEKcHF08gFAwggoefJ23K5YlBEqAj8Ba9ZawPzmXZ2s
         /8B2P1DIcW45vyvan4YnZ1YZnuyqdxaLaQ7GybzQiH0lQvPod7AJjHsGTFBQi2gihTaS
         ZN/0sC0SMdxAO3fUA4XNmapSI/aPwF9kbSiSVWG4hitmD41cfirsMAUIn1ewceG9eM/D
         7gpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795757889; x=1796362689;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Owb0SJ3ZfgyAlnfXWgWsY7QF3Ejq0OG9h/yNLoECbZs=;
        b=oC1e70cJbrTr+oNfymZCz7gXdwuhudUEVL9AmsBqQkPZzJiT+MCAUcE4Stf9p5/ZX5
         HgikrUM2zmZ+iQMSwW3oSCYIzy17gswBgVEMB9tGyV8yXw0F9J3BQN4sIzL7vACtiaBw
         g5Mza3lKfyEKgFCZXPQoM/ZqGB+igbri3VUzw6nkFx25J6WIeAlWkwnuEesHhweh5JVV
         xS3HH8QkBs8Iz4HBjwBfctl/0TxP7qJaIYaYBZhiWX65MMweVPAf8I/dLlGkS4AVcuFl
         +4UVYQo3YiSCCvswm5/pc6kQt+SJkhQSUggb1U3n5kffk59mQxjhrXJrREtlg0DUjiRM
         RPsw==
X-Forwarded-Encrypted: i=1; AL+hErFdWMNhg6OH5ntz9xtaDcl2zSirZ9M9ZeutomXCymq4lDyodRarOiCzXSXYKCY+6eKx1ZnglnDTloqUY04U@vger.kernel.org
X-Gm-Message-State: APuU4Z8pAgoVH7y68Sq8Ir6suJtzqFYzdiDW28XxgyZ6xAPKtkMDuEqS
	UmTswQpR6qckLS5omei+goe4Mh2wMKi/jNirtjQ4uhGwTYDfvdmXmpN5YK/66civrGB+/R5cYSY
	wZNmZq1Scuvy6WGdQUvf5lNBO6YILozrnhNKYPGqteq9I8DvrnK7zrcwMaWGCGjLroFbfp71bRa
	vR
X-Gm-Gg: AZFdTZeZDNx+0YiHkL/l+QvvE9MXC4xOlIXmSZFwfv3RuSGDqA9vf14Sw9XxZ01P9BF
	4n/KkuT9MCMXipGPnh0M1Z0/albypJuZ94vmPrzu6DkzdKXY8gy3yM6lAiIU9f6KP8i2Yg8gCn8
	SHA7VSJ8/7bLAvN6TdQdGWQbIiLnR4r/0vG/fNEt6aZiwLWBOKwFP++YVBmEADLgPhyJUcSjij8
	aDzo+Az+tHXpUUl6FmHIB0bMsxNvoOVnlzGlPuYdKHr+ybsQbHejDreIfUhVHiCND5SWmmH7IJl
	/m0nvPq1djfDxCTZDs3kjf+Shl5W+KIvVk2HdWC9kmBchs/GH2qnX08oMgCSwH95j08EU8iDJs3
	AuSODh3DIv1KVQfjRHgcByTajkq+s+I55FuZOtTzHpDf40OnEI0F2EMsTtpP8XsG2WSqZfCfobV
	51cKRl
X-Received: by 2002:a17:90b:2e47:b0:3b4:a63:d56d with SMTP id 98e67ed59e1d1-3b41c7e119bmr22968533a91.1.1795757888684;
        Thu, 26 Nov 2026 21:38:08 -0800 (PST)
X-Received: by 2002:a17:90b:2e47:b0:3b4:a63:d56d with SMTP id 98e67ed59e1d1-3b41c7e119bmr22968496a91.1.1795757888236;
        Thu, 26 Nov 2026 21:38:08 -0800 (PST)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcafe0sm38855983a91.16.2026.11.26.21.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 21:38:07 -0800 (PST)
Message-ID: <ce0b6c2e-e913-4c8c-9acf-7bbd443f5fb4@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 11:08:01 +0530
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
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: shikra: Correct QCE node
 configuration
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
References: <20261116-shikra_qce_fix-v3-0-9ae31470ef48@oss.qualcomm.com>
 <20261116-shikra_qce_fix-v3-2-9ae31470ef48@oss.qualcomm.com>
 <5cde45d9-40c3-48b8-8074-41342d0cc11e@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <5cde45d9-40c3-48b8-8074-41342d0cc11e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyMiBTYWx0ZWRfXxDqCSvlb0kFH
 cKwPPwyOPz+/OYbmMjIfaeLVVjLXmtAyKF0d8vJFBJODkCqCQchGFd2+kvGdOOehvFMWtvRfh/n
 y90Qiu4jEnldAKisIDkLgP5mWlu6rOk=
X-Proofpoint-GUID: VRk061YiJqQl6WorhzTJrfzfva5AX0lk
X-Proofpoint-ORIG-GUID: VRk061YiJqQl6WorhzTJrfzfva5AX0lk
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b091741 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=YcclnU47V90UdgMnL5QA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyMiBTYWx0ZWRfX/p598ybefBIz
 hoqrWP75JaVDbCy5OK0Dqe4g9WyyMayJdk6zZV3+QL9K/g+9IGgpGagWMWik7yO7fr307tnKdQs
 Qi0MEESzgfIgzK64LfBgq4dz8QRcYKAJoQrO9i9WphU88dq8aScvb300U/sKLw6WusT5lfy0EG8
 2XAfq1yt5P3BjSqYTy1p5dSGke2SdMaGVsosQ6Rchtnyf/bVaczUILD4tiRB/3TbwIVtvbqBaHk
 tSi8lWUt/xKDrWXO7xdtYhQLBtpNYL+RbT/ZEAqBqBN3mtPW3yZ5IwLfwCKXQDN9EkvTBevuNeO
 GiuZficQUlCQERidk8KF3Cd9t2dUwgB8nFcy3NBl3os++bsP4DLBQ+60NG+SAPXdd12F+6zVF7L
 K7OT/AOyUmPjFzwMElV7BQEC57r1rW1j/tV2LSSszX43449pb/+rqO/5VeCOdajFzc2knCxhmgl
 YXm6549GjFzS6G3LDsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270022

On 26-11-2026 19:46, Konrad Dybcio wrote:
> On 11/16/26 9:59 AM, Kuldeep Singh wrote:
>> Shikra QCE requires an explicit core clock, which is missing from the
>> current configuration. Adjust fallback compatible to "qcom,ipq4019-qce"
>> and specify core clock to match updated binding description.
>> The crypto interconnect path is already described by SCM node, which
>> votes for MASTER_CRYPTO_CORE0. Drop the duplicate interconnect vote from
>> the QCE node.
> 
> I understand the need for the clock, I don't quite see what we
> achieve by removing the interconnect

Yes, interconnect voting should happen and I fixed that in v4.

-- 
Regards
Kuldeep

