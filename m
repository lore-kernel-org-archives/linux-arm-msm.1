Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403696;
	b=FXSTJjRQoy6Gi9epbmC7te0VCRtPBn3CJqvsqHncnXd3b90xngR021AJsFz+auTkTOIa
	 v8fLOHzkvbcNqrK+gfIl0b3RNjG7E844CZ7wPekP7SAkIZs3DMy389vBzL7piEc7Mu4+w
	 edIlp2u4Mw7p7mpb9QdKSH1zwlfRbzxHc5/YZDxcEOixf/c0NmfE6xpnXocnTP+kmRUsg
	 0qeD3lcmtughl92S9JTgsSPd7xuFQXpV/s7zHFDADuvG3HLTFaO9NxIFbex9woTGEiRqI
	 +gHdpAmaQrYcQ9npMsGKznoyeGfniypH9fAly2rveYJKakJFbk44JtZTEIMU4U3/n7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403696;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=D8tiVvDZECe3f0eKJKeC5Qfbzxcy8k/h5VkY0prNfso=;
	b=ScVnIHvZGO07Y9om97dIPuj1Av+Pckhy2JrnDFv+CAxtFteXmjLr94k6KhqmtfkXkbyj
	 wt6sOPCFmbQAOCYrbCWEIwMCLHBvD1TTo77iHAsDURg/t2BM8nzyHDaTTR74IGMQbnYH7
	 NZcwyd/sz1qOuvSPSEHBpLNKDiOrsjdnqz/atNnzDmB88SRIpiolP0W+yqfGR0MGLALkn
	 yqkkuMEWQwWLynBawGCqEUgjjoNaBnudLBnY7not0/6u4lJsFCrzoUPHZVaTc08SG9LuS
	 3RnoBkVSH/vEgOh41nD381bJBnXQrUdbOqa47VR1EXgLPXJREqfgCidRFnSlVuYtzDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cA1nNL6B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="AReZ/EYK";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13C4606A326
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 13:28:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C13C4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cA1nNL6B;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AReZ/EYK
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZ24E3292079
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 13:28:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=D8tiVvDZECe3f0eKJKeC5Qfb
	zxcy8k/h5VkY0prNfso=; b=cA1nNL6BQlNjeEQ+n8jZZ5Gc/RZbeheDna8SfpuD
	2Q/U0dVRQ5f8ipS0A6O7B1e4vXrO5gXRimO/BHETxq5TXkB6Y2LyJchGOcQcRg4/
	8/1s7TEA3R12HQ83LshibgQHYs0BTyi1oWKgYgvSi8vUuF+T3A2R+GDwt4Fc7eGq
	YNxhAvRKSzsZKuhzsd040ReluQ+jSjsnwc1SN+4q0CqeorpNIr0MBT0wmyCRzHE3
	HNYvqzfb1GaXpeBuo8Mrme1XWbCwZK4/sRYtf+8/II2UDEekd78zmPaEAFOuAv7e
	xalaa+VE2aPalUnORiTbC1rjFfDBJ0esXnn/b14+SZTx7Q==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnp2nmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 13:28:14 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b29df78132so1391307c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 05:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794403694; x=1795008494; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D8tiVvDZECe3f0eKJKeC5Qfbzxcy8k/h5VkY0prNfso=;
        b=AReZ/EYKRJ49uZ3iSJImf63HRUs/AnlYniXLTTWBe/c2Kq51F+cZ3LXdQ/XmrmZnu/
         cAe2E0J++IlHs/xwSeGu4+sRmGE60/LwLUL+l/x9H9GgeF4YHbN44oocMnBCi4xu6DGd
         vbS2sPvj+3uFUQFSSf8+yShwiUnsDl1mnBmkfOn61aarxemgsgYGQJXYYg0VTrfH98eY
         xRol9kkzLtSdYMxKcVsqusK/kkHAZCUtDynCJuRQzdi+/+9u1F468KLs6BgCWG1mzR4A
         nIetysNqvlZTrv/hmqpiiWr8rR6G6bTs3rxQik5JrnmDmyAUhtplHgS+axbr1sGiSnRv
         HyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403694; x=1795008494;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D8tiVvDZECe3f0eKJKeC5Qfbzxcy8k/h5VkY0prNfso=;
        b=VufLJCUG+zGU2KabWmMdNi58RFLtPnUROYBevfLO/ZGY+r7zN9OAryfOD3CUiL9h99
         iMqMOIGWMFlhe5fnNd5fSInENU6mEPT7yFdidEgqF5U2nR4CJXDH4/lM8BMQ/4sphTqe
         IxDwl0Dw30fIzALFjn7KAmrxnxwk1JLYHc+IZSS0/2cPb5T8NFfXKaSdg2SpnFptImGZ
         hnK4no+b/n/yC/xnf/drYpjDZhju5FXIX1asvRrgMy6Ke8I2Rsn9EA6/DvINLKkzQnQf
         KXnstEV4mMxjnii6C5MW0PpAMQApu7HyAffCZArNpqRtRfVaLNEwwpm4XV/sYR8891WV
         GPew==
