Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794212687;
	b=0y08TlGFC7AOqI/ECVXh/mu5qcd8JdOWpLinbq3MQdnjmn3JiHd+QSZnTTjqqgwcDjw0
	 Zj6LYgg9pJKFCkW3BGJo8uRJgf2aabmb8P8+7VST9KYkOglj8o+yli0hAf8TYiMmxBcL/
	 A6YmcXaOsfgSeae9BEYx1+FLjdLAt3ly3n30WJLzemZ+CkfTegGqLHZn309q1dIOFscIv
	 5oQChl9vsPN/KgiaNvnAKsT0A+7Zn+LfwtHiekysuPdEAI2AL6aRgtU1QXhf8X7Cb4oe/
	 KgYxOHuiJOBRFtC/oLA1tttGP6+GsUiC1Zfq9Y/qcaK7K9CXfDB1K6olus6QyJYTg+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794212687;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LLXggI5QK5tYcxastPpVEd5Wzgnwlo56lcs2+CggC+g=;
	b=TFUiF3IRe5kBihH72LZOI+U4KQQ9TqirHt27eD7N+gUkS02GjFW+md74rUNffR2/Umu5
	 fGpNwcfIpdXy7tVIB9bUNblA6oJ8GGFDos6wYTS4pwkblhNCCI/RY1u5PJ34wkK5yaxl5
	 jZsWkFGBEQzOcXH6GAz71sP3rHbN0DX/aY6fPwajBIhvqTaSRmDHOGJAVUde5eTK73Nto
	 KLp6PaaCfk9QBuIvE2ig+NSWH/kIU3CxLYhDWodCy/TSk/1Xwv1oSblH4xSxMxCDrzYRf
	 hlYQzXB9JX1w7jGO755+6ng2o++YU8ICjc8KdORzS9V88gXTbLOq2uICVO450zvmpmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yl0TLYiE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WUB53U6r;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1816606A31C
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 08:24:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1816606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yl0TLYiE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WUB53U6r
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A969u5q480849
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 08:24:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LLXggI5QK5tYcxastPpVEd5W
	zgnwlo56lcs2+CggC+g=; b=Yl0TLYiExRgofqtRFITadDV69rrRizSYCR4/HTx7
	nH+QlRhzl2pXe2fZpr6VF3GoRdhjNqCFWmC93zIYtLeweU6ZKTmql4kGB+i09Kpd
	LSuV84EpVsJHefMq+lg0QlRh2btsmTJwkRbHDGG7FoYS9Ld8LgVyZncoo8l7jExo
	lIXXlQhL8rlJl+0Jo7GBw3gVDhTzPeX1VqI9gdRg5hPciTr0qXyf/MSDeA005mrc
	ay6WOGYMkbuvdHc7sqDpvpnuvFHc1dgw7meqh1sYb6j1KNBzpZ00rswKnJMlFGNC
	JiiiA9u7UB0jErNcj7fWBC2lRBvrdFZAHvfrT5skjhy7Sg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hstxsdhpq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 08:24:45 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36ecd5db581so745501eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 00:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794212685; x=1794817485; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LLXggI5QK5tYcxastPpVEd5Wzgnwlo56lcs2+CggC+g=;
        b=WUB53U6riY2fVUTTdnQtq62gj64PBZITwRR1OGoPvpranAJ5iovdyQ+SnijwMqL/Vg
         mUn2zv+pqI1KW8j15+7gZRL8tjDx63UEpFMbRQFV+0eSLTQKJwCe0NfEZ28ntTFCfPg3
         9tPZZ8SAiaryxS6bC6hfUyP2DT1Ikr/Etos9qOC/Ueh3dj9RjIRERAgIuzeO0wKLv2jA
         TA6zHOgXvFfdyKYkmpEV3tpLzB4jVEVsGGwiGFmyUaYVf/wMjTCzyrDFGJc1OgygPFAe
         EMId6+bTFZnr5BwKZTu3CHDl8dh7fL5LhnBaNY7JUzN9pCX2c1P1reBlinWnEWH1OU7N
         JtzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794212685; x=1794817485;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LLXggI5QK5tYcxastPpVEd5Wzgnwlo56lcs2+CggC+g=;
        b=hR8R82qKfwACAN3Mccw1oHaGNTcHdoI+O4miRKqi40YAO6cbQoAo/OXAKIjhjaD7CM
         A3b4q8MCFIARGEnqeXODTowKADAwB5xhqoRQj+Ehz+1CYKoCGstmqtsznMm3tan9bAmL
         LA0v9yhsj+CKd7KCh3JjCYkBH8MSeR4Ojsc8IrvKhOpLnNZJ5KmpzLKvGtqqxgVgfs1o
         9GhFpx0QsUQP5SiUAcqcoQiR/biv457FOHlyUJ9PY6Sf2bfCIC/HfbKqNpbCFJsvE7MG
         aYjHTZOityPQw6dlx7cF7P/Wzd9BuHSe90Bciu7SLNCcOApgYxyevK2tFdol04rR+4Xd
         I7/w==
