Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A56151DAF5
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 16:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791909357; cv=none; b=HS9qauUz/r7OSd7ZgSUlHmICPO71YzIgksaBXFG3MYlgMX9ATcvXAZMx4lwFPbCBLWB1tRUEKVqAh7hfff1lWIK6SnB4xFFTq+I+RLoXoG+oK/D22ir9aB8Fs1b1Vx/l9mkD1ANSmhN1wZDM4zPScRwhNov/LBGwkXfvTqqaqHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791909357; c=relaxed/simple;
	bh=/37o6SMMt2KK0+yPuVjPvOanQ0meYy2PUx8BVOAv9VU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=qUXTUSLK0hn27zGopXxfsia/PLVz0YizGlATz1u/kqdC2q6ZrI88oikAJtcSn7I34FpKsOVPQwGx3xHq7CifvmaW4ELr65hHh+gXXCQP90h86jrCct66fmZnx+vY4Q1Ml5tmaOvfzqLhn/xvKLfZ//I3mgP+uhoXpqx1VkgEf3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YyWKoaMP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y3TUZ8q8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YyWKoaMP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y3TUZ8q8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE44IY009426
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 16:35:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T10UKbhm2zdtZAt/cofDMRIn3isVZYRRzmc76dZ8BAc=; b=YyWKoaMPHX9bV37z
	C3ARFrXjPW9FwpDeqA2XfGDoBCNmWTtkJWJbvLZJpGEkvTCjlS+chkW8R3RUdBok
	w2MBVXUtXs6WV0kY002MaUmIwLQNBZ/uDwSQIVV9QmI7IBqOvSuQEnX86Xc6aVG2
	R8NlpUwjL8I9sYZFybvk/iu1pGICUZVgcRwLjCm8xU0uPjS6ibYpkhUeQ9yH9iY6
	GNZUzjHg1oNe5j4tjYeBJWler05lzjgNlIHbnlBs1brh3fPyMpAgQXVF/wB1eLbF
	VV1YZFcNqexEqdBnhZeTm32xo73fDM4pfhVM3V+1SI03yUWrOUuQF0DBCxzHtNH1
	KhpLbA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9fgjjja6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 16:35:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ca9b53afaso871186785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791909354; x=1792514154; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T10UKbhm2zdtZAt/cofDMRIn3isVZYRRzmc76dZ8BAc=;
        b=Y3TUZ8q8tFa9pMVTi+4UAcbNwrR1GD+jikkyFq6zRpvkxxIfGYBL84+DnXcyhGVPNS
         vLWslFsRpcMENrW1L2cGGHMASLNbVjPEf5M9fCixIkiuut26Ye1/l9mxnXpnVIJQmA+b
         1WrQfQBI22fY0Zzv9Wopvb0NVW5q0cFQWhKPfbQDcSVzG9B0B2xVfnVZZqQhBtrfUrZF
         G1YBc7wsWJ0fj7n+1SB+5q9/z2bXSK66cWG5nY6kBK8QwLdBKrXCJNWHaXbiX4OFNrFf
         32/YLsweJekZP0IZaY0O8EHNmBk+OrJM0rSj5KeIu+P9HmY1CvKiHdBhyGpPE4cYK5Xq
         YTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791909354; x=1792514154;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T10UKbhm2zdtZAt/cofDMRIn3isVZYRRzmc76dZ8BAc=;
        b=QeYKOSgRn0hGtYy2vLH/ziSj8kMnqhM9auSR2glzVhilkFjK4I6XFnEW8mekTunT6S
         drYuUxy+zVP8PL8hIbYImSvShUivHu6PUGXY7PMNEqiDjfz1ggHooy6y3EX1MQAeTMmP
         dGKdhkkffrUqmUo+8hVQ8HXUTQqLtruot0dDES76CS8Xij7JtIIUhIFbTnTqIwJkQlSd
         nel9dDPIvmga2W5/0v7AY7ZzUGUO6+4Q4v1saardkj2KC0uZ8aVRXWe6uSmzWO9beviH
         +Lh2suxItFR2HGYLcsZrRME+/obX/ti9xvGblBu0EZHAxPp91zJeDzBzEBG/4oPu1mKH
         LmlQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIAILvwchH+uifVuPpTdKqJ89WPPyJ2QA9oudlwBpO78mup/3E4LW/L1/M4rDJWdXxqNoI2hoox+5fBSn9@vger.kernel.org
