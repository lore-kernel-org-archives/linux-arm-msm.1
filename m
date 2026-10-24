Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792873573;
	b=n1y/+38oAqpuIW1jK5ofl0pzVqUfWyzOG7Cx4AFruyj0/JVhjj7qRwkZAIctP1ohChUG
	 Ip+9olCKXAm6ETY985HZOMBta73msEGmjgWasw0kULNp1D6aVnsPyyameCsHSOJ6wQnZe
	 A3fcPdgRPAzZ+AIvBt0iqeHGaoIyVZtEP9pzepejUajrX1i/u6LRPV/IgeDIZzIoW1AOB
	 RZypmpdAjImfZ9v7R24PXKipS5bN8Xi0zjeWW3H0L7LAW2e1vXmJJGj7G5qCdqLGXUfqB
	 wD12cjiXfqKEeAnDdNAnFt9IJZM18mNlUrocC+1kN6w6czTptD+HZlb9QhbLTnBQFkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792873573;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tD8TUcG4GR/qMQpgQaXa/j5++8tEfZOt1fk2tK6yt1o=;
	b=jEFs47kMDjLOx1ZJKNNCBpo2cQwS/OPreyuGo3FoWu0A5At+sC123buA0e3aIx1jcSC9
	 e+iQLFrCEqWxuX/Plm3XHH3LhpMJSKnmD93AM9izOtjuowlqi5LIQ9WXG029C3LktxtSQ
	 jzuIz6gA/sc33APU+ubdez+E+cIOJJ3n7vNkR1hy45ZvbI5qmgdI4Shq+uUMZcLvjmVLY
	 F8yZdBzXCr0R6NQWCggmsqXZg41Hl4JwE6lZFJlCNADrD/uwUCdzb44zQ2iLrVb9O3sce
	 CTckF3YHCnk3ptetNSyAj+gOoEpvtkflkq59GVD0V23Kt5yOWIXtT3FZUIaXY+1EqfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="gbCNO/iS";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kH3O6Utd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3368F606A31D
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 20:26:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3368F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gbCNO/iS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kH3O6Utd
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69OIU1YS2286772
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 20:26:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tD8TUcG4GR/qMQpgQaXa/j5+
	+8tEfZOt1fk2tK6yt1o=; b=gbCNO/iSifPPAA1bZMXy+FxG+TyfrVZvEifi5XNe
	pSRt9fe0PmAnw7LT2yhPoDDegDsBZhCQQhB87qk3PtZWQVORxk2tLOzDeGj/jzgj
	QHnJxA4OUOaGEz9lgSFRMh2lgdZYsByfgpllFNlj8spCC+O30x595a6aXZqrTOti
	FJNPC2ZAegCZnHzcm8E90LmFcVugJ6XCLzyAuSQ4gIwaSzpu7WzeauNk/yByK8du
	o8Nd85KVbmoDhjeWY2J9SmxhglkmDhFz1jnlU+LAFkhP5tpEq40192vkGnr9kP0o
	vgFuvGFg3p8Tibs39uZ7YuO024Lp8PwTwCOaG5W2gVItbQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmruhqk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 20:26:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e82060977so428174085a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 13:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792873571; x=1793478371; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tD8TUcG4GR/qMQpgQaXa/j5++8tEfZOt1fk2tK6yt1o=;
        b=kH3O6UtdSQKmXhtvjc+zI3x4nWj9Akwxj7hw1WVhCoE+hhCyOWawMSNqGYDY6idKW4
         BY6VlFZpJkS8aR5lAluc8QCSwawSIWcbBZQugQY07Vq35HKfZWpj/G+RpYJlXaeHdp7J
         MIPbTswPTtnO5gUSNQKLQWXQbKthPN3c2LrdKncgGq85nkr9dpDC8scYEgMJ8WZ3X1Bg
         ua4Hs9/d//4kGGkgLDNM6EgYVtxi9koqYyi+iKPg8nsQxy9t9Ze30eiHRDJadXTH/1iT
         UNyTwBYt3TjRq/ELkM2lNRZI24Mq+gIy92ozaQMdUcWYNcLKDm3+/q30xUU4oGmvxiHg
         NdUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873571; x=1793478371;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tD8TUcG4GR/qMQpgQaXa/j5++8tEfZOt1fk2tK6yt1o=;
        b=bYt2U9dNzVBIwnRuqpnmSLXgf9usxeVYcwZ3/lT66TKz4H7DVzg1g7yraNP5mt11ZS
         oewpQL7UGuUCT5Tc7MZ7xG1dWfk6c5NyEkA8U013aCo+7TZVKk/Q41JUtJZ/aw6yhvrA
         rFOgljhXtZ+54g9gVbHVEPPf5JpG8MwmW7EY9v3r9hTfEAJnOMigyI02ZWcNvknKh4Qd
         v8M6gzoSLN2BjzM/wrzVNMCu+iVBSG1MPMrRnioskVNOtqUk5RID7qx4pjSOl0QCLFWf
         s5gU4f1zUNfFiAuRD8PBmD3jReuC+KztkroWHCYJmmyBzo4CF3ELzg5CsoxT1sG2qAQD
         tPeQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcn6Ul2OZPd7pMkw5sA7RlPBXHnkClD+7aJSQDwhiZKYZhzz04MMUzVM2qorkCg0Rq3+EmIOvQJmlNVmWc@vger.kernel.org
