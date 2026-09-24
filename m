Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1BD2F7EF6
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 03:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790219894; cv=none; b=Dqcb5Tz3a3QLwoGtZRReerRfaaNHvZo9KZ8rVq3l3JHTmYokymyzdL5TaYGAjMwKJ6CHiG1KzdHeeGogs74b4ARt9FZiXy2F5PX8FCo1Hu4yHoh15a+Uab7R5HSlBPKKAO/gVZg7xHOAiGYnN2Lq+t2fFnTn7vDVvoK4hXNXikY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790219894; c=relaxed/simple;
	bh=dBCzhl1X4q92qBGwn2pQvyx5Z8dLZ3uL6KEhFDZ9iIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fx84ZGrkKSg+qt6sSoBPdM5L/OQa/YNR0ddabNLiNncAYXXg2BZ21JFe7HdD+MPIYXrtZEibB8Dta5HkF4LPxvGNOMpuZ14SiDESnco7kL7+4qU6CxQ+fNBK7GBbdfUJE/vCusl+8ZilIfvPd8l+loZnL6GekkSmiteqTo/w5ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZsupzY4e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K8O+tE8e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZsupzY4e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K8O+tE8e"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O36kp9445921
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 03:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tHodOW1NuMAhQ2hihU1WLFCt
	BxwYsw6uUKaSj/sBdIk=; b=ZsupzY4eFlIZg9YdMGv+d3x62kLNgU1Vw2JenSW+
	DNJ9VdU5f0xHu5mAZUdjt9nN+UBEoy8bUXBfy1/UPWnnpfkTRqSIiwRtwa0oMSAa
	6CGCsZIP8c+07kxdsh+YRagDbJ2DJKWPn1p3EB+g4qb7WNOrrQ+8KXQfvHXYAeNi
	Lv9PMyBmcomGIdFqmm5yqvND/dLjuf9xhhr3Sc4VmlDnFHxCKbpJz0Uso0tHnQl6
	Shq7VuW5am/BX9SdNjYZQHomsC2JyYm8jbZrN6gZq8ORD5r3+aqZ7Mrn+IlVcQ+S
	8kckK8BTydB6wPk9r4XPTqDfeYncTkqIeVv1M/sA125e2Q==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvr908pnm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 03:18:12 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1384427c3efso2730343c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 20:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790219892; x=1790824692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tHodOW1NuMAhQ2hihU1WLFCtBxwYsw6uUKaSj/sBdIk=;
        b=K8O+tE8eJLcfPq41KlUYBOkG7SJdoDmBK5IvkROXqpVtB5dEeYY4mZyEVOPb/Ahtya
         YbR1eZNeRfDMZgwI0OuDiXwlXJzWhiOhBeJ/2bO0CTnE5z3a5wf6+kDSV6srKWOImBaK
         vp0MYkTQQLBizdSzaVcYx3itkf8dYHYHGfyp2hi8gccHq3acNXyqf5/kKUv8+Rt1zWul
         0aE/Tu7QxUcjl8e+WrtuKfkPZ6AxnJD7BbHUpr68npFVbZcFrUTno7xw5Ta2JhWugGad
         i2BgOm/WaUoV9qxQ3xEKYfcfwTMCYruxDCs3mxlXlRRM3rYl1RDeq9EJw/UD64jQG51e
         mq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790219892; x=1790824692;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tHodOW1NuMAhQ2hihU1WLFCtBxwYsw6uUKaSj/sBdIk=;
        b=H4fLfjr+IZChlP9tRgr3kR2VoleJY+KdnGSbX86Uj+Jl3wwbNkcJnmGS2dEolOPTlv
         QjhP+8GYRh5fSat1LKg+vbMgSCLCjFp5EpkVxK0bxfOS68Fr1Ydkro5KNq878ff07Afg
         R1Zqw7I5M/Jn5voLv8DzT9BrivCXqD9jrChDirvk1t9OlpkM3N2vbHheC7h/p/HRJsHu
         JNj5sKRqZUpfnbT1l9otjr8iozMqYJaMgZwjAQeOqY255xO5WrhFaJ53Pr9g42EuEqf/
         QzdO1syXQikxD1WB/kGB+dPtiHyqFxtjP9HqkmL9gi+F2yQOOE+q/dIlkdZSfm4OqjUT
         QLug==
