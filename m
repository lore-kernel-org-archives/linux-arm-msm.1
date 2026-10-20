Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792476509;
	b=kQiI04Nyp6Z8gYOQ6BTH50RL9YxOWP+333RtNYJUpFOdT5I0kX6leQwP3g9X+gHlwmeY
	 SMpzV/7HE/v2j2/QaBKhk70PUFPd7j0gdI8Ty4ORTPRSSae0/IGSqkTcQA8+27dIQ0A7q
	 INm9n8AsY7PXkS0GMwSPBbwbmSo82J1omHKOc10bWlcf9P+vj53HFplZqTyVe+rAbLiH1
	 C8oCLgbZr5QAD64otKfuc2QTVKlW2jcdgnbt0Q4ZUKM1wzBk4FVRC7F0PROrbruKVv8aJ
	 h0whIQ2I0L7fzEL2mhvXXf80ZsvXb3kTEy7ccj4iZCvU7rWZkBNSznecR8MYnpn5rOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792476509;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RuGTKT445WrPldWKL7+sx+NqLoh9ybwVXtendG+9yeY=;
	b=B2fAL29hejmBfJZu5iPDpXZUczpP4Bu9S9ghezL2tfbJpNZ15NJSOPfn2sL9s4RQR2Li
	 05p/HDewnVvBCxonlJtbkus/GeN8f2dTWPl+s1CYDp4s7uABD4UO2mFbm4MPPpS963cSM
	 7X4IBU36befZ2W+26COLWG0vU0tWrkPyM6ifUYmACNxnLuIGXOFbY/aWZ09LF8Mkufion
	 FnuW+2Va1Q+J2ZqkaejVeC500WY4FFTw0sLkgMw2ObvSEBDjCb77H9PnXXkYCuLltSLnj
	 uofj+0TnNMttDVc1IfL7GsukDp8MjP8qJEpEbTAcu6gHb2Hz3xdVTf1fxKk6HvHmn8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fNVBD8bQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I5puDmyV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B861606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:08:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B861606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fNVBD8bQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I5puDmyV
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0t4x71253906
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RuGTKT445WrPldWKL7+sx+NqLoh9ybwVXtendG+9yeY=; b=fNVBD8bQd1vvR7NG
	ppkIpg/b7chIA73L9syfO1/5Fhhutg+6z5XNeHAL4ME/Qcw67MHjmq8WUk/IAsT6
	hWOcRcXkVEeVxDPX0wf/JniBKbO7WvKyyFJjxHr4v9ABvk6HhSRBOXpDzgNQSysB
	wiD+DX2y0lvfWn4ugW3+wCMmg+1aeMMJ7Pz4TIYnY0MUIOQIjVSYtUtG8r1OrRhm
	dzAdp/dHOTaJ4e0U9Uk8NBehdjRssbp8d6V4ySQB2GYAPZY/c1IUtdUsp/A9MK6E
	N4WzIe1YFW/LCEWBBJ+FX5X5n3CTevWmeaLdy/YDz0mj5LIpLCv6f12Q1VT4+8J4
	jlbBiQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n938k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:08:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc50fb0d2so70951485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 23:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792476507; x=1793081307; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RuGTKT445WrPldWKL7+sx+NqLoh9ybwVXtendG+9yeY=;
        b=I5puDmyVz8JAKxCfWnfUSJC0IX9AdnHiAJKPKn0BDT/leodrNUIeldcU4DM4rwbuxo
         iPmJnFXCePIJx08ldlRDlfJVMiqcgafDbo1JvpbdCvIZpp/+gIfEmLWX6APhcmDiZTDR
         sdXbnyGVMXXxcVwlrJUX5elyWaH1qT+cTnaxmUPJOiHwzG30bXEk8Dl8CFLG+sYzYXc7
         A2rGxGGtK4+3b+jfOyUU/l79/8RoMDj0EqfucXYlB0HbPoXeZA0oz46T22IWDEESDu4w
         UhQ009KUJZQDGbMgA31sYrgDe5mKNP2L2QZ4Rmv+QI2jGvi1RTWWm3UHa1WMLC8VGCGc
         +2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792476507; x=1793081307;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RuGTKT445WrPldWKL7+sx+NqLoh9ybwVXtendG+9yeY=;
        b=U9qBKR/jRduMXbWpg/ihpDvE/+/b+yYqxWIiRMBVQct7pF5BmJT+urqOiuEcweE/yn
         xS0EEgMHUDoVd1BK/e0wJvUxB+g+pOAQVm0eQ0SpGwIdIXhR6wYludkzIzxYrmstXhRi
         M7A6ZYVVujS5K8R67vnjLULZNv+7qnPs6UIPXf2uVW08Iby77lXPp/hXWXeqYJf36o5s
         AgPbri9KEWeZKNZfpXFJ7f7LYQPJtZzP12rZURnEuVSDgRfyOkViLVw8i0LXIFMy58dE
         /D4fMcUkk9ab6lBwE4j04HigeFzfzObIMLo7JizXZTIIHeFdwXS1BgXpa7K2oxT0youA
         tZfg==
