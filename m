Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264104;
	b=qF3yEufQEATI0hn+VhikdR6edmvpRqTu22weAGhV5jdeC3La3CCjZk3LacO03pO2/dfG
	 /e/qeCiK1Co7iXgBkBptnIoUTICRn8QqgT3PNnw8y1gT34tzJLZTc0sInB5Idrdk66ZUV
	 aG+mtAn3WadRrvADUBaHwu4L5Q1QGLkAWhsoNyhEWc+kVEnsFHy8qlO1OllFb12fw+c/Q
	 pC4dhgS+iSIO6zXudk3SYT5Tvm8FQdwEOus781hOEiquGo58sRdh9rzDzoBNu6QEM0GH/
	 5Iqfg/lo+RgdqOuO1ZvlQ+aIj3uwQxh+MgiBUEehDzM+tWVmyuuoHbZrTXVuM8F+5gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264104;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QQ6HeVU5GVVFeki2uHOI6IzDnII3XEbjMrhu7Eabg10=;
	b=o5m38Twx36aoD5Yo8BfVuUtMlZrKCSdstzx5b8HgTaD7PKsp0B3iXm/Fo9HjhD/0fNxr
	 JWVBV+g7fVlUeMgj5U+ukmwYDiC46bLMUN3mvBSzLWWDoVnN/B/5gH4YJBh7FPxQUP43+
	 5npS3ok28M5N6v6vYYQKyiPTYCUIUxqRegCORew0ESOVTN+nn0r87XKwL9Catu6KIYHr1
	 xMTF9Gb0YPwUN2hSqWr74OyLx8Rv0YebXwLylujvmwqCD5kp9V1rcQc6I3qO8keuKRMk9
	 40YP0bJ6guhoiUrcgsYZjDbn6+DdgSzDbSZBJHeqinZIKgKFNrPyCPyXW/Vw8qydm2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPLapMnh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YW67NKSC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E2E606A31D
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:55:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4E2E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPLapMnh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YW67NKSC
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5HFrC2975020
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:55:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QQ6HeVU5GVVFeki2uHOI6IzD
	nII3XEbjMrhu7Eabg10=; b=ZPLapMnhHmGdrXnxA4Rls95VS0sKEZlR5RS85l7X
	PbpqNW59wmy01D/bnk59t55nrV+Y3krpAFsh0fsy+n/G7UMjAge6wOSikB6GGQlO
	5pZhQnM4yYheIjOcKgNb8PsmemC/dzXWZgHn1QzIJRtt3TpvQDHH4xTEoyRyieG+
	g8tB5QYa3UENUezmhJJgAXueg+iaaFxRWojakxpqYCg+qcHMOyGbCOFZ4Tze6LQl
	cWnXXQKuBoSyNq8H9ONkjlGu8uWmk+nxTtqRLPOXxAj53sS5aaPiIlMY6Z+Ved9h
	f4ckNPJCfG0JRK8JUyDcpGUoawQDUzsiEfYpLsG73VVXOw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknkpb1bm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:55:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caf7856ffso425066585a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 01:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264102; x=1793868902; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QQ6HeVU5GVVFeki2uHOI6IzDnII3XEbjMrhu7Eabg10=;
        b=YW67NKSCZX8bqCPC6YIXhSdbNA1PDWa8lIkuZTQr/q4ciDqcN4OAtX5bNjS5eJPYm6
         ptFP19rYlfn2F/B0p1GusBZEpqfpjc8HULuRAdirGrpAFOgjyHeXjZk+Gq0f78UX/4Qn
         erW7RK316CGovOY8yWjAJsZfPbbCawFdgSB+ra4EiCEHlzdrw65Pk1bCGI6jv99agNkr
         1QITaIR2iNwZbdYS2hgZMPynb2iwryanNbQ04vTh770EMdwX3xFUJynhg+jWfghHl6St
         3Q/uRaIklHN3mr9p2yTSxBRuCd6eVyNqXsRMG4+7NSd6LQiMtHWCwaqpIdqE7bFurxt4
         k28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264102; x=1793868902;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QQ6HeVU5GVVFeki2uHOI6IzDnII3XEbjMrhu7Eabg10=;
        b=fr2PVf+U2ibhCzO6YiIIAiAmxdfar8CYMgrO24x0DdvYjwq0Ae0MYC1KZ3u0KM2JqL
         rOUodTCFFwOVfcBINC3pPzUCqjVSpCj8qd4eXDCuLCnd+K9JACGnj2CsmQH1cMZHa7KJ
         Jq/s86xMntJmfGvHJ8fHgp1xbLw6bJie1+ZJYlZTEZqKHNSi4Lvv0GWCq1LNvyR6NKRM
         d33r18Y5UchiPVTNje2cSy8ewmP2jYO0vFvsdNkFaIM5HtzSTDyIWoFXUs3fWCEXPISH
         GWDZOd6p5f/Ta72WXEcWKx7tC+gDhsjDe5mU3TJaJ5p5zcrRLVY5mKqS+hZphk8jBCWS
         dveA==
