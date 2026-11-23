Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445243;
	b=3auDBwvehEtQKCTMjn9dIieq8Fd70qQuJeMyyTTgRTRAGok9T58KpclzkJFZfvq0IgYr
	 5put6SRTvgbyYykSD50VLEjhd9LldQsjKyQx6+Fz4XuJRBIIJJY1JEaLrQaYuqK91yAlq
	 xo2yBQFqAPzBxrNqxB3zIZTq3wviA3/MPKNUtnB1yjLq45CEpCCxb/VzxfiSifOgTB3Vd
	 m70WHJyhRqACssAJ0Vyxg6wRdtbZEaEQEGYVk+daliDVFf/OpawhsBbWqLrvkhgCNepS9
	 oX+Z4SZS2OWT0TinKaGmaU32lCGZIf29E/V9htaReQZWwlWVtkA9GCuLrFfbRSwEK7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445243;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5fRZZavcrvy85m+UEWFX2bfIbRJSvrdSh2BlLbhKEeQ=;
	b=5aqfuJSvyqTpa6l4HXWINj0ZzIX6/IofZniT5Ap4ixnJZDmDpcJVcC9GqMuGm5acsR5w
	 Fi5fLo8lAsvoovHtLX3x6TZyTMr4j1B+YZxUjZdJskB27x1VsLQhn0SmWLpRPD+8TuUfs
	 84anwnsTpLY2AilLVnzh+iJGvWKZyxvd1STNIjjg9MuKrvoDxq/3aYSAv2fgS7V73EoBd
	 KyxYIUMYLT2NSsUYvDSIA7N28vpeEJbhrP6vucmr7SZnu8sO1q/28+qvsZzCnAwCGtYLI
	 hPj1bG9oa9A99LU1V9vdbyeXhA1ZVzeEUIeXPrSBTqHfe7mOH2H1weXVCD3DK02NSag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d13NCqSK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JabvF8eQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27680606A31F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27680606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d13NCqSK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JabvF8eQ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLA8e1938198
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:47:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5fRZZavcrvy85m+UEWFX2bfIbRJSvrdSh2BlLbhKEeQ=; b=d13NCqSKip9QLy2d
	TvC6LMT9vDpvGSj0hJS+ij1V7P9LSb9MuRKe6nC4tN0UbeEtHTu3FvYmDgwHJZ2A
	X0woSLyifN4rzjFlMeIlLP1VVCCKehBoi3iZaD07JRSYmIXX9k02GPDeIgpt2kuq
	5bLe5Su/P9GVnbW0iBPT5vvaFnwNURUHpQTiEXaAn1K7dIVIRhpl8meNBZDU0Rlr
	Am2DpbG2EXI6vzUriz+dPxfQU0eDb+adMQej5XdJ+Ibhv7CYYg8jkf99WSaUR5/G
	QyN5M6UY0DuBdSP8/BcPK0QEgDmrP/2Ie2jLS+dC533NNgNvYxYcyOk86j35rCqI
	w02zCA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx238y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:47:22 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ecf0967947so87079e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 06:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795445241; x=1796050041; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5fRZZavcrvy85m+UEWFX2bfIbRJSvrdSh2BlLbhKEeQ=;
        b=JabvF8eQeUVblzFKTHxAIgSiG6SnLlJDdygb+NVjTwwgyRz9oNO6X8MMKyjCXc2h0G
         HrlWayKTUsRUMETTo/9XAgW54e/qcZtleU7ZIzFYUiAW7TKqbbqgdXKzekntWKIKpVQn
         9JLygSgPzcrJ2s0xC/Ii2dzg5y/yt55Y71UAUlB291Glp8/8YOQYbUWJ3aVdqXC1QkOI
         rwapRmu0ovb319B9NSyyR/zMslFtD1jb2RMTVnbMkdKkzIFxPJOv6O1qJeZgi4rpJEWw
         3FKLrIDa+cW0VeoIQUu87j6YIUBdXmbuEgGfm4QOrgof47MVHQ7ZKOs9SSb36kJt3ISz
         +nxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445241; x=1796050041;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5fRZZavcrvy85m+UEWFX2bfIbRJSvrdSh2BlLbhKEeQ=;
        b=R0amY7+uIFDipyYBe+nlXHpm4rgqWkmLi/PfgcF4601srfvirRjjUbg0y+0y+lWpU5
         Mk47NVMM+qjsYrJq5d+fAuE+QpvxBV8g7Jt+dteYmoPOSUkesS6G+enZ52WX5JEnLrnU
         KNXStm9gDu0ybkKuiM0Ulm05fXmGwFv4QqQ1iRNQexK9WrhABss5v3+bqcxnNB4sQoDA
         ojrMBQeCXcBchlNKUJjE4xyb9dEa1azknJgqpxoaTiAeqtIxEkKlluZvkQgNp6Gy+4ya
         IKUU4fSJJhCpukI45uHEepucD6vHROVEGHxmrBCt+8GBNF5cKEOuW0T95+ZbA9L82eJI
         RtDw==