X-Forwarded-Encrypted: i=1; AL+hErGGK+C8MYB1n7r7NOOulbrod8vOSZfWrIeHgAg47jbpPwt0CKXtyag1xJNvmsZth2dyASPwNijAYqVNs758@vger.kernel.org
X-Gm-Message-State: APuU4Z/wsYWx8r/dwBn8rvlY8ixG0rw8eL+nUoat4VdPfr4TIzd6xD/o
	yAddXqBVpAJORYk5Lesj8ISMwFZnk3IJPiv4K6qmg4Zx5PzYxFghEaFfSjCziUWJF00bX31OFHB
	Zvuwn3NX5wFn2uyzvc++SBsAEaCeK1dPf7xpXNDVAV2AOCY6RXThUZYT99VhxzZkzZfQ2
X-Gm-Gg: AYBFou1b+F4OXg2B83f8ljYShJLs5Y6qZn4ZjbBiQaDL08KtdZ3XIJSqhMfb4VkJkH4
	fG5jRFFKIZFv/268/LxJKLaCKJb+1GZ1y2V+WYV4lNHjs++DEbFzrd4Hv78mz65dOE+54upOLct
	ZVWwM3K7dNgb3t6QrJS4YypqywbtAGXmPiFpJT/9RxXB4zyc9IyysfOFKsd6dsPSpF0HiR9LxO0
	abRqV4aSisTdBRod2vhnLCnJjzDckrPywUNC/czs4l2Zafvj9y4sUNpMU5gVWYCCKNmwFQkx8By
	F4+7c1ApJb4vvw7Kigoh/osnDFqwKDJbfyLDelsodF4YujxF8BaUtSWy4fvS+YY5BOajWjaQqia
	+tAAOZ5cq+vgnoYT/KGUjxCLkrMC7eHCxKx1ZMKG8zODma4NlrPxe/UQqn/4nDRs/5/wVFM62lK
	GsBtFVUt6/XVU9uJI=
X-Received: by 2002:a05:7023:a47:10b0:1b3:b67e:9fcf with SMTP id a92af1059eb24-1b3c03108bcmr2262511c88.17.1794403694187;
        Wed, 11 Nov 2026 05:28:14 -0800 (PST)
X-Received: by 2002:a05:7023:a47:10b0:1b3:b67e:9fcf with SMTP id a92af1059eb24-1b3c03108bcmr2262488c88.17.1794403693529;
        Wed, 11 Nov 2026 05:28:13 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm33075620c88.10.2026.11.11.05.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:28:13 -0800 (PST)
Date: Wed, 11 Nov 2026 21:28:06 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Shenghao Ding <shenghao-ding@ti.com>,
        Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
        Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codec: pcm1681: Acquire sck when bound to a card
Message-ID: <avRtZrCCdc12QBb_@QCOM-aGQu4IUr3Y>
References: <20261021031228.2074402-1-shengchao.guo@oss.qualcomm.com>
 <179390052368.3073895.16132231139898724200.b4-review@b4>
 <avGDRUwyEBk2qQaM@QCOM-aGQu4IUr3Y>
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
In-Reply-To: <avGDRUwyEBk2qQaM@QCOM-aGQu4IUr3Y>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MyBTYWx0ZWRfXyg0UgLQp37GF
 i+mZmwCCSRBNphDr1/ou9RnILS85BFyY/qcT76YrkUnZMpv8IpNT88B8X1LkwDEHo+/krKjA+ov
 VlPCMgVqRHvH9F/8EMsjLWyp4DtDZzEqVJ3qeys0/SE0qFp27gekom4b+9t5nZMe0e0nhA7rqG3
 L0TpidgplfAy3QgknOlpuL4V8hnuw/uyCoRM8uu2sPp6MA9CK0Qsf2u5EMR+dkaAFFEsz75fLJe
 Ddoi68W/3UWqRhIwsNZNoxPl0kHXK5/IKttPxwftRNDvhFlurunZKP2N3cH+LgZKJoPGoxn8GEI
 NGq8hMoJh/8B1Cbh0/Fq4BOM0VzfTsHAAJALgnvifAWJrW4CtQLcCMAXnWZUwikZIE/IemiZpaR
 BPnYUADpEXzgg69m8TF0ZOOzOdXK8ts1cJJwK6gYsakJvEZmMpvOMaM4Oz/k/sz+d4joAFaIpUd
 1XZBNu+XwvQlkf6Thlg==
