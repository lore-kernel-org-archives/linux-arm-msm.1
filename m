Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795498878;
	b=xHj00PB31QhWd9BbYog9zdz9IwJY36yqsJNMJoP7cWkHyFr7uISmmJAKGIOIKp5Vm9oU
	 vpqB2ozHkWui4BaNPWsFZxU7ox1sUYGKKSJi8xITbzY2jer++pEaTqmkEurBlleMUgaSK
	 z6N2uk/8048LummiHgrfxsYcqPKZn+U1kBe2p1zgHbFfa+WzlVh1G4JY3nvHFWIq0uvbE
	 F5hLxNieDSzoERklkL7/yG6AirZzF0udb9DTvZ7WBclvlv9b5yuOOYicj1IE+btaCBpmK
	 DopaElHtRkBGrQ4Z4dLzeiAP8/us0N4byVkXpGzGVYCP6irg3WsnTc9KtqUrSKFB9mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795498878;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VOBU131/4qciZb8oZkVAWZTbJhUnx5MzQKnYpNsi6jc=;
	b=AjKcbxNqB0ekX8l8GxkwFppI5uaTBohW2VbHN3TDNWnqYV8CSdJ4/UnnNw9xLdzSTPMQ
	 ib6zhrbmg0z8Dvx8fPgwzaY3Uw9GxoWx2HJFrLXkc7unbxdGq4V36mTJvWamvitA2lpRH
	 gPQbmZ5FjD50KyjPhdLv4saacQ+ORuLjSEoihUh+lKI+XklLXrrEgAMDdiZYGYks4wrpz
	 2DalPYiFGMW4fR/DZ8thwAq/xQKDYtMzAqEVGFni9iVFsTf9+jrZEY2nPehpCcTth9MQu
	 jkHokrEi0H2fSVKhCg4StXHj6EVOHieRJ9hYkmRTzrlVendl7SiEc6bwsUiDYpRYXaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oG6MJFcW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ioOahv7A;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB61F606A321
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 05:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB61F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oG6MJFcW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ioOahv7A
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2kD2T197024
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 05:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VOBU131/4qciZb8oZkVAWZTb
	JhUnx5MzQKnYpNsi6jc=; b=oG6MJFcWsXBLrudRR9Ik5L3vYygC3u8KPS+9Nrqp
	lEwi9P+zVtXyP0Hm/GVpcWFd+Q+aXnBzvFqdaHgsABg7IIJIWDEiMetc7hgaMrFN
	ArTgcHoTT+X+4QYJxI1iNF9QCX3B0e0NhMSCvQ5sr1OFuvVCw+0O5pkFx+E1h3C8
	tYIdbh6NqZFmxFEdZ8beUoJX1GCJnamZmrp/ZecKy49KAHI5uU+XCViSDwLPKf/5
	PqAw6cWhdt5HfXRteN5W4c/6GItDcZNoyX5cAMBhzusHstRLJKubypTUECvyvvXH
	ETwjYst0nbzC9jn0JJcWlBf3+UeRU7QxUzmCEjlCbiQfKw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukr9yjg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 05:41:16 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-92109408212so86848136d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 21:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795498876; x=1796103676; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VOBU131/4qciZb8oZkVAWZTbJhUnx5MzQKnYpNsi6jc=;
        b=ioOahv7A0EoqXXvOho07plftjoMoUhSz/0K6vWzAFCob09Fw0Y5MWge94rVi+iToIi
         vW041A5xuBac3FMG8Vl9kdsll5Xo7OMgeaee3xoP9IAr5Mz6sgnRC9rMzsyGNx1mDC2q
         dRHsTGCSkhPXdYWk4sDr9XzkNn3wL2Zq4onqC5COrdKdj6LKEIQE1T5pg5wCv19qOcwT
         ffO75QdADBaNu+GkHIlv0ZvRj/baZtnAbukzj30xlwtBer76WKHgQ+bJzCTzLyvOJyT3
         +TkzBJoGU4eDXCuFrC1r3bkl4J/BDq3a9+HMxNH6Nv+mXIyAVrPUch+hhkkUvq05AWyP
         RU3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795498876; x=1796103676;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VOBU131/4qciZb8oZkVAWZTbJhUnx5MzQKnYpNsi6jc=;
        b=pS/unx+hjNH96Bj9Mv2WhhWYO7wDBr9EClpoY4z9jyJ56HKBPr7VYgkxiwpUYMNfCA
         Mda1kR2V1b6lPMZEWJPXSiaQi92OQZDDBppxDHsYMt6UVbQ4Hr16U7Wp56h3ErlvvgH+
         yessZv9WcnQklXtZWrwFinW/7A+tm2Zw8fOUptKLJSWdEn9IqK4qltuMox8fVC15jk0o
         1hAVxJFwqbDsUu8ZV2SkpZHT5wESdRljPSVMueY4Ow3P8TU7+nI5Dp9nQYRg//AUfX6a
         FkGEyPAp2on6I3uQnBjn29KJZF8impgCwq/dujxbCs6gn0645oqwrxCP2EEH/UJWNNbX
         KC7Q==