X-Forwarded-Encrypted: i=1; AL+hErFC4xekMXfbWV9lsFisFHOv53TzFjXyUcdkrejKYYWJhH1zCbNmC6KQla356UN9l9B6pYEikY9s7sHDLsJn@vger.kernel.org
X-Gm-Message-State: APuU4Z+Iw4f+tgOkzEqWESH0S4FBZYi1MOy7g5Ig0iaYzh1Mq/E/46sr
	fg+hJmP1fnS+6fLyK/ubUhP0mQEVSrRNmJl/P4niugnlXDCZ0DmKYYq+Igc0TMu+fVhbhb+ZpGB
	h4IH/K1Xdhul62DrPbnphbd+yv/L+mQ8KAmRD3ZvJ4mCgLenMPvd3ZKM6LOk4FdJVkbMl
X-Gm-Gg: AYBFou0fwzpf1VFC4jYne2vzCjrXOw0Fyaa8vbSM6aKvpdPfAbzyIx6lESx5Ky8LQ5k
	A4lC3wc+IDfaUN1wmmNohy2XCl/q1WmugY7OeKiWrN3xWlw3f0jJz6T3D2L8bKxjY0VpHKKxAGt
	KVCdighcxStcnx7w0U1QveOmU9O1PSwugIVDgWDC8t66UUStCpxJ6dJe3MFBrWU0A8TAi9pUoMH
	25tFhi6zAt0fmPuSDDu5OyqKreZhit5rnJ02q2tFHMSrX39+39ohQg5XLp8ky10Jk3Drfqr9g3d
	IdmVtE9LMhp4GgQNXND/EBDd7jJH8Mkc/TP70jFN1/NMF6qpHadyriDsnSns3dyE+dzOXepZbI6
	8nsLDDpFath3jG/t1ZfuKI+APLE306XAfcPpTCVmh6+8FNeMNCQBHzi0bzYX09BEDqaYC9gKOPN
	cjDpVIuY1Z1YkhUQ==
X-Received: by 2002:a05:701b:4302:b0:17e:ee5f:6715 with SMTP id a92af1059eb24-1b39fef0409mr5658256c88.27.1794212684986;
        Mon, 09 Nov 2026 00:24:44 -0800 (PST)
X-Received: by 2002:a05:701b:4302:b0:17e:ee5f:6715 with SMTP id a92af1059eb24-1b39fef0409mr5658223c88.27.1794212684403;
        Mon, 09 Nov 2026 00:24:44 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771fa200sm10803939c88.22.2026.11.09.00.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:24:43 -0800 (PST)
Date: Mon, 9 Nov 2026 16:24:37 +0800
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
Message-ID: <avGDRUwyEBk2qQaM@QCOM-aGQu4IUr3Y>
References: <20261021031228.2074402-1-shengchao.guo@oss.qualcomm.com>
 <179390052368.3073895.16132231139898724200.b4-review@b4>
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
In-Reply-To: <179390052368.3073895.16132231139898724200.b4-review@b4>
X-Proofpoint-ORIG-GUID: bgla_5pzYpZbJI47CXJffGB0ffczGgOr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzMyBTYWx0ZWRfX0dY196/oT0GI
 OdjsxMrNZivLEnUA3WLzfTacQ4M2Wp2E22iGbLg0EOIF6bkfDz6fQklWb/orNX7pioy1Z8cyso/
 q7eW8oOEQoRJxx5yjJ7TgzP801FJHv8=
