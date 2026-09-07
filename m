Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B4D413230
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 10:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788777062; cv=none; b=fHLQJr8qce3pnsgksOVPJtUUydkIWIJiQDTKQ5YPNnolw2Zpiva4A7Oi8XqctofhzriIPO85xKULNcL+Pg9cOZXnRyKfpo5FmUL7wvSl9KQCKsUrhRcoXtaL+k2T0dzUwFrz5kIxb6ML8ZvK1GALZFlEmFhJ0cJ0ULW3CdtdKNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788777062; c=relaxed/simple;
	bh=TmrWz6bOPjP96DJHHe05YDQ1Unf2iuG6IEzup5sn/bY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nCjJPUeNDrImCVdjAqHYlbOBWlcPDLHytTp1DDNffIQPIAw9XHJSVbHMbsWqOTVOmVfHjbHRPI1TwAsH04Xxoo6pYnQOfNI2oWgKjHU9sDsFBl1SJDoIAWD6HR8caT7oV9k/k93ul4jZ2VizTGdsSgoQbzVvmfVo2pt0SszlXTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MkpvtxPk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cGQmOK6u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MkpvtxPk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cGQmOK6u"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879bQu5648820
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 10:30:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8MKYzD38ejq+QfCLrmAsGoMh
	9k2OMHUy0zDkIWzsaUI=; b=MkpvtxPkSNLm0L6xLv7oq8exFlMxuY55+z81JB4F
	YUNTYHSYkLaOENAyDw2RdHmKCGldRwY2efXjXPAEZk7aZ8myLk4bAOfw5X2lBtC8
	s5Bl6HJH6nuG/YA5RLdJ5lHz7UCMCZaTneXLTzPTgDv7wkzRsdtzj5uRXVXgWag7
	SL+NJMTPKrWJ/K/QcGhUDrVbaGsKVHEw50bh/2HQAHg3mWr6V8699HoaVymUDZRB
	6g2wlAh6CbVCDJC5t87swBIdkXUj3jWN8lKHFfCDErUz/KkH6u9ZEWzj9GYAxIMT
	W4oZ5XLk2r9SJ2bkPYmRgRBzlOg5WMFpD/CFkY4ED/5Zzw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghrua8xxr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 10:30:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93494cce712so612343385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 03:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788777058; x=1789381858; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8MKYzD38ejq+QfCLrmAsGoMh9k2OMHUy0zDkIWzsaUI=;
        b=cGQmOK6uKD+ecuq9btDIqTX8gQ+3Pdo7u2YKjiqSrFflYbkOclep4JVfn6a+W8sNJR
         nzyekZuAMGLz79ZGfUatolrBoajEbDst2ohDN97HssqvY/AzhbmVJIKi3GO5wOALZuNR
         tX/yULnMJ7XTK9eAuj0AGYcELRRX4T0c0a67/FKH9d4p7Wl8l9EznoXCBVptD2pgPnm0
         V8mCNMB6y3lQ1gVQYbqMom79T7WPP+PW3ms0c8JRAaQrnGkVkYvLFZRDG0fFMGppbxmt
         NxaYcyegTf8UG4iL8OMAe4egs6MOfa7kbmPZpNwJ4O7IXiZGP+BphgeDUa+kYzwOCA2p
         A04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788777058; x=1789381858;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8MKYzD38ejq+QfCLrmAsGoMh9k2OMHUy0zDkIWzsaUI=;
        b=PnCl4BUeoQG+LkTJxDl8w/8E41Njhx64LnV0Ic1z1p9uhzl+I4q+WOBeoOgqNhTEdU
         /TF+TYQkwW5E/KtWs4odtKv3A2pTOwGI7x7jXaQ8d7NGpH2SyXWnqjLEP0IbuR1OqnKP
         rkDw5Du9KoY80iKLdSvdUfKKD61LuD2aDPSHZJC34OoR1QjFIKg1vrketcd/izlDra2i
         21Sr8J0BPK4rCSM/wH2vv1Sq5MagPPZGIxF5FZuHjQ0K7D4wFltvk8nVfRmgB0vBYx+4
         sdvYKsuZ2s2IrKvfB3ovnALCjZo+sSb7WXp8yrd1HSdFcsMyyPIDK4SFqADQHRVFbL03
         hLsQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTlDzqZedhkrtV0h/S0vbGJ2ZP/tVjmooreWog1hziKYhnxN+oHWwt9P31272OBfZ13uyladYJHOhOULQG@vger.kernel.org
X-Gm-Message-State: AFuF++kS3gVUUYP9WghONFdMqV3BGXZDtU6I4G7jhuTDPtx9C9kGu6/w
	MBdtS1o0FlMa3KjSRxAQCGrGXIR6ju6NiJTvblfg9vj/OESC2t+YcjfEA9kMvk4HZdiAt6AQAS6
	w0IHbLkgEBgEpnYmaW5S0L9d59e+P2pZ4A99LJf8AdO/0V/H+G5Cbc/aCEKlW9+hpA4EN