X-Forwarded-Encrypted: i=1; AKwUvBzY6NOrZqb0yF361baIJPzy/Zx3R/AWjqtCx4ENupObflX6+DoK7vVOmKj0/7KelmFtIAULLugmqZxsCerK@vger.kernel.org
X-Gm-Message-State: AFuF++kKOWK5+NQsstfliQWkD+zdVJ67GctDEokmF38jmXPJK6NUpW7Z
	Tce2L18Ge4IqlXcZLiZxbvA0zaSBky30ykDlwoUYXgSafc6pR5TY+jkGG9h8BDXNX+bS1ReB2Ir
	bd0OFE2t67Gp3xQA3Ba+77JdSQe1zh1Hs4igYUL6f+Jsy2mNh9FlIwsQaSS6cqyu+4bPv2JszAy
	pAtGE=
X-Gm-Gg: AYBFou3iPPHAo/LD/1xshotOG+stqfN+SeF7Dy6Zy719fQQXxVVbI569HHnyrsIg1Pk
	0nlpKRTwEJmvu5HBlGwVCIwMmge9rvACq1+1+j/yJ3YE9AcLGIXT3gGhmca+HrKUDzGCPlKmBCE
	sEfX3UOcqpgyS71dLHtpt4/QzzbjwAkbuRScWuXOoPahPIfPxnHtQEnq6DSkllrmVlfwaYmerHL
	7h6mxDMOStCgliSSJtqqIpFcbEAulaO/lvGnRpQPU/DX/7QT8eDEFSZeu7sef1PJH6Qsecy3cJU
	Hai4V04FiR2CZcOgZcI7Fe147hwTM+J32Vm/FzI93iTgT4H0q8vyz27OcllfUBsI1vIysqBwMVt
	XYfUKGGzjuNyvOflvGXsmd4RYsTPFNiJRndajNmGNpQ==
X-Received: by 2002:a05:7022:c4d:b0:143:8829:5fb9 with SMTP id a92af1059eb24-14503f3c3fdmr785071c88.16.1790219891788;
        Wed, 23 Sep 2026 20:18:11 -0700 (PDT)
X-Received: by 2002:a05:7022:c4d:b0:143:8829:5fb9 with SMTP id a92af1059eb24-14503f3c3fdmr785041c88.16.1790219891200;
        Wed, 23 Sep 2026 20:18:11 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96258351sm9861844eec.12.2026.09.23.20.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 20:18:10 -0700 (PDT)
Date: Thu, 24 Sep 2026 11:18:05 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v2] pinctrl: qcom: spmi-gpio: make direction changes
 exclusive
Message-ID: <arSWbexBeEYgBY_x@QCOM-aGQu4IUr3Y>
References: <20260922065908.477523-1-shengchao.guo@oss.qualcomm.com>
 <CAMRc=MfrBwqdMnT5TynJ0NVBf3OWKF7BSGr1cy4YjyCVrZdX1A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfrBwqdMnT5TynJ0NVBf3OWKF7BSGr1cy4YjyCVrZdX1A@mail.gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAxNCBTYWx0ZWRfX73qUmqQcIj/X
 6mOUhDh3lVtNHxYIMBeHBlCZf7qjGEqIZHvhimw8LYYFwuKBXkOcLTQgC9MZaHK47r0dZW+FtAq
 nXbkSkN3LI/N6OMw8BmlMGJ5t2bUda8=
X-Proofpoint-GUID: RpCh8rWi-1kAFDB5c6s9Uo_plzd0f9_N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAxNCBTYWx0ZWRfX3v5raqTkboDL
 dfh7wfg4Cy6zxu7SWP0tXXwS7+UcehFEGDBva68jr6MKwKV19Zy1/B1/PgTSCxWvhTDkAMUQWvt
 7+WaIsL/b6bFqOW/sDBMGdMvQOXPeKCcljVETWZ+Nl4MgIaP+SRePsZN6a6nrwFsNVKmNPYjuyg
 cvE/3AI0XLektENo1GbMFuA4SdI+hEl/iWb/Bd3sCDencLBV+9477YLTuJDP6oMuVMxu56dl6GS
 YmJiZHfgaJ72QE6StUx+rYzBhWVl9trQvgyjVa0ulX6VTv+3fvIGonCbjCyRsp75u0Jiy3swxjC
 d9LvdCLbZ+vtl8FbBuy7LOim8RD9JU2TTFm05GK9JiARhn/ALIbCOGk/LcGi0c0eqT801rwwkgz
 Pl8hGOXy8MNtz8scuSMfG9S7z1U4eDxXHHOAduIcrH9/9NZBA/jR/nP8E6ihcwjRQJGY8NEcXFg
 0jgUrzrKT8l2D5GuEsA==
X-Proofpoint-ORIG-GUID: RpCh8rWi-1kAFDB5c6s9Uo_plzd0f9_N
X-Authority-Analysis: v=2.4 cv=fMusTpae c=1 sm=1 tr=0 ts=6ab49674 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=uQBmt4c_HcPZFEdrNxwA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240014

