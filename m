Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798506;
	b=bEM+F/Hi0g8cj4cyZa8LKZ7vKMFSPTMPJtVxAb5mOSLGMmRM3jWyp0PP3kEKicVPoGLs
	 CFST2kYJIaySApIpR5vMXPMbz45QorJcTgKJEEGMLPRIrovvvJyEGt1nq/wXT4W9dekEz
	 azXs39Yeg680vaPLLO8FTMDI+Oylum2W5xF1CyeN4oebEER+xuBotT+qryWku2Jl5zA/y
	 I/G7PVpIhuaSXZInRkYx+STi0TnhnoGKda83YaH2i9P1tOHCaZ/Q7VJbvZfW7dQ5R2E/f
	 jEm5S1uNBgJkQQ058vtUXgdqzDBpXgBvoxja58LbPNCB799FJcWBWHARrcRokNTuSVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798506;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bdDbdezahsnwvvodBAeZroZhoHCyGDtmjwh7kWkAIGA=;
	b=OfY6PNN4psn2VgGa8KRlOXdqp+wdlDoun3/zoowy4HTYCkE4MfIzhBwhuc5G3puP6IS9
	 gVqhgAha0XkUVMeqvWYFKX45DiOG0aoswShcAhd+cPf3CLJIy/j3mpWTiD9Slg/XJpIKu
	 D2RL+TCp2y6uDyk9fwKtzoaZXRIrv1yDsUbpLpj0ifTG5ldQFVT3WX6VOXvGURpCftSjK
	 4K3ikKpwAdOmXu889hf/YidxhIZMvoMaEjlxZStsiqv6BZuEv1NNdwpIjYcSEsrNoW4t2
	 mRRBo5fcyaOQeJurVS2QmHxW/dUumtokqfqYRTxJp2Q+HC23tXjxHbjo1n7MP59nH3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hMkwn1Cn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sjyo6MDD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1C0606A328
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 13:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD1C0606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hMkwn1Cn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sjyo6MDD
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZxGB608496
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 13:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bdDbdezahsnwvvodBAeZroZh
	oHCyGDtmjwh7kWkAIGA=; b=hMkwn1CndJq7dLbOzHFcp/c7/7+LQmnU4IIeYXhl
	eD9flXMfO5OaxwvR6zf96TNocN2EPwyBHfrQvx5gGEzZmRspTRMI/3FRyLn5T0nO
	qO41sHImGEHld9GwuCDhB6F99fvCiDuFm1TlIQYNaaFdRjFO/x+usFvPgSkxXyA4
	ID2fD9HRzGcPw54pAVPqmi+DrqNoJ8e4HpPBIeci+lzWMD7y/2DAhp4K7eupSWlq
	EqE0hb/9UOAHrXtqnuGvWtK69xBgP1n+U+SX3wIbITKHiuTT3c5NfNUqCY1eXeGF
	eJuVaTRqZ+2CTMIVbZ0oA4nhv2JbtD0c0Fu/ehoTXiLj4A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr3r80ew9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 13:21:44 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7c0bad5ec1cso175882137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 05:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793798504; x=1794403304; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bdDbdezahsnwvvodBAeZroZhoHCyGDtmjwh7kWkAIGA=;
        b=Sjyo6MDDWJLQeMVjSqSGKWmDG7H4krUMB6ZdNQ5m9dHjyBt99Q8CwA1wQmlVRMbUGH
         rqI24qbrTRoJYiBfJapCIziabzEdgSXvOo1qIr3Wzhc+dCZ2D/9ILiY7/WyKx+/Bh/hQ
         cC6ySuikCJVLMiVtU6wpQwTY9+blH9La1pQzJei/mFiaWyT49WTABmY+n/nZjX3QyYBz
         FIh8XQnMyHW6NhnIjVTUEJI+mcj/Q21U6nZf7RK0QfVvOqGGHGIVAhpwPJ4UdysQ30jF
         7sr8+/TUObuNDX2AIMW8KUcMqf56HmUxk5m8Y5ev1wWhdP4C2xYAxl1PsfFaEGO2pqhw
         KZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793798504; x=1794403304;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bdDbdezahsnwvvodBAeZroZhoHCyGDtmjwh7kWkAIGA=;
        b=qs0NW7fNnjFU2IhN79syGz5N7UawW8AeIWdL/kB7W6Vx/DkvPirK47FF/kUgbq5CLQ
         I65ycwmRsVc0ld0Ax+jL/dne3mtDolCaHjytmd3tDfj+gr0gmQi1/1QoMsAS3mB1h4kc
         FOc5zYyXQT2XmDsSJW9+L7B3q0WkZBJS3461xLzcev37JwsEKsmjuAAPwQx1ha44g+5P
         km9zoZVwl7fgXPwqsv/ogh6Ga24ndTy5D/jImXyIzdtT0m4GiWdvS6VzHaoxnJVnm54F
         PsjFo7063BRF+US0/eoaeBkgmxbyrR5s9MYgXoCyNss2SvV6jV4R7ijIayT2T9FjFnJW
         c4dg==
X-Forwarded-Encrypted: i=1; AKwUvBzOuHo5itSeYncElnzRZna1NpPkM6Gj5dqDMRyLT4FMKQ9hT6qk4+BAFvHi+1R0MkfJPeDUWWfZHmCuzl8w@vger.kernel.org
X-Gm-Message-State: APuU4Z88GhO0Yc+YWpU3YQ9t/Vfs8f4DPzNLD83EgM0aBvNaGlX+HlgL
	qsYkSNdeijCsFghMtTETJFXfDLtxwumCNcEywjah/atGa/KFqr6TcfI4dwavP2tqZPaOGtToAAE
	OpL2ZhsTsZxhHoTkNe56Le2KYtUcN7C7y5InPYBuHuEK7lByOtlQE/rN4/pKRSsIkGMnA