X-Gm-Message-State: AFq9FYJVG/vzlnmR47JRUMOO1msrXWJ+O6NEH1O++/rU28d35wVUOBrL
	Q/b+2J02jQK6hAA0xk+rEULaTgGIouzo+D8PQ2Ekc/WODpQy8WoJVkRXzpPzB6ctxLRjcE103cl
	WiU9o/xXksIqTGG8WPRASXotjliqliWKOfdtI5wW94ACCQmMaVwTufkWjpXh6g+z7NwKPeQWfY6
	7C
X-Gm-Gg: AYBFou0JpkrN7TO9Mgi9PYJXEZBTrIev9Ew7n7xJvxOODt5lxF1FtKiAFcH8asWlz2C
	089o3wekCYK+xbPdVNEPiV961dvjus7YsfY6EDMlUgGo8GJg9gPTpwzOQRKxYO83fh7Ppo48JlP
	Ec4AUrbbFBIB46TRU3g5EX+SHllQN4IaddTs3ullPXKWUl0ESxNj+7LZFKtGe4lwzBPwFGKlYac
	sKddIKXDSzjEuTzZLnLJy0ceMRNHNP3Jotpjd4YcwMr2BwYPf0kFDGAVSyBkl9aNNgojc3ikIqR
	UrWYFjDZGJGmvdMytsIAMfK6sZowGXIMlamRS/azs7UaogoMqAqwIkMhp05HotA6Hdnnv5bZ2Gi
	+jr6N9jUBS9Es
X-Received: by 2002:a05:620a:3720:b0:93e:5eaf:dd87 with SMTP id af79cd13be357-93ebd2a05fbmr2189946185a.62.1791909354248;
        Tue, 13 Oct 2026 09:35:54 -0700 (PDT)
X-Received: by 2002:a05:620a:3720:b0:93e:5eaf:dd87 with SMTP id af79cd13be357-93ebd2a05fbmr2189940285a.62.1791909353679;
        Tue, 13 Oct 2026 09:35:53 -0700 (PDT)