X-Gm-Message-State: APuU4Z8cFvXghePAxcfCiAKz6E3tZLtn9hEd95eXNUP2bIpbgvmZAlAN
	/QemVpfdPk9YdOGsQkb4FguhjMpaZ0AVFTKSQElmWwLF0UZwxcDOlCLfQBzd86vQ1X2EIszEbd+
	kI4jH3fM1S5DOvsFak635LVTIPeV7lddLPFGNP8QmBdVrJ1pS0WsTdat6KEFs2knHo2+0
X-Gm-Gg: AZFdTZfHaDrPdTSZ27C1FCTioYep7hRmEqG5FEaYUvtWn9eLObcztvhahgwhBUveImE
	rXzex+WpfnBTCztyeMNlWbHFFLn+td4n/Jyp/PHZgOaEFWEdr2rCn+Ik6t6e8da16rHfQzK7ZJU
	0ybXv3uL6W5ZB0XE2sPCBUDym3IXW5RucpmUMTxJ00Ghi0l1JMGK4tjYGijCWZEitn5NDILpO4L
	OpMIFBuswjtqParapWAEI0HoETMK17y+sg/MuBSxEmyjEm6XyeigQP7pdL+vGiBokXJ/FzLkcst
	VjLNYgE0RL/dk/JWsKNjdxbUR9665/Ctez9N/0r2OzHCB7BwP6Sz71tyPGAsif78zOhAJfdGglz
	1ui76jKcc9l5ySDftrXtFryjn+iblIKKKEfN8Mxc+WILtNhFYGN/vp5bZKPXfYs8vfz2tEro=
X-Received: by 2002:a05:6123:59c:10b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5ee8b009d61mr5961100e0c.5.1795445241390;
        Mon, 23 Nov 2026 06:47:21 -0800 (PST)
X-Received: by 2002:a05:6123:59c:10b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5ee8b009d61mr5961052e0c.5.1795445240923;
        Mon, 23 Nov 2026 06:47:20 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8db37sm419262366b.35.2026.11.23.06.47.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:47:20 -0800 (PST)
Message-ID: <f66ed61b-b62e-406e-b21d-2f3a90c90040@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 15:47:18 +0100
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
Subject: Re: [PATCH v2 2/4] clk: qcom: Consistently enable MSM8939, MDM9615,
 SAR2130P and SDX65
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20261123-qcom-kconfig-unify-v2-0-fe56c8fd15bf@oss.qualcomm.com>
 <20261123-qcom-kconfig-unify-v2-2-fe56c8fd15bf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-qcom-kconfig-unify-v2-2-fe56c8fd15bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b0451fa cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=XmsLJy_gl5TqPVFdfuEA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: 3rm6oUMDUo66-6IB4lQe-3Iv91pSS5Ff
X-Proofpoint-GUID: 3rm6oUMDUo66-6IB4lQe-3Iv91pSS5Ff
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1OCBTYWx0ZWRfX+mDRZswsxwWX
 XtCNZ2h9y6m4+iuvxSzXe8WXrRCn9ZihYmuxc5nNJMnhgKjYlLtuTUS6IkiUkf+/4bj4mt+T2Vs
 qvv9i6775G4S4f78iU5lP786p0tpj2Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1OCBTYWx0ZWRfX0fOz19DF3b7u
 nqiW4F3LOyutXnZFS5bFrX3pKWSnjF0igz0+1ExeE4h/wtXcv6L34Glt5b+x8p7iiGsGXpWrRz7
 Gt7nJQcZX2A9vxbUgY+9kptTnT6YKfSyS9FmZilMROejtPF5j6JLGOut70mBVGu7RRjzP0EN/3a
 WDvPplIrKN87XDqXQ646I+G2I9ebB+uuQvqEHmszY4cUxGMAYMgvZ21IpyuyFt+rvrZ31g9Frie
 vEnAWTqXppV70LkOqCcKtW8q2AWvIOHSVckGZtdlpU6iVJ48JJoWZTfKtGCYNjL1CGxErMjcv/i
 x1E+O/zofGU7gEqEoniBoMM096EHk4kOqgHgyPLrXnAFdyZ5f7OpRBBei7wEWUuL6dDPleY211w
 sJbDh9BGDQV/2aWHesBpoad7nsFvfDmBnNxe2ih/rp//Djb3FDWTzjEJdKvhpjbwt5YMpyq/A2v
 iitqKfvJFAwdpCPLQBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230058

On 11/23/26 8:38 AM, Krzysztof Kozlowski wrote:
> Critical drivers for MSM8939, MDM9615, SAR2130P and SDX65, like pin
> controller and interconnect, are already enabled by default, so should
> be the clock controller drivers as well.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