X-Gm-Message-State: AFq9FYLss1MTx64Sfuomhagzqb0l+fhohWcNV2Z3/7plNdmTk2eCLKkW
	vcw7DoXUHwwzdP0FanHt9Mb/w6OHAmWwYtz1QNO22sATvrt4/tsRtjC8q0WrjvTESe/TzeJQdFj
	z2wMnuaRxE1R5zfrFsZm61jW0REAv8k8E7eM1jt5CkqQV5ySSaiAOD2BQiGKngSgvBEOn
X-Gm-Gg: AYBFou32MVSBO595pKW3yp7YfwJBqHfQxDCCPfbeSdzDmJRzTh41s5pnK751T03ywWs
	hdlK6K8uEOjSDtAvIVlZ1g8fefRGydQmYaVxEaVrtrq6FsoC3eHzmo0N537u+RC8pdANMvY0REK
	ufALFgLAFmGZcKIQH8VInxITtmbXlKWSX/ze7x4AL/xauLuYiTJMKhj90CgCvGSkxkaglDGE6pJ
	YVqlfslOw/bkKRjf11NnZi0uZeJ1xxc9V/DB1orvkgM7eYeGpx2/sCZfIynW9qTssm5r38GCiLf
	IbrXn6HLEiAVarjp0pow70rVK4kzeAyYXbDP37h3LeLDbKbwyW7m4z8DG1rl0Et2abLoSmrwk2c
	Uf1i8CYGBLKMYaqhZLEn+Sg==
X-Received: by 2002:a05:620a:3711:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f29c95919mr1911838885a.3.1792476506722;
        Mon, 19 Oct 2026 23:08:26 -0700 (PDT)
X-Received: by 2002:a05:620a:3711:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f29c95919mr1911836485a.3.1792476506224;
        Mon, 19 Oct 2026 23:08:26 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b3cd39ec18sm2243135a12.16.2026.10.19.23.08.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:08:25 -0700 (PDT)
Message-ID: <74dc9718-9911-4a13-9e10-0c2932007a4a@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:08:22 +0200
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
Subject: Re: [PATCH 3/3] regulator: qcom_spmi: don't take a sleeping lock in
 the SAW IPI
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ilia Lin <ilialin@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rt-devel@lists.linux.dev
References: <20261019-fix-qcom-saw-v1-0-9c7ba3fc2493@oss.qualcomm.com>
 <20261019-fix-qcom-saw-v1-3-9c7ba3fc2493@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-fix-qcom-saw-v1-3-9c7ba3fc2493@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cf98YLWS8jzktapRrmrf008HQXy5zTuS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNCBTYWx0ZWRfX+wedOE97ar6X
 xogqx/kuiRHDQorysLmRkcnbffkFX2/Xca7yllc8TfCxtVTnVSHIyn4iJA56wEXrq3jioB1tMPz
 Yu3k1si8zjBoD/aHXoiG+eKApg61J9CrKHeAOAnGCVyVUhT7DExlnEWLDJFu94ClrurU8BNJT1K
 57jbEQTJPzVvo/PR2bXIhpa2mBSoTq6A39MBiGgELMxE5EZ86u/pIolWuc65dA6sdokVYaOa8nU
 ij8Ho7i1jmGz2z0AzXRJMMTEy/2ynV1xae68mVJxhqKq3nY5OrIIlvsHeNA7omLKSdGSKW6h02y
 isPp81n6b8648HCtE5xOH+JXCjPrjK8Fg3Ha60XKaqjhFqOB0ohI2mtNU2awTRK9+8QmHi/YKnc
 exVNbAj6GdCy2bLd+0wvdzcX2dM5MsuyEP60WB6eZj5YU1/P/n7pST7iQoc47hWRAkAwJsy/Q7V
 4yxjghkWzzFv9JhMdiQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNCBTYWx0ZWRfX9yntlWDkwLL7
 HEktgZvnWl4yAN4+QF8jyxjIEiWYaA7t5z2IEZix/2OJzZjktvun0xAvsrtbfFAYFFO50JUQutn
 Q0oV4n1gzFgSJXt8+JtHArKRNtangUc=
X-Authority-Analysis: v=2.4 cv=VI9IDNPX c=1 sm=1 tr=0 ts=6ad7055b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=zBMmP5lLP3iSaWE8ja4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: cf98YLWS8jzktapRrmrf008HQXy5zTuS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200024

On 10/19/26 4:39 PM, Dmitry Baryshkov wrote:
> The SAW voltage change runs on CPU 0 from an IPI, but it reaches the SAW
> registers through the syscon regmap, which is protected by a spinlock_t.
> That is a sleeping lock on PREEMPT_RT, and lockdep complains as soon as
> VDD_APCC actually changes voltage:

The SAW handling barely belongs in that driver to be honest.. but
separating it out would make a mess out of sharing the of_node

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