X-Forwarded-Encrypted: i=1; AL+hErGEic5pcqaa76Zj9p7LSrpq2JWWqjyIZh23O5LrmdoFla/zstOFyV4OQLgXJuLcCzLsiag8idBYxA3LD+FW@vger.kernel.org
X-Gm-Message-State: APuU4Z9hx+y/wI9fHOVVnX8aTFXj362LIZLU92TSmRzIe7az7LWdE2fL
	eKDFadaAWj4BdHSkKt8OUfKIeNHyTJzSUoSqSro0Lks0+g1XY2Dm/cUvVJIYXq3i1xcy2djTrwp
	kQIiBgiPuwlg9v2oBEsL+R1Ky2gInzSwrl0EQ5daM5Gomp5YpY49ZIbyHQgzqsaxaOPiV
X-Gm-Gg: AZFdTZdgwDLBE1UenH8OhU6s9XY/7pZ+Wf7L+18lPwB23OB7GtCL/sFSgPrVCHmodDH
	6qC8pyQAIik8L2hFBll+4sxi5KkZRSof6VZ+DgXqNhQUdVelIvat6DjQHiyVPoUknEhRLlFfclL
	C9U14Wau84zCX3I2cUMhChOGlxVZELMFeZczB62OfRa4CbSfhTKdIx7r6gIRRh/ty2StTWA7gJS
	dfRGdV97Oluh6jl0/LTe36qZfcdmY+04K5l8vXrsxWd+8kmI47i5FJhnO6R3Eozn6CCtjHaO9Vq
	8IK/YHRO0RSekGtUpBEq5kmsBw3DnmM9ymVL55IVrKXhAbR/vxF1UNTft/hi3yyHh6RKfGPdVi8
	IRA2qIMgIrCZ2JoBi9kxfE/pA3WVQWcZBEdN6C/6Y2AoFGenX1xsJNYYNgKuW79bv
X-Received: by 2002:a05:620a:1305:b0:93e:4e27:359b with SMTP id af79cd13be357-949ba96b838mr2342713985a.24.1795498875762;
        Mon, 23 Nov 2026 21:41:15 -0800 (PST)
X-Received: by 2002:a05:620a:1305:b0:93e:4e27:359b with SMTP id af79cd13be357-949ba96b838mr2342710785a.24.1795498875152;
        Mon, 23 Nov 2026 21:41:15 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm484009905e9.6.2026.11.23.21.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 21:41:14 -0800 (PST)
Date: Tue, 24 Nov 2026 07:41:13 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: Re: [PATCH] clk: qcom: apss-ipq5424: Drop unused qcom,ids.h include
Message-ID: <rkyw4fpc6t3jwgldvhgbos7ocbz4m7ux5xn3sc6vobm2l2yrte@vdb5gjsv2q3n>
References: <20261123215842.21088-2-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20261123215842.21088-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyMiBTYWx0ZWRfX2KU/ol6ITxWI
 lcjlpv6BmJz8Ppuo/7S916/cn8dl3DqUQrYwu1VXskCo2fh7bJIKsIvzMDmITtlfOge3+dCoX33
 SV4bZiRWVqG6/GAQ3RCyx+7MUckx2Gs=
X-Proofpoint-ORIG-GUID: YAiqBrlq9QmvlmD7uiTo5AjkDgE1AF95
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b05237c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=tWeuqc_IvAeSSrr3ltwA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyMiBTYWx0ZWRfXyLNX8cNe9kY7
 efPl90vZaoqp+0FlDVd7Z5rJ7U7s5Sb8e90qxlPZYr2Oc05HAx0h/7iQ1ozGQniWewDwgiJZpYa
 KmMAZq67cc4tczAlvl05SFZ53DhTi64fRPwl5IXs6HZC1pn6qTdrBlUozprXpzSi+gSqQMlSQuw
 FYXeHAKsea8zwEokgU9keHnxAJHPGEelDhGNO9XqAInVobTPTIOJKzr99ELJ0l+zTl8OLJGvMPj
 YysLcrKflPbYUdFwC+9HVk7UTiyO7V+vvWHCwGIZO9CsHY67XCyLdce/f+/sNWLgzQnrHu/+ZD0
 lXOyXR0cqYftgpdLVR7ZRNxucK6lPaQLkLv9OV2ZY33jDJceWmUNUJtR0Rm64d4uEmkqkWEUh5R
 tB1O/A1V7CyrA5XpuqidZN9aQhpZTM+eOwaEhOpA60M4a5wkWXYyUnH/KCm5VIHOXtLPwlA1iwj
 JikIUTsxJXVkQyCFZEQ==
X-Proofpoint-GUID: YAiqBrlq9QmvlmD7uiTo5AjkDgE1AF95
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240022

On 26-11-23 22:58:43, Krzysztof Kozlowski wrote:
> Driver does not use any Devicetree binding from qcom,ids.h header.
> 
> Suggested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