X-Forwarded-Encrypted: i=1; AKwUvBwoI0b6+lZvhR1CRBJUVjrLnatAkOp6Up0FSLOgFEFXKWjd4+xzi0c+lj8niRMAaxEvejZ4LSpG4/h2QpLk@vger.kernel.org
X-Gm-Message-State: AFq9FYLnXwnDSh27m4yofQqrParTVsPrOSXmq+tODtBvXYJRrGszsAKL
	KY4ffGI42NBoQLJ7rIiuBzvCPXww9Uo+2HEyTtfrf49QsT6bFajVrWX+RIaKPMdPFle9MzAwM4C
	nXaFWVl7oXYFFz8WkzDJVaU1Ag1/g963TTKyYZfzCXWfYT4D66g0+5sFkE4pZ7uSBBF6pnbkFbm
	w+
X-Gm-Gg: AYBFou3PnqZRXozhG08qwHZOtXWnXckwrm7K0SLdEYg7iqxVqaVvLudnTGpu6U1g4Yk
	8zXFo9UyzjP1hf+pqkEpA2iTmkH4oIAES52D5e9+9n2xiU905BtZQmVcFV4oHw8G66wcSGSGVNz
	n94KfePZbT3wRaE61MBYGvUuA3ceyH/Ih0HWX0vKoRSNerNv9efQ4QrNS9jAlR0fHhGDSIy7cfx
	p051/95uZneq4mdhAaRmgU7C9C23ZRnyhRToeipURYy+xde+58EcS4pkX7CpXpKtUaLUc8BdeVk
	rSx6qW17r4JbUZxCMqjTD1xMWbd/rx5UVwBeaAMcQjuokHQIwVRBafS7jERXu37F6PqV3U6eqfm
	Re72ly83fO5xooXkmSnXiv/+0OhhV4VsWgYjEqtXQxoQw2hJeWGAQ1J52wuKOhEIK
X-Received: by 2002:a05:620a:172a:b0:93f:3e45:a419 with SMTP id af79cd13be357-94408a96943mr696890385a.38.1793264101747;
        Thu, 29 Oct 2026 01:55:01 -0700 (PDT)
X-Received: by 2002:a05:620a:172a:b0:93f:3e45:a419 with SMTP id af79cd13be357-94408a96943mr696887285a.38.1793264101109;
        Thu, 29 Oct 2026 01:55:01 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94f05e4e4sm71726295e9.3.2026.10.29.01.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:55:00 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:54:58 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH RFC v3 1/3] arm64: dts: qcom: nord: Add display subsystem
 nodes
Message-ID: <35epdbgc7rduuwrrn5y4kygqk7h2wv33d4tr77qzd37xlhomi3@2764myqvenzd>
References: <20261029034728.633495-1-shengchao.guo@oss.qualcomm.com>
 <20261029034728.633495-2-shengchao.guo@oss.qualcomm.com>
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
In-Reply-To: <20261029034728.633495-2-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Ju9kP84C c=1 sm=1 tr=0 ts=6ae309e6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=mY-c6RtcwyEVXP3PGRQA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 6Wp92uSNX5L-if4dgUJoA5doBX_aysNe
X-Proofpoint-GUID: 6Wp92uSNX5L-if4dgUJoA5doBX_aysNe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX+eiDR22qxP+L
 n5U5dQdSXJE4xnX+F3FrSW0UoXEBJmFgTyaciZekRWkdrHKlEuzj8a/FVHMd4t6nrpT9pnGSc4T
 PF/WEf/py7tILy1Q9o8gvv8VOP/NsmA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX6/zMvHsY06WC
 qWD6f35bjovuu2bfr5++DrkcqyDbtamfWfA2eGMMS/Mg1PbVtMyv2jpLhLQhDfGDn1Cuyht3flK
 aQly1VnoUZ7aYKZC4h9CFfXNAxikHI47Q9atOM9/l0P3LjhN7z/Gr43YWW+nKYbFa5M792q6moV
 1HOghUiZv+5W+qA9njLbYGS7Lvdg2qK1WAYVbC6C0GbWDyaTXCi2oWvdp4EX1xslm/G2tzCGO7n
 DBEKeN3/zr40PNwUyuZCUwABmr+wnYAQorG9qdJv4M576nOdNs4GZHjLl5AOgCbYBiJike2EUrH
 ME2e/MSvGRT1/Xgs/oXIP7d+XfeBHYiRAA8nN1CBAONC09U3iSTjnuYkxDNcMc2UQGplthv3v9P
 sHmrobtaQ8AfYN7AwmxxDaD+OwUmDs4ZkT33AvfBmMgAsBlFud+dSNwgfVhpknvQeY3lL9A9Ub2
 4aYwl8FVxqckzISPHyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290034

On 26-10-29 11:47:26, Shawn Guo wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Add the MDSS, DPU, DP controller and eDP PHY nodes for the Qualcomm Nord
> SoC. Nord has two independent display subsystems, MDSS0 at 0xae00000 and
> MDSS1 at 0x8c00000, each with two DP controllers and two eDP PHYs. Nord
> is DP-only, so no DSI nodes are added. Wire the DP PHY outputs into the
> dispcc0 and dispcc1 clock inputs, which were previously stubbed with
> zeroes, and add the eDP0-3 hot-plug-detect pinctrl states.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
