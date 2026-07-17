Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BBF3B14CB
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 11:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784287693; cv=none; b=AwHStWIQXqzIfrTEnivpw8uE7Qihwk4EiLT7taaf+TyRFJX7ZUaxouZHPh7YjYd7HlzY89Um/A2QCOLWvUWua2XhF8ywToww0jsbLD5e3xe0ANntrr5x3wTk919nqYVxwqImmQ3ZwZCSwWBbKjV+dCsVhO0cHMDc5+oKS8Nimro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784287693; c=relaxed/simple;
	bh=pm2y3ereBvgbGdWtrkVtcUVt+9/GemW2CW2sYxI+Z8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=f+vVIuQCAInLPnkrX74CCnhUMZNLHjbXTqQ9k9pVz3sVC/CZyiHdOZXL51lENFNaIyA6jVipFbU34t5W9Tb0keD+N65jJpGrhSyzp7MKh09UrGGAPcGWbPR2rG3fNy1w0oh/uqd2DGNtw4Cbnuz1i/iEVZ7GMXsOQ/vy7H+lYEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A7mF8Py9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HSPapwuZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A7mF8Py9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HSPapwuZ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HASia11515702
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 11:28:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pb4UK64Lz+V97WKhGLdV8BF4a2GT+adOKVMaP0WSLcU=; b=A7mF8Py9tztKts11
	twomZAPMx6fUElljwYf4rIQVPpvEv86N6+sW5opUkSlB+2xbEo8/o7wK3n1CqVbh
	4pXd2y8WXLd2M8nTX/Dwh0CWQfqd5zfxk3Sl3uTPI6vlTttPeqMuepCWDRZac5Jc
	h9kDuN5Bb7qCtm8E+MQ/FgZ5fSVqmWl9L78kZ3PY/7ulqXumFTrdb4zDcBtEEzUX
	f5TaUWecIaT+eM7/K372nERGlB5dIowENoEWt0Ir8OcHRa3QrWO3tIm04sEVUuye
	3qNakyPMzg1BLJdgJcluahXlibIP4AVqjug5FTpAAVPOziH+IhNnl4TLeWge+dCY
	TlInkg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9gs2y2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 11:28:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51caa0b48ccso14148501cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 04:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784287690; x=1784892490; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pb4UK64Lz+V97WKhGLdV8BF4a2GT+adOKVMaP0WSLcU=;
        b=HSPapwuZhNsrzHZPY0WHXuepWRGFjxoCIZo2QmbLx8uWMiy1TVJ/feVTqFVqOI+AT6
         1H/gvgaA5VyeL3pz/CbfB1irf+EkT7dYDz1Cjb5yWBYJ9al3az/D+K5SY7GiF8XjsBYD
         S8QnsFvgnwXyHM3RuGCCD1jQTKjh7Uarx521ihO8AgF6CMebPTYy26bYZKRs7YUPYJo2
         WA93bdup4V5brvgsJ1Is/cikPnYDxhXiz2NALo7RK7jYfAGtWGr9L0gX8RDCT3pmxa6h
         R8d0CfpTdqxjvdgNAcNhDrghAnjwqiEOCTt4Dmki4LjiNWOOnBRZSCWBOobsH+Yo6Xca
         UDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784287690; x=1784892490;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pb4UK64Lz+V97WKhGLdV8BF4a2GT+adOKVMaP0WSLcU=;
        b=RDukMQfz03Lfw4QNRXY+NhI89XBIfcXCnz+2AaYr7x0weim92SwbE6JHBgpRS/Z1+t
         v2A0BNbblQWMNP+3R0OoBQPrM0KUbk1DfQx1mv6cCKisNV91Dtl1P+2s3AWaBoXNvbKo
         9zffSHx+u+QCbuQ9/eBhwcEEQQdAto/l2MuVTGTp42QDwaES0mbspkdhCeXM9/a1OW0H
         tUpBl1Xr3xJ1o6f/6ozsJFfXZO4eaUeovUTfXz0ef24wOvagxSYzo5MO4OEFzgFDQ6B+
         T71k4Hh2Id7nbjyJbRAu09f/ytcZx0EmIqz+4E/PRjrx1qmeCP/iMqwayvzVZt38t+Tx
         Fl0Q==
