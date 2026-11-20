Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168552;
	b=Fd0adw4NAXNdvNXqoJ9nopRiD2kK27dqR5ZMsKy3D71rsBaTzKC2JDfG2WWBQCbDebj1
	 FA413EX08BCnHbRlPNsW+h6SHdVliU/B8dGOnAGE6XXTY36hi56QBpOWuxlWClggzQgyI
	 U9OmxV9utGTicEo8XeiXjM/LEGcoFs1fC+8qWT5O5lwMQvZv8Djsrin5ZbHB90aQ6Qqjk
	 rcTc+74Wt9DgFm2zGhqMcWixzgSRlxyfxlHxIA0kJ+YJizu8td1LS9VWOzjaFEIoBd8aQ
	 jc6rdhb0Mcbb22g201dC9wyUah4xrZTcpiNbs3cS1CRnpP4H71EV4Ob6jlblo5RXcDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168552;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CZRtRNJIcx5tpZcE/meWoEdRLmxr4t/Ov352xPdWbsw=;
	b=yet3S9S9yvyS62IwHGVpvWpZj+e268vO9jn+eNDI8k9OnGaWt8GCYLuFunsFQKCVXjWo
	 11GvwzWUHhc81Fw7hOBvt6xRz1O07xCgXk6gHhMUE2x6XfoXjsIIQsvHjNshT9DvzTn+v
	 cH83BQB3wnh2NHAPr6eR7x4Q664FM289YmoEMt6aztdFJ5ydQ54kxHZ/vN9jasCtcbyQ9
	 MlA+h9zthkWqD37h1mAtvoP9BWDjwyeO7iWzbAtu/1H+P0gMhkEG/qDnyygnrqwvB6JBJ
	 7UnupDVVwFvsl7JWsBil1mNtztBM37MS8/6qLTOwiRNhWHI+z6o8g4e7XO3IrC2Jpgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PNE9y0mU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=STpN2Lgn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8BE60A2623
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:55:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB8BE60A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PNE9y0mU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=STpN2Lgn
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7eqYx1268327
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CZRtRNJIcx5tpZcE/meWoEdR
	Lmxr4t/Ov352xPdWbsw=; b=PNE9y0mUiLrYKREnSHniUdxHBIY4PWHWFixI1wgv
	FraznClJEgaX63euvpphzVxRdt+tOWJHB8aQbFTKSvwuYx6f65wj+KraV8QHI/Ha
	G+io+tqrve1ETeIUvsuzGghPvJ9/AfQgdVqn6abt1MhBL3i4pmh7hCCRz1kEfoWX
	sfG31EvPyU/ouxZNEuLlSvgUzUavAuu4tfQ+GaLYQDM9uwHxcRPM/VVpAkURydbY
	7C8Aw5qqEowK9TmQakArBpk+w7jDByIPTPhj0GF2mVSiCl/2IZqhVaYJN9wpmLCs
	FgkfKpgFvdkzi9W/Kf9VUBymuTosoVdgjihyxZgXGepytg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1styx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:55:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2c0e6653so137429985a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 01:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795168550; x=1795773350; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CZRtRNJIcx5tpZcE/meWoEdRLmxr4t/Ov352xPdWbsw=;
        b=STpN2LgnfGQP50Sb3P2ahctYc18vYbMMAvbrQAXP6LNsVVf/eRdX7r87DG5PqvubkQ
         2HeHU5kabR7e/ZZilXJnAXvnr7ZuU0hTcRbWbns/FeaM/4MvYA9Am8qNsVaeGxtoIMY/
         QzpOeHcUrvuirj3qCz1qlj5zuee/wURLSg4pXKOKLNlfWXQ4kJTnDJJSk2fqhvO2mP87
         0ps2w1q/J6AE5yq4aVDa/y6i5q4prtnD/sz7q6TJvcD/HOZj2iCG+qtTmagIyDhn+cZK
         AWXPTcKMQFttGuY/r2jQwZ9Zan3TGxFeWxWEVnz+z0ygorIb0ZYMogUTS0mvO7fzeAsq
         Tg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795168550; x=1795773350;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZRtRNJIcx5tpZcE/meWoEdRLmxr4t/Ov352xPdWbsw=;
        b=TwIofxce11BmBQYMA/F124SWTOhzplbKjwl5/qdfa7aeiZ/qCkISafNhJSz/fNEqeC
         3lC4PHikRFudZh/WrgBqkl0s5M/wBEk58d7O2PEprChsJT21jDxWIGWxXP37hP+rLXw1
         Knlpnb6KpwKtMReDb9jEy4lMaCsziaEfT26b9rRmR1LtpGtLOElpiIsv8KoBfqz5ntKc
         3vaQ3eRgcDDKm+Q1F1a+wvoxVwioomNN2qssnU6re5UQlubx59DhR16m5PN7WUe2dAyo
         YeOIwdmdOiNu5lHeZO4iKCm9ih7RXSdClbpn2Q5mOu0PbvEAJqRq1F8QqMTYv8/OT/Ch
         lZ9w==
