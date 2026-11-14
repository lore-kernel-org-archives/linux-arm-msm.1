Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794668418;
	b=a4HhcDvwvJb9cgIabFzypGHvipM3z8s7En1yFvgwS3lzn1L3/In7ZnR0t8Nv3bRPRbx9
	 5WKGZbZb5rXE842W2BS7xrnX1N0EZQnB3Jt652W5YneHVuvyyBEJjhHvKa8gxNi9bnkK/
	 tPwfbSwdyRdGUftmzXo8v/l9TdN/mFruJq/E0p6PVaV3kRzG7PiQgZjLk2JrqOkQLsdwT
	 ef+kBNpJfHmnjSqjbn0ShlHAtvniabdkoFTKYuYTrG1vxnMnwL3cnRNQECWhoivUpkgAk
	 FcNY2d5vRQpyFm81R7TubIZBe6KdPP59x77tu4kte5cFNdqZj53htlux4kUxNB4GuZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794668418;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qOrC9Gal9RVwYSi5qGrxcqYTbHgtm36z+0K2fpmAefE=;
	b=4IumV+rpN4bbovhCqLlV1C78M+bZK3ZvmiJPDHvJGBNdjMyVufNXDnwekTDGgsA0V2RQ
	 zHulLtYUW0fXAy8p9w4G8fpogOriN197yhN7rF4edyKDmN2Wwf3vFxq8oqUgDPCIuEa4o
	 F+W9nDQkFFSloBo0GCF4xm/hN1cqY0jmUeju8NncAWAkz5dqPCaGGbNwhYD8HKTngDnxP
	 t+jl0AmdOcqVPJeMjIDpYZt/71LZNnQMCcsMPHkpxEMeOSTjYgyi64qsqFiNQkMXSwaQ8
	 hTr4hDtdtp5ueT1x7bbLrcfbp2OoZxtrbGN9nB6H+k7iLqZQgQY/GZElUDU/p/796Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M2XjFc5n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kucIOctp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36472606A330
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 15:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36472606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M2XjFc5n;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kucIOctp
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDlDvw3742405
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 15:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qOrC9Gal9RVwYSi5qGrxcqYT
	bHgtm36z+0K2fpmAefE=; b=M2XjFc5norZGnS5LN1iIIlGtcwXdC4gfRvAtqu+i
	dKzv/FHjijAjDU4oJ1aU/mt6w8jec+VF+TG9uEwmVdK7mXms84d5/y3nEYIiGR/m
	1yBCd7undewnAWbrk400iPYU/5U78xWDH+loqVYKKrazslvik8MBcxMFKvbbEBww
	X7Bh5+JsRrQ+YfTH2PNDRKk5dYnL8PLxFq/pzOO1JVLmwMp6bLbdRmUvhAt4iYFo
	E0K2Wn1+sA2K//mqVTvtO0e6amQtzAQY9Fmb50fpBTEgAxg0kj7BHD5AvBEos/lj
	mCsaUhAWpWEiv0y3p1flEN7VjidHWblQvHAwQrihkdtRcQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqh4ht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 15:00:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94607500fb0so352090085a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 07:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794668415; x=1795273215; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qOrC9Gal9RVwYSi5qGrxcqYTbHgtm36z+0K2fpmAefE=;
        b=kucIOctpoi+T/9Sq5xxXGdO/MbZbPrFj1RtMhZSR9Zor8EY7vq+K3J9tXnOvkdZ3ZZ
         mD7ErzKvkTSgpqkbyCSgmLbo0QlerD5JAwIYGV3AYkngGqTofYsbvDyQRmAGHO3mTCoW
         h7sSJGztEJ7hYG2wgsXg10P7LcXYnfk9SYt1R3WhN0IpjzZ3ikuLLhhctv3fAtkmSYPB
         Ej/1thF23oxgzTrvxqLwL82v1fjL6X5fEykHJwgXl8Hfcc1lBuuyRkTwKMJOiS0zFEX8
         4jdKKKKt6EvmR2DF8p0dw4Qxer2SD3Z+DAQ3YyPWEIjl3+TLixUqWdwcGr1XdrX7i5FP
         Ufew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794668415; x=1795273215;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qOrC9Gal9RVwYSi5qGrxcqYTbHgtm36z+0K2fpmAefE=;
        b=SslEpe07uDItjG2cKFZJM4AXErqciGVFFwsLLv5v8/bvkm4XDW9i2IezShEeJtoRGZ
         g6fNKrz5bu2xZ+HfH8MzwW3Uho8uFG2FPpT/PXQzZ5/ybKFj2hVK89VYf7PxJQDtECKf
         efTMSPkfXYLzaYJwKproAx4/d79XhTbCuyslYW4losvGIsfric7RIF2oXZ4o8DnUgiZi
         2hTBPBZtqtJm3Hk31kj/cu+kPHdUpiDhhoqyc6PexpRwFr5IGpW69xUwMc4uTtupBt+i
         WcvzaAl0AAlSeBOc5bZqMmMmVMTAKm0vwmwIO8bAwdYRRYMCKAGcgtrUcJvLaT7aWB84
         KERg==
