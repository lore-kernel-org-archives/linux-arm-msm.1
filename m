Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FB4347536
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 06:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790146027; cv=pass; b=onCGJxI1T4zdmEVd2BcIgT3dxXw9fZs64kMhCHM+cN+oTBZvENPOnVHWQfhIQSho107lbydol1QKaoIJ0fH+l6LXRoOyQR9WIcKO3BQbJYtEFd8wBd/gl8DvZGaRsQb8HjINlaCH0KKzaQXV0i0VfBQl5SNvQwN6RJV0zJffEDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790146027; c=relaxed/simple;
	bh=Cd+UFMshbHHucxt9icv2dTeVfo16suRl9lwtg+OQtVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XepgOuoIUv24F+Nb7rWhhC8zhSEFNxVeI0Sxl+6WxeV1Hg4c6Ye/ttc49Twb8Eqy0Bey7/bwm+OAgMZs74uV1eyh+db2XD6WbtnNziPULM6wLhMnCl0+HxR3r2HJe4Eao3pQiBaWl6YysZI8/ipaHvDJJ2o3SQm4KabQOm4LSRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L0NI+ZSJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hu7617uo; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L0NI+ZSJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hu7617uo"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3ijlp2116302
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 06:46:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Cd+UFMshbHHucxt9icv2dTeV
	fo16suRl9lwtg+OQtVI=; b=L0NI+ZSJlV3Fd2XeEnpmo5NEe25PmSIOXXdpkttX
	IVOndk1jMctIIuvuK1SG1T2sDsJos7ZGj3mmMSlPNsCLZW/LZQlFQdTn7ySN3kO/
	B7xnRuauL9/BvkQgzsM2HnCcLbD0IahICZKJuBikHWiHzWo4N+p2AXRy8nKUHJYY
	+K5lRjvKzhb+gsphYWl7poiskWTxYq13PhH0XmJpT1RRXgKk4SEUhYWUDaxCZbew
	64zvE/tWlrTz9wlj1eDBp8XkvVsPiXA4Nv0GlKMvUOmOfej5PoHda74iJ5P/nwTg
	rOV4itroE9Yp2Bxx3t89ZIW3itiZSEhuZ3QMJR4nVNmhVg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv32qsduc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 06:46:55 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8a35310148aso15908787b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 23:46:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790146015; cv=none;
        d=google.com; s=arc-20260327;
        b=ISF0i1eGpD68iG8rnI4BJnHU5hr/PzK63fD8Mw0wU+t5tT1F24Hi+a+R/kq2xGRDE+
         In1k9KkW82BOY0l5vskTqB1jonNWFOjEd7w32kEyggAMrrOnjRi+ou8SFbL1sfIvStG9
         dI+Z8jpl5DPT7sF3ZuFqylgHONsmGhW4VBlxqVIGkGhr3McfAOA28sjcKPayEqe/jjll
         R0dRPOBLmHOvLrBZJDF9mHUm5jqXkwTMjZ0JyDwdcK5VQCcEx3l260yOJLTtURUCQQCp
         HhxqNn+k6KdAj+2v7S8k5HxSpPdZpkWbys48FwUf4FSbhn+NHRVnA2B09TOi66lBIzob
         zSDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Cd+UFMshbHHucxt9icv2dTeVfo16suRl9lwtg+OQtVI=;
        fh=RCD7mPBMHb+zS48jk3/RDC5iOR0Mf/NSctCMHXY37rw=;
        b=YBhKCX7NJHq1NUH02ZEJ1QxtFkUFj/UvZr5qinBv+aSf88hToyR6pl/pmQY8+3Uz6O
         FoHN9tHfTf09eb3sit+dpAZlFC9EMqjJFM+STYTai+kKbext4VUeQ5dT2nhxaYtoT/Do
         U4tGhd7djGo0kfQ1xieq4JKZtz1J/yRuXRqk2NA6yxZX0ZUZHrbkwn3kzr/rpoXxWuCg
         pZy0pEtvkba72Jd83MOrZ4IOYnH6nHRUJ1rfTM8UosZCxXh+k0pxo5ewoT+Z68AnIfEE
         JhGXDnoy7TtzniUcyP8yb+UNKlls5PssjVoRY6lJyaeM9QFOR5tP+u9gv0YDIyhuivRR
         cw+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790146015; x=1790750815; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cd+UFMshbHHucxt9icv2dTeVfo16suRl9lwtg+OQtVI=;
        b=Hu7617uoFzQUVQWB96mh4fqXtX6fplDdYJ9oWJJCwCqwH1aElCs5v4S9h6LXP4tB6m
         g5RQh0hJ5JTurFvE7HKh7aX2XArEvOxO1S7LkElg92rnwjefhAuvMw3/f9YRGh97WIwj
         TP3Ue1Ui2uq7zliRm1ppy7pES2+NttBzmk0jEqDK6q8g6q1IzDDhEly3dPqXu/G9MNJe
         PTHCvjhk1UjpEUWIqAampIcHrrOaUJOzfzaSmP8VcFS5RaOkE7o9pSaabKl/F9rEaXMV
         KJcnIZBMaHqVHaUIxrJPcNkvEvznZbxOLZli7WF7LWMRQlZ5fPMEuWOvIiscObpzV66k
         u6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790146015; x=1790750815;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Cd+UFMshbHHucxt9icv2dTeVfo16suRl9lwtg+OQtVI=;
        b=pLXWFrTeelU8EhEbWVMwviy4LMzNrqlkbHWrSCbwv8pUFTr2YFrIxFGTg1knw3on8u
         HuTsS2wOolN0T/2CSbef3xghYnSPG4fU3f/bOomFFxwTpM1/QgN+63Paoa3rW9h3Z3Tx
         LWI8mXmbVtSsuIYfUe6I+OG/sNcknG605SAofAeV9gmpChQASngO5DsZCO9mB7AGfdIK
         JOSuxcYc8za3k2xyYjpbtXp2vNxypmbU/kmq0ILi4aLxX99SX9HtjokLpw65ADHFHjwx
         p4Xvw6BggikcNTWjQ4QL0q36Lk9bYx5hOWz3jBnkGsOMkloGAIvfysYHvohmXr9kLhfA
         OvQg==