On Wed, Sep 23, 2026 at 02:07:56AM -0700, Bartosz Golaszewski wrote:
> On Tue, 22 Sep 2026 08:59:08 +0200, Shawn Guo
> <shengchao.guo@oss.qualcomm.com> said:
> > pmic_gpio_populate() seeds pad->input_enabled and pad->output_enabled from
> > the hardware MODE_CTL register, so a pad left in DIGITAL_INPUT or
> > DIGITAL_INPUT_OUTPUT mode by the bootloader starts out with the input
> > buffer enabled.  Neither direction callback clears the opposite buffer:
> > .direction_output() only packs PIN_CONFIG_LEVEL, which sets
> > output_enabled, and .direction_input() only packs PIN_CONFIG_INPUT_ENABLE,
> > which sets input_enabled.  Requesting either direction on such a pad
> > therefore programs MODE_DIGITAL_INPUT_OUTPUT rather than the requested
> > direction.
> >
> > That silently breaks both directions.  After gpiod_direction_input() the
> > pad keeps driving the line, since the output buffer is never disabled.
> > And after gpiod_direction_output() pmic_gpio_get_direction() still reports
> > GPIO_LINE_DIRECTION_IN, because it cannot tell plain input from
> > input+output, which makes gpiolib consider the line an input while the
> > driver is driving it.  On a board where several regulator-fixed nodes
> > share one PMIC GPIO the shared GPIO proxy reads that direction back and
> > rejects every consumer after the first:
> >
> >   reg-fixed-voltage regulator-wcn-core-vm-1p35: setup of GPIO (default) failed: -1
> >   reg-fixed-voltage regulator-wcn-core-vm-1p35: error -EPERM: can't get GPIO
> >
> > Pack the opposite buffer's PIN_CONFIG_*_ENABLE along with the requested
> > direction so that the resulting MODE_CTL is DIGITAL_INPUT or
> > DIGITAL_OUTPUT, never both.  pmic_gpio_config_set() programs the registers
> > once after walking all configs, so this stays a single register write.
> >
> > Pads that are genuinely bidirectional can still be described that way
> > through pinconf, which is the interface that has always been able to
> > express it; the gpiolib direction callbacks now mean what gpiolib says
> > they mean.
> >
> > Fixes: 263447532463 ("pinctrl: qcom: spmi-gpio: implement .get_direction()")
> > Assisted-by: LLM
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> > Changes for v2:
> > - Drop GPIO shared-proxy patch
> > - Update Fixes tag (Thanks Neil!)
> > - Link to v1: https://lore.kernel.org/all/20260915014447.282121-1-shengchao.guo@oss.qualcomm.com/
> >
> >  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 16 ++++++++++------
> >  1 file changed, 10 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> > index f6dc43e27b38..eb4431591331 100644
> > --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> > +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> > @@ -741,22 +741,26 @@ static int pmic_gpio_get_direction(struct gpio_chip *chip, unsigned pin)
> >  static int pmic_gpio_direction_input(struct gpio_chip *chip, unsigned pin)
> >  {
> >  	struct pmic_gpio_state *state = gpiochip_get_data(chip);
> > -	unsigned long config;
> > +	unsigned long configs[2];
> >
> > -	config = pinconf_to_config_packed(PIN_CONFIG_INPUT_ENABLE, 1);
> > +	configs[0] = pinconf_to_config_packed(PIN_CONFIG_OUTPUT_ENABLE, 0);
> > +	configs[1] = pinconf_to_config_packed(PIN_CONFIG_INPUT_ENABLE, 1);
> >
> > -	return pmic_gpio_config_set(state->ctrl, pin, &config, 1);
> > +	return pmic_gpio_config_set(state->ctrl, pin, configs,
> > +				    ARRAY_SIZE(configs));
> >  }
> >
> >  static int pmic_gpio_direction_output(struct gpio_chip *chip,
> >  				      unsigned pin, int val)
> >  {
> >  	struct pmic_gpio_state *state = gpiochip_get_data(chip);
> > -	unsigned long config;
> > +	unsigned long configs[2];
> >
> > -	config = pinconf_to_config_packed(PIN_CONFIG_LEVEL, val);
> > +	configs[0] = pinconf_to_config_packed(PIN_CONFIG_INPUT_ENABLE, 0);
> 
> Sashiko's comment basically says that for open-drain GPIOs, if we set direction
> to output via GPIOLIB and disable the input buffer, then later call
> gpiod_get_value() on that GPIO, we'll never read what's really on the wire. Can
> we not disable the input buffer for open-drain pins?

Yes, that is the better fix -- thanks, I will do that in v3.

Shawn