X-Forwarded-Encrypted: i=1; AL+hErHWuL1Ev7p0T9zDwYTLOKzCBgVAohHbBKRLvwO0VjDISDeKmvAJP51st0FM5wj1GwzlDuE/M5mE2Li+BeUf@vger.kernel.org
X-Gm-Message-State: APuU4Z/GGE1i1x7x0t3DhxUrMlnLHeJ78Q0w4gYdW1QQa3muDszPfdBp
	rCE6tM71DbVqho6rEVsTohzCKCBCvwpq/6sd26Y/xZ08GHq0XP3b3kbMYm5mq57ZdNlzawmi0f8
	1+jMFCy4pysruH0xOrwJfGvHsdejCBM2SdzY4XCb1Rtn3AJeRUkbCcHXfmBgHoM0vWrBA
X-Gm-Gg: AYBFou1pVC83hbwPVlJCIO4knoTmU3mwPVr1HvPx+RMxW1pU/krqLZXSgqVAe8anQqw
	kVotf6JZ8QOFQcacSdk6K9HCRbZV+RqdSxzHj6c7A9cFYvsSAERo6QaGisy497+G7i3Rq4Ol/Lg
	uQIDYStEB1LdBuMUsDwuixBqXSXWKAVvtN+iUFRQiO8T8oVCqM36zgUWsYl9TKBkx/QXCBJQOPs
	flVagABNN1QtBSK1fhq3QJ1pFuDj2nJCKnxO8CAo/jZpD23NUt3hPAmsLOOjwTt6ri7TBkU2KP5
	Z9fajWlmqIeRFFyn8qBo+anxaTI4GQlGM3WGo50cV1KcxUM3zefS46wY94cEdYT6uemi+zunTcD
	31T8vPCV2LqDQvUVaSiyuRKWOGkoecTqfTn5IIuCJAE3YT3yFxm2cGbzRuDvHTuwh
X-Received: by 2002:a05:620a:3188:b0:93e:f9ba:6902 with SMTP id af79cd13be357-9494ba5f9bdmr950501185a.9.1794668414823;
        Sat, 14 Nov 2026 07:00:14 -0800 (PST)
X-Received: by 2002:a05:620a:3188:b0:93e:f9ba:6902 with SMTP id af79cd13be357-9494ba5f9bdmr950489985a.9.1794668414018;
        Sat, 14 Nov 2026 07:00:14 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e293540sm238605295e9.8.2026.11.14.07.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 07:00:13 -0800 (PST)
Date: Sat, 14 Nov 2026 17:00:12 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] firmware: qcom: Allow QSEECOM on ASUS Ascent QN10
Message-ID: <is4zc3hirwt4huslzeciykg3qrzl4yp3rvr64i3wd5r6ivopx5@hk6nmoqiismg>
References: <20261113-qn10-v1-0-e09b2aa7ccbe@oss.qualcomm.com>
 <20261113-qn10-v1-3-e09b2aa7ccbe@oss.qualcomm.com>
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
In-Reply-To: <20261113-qn10-v1-3-e09b2aa7ccbe@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KelHIgYD c=1 sm=1 tr=0 ts=6af87780 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=eaVRD4h8osDMoe4b1p8A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA1OSBTYWx0ZWRfX0fV1two2/grQ
 Jzb3Zf6BM79fPPo6/evbiNWp2AphPGoofg2rVNvIntNBsHAgmSVWyqtUFtFlbeQySsXNyM4Jqpq
 f0iOEZtS5mcm7p3v5k/kgniBRYypy20=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA1OSBTYWx0ZWRfX01LuLLZyAxWv
 e8Z6wrFY6+3QgPCdpoMgcxaTY37+q+t9j6QfU2OPs7tlRgD6cCF5zCXTp4iCz9Zvy06bCBeCUBH
 KD3PuQSjSKeafs1Bakiv/zYd96PBFXkvcptkK24JJRFr3t7p+yLuv+8U0fYg5PcoCwbTnAg+BfS
 4gv5iSKSS+thnOHuWf+Gh0GU6F1aHXHs8fZyyregcIrG5P3gehpc7CngYLnJRFgOjQ/d8MIn5/n
 6gOgxwMHIN4QsaluRNA5/A5Ppw4uVaF6ecC0Xgd6sOfUAt5tS9Cvv9UPE9ppnYb4lZEMX5X32a+
 3KQNBUaNxnHnTs+0ePpkWgq5/1KEht2elacjlyyF8XTtZYVsoT9d7J7osTtrkYZNDs+5st0UBPb
 uyKnucwTmTRr736Rb4aRdiGV8vHr8TjhPS0uI+/RPMJsiLPlSzLsnqC0OevpzSVcMhj67GKGX0W
 pl5Zt6NJnO17yvQQKig==
X-Proofpoint-GUID: GW-eOWBSjOzDMb845TNI3Xt5DZdaMqv6
X-Proofpoint-ORIG-GUID: GW-eOWBSjOzDMb845TNI3Xt5DZdaMqv6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140059

On 26-11-13 22:28:27, Bjorn Andersson wrote:
> The ASUS Ascent QN10 provides functional uefisecapp over qseecom for EFI
> variable access. Add the board to the allowlist.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