X-Gm-Gg: AYBFou2xE228fn8citqkE788SJBA1W+5wCrzZTx7eYEmk6ujYZDrCEP2dCnTi+URhv3
	VL5rTccllWs1hTpC1hjh5YlmUpm78sOo9PRWk3G++GtO+2VrAM1tNljnYj8HUppQpRNBjsq+qxg
	LGFnkT/Ku2e1AelfItCAFqbIHWpW+wXVl73asdioLI39C9YHqlBMlexCTRf2LToRj0L33g6S0ef
	vIPBVHy92mI891voKHia/uxi62FAKPVOyG1ZcrQ8tvsF3xuVE5KIPg2i392bBciZcxIdZucfsZh
	efJmXX1CN+h6oQ5ON9L2McB/fcMguvcXR8ur/RfLb6Nk4BEmvPdN3WPhCtZii65I/5g6d8CR/t/
	n/I+q2Sm8DC0R
X-Received: by 2002:a05:620a:1b8a:b0:939:ac74:1bbf with SMTP id af79cd13be357-939ac741dfdmr430146885a.4.1788777057581;
        Mon, 07 Sep 2026 03:30:57 -0700 (PDT)
X-Received: by 2002:a05:620a:1b8a:b0:939:ac74:1bbf with SMTP id af79cd13be357-939ac741dfdmr430141385a.4.1788777057034;
        Mon, 07 Sep 2026 03:30:57 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf75cd8d0sm278699115e9.2.2026.09.07.03.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:30:55 -0700 (PDT)
Date: Mon, 7 Sep 2026 13:30:53 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] clk: qcom: clk-alpha-pll: support a 28-bit ALPHA_VAL
 width
Message-ID: <r6qvtedkounw2yvbzopjeoqqvz3shlffzmrmizobokfgpkkblj@p5fpetc65kv6>
References: <20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com>
 <20260907-nords_dprx-v1-1-d472af3f01b1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-nords_dprx-v1-1-d472af3f01b1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 0DDPOjc9Wq6WrnUuocBHNTsJ53v1itEA
X-Authority-Analysis: v=2.4 cv=U+aiy+ru c=1 sm=1 tr=0 ts=6a9e9262 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=q38Eq4LkVyZCF8x0k14A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 0DDPOjc9Wq6WrnUuocBHNTsJ53v1itEA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExNCBTYWx0ZWRfXwr79GM8hZyEi
 mMW0r++8qQQlGvwhZyDZBeRG4ZkQS4GE1c/KjFIphpOAnvh22sbm4LuG6eqDH6OOvEFJPvOiafJ
 igc33ppsfLJmEL31q5qHjBLdZWGXUiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExNCBTYWx0ZWRfX7eyYC/6nguY6
 fRqGl/g/IDA1gcCSF4n3jB7UJjcSySqrGTDewuoogN9KTAA0GOojoM7S2ptjWXekBlzq3okIJTH
 l9SZMhv9LU758bAYH0NrC9nFmzJQCC6zMCI0mZ2Q/RYWRZOFcVUjoWHLjvH2UA9TBEAzMh6CXJx
 Z5zXXvBFCRhJp7jXLlSgpYzxHwfRkAKGVnySNmg+3SmZNMcIKwTrP871a+7A6s2QMGj0TO24yei
 ywwZGhtbCTVBGOpKPA/iqPoHyDQ80qCcqYNbdTlwAzH4UH8D72YJrf1DL0RMPkX+hKZ3uS/qkzO
 T1cQ4r2/LUYCumEsYfgHIAglTDUjDffGgqCIFPDRjzeO6kE5qDnNQMvIjUn9RWCIGf/m1WjRr4/
 D+HkUi3RdXaiaD32lIBqGnaVgIJkLx58tsq7FBHY4tDX27v3rkXNi7dXHvBtYh+2lvnLuHQCijX
 I0FS86qeGncZ/8pR13A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070114

On 26-09-07 13:56:13, Taniya Das wrote:
> On some PLLs the PLL_ALPHA_VAL register has been increased to 28 bits to
> carry the fractional word at a finer resolution, for example the
> ZONDA_OLE instances on the Qualcomm Nord DPRX. The alpha-PLL core,
> however, derives the ALPHA_VAL width solely from the register-map layout
> and can only express 16 or 40 bits, so it programs and reads back the
> 28-bit configuration at the wrong scale on both the set_rate/slew and
> recalc_rate paths, making the PLL lock to and report the wrong rate.
> 
> Add a way to identify the wider register: an optional alpha_width field
> in struct clk_alpha_pll that, when non-zero, supersedes the
> register-derived width. This feeds pll_alpha_width(), so the recalc_rate
> and round_rate math scale the fractional word correctly, and the Zonda
> set_rate L-adjust MSB check is derived from the active width instead of
> a hardcoded BIT(15). PLLs that leave the field zero retain the previous
> behaviour.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