X-Forwarded-Encrypted: i=1; AHgh+RpMt7z0n0UjZlkdzf0/GKl221/ysMrFff2qg6MLFf+vUWTW1XTM9Lr1qxdcYeTAZ15bIhVdPNas3cPo6JYp@vger.kernel.org
X-Gm-Message-State: AOJu0YyiSDQoshw0Tce+0KXXfh0InrA4NDmkOnbnR/aRhrzgRq1S4Dbk
	toFppsm+NFP2M+C79ZzR2XvyKdHdlFBWZOk2Uj5CwuT3xbVzgvjuF0I28tXwXgRFXkEmvrvRR1e
	C8nnphiyIKVeuTH6YGmnq+X7887Ei5FjXdfeNTDFLHpYDk/3Hg6U3oM7VLns5lvP9rax0
X-Gm-Gg: AfdE7cnxkOGronJj2IuIHzTPE1OMW9QsrXgGxui6GQgwLHilRvCeAybDBF4kRK8vfsO
	3w9ImEnBAUky2dj2fQmV3277Ym8yBm1hztTo21lYA4lCYcZ1lAhGxYUSs/wkj+ZHPknpLuzMUV5
	s/WxhactK0sDzpknjrGgPRSEcePaa+3PjvE169dv5X5EQq6TDfYribE39Ov1ziTP5mXvBbltKPJ
	duoaYw7ozbEH1yiht0cBvGWsHgmwG5BVNUVklTnY1wM2FkCyCrxDD8wWTboJmDIbP1kubGF/8hs
	oU3kQwMJi0BlfL/SOx0NrswMUIesEHFPoYJk+kvRzMldT/n/vCUva4BdJNGsIcWyLFpfc199SX3
	9UOf6T4VRaLijzmiRlPveX32N
X-Received: by 2002:a05:622a:1c15:b0:517:5e32:f3ac with SMTP id d75a77b69052e-521382dd29cmr14982731cf.0.1784287690440;
        Fri, 17 Jul 2026 04:28:10 -0700 (PDT)
X-Received: by 2002:a05:622a:1c15:b0:517:5e32:f3ac with SMTP id d75a77b69052e-521382dd29cmr14982291cf.0.1784287690050;
        Fri, 17 Jul 2026 04:28:10 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c17009ae10fsm61101866b.10.2026.07.17.04.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 04:28:09 -0700 (PDT)
Message-ID: <1e820910-73e9-4cf3-b6a6-d9ce4c270a5c@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 13:28:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] clk: qcom: hfpll: return lock timeout from enable
 paths
To: Antony Kurniawan Soemardi <linux@smankusors.com>,
        Pengpeng Hou <pengpeng@iscas.ac.cn>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Herman van Hazendonk <github.com@herrie.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260623060517.10889-1-pengpeng@iscas.ac.cn>
 <8e7a4cd1-ff17-4052-938b-5cb2ee8576f0@oss.qualcomm.com>
 <36f37fa0-94f3-498b-86ca-b431436750e1@smankusors.com>
 <198ad9ab-6e8e-4c67-afc2-01962ea12dde@oss.qualcomm.com>
 <5c374231-33dc-4082-95c1-1046286fbb13@smankusors.com>
 <89c53cb1-3804-4dfe-8d93-e27e31bc2254@oss.qualcomm.com>
 <42fa946b-43f7-4f8a-a349-f8509daab749@smankusors.com>
 <e129178c-6079-4538-89a2-247185dd0ce7@oss.qualcomm.com>
 <f1749c0a-bb54-4ddd-94cb-75af9386a47a@smankusors.com>
 <48a406d4-0033-4538-a9bb-75ccc4897a3a@oss.qualcomm.com>
 <39a31586-aa7d-4f86-b50e-3ec6716f8b1d@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <39a31586-aa7d-4f86-b50e-3ec6716f8b1d@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDExNiBTYWx0ZWRfX0NxAB0yeiKuF
 Ai4oohcfSSNxhCLMgw++9NsZa2sNJrVlMbcRgdpm8qYk660n7a9x6IPauE0TJNbQ/yunGxzFRy0
 BJBHrsb+PnyDz7AoUUulnM8o31e9kfY=