X-Forwarded-Encrypted: i=1; AKwUvBw0zsB9qqLCmhZoA6TcLhda0Uoef3de3OWlJyId0o+j5p5W7Kn3l3AHBDTbJATSsHJZyif1/mLqs8nY83oZ@vger.kernel.org
X-Gm-Message-State: AFuF++lTr+ASmsOWojMkwX9IgnzLpehNdtQDpcyaxDp6kT/VWjxX+zf/
	yynj1M8DDmoocXgj8naQnDXgrD3Zo9KSAmN0eNwkRXEOracbQbaXaVGfFHahsgyp6M9rTpj1OKT
	ysiEJdTvmhuEdGQYCTKIq6DAJJkGOmfAYpdzLoBd6AbvR1MyJWxr2pqGH2ySj5dpDCxtXJ17i7u
	Fey/PtCUow6v/yxCLlvJ0/db52g16uBKkkTJOU4nJioGk=
X-Gm-Gg: AYBFou3fGpCTxCFxuv4pT1UkDPwz13lAj+cL76qwjX/QZgycxBSu3Xw3RwV8x7Xe3dE
	CkKBqiBzP7o3xpe8lobPUW4LuEt8fcqAISzj8moGEYBurc2xZE37kx/N/G06La0fc0pEXepEb1t
	lA2sWhPLPUV76kYQUguQ14qqPmvia/dKfGk+vh3rKlJYWhc6Sx2v9jHrhyyg==