X-Forwarded-Encrypted: i=1; AL+hErEU+J+HNdofLrJq+ZP7MgO1MYjLpwG+igf0ljKZX4+78UTJcnoGRUKF56s9ozRIGBFmxM2Ve3Mh/Ll2nGF3@vger.kernel.org
X-Gm-Message-State: APuU4Z9vowfSHVHOQb0pv97giaYOmMeAsdNd4luodEmILyn+EM8HuKzc
	5GJXLz7FwIJ3vWZZK5EKIW+rzCU9ir9h7pyHc1/kmT1yIEyBVs7tCkFZgaVWjNDjEu6dHh0qEyw
	+Rd8C7zNdy5FcbuW/EVfoSwpUNNyOXgtETbf0KtVbM8jpvsH2UAsQ3ACICeCFxc8Wutf7
X-Gm-Gg: AYBFou0s1KLPOFi4X5GJHrD9JwemWn7AFYfa/CaHUrLiz/a4n2jKWo0AKAFfQPx3Xt4
	td9e/z4XQron/jxNwrgn0dOHrnWRJzqO7cuId1ac4g9hKTnrmIZVSDPCTWOWOcCTdaWW4f1x7KZ
	/nKi6E1rO0kYAUjEKEv2H0WlQnZznRpzzNRk+dDBC8WaBKusSKrves3lf8vuR6Rn5PEGd+fZZ07
	ItJasJDLcCpnNFQXq9Iqb2iUExSjEIymJgeoZnpS4gTmEasA0tjCnykLOdP2y4H2+b+m+x7xyBj
	Wb5wA5dPSXK7n19fZW/PSFGpkcewtE88ypsFT4Y5x28sFEhsO8tqHH6tfcZClACqUBvR4b7CA4J
	02H1hnWcdazHhw11pwdMoknX3VdeamUsUCBMIE2SvxBkUxfYDH6mpUbO2Qyu/Bwcw
X-Received: by 2002:a05:620a:4446:b0:949:6574:f367 with SMTP id af79cd13be357-949bac8c5a9mr375969585a.80.1795168549899;
        Fri, 20 Nov 2026 01:55:49 -0800 (PST)
X-Received: by 2002:a05:620a:4446:b0:949:6574:f367 with SMTP id af79cd13be357-949bac8c5a9mr375966185a.80.1795168549285;
        Fri, 20 Nov 2026 01:55:49 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad6403fdbbsm403031f8f.15.2026.11.20.01.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:55:48 -0800 (PST)
Date: Fri, 20 Nov 2026 11:55:47 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] clk: qcom: camcc-sm8750: Declare icc path dependency
 for TITAN_TOP_GDSC
Message-ID: <pl47uhsz5kdeotyf3iooknskoyltx4u3bk3rjnqw3yyncfatwf@kdm6oukmsuzl>
References: <20261118-camcc-fix-v1-0-279d269e343b@oss.qualcomm.com>
 <20261118-camcc-fix-v1-1-279d269e343b@oss.qualcomm.com>
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
In-Reply-To: <20261118-camcc-fix-v1-1-279d269e343b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b001927 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=5oq0a7C7ARd697Nuus8A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: IR8c97i7BgR6LgB-F4qQcj0GfCoz2sSj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzOSBTYWx0ZWRfXwfDu9juzHCs0
 2YhNcmA9h50joUecOKlc+21PBvaUAX38eQ7KgydPayfUoaLD3GBobuMN8PsP1r1eJAnXM3EJ5Sd
 tT99dwONGLEQSWC4oEofXMIosZvQ3BybKGxJU1jR74nNyikmVn/Mdf7epgQVs3TESRiPBnPC2ON
 XULHNvNxYblNVViVUrY2gRl7HIzR18uSnCsDHTDl2rdJc1TmTDAI7xS+udw4AyY2dMvGi/zRIBO
 tjNzAr7L0posmMapEpQV66EDQVLNzzSNTziKBVRLwjbErGolH5BCiqps4yaWbeTnTSt1WLaWA3R
 AUI86zDKQjCPARxLFuKS1pacFPTgBaJqCmqqyRNBnE7Es1vi5Ls/ykaJPi1/DQg5fD4T/2jVXyS
 lsR/LwFkhBMO6ZUfL+NQMED7Of0LItx5o2ZIpWn5NM1FdQaI9CrXnLJrS8l1GwQl7V2Ch0ZWN2u
 LO7reN1BxLqNo5TRy9g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzOSBTYWx0ZWRfX7uj7mhqqHt85
 ZXwhTvCJelrJA6EJ0OmtzOnbWAGCBGUfF2obigIaHffRAW/xyLu3cyoIUxkmTXpPE0Qeu2R1s2I
 0GC5wdKDUDCmH5dqbIsDvI8uppweDMc=
X-Proofpoint-ORIG-GUID: IR8c97i7BgR6LgB-F4qQcj0GfCoz2sSj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200039

On 26-11-18 15:45:05, Wenmeng Liu wrote:
> The TITAN_TOP GDSC hosts the camera NoC (camnoc). If MMNOC is left
> without any client vote while TITAN_TOP is still on, MMNOC attempts a
> power collapse while camnoc may still be active (QACTIVE high). The
> power collapse then gets stuck, and so does the MMNOC BCM, so any later
> bandwidth request through it times out in RPMh:
> 
>   Error sending AMC RPMH requests (-110)
> 
> Declare the interconnect path for TITAN_TOP_GDSC, so that MMNOC is kept
> voted for as long as the GDSC is on.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