X-Proofpoint-ORIG-GUID: hJI13-ZhV1rOkvJe4OO5J6U3mevxY1y0
X-Proofpoint-GUID: hJI13-ZhV1rOkvJe4OO5J6U3mevxY1y0
X-Authority-Analysis: v=2.4 cv=TaumcxQh c=1 sm=1 tr=0 ts=6a5a11ca cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7u9sOtQHLUyvNNkJUrAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDExNiBTYWx0ZWRfX3R+E+2cZrerS
 Ci+OSNucH6lc+z6NXbCg7Wyr14L+ZEm4IWTXy+ny+bm2alhcIw5Vnq+ODJ1RjgdQlNVxKONgcWG
 Rj1rT8nW0gCwlSBVNAoaPUpeY6LHaUCBe5Nn61HlFyHTnX0YsYodCS5z1vNPs5b7ASC6No5SCpe
 rLwTQJ39/TzX/NkKv1i7PEroFjKG2//CC5o4gmIQc+3d0837FTmxZO9h2f4tb2y2jwy88AuIBCj
 2JviOWlIAXlx1oSTz3Nx0Ssg3f78CVQ7Cylw2va2bPSwX4+4nO7Cc/D+O6oTcBWYupcLHWGeCo1
 IWbNxa9UxerATxW/E+vEpcRcB/SEYS5HG2/zeTMs3s5TCojQTiYgAQGzGrojhcXh7xkp33beNB9
 d0jWgiEIic3FJqTGEpMZOcsAUaeQfCaOGq1rrthVUJ7SKrfGD9KAkrE3GuFx6+rwbSAdGiZRzUD
 m4Y0A8Hd+xraRXK3xxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170116

On 7/8/26 6:04 PM, Antony Kurniawan Soemardi wrote:
> On 7/6/2026 5:58 PM, Konrad Dybcio wrote:
>> On 7/4/26 11:02 AM, Antony Kurniawan Soemardi wrote:

[...]

>> Can you check the state of the gcc_base+0x3420 register before and after
>> the /* De-assert active-low PLL reset. */ line?
> 
> I assume gcc_base is regmap on clk-hfpll.c, I dumped 0x3400 to 0x3420:
> 
> [   21.089748] HFPLL hfpll_l2 mode_reg=0x3400 (before reset) regs:
> [   21.089775]  3400:00000002
> [   21.090300]  3404:7845c665
> [   21.095944]  3408:00000000
> [   21.098714]  340c:00000000
> [   21.101404]  3410:00000001
> [   21.104098]  3414:0108c000
> [   21.106787]  3418:00000000
> [   21.109478]  341c:00000000
> [   21.112169]  3420:00000703
> [   21.114858]
> [   21.120243] HFPLL hfpll_l2 mode_reg=0x3400 (after reset) regs:
> [   21.120262]  3400:00000006
> [   21.121903]  3404:7845c665
> [   21.127540]  3408:00000000
> [   21.130228]  340c:00000000
> [   21.132916]  3410:00000001
> [   21.135605]  3414:0108c000
> [   21.138299]  3418:00000000
> [   21.140993]  341c:00000006
> [   21.143681]  3420:00000703

Okay, can you try dumping the same register from a running device on
downstream? The only change in values that we're seeing is BIT(2)
being set in 0x3400 (which means "set the RESET_N bit", a.k.a.
"request un-stopping the PLL")

Konrad