X-Received: by 2002:a05:690c:dc2:b0:88f:62ba:512b with SMTP id 00721157ae682-8a45afa5e61mr11724747b3.42.1790146015206;
        Tue, 22 Sep 2026 23:46:55 -0700 (PDT)
X-Received: by 2002:a05:690c:dc2:b0:88f:62ba:512b with SMTP id
 00721157ae682-8a45afa5e61mr11724697b3.42.1790146014877; Tue, 22 Sep 2026
 23:46:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-b4-qaif-shikra-audio-v6-0-e9addb358201@oss.qualcomm.com>
 <20260911-b4-qaif-shikra-audio-v6-1-e9addb358201@oss.qualcomm.com> <ba6bcf41-779f-4ad2-96f8-6fcb97ed7253@oss.qualcomm.com>
In-Reply-To: <ba6bcf41-779f-4ad2-96f8-6fcb97ed7253@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 12:16:44 +0530
X-Gm-Features: AclHuK8RmfarfYcyic1FK0k471Xfoy9CjVOJ3A0odhXQDN9UmnemC72i7Itidw0
Message-ID: <CAC-tS8DO3SpVLapNr-VVVQdqQgNMmd8oX0Fizg=sqSs-iNQ2nw@mail.gmail.com>
Subject: Re: [PATCH v6 01/10] ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add binding
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=SJnXx+vH c=1 sm=1 tr=0 ts=6ab375df cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=U4cKQ1tlMYw-BQMU8JwA:9 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: Io9jltcn35V-S4q11jyC4KrEpw_py_B6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAyNiBTYWx0ZWRfX8mp/xAfuSWDc
 PLDpIj35J2WnzTXGMZ9OiZXB8kLnCn8hKBoyCJ58iAmspxoqUSMIJIB8k84Wmr1etpf9XPPUW7Z
 BEj/j4YiH08d8X5XxsiGyniL7YirAwo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAyNiBTYWx0ZWRfX/rYYAUTXI9sR
 0ulrxDsPo2JeqjGxIXlx9prIE7NpVSDT+wcPkN1BEGx/FivuTbR28FrHxrC6cOKHBNYoyKFUyxw
 6Y7AtEMlIvQa7ZjGlMzpchNPkhACxiOptVcgrYrTcMZ04O5w5YtTPjewQORD3QoMgqMMudbW3iX
 4QWrYuPKZqe+wxWTnP0YNfBwMFAsa6JJ5ETVYFcAnM7Uuqd40DP+nX8e/6mDVLOZ1JfhQKgU3oF
 V+JSSd6lYJqnUGyVIlCTSsWotKou0kWB3zWaXpAx4i5l91qBdB1Psn4yp4rGxDwASAzJqlrVw+V
 tlQIk4IAlMM1jCHICLdAxZ3wYunlIJg0seK4kL2nRalmke35G2ET5Ygrwt2SbO6MuhQ3pd7NbY4
 hep1pJosQjTXq2vWT7jzjThG1FObT/+QwwRAU6HxfyuDRX8J7+qfjZsaOEbuYmCQ22XVjBXJF6X
 BPX2rElXwEiy+nd/4PQ==
X-Proofpoint-ORIG-GUID: Io9jltcn35V-S4q11jyC4KrEpw_py_B6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230026

> > header for QAIF DAI and AIF interface IDs.
> > index 3a99703dbc4a..f08c20c84c60 100644
> > --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> > +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>
> Please drop this DAI ID change from this series.
>
> I have posted a separate series for these DAI ID additions since they
> are required by other Qualcomm platforms as well.
>
> https://lore.kernel.org/all/20260918-qaif_dai_id_support-v1-0-ed863c0e5e45@oss.qualcomm.com/
>
> Keeping them separate avoids blocking those board enablements and allows
> this series to remain focused on the Shikra-specific changes.
>
> Best Regards,
> Rafi.
>
Sure. I will be addressing this in the next version.
-Harendra