Received: from localhost ([2a00:23c4:e5c9:901:c496:8838:86d0:bc8c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc506asm6445450f8f.47.2026.10.13.09.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 09:35:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] arm64: dts: qcom: agatti: Make the ADSP remote heap
 no-map
From: Christopher Obbard <chris.obbard@oss.qualcomm.com>
To: Benjamin Kelenyi <benjamin@wendy.sh>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Christopher Obbard <chris.obbard@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261001085247.1897991-1-benjamin@wendy.sh>
References: <20261001085247.1897991-1-benjamin@wendy.sh>
Date: Tue, 13 Oct 2026 17:35:43 +0100
Message-Id: <179190934307.2042121.13130632112509363375.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=773;
 i=chris.obbard@oss.qualcomm.com; h=from:subject:message-id;
 bh=/37o6SMMt2KK0+yPuVjPvOanQ0meYy2PUx8BVOAv9VU=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBqzl3kgv0HkP+uXeUhrPxsN1adNVnfYKfplRwtm
 UiYGcnShE+JAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCas5d5AAKCRBjTcTwaHBG
 +HElEAChxd9Y9VKZA880hfAmGhe/ai7iHBrJj8bRzE+IxB0N2FHWtirqnt7BsNLyb4PADQonp3w
 ybZnIJUP/CaiOmqsQKnLDpPBQ/AOeax0g80qDWtJPwM0mqqQEOG1MVYInsyQjww8wzgJ41W5YJ8
 FFCyJ7t9lgQ+CLlxNI5sdKGwh62Pwt3xe3twYAtvDM6Ombbp6rE8x32SUjJAiUuC648lN7yd9nX
 hEogoMDi8i4IOC5Uj1+7PMdclosz6eSWt4HXDBv1qJRa0PGUrE8F1zivQm/gjS05ZReYlTJWD2h
 0ZBuwyqR0hRQR+Qm3rkKooSqjT/kNcmNhlfJO74XPzJm1PLZ70URR0AHjKJzmfxnza8J2Y5n7dl
 znmi0XkPXhHSd1YXLS+SYsLkFtxB9T2/dKdsQKjEUXI1oRQGa1Qj/zfk5d74fuHpRuto5o+u5OE
 2jQM1SGhNkSNsH11Y58HWmqStABY8o8ecQ6lNVsrVJ5CACRb9bxwRvc+XAv7+2yv27cbMvsZ+Ao
 27eStqvjCJbUVH8+0DmpNKVLBqsp5WOijDEbkFyM+IWoBiY6ZYjndMBKjdP5Lnwh2fOEUVKliSm
 3N2rAiN8K6R8X6Z6gpdX76jgBvguRLyfRgufMNDavw289zapB37LCaZ0kUNbsD5n8bPyOM6QXH7
 hcRB1+6sqtRGC1w==
X-Developer-Key: i=chris.obbard@oss.qualcomm.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Proofpoint-GUID: yRMrEuarhixU8lMNlPBuSaMXvFLxIUgY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA2NiBTYWx0ZWRfX3ekP/6/0VWCf
 kF35F+mM1u7TZgcEI5XgOnfoaVwgSvkz84oAbdojTGjKZFZmhfypyb65fug3OyESY0zSgCmrAjH
 JeRaMtzPZNPHQ9EPRYKYT4/78l5SxHxbCGKwwBZjGNlRszwKmVXAxT4IgZaIy5boFlY5MqsbKih
 qR+LZGugGtBPC9MsA0Opr+zfYtM2hvp4EZmXFJRG8dS2FoBWasbX1KlsgPlqf4GHCNy0MYHeXvc
 6XfrUDOeKFemiTGrfTYfALu2Kvj3FT65xV2n4Sfi3CYsKNBzPHsSg0Ao3WOhwoJS4vVnnTXNQ1R
 xjSEwlzKUKZCHKwpFFgL2Oe4t5PGsmOvX0ryaOPkW0yu5pN27Jzkl7p3flqpOG7PYJuNKvvCoYw
 YRWj+r7vjdp03ZJ1aSpxCDl0rzCxNI3/JWOFRpqK1jUNVhn3/6LZW2MeWoCK5Nie/qYE5z1otto
 UJJdof4mPqTyr9nOMeg==
X-Proofpoint-ORIG-GUID: yRMrEuarhixU8lMNlPBuSaMXvFLxIUgY
X-Authority-Analysis: v=2.4 cv=PedqFShd c=1 sm=1 tr=0 ts=6ace5deb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=oKKEO0YrVi7KJ4T4WXQA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA2NiBTYWx0ZWRfX9h5/2L1M6Y19
 XdsYjRVyWjqEHfofgDGa5YlEaCs3QIZgADaCkLqqqsVIF8gINc4DCOxx4ns5MijLMXyTqzMf2af
 IgpnvRr5wH4VHDTcL9wk99L7L6KVjuI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130066

On Thu, 01 Oct 2026 11:52:47 +0300, Benjamin Kelenyi <benjamin@wendy.sh> wrote:
> The ADSP remote heap is declared as a reusable CMA pool. The ADSP has no
> IOMMU, so fastrpc hands the whole region to the DSP with
> qcom_scm_assign_mem() when it probes, while CMA keeps lending the pool's
> pages to movable allocations. Once memory runs low the kernel touches a
> page the DSP now owns, and the board resets without an oops.
> 
> On an Arduino UNO Q (QRB2210, 4 GB), writing and reading back 3.5 GB
> through the page cache resets the board within seconds. With fastrpc
> blacklisted, or with the heap declared no-map, the same test passes
> repeatedly.
> 
> [...]

Reviewed-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>

-- 
Christopher Obbard