X-Gm-Gg: AYBFou2iOYAJJibcTSFOuDeD//HVc4gRJw++YMDHGogAuctwTT/lAH1jW9UhXgMABKl
	/0Vrl8vpBFyrs47WAE6mqhLs8R596EgpOKBdyOuvttqTKSnY6EPJbOBhgy2BNTCFod9xh9G7Jt1
	nRHeMmDczy0IhSBcfIihXmUYVco0b8yLn6bSBWh8dAeL+kdTHmdeel/cbmHj4J83/oVVDJp6g7Z
	HRABJTHsIgGWRUWiZ8jCKSJqUkC4JHbyLZ+NJaLufSnDJ6GTY3HRO0Kvb8MMNyvgT2uJliK+T7F
	HOLeFGmyQQW1wtFKqA7hb2wXPgFp52waExaA05g65TTxEMDClQfcmkR7Z00SLu/vux/V8LwmpT4
	l1SEu4rkEC1OYDdKny/8hE/GGPAkxuSmAb4Q+pvAx1TAu+G8vTpFFVAhLsSHTH94=
X-Received: by 2002:a05:6102:5712:b0:7c3:881f:b620 with SMTP id ada2fe7eead31-7d072c56c97mr5830335137.21.1793798503818;
        Wed, 04 Nov 2026 05:21:43 -0800 (PST)
X-Received: by 2002:a05:6102:5712:b0:7c3:881f:b620 with SMTP id ada2fe7eead31-7d072c56c97mr5830327137.21.1793798503118;
        Wed, 04 Nov 2026 05:21:43 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b412e48fd8sm51175065e9.1.2026.11.04.05.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:21:41 -0800 (PST)
Date: Wed, 4 Nov 2026 15:21:40 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <andy.gross@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>,
        stable@vger.kernel.org
Subject: Re: [PATCH v3 2/3] soc: qcom: apr: Fix theoretical use-after-free of
 GPR port on concurrent RX callback
Message-ID: <xqvbybeyrp5fgortzu7pkq2ge4hshhsma2nu4ag5isjsekmitr@66erhrmbpega>
References: <20261103145635.309032-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20261103145635.309032-5-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20261103145635.309032-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: qKdTeI8K9cDO-6mTLPsD_GIZUQUi8iTA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1MyBTYWx0ZWRfXzKS80V66Gl4/
 C5sU6DnFh2nCeK2h/wEz1fP9IEjCDUvGa6b7Ic0Z8Vd/bSVZgpj1WPiiGpt8TQfydjF/oWCuj1P
 Y1/lOLepsW2V4sVfJuNG6hlJ7Wts5I0tFF9chVcLAFqX17gBHJ5PtMb+Nuq4HfJbIOYM0y6DfrE
 SGRFJQJLSsns6r2Vyy8qlSaSyo+NTlvh9q1rNK8zH/SXca1KCe7hbo8qvpUkhhpKglE1ADtp257
 I0XuSVhwk5bfujLK9Ie9DRn4toYlYYQ1SL21esqRqroVDY7EbYOkxRf9YTv/0e38Ib0W4lJCNgW
 W0Y1FXuNDhnevbFB6gZ78l7ldltQGtSiqWCWI1whRw+BD1qjpsCiouWiGraJQT4xZprug2jdx3x
 jt9Pb/ajgY4oTRBRvzOCh8FJpAMKVCeHNaBL/lm/F+OwCQDLQRnRT+dW6/F6wG+r7k+iC5qQ/UX
 b7JevQH0rMKzLl6Cvbg==
X-Proofpoint-GUID: qKdTeI8K9cDO-6mTLPsD_GIZUQUi8iTA
X-Authority-Analysis: v=2.4 cv=UuP2pOwB c=1 sm=1 tr=0 ts=6aeb3168 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Fpy8J9LNTvDAPkKIS1gA:9
 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1MyBTYWx0ZWRfX8eXnbejO88Sh
 B4KiQsFniEd3Zew99R07xzGcquYYezK9vmPV0xSUWamgDnZ1WStN1Pc9jV4hZ0ATGUjwzBlDSVR
 fbiWOl3SGYZ0jvHgrAYUC3cZgQHNNxk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040053

On 26-11-03 15:56:37, Krzysztof Kozlowski wrote:
> gpr_do_rx_callback(), executed from the RX workqueue, looks up the
> destination port in the IDR under svcs_lock, but then drops the lock to
> call port's callback.
> 
> Concurrently closing a graph calls gpr_free_port(), which frees the port
> after removing it from IDR, thus a theoretical scenario (not reproduced)
> is possible:
> 
>   CPU0 (RX worker)                  CPU1 (teardown)
>   ----------------                  ---------------
>   gpr_do_rx_callback()
>     lock(svcs_lock)
>     svc = idr_find()
>     unlock(svcs_lock)
>                                     q6apm_graph_close()
>                                       gpr_free_port()
>                                         idr_remove()
>                                         kfree(port)
>                                       kfree(graph)
>     svc->callback(..., svc->priv)   <- use-after-free
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-1ebe255f-a874-46dc-b7cc-455e7bce402f
> Fixes: ec1471a898cc ("soc: qcom: apr: Add GPR support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