X-Authority-Analysis: v=2.4 cv=dZMVTnXe c=1 sm=1 tr=0 ts=6af1834e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=Hnavqaomymq-nAvSwTcA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzMyBTYWx0ZWRfX2WCvI8kAqfze
 N+r2C9hbjjPTG3hOYoZ6P8IE0ZkSHAVxg0OOuwcJY1mpbVF1ZrNWyDfog4xx+1JJchBeXXMYvyC
 FFuVPJO3p5tIFM8g+a9KasfUlLI806NRMrOaqWnvQRPaZDhilFlshZA0lbmm6/YSADreSDSK3l9
 INO4zZCllMfTM7PkQSwUBTsnaJqel1HQEfUG+bbLpgNBGIyIF9DA2noeqMAK5EwQFNewo3+nf+E
 HBXjJa2lL80oOzFOsMRDwnauuiiPsaWn5yAfACW947aC6DMRNx5hf+qqZTtWu1fkXgKGl55Ax27
 pUx+EnWALA9yZB2E3R8eyom66jYzxLlxfkXuC7Igz9OngOa13TluuJLmTBHgLGTWZIxaW+DqSt6
 V9wy/c+rOrF2LAMu8XSxOONNPENPkNWAbcivcPTZ0qtL7I3ZgLk3uECL00CRk4ZPp6qc8gKbva8
 vBKn9IXl9QGRlcQ4C5g==
X-Proofpoint-GUID: bgla_5pzYpZbJI47CXJffGB0ffczGgOr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090033

+ Srini

On Thu, Nov 05, 2026 at 05:42:03PM +0000, Mark Brown wrote:
> > The sck clock is taken once at i2c probe and held for the lifetime of
> > the device. On Qualcomm boards it is an LPASS clock exported by the
> > q6prm clock controller, which lives on the DSP and is unregistered and
> > registered anew whenever the ADSP is stopped and restarted. fw_devlink
> > cannot tie pcm1681 to that provider, since the provider node only gets
> > a device once the DSP is up, so it falls back to the remoteproc device,
> > which stays bound across a DSP restart. pcm1681 is therefore never
> > unbound and keeps a clk handle to the dead provider.
> 
> This seems like something that ought to be dealt with on the Qualcomm
> or fw_devlink side TBH, registering the clocks and returning -EBUSY on
> attempts to use them would be less disruptive to other components in the
> system.  I don't understand what fw_devlink would be doing with
> reparenting clocks...

Thanks for the review, Mark! I agree this belongs in the Qualcomm clock
provider, not in pcm1681, so I'll drop this patch.

Sorry, my wording about fw_devlink was misleading. No clock gets
reparented. My point was only that pcm1681 is never unbound when the DSP
restarts. The q6prm clock-controller device only exists while the DSP is
up. So fw_devlink links pcm1681 to the remoteproc device instead, which
stays bound across the restart.

Today the clocks can't stay registered across a DSP restart. When the DSP
stops, the GPR bus unregisters the q6prm device and its clock-controller
child, and that unregisters the clocks. The clk core then switches them
to clk_nodrv_ops, which return -ENXIO. That's where the "Failed to enable
sck: -6" in my report comes from. The consumer's struct clk handle can't
be reconnected after that.

So I'd like to change q6prm along the lines you suggested:

- Keep the clocks registered, on a device that is not removed when
  the DSP stops.
- While the DSP is down, make prepare/enable return -EBUSY.
- When the DSP comes back, re-send the requests for clocks that are still
  enabled, at their last set rate. This also fixes the rate being reset
  to the 19.2 MHz default.

The part I'm unsure about is which device should own the clocks:

a) A platform device that q6prm creates on its first probe and keeps
   until the module is unloaded. This needs no DT change.

b) The ADSP remoteproc device, which already survives restarts.
   It's cleaner, but probably needs a binding change, since the clock
   controller node is a child of qcom,q6prm today.

Srini, Mark, do you prefer a), b), or something else?

Shawn

> 
> > +static int pcm1681_component_probe(struct snd_soc_component *component)
> > +{
> > +	struct pcm1681_private *priv = snd_soc_component_get_drvdata(component);
> > +	struct device *dev = component->dev;
> > +	int ret;
> > +
> > +	priv->sck = clk_get_optional(dev, "sck");
> > +	if (IS_ERR(priv->sck)) {
> > +		ret = PTR_ERR(priv->sck);
> > +		priv->sck = NULL;
> > +		return dev_err_probe(dev, ret, "Failed to get sck\n");
> > +	}
> 
> This is the oppositie of the standard advice for drivers, and we don't
> deal well with probe deferral from component probes - in particular,
> nothing will trigger a rebind of the card if we don't probe a new
> component and that's not going to happen if the CODEC already bound and
> isn't waiting for the clock.
> 
> Also dev_err_probe() will only DTRT from device model probe.
> 
> -- 
> Mark Brown <broonie@kernel.org>