X-Gm-Message-State: AFq9FYKnyBjvShydpSpgA1VhQ6fGKC2Ptp+GWorj9kjV3lTrLRRVGlXm
	URCI1HookERYN9IjKwGjiqOHcxfjLf3/q8f4TknnUjcEFxkgn7kEfJ8ZQCuPZjSeh53pmJ/rlsq
	yYNKIck6RJrDIwJfns4H9Aa9AN3etrtmvUTaoAyjtVj9qgQUpX4lbxpNM+bde4dIfvWa1
X-Gm-Gg: AYBFou170ekoSZQ3I6QV0SUuDZtVAMHa7t++y3zKwIp5m77AFFDTvYsjWGLsrAIVwC0
	HeSoqxARk3oqUjgle4qtC4Nr1XRy7BAGlmEF6oAyBXtq5LKnSmivvXH44jeYr0EfeO1kDQQlF5C
	WVoTVvWk16X0ukcKNVkwJ9LgLDqgKFKAHyB+/WOIogYrReRPqeP8xpYt91VoWslHjyOlX1OiG5x
	hHXdIlY29fCS0kMMrBuV1yUWenKNJyzujl0VxTvJe8ieShdzBNvmRlMvC8wOeIVdhLHVBhMv3ax
	bENkzyoRyvvsZiM/tXcfVeBequky2TmKmMqG84DH4IvZIE9Vn/dP3bOXrLJlz1o/aSQhf1gW2ZV
	Mc4ji1DDWG+cwj+4l
X-Received: by 2002:a05:620a:261e:b0:93e:fcac:a91f with SMTP id af79cd13be357-940ef9d656bmr390596785a.37.1792873571392;
        Sat, 24 Oct 2026 13:26:11 -0700 (PDT)
X-Received: by 2002:a05:620a:261e:b0:93e:fcac:a91f with SMTP id af79cd13be357-940ef9d656bmr390594685a.37.1792873570855;
        Sat, 24 Oct 2026 13:26:10 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a06da5fsm50379965e9.3.2026.10.24.13.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:26:10 -0700 (PDT)
Date: Sat, 24 Oct 2026 23:26:08 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sm8650-hdk: add DisplayPort audio
 playback support
Message-ID: <5ijmn2ozihmobfliynovxqo3xiss4u7wdmt3tywdi3tybzdf6g@ta5ymqfkmvec>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
 <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-4-8a189c71938c@linaro.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-4-8a189c71938c@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfX+4Tb08ql+UJz
 doQyliYouzHX8dkw5P+3D6dGiPQl788zGVJe1rGTVnBpDWUAdD7wyf8jaHkxWcVkroYAU47T59V
 1a4JpVg/zmnqrvuRroM23g98yV8LoHy9JUiLfdtGP7XqCmFTQ0fFzHNOChOpD+AjIqLUq0g9H1Y
 7zs3Bc521fXxWE7XPf0RHzVV+YkndGn9qa1ZpJmLTYZD1zDfvj6uZlVHuKiZn7Ry2U4eQ1lBcrO
 jXg8/NnNjfmnu0961NTO2aNufgZjL3ndisuONGzCphrI7GwEU8dT4/5uCVCaNMwaAjt2ogoZ4Gj
 PEcF7YXxeQ+UyNPlhwvna8chz58RZQTtN0ABuY4VJ5rwoEwWdtufWmzpKHS4eyBgv6p0KWbRU46
 NJGBLExdx89+PyWOQj7WURZyYCASTVFAq0O6LKBaSbWzolr5/GH1SmhY43aZtJlr3WrCSb/t4fO
 V+gOXVATOf6NsBN3rew==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfX6tA6mW2zZLPW
 oDnPq7v92E/zzvQQ8OHySKgTGd2F0WJQND2x0VW96DDcKJJ3x8zVVPlFWS57+dE7VTQIwRlz9pD
 uCVa8QoxLuSeBAvMRqgM0DS3iuJUwr4=
X-Proofpoint-ORIG-GUID: mMfGz4mKVDYorWbJks1fhJWP1rSWLz5K
X-Authority-Analysis: v=2.4 cv=e+aT2qp/ c=1 sm=1 tr=0 ts=6add1464 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=lwKPvcPLtPgdvEeQYCQA:9 a=CjuIK1q_8ugA:10
 a=3Q3lADbaBCgA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: mMfGz4mKVDYorWbJks1fhJWP1rSWLz5K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240081

On 26-10-22 11:36:24, Neil Armstrong wrote:
> Add the DAI link needed to enable audio playback over the
> DisplayPort altmode output.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