X-Proofpoint-GUID: 9-UK5IyBZQO4oXFzQTvWqJexBEu72sce
X-Proofpoint-ORIG-GUID: 9-UK5IyBZQO4oXFzQTvWqJexBEu72sce
X-Authority-Analysis: v=2.4 cv=NK1AaE6g c=1 sm=1 tr=0 ts=6af46d6e cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=mtvGxJwcMCaXl6bCzmMA:9 a=CjuIK1q_8ugA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MyBTYWx0ZWRfX/ADlLUrCPqgX
 OpsPQ10Et4tI0CNGgmRjdNvVVm1kw1BTm2TvGsBbjeMv2AVGoCUH1NY1J2IEpYlDg2gWJ2/OVzP
 TqmEqe5piqd/U/8hhA8PT7WG2/KtyUA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110053

On Mon, Nov 09, 2026 at 04:24:37PM +0800, Shawn Guo wrote:
> + Srini
> 
> On Thu, Nov 05, 2026 at 05:42:03PM +0000, Mark Brown wrote:
> > > The sck clock is taken once at i2c probe and held for the lifetime of
> > > the device. On Qualcomm boards it is an LPASS clock exported by the
> > > q6prm clock controller, which lives on the DSP and is unregistered and
> > > registered anew whenever the ADSP is stopped and restarted. fw_devlink
> > > cannot tie pcm1681 to that provider, since the provider node only gets
> > > a device once the DSP is up, so it falls back to the remoteproc device,
> > > which stays bound across a DSP restart. pcm1681 is therefore never
> > > unbound and keeps a clk handle to the dead provider.
> > 
> > This seems like something that ought to be dealt with on the Qualcomm
> > or fw_devlink side TBH, registering the clocks and returning -EBUSY on
> > attempts to use them would be less disruptive to other components in the
> > system.  I don't understand what fw_devlink would be doing with
> > reparenting clocks...
> 
> Thanks for the review, Mark! I agree this belongs in the Qualcomm clock
> provider, not in pcm1681, so I'll drop this patch.
> 
> Sorry, my wording about fw_devlink was misleading. No clock gets
> reparented. My point was only that pcm1681 is never unbound when the DSP
> restarts. The q6prm clock-controller device only exists while the DSP is
> up. So fw_devlink links pcm1681 to the remoteproc device instead, which
> stays bound across the restart.
> 
> Today the clocks can't stay registered across a DSP restart. When the DSP
> stops, the GPR bus unregisters the q6prm device and its clock-controller
> child, and that unregisters the clocks. The clk core then switches them
> to clk_nodrv_ops, which return -ENXIO. That's where the "Failed to enable
> sck: -6" in my report comes from. The consumer's struct clk handle can't
> be reconnected after that.
> 
> So I'd like to change q6prm along the lines you suggested:
> 
> - Keep the clocks registered, on a device that is not removed when
>   the DSP stops.
> - While the DSP is down, make prepare/enable return -EBUSY.
> - When the DSP comes back, re-send the requests for clocks that are still
>   enabled, at their last set rate. This also fixes the rate being reset
>   to the 19.2 MHz default.
> 
> The part I'm unsure about is which device should own the clocks:
> 
> a) A platform device that q6prm creates on its first probe and keeps
>    until the module is unloaded. This needs no DT change.
> 
> b) The ADSP remoteproc device, which already survives restarts.
>    It's cleaner, but probably needs a binding change, since the clock
>    controller node is a child of qcom,q6prm today.
> 
> Srini, Mark, do you prefer a), b), or something else?

I'm happy to report that we can go for b) without DT binding changes.

Shawn
